<%@ Page Language="C#" MasterPageFile="~/User/User.master" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.User_Offer_receivedMessage" Title="Untitled Page" Codebehind="Receivedmessage.aspx.cs" %>
<%@ Import Namespace="Kesion.Publics" %>

<asp:Content ID="Content1" ContentPlaceHolderID="KSContent" Runat="Server">

<div class="tabs">	
			<ul>
				<li class="puton"><a href="receivedmessage.aspx">���յ�����Ϣ</a></li>
				<li><a href="sentmessage.aspx">�ҷ�������Ϣ</a></li>
				<li><a href="Garbagemessage.aspx">������Ϣ</a></li>
				<li><a href="Sendmessage.aspx">���Ͷ���Ϣ</a></li>
			</ul>
</div>    



    <% Kesion.APPCode.EditorAPI.EchoHead();%>
<asp:Panel ID="ListPannel" runat="server" Width="100%">

    <div class="toptips"><span style="float:right;padding-right:10px;"><img src="../images/msg0.gif" align="absmiddle" />δ�� <img src="../images/msg1.gif" align="absmiddle"/>�Ѷ� <img src="../images/msg2.gif" align="absmiddle"/>�ѻظ�</span>�ۼ��յ� <asp:Label ID="LabTotal" runat="server" Text="0"></asp:Label> �����ԣ�</div>
    <asp:Repeater ID="Repeater1" runat="server">
    <HeaderTemplate>
         <table id="tablist" width="98%" border="0" align="center" cellpadding="2" cellspacing="1" class="border">
      <tr class="title">
        	<td width="20" align="center">&nbsp;</td>
        	<td align="center"> ����</td>
            <td align="center" width="150">����</td>
	        <td align="center" width="70">״̬</td>
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
                  û���յ��κε���Ϣ��
                </td>
     </tr> 

    </table>
     </FooterTemplate>
    </asp:Repeater>
    
        &nbsp;&nbsp;&nbsp;<input type="checkbox" name="chkall" id="chkall" onclick="CheckAll(this.form);"/>ȫѡ  &nbsp;&nbsp; ��ѡ�е�����<asp:Button ID="ButtonDel" class="button" runat="server" Text="����ɾ��" OnClick="ButtonDel_Click"/> <asp:Button ID="ButtonDelTF" CssClass="button" runat="server" Text="תΪ������Ϣ" OnClick="ButtonDelTF_Click" />
   
    

    
         <KS:Page ID="Page1" runat="server" />
</asp:Panel>

<asp:Panel ID="ShowPannel" Visible="false" runat="server" Width="100%">
<table width="98%" border="0" align="center" class="border" cellpadding="0" cellspacing="0">
  <tr class="title">
    <td>���յ�����Ϣ</td>
  </tr>
</table>

&nbsp;&nbsp; <asp:Label ID="LabelSupplySubject" runat="server" Text=""></asp:Label>   
    
<table width="98%" align="center" border="0" cellspacing="0" cellpadding="5" class="border">
  <tr class="tdbg">
    <td class="splittd" style="word-break:break-all"><b>���⣺</b><asp:Label ID="LabelSubject" runat="server" Text="Label"></asp:Label><br />
    
    <asp:Panel ID="PanFrom" runat="server" Visible="false">
    <b>���ԣ�</b><asp:Label ID="LabFrom" runat="server"></asp:Label><br />
    </asp:Panel>
     <strong>ʱ�䣺</strong><asp:Label ID="LabelAddTime" runat="server" Text="Label"></asp:Label>
        <hr size="1" />
        <strong>��Ҫ����</strong>��<br />
        <asp:Label ID="LabelContent" runat="server" Text="Label"></asp:Label>
        <br />

      <asp:Label ID="LabelRequestInfo" runat="server" Text=""></asp:Label>
     
      <asp:Panel ID="UserInfoPannel" runat="server" Width="100%">
      <font color="#666666">˳ף����!
        <hr align="left" size="1" width="40%" />
        <div id="alitalkLevel" style="display:inline">
            <asp:Label ID="LabelContactMan" runat="server" Text="---"></asp:Label>&nbsp;<asp:Label ID="LabelSex" runat="server"></asp:Label>
        <br />
        </div>
        <div style="display:inline">
            <asp:Label ID="LabelCompany" runat="server" Text="--"></asp:Label></div>
            <br />
        ��ַ��<asp:Label ID="LabelAddress" runat="server" Text="--"></asp:Label><br/>
        �绰��<asp:Label ID="LabelTel" runat="server" Text="--"></asp:Label>                        ���棺<asp:Label ID="LabelFax" runat="server"></asp:Label><br/>
        �ֻ���<asp:Label ID="LabelMobile" runat="server"></asp:Label>                        ���䣺<asp:Label ID="LabelMail" runat="server"></asp:Label><br/>
      </font> 
      </asp:Panel>
      
      </td>
  </tr>
