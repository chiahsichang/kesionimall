<%@ Control Language="C#" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.Shop.UserOrderPayControl" Codebehind="UserOrderPayControl.ascx.cs" %>
<%@ Import Namespace="Kesion.Publics" %>
<%@ Import Namespace="Kesion.Cache" %>
<%@ Import Namespace="Kesion.Components" %>
<%@ Import Namespace="Kesion.BLL" %>
<asp:Panel ID="Panel1" runat="server">
<%
         float mustPay = (Utils.StrToFloat(dr["OrderTotalPrice"].ToString()) - Utils.StrToFloat(dr["MoneyReceipt"].ToString()));
         float blance = (float)__userinfo.Money - mustPay;
     
     %>
<table  cellspacing="1" cellpadding="3" class="border" width="98%" align="center" border="0">
	 <tr class="title">
         <td> 支付订单</td>
     </tr>
     <tr class="tdbg">
         <td height="40" class="tips" valign="top">您好,<%=__userinfo.UserName %> ！您的身份级别：
             <%=UserGroupManage.GetUserGroupInfo(__userinfo.GroupID).GroupName %>,
             可用预存款 <%=MyCache.GetCurrencySymbol %><font color=red><%=__userinfo.Money.ToString("F2") %></font> <%=MyCache.GetCurrencyUnit%>，
             可用 <%=MyCache.GetCacheConfig(49) %> <%=__userinfo.Point %> <%=MyCache.GetCacheConfig(50) %>
             ，积分<font color=green><%=__userinfo.Score %></font> 分。
             </td>
     </tr>
</table>
<table  cellspacing="1" cellpadding="3" class="border" width="98%" align="center" border="0">
     <tr class="tdbg">
       <td  class="lefttd" align="right">订单编号：</td>
       <td><%=dr["orderid"].ToString() %>
       </td>
     </tr>
     <tr class="tdbg">
        <td  class="lefttd" align="right">订单费用：</td>
         <td style="height:30px"> <%=MyCache.GetCurrencySymbol%><%=Utils.StrToFloat(dr["NoUseCouponMoney"].ToString()).ToString("F2")%>  <%=MyCache.GetCurrencyUnit%>
         </td>
     </tr>
     
    <%if (Utils.StrToDecimal(dr["MoneyReceipt"].ToString())>0){ %>
     <tr class="tdbg">
        <td  class="lefttd" align="right">已付费用：</td>
         <td style="height:30px"> <%=MyCache.GetCurrencySymbol%><span style="font-size:16px;font-weight:bold;color:green"><%=Utils.StrToFloat(dr["MoneyReceipt"].ToString()).ToString("F2")%></span> <%=MyCache.GetCurrencyUnit%>
         </td>
     </tr>
     <tr class="tdbg">
         <td  class="lefttd"  align="right">剩余货款：</td>
         <td style="height:30px"><%=MyCache.GetCurrencySymbol%><span style="font-size:16px;font-weight:bold;color:#ff6600"><%=(mustPay).ToString("F2")%></span> <%=MyCache.GetCurrencyUnit%>
         </td>
     </tr>
    <%}else if (dr["IsFrontPay"].ToString()=="1"){ %>
     <tr class="tdbg">
         <td  class="lefttd"  align="right">支付订金：</td>
         <td style="height:30px"><%=MyCache.GetCurrencySymbol%><span style="font-size:16px;font-weight:bold;color:#ff6600"><%=Kesion.APPCode.Public.ReturnShopPrice(Utils.StrToDecimal(dr["FrontMoney"].ToString()))%></span> <%=MyCache.GetCurrencyUnit%>
         </td>
     </tr>
     <%}else if (dr["IsFrontPay"].ToString()=="2"){ %>
     <tr class="tdbg">
         <td  class="lefttd"  align="right">本次支付：</td>
         <td style="height:30px"><%=MyCache.GetCurrencySymbol%> <input type="text" name="money" style="text-align:center;width:70px" value="<%=(mustPay).ToString("F2")%>" class="textbox" /> <%=MyCache.GetCurrencyUnit%> Tips:本订单至少需要支付<%=MyCache.GetCurrencySymbol%><span style="font-size:16px;font-weight:bold;color:#ff6600"><%=Kesion.APPCode.Public.ReturnShopPrice(Utils.StrToDecimal(dr["FrontMoney"].ToString()))%></span> <%=MyCache.GetCurrencyUnit%>订金。
         </td>
     </tr>
    <%}else{ %>
     <tr class="tdbg">
         <td  class="lefttd"  align="right">实际支付：</td>
         <td style="height:30px"><%=MyCache.GetCurrencySymbol%><span style="font-size:16px;font-weight:bold;color:#ff6600"><%=(mustPay).ToString("F2")%></span> <%=MyCache.GetCurrencyUnit%>
         </td>
     </tr>
    <%} %>
     <%
        if (blance<0)
      { %>
     
     <tr class="tdbg">
         <td  class="lefttd" align="right">温馨提示：</td>
         <td style="height:50px">您的可用余额不足还差<%=(-blance).ToString("f2") %><%=MyCache.GetCurrencyUnit%>。无法完成支付！<a target="_blank" href="../payonline.aspx?from=shop&orderid=<%=dr["orderid"].ToString() %>">点此在线支付</a>
          </td>
     </tr>
      <%}  
      else
        { %>
        <%if (EnabledSms==1){ %>
         <tr class="tdbg">
             <td  class="lefttd" height="40" align="right">手机号码：</td>
                <td>
                  <%=__userinfo.Mobile %>
                  <input type="button" id="Button1" onclick="getMobileCode()" value="免费获取手机验证码"/>
                </td>
         </tr>
         <tr class="tdbg">
             <td  class="lefttd" height="40" align="right">验 证 码：</td>
              <td><asp:TextBox ID="TxtMobileCode" runat="server" CssClass="textbox" Width="50" MaxLength="6" /></td>
         </tr>
        <%} %>
     <tr class="tdbg">
         <td></td>
         <td style="height:50px;">
              <%if (dr["IsFrontPay"].ToString() == "1" && Utils.StrToDecimal(dr["MoneyReceipt"].ToString()) == Utils.StrToDecimal(dr["FrontMoney"].ToString()))
                { %>
               温馨提示：您已支付订金，本订单只能支付订金，剩余货款请货到再付款。
             <%}else{ %>
             <asp:Button ID="BtnNext" runat="server" OnClientClick="return(checkform());" CssClass="button" Text="预付款支付" OnClick="BtnNext_Click" />
             <input type="button" value="在线支付订单" class="button" onclick="window.open('../payonline.aspx?from=shop&orderid=<%=dr["orderid"].ToString() %>');" />
              <%} %>  
         </td>

     </tr>
     <%} %>
    </table>
    
    <script>
    function checkform() {

        <%if (EnabledSms == 1)
         { %>
            if ($("#<%=this.TxtMobileCode.ClientID %>").val() == '') {
               KesionJS.Alert('请输入手机验证码！', "$('#<%=this.TxtMobileCode.ClientID %>').focus()");
               return false;
               }
        <%} %>

    }
