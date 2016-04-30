<%@ Page Language="C#" MasterPageFile="~/User/User.master" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.User_Offer_sentMessage1" Title="Untitled Page" Codebehind="Sentmessage.aspx.cs" %>
<%@ Import Namespace="Kesion.Publics" %>
<asp:Content ID="Content1" ContentPlaceHolderID="KSContent" Runat="Server">
 <div class="tabs">	
			<ul>
				<li><a href="receivedmessage.aspx">我收到的消息</a></li>
				<li class="puton"><a href="sentmessage.aspx">我发出的消息</a></li>
				<li><a href="Garbagemessage.aspx">垃圾消息</a></li>
				<li><a href="Sendmessage.aspx">发送短消息</a></li>
			</ul>
</div>    

<asp:Panel ID="ListPannel" runat="server" Width="100%">

<div class="toptips">累计发出 <asp:Label ID="LabTotal" runat="server" Text="0"></asp:Label> 条留言！</div>
    <asp:Repeater ID="Repeater1" runat="server">
    <HeaderTemplate>
         <table id="tablist" width="98%" border="0" align="center" cellpadding="2" cellspacing="1" class="border">
      <tr align="center" class="title">
        	<td width="20" align="center">&nbsp;</td>
	        <td align="center" width="70">状态</td>
        	<td align="center"> 标题</td>
            <td align="center" width="150">发给</td>
        </tr>
    </HeaderTemplate>
    <ItemTemplate>
      <tr class="tdbg">
          <td class="splittd" align="center"><input type="checkbox" name="ids" value="<%#Eval("ID") %>" /></td>
          <td class="splittd" align="center">
          <%# GetMsgStatus(Convert.ToInt16(Eval("ReadTF"))) %>
          </td>
          <td class="splittd"><a href="?Action=Show&ID=<%# Eval("ID") %>"><%#Eval("MsgTitle") %></a>
          <br /><span class="tips"><%# Utils.FormatHumanizedTime(Convert.ToDateTime(Eval("AddDate"))) %></span>
          </td>
          <td class="splittd">
          <%# Eval("ToUserName")%>
          </td>

      </tr>  

     </ItemTemplate>
     <FooterTemplate>
     <tr class="tdbg" style="display:<%# bool.Parse((Repeater1.Items.Count==0).ToString())?"":"none"%>">
                <td class="splittd" style="text-align:center" colspan="4">
                  没有发出消息！
                </td>
     </tr> 
    </table>
     </FooterTemplate>
    </asp:Repeater>
    
        &nbsp;&nbsp;&nbsp;<input type="checkbox" name="chkall" id="chkall" onclick="CheckAll(this.form);"/>全选  &nbsp;将选中的信息<asp:Button ID="ButtonDel" CssClass="button" runat="server" Text="永久删除" OnClick="ButtonDel_Click"/>
   
    

    
         <KS:Page ID="Page1" runat="server" />
</asp:Panel>

<asp:Panel ID="ShowPannel" Visible="false" runat="server" Width="100%">
&nbsp;&nbsp;<asp:Label ID="LabelSupplySubject" runat="server" Text=""></asp:Label> 

<table width="98%" align="center" class="border" border="0" cellpadding="0" cellspacing="0">
  <tr class="title">
    <td colspan="2">我发出的留言</td>
  </tr>
  <tr class="tdbg">
    <td class="splittd" style="word-break:break-all">
    <b>发给：</b><asp:Label ID="LabToUser" runat="server" Text="Label"></asp:Label><br />
    <b>主题：</b><asp:Label ID="LabelSubject" runat="server" Text="Label"></asp:Label><br />
      <strong>时间：</strong><asp:Label ID="LabelAddTime" runat="server" Text="Label"></asp:Label>
        <hr size="1" />
        <strong>主要内容</strong>：<br />
        <asp:Label ID="LabelContent" runat="server" Text="Label"></asp:Label>
        <br />

              <asp:Label ID="LabelRequestInfo" runat="server" Text=""></asp:Label>

     
       
      </td>
  </tr>
</table>
<br />
 <div style="text-align:center"><asp:Button ID="Button1" CssClass="button" runat="server" Text="删除留言" OnClick="Button1_Click" /></div></asp:Panel>
</asp:Content>

