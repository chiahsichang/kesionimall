<%@ Page Language="C#" EnableEventValidation="false"  MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.Admin.Shop.Admin_ShopCoupon" Title="优惠券管理" Codebehind="KS.ShopCoupon.aspx.cs" %>
<%@ Import Namespace="Kesion.BLL" %>
<%@ Import Namespace="Kesion.Publics" %>
<%@ Import Namespace="Kesion.APPCode" %>
<%@ Import Namespace="Kesion.Cache" %>
<asp:Content ID="Content1" ContentPlaceHolderID="KSContent" Runat="Server">
     <asp:Panel ID="CouponList" runat="server" Width="100%">
      <div id="manage_top" class="menu_top_fixed">
        <ul>
           <li id='p1'><asp:LinkButton ID="addCoupon" runat="server" OnClick="addCoupon_Click"><b></b>添加优惠券</asp:LinkButton></li>
           <li id='p4'><asp:LinkButton ID="editCoupon" runat="server" OnClick="editCoupon_Click"><b></b>编辑优惠券</asp:LinkButton></li>
           <li id='p3'><asp:LinkButton ID="delCouponBtn" runat="server" OnClick="delCoupon_Click"><b></b>删除优惠券</asp:LinkButton></li>
        </ul>
      </div>   
      <div class="menu_top_fixed_height"></div>
       <KS:KSGV ID="list" cssclass="CTable" runat="server" AutoGenerateColumns="False" Width="99%" EmptyDataText="没有添加任何优惠券!" GridLines="None" OnRowDataBound="list_RowDataBound" OnRowCommand="list_RowCommand" OnRowCreated="list_RowCreated" AllowPaging="True" >
          <Columns>
              <asp:TemplateField HeaderText="选择">
                <itemstyle horizontalalign="Center" width="50px" />
                <itemtemplate>
                    <input type="checkbox"  name="ids" id="ids" value='<%#Eval("Couponid") %>' />
                </itemtemplate>
              </asp:TemplateField>

               <asp:TemplateField HeaderText="状态">
              <itemstyle width="30px" horizontalalign="Center"/>
              <itemtemplate>
                   <a href="?action=status&Couponid=<%#Eval("Couponid")%>" <%# Convert.ToString(Eval("status"))=="0"?"class='no' title='停用'":"class='ok' title='正常'" %>></a>
              </itemtemplate>
            </asp:TemplateField>

             <asp:TemplateField HeaderText="优惠券名称">
             <itemtemplate>
             <%# Eval("Couponname") %> 
             </itemtemplate>
             </asp:TemplateField> 
             <asp:TemplateField HeaderText="发放方式">
             <itemstyle horizontalalign="Center" width="70px" />
             <itemtemplate>
             <%# Convert.ToString(Eval("Coupontype")) == "1" ? "<span style='color:blue'>按用户发放</span>" : "<span style='color:green'>线下发放</span>"%>  
             </itemtemplate>
             </asp:TemplateField>
             
             <asp:TemplateField HeaderText="有效期">
             <itemstyle horizontalalign="Center" width="230px" />
             <itemtemplate>
             <span class="tips">
             <%# GetExpireDate(Convert.ToString(Eval("BeginDate")),Convert.ToString(Eval("EndDate")))%>
             </span>
             </itemtemplate>
             </asp:TemplateField>

              <asp:TemplateField HeaderText="面值">
                <itemstyle horizontalalign="Center" width="40px" />
                <itemtemplate>
               <%=MyCache.GetCurrencySymbol%><%# Public.ReturnShopPrice(Utils.StrToDecimal(Eval("FaceValue")))%>
                </itemtemplate>
              </asp:TemplateField> 

             <asp:TemplateField HeaderText="发放数量">
             <itemstyle horizontalalign="Center" />
             <itemtemplate>
              <span style="color:Red"><%# Eval("TotalNum") %></span> 张
              <a href='KS.ShopCouponItem.aspx?couponId=<%# Eval("CouponID") %>'>(查看)</a>
             </itemtemplate>
             </asp:TemplateField>
             
            
             
             <asp:TemplateField HeaderText="编辑">
              <itemstyle width="30px" horizontalalign="Center"/>
              <itemtemplate>
             <asp:LinkButton ID="LinkButton1" ToolTip="编辑" CssClass="edit" runat="server" commandargument=<%#Eval("Couponid") %> commandname="modify"></asp:LinkButton>
              </itemtemplate>
            </asp:TemplateField>
             <asp:TemplateField HeaderText="删除">
              <itemstyle width="30px" horizontalalign="Center"/>
              <itemtemplate>
             <asp:LinkButton runat="server" id="delete" ToolTip="删除" CssClass="delete" commandargument=<%#Eval("Couponid") %> commandname="del"></asp:LinkButton>
              </itemtemplate>
            </asp:TemplateField>

            <asp:TemplateField HeaderText="↓发放">
                <itemstyle width="60px" horizontalalign="Center" />
             <itemtemplate>
             <asp:LinkButton ID="pubBtn" runat="server" CommandArgument=<%#Eval("Couponid") %>  CommandName="pub">发放</asp:LinkButton>
               </itemtemplate>
            </asp:TemplateField>
          </Columns>
            <HeaderStyle CssClass="CTitle" />
            <EmptyDataRowStyle CssClass="emptycss" />
      </KS:KSGV>
      <asp:Panel ID="Panel1" runat="server" Height="30px" Width="741px">
              <div style="margin-top:5px;overflow:hidden;"></div>
            &nbsp;&nbsp;<input type="checkbox" name="chkall" id="chkall" onclick="CheckAll(this.form);"/><label for="chkall">全部选中</label>
            <input type="button" value="删除选中的优惠券" onmouseover="this.className='button_on';" onmouseout="this.className='button';" class="button" onclick="if (GetIDS('del')){this.form.action='?action=del';this.form.submit()}" id="Button1" />
    
    </asp:Panel>  
    
   <KS:Page ID="Page1" runat="server" />
        
    </asp:Panel>
    
    <asp:Panel ID="CouponManage" runat="server" Width="100%" Visible="false">
    
        <KS:TopNav ID="TopNav1" runat="server" />
        <script type="text/javascript">
                 function addOption(str){
                  if (str!=''){
                   var arr=str.split(',');
                   var ostr='';
                   for(var i=0;i<arr.length;i++)
                   {
                     var oarr=arr[i].split('|');
                     if (jQuery("#<%=this.LsbLimitIds.ClientID%> option").length==0){
                      jQuery("#<%=this.LsbLimitIds.ClientID %>").append("<option value='"+oarr[0]+"'>"+oarr[1]+"</option>");
                     }
                     var has=false;
                     jQuery("#<%=this.LsbLimitIds.ClientID%> option").each(function(){
                       if (jQuery(this).val()==oarr[0]){
                        has=true;
                       }
                     });
                     if (has==false){
                      ostr+="<option value='"+oarr[0]+"'>"+oarr[1]+"</option>";
                     }
                     
                   }
                  jQuery("#<%=this.LsbLimitIds.ClientID %>").append(ostr);
                  }
                  jQuery("#<%=this.LsbLimitIds.ClientID%> option").attr("selected",true);
                   parent.box.close();
                 }
                 function removeOption(){
                  var dest = document.getElementById('<%=this.LsbLimitIds.ClientID%>');
			      for (var i = dest.options.length - 1; i >= 0 ; i--){
					     if (dest.options[i].selected)
					        {
					          dest.options[i] = null;
					      }
					 }
		           jQuery("#<%=this.LsbLimitIds.ClientID%>>option").attr("selected",true);
                 }
                 function removeAllOption(){
                   jQuery("#<%=this.LsbLimitIds.ClientID%>").empty();
                 }
                 function show(){
                  var checkrad=jQuery("#<%=RBLLimitType.ClientID %> :radio[checked]").val();
                  if (checkrad==1){
                  jQuery("#showClass").show();
                  jQuery("#showPro").hide();
                  }else if (checkrad==2){
                  jQuery("#showClass").hide();
                  jQuery("#showPro").show();
                  }else{
                  jQuery("#showClass").hide();
                  jQuery("#showPro").hide();
                  }
                 }
                 function showSelect(s){
                  if (s=='') return;
                  var idArr=s.split(',');
                  for(var i=0;i<idArr.length;i++){
                   jQuery("#ClassIDs option[value="+idArr[i]+"]").attr("selected",true);
                  }
                 }
                 </script>
                 
           
        
        <table width="99%"  border="0" cellpadding="1" cellspacing="1" class="CTable"> 
          <tr>
            <td class="lefttd" height="30" align="right" style="width: 198px"><strong>优惠券名称：</strong></td>
            <td class="righttd">
                &nbsp;<asp:TextBox  CssClass="textbox" ID="TxtCouponName" runat="server"></asp:TextBox> 如: 5<%=MyCache.GetCurrencyUnit%>代金券等
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TxtCouponName"
                    ErrorMessage="请输入优惠券名称!"></asp:RequiredFieldValidator>
            </td>
          </tr>
            <tr>
                <td align="right" class="lefttd" height="30" style="width: 198px">
                 <strong>使用起始日期：</strong>
                </td>
                <td class="righttd">&nbsp;<asp:TextBox  CssClass="textbox Wdate" ID="TxtBeginDate" runat="server" onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'});"></asp:TextBox> 至 <asp:TextBox  CssClass="textbox Wdate" ID="TxtEndDate" runat="server" onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'});"></asp:TextBox>&nbsp;
                    说明过了这个期限才不能再使用</td>
            </tr>
            <tr>
                <td align="right" class="lefttd" height="30" style="width: 198px">
                    <strong>优惠券面值：</strong></td>
                <td class="righttd">&nbsp;<asp:TextBox  CssClass="textbox" ID="TxtFaceValue" Text="10" runat="server" Width="56px"></asp:TextBox>
                    <%=MyCache.GetCurrencyUnit%> <span style="color: #ff0000">*可以抵销的最大金额,一旦设定建议不要再修改。</span></td>
            </tr>
            <tr>
                <td align="right" class="lefttd" height="30" style="width: 198px">
                    <strong>优惠券最大抵扣订单总金额的百分数(不含运费)：</strong></td>
                <td class="righttd">&nbsp;<asp:TextBox  CssClass="textbox" ID="TxtMaxDiscount" Text="0" runat="server" Width="56px"></asp:TextBox>%<span style="color: #ff0000">*不限制请输入0,如一张200<%=MyCache.GetCurrencyUnit%>的优惠券,最大抵用金额为订单总金额的50%,假设购物中订单总金额为240<%=MyCache.GetCurrencyUnit%>，
                        这时系统只能使用优惠券抵扣 240 * 50% =120<%=MyCache.GetCurrencyUnit%>，这样这张 200<%=MyCache.GetCurrencyUnit%>的优惠券就剩 80<%=MyCache.GetCurrencyUnit%>。只要在有效期内，剩余的80<%=MyCache.GetCurrencyUnit%>优惠券 还可以用在其它订单当中。</span></td>
            </tr>
            <tr>
                <td align="right" class="lefttd" height="30" style="width: 198px">
                    <strong>优惠券发放方式：</strong></td>
                <td class="righttd">
                    <asp:RadioButtonList ID="RBLCouponType" runat="server">
                        <asp:ListItem Selected="True" Value="1">线上按用户发放</asp:ListItem>
                        <asp:ListItem Value="2">线下发放优惠券号</asp:ListItem>
                    </asp:RadioButtonList></td>
            </tr>
            <tr>
                <td align="right" class="lefttd" height="30" style="width: 198px">
                    <strong>最小订单金额(不含运费)：</strong></td>
                <td class="righttd">&nbsp;<asp:TextBox  CssClass="textbox" ID="TxtMinAmount" Text="1000" runat="server" Width="56px"></asp:TextBox><span style="color: #ff0000">*只有商品总金额达到这个数的订单才能使用这种优惠券</span></td>
            </tr>
            <tr>
                <td align="right" class="lefttd" height="30" style="width: 198px">
                    <strong><span style="background-color: #f0f9fe">使用限制条件</span>：</strong></td>
                <td class="righttd">
                    <asp:RadioButtonList ID="RBLLimitType" onclick="show()" runat="server">
                        <asp:ListItem Selected="True" Value="0">不限制(购买任何商商品都可使用)</asp:ListItem>
                        <asp:ListItem Value="1">按栏目限制(只有购买指定栏目下的商品才可以使用)</asp:ListItem>
                        <asp:ListItem Value="2">限制购买以下商品才可以使用</asp:ListItem>
                    </asp:RadioButtonList></td>
            </tr>
            <tr id="showClass" style="display:none">
                <td align="right" class="lefttd" height="30" style="width: 198px">
                    <strong><span style="background-color: #f0f9fe">栏目限制</span>：</strong></td>
                <td class="righttd">
                    <select name="ClassIDs" id="ClassIDs" style="width:250px" multiple="multiple" size="5">
                    <%=ClassManage.GetClassByBasicModel(4,"0") %>
                    </select>
                    <br />
                    <span style="color:Red">按Crtl或Shife多选</span>
                    
                 </td>
            </tr>
            
            
            
            <tr  id="showPro" style="display:none">
                <td align="right" class="lefttd" height="30" style="width: 198px">
                    <strong>商品限制：</strong></td>
                <td class="righttd">

                 
                 <table>
                 <tr>
                  <td>
                 <asp:ListBox ID="LsbLimitIds" runat="server" Width="320px" Height="120px" SelectionMode="Multiple"></asp:ListBox>
                  </td>
                  <td>
                 <input type="button" class="button" value="添加商品" onclick='parent.openWin("添加商品","Shop/KS.ShopAddToOrder.aspx?action=ids&id=35",false,700,350);' />
                 <br /><br />
                 <input type="button" class="button" value="移除选中商品" onclick="removeOption()" />
                 <br />
                 <input type="button" class="button" value="全部移除" onclick="removeAllOption()" />
                  
                  </td>
                 </tr>
                 </table>                 
                 
                </td>
            </tr>
            <tr>
                <td align="right" class="lefttd" height="30" style="width: 198px">
                <strong>任务状态：</strong>
                </td>
                <td class="righttd">
                <asp:RadioButtonList ID="RdbStatus" runat="server" RepeatDirection="horizontal">
                 <asp:ListItem Value="1" Selected="true">正常</asp:ListItem>
                 <asp:ListItem Value="0">停用</asp:ListItem>
                </asp:RadioButtonList>
                </td>
            </tr>
        </table>
      <br />
      <KS:Foot ID="Foot1" runat="server" OnSubmit="Foot1_Submit" />
        <script type="text/javascript">
            showtips('<span class="state"><strong>说明：</strong><br /></span>优惠券发放后,建议尽量不要再修改优惠券信息如面值、最大抵扣、分配方式等!');
	</script>
          
    </asp:Panel>
    
</asp:Content>

