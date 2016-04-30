<%@ Page Language="C#" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.Admin_Include_SaveBeyondfile" Codebehind="SaveBeyondfile.aspx.cs" %>
<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>无标题页</title>
    <link href="../../admin/images/style.css" rel="stylesheet" type="text/css" />
    <meta http-equiv="pragma" content="no-cache"> 
</head>
<body class="righttd">
    <form id="form1" runat="server">
    <div style="text-align:center">
        <br />
    远程地址：<asp:TextBox ID="TextBox1" runat="server" Text="" CssClass="textbox"></asp:TextBox>
        <asp:Button ID="Button1" runat="server" Text="开始抓取" OnClick="Button1_Click"  CssClass="button"/><asp:RequiredFieldValidator
            ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox1" ErrorMessage="请输入远程地址" Display="Dynamic"></asp:RequiredFieldValidator><br />
        <span style="color: #ff0000">形如：http://www.kesion.com/images/logo.png</span></div>
    </form>
</body>

</html>
