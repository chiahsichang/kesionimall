<%@ Page Language="C#" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.FriendLink_Delete" Codebehind="Delete.aspx.cs" %>

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>ɾ����������վ��</title>
        <link href="/images/home.css" rel="stylesheet" />

</head>
<body>
    <form id="form1" runat="server">
    <div>
        <br />
    <table width="500" border="0" cellpadding="1" cellspacing="1" class="table_border" align="center">
          <tr class="link_table_title">
          <td style="width: 499px" align="center">
              ɾ����������</td>
          </tr>          <tr><td style="width: 499px">
     <table width="100%" border="0" align="center" cellpadding="1" cellspacing="1">
    <tr>
      <td>
        <table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="20%" height="25" align="center">
              <div align="center">
                  ��վ���ƣ�</div></td>
            <td width="542" height="25">
                <asp:Label ID="SiteName" runat="server" Text="Label"></asp:Label></td>
          </tr>       
         <tr>
            <td height="25" align="center">
              <div align="center">
                  ��վվ����</div></td>
            <td height="25">
                <asp:Label ID="WebMaster" runat="server" Text="Label"></asp:Label></td>          </tr>
          <tr>
            <td height="25" align="center">
              <div align="center">
                  վ�����䣺</div></td>
            <td height="25">
                <asp:Label ID="Email" runat="server" Text="Label"></asp:Label></td>
          </tr>
          <tr>            
          <td align="center" style="height: 25px">
              ��վ��ַ��</td>
            <td style="height: 25px">
                    <asp:Label ID="URL" runat="server" Text="Label"></asp:Label></td>          </tr>
          <tr ID="LinkArea">
            <td height="25" align="center">
                Logo��ַ��</td>
            <td height="25"> 
                <asp:Label ID="Logo" runat="server" Text="Label"></asp:Label></td>          </tr>
          <tr>
            <td height="25" align="center">              <div align="center">
                ��վ��飺</div></td>
            <td height="25">
                <asp:Label ID="Note" runat="server" Text="Label"></asp:Label></td>          </tr>
            <tr>
                <td align="center" height="25">
                    ԭ�����룺</td>
                <td height="25">
                    <asp:TextBox ID="PassWord" TextMode="Password" runat="server"></asp:TextBox><span style="color: #ff0000">*��������<asp:RequiredFieldValidator
                        ID="RequiredFieldValidator1" runat="server" ControlToValidate="PassWord" Display="None"
                        ErrorMessage="���������������"></asp:RequiredFieldValidator></span></td>
            </tr>
        </table>
       </td>    </tr>
    </table>
  <table width="100%" height="38" border="0" cellpadding="0" cellspacing="0">
    <tr>
      <td height="40" align="center">
          <asp:TextBox ID="LinkID" runat="server"></asp:TextBox>
          <asp:Button ID="Button1" runat="server" Text="ȷ��ɾ��" OnClick="Button1_Click" />
          <asp:ValidationSummary ID="ValidationSummary1" runat="server" ShowMessageBox="True"
              ShowSummary="False" />
      </td>
    </tr>
  </table>
</td></tr></table>
    </div>
    </form>
</body>
</html>
