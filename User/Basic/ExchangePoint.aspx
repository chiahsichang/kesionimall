<%@ Page Language="C#" MasterPageFile="~/User/User.master" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.User_ExchangePoint" Title="在线支付" Codebehind="ExchangePoint.aspx.cs" %>
<%@ Import Namespace="Kesion.Cache" %>
<%@ Import Namespace="Kesion.Publics" %>
<%@ Import Namespace="Kesion.BLL" %>
<asp:Content ID="Content1" ContentPlaceHolderID="KSContent" Runat="Server">


<div class="tabs">	
			<ul>
				<li<%=KSCMS.S("flag")==""?" class='puton'":"" %>><a href="ExchangePoint.aspx">预计款兑换<%=MyCache.GetCacheConfig(49) %></a></li>
				 <%if (Utils.StrToInt(__configinfo.ScoreToPointRate.ToString()) > 0)
            { %>
				<li<%=KSCMS.S("flag")=="score"?" class='puton'":"" %>><a href="ExchangePoint.aspx?flag=score">积分兑换<%=MyCache.GetCacheConfig(49)%></a></li>
				<%} %>
			</ul>
		</div>
		
		<asp:Panel ID="MoneyPanel" runat="server" Width="100%">
             <table  cellspacing="1" cellpadding="3" class="border" width="98%" align="center" border="0">
	             <tr class="title">
                     <td> 使用预付款兑换<%=MyCache.GetCacheConfig(49) %> (<a href="PayOnline.aspx">在此充值预付款</a>)</td>
                 </tr>
                 <tr class="tdbg">
                     <td style="height:50px" class="splittd">
                          您好,<%=__info.UserName%> !您的身份级别：<%=UserGroupManage.GetUserGroupInfo(__info.GroupID).GroupName %>,
                         <br />可用预存款 <%=MyCache.GetCurrencySymbol %><font color=red><%=__info.Money %></font> <%=MyCache.GetCurrencyUnit %>(<a href="LogMoney.aspx"><span style="color:blue;">明细</span></a>) ，
                         <br />可用<%=MyCache.GetCacheConfig(49)%><%=__info.Point %><%=MyCache.GetCacheConfig(50) %>(<a href="Consumer.aspx"><span style="color:blue;">明细</span></a>)
                         <br />累计积分<font color=#888><%=__info.Score %></font> 分 可用积分<font color=green><%=__info.AvailableScore %></font>分(<a href="LogScore.aspx"><span style="color:blue;">明细</span></a>)。
                         </td>
                 </tr>
                 <tr class="tdbg">
                     <td class="splittd" style="height:50px">
                        <span class="tips">兑换比率：1<%=MyCache.GetCurrencyUnit %>兑换1<%=MyCache.GetCacheConfig(50) %><%=MyCache.GetCacheConfig(49) %>，您当前可用预计款为<%=__info.Money.ToString() %>元，您最多可以兑换<%=__info.Money.ToString("0") %><%=MyCache.GetCacheConfig(50) %><%=MyCache.GetCacheConfig(49) %>。
                        </span><Br />&nbsp;兑换：<asp:TextBox ID="TxtPoint" CssClass="textbox" style="text-align:center" runat="server" Width="50px" Text="100"></asp:TextBox><%=MyCache.GetCacheConfig(50)%><%=MyCache.GetCacheConfig(49)%>
                       &nbsp;<asp:Button ID="BtnNext" runat="server" CssClass="button" Text="确定兑换" OnClientClick="return(confirm('此操作不可逆，确定执行兑换吗？'));" OnClick="BtnNext_Click" />
                         <asp:CompareValidator ID="CompareValidator1" ControlToValidate="TxtPoint" Operator="dataTypeCheck" Type="double" runat="server" ErrorMessage="请输入正确的数字!"></asp:CompareValidator>
                     
                     <br />
                     
                     </td>
                 </tr>
                </table>
    
    <br />
    </asp:Panel>

		<asp:Panel ID="ScorePanel" runat="server" Visible="false" Width="100%">
             <table  cellspacing="1" cellpadding="3" class="border" width="98%" align="center" border="0">
	             <tr class="title">
                     <td> 使用用积分兑换<%=MyCache.GetCacheConfig(49) %></td>
                 </tr>
                 <tr class="tdbg">
                     <td style="height:50px" class="splittd">
                          您好,<%=__info.UserName%> !您的身份级别：<%=UserGroupManage.GetUserGroupInfo(__info.GroupID).GroupName %>,
                         <br />可用预存款 <%=MyCache.GetCurrencySymbol %><font color=red><%=__info.Money %></font> <%=MyCache.GetCurrencyUnit %>(<a href="LogMoney.aspx"><span style="color:blue;">明细</span></a>)，
                         <br />可用<%=MyCache.GetCacheConfig(49)%><%=__info.Point %><%=MyCache.GetCacheConfig(50) %>(<a href="Consumer.aspx"><span style="color:blue;">明细</span></a>)
                         <br />累计积分<font color=#888><%=__info.Score %></font> 分 可用积分<font color=green><%=__info.AvailableScore %></font>分(<a href="LogScore.aspx"><span style="color:blue;">明细</span></a>)。
                         </td>
                 </tr>
                 <tr class="tdbg">
                     <td class="splittd" style="height:50px">
                        <span class="tips">兑换比率：<%=__configinfo.ScoreToPointRate %>个积分兑换1<%=MyCache.GetCacheConfig(50) %><%=MyCache.GetCacheConfig(49) %>，您当前可用积分为<%=__info.Score.ToString() %>元，您最多可以兑换<%=PointScore %><%=MyCache.GetCacheConfig(50) %><%=MyCache.GetCacheConfig(49) %>。
                        </span><Br />&nbsp;
                        兑换：<asp:TextBox ID="TxtScorePoint" CssClass="textbox" style="text-align:center" runat="server" Width="50px" Text="100"></asp:TextBox><%=MyCache.GetCacheConfig(50)%><%=MyCache.GetCacheConfig(49)%>
                       &nbsp;<asp:Button ID="Button1" runat="server" CssClass="button" Text="确定兑换" 
                             OnClientClick="return(confirm('此操作不可逆，确定执行兑换吗？'));" onclick="Button1_Click"/>
                         <asp:CompareValidator ID="CompareValidator2" ControlToValidate="TxtScorePoint" Operator="dataTypeCheck" Type="double" runat="server" ErrorMessage="请输入正确的数字!"></asp:CompareValidator>
                     
                     <br />
                     
                     </td>
                 </tr>
                </table>
    
    <br />
    </asp:Panel>

    

</asp:Content>

