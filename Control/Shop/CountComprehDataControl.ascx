<%@ Control Language="C#" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.Shop.CountComprehDataControl" Codebehind="CountComprehDataControl.ascx.cs" %>
<%@ Import Namespace="Kesion.Cache" %>
<table width="99%" style="margin-top:10px" border="0" align="center" cellpadding="1" cellspacing="1" class="CTable">
		<tr class="tdbg">
						<td height='25' class='clefttitle' colspan='4' style="text-align:left"><strong>��Ա������</strong> ����Ա������ = ��Ա��Ч������ �� ��Ա���������� </td>
		  </tr>
					  <tr class="tdbg">
						<td height="30" style="text-align:center">
                            ��վ��Ա����</td>
						<td height="30" style="text-align:center">��Ա��Ч������</td>
						<td height="30" style="text-align:center">��Ա��������</td>
						<td height="30" style="text-align:center">��Ա������ </td>
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
						<td height='25' class='clefttitle' colspan='4' style="text-align:left"><strong>ÿ��Աƽ���������������</strong> ��ÿ��Ա��Ч������ = ��Ա��Ч�������� �� ��Ա������ ��ÿ��Ա��Ч����� = ��Ա��Ч�����ܶ�
                            �� ��Ա������ </td>
					  </tr>
					  <tr class="tdbg">
						<td height="30" style="text-align:center">
                            ��Ա��Ч�����ܶ�</td>
						<td height="30" style="text-align:center">
                            ÿ��Ա��Ч������</td>
						<td height="30" style="text-align:center">
                            ÿ��Ա��Ч�����</td>
					  </tr>
					  <tr>
						<td height="30" align="center"><%=MyCache.GetCurrencySymbol %>
                            <asp:Label ID="LabUserTotalOrderMoney" runat="server" Text="Label"></asp:Label><%=MyCache.GetCurrencyUnit %></td>
						<td height="30" align="center">
					
                            <asp:Label ID="LabPerUserOrderNum" runat="server" Text="Label"></asp:Label>
                            ��</td>
						<td height="30" align="center">
						<%=MyCache.GetCurrencySymbol %><asp:Label ID="LabPerUserOrderMoney" runat="server" Text="Label"></asp:Label><%=MyCache.GetCurrencyUnit %></td>
						
					  </tr>
					</table>
					
					 <table width="99%" style="margin-top:10px" border="0" align="center" cellpadding="1" cellspacing="1" class="CTable">
					  <tr class="tdbg">
						<td height='25' class='clefttitle' colspan='4' style="text-align:left">
                            <strong>������Աƽ��</strong>��Ч<strong>����������ܶ�</strong> ��������Աƽ����Ч������ = ������Ա��Ч�����ܶ� �� ������Ա��Ч����������
                        </td>
					  </tr>
					  <tr class="tdbg">
						<td height="30" style="text-align:center">
                            ������Ա��Ч�����ܶ�</td>
						<td height="30" style="text-align:center">
                            ������Ա��Ч��������</td>
						<td height="30" style="text-align:center">
                            ������Աƽ����Ч������</td>
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
						<td height='25' class='clefttitle' colspan='4' style="text-align:left"><strong>�ۺ�ͳ��</strong>  </td>
					  </tr>
					  <tr class="tdbg">
						<td height="30" style="text-align:center">
                            ����Ч������ �� ����Ч������</td>
						<td height="30" style="text-align:center">
                            ��Ա��Ч����% ���ǻ�Ա��Ч����%
                        </td>
						<td height="30" style="text-align:center">
                            ��Ա������Ч���% ���ǻ�Ա������Ч���%</td>
					  </tr>
					  <tr>
						<td height="30" align="center">
						
                            <asp:Label ID="LabTotalOrder" runat="server" Text="Label"></asp:Label>��<%=MyCache.GetCurrencySymbol %><asp:Label ID="LabOrderTotalMoney"
                                runat="server" Text="Label"></asp:Label> <%=MyCache.GetCurrencyUnit %></td>
						<td height="30" align="center">
                            <asp:Label ID="LabUserOrder" runat="server" Text="Label"></asp:Label>��<asp:Label ID="LabNoUserOrder"
                                runat="server" Text="Label"></asp:Label>
						
						</td>
						<td height="30" align="center">
						
                            <asp:Label ID="LabUserMoneyRate" runat="server" Text="Label"></asp:Label>��
                            <asp:Label ID="LabNoUserMoneyRate" runat="server" Text="Label"></asp:Label></td>
						
					  </tr>
</table>
<script type="text/javascript">
showtips('<span class="state"><strong>˵����</strong><br /></span>����Ч������ָ���Ƕ����ѱ�ȷ�ϻ����ѱ��ᵥ�Ķ���,����Ч���۹����/���۶�/��ָ�����ѱ�ȷ�ϻ����ѱ�����Ķ��������ܶ�!');
</script>
