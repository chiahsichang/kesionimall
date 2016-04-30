<%@ Page Language="C#" MasterPageFile="~/User/User.master" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.User_LogMoney" Title="Untitled Page" Codebehind="LogMoney.aspx.cs" %>
<%@ Import Namespace="Kesion.Cache" %>
<%@ Import Namespace="Kesion.Publics" %>
<asp:Content ID="Content1" ContentPlaceHolderID="KSContent" Runat="Server">

<div class="tabs">	
			<ul>
				<li class="puton"><a href="LogMoney.aspx">Ԥ������ϸ</a></li>
				<li><a href="Consumer.aspx"><%=MyCache.GetCacheConfig(49) %>��ϸ</a></li>
				<li><a href="LogScore.aspx">������ϸ</a></li>
			</ul>
</div>
<div style="padding-right:4px;text-align:right;height:30px;line-height:30px;" class="toptips">
 <a href='LogMoney.aspx' style="color:#ff6600">�����м�¼[<%=InNum+OutNum %>]</a> ��<a href='LogMoney.aspx?IncomeOrPayOut=1' style="color:Green">�����¼[<%=InNum %>]</a> ��<a href='LogMoney.aspx?IncomeOrPayOut=2'  style="color:blue">֧����¼[<%=OutNum %>]</a>
		   </div>
		   
    <asp:Repeater ID="Repeater1" runat="server">
    <HeaderTemplate>
         <table id="tablist" width="98%" border="0" align="center" cellpadding="2" cellspacing="1" class="border">
      <tr align="center" class="title">
        	<td width="60" align="center">�û�</td>
        	<td align="center">����ʱ��</td>
            <td align="center" width="110"> ����(<%=MyCache.GetCurrencyUnit %>) </td>
            <td align="center"> ֧��(<%=MyCache.GetCurrencyUnit %>) </td>
            <td align="center">ժҪ</td>
	        <td align="center">���(<%=MyCache.GetCurrencyUnit %>)</td>
	        <td align="center">��ע</td>
        </tr>
    </HeaderTemplate>
    <ItemTemplate>
       <tr class="tdbg">
          <td class="splittd" align="center"><%# Eval("UserName") %></td>
          <td class="splittd">
         <%# Utils.FormatHumanizedTime(Convert.ToDateTime(Eval("PayTime")))%>
          </td>
          <td class="splittd" align="center"><%# GetMoney(Convert.ToDouble(Eval("money")), Convert.ToInt16(Eval("InComeorPayout")), 1)%></td>
          <td class="splittd" align="center">
         <%# GetMoney(Convert.ToDouble(Eval("money")), Convert.ToInt16(Eval("InComeorPayout")), 2)%>
          </td>
          <td class="splittd" align="center">
          <%#GetOpType(Convert.ToInt16(Eval("InComeorPayout")))%>
          </td>
          <td class="splittd" align="center">
          <%# GetNowMoney(Convert.ToDouble(Eval("currMoney"))) %> 
          </td>
          <td class="splittd" style="width:180px;word-break:break-all">
          <%#Eval("remark") %>
          </td>
      </tr>      
    </ItemTemplate>
     <FooterTemplate>
      <tr class="tdbg" style="display:<%# bool.Parse((Repeater1.Items.Count==0).ToString())?"":"none"%>">
                <td class="splittd" style="text-align:center" colspan="10">
                  û�����Ѽ�¼��
                </td>
           </tr> 
    </table>
     </FooterTemplate>
    </asp:Repeater>
     <KS:Page ID="Page1" runat="server" />

</asp:Content>

