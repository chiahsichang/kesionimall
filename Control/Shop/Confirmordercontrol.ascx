<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Confirmordercontrol.ascx.cs" Inherits="Kesion.NET.WebSite.Shop.ConfirmOrderControl" %>

<table class="Border" style="margin-top:5px" height="100%" cellSpacing=1 cellPadding=2 width="99%" align="center" border=0>
    <tr class="Title" align=middle>
      <td colSpan=2 height=25><B>ȷ�϶���</B></td>
    </tr>
    <tr class=tdbg>
      <td height="100" align=right width="25%">ȷ��ѡ�</td>
      <td>
      <asp:CheckBox ID="cbksendmessage" Checked="true" runat="server" Text="ͬʱʹ��վ�ڶ���֪ͨ��Ա�����Ѿ�ȷ��" />
      <br />
      <asp:CheckBox  Checked="true" ID="cbksendmail" runat="server" Text="ͬʱ�����ʼ�֪ͨ��Ա�����Ѿ�ȷ��" />
      </td>
        
    </tr>

    <tr class=tdbg align=middle>
      <td colSpan=2 height=50>
      <asp:Button ID="BtnSave" runat="server" Text="ȷ������" CssClass="button" OnClick="BtnSave_Click" />
 &nbsp;
        <Input class=button onclick="parent.box.close();" type=button value=ȡ������ name=Submit></td>
    </tr>
  </table>
