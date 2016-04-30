<%@ Page Language="C#" MasterPageFile="~/User/User.master" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.User_Offer_receivedMessage" Title="Untitled Page" Codebehind="Receivedmessage.aspx.cs" %>
<%@ Import Namespace="Kesion.Publics" %>

<asp:Content ID="Content1" ContentPlaceHolderID="KSContent" Runat="Server">

<div class="tabs">	
			<ul>
				<li class="puton"><a href="receivedmessage.aspx">我收到的消息</a></li>
				<li><a href="sentmessage.aspx">我发出的消息</a></li>
				<li><a href="Garbagemessage.aspx">垃圾消息</a></li>
				<li><a href="Sendmessage.aspx">发送短消息</a></li>
			</ul>
</div>    



    <% Kesion.APPCode.EditorAPI.EchoHead();%>
<asp:Panel ID="ListPannel" runat="server" Width="100%">

    <div class="toptips"><span style="float:right;padding-right:10px;"><img src="../images/msg0.gif" align="absmiddle" />未读 <img src="../images/msg1.gif" align="absmiddle"/>已读 <img src="../images/msg2.gif" align="absmiddle"/>已回复</span>累计收到 <asp:Label ID="LabTotal" runat="server" Text="0"></asp:Label> 条留言！</div>
    <asp:Repeater ID="Repeater1" runat="server">
    <HeaderTemplate>
         <table id="tablist" width="98%" border="0" align="center" cellpadding="2" cellspacing="1" class="border">
      <tr class="title">
        	<td width="20" align="center">&nbsp;</td>
        	<td align="center"> 标题</td>
            <td align="center" width="150">发自</td>
	        <td align="center" width="70">状态</td>
        </tr>
    </HeaderTemplate>
    <ItemTemplate>
      <tr class="tdbg">
          <td class="splittd" align="center"><input type="checkbox" name="ids" value="<%#Eval("ID") %>" /></td>
          <td class="splittd"><img src="../images/msg<%#Eval("ReadTF") %>.gif" align="absbottom" /><a href="?Action=Show&ID=<%# Eval("ID") %>"><%#Eval("MsgTitle") %></a>
          <br /><span class="tips"><%# Utils.FormatHumanizedTime(Convert.ToDateTime(Eval("AddDate"))) %></span>
          </td>
          <td class="splittd" style="text-align:center">
          <%# Eval("FromUserName")%>
          </td>
          <td class="splittd" align="center">
          <%# GetMsgStatus(Convert.ToInt16(Eval("ReadTF"))) %>
          </td>

      </tr>  

     </ItemTemplate>
     <FooterTemplate>
          <tr class="tdbg" style="display:<%# bool.Parse((Repeater1.Items.Count==0).ToString())?"":"none"%>">
                <td class="splittd" style="text-align:center" colspan="4">
                  没有收到任何的消息！
                </td>
     </tr> 

    </table>
     </FooterTemplate>
    </asp:Repeater>
    
        &nbsp;&nbsp;&nbsp;<input type="checkbox" name="chkall" id="chkall" onclick="CheckAll(this.form);"/>全选  &nbsp;&nbsp; 将选中的留言<asp:Button ID="ButtonDel" class="button" runat="server" Text="永久删除" OnClick="ButtonDel_Click"/> <asp:Button ID="ButtonDelTF" CssClass="button" runat="server" Text="转为垃圾消息" OnClick="ButtonDelTF_Click" />
   
    

    
         <KS:Page ID="Page1" runat="server" />
</asp:Panel>

<asp:Panel ID="ShowPannel" Visible="false" runat="server" Width="100%">
<table width="98%" border="0" align="center" class="border" cellpadding="0" cellspacing="0">
  <tr class="title">
    <td>我收到的消息</td>
  </tr>
</table>

&nbsp;&nbsp; <asp:Label ID="LabelSupplySubject" runat="server" Text=""></asp:Label>   
    
<table width="98%" align="center" border="0" cellspacing="0" cellpadding="5" class="border">
  <tr class="tdbg">
    <td class="splittd" style="word-break:break-all"><b>主题：</b><asp:Label ID="LabelSubject" runat="server" Text="Label"></asp:Label><br />
    
    <asp:Panel ID="PanFrom" runat="server" Visible="false">
    <b>来自：</b><asp:Label ID="LabFrom" runat="server"></asp:Label><br />
    </asp:Panel>
     <strong>时间：</strong><asp:Label ID="LabelAddTime" runat="server" Text="Label"></asp:Label>
        <hr size="1" />
        <strong>主要内容</strong>：<br />
        <asp:Label ID="LabelContent" runat="server" Text="Label"></asp:Label>
        <br />

      <asp:Label ID="LabelRequestInfo" runat="server" Text=""></asp:Label>
     
      <asp:Panel ID="UserInfoPannel" runat="server" Width="100%">
      <font color="#666666">顺祝商祺!
        <hr align="left" size="1" width="40%" />
        <div id="alitalkLevel" style="display:inline">
            <asp:Label ID="LabelContactMan" runat="server" Text="---"></asp:Label>&nbsp;<asp:Label ID="LabelSex" runat="server"></asp:Label>
        <br />
        </div>
        <div style="display:inline">
            <asp:Label ID="LabelCompany" runat="server" Text="--"></asp:Label></div>
            <br />
        地址：<asp:Label ID="LabelAddress" runat="server" Text="--"></asp:Label><br/>
        电话：<asp:Label ID="LabelTel" runat="server" Text="--"></asp:Label>                        传真：<asp:Label ID="LabelFax" runat="server"></asp:Label><br/>
        手机：<asp:Label ID="LabelMobile" runat="server"></asp:Label>                        邮箱：<asp:Label ID="LabelMail" runat="server"></asp:Label><br/>
      </font> 
      </asp:Panel>
      
      </td>
  </tr>
