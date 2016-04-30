<%@ Control Language="C#" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.importControl" Codebehind="importControl.ascx.cs" %>
<KS:TopNav ID="TopNav1" runat="server" />
<asp:Panel ID="Panel1" runat="server" Width="100%">
  <table  width="98%" align="center" border="0" cellpadding="1" cellspacing="1" class="CTable">
		<tr>
			<td align='right' class='lefttd'><strong>模型数据源路径：</strong></td>
            <td class="righttd">
            <asp:TextBox CssClass="textbox" ID="TxtDataSource" Text="../../App_Data/Model.mdb" runat="server" Width="250px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="TxtDataSource" runat="server" ErrorMessage="请输入数据源路径!" Display="dynamic"></asp:RequiredFieldValidator>
            
            </td>
       </tr>
 </table>
<br />
<KS:Foot ID="Foot1" runat="server" OnSubmit="Foot1_Submit" />
    
</asp:Panel>

<asp:Panel ID="Panel2" runat="server" Width="100%" Visible="false">
  <table  width="98%" align="center" border="0" cellpadding="1" cellspacing="1" class="CTable">
		<tr>
			<td align='right' class='lefttd'><strong>选择要导入的模型：</strong></td>
            <td class="righttd">
                <asp:DropDownList ID="DrpModelID" runat="server">
                </asp:DropDownList>
            </td>
       </tr>
 </table>
<br />
<KS:Foot ID="Foot2" runat="server" OnSubmit="Foot2_Submit"/>
</asp:Panel>

<asp:Panel ID="Panel3" runat="server" Width="100%" Visible="false">
  <table  width="98%" align="center" border="0" cellpadding="1" cellspacing="1" class="CTable">
		<tr>
			<td align='right' class='lefttd'><strong>导入后模型名称：</strong></td>
            <td class="righttd">
            <asp:TextBox CssClass="textbox" ID="TxtModelName" runat="server"></asp:TextBox>
                <span style="color: #ff0000">*</span><asp:RequiredFieldValidator ID="RequiredFieldValidator2" ControlToValidate="TxtModelName" runat="server" ErrorMessage="请输入模型名称"></asp:RequiredFieldValidator>
            </td>
       </tr>
		<tr>
			<td align='right' class='lefttd'><strong>导入后数据表名：</strong></td>
            <td class="righttd">
            KS_U_<asp:TextBox CssClass="textbox" ID="TxtModelTable" runat="server" Width="109px"></asp:TextBox><span
                               style="color: #ff0000">*</span><asp:RequiredFieldValidator ID="RequiredFieldValidator3"
                                   runat="server" ControlToValidate="TxtModelTable" ErrorMessage="数据表名称必须输入" Display="Dynamic"></asp:RequiredFieldValidator>
                           <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="TxtModelTable"
                               ErrorMessage="必须以字母开头，后面跟数字或字母的组合，长度在3-10个字符之间" ValidationExpression="[a-zA-Z]{1}[\d|(a-zA-Z)]{2,9}" Display="Dynamic"></asp:RegularExpressionValidator>
            <br />
                           说明：创建数据表后无法修改，并且用户创建的数据表以"KS_U_"开头
            
            </td>
       </tr>
 </table>
<br />
<KS:Foot ID="Foot3" runat="server" OnSubmit="Foot3_Submit"/>

</asp:Panel>