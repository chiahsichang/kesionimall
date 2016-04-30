<%@ Control Language="C#" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.Shop.BusinessDeliveryControl" Codebehind="BusinessDeliveryControl.ascx.cs" %>
<%@ Import Namespace="Kesion.Cache"%>

<asp:Panel ID="Panel1" runat="server">
<table class="border" cellspacing="1" cellPadding="2" width="99%" align="center" border=0>
    <tr class="title" align=middle>
      <td colSpan=2 height=35><B>订单[<asp:Label ID="LabOrderID" runat="server" Text=""></asp:Label>]发货处理</B></td>
    </tr>
    <tr class="tdbg">
      <td align=right class="lefttd">客户姓名：</td>
      <td><asp:Label ID="LabClientName" runat="server" Text=""></asp:Label></td>
    </tr>
    <tr class="tdbg">
      <td align=right class="lefttd">用户名：</td>
      <td><asp:Label ID="LabUserName" runat="server" Text=""></asp:Label></td>
    </tr>
    <tr class="tdbg">
      <td align=right class="lefttd" >订单金额：</td>
      <td>
             <span style="font-weight:bold;font-size:16px;color:brown"><%=MyCache.GetCurrencySymbol %><asp:Label ID="LabOrderTotalPrice" runat="server" Text=""></asp:Label></span> <%=MyCache.GetCurrencyUnit %>   已付款： <%=MyCache.GetCurrencySymbol %><span style="font-weight:bold;font-size:16px;color:green"><asp:Label ID="LabMoneyReceipt" runat="server" Text=""></asp:Label></span> <%=MyCache.GetCurrencyUnit %></td>
      </td>
    </tr>
    <tr class="tdbg">
      <td align=right  class="lefttd" >收货信息：</td>
      <td>
      收货地址：<asp:Label ID="LabAddress" runat="server" Text=""></asp:Label>（收 货 人：<asp:Label ID="LabRealName" runat="server" Text=""></asp:Label>
      &nbsp;&nbsp;联系电话：<asp:Label ID="LabTel" runat="server" Text=""></asp:Label>
      &nbsp;&nbsp;邮政编码：<asp:Label ID="LabZipCode" runat="server" Text=""></asp:Label>）
      
      </td>
    </tr>
    
    <tr class="tdbg" id="alipay" visible="false" runat="server">
      <td class="lefttd"  align=right>支付宝交易号：</td>
      <td><asp:Label ID="LabAlipaytradeno" Text="" runat="server"></asp:Label>
      <br /><span style='font-weight:Bold;color:green'>本单采用支付宝担保交易,发货操作同时改变支付宝订单状态。</span></td>
    </tr>

    
    <tr class="tdbg">
      <td class="lefttd"  align=right>发货日期：</td>
      <td>
          <asp:TextBox  CssClass="textbox" ID="TxtDeliverDate" runat="server"></asp:TextBox>
          <span class="tips">格式:YYYY-MM-DD hh:mm:ss</span></td>
    </tr>
    <tr class="tdbg">
      <td class="lefttd"  align=right>快递公司：</td>
      <td>
         <asp:DropDownList CssClass="select" ID="DrpDeliveryCorpId" runat="server"></asp:DropDownList>
      </td>
    </tr>
    <tr class="tdbg">
      <td class="lefttd"  align=right>快递单号：</td>
      <td>
      <asp:TextBox  CssClass="textbox" ID="TxtExpressOrderID" runat="server" Width="200px"></asp:TextBox>
    </tr>
    <tr class="tdbg">
      <td class="lefttd" align=right>经手人：</td>
      <td>
      <asp:TextBox  CssClass="textbox" ReadOnly="true" ID="TxtAdminName" runat="server" Width="200px"></asp:TextBox>
    </tr>
    <tr class="tdbg">
      <td class="lefttd" align=right>备注：</td>
      <td>
      <asp:TextBox  CssClass="textbox" ID="TxtRemark" runat="server" Width="350px"></asp:TextBox>
    </tr>
    
    <tr class="tdbg">
      <td class="lefttd" align=right>通知会员：</td>
      <td>
      <asp:CheckBox ID="SendMessageToUser" runat="server" Checked="true" Text="同时使用站内短信通知会员已经发货" /><br />
      <asp:CheckBox ID="SendMailToUser" runat="server" Checked="true" Text="同时发送邮件通知会员已经发货" />
            <%
       if (MyCache.GetCacheConfig(32) == "1")
        {  
      %>
     <br /> <asp:CheckBox ID="SendMobileToUser" runat="server" Checked="true" Text="同时发送手机短信通知会员已经发货" /></td>
      <%} %>
      
      </td>
    </tr>

    <tr class="tdbg" align="middle">
      <td colSpan="2" height="50">
      <asp:Button ID="BtnSave" runat="server" Text="确定发货" CssClass="button" OnClick="BtnSave_Click" />
 &nbsp;
        <Input class=button onclick="history.back();" type=button value=取消返回 name=Submit></td>
    </tr>
  </table>
</asp:Panel>
