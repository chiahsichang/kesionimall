<%@ Page Language="C#" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.Admin_Include_SaveBeyondfile" Codebehind="SaveBeyondfile.aspx.cs" %>
<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>�ޱ���ҳ</title>
    <link href="../../admin/images/style.css" rel="stylesheet" type="text/css" />
    <meta http-equiv="pragma" content="no-cache"> 
</head>
<body class="righttd">
    <form id="form1" runat="server">
    <div style="text-align:center">
        <br />
    Զ�̵�ַ��<asp:TextBox ID="TextBox1" runat="server" Text="" CssClass="textbox"></asp:TextBox>
        <asp:Button ID="Button1" runat="server" Text="��ʼץȡ" OnClick="Button1_Click"  CssClass="button"/><asp:RequiredFieldValidator
            ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox1" ErrorMessage="������Զ�̵�ַ" Display="Dynamic"></asp:RequiredFieldValidator><br />
        <span style="color: #ff0000">���磺http://www.kesion.com/images/logo.png</span></div>
    </form>
</body>

</html>