</table>
<br />
 <div style="text-align:center"><asp:Button ID="Button1" CssClass="button" runat="server" Text="删除留言" OnClick="Button1_Click"/></div>

<br />


<table width="98%" runat="server" id="ReplayList" visible="false" align="center" border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td>
        <div id="Div1">
            <asp:Repeater ID="Repeater2" runat="server">
            <HeaderTemplate>
                <table class="border" width="100%"  border="0" cellspacing="0" cellpadding="0">
                  <tr class="title">
                    <td colspan="2">我对该留言的回复</td>
                  </tr>
            </HeaderTemplate>
            <ItemTemplate>
             <tr class="tdbg">
                  <td class="splittd lefttd"><strong>回复：</strong></td>
                  <td class="splittd" style="text-align:left"><%#Eval("MsgContent") %>
                  <br /><span class="tips"><%# Utils.FormatHumanizedTime(Convert.ToDateTime(Eval("AddDate"))) %></span>
                  </td>
                </tr>
            </ItemTemplate>
            <FooterTemplate>
                </table>
            </FooterTemplate>
            </asp:Repeater>
        </div>
   </td>
   </tr>
</table>

<br />
<asp:Panel ID="PanReply" runat="server" Width="100%">
<script language="JavaScript" type="text/javascript">

	function CheckForm() {
		if (document.getElementById('<%=this.ReplayTitle.UniqueID%>').value == "") {
		    $.dialog.alert("您需要填写回复主题！", function() {
		    document.getElementById('<%=this.ReplayTitle.UniqueID%>').focus();
		});
			return false;
		}
		if (editor.hasContents() == false) {
		    $.dialog.alert('您需要填写回复正文！', function() {
		       editor.focus();
		    });
        return false ;}
		return true;
	}
	
    </script>
<table width="98%" class="border" align="center" border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td>
        <div id="reply_form">
            <table width="100%"  border="0" class="border" cellspacing="0" cellpadding="0">
              <tr class="title">
                <td colspan="2">回 复 留 言</td>
              </tr>
                <tr class="tdbg">
                  <td class="lefttd">发送给：</td>
                  <td align="left">
                      <asp:TextBox CssClass="textbox" ID="ReplayToUserName" runat="server"></asp:TextBox>
                      <asp:TextBox ID="ReplayToMail" runat="server"></asp:TextBox>
                      <asp:TextBox ID="ReplaySubjectID" runat="server"></asp:TextBox>
                      <asp:TextBox ID="ReplayMessageID" runat="server"></asp:TextBox>
                      <asp:Label ID="LabelToContactMan" runat="server" Text="Label"></asp:Label></td>
                </tr>
                <tr class="tdbg">
                  <td class="lefttd">主&nbsp;&nbsp;&nbsp;&nbsp;题：</td>
                  <td>
                      <asp:TextBox CssClass="textbox" ID="ReplayTitle" runat="server" Width="433px"></asp:TextBox>&nbsp;
                      <br/>
                      <span class="tips">建议您修改主题，吸引对方注意,得到优先回复!</span> </td>
                </tr>
                <tr class="tdbg">
                  <td class="lefttd">正&nbsp;&nbsp;&nbsp;&nbsp;文：</td>
                  <td>
                      <span class="note">
                         <textarea name="ReplyContent" rows="3" cols="3" id="ReplyContent" style="width:600px;height:150px"></textarea>
             <%
                 Kesion.APPCode.EditorAPI.EchoEditor("editor", "ReplyContent", "Basic", 0, false, true, true, false);    
             %>
                  
 </td>
                </tr>
    
                <tr>
                  <td></td>
                  <td height="45">
                  <span style="padding-top:4px solid;line-height:18px;">
                  ① 发布信息,请严格遵守法律法规。对于不按要求发布的用户，我们将锁定账户处理。<br />
②标题最多 <font color=red><%=MaxTitleLen%></font> 个字符，内容最多 <font color=red><%=MaxMsgLen %></font> 个字符

</span><br />
                  <asp:Button CssClass="button" runat="server" ID="ButtonReply" Text="回复留言" OnClick="ButtonReply_Click" />
                    &nbsp;&nbsp;
                    <input name="reset" class="button" type="reset" value=" 重填 "/>
                  </td>
                </tr>
              </table>
        </div>

    </td>
  </tr>
</table>
</asp:Panel>

</asp:Panel>
</asp:Content>

