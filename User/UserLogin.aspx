<%@ Page Language="C#" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.User_UserLogin" Codebehind="UserLogin.aspx.cs" %>
<%@ Import Namespace="Kesion.Publics" %>
<%@ Import Namespace="Kesion.Cache" %>
<%@ Import Namespace="Kesion.BLL" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title>用户登录</title>
    <script src="../ks_inc/jquery.js"></script>
    <script src="../ks_inc/Kesion.Common.js"></script>
    <style type="text/css">
<!--
.textbox
{
BACKGROUND-COLOR: #ffffff;

COLOR: #666666;
height:26px;line-height:26px;border:1px solid #ccc;
 font-size: 9pt
}
TD
{
FONT-FAMILY:宋体;FONT-SIZE: 9pt;line-height: 130%;
}
a{text-decoration: none;} /* 链接无下划线,有为underline */
a:link {color: #000000;} /* 未访问的链接 */
a:visited {color: #333333;} /* 已访问的链接 */
a:hover{COLOR: #AE0927;} /* 鼠标在链接上 */
a:active {color: #0000ff;} /* 点击激活链接 */
#PopLogin td{font-size:14px;line-height:180%}
#PopLogin td a{color:#336699;text-decoration:underline}
#PopLogin td span{color:#5F5C67;font-size:12px}
#PopLogin td input{margin:2px}

-->
</style>
<script>
    function check() {
        if ($("#<%=this.UserName.ClientID %>").val() == '') {
            KesionJS.Alert('请输入登录用户名！', '$("#<%=this.UserName.ClientID %>").focus();');
            return false;
        }
        if ($("#<%=this.PassWord.ClientID %>").val() == '') {
            KesionJS.Alert('请输入登录密码！', '$("#<%=this.PassWord.ClientID %>").focus();');
            return false;
        }
        <%if (MyCache.GetCacheConfig(3).IndexOf("user/login.aspx") !=-1)
        { %>
        if ($("#<%=this.VerifyCode.ClientID %>").val() == '') {
            KesionJS.Alert('请输入验证码！', '$("#<%=this.VerifyCode.ClientID %>").focus();');
            return false;
        }

        <%} %>
    }
</script>
</head>
<body leftmargin=0 topmargin=0 bgcolor="transparent">
    <form id="form1" runat="server">
        <asp:Panel ID="LoginPanel" runat="server" Width="100%">
        <br /><br />
        <table id="PopLogin" cellspacing="0" width="95%" align="center">
                <tr>
                    <td rowspan="4" style="border-right:solid 1px #cccccc; width: 155px;">
                        没有账号？<a href="<%=BaseFun.GetRewriteUrl("reg") %>" target="_blank">现在注册</a><br/>
				密码忘了, <a href="<%=BaseFun.GetRewriteUrl("getpassword") %>"  target="_blank">我要找回</a>
				
				<br />
				<%
        
                    (new TemporaryVar()).ComeUrl = KSCMS.GetComeUrl();

                    StringBuilder sb = new StringBuilder();
                    if (MyCache.GetAccountAPIConfig("qq", "enable") == "true")
                    {
                        sb.AppendFormat(@"<a href=""{1}"" target=""_parent""><img border=""0"" src=""{{$GetSiteUrl}}sysimg/default/icon_qq.png"" align=""absmiddle"" title=""{0}""/></a>", MyCache.GetAccountAPIConfig("qq", "name"), BaseFun.GetRewriteUrl("qqlogin"));
                    }
                    if (MyCache.GetAccountAPIConfig("sina", "enable") == "true")
                    {
                        sb.AppendFormat(@" <a href=""{1}"" target=""_parent""><img border=""0"" src=""{{$GetSiteUrl}}sysimg/default/icon_sina.png"" align=""absmiddle"" title=""{0}""/></a>", MyCache.GetAccountAPIConfig("sina", "name"), BaseFun.GetRewriteUrl("sinalogin"));
                    }
                    if (MyCache.GetAccountAPIConfig("alipay", "enable") == "true")
                    {
                        sb.AppendFormat(@" <a href=""{1}"" target=""_parent""><img border=""0"" src=""{{$GetSiteUrl}}sysimg/default/icon_alipay.png"" align=""absmiddle"" title=""{0}""/></a>", MyCache.GetAccountAPIConfig("alipay", "name"), BaseFun.GetRewriteUrl("alipaylogin"));
                    }
                    string tp = sb.ToString().Replace("{$GetSiteUrl}", MyCache.GetCacheConfig(5) + KSCMS.GetInstallDir());
                    if (!string.IsNullOrEmpty(tp))
                    {
                        tp = "<br/>快速登录：" + tp;
                    }		    
                    Response.Write(tp);
		%>
				
				</td>
                    <td style="text-align: right; width: 65px;">
                        用户名：
                    </td>
                    <td>
                        <asp:TextBox ID="UserName" CssClass="textbox" MaxLength="20" Width="104px" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="UserName"
                            Display="None" ErrorMessage="请输入用户名"></asp:RequiredFieldValidator>
                    </td>
                </tr>
        <tr>
            <td style="text-align: right; width: 65px;">
                密&nbsp; 码：</td>
            <td>
                <asp:TextBox ID="PassWord" TextMode="password" CssClass="textbox" runat="server" Width="104px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="Password"
                    Display="None" ErrorMessage="请输入密码"></asp:RequiredFieldValidator></td>
        </tr>
        <tr id="vefify" runat="server">
            <td style="text-align: right; width: 65px;">
                验证码：</td>
            <td>
                <asp:TextBox ID="VerifyCode" CssClass="textbox" Width="48px" runat="server"></asp:TextBox>
                <img src="../Plus/ValidateCode.aspx" border="0" style="cursor:hand" onClick="this.src='../Plus/ValidateCode.aspx?t='+Math.random();" />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="VerifyCode"
                    Display="None" ErrorMessage="请输入验证码"></asp:RequiredFieldValidator></td>
        </tr>
        <tr>
            <td colspan="2" style="text-align: center">
             <asp:Button ID="Button1" runat="server" OnClientClick="return(check());" Text="登 录" OnClick="Button1_Click" />
            <asp:CheckBox ID="Cookies" runat="server" Checked="true" Text="永久登录" />
                <asp:ValidationSummary ID="ValidationSummary1" runat="server" ShowMessageBox="True"
                    ShowSummary="False" />
            </td>
         
        </tr>
                </table>
        </asp:Panel>
    
       <asp:Panel ID="LoginOKPanel" runat="server" Width="100%" Visible="false">
           <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label></asp:Panel>
    </form>
</body>
</html>
