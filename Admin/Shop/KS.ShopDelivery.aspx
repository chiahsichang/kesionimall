<%@ Page Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.Admin.Shop.Admin_ShopDelivery" Title="���ͷ�ʽ����" Codebehind="KS.ShopDelivery.aspx.cs" %>
<%@ Import Namespace="Kesion.Cache" %>
<asp:Content ID="Content1" ContentPlaceHolderID="KSContent" Runat="Server">
    <asp:Panel ID="listPanel" runat="server" Width="100%">
      <div id="manage_top" class="menu_top_fixed">
        <ul>
        <li id='p1'><asp:LinkButton ID="addbutton" runat="server" OnClick="addbutton_Click"><b></b>�������ͷ�ʽ</asp:LinkButton></li>
        
        <li id='p4'><asp:LinkButton ID="editbutton" runat="server" OnClick="editTask_Click"><b></b>�༭���ͷ�ʽ</asp:LinkButton></li>
        <li id='p3'><asp:LinkButton ID="delbutton" runat="server" OnClick="delTask_Click"><b></b>ɾ�����ͷ�ʽ</asp:LinkButton></li>
        </ul>
      </div>     
       <div class="menu_top_fixed_height"></div>
    <div>
        <KS:OrderJS ID="OrderJS1" runat="server" />
        <KS:KSGV ID="DeliveryListView" cssclass="CTable" runat="server" AutoGenerateColumns="False" DataKeyNames="FieldID" GridLines="None"
            OnRowDataBound="FieldListView_RowDataBound" PagerType="CustomNumeric" Width="99%" EnableTheming="True" OnRowCommand="FieldListView_RowCommand" EmptyDataText="����û������κ����ͷ�ʽ,��<a href='?action=add'>������</a>!">
            <Columns>
                <asp:TemplateField HeaderText="ѡ��">
                <itemstyle horizontalalign="Center" width="50px" />
                <itemtemplate>
                    <input type="checkbox"  name="ids" id="ids" value="<%#Eval("DeliveryID") %>" />
                </itemtemplate>
              </asp:TemplateField>
                <asp:TemplateField HeaderText="����">
                    <itemtemplate>
                     <asp:HiddenField runat="server" id="hidDeliveryID" value='<%#Eval("DeliveryID") %>'></asp:HiddenField>
                     <asp:DropDownList id="orderid" datasource="<%#bindorder() %>" runat="server"></asp:DropDownList>
                     
