<%@ Page Language="C#" MasterPageFile="~/User/User.master" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.User_Offer_DelMessage" Title="Untitled Page" Codebehind="Garbagemessage.aspx.cs" %>
<asp:Content ID="Content1" ContentPlaceHolderID="KSContent" Runat="Server">
 <div class="tabs">	
			<ul>
				<li><a href="receivedmessage.aspx">���յ�����Ϣ</a></li>
				<li><a href="sentmessage.aspx">�ҷ�������Ϣ</a></li>
				<li class="puton"><a href="Garbagemessage.aspx">������Ϣ</a></li>
				<li><a href="Sendmessage.aspx">���Ͷ���Ϣ</a></li>
			</ul>
</div>  
<asp:Panel ID="ListPannel" runat="server" Width="100%">

    <div class="toptips">���� <asp:Label ID="LabTotal" runat="server" Text="0"></asp:Label> ���������ԣ�</div>
    <asp:Repeater ID="Repeater1" runat="server" OnItemCommand="Repeater1_ItemCommand">
    <HeaderTemplate>
         <table id="tablist" width="98%" border="0" align="center" cellpadding="2" cellspacing="1" class="border">
      <tr align="center" class="title">
        	<td width="20" align="center">&nbsp;</td>
        	<td align="center">����</td>
            <td align="center" width="150">����</td>
	        <td align="center" width="120">����</td>
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
          <asp:LinkButton ID="LinkButton1" runat="server" CommandArgument='<%# Eval("ID") %>' CommandName="TurnButton">ת�����յ������ԡ�</asp:LinkButton>
          </td>

      </tr>  

     </ItemTemplate>
     <FooterTemplate>
          <tr class="tdbg" style="display:<%# bool.Parse((Repeater1.Items.Count==0).ToString())?"":"none"%>">
                <td class="splittd" style="text-align:center" colspan="4">
                  û��ɾ������Ϣ��
                </td>
     </tr> 

    </table>
     </FooterTemplate>
    </asp:Repeater>
    
        &nbsp;&nbsp;<input type="checkbox" name="chkall" id="chkall" onclick="CheckAll(this.form);"/>ȫѡ  &nbsp;&nbsp; ��ѡ�е���Ϣ<asp:Button ID="ButtonDel" CssClass="button" runat="server" Text="����ɾ��" OnClick="ButtonDel_Click"/> <asp:Button ID="ButtonDelTF" CssClass="button" runat="server" Text="ת�����յ�����Ϣ��" OnClick="ButtonDelTF_Click" />
   
    

    
         <KS:Page ID="Page1" runat="server" />
</asp:Panel>

<asp:Panel ID="ShowPannel" Visible="false" runat="server" Width="100%">
<table width="98%" align="center" class="border" border="0" cellpadding="0" cellspacing="0">
  <tr class="title">
    <td colspan="2">���յ�������</td>
  </tr>

  <tr class="tdbg">
    <td style="word-break:break-all" class="splittd"><b>���⣺</b><asp:Label ID="LabelSubject" runat="server" Text="Label"></asp:Label><br />
      ʱ�䣺<asp:Label ID="LabelAddTime" runat="server" Text="Label"></asp:Label>
        <hr size="1" />
        <strong>��Ҫ����</strong>��<br />
        <asp:Label ID="LabelContent" runat="server" Text="Label"></asp:Label>

      </td>
  </tr>
</table>
<br />
<div style="text-align:center"><asp:Button id="Button1" CssClass="button" runat="server" Text="����ɾ��" OnClick="Button1_Click"></asp:Button> <asp:Button id="Button2" CssClass="button" runat="server" Text="ת�����յ�����Ϣ��" OnClick="Button2_Click"></asp:Button></div>


</asp:Panel>
</asp:Content>

