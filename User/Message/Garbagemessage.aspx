<%@ Page Language="C#" MasterPageFile="~/User/User.master" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.User_Offer_DelMessage" Title="Untitled Page" Codebehind="Garbagemessage.aspx.cs" %>
<asp:Content ID="Content1" ContentPlaceHolderID="KSContent" Runat="Server">
 <div class="tabs">	
			<ul>
				<li><a href="receivedmessage.aspx">我收到的消息</a></li>
				<li><a href="sentmessage.aspx">我发出的消息</a></li>
				<li class="puton"><a href="Garbagemessage.aspx">垃圾消息</a></li>
				<li><a href="Sendmessage.aspx">发送短消息</a></li>
			</ul>
</div>  
<asp:Panel ID="ListPannel" runat="server" Width="100%">

    <div class="toptips">您有 <asp:Label ID="LabTotal" runat="server" Text="0"></asp:Label> 条垃圾留言！</div>
    <asp:Repeater ID="Repeater1" runat="server" OnItemCommand="Repeater1_ItemCommand">
    <HeaderTemplate>
         <table id="tablist" width="98%" border="0" align="center" cellpadding="2" cellspacing="1" class="border">
      <tr align="center" class="title">
        	<td width="20" align="center">&nbsp;</td>
        	<td align="center">标题</td>
            <td align="center" width="150">发自</td>
	        <td align="center" width="120">操作</td>
        </tr>
    </HeaderTemplate>
    <ItemTemplate>
      <tr class="tdbg">
          <td class="splittd" align="center"><input type="checkbox" name="ids" value="<%#Eval("ID") %>" /></td>
          <td class="splittd"><a href="?Action=Show&ID=<%# Eval("ID") %>"><%#Eval("MsgTitle") %></a>
          <br /><font color=#999999><%#Eval("AddDate") %></font>
          </td>
          <td class="splittd">
          <%# Eval("FromUserName")%>
          </td>
          <td class="splittd" align="center">
          <asp:LinkButton ID="LinkButton1" runat="server" CommandArgument='<%# Eval("ID") %>' CommandName="TurnButton">转到“收到的留言”</asp:LinkButton>
          </td>

      </tr>  

     </ItemTemplate>
     <FooterTemplate>
          <tr class="tdbg" style="display:<%# bool.Parse((Repeater1.Items.Count==0).ToString())?"":"none"%>">
                <td class="splittd" style="text-align:center" colspan="4">
                  没有删除的消息！
                </td>
     </tr> 

    </table>
     </FooterTemplate>
    </asp:Repeater>
    
        &nbsp;&nbsp;<input type="checkbox" name="chkall" id="chkall" onclick="CheckAll(this.form);"/>全选  &nbsp;&nbsp; 将选中的消息<asp:Button ID="ButtonDel" CssClass="button" runat="server" Text="永久删除" OnClick="ButtonDel_Click"/> <asp:Button ID="ButtonDelTF" CssClass="button" runat="server" Text="转至＂收到的消息＂" OnClick="ButtonDelTF_Click" />
   
    

    
         <KS:Page ID="Page1" runat="server" />
</asp:Panel>

<asp:Panel ID="ShowPannel" Visible="false" runat="server" Width="100%">
<table width="98%" align="center" class="border" border="0" cellpadding="0" cellspacing="0">
  <tr class="title">
    <td colspan="2">我收到的留言</td>
  </tr>

  <tr class="tdbg">
    <td style="word-break:break-all" class="splittd"><b>主题：</b><asp:Label ID="LabelSubject" runat="server" Text="Label"></asp:Label><br />
      时间：<asp:Label ID="LabelAddTime" runat="server" Text="Label"></asp:Label>
        <hr size="1" />
        <strong>主要内容</strong>：<br />
        <asp:Label ID="LabelContent" runat="server" Text="Label"></asp:Label>

      </td>
  </tr>
</table>
<br />
<div style="text-align:center"><asp:Button id="Button1" CssClass="button" runat="server" Text="永久删除" OnClick="Button1_Click"></asp:Button> <asp:Button id="Button2" CssClass="button" runat="server" Text="转至＂收到的消息＂" OnClick="Button2_Click"></asp:Button></div>


</asp:Panel>
</asp:Content>

