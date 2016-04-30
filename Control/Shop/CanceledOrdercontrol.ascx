<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="CanceledOrdercontrol.ascx.cs" Inherits="Kesion.NET.WebSite.Shop.canceledOrderControl" %>
<%@ Import Namespace="Kesion.Cache"%>

<table class="Border" style="margin-top:5px" height="100%" cellSpacing=1 cellPadding=2 width="99%" align="center" border=0>
   
    <tr class=tdbg>
      <td align=right width="25%">作废原因：</td>
      <td>
       <asp:TextBox TextMode="MultiLine" ID="TxtRemark" CssClass="textbox" runat="server" style='width:280px;height:60px'></asp:TextBox>
      </td>
        
    </tr>
    <tr class=tdbg>
      <td align=right width="25%">操 作 员：</td>
      <td>
       <asp:TextBox ID="TxtAdminName" CssClass="textbox" runat="server" style='width:200px;'></asp:TextBox>
      </td>
        
    </tr>
    
    <tr class=tdbg>
      <td height="50" align=right width="25%">操作选项：</td>
      <td>
            <asp:CheckBox ID="SendMessageToUser" runat="server" Checked="true" Text="同时使用站内短信通知会员订单作废" /><br />
      <asp:CheckBox ID="SendMailToUser" runat="server" Checked="true" Text="同时发送邮件通知会员订单作废" /><br />
     <%
       if (MyCache.GetCacheConfig(32) == "1")
        {  
      %>
      <asp:CheckBox ID="SendMobileToUser" runat="server" Checked="true" Text="同时发送手机短信通知会员订单作废" /></td>
      <%} %>
      </td>
        
    </tr>
    

    <tr class=tdbg align=middle>
      <td colSpan=2 height=50>
      <asp:Button ID="BtnSave" runat="server" Text="确定作废" CssClass="button" OnClick="BtnSave_Click" />
 &nbsp;
        <Input class=button onclick="parent.box.close();" type=button value=取消返回 name=Submit></td>
    </tr>
  </table>
