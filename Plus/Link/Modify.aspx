<%@ Page Language="C#" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.FriendLink_Modify" Codebehind="Modify.aspx.cs" %>

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>�޸���������</title>
   <link href="/images/home.css" rel="stylesheet" />
    <script>
    function SetLogoArea(Value)
{   document.all.LinkArea.style.display=Value;}
    </script>
</head>
<body>
<form runat="server" name="myform">
<br />
        <table width="500" border="0" cellpadding="1" cellspacing="1" class="table_border" align="center">
          <tr class="link_table_title">
          <td style="width: 499px" align="center">�޸���������</td>
          </tr>          <tr><td style="width: 499px">
     <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
      <td>
        <table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="20%" height="25" align="center">
              <div align="center">��վ����</div></td>
            <td width="542" height="25">
                <asp:TextBox ID="SiteName" runat="server"></asp:TextBox>
                <font color="red">*<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"
                    ControlToValidate="SiteName" ErrorMessage="��������վ����"></asp:RequiredFieldValidator></font></td>
          </tr>
          <tr>
            <td height="25" align="center">�������</td>
            <td height="25">
                <asp:DropDownList ID="Classid" runat="server">
                </asp:DropDownList></td>
         </tr>          
         <tr>
            <td height="25" align="center">
              <div align="center">��վվ��</div></td>
            <td height="25">
                <asp:TextBox ID="WebMaster" runat="server"></asp:TextBox>
                <font color="red">*<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server"
                    ControlToValidate="WebMaster" ErrorMessage="������վ��"></asp:RequiredFieldValidator></font></td>          </tr>
          <tr>
            <td height="25" align="center">
              <div align="center">վ������</div></td>
            <td height="25">
                <asp:TextBox ID="Email" runat="server"></asp:TextBox></td>
          </tr>
          <tr>
            <td height="25" align="center">
              <div align="center">ԭ������</div></td>
            <td height="25">
                <asp:TextBox ID="OldPass" runat="server" TextMode="Password"></asp:TextBox><font color="red">*</font><asp:RequiredFieldValidator
                    ID="RequiredFieldValidator3" runat="server" ControlToValidate="OldPass" ErrorMessage="ԭ�������������"></asp:RequiredFieldValidator></td>          </tr>
          <tr>
            <td height="25" align="center">
              <div align="center">��������</div></td>
            <td height="25">
                <asp:TextBox ID="NewPass" runat="server" TextMode="Password"></asp:TextBox><font color=green>�����޸ģ��뱣��Ϊ��</font> </td>          </tr>
          <tr>
            <td height="25" align="center">ȷ������</td>
            <td height="25">
                <asp:TextBox ID="ConNewPass" runat="server" TextMode="Password"></asp:TextBox>
                <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="NewPass"
                    ControlToValidate="ConNewPass" ErrorMessage="��������������벻һ��!"></asp:CompareValidator></td>
          </tr>
          <tr>            <td align="center" style="height: 25px">��վ��ַ</td>
            <td style="height: 25px">
                <asp:TextBox ID="URL" runat="server"></asp:TextBox><font color="red">*<asp:RequiredFieldValidator
                    ID="RequiredFieldValidator4" runat="server" ControlToValidate="URL" ErrorMessage="��վURL��ַ��������"></asp:RequiredFieldValidator></font></td>          </tr>
          <tr>            <td height="25" align="center">��������</td>
            <td height="25">
            <input type="radio" name="LinkType" runat="server" id="LinkTypeTxt" onClick="SetLogoArea('none')" value="0" /> �������� 
            <input type="radio" runat="server" id="LinkTypeLogo" name="LinkType" onClick="SetLogoArea('')" value="1" checked />  LOGO����              </td>
          </tr>          <tr ID="LinkArea">
            <td height="25" align="center">Logo ��ַ</td>
            <td height="25"> 
                <asp:TextBox ID="Logo" runat="server"></asp:TextBox><font color="red"></font></td>          </tr>
          <tr>
            <td height="25" align="center">              <div align="center">��վ���</div></td>
            <td height="25">
                <asp:TextBox ID="Description" runat="server" Height="97px" Width="276px"></asp:TextBox></td>          </tr>
        </table>
       </td>    </tr>
    </table>
  <table width="100%" height="38" border="0" cellpadding="0" cellspacing="0">
    <tr>
      <td height="40" align="center">
          <asp:TextBox ID="LinkID" runat="server"></asp:TextBox>
          <asp:Button ID="Button1" runat="server" Text="ȷ���޸�" OnClick="Button1_Click" />
      </td>
    </tr>
  </table>
</td></tr></table>
</form>
</body>
</html>
