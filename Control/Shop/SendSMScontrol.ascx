<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="SendSMScontrol.ascx.cs" Inherits="Kesion.NET.WebSite.Shop.SendSMSOrderControl" %>
<%@ Import Namespace="Kesion.Cache"%>

<table class="Border" style="margin-top:5px" height="100%" cellSpacing=1 cellPadding=2 width="99%" align="center" border=0>
    <tr class="Title" align=middle>
      <td colSpan=2 height=25><B>发送消息提醒客户付款</B></td>
    </tr>
    <tr class=tdbg>
      <td align=right width="12%">邮件标题：</td>
      <td>
       <asp:TextBox ID="TxtTitle" CssClass="textbox" runat="server" Width="400px"></asp:TextBox>
       </td>
        
    </tr>
    <tr class=tdbg>
      <td align=right width="12%">发送内容：</td>
      <td>
       <asp:TextBox TextMode="MultiLine" ID="TxtRemark" runat="server" style='width:80%;height:200px'></asp:TextBox>
     <% Kesion.APPCode.EditorAPI.EchoEditor("editor", this.TxtRemark.ClientID, "Basic");%>

       </td>
        
    </tr>
    
    <tr class=tdbg>
      <td height="50" align=right>发送选项：</td>
      <td>
            <asp:CheckBox ID="SendMessageToUser" runat="server" Checked="true" Text="站内短信催单" />
      <asp:CheckBox ID="SendMailToUser" runat="server" Checked="true" Text="发送邮件催单" />
     <%
       if (MyCache.GetCacheConfig(32) == "1")
        {  
      %>
      <asp:CheckBox ID="SendMobileToUser" runat="server" Checked="true" Text="发送手机短信催单" />（手机短信内容）
     <br /> 手 机 号：<asp:TextBox CssClass="textbox" ID="TxtMobile" runat="server" Width="200px" /><br />
            短信内容：<asp:TextBox TextMode="MultiLine" ID="TxtSmsContent" CssClass="textbox" runat="server" style='width:400px;height:50px'></asp:TextBox>
      <%} %>
      </td>
        
    </tr>
    

    <tr class=tdbg align=middle>
      <td colSpan=2 height=50>
      <asp:Button ID="BtnSave" runat="server" Text="确定发送" CssClass="button" OnClick="BtnSave_Click" />
 &nbsp;
        <Input class=button onclick="parent.box.close();" type=button value=取消返回 name=Submit></td>
    </tr>
  </table>
