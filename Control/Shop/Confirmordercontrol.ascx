<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Confirmordercontrol.ascx.cs" Inherits="Kesion.NET.WebSite.Shop.ConfirmOrderControl" %>

<table class="Border" style="margin-top:5px" height="100%" cellSpacing=1 cellPadding=2 width="99%" align="center" border=0>
    <tr class="Title" align=middle>
      <td colSpan=2 height=25><B>确认订单</B></td>
    </tr>
    <tr class=tdbg>
      <td height="100" align=right width="25%">确认选项：</td>
      <td>
      <asp:CheckBox ID="cbksendmessage" Checked="true" runat="server" Text="同时使用站内短信通知会员订单已经确认" />
      <br />
      <asp:CheckBox  Checked="true" ID="cbksendmail" runat="server" Text="同时发送邮件通知会员订单已经确认" />
      </td>
        
    </tr>

    <tr class=tdbg align=middle>
      <td colSpan=2 height=50>
      <asp:Button ID="BtnSave" runat="server" Text="确定订单" CssClass="button" OnClick="BtnSave_Click" />
 &nbsp;
        <Input class=button onclick="parent.box.close();" type=button value=取消返回 name=Submit></td>
    </tr>
  </table>
