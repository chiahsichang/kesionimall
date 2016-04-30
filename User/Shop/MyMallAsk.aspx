<%@ Page Language="C#" MasterPageFile="~/User/User.master" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.User_MyMallAsk" Title="Untitled Page" Codebehind="MyMallAsk.aspx.cs" %>
<%@ Import Namespace="Kesion.Cache" %>
<%@ Import Namespace="Kesion.Publics" %>
<%@ Import Namespace="Kesion.HtmlTags" %>
<%@ Import Namespace="Kesion.BLL" %>
<asp:Content ID="Content1" ContentPlaceHolderID="KSContent" Runat="Server">


<div class="tabs">	
			<ul>
				<li<%if (string.IsNullOrEmpty(KSCMS.S("show"))) Response.Write (" class='puton'"); %>><a href="myMallAsk.aspx">所有咨询(<%=DataFactory.GetOnlyValue("select count(1) From KS_ProAsk Where UserName='"+(new TemporaryVar()).UserName+"'")  %>)</a></li>
				<li<%if (KSCMS.S("show")=="1") Response.Write (" class='puton'"); %>><a href="myMallAsk.aspx?show=1">已答复(<span style="color:Green"><%=DataFactory.GetOnlyValue("select count(1) From KS_ProAsk Where isreply=1 and UserName='"+(new TemporaryVar()).UserName+"'")  %></span>)</a></li>
				<li<%if (KSCMS.S("show")=="2") Response.Write (" class='puton'"); %>><a href="myMallAsk.aspx?show=2">未答复(<span style="color:red"><%=DataFactory.GetOnlyValue("select count(1) From KS_ProAsk Where isreply=0 and UserName='" + (new TemporaryVar()).UserName + "'")%></span>)</a></li>
			</ul>
</div>
<br />
		   
    <asp:Repeater ID="Repeater1" runat="server">
    <HeaderTemplate>
         <table id="tablist" width="98%" border="0" align="center" cellpadding="2" cellspacing="1" class="border">
      <tr  class="title">
        	<td width="50">序号</td>
        	<td>咨询内容</td>
        </tr>
    </HeaderTemplate>
    <ItemTemplate>
       <tr class="tdbg">
          <td class="splittd" align="center">
          <%# (CurrPage-1)*PageSize+Container.ItemIndex + 1%>、
          </td>
          <td class="splittd">
           <span style="float:right" class="tips"><%# Eval("adddate") %></span>
           <strong>商品：</strong><a href="<%# BasicField.GetItemUrl(Utils.StrToInt(Eval("channelid")), Utils.StrToInt(Eval("classid")), Utils.StrToInt(Eval("infoid")), Convert.ToString(Eval("filename")), Convert.ToString(Eval("turnurl"))) %>" target="_blank"><strong><%# Eval("title") %></a></strong><br />
           <img src="../../sysimg/shop/ask.gif" align="absmiddle" /> 问：<%# Convert.ToString(Eval("Content")).Replace("\r\n","<br/>") %>
          <%# getPicList(Convert.ToString(Eval("PhotoUrl"))) %></td>
      </tr>      
       <tr class="tdbg">
          <td class="splittd" align="center">
          <span<%# Convert.ToString(Eval("isreply"))=="1"?" style='display:none'":"" %>>
           <a href="MyMallAsk.aspx?action=del&id=<%# Eval("id") %>" style="color:#888" onclick="return(confirm('确定删除吗？'))">删除</a>
           </span>
          </td>
          <td class="splittd">
          <span style="float:right" class="tips"><%# Eval("replydate") %></span>
          <img src="../../sysimg/shop/answer.gif" align="absmiddle" /> 答：
          <%# string.IsNullOrEmpty(Convert.ToString(Eval("ReplyContent")))?"<span style='color:red'>未答复</span>":Convert.ToString(Eval("ReplyContent")).Replace("\r\n","<br/>") %>
          </td>
      </tr>      
    </ItemTemplate>
     <FooterTemplate>
      <tr class="tdbg" style="display:<%# bool.Parse((Repeater1.Items.Count==0).ToString())?"":"none"%>">
                <td class="splittd" style="text-align:center" colspan="2" >
                  您没有咨询任何的问题！
                </td>
           </tr> 
    </table>
     </FooterTemplate>
    </asp:Repeater>
    <br />
    
     <KS:Page ID="Page1" runat="server" />
     
   <br />
   
</asp:Content>

