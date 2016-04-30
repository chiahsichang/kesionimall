<%@ Control Language="C#" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.Shop.InvoiceControl" Codebehind="InvoiceControl.ascx.cs" %>
<%@ Import Namespace="Kesion.Cache"%>

<KS:TopNav ID="TopNav1" runat="server" Text="订单开发票处理" />
<table class="Border" cellSpacing=1 cellPadding=2 width="99%" align="center" border=0>
   
    <tr class=tdbg>
      <td align=right width="15%">客户姓名：</td>
      <td>
          <asp:Label ID="LabUserName" runat="server" Text=""></asp:Label>
          (<asp:Label ID="LabClientName" runat="server" Text=""></asp:Label>)</td>
        
    </tr>

    <tr class=tdbg>
      <td align=right width="15%">支付内容：</td>
      <td>
        <table cellSpacing=2 cellPadding=0 border=0>
          <tr class=tdbg>
            <td align=right width="15%">订单编号：</td>
            <td><asp:Label ID="LabOrderID" runat="server" Text=""></asp:Label></td>
            <td>&nbsp;</td>
          </tr>
          <tr class=tdbg>
            <td align=right width="15%">订单金额：</td>
            <td>
               <span style="font-weight:bold;font-size:16px;color:brown">  <%=MyCache.GetCurrencySymbol %><asp:Label ID="LabOrderTotalPrice" runat="server" Text=""></asp:Label></span> <%=MyCache.GetCurrencyUnit %>
               &nbsp;已 付 款：<span style="font-weight:bold;font-size:16px;color:greeh">  <%=MyCache.GetCurrencySymbol %><asp:Label ID="LabMoneyReceipt" runat="server" Text=""></asp:Label></span> <%=MyCache.GetCurrencyUnit %>
               </td>
            <td></td>
          </tr>

        </table>
      </td>
    </tr>
    <tr class=tdbg>
      <td align=right width="15%">
          发票信息：</td>
      <td>
          需要发票：<asp:Label ID="LabNeedInvoice" runat="server"></asp:Label><br />
          <asp:Label ID="LabInoviceTitle" runat="server"></asp:Label><br />
          <%if (!string.IsNullOrEmpty(dr["remark"].ToString())){ %>
          订单附言：<%=dr["remark"].ToString() %>
          <%} %>
      </td>
    </tr>
    
    <tr class=tdbg>
      <td align=right width="15%">
          开票日期：</td>
      <td>
          <asp:TextBox  CssClass="textbox" ID="TxtInvoiceDate" runat="server"></asp:TextBox>
          格式:YYYY-MM-DD hh:mm:ss</td>
    </tr>


    <tr class="tdbg">
      <td align="right" width="15%">
          开 票 人：</td>
      <td>
      <asp:TextBox  CssClass="textbox" ID="TxtHandlerName" runat="server" Width="200px"></asp:TextBox>
    </tr>
    <tr class="tdbg">
      <td align="right" width="15%" style="height: 23px">
          发票类型：</td>
      <td style="height: 23px">
          <asp:DropDownList ID="DrpInvoiceType" runat="server">
          <asp:ListItem Value="地税普通发票">地税普通发票</asp:ListItem>
          <asp:ListItem Value="国税普通发票">国税普通发票</asp:ListItem>
          <asp:ListItem Value="增值税专用发票">增值税专用发票</asp:ListItem>
          </asp:DropDownList>
    </tr>
    <tr class="tdbg">
        <td align="right" width="15%">
            发票号码：</td>
        <td>
            <asp:TextBox  CssClass="textbox" ID="TxtInvoiceNum" runat="server" Width="200px"></asp:TextBox></td>
    </tr>
    <tr class="tdbg">
        <td align="right" width="15%">
            发票抬头：</td>
        <td>
            <asp:TextBox  CssClass="textbox" ID="TxtInvoiceTitle" runat="server" Width="200px"></asp:TextBox></td>
    </tr>
    <tr class="tdbg">
        <td align="right" width="15%">
            发票金额：</td>
        <td>
            <asp:TextBox  CssClass="textbox" ID="TxtMoneyTotal" runat="server" Width="60px"></asp:TextBox>
             <%=MyCache.GetCurrencyUnit %></td>
    </tr>
    <tr class="tdbg">
        <td align="right" width="15%">
            发票内容：</td>
        <td>
            <asp:TextBox  CssClass="textbox" ID="TxtInvoiceContent" runat="server" Width="200px"></asp:TextBox></td>
    </tr>
    <tr class=tdbg>
      <td align=right width="15%">通知会员：</td>
      <td>
      <asp:CheckBox ID="SendMessageToUser" runat="server" Checked="true" Text="同时使用站内短信通知会员发票已开出" /><br />
      <asp:CheckBox ID="SendMailToUser" runat="server" Checked="true" Text="同时发送邮件通知会员发票已开出" />
      <%
       if (MyCache.GetCacheConfig(32) == "1")
        {  
      %><br />
      <asp:CheckBox ID="SendMobileToUser" runat="server" Checked="true" Text="同时发送手机短信通知会员发票已开出" /></td>
      <%} %>
      
    </tr>


    <tr class=tdbg align=middle>
      <td colSpan=2 height=30>
      <asp:Button ID="BtnSave" runat="server" Text="确定开票" CssClass="button" OnClick="BtnSave_Click" />
 &nbsp;
        <Input class=button onclick="parent.box.close();" type=button value=取消返回 name=Submit></td>
    </tr>
  </table>
