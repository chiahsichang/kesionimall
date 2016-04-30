<%@ Control Language="C#" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.Shop.BankPayControl" Codebehind="BankPayControl.ascx.cs" %>
<%@ Import Namespace="Kesion.Cache"%>
<KS:TopNav ID="TopNav1" runat="server" Text="添 加 订 单 汇 款 信 息" />
<table class="Border" cellSpacing=1 cellPadding=2 width="99%" align="center" border=0>
    <tr class="Title" align=middle>
      <td colSpan=2 height=25><B>添 加 订 单 汇 款 信 息</B></td>
    </tr>
    <tr class=tdbg>
      <td align=right width="15%">客户姓名：</td>
      <td><asp:Label ID="LabClientName" runat="server" Text=""></asp:Label></td>
        
    </tr>
    <tr class=tdbg>
      <td align=right width="15%">用户名：</td>
      <td><asp:Label ID="LabUserName" runat="server" Text=""></asp:Label></td>
    </tr>
    <tr class=tdbg>
      <td align=right width="15%">支付内容：</td>
      <td>
        <table cellSpacing="2" cellPadding="0" border="0">
          <tr class=tdbg>
            <td align=right width="15%">订单编号：</td>
            <td><asp:Label ID="LabOrderID" runat="server" Text=""></asp:Label></td>
            <td>&nbsp;</td>
          </tr>
          <tr class=tdbg>
            <td align=right width="15%">订单金额：</td>
            <td>
               <span style="font-weight:bold;font-size:16px;color:brown">  <%=MyCache.GetCurrencySymbol %><asp:Label ID="LabOrderTotalPrice" runat="server" Text=""></asp:Label></span> <%=MyCache.GetCurrencyUnit %></td>
            <td></td>
          </tr>
          <tr class=tdbg>
            <td align=right width="15%">已 付 款：</td>
            <td>
              <span style="font-weight:bold;font-size:16px;color:green"> <%=MyCache.GetCurrencySymbol %><asp:Label ID="LabMoneyReceipt" runat="server" Text=""></asp:Label></span> <%=MyCache.GetCurrencyUnit %></td>
            <td>&nbsp;</td>
          </tr>
        </table>
      </td>
    </tr>
    <tr class=tdbg>
      <td align=right width="15%">汇款日期：</td>
      <td>
          <asp:TextBox  CssClass="textbox" ID="TxtPayDate" runat="server"></asp:TextBox>
          格式:YYYY-MM-DD hh:mm:ss</td>
    </tr>
    <tr class=tdbg>
      <td align=right width="15%">汇款金额：</td>
      <td>
          <%=MyCache.GetCurrencySymbol %><asp:TextBox  CssClass="textbox" ID="TxtMoney" MaxLength="10" runat="server" Width="54px"></asp:TextBox> <%=MyCache.GetCurrencyUnit %></td>
    </tr>
    <tr class=tdbg>
      <td align=right width="15%">备注：</td>
      <td>
      <asp:TextBox  CssClass="textbox" ID="TxtRemark" runat="server" Width="350px"></asp:TextBox>
    </tr>
     <tr class="tdbg">
      <td align="right" width="15%">操作员：</td>
      <td>
      <asp:TextBox  CssClass="textbox" ID="TxtHandlerName" runat="server" Width="200px"></asp:TextBox>
    </tr>
    <tr class=tdbg>
      <td align=right width="15%">通知会员：</td>
      <td>
      <asp:CheckBox ID="SendMessageToUser" runat="server" Checked="true" Text="同时使用站内短信通知会员已经支付成功" /><br />
      <asp:CheckBox ID="SendMailToUser" runat="server" Checked="true" Text="同时发送邮件通知会员已经支付成功" /><br />
      <%
       if (MyCache.GetCacheConfig(32) == "1")
        {  
      %>
      <asp:CheckBox ID="SendMobileToUser" runat="server" Checked="true" Text="同时发送手机短信通知会员已经支付成功" /></td>
      <%} %>
    </tr>
    <tr class=tdbg>
      <td colSpan=2 height=30><B><font color=#ff0000>注意：汇款信息一旦录入，就不能再修改或删除！所以在保存之前确认输入无误！</font></B></td>
    </tr>
    <tr class=tdbg align=middle>
      <td colSpan=2 height=30>
      <asp:Button ID="BtnSave" runat="server" Text="保存汇款信息" CssClass="button" OnClick="BtnSave_Click" />
 &nbsp;
        <Input class=button onclick="parent.box.close();" type=button value=取消返回 name=Submit></td>
    </tr>
  </table>