</itemtemplate>
                    <headerstyle height="18px"/>
                    <itemstyle width="60px" horizontalalign="Center"  />
                </asp:TemplateField>
                  <asp:BoundField DataField="DeliveryName" HeaderText="�ͻ���ʽ����">
                </asp:BoundField>
                <asp:BoundField DataField="FreightType" HeaderText="��������">
                <itemstyle width="130px" horizontalalign="Center" />
                </asp:BoundField>
                 <asp:TemplateField HeaderText="״̬">
                  <itemstyle width="30px" horizontalalign="Center"/>
                  <itemtemplate>
                       <a href="?action=Set&fieldName=status&id=<%# Eval("DeliveryID") %>" <%# Convert.ToString(Eval("Status"))=="0"?"class='no' title='��'":"class='ok' title='��'" %>></a>
                  </itemtemplate>
                </asp:TemplateField> 
                 <asp:TemplateField HeaderText="�Ƿ�Ĭ��">
                  <itemstyle width="120px" horizontalalign="Center"/>
                  <itemtemplate>
                       <a href="?action=Set&fieldName=IsDefault&id=<%# Eval("DeliveryID") %>" <%# Convert.ToString(Eval("IsDefault"))=="0"?"class='no' title='��'":"class='ok' title='��'" %>></a>
                  </itemtemplate>
                </asp:TemplateField> 
                 <asp:TemplateField HeaderText="�����˷Ѵ���">
                  <itemstyle width="120px" horizontalalign="Center"/>
                  <itemtemplate>
                       <a href="?action=Set&fieldName=PromotionType&id=<%# Eval("DeliveryID") %>" <%# Convert.ToString(Eval("PromotionType"))=="0"?"class='no' title='��'":"class='ok' title='��'" %>></a>
                  </itemtemplate>
                </asp:TemplateField> 


             <asp:TemplateField HeaderText="�༭">
              <itemstyle width="30px" horizontalalign="Center"/>
              <itemtemplate>
                     <asp:LinkButton CssClass="edit" ToolTip="�༭" ID="LinkButton1" runat="server" commandargument=<%#Eval("DeliveryID") %> commandname="modify"></asp:LinkButton>
              </itemtemplate>
            </asp:TemplateField>
             
            <asp:TemplateField HeaderText="ɾ��">
                <itemstyle horizontalalign="Center" width="30px"/>
               <itemtemplate>
                     <asp:LinkButton CssClass="delete" ToolTip="ɾ��" runat="server" id="delete" commandargument=<%#Eval("DeliveryID") %> commandname="del"></asp:LinkButton>
               </itemtemplate>
            </asp:TemplateField>


               
            </Columns>
            <HeaderStyle CssClass="CTitle" />
            <EmptyDataRowStyle CssClass="emptycss" />
        </KS:KSGV>
        <br />
        <asp:Panel ID="Panel1" runat="server">
            &nbsp;&nbsp;&nbsp;&nbsp;<input type="checkbox" name="chkall" id="chkall" onclick="CheckAll(this.form);"/><label for="chkall">ȫ��ѡ��</label><asp:Button ID="Button1" runat="server" Text="�����������ͷ�ʽ����" OnClick="Button1_Click" />&nbsp;
            </asp:Panel>
       <div style="display:none"><KS:Page ID="Page1" runat="server" /></div>

        </div>
              
     </asp:Panel>
    
    <asp:Panel ID="addPanel" runat="server" Width="100%" Visible="false">
    <script type="text/javascript">
       function CheckForm()
	        {
	         if(jQuery('#<%=this.TxtDeliveryName.ClientID %>').val()==''){
	            KesionJS.Alert('�������ͻ���ʽ���ƣ�',null);
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
     parent.openWin("ѡ�����͵���","Shop/KS.ProvinceSelect.aspx?nval="+nval+"&deliveryid="+jQuery("#<%=this.HiddenDeliveryID.ClientID %>").val()+"&val="+obj.value,false,300,360);
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
         jQuery("#selectTips").html('<strong>����ʡ��������!</strong>');
        }else{
        jQuery("#selectTips").html("<strong>����ʡ�ݻ�û�����ã�</strong><span style='color:#ff6600'>"+data+"</span> <br/><font color='green'><strong>�ر���ʾ��û�����õ�ʡ�ݽ�����ʹ�ô����ͷ�ʽ��</strong></font>");
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
        <KS:TopNav ID="TopNav1" runat="server" Text="������ͷ�ʽ" />
         <asp:HiddenField ID="HiddenDeliveryID" runat="server" value="0"/>
         <table width="100%" border="0" cellpadding="1" cellspacing="1" class="CTable"> 
             
            <tr>
                <td align="right" class="lefttd" height="30" style="width: 198px">
                    <strong>�ͻ���ʽ���ƣ�</strong></td>
                <td class="righttd">
                    <asp:TextBox CssClass="textbox" ID="TxtDeliveryName" runat="server"></asp:TextBox>
                    <span style="color: #ff0066">*</span> 
                    <=
                    <asp:DropDownList runat="server" ID="DrpSDelivery">
                    </asp:DropDownList>
                     
                    ��:EMS,������,Բͨ��ݵȡ�<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TxtDeliveryName"
                        ErrorMessage="�������ͻ���ʽ����" Display="Dynamic"></asp:RequiredFieldValidator></td>
            </tr>
            <tr>
                <td align="right" class="lefttd" height="30" style="width: 198px">
                    <strong>�˷����ã�</strong></td>
                <td class="righttd">
                    <asp:RadioButtonList ID="RdbFreightType" onclick="showFreight()" runat="server">
                     <asp:ListItem Value="0" Selected="true">�������˷�(���)</asp:ListItem>
                     <asp:ListItem Value="1">���ù̶��˷�</asp:ListItem>
                     <asp:ListItem Value="2">�����������˷�</asp:ListItem>
                    </asp:RadioButtonList>
                
                </td>
            
            </tr>
          <tbody id="fixfreight" runat="server" style="display:none">
            <tr>
                <td align="right" class="lefttd" height="30" style="width: 198px">
                    <strong>�˷ѣ�</strong></td>
                <td class="righttd">
                    ͳһ���� <asp:TextBox CssClass="textbox" ID="TxtFreight" runat="server" Width="50px" style="text-align:center"></asp:TextBox> <%=MyCache.GetCurrencyUnit%>�˷�
                    </td>
            </tr>
          </tbody>
          <tbody id="freight" runat="server" style="display:none">
             <tr>
                 <td align="right" class="lefttd" style="width: 198px; height: 30px;">
                     <strong>�������ã�</strong></td>
                 <td class="righttd" style="height: 30px">
                     ��������<asp:TextBox CssClass="textbox" ID="TxtFirstHeavy" style="text-align:center" Width="30px" runat="server"></asp:TextBox> ����
                     
                     ��������<asp:TextBox CssClass="textbox" ID="TxtContinueHeavy" style="text-align:center" Width="30px" runat="server"></asp:TextBox> ����
                     </td>
             </tr>
             <tr>
                 <td align="right" class="lefttd" style="width: 198px; height: 30px">
                     <strong>Ĭ���˷ѣ�</strong>
                     <br />
                     <span style="color: #0000ff">���û�зֱ����õ����˷ѣ����Դ�Ϊ׼</span>
                  </td>
                 <td class="righttd" style="height: 30px">
                      �����˷�<asp:TextBox CssClass="textbox" ID="TxtFirstFreight" style="text-align:center" Width="50px" runat="server"></asp:TextBox> <%=MyCache.GetCurrencyUnit%>
                     
                     �����˷�<asp:TextBox CssClass="textbox" ID="TxtContinueFreight" style="text-align:center" Width="50px" runat="server"></asp:TextBox> <%=MyCache.GetCurrencyUnit%>
                     ����˷Ѳ�����<asp:TextBox CssClass="textbox" ID="TxtLimitFreight" style="text-align:center" Width="50px" runat="server"></asp:TextBox> <%=MyCache.GetCurrencyUnit%>
                     <br />
                     <asp:CheckBox ID="CkbIsCod" runat="Server" Text="֧�ֻ�������" />
                </td>
             </tr>
             <tr>
                 <td align="right" class="lefttd" style="width: 198px; height: 30px">
                     <strong>�Ƿ�ֱ����õ����˷ѣ�</strong></td>
                 <td class="righttd" style="height: 30px">
                     <asp:RadioButtonList ID="RdbChargeType" onclick="showArea()" runat="server"  RepeatDirection="Horizontal">
                         <asp:ListItem Selected="True" Value="0">������</asp:ListItem>
                         <asp:ListItem Value="1">����</asp:ListItem>
                     </asp:RadioButtonList>
                     </td>
             </tr>
             <tbody id="area" runat="server" style="display:none">
             <tr>
                 <td align="right" class="lefttd" style="width: 198px; height: 30px">
                     <strong>֧�ֵ����͵�����</strong></td>
                 <td class="righttd" style="height: 30px">
                    <table border="0" width="98%" align="center">
                     <tr>
                     <td>
                          <div style="padding:2px;font-weight:bold;background:#DEEDF8">
                          ͬ���˷����� <span style="color:Green">(ָ������������ͬһ�����м�)</span>
                          </div>
                          
                          <table width="98%" align="center" style='border:1px solid #999999;margin:10px;' border=0 cellspacing=1 cellpadding=3>
                           <tr>
                            <td style="padding:8px">
                            

                          �����˷�<asp:TextBox CssClass="textbox" ID="TxtCityFirstFreight" Width="30px" runat="server"></asp:TextBox> <%=MyCache.GetCurrencyUnit%>
                         
                         �����˷�<asp:TextBox CssClass="textbox" ID="TxtCityContinueFreight" Width="30px" runat="server"></asp:TextBox> <%=MyCache.GetCurrencyUnit%>
                         ����˷Ѳ�����<asp:TextBox CssClass="textbox" ID="TxtCityLimitFreight" Width="30px" runat="server"></asp:TextBox> <%=MyCache.GetCurrencyUnit%>
                         <br />
                         <asp:CheckBox ID="CkbCityIsCod" runat="Server" Text="֧�ֻ�������" />
                         </td>
                           </tr>
                           </table>
                     </td>
                     </tr>
                     <tr>
                     <td>
                          <div style="padding:2px;font-weight:bold;background:#DEEDF8">
                          ͬʡ�˷����� <span style="color:Green">(ָ������������ͬһ��ʡ��)</span>
                          </div>
                          
                          <table width="98%" align="center" style='border:1px solid #999999;margin:10px;' border=0 cellspacing=1 cellpadding=3>
                           <tr>
                            <td style="padding:8px">
                            
                          �����˷�<asp:TextBox CssClass="textbox" ID="TxtProvinceFristFreight" Width="30px" runat="server"></asp:TextBox> <%=MyCache.GetCurrencyUnit%>
                         
                         �����˷�<asp:TextBox CssClass="textbox" ID="TxtProvinceContinueFreight" Width="30px" runat="server"></asp:TextBox> <%=MyCache.GetCurrencyUnit%>
                         ����˷Ѳ�����<asp:TextBox CssClass="textbox" ID="TxtProvinceLimitFreight" Width="30px" runat="server"></asp:TextBox> <%=MyCache.GetCurrencyUnit%>
                         <br />
                         <asp:CheckBox ID="CkbProvinceIsCod" runat="Server" Text="֧�ֻ�������" />
                         </td>
                           </tr>
                           </table>
                     </td>
                     </tr>
                     <tr>
                     <td>
                        <div style="padding:2px;font-weight:bold;background:#DEEDF8">
                          ����ʡ�˷����� <input type="button" class="button" value="����һ�������˷�ѡ��" onclick="doadd(1)"/>
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
                         //alert('���ֻ�ܼ�100��ѡ��!');
                         //return ;
                        }
                        for(i=1;i<=num;i++)
                        {
                        j=i+oldi;
                        str=str+"<table width=100% style='border:1px solid #999999;margin-bottom:10px' border=0 cellspacing=1 cellpadding=3><tr><td width='30' height=30> <div align=center><input type=hidden name='id"+j+"' value=0>"+j+"</div></td><td>���͵�����<input type=text id='item"+j+"' name='item"+j+"' readonly onclick='getProvince(this);' size='60'></td><td width=100> <div align=center><input type=checkbox name='iscod"+j+"' style='text-align:center' value=1>֧�ֻ�������</div></td></tr>";
                        str=str+"<tr><td></td><td colspan=2 height=30>�����˷ѣ�<input name='firstfreight"+j+"' class='textbox' type='text' size='4' style='text-align:center'> <%=MyCache.GetCurrencyUnit%> �����˷ѣ�<input name='continuefreight"+j+"' type='text' class='textbox' size='4' style='text-align:center'> <%=MyCache.GetCurrencyUnit%> ����˷Ѳ�������<input name='limitfreight"+j+"' class='textbox' type='text' size='4' style='text-align:center'> <%=MyCache.GetCurrencyUnit%></td></tr></table>"
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
                     <strong>��ϸ���ܣ�</strong></td>
                 <td class="righttd" style="height: 30px">
                 <asp:TextBox ID="Content" TextMode="multiLine" style="width:90%;height:200px" runat="server"></asp:TextBox>
                <% Kesion.APPCode.EditorAPI.EchoEditor("editor", this.Content.ClientID, "Basic");%>

                 </td>
             </tr>
            
             <tr>
                 <td align="right" class="lefttd" style="width: 198px; height: 30px">
                     <strong>״̬��<br />
                     </strong><span style="color: #0000ff">ֻ������״̬�Ĳſ���ʹ��</span></td>
                 <td class="righttd" style="height: 30px">
                     <asp:RadioButtonList ID="RdbStatus" runat="server" RepeatDirection="Horizontal">
                         <asp:ListItem Selected="True" Value="1">����</asp:ListItem>
                         <asp:ListItem Value="0">����</asp:ListItem>
                     </asp:RadioButtonList></td>
             </tr>             
             <tr>
                 <td align="right" class="lefttd" style="width: 198px; height: 30px">
                     <strong>���ó�Ĭ�����÷�ʽ��<br />
                     </strong></td>
                 <td class="righttd" style="height: 30px">
                    <asp:CheckBox ID="CkbIsDefault" runat="server" Text="Ĭ��" />
                     </td>
             </tr>             
             
             <tr>
                 <td align="right" class="lefttd" style="width: 198px; height: 30px">
                     <strong>�˷Ѵ������ã�</strong>
                     </td>
                 <td class="righttd" style="height: 30px">
                 <asp:RadioButtonList ID="RdbPromotionType" runat="server">
                          <asp:ListItem Value="0" Selected="True">�����ô���</asp:ListItem>
                          <asp:ListItem Value="1">�ڱ��̳ǹ�����&lt;input class=textbox type=&quot;text&quot; style=&quot;width:60px;text-align:center;&quot; value=&quot;1000&quot; name=&quot;TxtOrderAmount1&quot; id=&quot;TxtOrderAmount1&quot; size=&quot;5&quot;&gt; ,���˷�</asp:ListItem>
                          <asp:ListItem Value="2">�ڱ��̳ǹ�����&lt;input class=textbox type=&quot;text&quot; style=&quot;width:60px;text-align:center;&quot; value=&quot;1000&quot; name=&quot;TxtOrderAmount2&quot; id=&quot;TxtOrderAmount2&quot; size=&quot;5&quot;&gt; ,����&lt;input class=textbox type=&quot;text&quot; style=&quot;width:60px;text-align:center;&quot; value=&quot;10&quot; name=&quot;TxtFreight1&quot; id=&quot;TxtFreight1&quot; size=&quot;5&quot;&gt;�˷�</asp:ListItem>
                          <asp:ListItem Value="3">�ڱ��̳ǹ�����&lt;input class=textbox type=&quot;text&quot; style=&quot;width:60px;text-align:center;&quot; value=&quot;1000&quot; name=&quot;TxtOrderAmount3&quot; id=&quot;TxtOrderAmount3&quot; size=&quot;5&quot;&gt; ,�����˷��ܶ�����&lt;input class=textbox type=&quot;text&quot; style=&quot;width:60px;text-align:center;&quot; value=&quot;10&quot; name=&quot;TxtFreight2&quot; id=&quot;TxtFreight2&quot; size=&quot;5&quot;&gt;ʱ���˷�</asp:ListItem>
                      </asp:RadioButtonList>
                 </td>
             </tr>
        </table>
        <br />
        <KS:Foot ID="Foot1" runat="server" OnSubmit="Foot1_Submit" SubmitButtonText="ȷ�����(0)" />
    
    </asp:Panel>
    

  </asp:Content>