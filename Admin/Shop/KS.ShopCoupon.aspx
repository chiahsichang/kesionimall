<%@ Page Language="C#" EnableEventValidation="false"  MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.Admin.Shop.Admin_ShopCoupon" Title="�Ż�ȯ����" Codebehind="KS.ShopCoupon.aspx.cs" %>
<%@ Import Namespace="Kesion.BLL" %>
<%@ Import Namespace="Kesion.Publics" %>
<%@ Import Namespace="Kesion.APPCode" %>
<%@ Import Namespace="Kesion.Cache" %>
<asp:Content ID="Content1" ContentPlaceHolderID="KSContent" Runat="Server">
     <asp:Panel ID="CouponList" runat="server" Width="100%">
      <div id="manage_top" class="menu_top_fixed">
        <ul>
           <li id='p1'><asp:LinkButton ID="addCoupon" runat="server" OnClick="addCoupon_Click"><b></b>����Ż�ȯ</asp:LinkButton></li>
           <li id='p4'><asp:LinkButton ID="editCoupon" runat="server" OnClick="editCoupon_Click"><b></b>�༭�Ż�ȯ</asp:LinkButton></li>
           <li id='p3'><asp:LinkButton ID="delCouponBtn" runat="server" OnClick="delCoupon_Click"><b></b>ɾ���Ż�ȯ</asp:LinkButton></li>
        </ul>
      </div>   
      <div class="menu_top_fixed_height"></div>
       <KS:KSGV ID="list" cssclass="CTable" runat="server" AutoGenerateColumns="False" Width="99%" EmptyDataText="û������κ��Ż�ȯ!" GridLines="None" OnRowDataBound="list_RowDataBound" OnRowCommand="list_RowCommand" OnRowCreated="list_RowCreated" AllowPaging="True" >
          <Columns>
              <asp:TemplateField HeaderText="ѡ��">
                <itemstyle horizontalalign="Center" width="50px" />
                <itemtemplate>
                    <input type="checkbox"  name="ids" id="ids" value='<%#Eval("Couponid") %>' />
                </itemtemplate>
              </asp:TemplateField>

               <asp:TemplateField HeaderText="״̬">
              <itemstyle width="30px" horizontalalign="Center"/>
              <itemtemplate>
                   <a href="?action=status&Couponid=<%#Eval("Couponid")%>" <%# Convert.ToString(Eval("status"))=="0"?"class='no' title='ͣ��'":"class='ok' title='����'" %>></a>
              </itemtemplate>
            </asp:TemplateField>

             <asp:TemplateField HeaderText="�Ż�ȯ����">
             <itemtemplate>
             <%# Eval("Couponname") %> 
             </itemtemplate>
             </asp:TemplateField> 
             <asp:TemplateField HeaderText="���ŷ�ʽ">
             <itemstyle horizontalalign="Center" width="70px" />
             <itemtemplate>
             <%# Convert.ToString(Eval("Coupontype")) == "1" ? "<span style='color:blue'>���û�����</span>" : "<span style='color:green'>���·���</span>"%>  
             </itemtemplate>
             </asp:TemplateField>
             
             <asp:TemplateField HeaderText="��Ч��">
             <itemstyle horizontalalign="Center" width="230px" />
             <itemtemplate>
             <span class="tips">
             <%# GetExpireDate(Convert.ToString(Eval("BeginDate")),Convert.ToString(Eval("EndDate")))%>
             </span>
             </itemtemplate>
             </asp:TemplateField>

              <asp:TemplateField HeaderText="��ֵ">
                <itemstyle horizontalalign="Center" width="40px" />
                <itemtemplate>
               <%=MyCache.GetCurrencySymbol%><%# Public.ReturnShopPrice(Utils.StrToDecimal(Eval("FaceValue")))%>
                </itemtemplate>
              </asp:TemplateField> 

             <asp:TemplateField HeaderText="��������">
             <itemstyle horizontalalign="Center" />
             <itemtemplate>
              <span style="color:Red"><%# Eval("TotalNum") %></span> ��
              <a href='KS.ShopCouponItem.aspx?couponId=<%# Eval("CouponID") %>'>(�鿴)</a>
             </itemtemplate>
             </asp:TemplateField>
             
            
             
             <asp:TemplateField HeaderText="�༭">
              <itemstyle width="30px" horizontalalign="Center"/>
              <itemtemplate>
             <asp:LinkButton ID="LinkButton1" ToolTip="�༭" CssClass="edit" runat="server" commandargument=<%#Eval("Couponid") %> commandname="modify"></asp:LinkButton>
              </itemtemplate>
            </asp:TemplateField>
             <asp:TemplateField HeaderText="ɾ��">
              <itemstyle width="30px" horizontalalign="Center"/>
              <itemtemplate>
             <asp:LinkButton runat="server" id="delete" ToolTip="ɾ��" CssClass="delete" commandargument=<%#Eval("Couponid") %> commandname="del"></asp:LinkButton>
              </itemtemplate>
            </asp:TemplateField>

            <asp:TemplateField HeaderText="������">
                <itemstyle width="60px" horizontalalign="Center" />
             <itemtemplate>
             <asp:LinkButton ID="pubBtn" runat="server" CommandArgument=<%#Eval("Couponid") %>  CommandName="pub">����</asp:LinkButton>
               </itemtemplate>
            </asp:TemplateField>
          </Columns>
            <HeaderStyle CssClass="CTitle" />
            <EmptyDataRowStyle CssClass="emptycss" />
      </KS:KSGV>
      <asp:Panel ID="Panel1" runat="server" Height="30px" Width="741px">
              <div style="margin-top:5px;overflow:hidden;"></div>
            &nbsp;&nbsp;<input type="checkbox" name="chkall" id="chkall" onclick="CheckAll(this.form);"/><label for="chkall">ȫ��ѡ��</label>
            <input type="button" value="ɾ��ѡ�е��Ż�ȯ" onmouseover="this.className='button_on';" onmouseout="this.className='button';" class="button" onclick="if (GetIDS('del')){this.form.action='?action=del';this.form.submit()}" id="Button1" />
    
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
            <td class="lefttd" height="30" align="right" style="width: 198px"><strong>�Ż�ȯ���ƣ�</strong></td>
            <td class="righttd">
                &nbsp;<asp:TextBox  CssClass="textbox" ID="TxtCouponName" runat="server"></asp:TextBox> ��: 5<%=MyCache.GetCurrencyUnit%>����ȯ��
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TxtCouponName"
                    ErrorMessage="�������Ż�ȯ����!"></asp:RequiredFieldValidator>
            </td>
          </tr>
            <tr>
                <td align="right" class="lefttd" height="30" style="width: 198px">
                 <strong>ʹ����ʼ���ڣ�</strong>
                </td>
                <td class="righttd">&nbsp;<asp:TextBox  CssClass="textbox Wdate" ID="TxtBeginDate" runat="server" onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'});"></asp:TextBox> �� <asp:TextBox  CssClass="textbox Wdate" ID="TxtEndDate" runat="server" onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'});"></asp:TextBox>&nbsp;
                    ˵������������޲Ų�����ʹ��</td>
            </tr>
            <tr>
                <td align="right" class="lefttd" height="30" style="width: 198px">
                    <strong>�Ż�ȯ��ֵ��</strong></td>
                <td class="righttd">&nbsp;<asp:TextBox  CssClass="textbox" ID="TxtFaceValue" Text="10" runat="server" Width="56px"></asp:TextBox>
                    <%=MyCache.GetCurrencyUnit%> <span style="color: #ff0000">*���Ե����������,һ���趨���鲻Ҫ���޸ġ�</span></td>
            </tr>
            <tr>
                <td align="right" class="lefttd" height="30" style="width: 198px">
                    <strong>�Ż�ȯ���ֿ۶����ܽ��İٷ���(�����˷�)��</strong></td>
                <td class="righttd">&nbsp;<asp:TextBox  CssClass="textbox" ID="TxtMaxDiscount" Text="0" runat="server" Width="56px"></asp:TextBox>%<span style="color: #ff0000">*������������0,��һ��200<%=MyCache.GetCurrencyUnit%>���Ż�ȯ,�����ý��Ϊ�����ܽ���50%,���蹺���ж����ܽ��Ϊ240<%=MyCache.GetCurrencyUnit%>��
                        ��ʱϵͳֻ��ʹ���Ż�ȯ�ֿ� 240 * 50% =120<%=MyCache.GetCurrencyUnit%>���������� 200<%=MyCache.GetCurrencyUnit%>���Ż�ȯ��ʣ 80<%=MyCache.GetCurrencyUnit%>��ֻҪ����Ч���ڣ�ʣ���80<%=MyCache.GetCurrencyUnit%>�Ż�ȯ ���������������������С�</span></td>
            </tr>
            <tr>
                <td align="right" class="lefttd" height="30" style="width: 198px">
                    <strong>�Ż�ȯ���ŷ�ʽ��</strong></td>
                <td class="righttd">
                    <asp:RadioButtonList ID="RBLCouponType" runat="server">
                        <asp:ListItem Selected="True" Value="1">���ϰ��û�����</asp:ListItem>
                        <asp:ListItem Value="2">���·����Ż�ȯ��</asp:ListItem>
                    </asp:RadioButtonList></td>
            </tr>
            <tr>
                <td align="right" class="lefttd" height="30" style="width: 198px">
                    <strong>��С�������(�����˷�)��</strong></td>
                <td class="righttd">&nbsp;<asp:TextBox  CssClass="textbox" ID="TxtMinAmount" Text="1000" runat="server" Width="56px"></asp:TextBox><span style="color: #ff0000">*ֻ����Ʒ�ܽ��ﵽ������Ķ�������ʹ�������Ż�ȯ</span></td>
            </tr>
            <tr>
                <td align="right" class="lefttd" height="30" style="width: 198px">
                    <strong><span style="background-color: #f0f9fe">ʹ����������</span>��</strong></td>
                <td class="righttd">
                    <asp:RadioButtonList ID="RBLLimitType" onclick="show()" runat="server">
                        <asp:ListItem Selected="True" Value="0">������(�����κ�����Ʒ����ʹ��)</asp:ListItem>
                        <asp:ListItem Value="1">����Ŀ����(ֻ�й���ָ����Ŀ�µ���Ʒ�ſ���ʹ��)</asp:ListItem>
                        <asp:ListItem Value="2">���ƹ���������Ʒ�ſ���ʹ��</asp:ListItem>
                    </asp:RadioButtonList></td>
            </tr>
            <tr id="showClass" style="display:none">
                <td align="right" class="lefttd" height="30" style="width: 198px">
                    <strong><span style="background-color: #f0f9fe">��Ŀ����</span>��</strong></td>
                <td class="righttd">
                    <select name="ClassIDs" id="ClassIDs" style="width:250px" multiple="multiple" size="5">
                    <%=ClassManage.GetClassByBasicModel(4,"0") %>
                    </select>
                    <br />
                    <span style="color:Red">��Crtl��Shife��ѡ</span>
                    
                 </td>
            </tr>
            
            
            
            <tr  id="showPro" style="display:none">
                <td align="right" class="lefttd" height="30" style="width: 198px">
                    <strong>��Ʒ���ƣ�</strong></td>
                <td class="righttd">

                 
                 <table>
                 <tr>
                  <td>
                 <asp:ListBox ID="LsbLimitIds" runat="server" Width="320px" Height="120px" SelectionMode="Multiple"></asp:ListBox>
                  </td>
                  <td>
                 <input type="button" class="button" value="�����Ʒ" onclick='parent.openWin("�����Ʒ","Shop/KS.ShopAddToOrder.aspx?action=ids&id=35",false,700,350);' />
                 <br /><br />
                 <input type="button" class="button" value="�Ƴ�ѡ����Ʒ" onclick="removeOption()" />
                 <br />
                 <input type="button" class="button" value="ȫ���Ƴ�" onclick="removeAllOption()" />
                  
                  </td>
                 </tr>
                 </table>                 
                 
                </td>
            </tr>
            <tr>
                <td align="right" class="lefttd" height="30" style="width: 198px">
                <strong>����״̬��</strong>
                </td>
                <td class="righttd">
                <asp:RadioButtonList ID="RdbStatus" runat="server" RepeatDirection="horizontal">
                 <asp:ListItem Value="1" Selected="true">����</asp:ListItem>
                 <asp:ListItem Value="0">ͣ��</asp:ListItem>
                </asp:RadioButtonList>
                </td>
            </tr>
        </table>
      <br />
      <KS:Foot ID="Foot1" runat="server" OnSubmit="Foot1_Submit" />
        <script type="text/javascript">
            showtips('<span class="state"><strong>˵����</strong><br /></span>�Ż�ȯ���ź�,���龡����Ҫ���޸��Ż�ȯ��Ϣ����ֵ�����ֿۡ����䷽ʽ��!');
	</script>
          
    </asp:Panel>
    
</asp:Content>

