<%@ Page Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.Admin.Shop.Admin_ShopPayemntType" Title="֧����ʽ����" Codebehind="KS.ShopPaymentType.aspx.cs" %>
<%@ Import Namespace="Kesion.Publics" %>
<asp:Content ID="Content1" ContentPlaceHolderID="KSContent" Runat="Server">
    <asp:Panel ID="listPanel" runat="server" Width="100%">
      <div id="manage_top" class="menu_top_fixed">
        <ul>
        <li id='p1'><asp:LinkButton ID="addbutton" runat="server" OnClick="addbutton_Click"><b></b>����֧����ʽ</asp:LinkButton></li>
        
        <li id='p4'><asp:LinkButton ID="editbutton" runat="server" OnClick="editTask_Click"><b></b>�༭֧����ʽ</asp:LinkButton></li>
        <li id='p3'><asp:LinkButton ID="delbutton" runat="server" OnClick="delTask_Click"><b></b>ɾ��֧����ʽ</asp:LinkButton></li>
        </ul>
      </div>     
 <div class="menu_top_fixed_height"></div>
    <div>
        <KS:OrderJS ID="OrderJS1" runat="server" />
        <KS:KSGV ID="PaymentListView" cssclass="CTable" runat="server" AutoGenerateColumns="False" DataKeyNames="FieldID" GridLines="None"
            OnRowDataBound="FieldListView_RowDataBound" PagerType="CustomNumeric" Width="99%" EnableTheming="True" OnRowCommand="FieldListView_RowCommand" EmptyDataText="����û������κ�֧����ʽ,��<a href='?action=add'>������</a>!">
            <Columns>
                <asp:TemplateField HeaderText="ѡ��">
                <itemstyle horizontalalign="Center" width="50px" />
                <itemtemplate>
                    <input type="checkbox"  name="ids" id="ids" value="<%#Eval("TypeID") %>" />
                </itemtemplate>
              </asp:TemplateField>
                <asp:TemplateField HeaderText="����">
                    <itemtemplate>
                     <asp:HiddenField runat="server" id="hidTypeID" value='<%#Eval("TypeID") %>'></asp:HiddenField>
                     <asp:DropDownList id="orderid" datasource="<%#bindorder() %>" runat="server"></asp:DropDownList>
                     
