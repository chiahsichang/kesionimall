<%@ Page Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.Admin_FormShowDetail" Title="�鿴�Զ�����ύ��ϸ" Codebehind="KS.FormShowDetail.aspx.cs" %>
<asp:Content ID="Content1" ContentPlaceHolderID="KSContent" Runat="Server">
    <KS:TopNav ID="TopNav1" runat="server" />

    <KS:KSGV ID="List" runat="server" CssClass="CTable" GridLines="None" OnRowCreated="List_RowCreated" OnRowDataBound="List_RowDataBound" PagerType="CustomNumeric" Width="99%" EmptyDataText="û���κ�����!">
        <HeaderStyle CssClass="CTitle" />
        <EmptyDataRowStyle CssClass="emptycss" />
    </KS:KSGV>

    <KS:Page ID="Page1" runat="server" />

    <br />
    <table cellpadding="0" cellspacing="0" style="width: 100%">
            <tr>
                <td style="height: 25px">
                   &nbsp;<input type="checkbox" name="chkall" id="chkall" onclick="CheckAll(this.form);"/><label for="chkall">ȫ��ѡ��</label>
                   &nbsp;<asp:Button runat="server" ID="BtnDel" Text="����ɾ��" CssClass="button" 
                        onclick="BtnDel_Click" />
                   &nbsp;<asp:Button runat="server" ID="Button3" Text="��������" CssClass="button" 
                        onclick="Button3_Click" />
                   &nbsp;<asp:Button runat="server" ID="Button4" Text="��������" CssClass="button" 
                        onclick="Button4_Click" />
                    &nbsp;<asp:Button id="Button1" runat="server" Text="������Excel" OnClick="Button1_Click"></asp:Button>
                    <asp:Button ID="Button2" runat="server" Text="��ӡ��ҳ" CausesValidation="False" OnClientClick="window.print();return false;" UseSubmitBehavior="False" /></td>
                </td>
            </tr>
        </table>
</asp:Content>

