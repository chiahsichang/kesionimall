<%@ Page Language="C#" MasterPageFile="~/User/User.master" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.User_LogScore" Title="Untitled Page" Codebehind="LogScore.aspx.cs" %>
<%@ Import Namespace="Kesion.Cache" %>
<%@ Import Namespace="Kesion.Publics" %>
<asp:Content ID="Content1" ContentPlaceHolderID="KSContent" Runat="Server">

<div class="tabs">	
			<ul>
				<li><a href="LogMoney.aspx">Ԥ������ϸ</a></li>
				<li><a href="Consumer.aspx"><%=MyCache.GetCacheConfig(49) %>��ϸ</a></li>
				<li class="puton"><a href="LogScore.aspx">������ϸ</a></li>
			</ul>
		</div>
<div style="padding-right:4px;height:30px;line-height:30px;" class="toptips">
   <span style="float:right"><a href='LogScore.aspx' style="color:#ff6600">�����м�¼[<%=InNum+OutNum %>]</a> ��<a href='LogScore.aspx?IncomeOrPayOut=1' style="color:Green">�����¼[<%=InNum %>]</a> ��<a href='LogScore.aspx?IncomeOrPayOut=2'  style="color:blue">֧����¼[<%=OutNum %>]</a>
   </span>
     �����ܻ��֣�<%=__info.Score %> �֣������ѣ�<span style='color:Red'><%=__info.ScoreHasUse %></span> �֣����û��֣� <span style='color:green'><%=__info.AvailableScore%></span> �֡� 

  </div>
		   
    <asp:Repeater ID="Repeater1" runat="server">
    <HeaderTemplate>
         <table id="tablist" width="98%" border="0" align="center" cellpadding="2" cellspacing="1" class="border">
      <tr align="center" class="title">
        	<td width="60" align="center">�û�</td>
        	<td align="center">����ʱ��</td>
            <td align="center" nowrap> ����(��) </td>
            <td nowrap align="center"> ֧��(��) </td>
            <td align="center">ժҪ</td>
	        <td align="center" nowrap>���(��)</td>
	        <td align="center">��ע</td>
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
          �ۼ�<%# Eval("nowScore")%>�� ����<font color=green><%# Eval("AvailableScore") %></font>��
          </td>
          <td class="splittd"  style="width:200px;word-break:break-all">
          <%#Eval("remark") %>
          </td>
      </tr>      
    </ItemTemplate>
     <FooterTemplate>
      <tr class="tdbg" style="display:<%# bool.Parse((Repeater1.Items.Count==0).ToString())?"":"none"%>">
                <td class="splittd" style="text-align:center" colspan="10">
                  û�л��ּ�¼��
                </td>
           </tr> 
    </table>
     </FooterTemplate>
    </asp:Repeater>
     <KS:Page ID="Page1" runat="server" />

</asp:Content>

