<%@ Page Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.Admin_Content_CommentShow" Title="Untitled Page" Codebehind="KS.CommentShow.aspx.cs" %>
<asp:Content ID="Content1" ContentPlaceHolderID="KSContent" Runat="Server">
<table id="tbs0" width="99%" align="center" border="0" cellpadding="1" cellspacing="1" class="CTable"> 
          <tr>
            <td class="lefttd" height="30" align="right" style="width: 155px"><b>�������⣺</b></td>
            <td class="righttd">
                <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label></td>
          </tr>
    <tr>
        <td align="right" class="lefttd" height="30" style="width: 155px">
            <strong>�������ǳƣ�</strong></td>
        <td class="righttd">
            <asp:Label ID="Label2" runat="server" Text="Label"></asp:Label></td>
    </tr>
    <tr>
        <td align="right" class="lefttd" style="width: 155px; height: 30px">
            <strong>��������ݣ�</strong></td>
        <td class="righttd" style="height: 30px">
            <asp:Label ID="Label3" runat="server" Text="Label"></asp:Label></td>
    </tr>
    <tr>
        <td align="right" class="lefttd" style="width: 155px; height: 30px">
            <strong>������IP��ַ��</strong></td>
        <td class="righttd" style="height: 30px">
            <asp:Label ID="Label4" runat="server" Text="Label"></asp:Label></td>
    </tr>
    <tr>
        <td align="right" class="lefttd" height="30" style="width: 155px">
            <strong>����ʱ�䣺</strong></td>
        <td class="righttd">
            <asp:Label ID="Label5" runat="server" Text="Label"></asp:Label></td>
    </tr>
    <tr>
        <td align="right" class="lefttd" height="30" style="width: 155px">
            <strong>�û��۵������</strong></td>
        <td class="righttd">
            <asp:Label ID="Label6" runat="server" Text="Label"></asp:Label></td>
    </tr>
    <tr>
        <td align="right" class="lefttd" height="30" style="width: 155px">
            <strong>������ϸ���ݣ�</strong></td>
        <td class="righttd">
            <asp:Label ID="Label7" runat="server" Height="150px" Text="Label" Width="98%"></asp:Label></td>
    </tr>
</table>
<div style="margin:8px;text-align:center">
    <asp:Button ID="Button1" runat="server" Text="�������(V)" AccessKey="V" CssClass="button" OnClick="Button1_Click" CausesValidation="False" UseSubmitBehavior="False" />
    &nbsp;<input type="button" value="�رմ���(C)" onclick="parent.box.close();" class="button" accesskey="C" /></div>
</asp:Content>

