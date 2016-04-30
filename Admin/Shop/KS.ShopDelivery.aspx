<%@ Page Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.Admin.Shop.Admin_ShopDelivery" Title="配送方式管理" Codebehind="KS.ShopDelivery.aspx.cs" %>
<%@ Import Namespace="Kesion.Cache" %>
<asp:Content ID="Content1" ContentPlaceHolderID="KSContent" Runat="Server">
    <asp:Panel ID="listPanel" runat="server" Width="100%">
      <div id="manage_top" class="menu_top_fixed">
        <ul>
        <li id='p1'><asp:LinkButton ID="addbutton" runat="server" OnClick="addbutton_Click"><b></b>新增配送方式</asp:LinkButton></li>
        
        <li id='p4'><asp:LinkButton ID="editbutton" runat="server" OnClick="editTask_Click"><b></b>编辑配送方式</asp:LinkButton></li>
        <li id='p3'><asp:LinkButton ID="delbutton" runat="server" OnClick="delTask_Click"><b></b>删除配送方式</asp:LinkButton></li>
        </ul>
      </div>     
       <div class="menu_top_fixed_height"></div>
    <div>
        <KS:OrderJS ID="OrderJS1" runat="server" />
        <KS:KSGV ID="DeliveryListView" cssclass="CTable" runat="server" AutoGenerateColumns="False" DataKeyNames="FieldID" GridLines="None"
            OnRowDataBound="FieldListView_RowDataBound" PagerType="CustomNumeric" Width="99%" EnableTheming="True" OnRowCommand="FieldListView_RowCommand" EmptyDataText="您还没有添加任何配送方式,请<a href='?action=add'>点此添加</a>!">
            <Columns>
                <asp:TemplateField HeaderText="选择">
                <itemstyle horizontalalign="Center" width="50px" />
                <itemtemplate>
                    <input type="checkbox"  name="ids" id="ids" value="<%#Eval("DeliveryID") %>" />
                </itemtemplate>
              </asp:TemplateField>
                <asp:TemplateField HeaderText="排序">
                    <itemtemplate>
                     <asp:HiddenField runat="server" id="hidDeliveryID" value='<%#Eval("DeliveryID") %>'></asp:HiddenField>
                     <asp:DropDownList id="orderid" datasource="<%#bindorder() %>" runat="server"></asp:DropDownList>
                     