var OutTimes=<%=MyCache.GetCacheConfig(38) %>;
var SessionID="<%=SessionID %>";
 function leavePage() {
		 if (OutTimes==0){
		 $("#SendMobileBtn").attr("disabled",false);
		 $("#SendMobileBtn").val("免费获取手机验证码")
		 }
		 else{
		 OutTimes -= 1;
		 $("#SendMobileBtn").val("已发，如果"+OutTimes+"秒后没有收到，可以重发!")
		 setTimeout("leavePage()", 1000);}
}

function getMobileCode(){
	var mobile="<%=__userinfo.Mobile %>";
	if (mobile==''){
	  $.dialog.alert('请先绑定手机号码！',function(){ location.href='MobileBind.aspx'; });
	   return false;
	}
	if (ismobile(mobile)==false){
	  $.dialog.alert('手机号码格式不正确，请重新绑定！',function(){location.href='MobileBind.aspx'; });
	  return false;
	}
	$("#SendMobileBtn").attr("disabled",true);
	$.ajax({type:"get",async:false,url:"../user/regajax.ashx?money=<%=mustPay %>&action=sendmobilecode&model=dopay&mobile="+mobile+"&SessionID="+SessionID+"&anticache=" + Math.floor(Math.random()*1000),cache:false,dataType:"html",success:function(d){
		 if (d=='true'){
			leavePage();
		 }else{
			$.dialog.alert(d,function(){ $("#SendMobileBtn").attr("disabled",false); });
		 }
	}});
	return false;
	
}
</script>

</asp:Panel>
<asp:Panel ID="Panel2" runat="server" Width="100%" Visible="false">
    <div style="margin:50px;font-size:16px;">
        <%=tipsTemplate %>
    </div>
</asp:Panel>