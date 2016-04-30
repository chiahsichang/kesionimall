<%@ Page Language="C#" MasterPageFile="~/User/User.master" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.User_LogScore" Title="Untitled Page" Codebehind="LogScore.aspx.cs" %>
<%@ Import Namespace="Kesion.Cache" %>
<%@ Import Namespace="Kesion.Publics" %>
<asp:Content ID="Content1" ContentPlaceHolderID="KSContent" Runat="Server">

<div class="tabs">	
			<ul>
				<li><a href="LogMoney.aspx">预付款明细</a></li>
				<li><a href="Consumer.aspx"><%=MyCache.GetCacheConfig(49) %>明细</a></li>
				<li class="puton"><a href="LogScore.aspx">积分明细</a></li>
			</ul>
		</div>
<div style="padding-right:4px;height:30px;line-height:30px;" class="toptips">
   <span style="float:right"><a href='LogScore.aspx' style="color:#ff6600">＋所有记录[<%=InNum+OutNum %>]</a> ＋<a href='LogScore.aspx?IncomeOrPayOut=1' style="color:Green">收入记录[<%=InNum %>]</a> ＋<a href='LogScore.aspx?IncomeOrPayOut=2'  style="color:blue">支出记录[<%=OutNum %>]</a>
   </span>
     您的总积分：<%=__info.Score %> 分，已消费：<span style='color:Red'><%=__info.ScoreHasUse %></span> 分，可用积分： <span style='color:green'><%=__info.AvailableScore%></span> 分。 

  </div>
		   
    <asp:Repeater ID="Repeater1" runat="server">
    <HeaderTemplate>
         <table id="tablist" width="98%" border="0" align="center" cellpadding="2" cellspacing="1" class="border">
      <tr align="center" class="title">
        	<td width="60" align="center">用户</td>
        	<td align="center">消费时间</td>
            <td align="center" nowrap> 收入(分) </td>
            <td nowrap align="center"> 支出(分) </td>
            <td align="center">摘要</td>
	        <td align="center" nowrap>余额(分)</td>
	        <td align="center">备注</td>
        </tr>
    </HeaderTemplate>
    <ItemTemplate>
       <tr class="tdbg">
          <td class="splittd" align="center"><%# Eval("UserName") %></td>
          <td class="splittd">
         <%# Utils.FormatHumanizedTime(Convert.ToDateTime(Eval("AddDate")))%>
          </td>
          <td class="splittd" align="center"><%# GetScore(Convert.ToDouble(Eval("score")), Convert.ToInt16(Eval("InOrOutFlag")), 1)%></td>
          <td class="splittd" align="center">
         <%# GetScore(Convert.ToDouble(Eval("score")), Convert.ToInt16(Eval("InOrOutFlag")), 2)%>
          </td>
          <td class="splittd" align="center">
          <%#GetOpType(Convert.ToInt16(Eval("InOrOutFlag")))%>
          </td>
          <td class="splittd" align="center">
          累计<%# Eval("nowScore")%>分 可用<font color=green><%# Eval("AvailableScore") %></font>分
          </td>
          <td class="splittd"  style="width:200px;word-break:break-all">
          <%#Eval("remark") %>
          </td>
      </tr>      
    </ItemTemplate>
     <FooterTemplate>
      <tr class="tdbg" style="display:<%# bool.Parse((Repeater1.Items.Count==0).ToString())?"":"none"%>">
                <td class="splittd" style="text-align:center" colspan="10">
                  没有积分记录！
                </td>
           </tr> 
    </table>
     </FooterTemplate>
    </asp:Repeater>
     <KS:Page ID="Page1" runat="server" />

</asp:Content>

