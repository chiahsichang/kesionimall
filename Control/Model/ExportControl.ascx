<%@ Control Language="C#" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.ExportControl" Codebehind="ExportControl.ascx.cs" %>
<KS:TopNav ID="TopNav1" runat="server" />
    
    <asp:Panel ID="Panel1" runat="server" Width="100%">
    <table  width="98%" align="center" border="0" cellpadding="1" cellspacing="1" class="CTable">
		<tr>
			<td align='right' class='lefttd'><strong>ѡ��Ҫ������ģ�ͣ�</strong></td>
			<td class="righttd">
			  <table border="0" width="100%">
			  <tr>
			   <td width="270">
			   <asp:ListBox ID="LstModelID" runat="server" Rows="14" SelectionMode="Multiple" Width="250px"></asp:ListBox>
</td>
			   <td><asp:Button ID="BtnSelectAll" runat="server" CssClass="button" Text="ȫ��ѡ��" OnClick="BtnSelectAll_Click" /><br />
                   <br />
                <asp:Button ID="BtnUnSelect" runat="server" CssClass="button" Text="ȡ��ѡ��" OnClick="BtnUnSelect_Click" /></td>
			  </tr>
			  </table>
                
                
            </td>
	   </tr>
       <tr>
			<td align='right' class='lefttd'><strong>�������ݿ�·����</strong></td>
			<td class="righttd">
			&nbsp;<asp:TextBox CssClass="textbox" ID="TxtDataPath" runat="server" Text="../../App_Data/Model.Mdb" Width="260px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="TxtDataPath" runat="server" ErrorMessage="�����뵼�������ݿ�����!" Display="Dynamic"></asp:RequiredFieldValidator></td>       
       </tr>
       
       <tr>
			<td align='right' class='lefttd'><strong>ɾ��Ŀ����¼��</strong></td>
			<td class="righttd">
                <asp:CheckBox ID="ChkDelData" runat="server" Text="ɾ��" Checked="true" />
			</td>       
       </tr>
       
	</table>      
	<br />
	      <KS:Foot ID="Foot1" runat="server" OnSubmit="Foot1_Submit" />
</asp:Panel>