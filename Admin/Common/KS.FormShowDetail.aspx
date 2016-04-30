<%@ Page Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.Admin_FormShowDetail" Title="查看自定义表单提交详细" Codebehind="KS.FormShowDetail.aspx.cs" %>
<asp:Content ID="Content1" ContentPlaceHolderID="KSContent" Runat="Server">
    <KS:TopNav ID="TopNav1" runat="server" />

    <KS:KSGV ID="List" runat="server" CssClass="CTable" GridLines="None" OnRowCreated="List_RowCreated" OnRowDataBound="List_RowDataBound" PagerType="CustomNumeric" Width="99%" EmptyDataText="没有任何数据!">
        <HeaderStyle CssClass="CTitle" />
        <EmptyDataRowStyle CssClass="emptycss" />
    </KS:KSGV>

    <KS:Page ID="Page1" runat="server" />

    <br />
    <table cellpadding="0" cellspacing="0" style="width: 100%">
            <tr>
                <td style="height: 25px">
                   &nbsp;<input type="checkbox" name="chkall" id="chkall" onclick="CheckAll(this.form);"/><label for="chkall">全部选中</label>
                   &nbsp;<asp:Button runat="server" ID="BtnDel" Text="批量删除" CssClass="button" 
                        onclick="BtnDel_Click" />
                   &nbsp;<asp:Button runat="server" ID="Button3" Text="批量采纳" CssClass="button" 
                        onclick="Button3_Click" />
                   &nbsp;<asp:Button runat="server" ID="Button4" Text="批量作废" CssClass="button" 
                        onclick="Button4_Click" />
                    &nbsp;<asp:Button id="Button1" runat="server" Text="导出到Excel" OnClick="Button1_Click"></asp:Button>
                    <asp:Button ID="Button2" runat="server" Text="打印本页" CausesValidation="False" OnClientClick="window.print();return false;" UseSubmitBehavior="False" /></td>
                </td>
            </tr>
        </table>
</asp:Content>

