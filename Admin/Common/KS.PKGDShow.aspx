<%@ Page Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.Admin_Content_PDGDShow" Title="Untitled Page" Codebehind="KS.PKGDShow.aspx.cs" %>
<asp:Content ID="Content1" ContentPlaceHolderID="KSContent" Runat="Server">
<table id="tbs0" width="99%" align="center" border="0" cellpadding="1" cellspacing="1" class="CTable"> 
          <tr>
            <td class="lefttd" height="30" align="right" style="width: 155px"><b>评论主题：</b></td>
            <td class="righttd">
                <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label></td>
          </tr>
    <tr>
        <td align="right" class="lefttd" height="30" style="width: 155px">
            <strong>PK用户昵称：</strong></td>
        <td class="righttd">
            <asp:Label ID="Label2" runat="server" Text="Label"></asp:Label></td>
    </tr>
    <tr>
        <td align="right" class="lefttd" style="width: 155px; height: 30px">
            <strong>PK用户身份：</strong></td>
        <td class="righttd" style="height: 30px">
            <asp:Label ID="Label3" runat="server" Text="Label"></asp:Label></td>
    </tr>
    <tr>
        <td align="right" class="lefttd" style="width: 155px; height: 30px">
            <strong>PK用户IP地址：</strong></td>
        <td class="righttd" style="height: 30px">
            <asp:Label ID="Label4" runat="server" Text="Label"></asp:Label></td>
    </tr>
    <tr>
        <td align="right" class="lefttd" height="30" style="width: 155px">
            <strong>PK时间：</strong></td>
        <td class="righttd">
            <asp:Label ID="Label5" runat="server" Text="Label"></asp:Label></td>
    </tr>
    <tr>
        <td align="right" class="lefttd" height="30" style="width: 155px">
            <strong>PK观点情况：</strong></td>
        <td class="righttd">
            <asp:Label ID="Label6" runat="server" Text="Label"></asp:Label></td>
    </tr>
</table>
<div style="margin:8px;text-align:center">
    <asp:Button ID="Button1" runat="server" Text="浏览PK主题(V)" AccessKey="V" CssClass="button" OnClick="Button1_Click" CausesValidation="False" UseSubmitBehavior="False" />
    &nbsp;<input type="button" value="关闭窗口(C)" onclick="parent.box.close()" class="button" accesskey="C" /></div>
</asp:Content>

