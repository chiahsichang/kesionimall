<%@ Control Language="C#" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.Shop.DeliveryControl" Codebehind="DeliveryControl.ascx.cs" %>
<%@ Import Namespace="Kesion.Cache"%>

<asp:Panel ID="Panel1" runat="server">
<KS:TopNav ID="TopNav1" runat="server" Text="订单发货处理" />
<table class="CTable" cellSpacing=1 cellPadding=1 width="99%" border=0>
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
        <table cellSpacing=2 cellPadding=0 border=0>
          <tr class=tdbg>
            <td align=right width="15%">订单编号：</td>
            <td><asp:Label ID="LabOrderID" runat="server" Text=""></asp:Label></td>
            <td>&nbsp;</td>
          </tr>
          <tr class=tdbg>
            <td align=right width="15%">订单金额：</td>
            <td>
                <span style="font-weight:bold;font-size:16px;color:brown"><%=MyCache.GetCurrencySymbol %><asp:Label ID="LabOrderTotalPrice" runat="server" Text=""></asp:Label></span> <%=MyCache.GetCurrencyUnit %>   已付款： <%=MyCache.GetCurrencySymbol %><span style="font-weight:bold;font-size:16px;color:green"><asp:Label ID="LabMoneyReceipt" runat="server" Text=""></asp:Label></span> <%=MyCache.GetCurrencyUnit %></td>
          <td></td>
          </tr>
        </table>
      </td>
    </tr>
    <tr class=tdbg>
      <td align=right width="15%">收货信息：</td>
      <td>
      配送方式：<asp:Label ID="LabDeliveryType" runat="server" Text=""></asp:Label><br />
      收货地址：<asp:Label ID="LabAddress" runat="server" Text=""></asp:Label>（收 货 人：<asp:Label ID="LabRealName" runat="server" Text=""></asp:Label>
      &nbsp;&nbsp;联系电话：<asp:Label ID="LabTel" runat="server" Text=""></asp:Label>
      &nbsp;&nbsp;邮政编码：<asp:Label ID="LabZipCode" runat="server" Text=""></asp:Label>）
      
      
      </td>
    </tr>
    
    <tr class=tdbg id="alipay" visible="false" runat="server">
      <td align=right width="15%">支付宝交易号：</td>
      <td><asp:Label ID="LabAlipaytradeno" Text="" runat="server"></asp:Label>
      <br /><span style='font-weight:Bold;color:green'>本单采用支付宝担保交易,发货操作同时改变支付宝订单状态。</span></td>
    </tr>

    
    <tr class=tdbg>
      <td align=right width="15%">发货日期：</td>
      <td>
          <asp:TextBox  CssClass="textbox" ID="TxtDeliverDate" runat="server"></asp:TextBox>
          格式:YYYY-MM-DD hh:mm:ss</td>
    </tr>
    <tr class=tdbg>
      <td align=right width="15%">快递公司：</td>
      <td>
         <asp:DropDownList CssClass="select" ID="DrpDeliveryCorpId" runat="server"></asp:DropDownList>
      </td>
    </tr>
    <tr class=tdbg>
      <td align=right width="15%">快递单号：</td>
      <td>
      <asp:TextBox  CssClass="textbox" ID="TxtExpressOrderID" runat="server" Width="200px"></asp:TextBox>
    </tr>
    <tr class=tdbg>
      <td align=right width="15%">经手人：</td>
      <td>
      <asp:TextBox  CssClass="textbox" ID="TxtAdminName" runat="server" Width="200px"></asp:TextBox>
    </tr>
    <tr class=tdbg>
      <td align=right width="15%">备注：</td>
      <td>
      <asp:TextBox  CssClass="textbox" ID="TxtRemark" runat="server" Width="350px"></asp:TextBox>
    </tr>
    
    <tr class=tdbg>
      <td align=right width="15%">通知会员：</td>
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

    <tr class=tdbg align=middle>
      <td colSpan=2 height=30>
      <asp:Button ID="BtnSave" runat="server" Text="确定发货" CssClass="button" OnClick="BtnSave_Click" />
 &nbsp;
        <Input class=button onclick="parent.box.close();" type=button value=取消返回 name=Submit></td>
    </tr>
  </table>
</asp:Panel>

<asp:Panel ID="Panel2" runat="server">
<KS:TopNav ID="TopNav2" runat="server" Text="订单确认消费" />
<table class="Border" cellSpacing=1 cellPadding=2 width="99%" align="center" border=0>
    <tr class="Title" align=middle>
      <td colSpan=2 height=25><B>录入消费信息</B></td>
    </tr>
    <tr class=tdbg>
      <td align=right width="15%"  height="30" class="lefttd">团购商品名称：</td>
      <td><asp:Label ID="LabTitle" runat="server"></asp:Label>
         <asp:HiddenField ID="HidInfo" Value="0" runat="server" />

      </td>
        
    </tr>
    <tr class=tdbg>
      <td align=right width="15%"  height="30" class="lefttd">订单号：</td>
      <td><%=dr["orderid"].ToString() %></td>
        
    </tr>
    <tr class=tdbg>
      <td align=right width="15%" height="30" class="lefttd">手机号码：</td>
      <td><%=dr["mobile"].ToString() %></td>
    </tr>
    <%if (!string.IsNullOrEmpty(dr["VerifyCode"].ToString()))
      { %>
    <tr class=tdbg>
      <td align=right width="15%" height="30" class="lefttd">验证码：</td>
      <td><%=dr["VerifyCode"].ToString() %></td>
    </tr>
    <%} %>
    <tr class=tdbg>
      <td align=right width="15%"  class="lefttd" height="30">消费：</td>
      <td>
         可用次数<span style="color:red"><asp:Label ID="LabTimes" runat="server">0</asp:Label></span>次
          
          本次消费
          <asp:DropDownList ID="DrpTimes" runat="server">
          </asp:DropDownList>
          次

      </td>
    </tr>
    <tr class=tdbg>
      <td align=right width="15%"  class="lefttd">备注：</td>
      <td>
          <asp:TextBox ID="TxtRemark2" TextMode="MultiLine" Width="300px" Height="70px" Text="到店消费" runat="server" CssClass="textbox" />
         
      </td>
    </tr>
    <tr class=tdbg>
      <td align=right  class="lefttd">经手人：</td>
      <td>
      <asp:TextBox  CssClass="textbox" ID="TxtAdminName2" runat="server" Width="200px"></asp:TextBox>
    </tr>
    <tr class=tdbg align="middle">
      <td colSpan=2 height="70">
      <asp:Button ID="Button1" runat="server" Text="确定消费" CssClass="button" OnClick="Button1_Click"/>
 &nbsp;
        <Input class=button onclick="parent.box.close();" type=button value=取消返回 name=Submit></td>
    </tr>
  </table>

</asp:Panel>