<%@ Page Language="C#" EnableEventValidation="false"  MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.Admin.Shop.Admin_ShopSpecial" Title="��Ʒ������" Codebehind="KS.ShopSpecial.aspx.cs" %>
<%@ Import Namespace="Kesion.BLL" %>
<asp:Content ID="Content1" ContentPlaceHolderID="KSContent" Runat="Server">
     <asp:Panel ID="SpecificationList" runat="server" Width="100%">
      <div id="manage_top" class="menu_top_fixed">
        <ul>
           <li id='p1'><asp:LinkButton ID="addSpecification" runat="server" OnClick="addSpecification_Click"><b></b>��ӹ����</asp:LinkButton></li>
           <li id='p4'><asp:LinkButton ID="editSpecification" runat="server" OnClick="editSpecification_Click"><b></b>�༭</asp:LinkButton></li>
           <li id='p3'><asp:LinkButton ID="delSpecificationBtn" runat="server" OnClick="delSpecification_Click"><b></b>ɾ��</asp:LinkButton></li>
           <li id='p8'><a href="KS.ShopSpecification.aspx"><b></b>������Թ���</a></li>
           <li id='p5'><a href="KS.ShopSpecialBindClass.aspx"><b></b>��Ŀ�����󶨹����</a></li>
        </ul>
      </div>   
       <div class="menu_top_fixed_height"></div>
       <KS:KSGV ID="list" cssclass="CTable" runat="server" AutoGenerateColumns="False" Width="99%" EmptyDataText="û������κ���Ʒ�����!" GridLines="None" OnRowDataBound="list_RowDataBound" OnRowCommand="list_RowCommand" OnRowCreated="list_RowCreated">
          <Columns>
              <asp:TemplateField HeaderText="<input type='checkbox' name='chkall' id='chkall' onclick='CheckAll(this.form);'/>">
                <itemstyle horizontalalign="Center" width="50px" />
                <itemtemplate>
                    <input type="checkbox"  name="ids" id="ids" value='<%#Eval("id") %>' />
                </itemtemplate>
              </asp:TemplateField>
             <asp:TemplateField HeaderText="���������">
              <itemstyle Width="160px"></itemstyle>
             <itemtemplate>
             <%# Eval("Title") %> 
             </itemtemplate>
             </asp:TemplateField> 
             <asp:TemplateField HeaderText="�󶨹��������">
             <itemstyle/>
             <itemtemplate>
             <span class="tips"><%# GetBindClassList(Convert.ToInt16(Eval("id"))) %></span>
             </itemtemplate>
             </asp:TemplateField>
             
            <asp:TemplateField HeaderText="��������">
              <itemstyle width="30px" horizontalalign="Center"/>
              <itemtemplate>
               <asp:LinkButton ID="LKOrder" ToolTip="��������" CssClass="order" runat="server" commandargument=<%#Eval("id") %> commandname="order">����</asp:LinkButton>
              </itemtemplate>
            </asp:TemplateField>
                
            <asp:TemplateField HeaderText="�༭">
              <itemstyle width="30px" horizontalalign="Center"/>
              <itemtemplate>
               <asp:LinkButton ID="LinkButton1" CssClass="edit" ToolTip="�༭" runat="server" commandargument=<%#Eval("id") %> commandname="modify"></asp:LinkButton>
              </itemtemplate>
            </asp:TemplateField>
             
            <asp:TemplateField HeaderText="ɾ��">
                <itemstyle horizontalalign="Center" Width="30px" />
               <itemtemplate>
                <asp:LinkButton CssClass="delete" ToolTip="ɾ��" runat="server" id="delete" commandargument=<%#Eval("id") %> commandname="del"></asp:LinkButton>
               </itemtemplate>
            </asp:TemplateField>
          </Columns>
            <HeaderStyle CssClass="CTitle" />
            <EmptyDataRowStyle CssClass="emptycss" />
      </KS:KSGV>
       <KS:Page ID="Page1" runat="server" />
    </asp:Panel>
    
    <asp:Panel ID="SpecificationManage" runat="server" Width="100%" Visible="false">
        <KS:TopNav ID="TopNav1" runat="server" />
       <script>
        function CheckForm() {
   
	        if (jQuery('#<%=this.TxtTitle.ClientID %>').val()==''){
	            KesionJS.Alert( '��������Ʒ��������ƣ�', "jQuery('#<%=this.TxtTitle.ClientID %>').focus()");
	          return false;
	        }
	
	        if (jQuery("#<%=this.LsbSpecialItems.ClientID%> option:selected").val()==undefined){
	            KesionJS.Alert('��ѡ��󶨵Ĺ�����ԣ�', "jQuery('#<%=this.LsbSpecialItems.ClientID%>').focus()");
	         return false;
        }

        return true;
        }
        </script>
        
        <table width="99%" align="center" border="0" cellpadding="1" cellspacing="1" class="CTable"> 
          <tr>
            <td class="lefttd" height="30" align="right" style="width: 198px"><strong>��������ƣ�</strong></td>
            <td class="righttd"><asp:TextBox CssClass="textbox" ID="TxtTitle" runat="server"></asp:TextBox>
                <span class="tips">��:��װ�����ֻ������</span>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TxtTitle"
                    ErrorMessage="��������Ʒ���������!"></asp:RequiredFieldValidator>
            </td>
          </tr>

           
            <tr>
                <td align="right" class="lefttd" height="30" style="width: 198px">
                    <strong><span style="background-color: #f0f9fe">�󶨹������</span>��</strong></td>
                <td class="righttd">
                    <asp:ListBox ID="LsbSpecialItems" runat="server" Width="250px" Height="200px" SelectionMode="Multiple">

                    </asp:ListBox>
                    <a href="KS.ShopSpecification.aspx">����������</a>
                  
                    <br />
                    ˵����<br />
                    <span class="tips">
                     1����Crtl��Shife��ѡ,���ֻ��ͬʱ��������������<br />
                     2���󶨹���������Ӧ�þ�����Ҫ�����޸��ˣ�����Ӱ������ӵ���Ʒ������ԣ�
                    </span>
                 </td>
            </tr>
            
           
		</table>
	  	   <input type='hidden' name="num" id="num" value="<%=num%>"/>
	  	   
	  	   
                </td>
            </tr>
            
           
        </table>
      <br />
      <KS:Foot ID="Foot1" runat="server" OnSubmit="Foot1_Submit" />
    </asp:Panel>


    <asp:Panel ID="PannelOrder" Visible="false" runat="server">
         <div id="manage_top" class="toptitle menu_top_fixed"><ul><li id='p9'><b></b><a href='KS.ShopSpecial.aspx'>����</a></li> [<%=groupName %>]����������</div><div class="menu_top_fixed_height"></div> 

         <KS:OrderJS ID="OrderJS1" runat="server" />
        <KS:KSGV ID="FieldListView" runat="server" AutoGenerateColumns="False" GridLines="None"
            OnRowDataBound="FieldListView_RowDataBound" EmptyDataText="û�й�������" PagerType="CustomNumeric" Width="99%" CssClass="CTable" EnableTheming="True">
            <Columns>
                 <asp:BoundField DataField="ID" HeaderText="ID��">
                    <itemstyle width="50px" ForeColor="#999999" horizontalalign="Center" />
                </asp:BoundField>
                 <asp:BoundField DataField="Title" HeaderText="��������">
                    <itemstyle width="100px" ForeColor="#999999" horizontalalign="Center" />
                </asp:BoundField>
                <asp:TemplateField HeaderText="����">
                    <itemstyle  horizontalalign="left"  />
                    <itemtemplate>
                     <asp:DropDownList id="orderid" datasource="<%#bindorder() %>" runat="server"></asp:DropDownList>
                    </itemtemplate>
                 </asp:TemplateField>
            </Columns>
            <HeaderStyle CssClass="CTitle" />
        </KS:KSGV>
         <div style="margin:20px;text-align:center;">
        <asp:Button ID="BtnBatchSave" runat="server" Text="������������" CssClass="button" OnClick="BtnBatchSave_Click" />
         </div>
    </asp:Panel>
    
</asp:Content>