</table>
<br />
 <div style="text-align:center"><asp:Button ID="Button1" CssClass="button" runat="server" Text="ɾ������" OnClick="Button1_Click"/></div>

<br />


<table width="98%" runat="server" id="ReplayList" visible="false" align="center" border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td>
        <div id="Div1">
            <asp:Repeater ID="Repeater2" runat="server">
            <HeaderTemplate>
                <table class="border" width="100%"  border="0" cellspacing="0" cellpadding="0">
                  <tr class="title">
                    <td colspan="2">�ҶԸ����ԵĻظ�</td>
                  </tr>
            </HeaderTemplate>
            <ItemTemplate>
             <tr class="tdbg">
                  <td class="splittd lefttd"><strong>�ظ���</strong></td>
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
		    $.dialog.alert("����Ҫ��д�ظ����⣡", function() {
		    document.getElementById('<%=this.ReplayTitle.UniqueID%>').focus();
		});
			return false;
		}
		if (editor.hasContents() == false) {
		    $.dialog.alert('����Ҫ��д�ظ����ģ�', function() {
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
                <td colspan="2">�� �� �� ��</td>
              </tr>
                <tr class="tdbg">
                  <td class="lefttd">���͸���</td>
                  <td align="left">
                      <asp:TextBox CssClass="textbox" ID="ReplayToUserName" runat="server"></asp:TextBox>
                      <asp:TextBox ID="ReplayToMail" runat="server"></asp:TextBox>
                      <asp:TextBox ID="ReplaySubjectID" runat="server"></asp:TextBox>
                      <asp:TextBox ID="ReplayMessageID" runat="server"></asp:TextBox>
                      <asp:Label ID="LabelToContactMan" runat="server" Text="Label"></asp:Label></td>
                </tr>
                <tr class="tdbg">
                  <td class="lefttd">��&nbsp;&nbsp;&nbsp;&nbsp;�⣺</td>
                  <td>
                      <asp:TextBox CssClass="textbox" ID="ReplayTitle" runat="server" Width="433px"></asp:TextBox>&nbsp;
                      <br/>
                      <span class="tips">�������޸����⣬�����Է�ע��,�õ����Ȼظ�!</span> </td>
                </tr>
                <tr class="tdbg">
                  <td class="lefttd">��&nbsp;&nbsp;&nbsp;&nbsp;�ģ�</td>
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
                  �� ������Ϣ,���ϸ����ط��ɷ��档���ڲ���Ҫ�󷢲����û������ǽ������˻�����<br />
�ڱ������ <font color=red><%=MaxTitleLen%></font> ���ַ���������� <font color=red><%=MaxMsgLen %></font> ���ַ�

</span><br />
                  <asp:Button CssClass="button" runat="server" ID="ButtonReply" Text="�ظ�����" OnClick="ButtonReply_Click" />
                    &nbsp;&nbsp;
                    <input name="reset" class="button" type="reset" value=" ���� "/>
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

