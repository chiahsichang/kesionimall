<%@ Control Language="C#" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.Shop.CountComprehDataControl" Codebehind="CountComprehDataControl.ascx.cs" %>
<%@ Import Namespace="Kesion.Cache" %>
<table width="99%" style="margin-top:10px" border="0" align="center" cellpadding="1" cellspacing="1" class="CTable">
		<tr class="tdbg">
						<td height='25' class='clefttitle' colspan='4' style="text-align:left"><strong>会员购买率</strong> （会员购买率 = 会员有效订单数 ÷ 会员订单总数） </td>
		  </tr>
					  <tr class="tdbg">
						<td height="30" style="text-align:center">
                            网站会员总数</td>
						<td height="30" style="text-align:center">会员有效订单数</td>
						<td height="30" style="text-align:center">会员订单总数</td>
						<td height="30" style="text-align:center">会员购买率 </td>
					  </tr>
					  <tr>
						<td height="30" style="text-align:center">
                            <asp:Label ID="LabUserTotal" runat="server" Text="Label"></asp:Label></td>
						<td height="30" style="text-align:center">
                            <asp:Label ID="LabValidUserOrder" runat="server" Text="Label"></asp:Label></td>
						<td height="30" style="text-align:center">
                            <asp:Label ID="LabUserOrderTotal" runat="server" Text="Label"></asp:Label></td>
						<td height="30" style="text-align:center">
                            <asp:Label ID="LabUserRate" runat="server" Text="Label"></asp:Label></td>
					  </tr>
					</table>
					
				 <table width="99%" style="margin-top:10px" border="0" align="center" cellpadding="1" cellspacing="1" class="CTable">
					  <tr class="tdbg">
						<td height='25' class='clefttitle' colspan='4' style="text-align:left"><strong>每会员平均订单数及购物额</strong> （每会员有效订单数 = 会员有效订单总数 ÷ 会员总数） （每会员有效购物额 = 会员有效购物总额
                            ÷ 会员总数） </td>
					  </tr>
					  <tr class="tdbg">
						<td height="30" style="text-align:center">
                            会员有效购物总额</td>
						<td height="30" style="text-align:center">
                            每会员有效订单数</td>
						<td height="30" style="text-align:center">
                            每会员有效购物额</td>
					  </tr>
					  <tr>
						<td height="30" align="center"><%=MyCache.GetCurrencySymbol %>
                            <asp:Label ID="LabUserTotalOrderMoney" runat="server" Text="Label"></asp:Label><%=MyCache.GetCurrencyUnit %></td>
						<td height="30" align="center">
					
                            <asp:Label ID="LabPerUserOrderNum" runat="server" Text="Label"></asp:Label>
                            个</td>
						<td height="30" align="center">
						<%=MyCache.GetCurrencySymbol %><asp:Label ID="LabPerUserOrderMoney" runat="server" Text="Label"></asp:Label><%=MyCache.GetCurrencyUnit %></td>
						
					  </tr>
					</table>
					
					 <table width="99%" style="margin-top:10px" border="0" align="center" cellpadding="1" cellspacing="1" class="CTable">
					  <tr class="tdbg">
						<td height='25' class='clefttitle' colspan='4' style="text-align:left">
                            <strong>匿名会员平均</strong>有效<strong>订单额及购物总额</strong> （匿名会员平均有效订单额 = 匿名会员有效购物总额 ÷ 匿名会员有效订单总数）
                        </td>
					  </tr>
					  <tr class="tdbg">
						<td height="30" style="text-align:center">
                            匿名会员有效购物总额</td>
						<td height="30" style="text-align:center">
                            匿名会员有效订单总数</td>
						<td height="30" style="text-align:center">
                            匿名会员平均有效订单额</td>
					  </tr>
					  <tr>
						<td height="30" align="center"><%=MyCache.GetCurrencySymbol %><asp:Label ID="LabNMTotalOrderMoney" runat="server" Text="Label"></asp:Label> <%=MyCache.GetCurrencyUnit %></td>
						<td height="30" align="center">
				
                            <asp:Label ID="LabNMOrderNum" runat="server" Text="Label"></asp:Label></td>
						<td height="30" align="center">
						<%=MyCache.GetCurrencySymbol %><asp:Label ID="LabAvgOrderMoney" runat="server" Text="Label"></asp:Label><%=MyCache.GetCurrencyUnit %></td>
						
					  </tr>
					</table>
					
					<table width="99%" style="margin-top:10px" border="0" align="center" cellpadding="1" cellspacing="1" class="CTable">
					  <tr class="tdbg">
						<td height='25' class='clefttitle' colspan='4' style="text-align:left"><strong>综合统计</strong>  </td>
					  </tr>
					  <tr class="tdbg">
						<td height="30" style="text-align:center">
                            总有效订单数 ／ 总有效购买金额</td>
						<td height="30" style="text-align:center">
                            会员有效订单% ／非会员有效订单%
                        </td>
						<td height="30" style="text-align:center">
                            会员购买有效金额% ／非会员购买有效金额%</td>
					  </tr>
					  <tr>
						<td height="30" align="center">
						
                            <asp:Label ID="LabTotalOrder" runat="server" Text="Label"></asp:Label>／<%=MyCache.GetCurrencySymbol %><asp:Label ID="LabOrderTotalMoney"
                                runat="server" Text="Label"></asp:Label> <%=MyCache.GetCurrencyUnit %></td>
						<td height="30" align="center">
                            <asp:Label ID="LabUserOrder" runat="server" Text="Label"></asp:Label>／<asp:Label ID="LabNoUserOrder"
                                runat="server" Text="Label"></asp:Label>
						
						</td>
						<td height="30" align="center">
						
                            <asp:Label ID="LabUserMoneyRate" runat="server" Text="Label"></asp:Label>／
                            <asp:Label ID="LabNoUserMoneyRate" runat="server" Text="Label"></asp:Label></td>
						
					  </tr>
</table>
<script type="text/javascript">
showtips('<span class="state"><strong>说明：</strong><br /></span>“有效订单”指的是订单已被确认或是已被结单的订单,“有效销售购物额/销售额/金额”指定的已被确认或是已被结清的订单销售总额!');
</script>
