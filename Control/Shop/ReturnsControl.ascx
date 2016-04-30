<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ReturnsControl.ascx.cs" Inherits="Kesion.NET.WebSite.Shop.ReturnsControl" %>
  <%@ Import Namespace="Kesion.Cache"%>
<KS:TopNav ID="TopNav1" runat="server" Text="订单退货退款处理" />
<table class="Border" cellSpacing=1 cellPadding=2 width="99%" align="center" border=0>
    <tr class="Title" align=middle>
      <td colSpan=2 height=25><B>录入退货退款信息</B></td>
    </tr>
    <tr class=tdbg>
      <td align=right width="15%">客户姓名：</td>
      <td><asp:Label ID="LabUserName" runat="server" Text=""></asp:Label>(<asp:Label ID="LabClientName" runat="server" Text=""></asp:Label>)</td>
        
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
                <span style="font-weight:bold;font-size:16px;color:brown"><%=MyCache.GetCurrencySymbol %><asp:Label ID="LabOrderTotalPrice" runat="server" Text=""></asp:Label></span> <%=MyCache.GetCurrencyUnit %>
                &nbsp;&nbsp;已 付 款：<span style="font-weight:bold;font-size:16px;color:green"><%=MyCache.GetCurrencySymbol %><asp:Label ID="LabMoneyReceipt" runat="server" Text=""></asp:Label></span> <%=MyCache.GetCurrencyUnit %>
                
                </td>
            <td></td>
          </tr>

        </table>
      </td>
    </tr>
    <tr class=tdbg style="display:none">
      <td align=right width="15%">收货信息：</td>
      <td>
      配送方式：<asp:Label ID="LabDeliveryType" runat="server" Text=""></asp:Label><br />
      收 货 人：<asp:Label ID="LabRealName" runat="server" Text=""></asp:Label><br />
      收货地址：<asp:Label ID="LabAddress" runat="server" Text=""></asp:Label><br />
      联系电话：<asp:Label ID="LabTel" runat="server" Text=""></asp:Label><br />
      邮政编码：<asp:Label ID="LabZipCode" runat="server" Text=""></asp:Label><br />
      
      
      </td>
    </tr>
    
    <tr class=tdbg>
      <td align=right width="15%">退货退款日期：</td>
      <td>
          <asp:TextBox  CssClass="textbox" ID="TxtDeliverDate" runat="server"></asp:TextBox>
          格式:YYYY-MM-DD hh:mm:ss</td>
    </tr>


    <tr class="tdbg">
      <td align="right" width="15%">经手人：</td>
      <td>
      <asp:TextBox  CssClass="textbox" ID="TxtAdminName" runat="server" Width="200px"></asp:TextBox>
    </tr>
    <tr class="tdbg">
      <td align="right" width="15%">退货退款原因：</td>
      <td>
      <asp:TextBox  CssClass="textbox" ID="TxtRemark" runat="server" Width="350px"></asp:TextBox>
      <span class="tips">短信通知的附加内容，可以不填。</span>
    </tr>
    <tbody id="refund" runat="server">
     <tr class="tdbg">
      <td align="right" width="15%">退款金额：</td>
      <td>
      <asp:TextBox  CssClass="textbox" ID="TxtMoney" runat="server" Width="50px"></asp:TextBox> <%=MyCache.GetCurrencyUnit %>
      </td>
    </tr>
     <tr class="tdbg">
      <td align="right" width="15%">退款方式：</td>
      <td>
       <asp:RadioButtonList ID="RdbReturnMoneyType" runat="server">
        <asp:ListItem Value="1" Selected>扣除的金额添加到会员资金余额中</asp:ListItem>
        <asp:ListItem Value="2">采用其它方式：如银行转帐，现金交付等等</asp:ListItem>
       </asp:RadioButtonList>
      </td>
    </tr>
     <tbody id='returnbank' style='display:none'>
     <tr class="tdbg">
        <td  align="right">退回的银行名称：</td>
         <td> 
          <asp:TextBox ID="TxtMoneyReturnBankName" MaxLength="100" width="200" runat="server" CssClass="textbox"></asp:TextBox> <span class="tips">如中国工商银行某某分理处。</span>
         </td>
     </tr>
     <tr class="tdbg">
        <td  align="right">退回的银行卡号：</td>
         <td> 
          <asp:TextBox ID="TxtMoneyReturnBankCard" MaxLength="100" width="200"  runat="server" CssClass="textbox"></asp:TextBox> <span class="tips">请正确填写银行卡号。</span>
         </td>
     </tr>
     <tr class="tdbg">
        <td align="right">银行卡号户名：</td>
         <td> 
          <asp:TextBox ID="TxtMoneyReturnCardName" MaxLength="100" width="200" runat="server" CssClass="textbox"></asp:TextBox> <span class="tips">请正确填写银行卡户主。</span>
         </td>
     </tr>
     </tbody>
    
    </tbody>
    <tr class=tdbg>
      <td align=right width="15%">通知会员：</td>
      <td>
      <asp:CheckBox ID="SendMessageToUser" runat="server" Checked="true" Text="同时使用站内短信通知会员已经成功退货退款" /><br />
      <asp:CheckBox ID="SendMailToUser" runat="server" Checked="true" Text="同时发送邮件通知会员已经成功退货退款" /><br />
      <%
       if (MyCache.GetCacheConfig(32) == "1")
        {  
      %>
      <asp:CheckBox ID="SendMobileToUser" runat="server" Checked="true" Text="同时发送手机短信通知会员已经成功退货退款" /></td>
      <%} %>
    </tr>
    <tr class=tdbg align=middle>
      <td colSpan=2 height=30 style="color:Red">
     注意：退款信息一旦录入，就不能再修改或删除,并且订单将自动结清作废！所以在保存之前确认输入无误！</td>
    </tr>

    <tr class=tdbg align=middle>
      <td colSpan=2 height=30>
      <asp:Button ID="BtnSave" runat="server" Text="确定退货" CssClass="button" OnClick="BtnSave_Click" />
 &nbsp;
        <Input class=button onclick="parent.box.close();" type=button value=取消返回 name=Submit></td>
    </tr>
  </table>

<script>
    function showbank() {
        var checkrad = jQuery("#<%=this.RdbReturnMoneyType.ClientID %> :radio[checked]").val();
        if (checkrad == 2) {
            jQuery("#returnbank").show();
        } else {
            jQuery("#returnbank").hide();
        }
    }
    jQuery(document).ready(function() {
        showbank();
    });
</script>