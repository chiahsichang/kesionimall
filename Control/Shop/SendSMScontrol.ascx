<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="SendSMScontrol.ascx.cs" Inherits="Kesion.NET.WebSite.Shop.SendSMSOrderControl" %>
<%@ Import Namespace="Kesion.Cache"%>

<table class="Border" style="margin-top:5px" height="100%" cellSpacing=1 cellPadding=2 width="99%" align="center" border=0>
    <tr class="Title" align=middle>
      <td colSpan=2 height=25><B>������Ϣ���ѿͻ�����</B></td>
    </tr>
    <tr class=tdbg>
      <td align=right width="12%">�ʼ����⣺</td>
      <td>
       <asp:TextBox ID="TxtTitle" CssClass="textbox" runat="server" Width="400px"></asp:TextBox>
       </td>
        
    </tr>
    <tr class=tdbg>
      <td align=right width="12%">�������ݣ�</td>
      <td>
       <asp:TextBox TextMode="MultiLine" ID="TxtRemark" runat="server" style='width:80%;height:200px'></asp:TextBox>
     <% Kesion.APPCode.EditorAPI.EchoEditor("editor", this.TxtRemark.ClientID, "Basic");%>

       </td>
        
    </tr>
    
    <tr class=tdbg>
      <td height="50" align=right>����ѡ�</td>
      <td>
            <asp:CheckBox ID="SendMessageToUser" runat="server" Checked="true" Text="վ�ڶ��Ŵߵ�" />
      <asp:CheckBox ID="SendMailToUser" runat="server" Checked="true" Text="�����ʼ��ߵ�" />
     <%
       if (MyCache.GetCacheConfig(32) == "1")
        {  
      %>
      <asp:CheckBox ID="SendMobileToUser" runat="server" Checked="true" Text="�����ֻ����Ŵߵ�" />���ֻ��������ݣ�
     <br /> �� �� �ţ�<asp:TextBox CssClass="textbox" ID="TxtMobile" runat="server" Width="200px" /><br />
            �������ݣ�<asp:TextBox TextMode="MultiLine" ID="TxtSmsContent" CssClass="textbox" runat="server" style='width:400px;height:50px'></asp:TextBox>
      <%} %>
      </td>
        
    </tr>
    

    <tr class=tdbg align=middle>
      <td colSpan=2 height=50>
      <asp:Button ID="BtnSave" runat="server" Text="ȷ������" CssClass="button" OnClick="BtnSave_Click" />
 &nbsp;
        <Input class=button onclick="parent.box.close();" type=button value=ȡ������ name=Submit></td>
    </tr>
  </table>
