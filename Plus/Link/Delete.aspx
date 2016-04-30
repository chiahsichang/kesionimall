<%@ Page Language="C#" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.FriendLink_Delete" Codebehind="Delete.aspx.cs" %>

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>删除友情链接站点</title>
        <link href="/images/home.css" rel="stylesheet" />

</head>
<body>
    <form id="form1" runat="server">
    <div>
        <br />
    <table width="500" border="0" cellpadding="1" cellspacing="1" class="table_border" align="center">
          <tr class="link_table_title">
          <td style="width: 499px" align="center">
              删除友情链接</td>
          </tr>          <tr><td style="width: 499px">
     <table width="100%" border="0" align="center" cellpadding="1" cellspacing="1">
    <tr>
      <td>
        <table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="20%" height="25" align="center">
              <div align="center">
                  网站名称：</div></td>
            <td width="542" height="25">
                <asp:Label ID="SiteName" runat="server" Text="Label"></asp:Label></td>
          </tr>       
         <tr>
            <td height="25" align="center">
              <div align="center">
                  网站站长：</div></td>
            <td height="25">
                <asp:Label ID="WebMaster" runat="server" Text="Label"></asp:Label></td>          </tr>
          <tr>
            <td height="25" align="center">
              <div align="center">
                  站长信箱：</div></td>
            <td height="25">
                <asp:Label ID="Email" runat="server" Text="Label"></asp:Label></td>
          </tr>
          <tr>            
          <td align="center" style="height: 25px">
              网站地址：</td>
            <td style="height: 25px">
                    <asp:Label ID="URL" runat="server" Text="Label"></asp:Label></td>          </tr>
          <tr ID="LinkArea">
            <td height="25" align="center">
                Logo地址：</td>
            <td height="25"> 
                <asp:Label ID="Logo" runat="server" Text="Label"></asp:Label></td>          </tr>
          <tr>
            <td height="25" align="center">              <div align="center">
                网站简介：</div></td>
            <td height="25">
                <asp:Label ID="Note" runat="server" Text="Label"></asp:Label></td>          </tr>
            <tr>
                <td align="center" height="25">
                    原设密码：</td>
                <td height="25">
                    <asp:TextBox ID="PassWord" TextMode="Password" runat="server"></asp:TextBox><span style="color: #ff0000">*必须输入<asp:RequiredFieldValidator
                        ID="RequiredFieldValidator1" runat="server" ControlToValidate="PassWord" Display="None"
                        ErrorMessage="管理密码必须输入"></asp:RequiredFieldValidator></span></td>
            </tr>
        </table>
       </td>    </tr>
    </table>
  <table width="100%" height="38" border="0" cellpadding="0" cellspacing="0">
    <tr>
      <td height="40" align="center">
          <asp:TextBox ID="LinkID" runat="server"></asp:TextBox>
          <asp:Button ID="Button1" runat="server" Text="确定删除" OnClick="Button1_Click" />
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