</itemtemplate>
                    <headerstyle height="18px"/>
                    <itemstyle width="60px" horizontalalign="Center"  />
                </asp:TemplateField>
                  <asp:BoundField DataField="DeliveryName" HeaderText="送货方式名称">
                </asp:BoundField>
                <asp:BoundField DataField="FreightType" HeaderText="设置设置">
                <itemstyle width="130px" horizontalalign="Center" />
                </asp:BoundField>
                 <asp:TemplateField HeaderText="状态">
                  <itemstyle width="30px" horizontalalign="Center"/>
                  <itemtemplate>
                       <a href="?action=Set&fieldName=status&id=<%# Eval("DeliveryID") %>" <%# Convert.ToString(Eval("Status"))=="0"?"class='no' title='否'":"class='ok' title='是'" %>></a>
                  </itemtemplate>
                </asp:TemplateField> 
                 <asp:TemplateField HeaderText="是否默认">
                  <itemstyle width="120px" horizontalalign="Center"/>
                  <itemtemplate>
                       <a href="?action=Set&fieldName=IsDefault&id=<%# Eval("DeliveryID") %>" <%# Convert.ToString(Eval("IsDefault"))=="0"?"class='no' title='否'":"class='ok' title='是'" %>></a>
                  </itemtemplate>
                </asp:TemplateField> 
                 <asp:TemplateField HeaderText="启用运费促销">
                  <itemstyle width="120px" horizontalalign="Center"/>
                  <itemtemplate>
                       <a href="?action=Set&fieldName=PromotionType&id=<%# Eval("DeliveryID") %>" <%# Convert.ToString(Eval("PromotionType"))=="0"?"class='no' title='否'":"class='ok' title='是'" %>></a>
                  </itemtemplate>
                </asp:TemplateField> 


             <asp:TemplateField HeaderText="编辑">
              <itemstyle width="30px" horizontalalign="Center"/>
              <itemtemplate>
                     <asp:LinkButton CssClass="edit" ToolTip="编辑" ID="LinkButton1" runat="server" commandargument=<%#Eval("DeliveryID") %> commandname="modify"></asp:LinkButton>
              </itemtemplate>
            </asp:TemplateField>
             
            <asp:TemplateField HeaderText="删除">
                <itemstyle horizontalalign="Center" width="30px"/>
               <itemtemplate>
                     <asp:LinkButton CssClass="delete" ToolTip="删除" runat="server" id="delete" commandargument=<%#Eval("DeliveryID") %> commandname="del"></asp:LinkButton>
               </itemtemplate>
            </asp:TemplateField>


               
            </Columns>
            <HeaderStyle CssClass="CTitle" />
            <EmptyDataRowStyle CssClass="emptycss" />
        </KS:KSGV>
        <br />
        <asp:Panel ID="Panel1" runat="server">
            &nbsp;&nbsp;&nbsp;&nbsp;<input type="checkbox" name="chkall" id="chkall" onclick="CheckAll(this.form);"/><label for="chkall">全部选中</label><asp:Button ID="Button1" runat="server" Text="批量设置配送方式排序" OnClick="Button1_Click" />&nbsp;
            </asp:Panel>
       <div style="display:none"><KS:Page ID="Page1" runat="server" /></div>

        </div>
              
     </asp:Panel>
    
    <asp:Panel ID="addPanel" runat="server" Width="100%" Visible="false">
    <script type="text/javascript">
       function CheckForm()
	        {
	         if(jQuery('#<%=this.TxtDeliveryName.ClientID %>').val()==''){
	            KesionJS.Alert('请输入送货方式名称！',null);
	           return false;
	         }
	   }

	   function showArea() {
	       var checkrad = jQuery("#<%=this.RdbChargeType.ClientID%> :radio[checked]").val();
	       if (checkrad == "1") {
	           jQuery("#<%=this.area.ClientID%>").show();
	       } else {
	       jQuery("#<%=this.area.ClientID%>").hide();
	       }
         
       }
       function showFreight() {
           var checkrad = jQuery("#<%=this.RdbFreightType.ClientID%> :radio[checked]").val();
           if (checkrad == "2") {
               jQuery("#<%=this.freight.ClientID%>").show();
               jQuery("#<%=this.fixfreight.ClientID%>").hide();
               showArea();
           } else if (checkrad == "1") {
               jQuery("#<%=this.fixfreight.ClientID%>").show();
               jQuery("#<%=this.freight.ClientID%>").hide();
               jQuery("#<%=this.area.ClientID %>").hide();
           } else {
               jQuery("#<%=this.freight.ClientID%>").hide();
               jQuery("#<%=this.fixfreight.ClientID%>").hide();
               jQuery("#<%=this.area.ClientID %>").hide();
           }
      }
    var o=null;
    function getProvince(obj){
     o=obj;
     var nval=getNval(obj);
     parent.openWin("选择配送地区","Shop/KS.ProvinceSelect.aspx?nval="+nval+"&deliveryid="+jQuery("#<%=this.HiddenDeliveryID.ClientID %>").val()+"&val="+obj.value,false,300,360);
    }
    function setProvince(v){
      o.value=v;
      showNoSelect();
    }
    function getNval(obj){
      var nval='';
      for(var i=1;i<=jQuery('#editnum').val();i++){
      if (obj!=document.getElementById("item"+i)){
       if (nval=='')
       nval=document.getElementById("item"+i).value;
       else
       nval+=","+document.getElementById("item"+i).value;
       }
     }
     return nval;
    }
    function showNoSelect(){
      jQuery.get("../../plus/ajaxs.ashx",{a:"getnoselectprovince",nval:getNval(null)},function(data){
        if (data==''||data==null){
         jQuery("#selectTips").html('<strong>所有省份已设置!</strong>');
        }else{
        jQuery("#selectTips").html("<strong>以下省份还没有设置：</strong><span style='color:#ff6600'>"+data+"</span> <br/><font color='green'><strong>特别提示：没有设置的省份将不能使用此配送方式。</strong></font>");
        }
      });
    }
    jQuery(document).ready(function(){
      showNoSelect();
      jQuery("#<%=this.DrpSDelivery.ClientID %>").bind("change",function(){
      if (jQuery("#<%=this.DrpSDelivery.ClientID %> option:selected").val() != '0') {
          jQuery("#<%=this.TxtDeliveryName.ClientID %>").val(jQuery("#<%=this.DrpSDelivery.ClientID %> option:selected").text());
       }
      });
    });
    </script>
        <KS:TopNav ID="TopNav1" runat="server" Text="添加配送方式" />
         <asp:HiddenField ID="HiddenDeliveryID" runat="server" value="0"/>
         <table width="100%" border="0" cellpadding="1" cellspacing="1" class="CTable"> 
             
            <tr>
                <td align="right" class="lefttd" height="30" style="width: 198px">
                    <strong>送货方式名称：</strong></td>
                <td class="righttd">
                    <asp:TextBox CssClass="textbox" ID="TxtDeliveryName" runat="server"></asp:TextBox>
                    <span style="color: #ff0066">*</span> 
                    <=
                    <asp:DropDownList runat="server" ID="DrpSDelivery">
                    </asp:DropDownList>
                     
                    如:EMS,天天快递,圆通快递等。<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TxtDeliveryName"
                        ErrorMessage="请输入送货方式名称" Display="Dynamic"></asp:RequiredFieldValidator></td>
            </tr>
            <tr>
                <td align="right" class="lefttd" height="30" style="width: 198px">
                    <strong>运费设置：</strong></td>
                <td class="righttd">
                    <asp:RadioButtonList ID="RdbFreightType" onclick="showFreight()" runat="server">
                     <asp:ListItem Value="0" Selected="true">不设置运费(免费)</asp:ListItem>
                     <asp:ListItem Value="1">设置固定运费</asp:ListItem>
                     <asp:ListItem Value="2">按重量设置运费</asp:ListItem>
                    </asp:RadioButtonList>
                
                </td>
            
            </tr>
          <tbody id="fixfreight" runat="server" style="display:none">
            <tr>
                <td align="right" class="lefttd" height="30" style="width: 198px">
                    <strong>运费：</strong></td>
                <td class="righttd">
                    统一另收 <asp:TextBox CssClass="textbox" ID="TxtFreight" runat="server" Width="50px" style="text-align:center"></asp:TextBox> <%=MyCache.GetCurrencyUnit%>运费
                    </td>
            </tr>
          </tbody>
          <tbody id="freight" runat="server" style="display:none">
             <tr>
                 <td align="right" class="lefttd" style="width: 198px; height: 30px;">
                     <strong>重量设置：</strong></td>
                 <td class="righttd" style="height: 30px">
                     首重重量<asp:TextBox CssClass="textbox" ID="TxtFirstHeavy" style="text-align:center" Width="30px" runat="server"></asp:TextBox> 公斤
                     
                     续重重量<asp:TextBox CssClass="textbox" ID="TxtContinueHeavy" style="text-align:center" Width="30px" runat="server"></asp:TextBox> 公斤
                     </td>
             </tr>
             <tr>
                 <td align="right" class="lefttd" style="width: 198px; height: 30px">
                     <strong>默认运费：</strong>
                     <br />
                     <span style="color: #0000ff">如果没有分别设置地区运费，则以此为准</span>
                  </td>
                 <td class="righttd" style="height: 30px">
                      首重运费<asp:TextBox CssClass="textbox" ID="TxtFirstFreight" style="text-align:center" Width="50px" runat="server"></asp:TextBox> <%=MyCache.GetCurrencyUnit%>
                     
                     续重运费<asp:TextBox CssClass="textbox" ID="TxtContinueFreight" style="text-align:center" Width="50px" runat="server"></asp:TextBox> <%=MyCache.GetCurrencyUnit%>
                     最高运费不超过<asp:TextBox CssClass="textbox" ID="TxtLimitFreight" style="text-align:center" Width="50px" runat="server"></asp:TextBox> <%=MyCache.GetCurrencyUnit%>
                     <br />
                     <asp:CheckBox ID="CkbIsCod" runat="Server" Text="支持货到付款" />
                </td>
             </tr>
             <tr>
                 <td align="right" class="lefttd" style="width: 198px; height: 30px">
                     <strong>是否分别设置地区运费：</strong></td>
                 <td class="righttd" style="height: 30px">
                     <asp:RadioButtonList ID="RdbChargeType" onclick="showArea()" runat="server"  RepeatDirection="Horizontal">
                         <asp:ListItem Selected="True" Value="0">不启用</asp:ListItem>
                         <asp:ListItem Value="1">启用</asp:ListItem>
                     </asp:RadioButtonList>
                     </td>
             </tr>
             <tbody id="area" runat="server" style="display:none">
             <tr>
                 <td align="right" class="lefttd" style="width: 198px; height: 30px">
                     <strong>支持的配送地区：</strong></td>
                 <td class="righttd" style="height: 30px">
                    <table border="0" width="98%" align="center">
                     <tr>
                     <td>
                          <div style="padding:2px;font-weight:bold;background:#DEEDF8">
                          同城运费设置 <span style="color:Green">(指购物者与您在同一个城市间)</span>
                          </div>
                          
                          <table width="98%" align="center" style='border:1px solid #999999;margin:10px;' border=0 cellspacing=1 cellpadding=3>
                           <tr>
                            <td style="padding:8px">
                            

                          首重运费<asp:TextBox CssClass="textbox" ID="TxtCityFirstFreight" Width="30px" runat="server"></asp:TextBox> <%=MyCache.GetCurrencyUnit%>
                         
                         续重运费<asp:TextBox CssClass="textbox" ID="TxtCityContinueFreight" Width="30px" runat="server"></asp:TextBox> <%=MyCache.GetCurrencyUnit%>
                         最高运费不超过<asp:TextBox CssClass="textbox" ID="TxtCityLimitFreight" Width="30px" runat="server"></asp:TextBox> <%=MyCache.GetCurrencyUnit%>
                         <br />
                         <asp:CheckBox ID="CkbCityIsCod" runat="Server" Text="支持货到付款" />
                         </td>
                           </tr>
                           </table>
                     </td>
                     </tr>
                     <tr>
                     <td>
                          <div style="padding:2px;font-weight:bold;background:#DEEDF8">
                          同省运费设置 <span style="color:Green">(指购物者与您在同一个省份)</span>
                          </div>
                          
                          <table width="98%" align="center" style='border:1px solid #999999;margin:10px;' border=0 cellspacing=1 cellpadding=3>
                           <tr>
                            <td style="padding:8px">
                            
                          首重运费<asp:TextBox CssClass="textbox" ID="TxtProvinceFristFreight" Width="30px" runat="server"></asp:TextBox> <%=MyCache.GetCurrencyUnit%>
                         
                         续重运费<asp:TextBox CssClass="textbox" ID="TxtProvinceContinueFreight" Width="30px" runat="server"></asp:TextBox> <%=MyCache.GetCurrencyUnit%>
                         最高运费不超过<asp:TextBox CssClass="textbox" ID="TxtProvinceLimitFreight" Width="30px" runat="server"></asp:TextBox> <%=MyCache.GetCurrencyUnit%>
                         <br />
                         <asp:CheckBox ID="CkbProvinceIsCod" runat="Server" Text="支持货到付款" />
                         </td>
                           </tr>
                           </table>
                     </td>
                     </tr>
                     <tr>
                     <td>
                        <div style="padding:2px;font-weight:bold;background:#DEEDF8">
                          其它省运费设置 <input type="button" class="button" value="增加一个地区运费选项" onclick="doadd(1)"/>
                         </div>
                         <input type="hidden" name="editnum" id="editnum" value="0" />
                         <div id="showOther"></div>
                         <div id="selectTips" style="margin:3px;border:#ff6600 1px solid;padding:10px;background:#f1f1f1"></div>
                     </td>
                     </tr>
                    </table>
                    <script type="text/javascript">
                      function doadd(num)
                        {var i;
                        var str="";
                        var oldi=0;
                        var j=0;
                        oldi=parseInt(jQuery('#editnum').val());
                        if (oldi==100){
                         //alert('最多只能加100个选项!');
                         //return ;
                        }
                        for(i=1;i<=num;i++)
                        {
                        j=i+oldi;
                        str=str+"<table width=100% style='border:1px solid #999999;margin-bottom:10px' border=0 cellspacing=1 cellpadding=3><tr><td width='30' height=30> <div align=center><input type=hidden name='id"+j+"' value=0>"+j+"</div></td><td>配送地区：<input type=text id='item"+j+"' name='item"+j+"' readonly onclick='getProvince(this);' size='60'></td><td width=100> <div align=center><input type=checkbox name='iscod"+j+"' style='text-align:center' value=1>支持货到付款</div></td></tr>";
                        str=str+"<tr><td></td><td colspan=2 height=30>首重运费：<input name='firstfreight"+j+"' class='textbox' type='text' size='4' style='text-align:center'> <%=MyCache.GetCurrencyUnit%> 续重运费：<input name='continuefreight"+j+"' type='text' class='textbox' size='4' style='text-align:center'> <%=MyCache.GetCurrencyUnit%> 最高运费不超过：<input name='limitfreight"+j+"' class='textbox' type='text' size='4' style='text-align:center'> <%=MyCache.GetCurrencyUnit%></td></tr></table>"
                        }
                            jQuery("#showOther").html(jQuery("#showOther").html()+str);
                            jQuery('#editnum').val(j);
                        }
                        doadd(1);
                    </script>
                 </td>
             </tr>
            </tbody>
            </tbody>
             <tr>
                 <td align="right" class="lefttd" style="width: 198px;">
                     <strong>详细介绍：</strong></td>
                 <td class="righttd" style="height: 30px">
                 <asp:TextBox ID="Content" TextMode="multiLine" style="width:90%;height:200px" runat="server"></asp:TextBox>
                <% Kesion.APPCode.EditorAPI.EchoEditor("editor", this.Content.ClientID, "Basic");%>

                 </td>
             </tr>
            
             <tr>
                 <td align="right" class="lefttd" style="width: 198px; height: 30px">
                     <strong>状态：<br />
                     </strong><span style="color: #0000ff">只有正常状态的才可以使用</span></td>
                 <td class="righttd" style="height: 30px">
                     <asp:RadioButtonList ID="RdbStatus" runat="server" RepeatDirection="Horizontal">
                         <asp:ListItem Selected="True" Value="1">正常</asp:ListItem>
                         <asp:ListItem Value="0">禁用</asp:ListItem>
                     </asp:RadioButtonList></td>
             </tr>             
             <tr>
                 <td align="right" class="lefttd" style="width: 198px; height: 30px">
                     <strong>设置成默认配置方式：<br />
                     </strong></td>
                 <td class="righttd" style="height: 30px">
                    <asp:CheckBox ID="CkbIsDefault" runat="server" Text="默认" />
                     </td>
             </tr>             
             
             <tr>
                 <td align="right" class="lefttd" style="width: 198px; height: 30px">
                     <strong>运费促销设置：</strong>
                     </td>
                 <td class="righttd" style="height: 30px">
                 <asp:RadioButtonList ID="RdbPromotionType" runat="server">
                          <asp:ListItem Value="0" Selected="True">不启用促销</asp:ListItem>
                          <asp:ListItem Value="1">在本商城购买满&lt;input class=textbox type=&quot;text&quot; style=&quot;width:60px;text-align:center;&quot; value=&quot;1000&quot; name=&quot;TxtOrderAmount1&quot; id=&quot;TxtOrderAmount1&quot; size=&quot;5&quot;&gt; ,免运费</asp:ListItem>
                          <asp:ListItem Value="2">在本商城购买满&lt;input class=textbox type=&quot;text&quot; style=&quot;width:60px;text-align:center;&quot; value=&quot;1000&quot; name=&quot;TxtOrderAmount2&quot; id=&quot;TxtOrderAmount2&quot; size=&quot;5&quot;&gt; ,减免&lt;input class=textbox type=&quot;text&quot; style=&quot;width:60px;text-align:center;&quot; value=&quot;10&quot; name=&quot;TxtFreight1&quot; id=&quot;TxtFreight1&quot; size=&quot;5&quot;&gt;运费</asp:ListItem>
                          <asp:ListItem Value="3">在本商城购买满&lt;input class=textbox type=&quot;text&quot; style=&quot;width:60px;text-align:center;&quot; value=&quot;1000&quot; name=&quot;TxtOrderAmount3&quot; id=&quot;TxtOrderAmount3&quot; size=&quot;5&quot;&gt; ,并且运费总额少于&lt;input class=textbox type=&quot;text&quot; style=&quot;width:60px;text-align:center;&quot; value=&quot;10&quot; name=&quot;TxtFreight2&quot; id=&quot;TxtFreight2&quot; size=&quot;5&quot;&gt;时免运费</asp:ListItem>
                      </asp:RadioButtonList>
                 </td>
             </tr>
        </table>
        <br />
        <KS:Foot ID="Foot1" runat="server" OnSubmit="Foot1_Submit" SubmitButtonText="确定添加(0)" />
    
    </asp:Panel>
    

  </asp:Content>