</itemtemplate>
                    <headerstyle height="18px"/>
                    <itemstyle width="60px" horizontalalign="Center"  />
                </asp:TemplateField>
                  <asp:BoundField DataField="TypeName" HeaderText="����">
                </asp:BoundField>
                <asp:BoundField DataField="TypeFlag" HeaderText="����">
                <itemstyle width="130px" horizontalalign="Center" />
                </asp:BoundField>

                 <asp:TemplateField HeaderText="�Ƿ�����">
                  <itemstyle width="120px" horizontalalign="Center"/>
                  <itemtemplate>
                       <a href="?action=Set&fieldName=status&id=<%# Eval("TypeID") %>" <%# Convert.ToString(Eval("Status"))=="0"?"class='no' title='��'":"class='ok' title='��'" %>></a>
                  </itemtemplate>
                </asp:TemplateField> 

                 <asp:TemplateField HeaderText="�Ƿ�Ĭ��">
                  <itemstyle width="120px" horizontalalign="Center"/>
                  <itemtemplate>
                       <a href="?action=Set&fieldName=IsDefault&id=<%# Eval("TypeID") %>" <%# Convert.ToString(Eval("IsDefault"))=="0"?"class='no' title='��'":"class='ok' title='��'" %>></a>
                  </itemtemplate>
                </asp:TemplateField> 

         
                 <asp:TemplateField HeaderText="��ע">
                  <itemstyle horizontalalign="left" />
                <ItemTemplate>
                <span class="tips">
                  <%# Utils.ClearHtml(Eval("Intro").ToString()).Length > 50 ? Utils.ClearHtml(Eval("Intro").ToString()).Substring(0, 50) : Eval("Intro").ToString()%>
                </span>
                </ItemTemplate>
            </asp:TemplateField>

             <asp:TemplateField HeaderText="�༭">
              <itemstyle width="30px" horizontalalign="Center"/>
              <itemtemplate>
                     <asp:LinkButton ID="LinkButton1" CssClass="edit" ToolTip="�༭" runat="server" commandargument=<%#Eval("TypeID") %> commandname="modify"></asp:LinkButton>
              </itemtemplate>
            </asp:TemplateField>
             
            <asp:TemplateField HeaderText="ɾ��">
                <itemstyle horizontalalign="Center" width="30px"/>
               <itemtemplate>
                     <asp:LinkButton runat="server" CssClass="delete" ToolTip="ɾ��" id="delete" commandargument=<%#Eval("TypeID") %> commandname="del"></asp:LinkButton>
               </itemtemplate>
            </asp:TemplateField>

               
            </Columns>
            <HeaderStyle CssClass="CTitle" />
            <EmptyDataRowStyle CssClass="emptycss" />
        </KS:KSGV>
        <br />
        <asp:Panel ID="Panel1" runat="server" Height="30px" Width="739px">
            &nbsp;&nbsp;&nbsp;&nbsp;<input type="checkbox" name="chkall" id="chkall" onclick="CheckAll(this.form);"/><label for="chkall">ȫ��ѡ��</label><asp:Button ID="Button1" runat="server" Text="��������֧����ʽ����" OnClick="Button1_Click" />&nbsp;<br />
            </asp:Panel>
        &nbsp;
        </div>
     </asp:Panel>
    
    <asp:Panel ID="addPanel" runat="server" Width="100%" Visible="false">
    <script type="text/javascript">
       function CheckForm()
	        {
	         if(jQuery('#<%=this.TxtTypeName.ClientID %>').val()==''){
	            KesionJS.Alert('�����븶�ʽ���ƣ�',null);
	           return false;
	         }
	   }

	   function showPayMent()
       {
          if (jQuery("#<%=this.DrpTypeFlag.ClientID%> >option:selected").val()=="0"){
           jQuery("#showPayment").show();
           }
          else{
           jQuery("#showPayment").hide();
           }
       }

    
    </script>
        <KS:TopNav ID="TopNav1" runat="server" Text="���֧����ʽ" />
        &nbsp;
         <table width="99%" align="center" border="0" cellpadding="1" cellspacing="1" class="CTable"> 
             
            <tr>
                <td align="right" class="lefttd" height="30" style="width: 198px">
                    <strong>���ʽ���ƣ�</strong></td>
                <td class="righttd">
                    <asp:TextBox CssClass="textbox" ID="TxtTypeName" runat="server"></asp:TextBox>
                    <span style="color: #ff0066">*</span>  ��:����֧��,���֧���ȡ�<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TxtTypeName"
                        ErrorMessage="�����븶�ʽ����" Display="Dynamic"></asp:RequiredFieldValidator></td>
            </tr>
            <tr>
                <td align="right" class="lefttd" height="30" style="width: 198px">
                    <strong>�������ã�</strong></td>
                <td class="righttd">
                    &nbsp;<asp:DropDownList ID="DrpTypeFlag" runat="server" onchange="showPayMent()">
                        <asp:ListItem Value="0">����֧��</asp:ListItem>
                        <asp:ListItem Value="1">���֧��</asp:ListItem>
                        <asp:ListItem Value="2">��������</asp:ListItem>
                        <asp:ListItem Value="3">����</asp:ListItem>
                    </asp:DropDownList></td>
            
            </tr>
          <tbody id="showPayment">
            <tr>
                <td align="right" class="lefttd" height="30" style="width: 198px">
                    <strong>ѡ��֧��ƽ̨��</strong></td>
                <td class="righttd"><asp:CheckBoxList ID="CkbPayemntID" runat="server" RepeatColumns="5" RepeatDirection="Horizontal">
                    </asp:CheckBoxList></td>
            </tr>
          </tbody>
             <tr>
                 <td align="right" class="lefttd" style="width: 198px; height: 30px">
                     <strong>�ۿ��ʣ�</strong>
                     </td>
                 <td class="righttd" style="height: 30px">
                     &nbsp;<asp:TextBox CssClass="textbox" ID="TxtDiscount" Text="100" runat="server" Width="41px"></asp:TextBox>% ���ô�֧����ʽ���ܵ��ۿ�</td>
             </tr>
             <tr>
                 <td align="right" class="lefttd" style="width: 198px; height: 30px">
                     <strong>���ʽ���ܣ�</strong></td>
                 <td class="righttd" style="height: 30px">
                 <asp:TextBox ID="Content" TextMode="multiLine" style="width:80%;height:200px;" runat="server"></asp:TextBox>
                 <% Kesion.APPCode.EditorAPI.EchoEditor("editor", this.Content.ClientID, "Basic");%>
                 </td>
             </tr>
            
             <tr>
                 <td align="right" class="lefttd" style="width: 198px; height: 30px">
                     <strong>״̬�� </strong></td>
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
             
        </table>
        <br />
        <KS:Foot ID="Foot1" runat="server" OnSubmit="Foot1_Submit" SubmitButtonText="ȷ�����(0)" />
    
    </asp:Panel>
    

  </asp:Content>