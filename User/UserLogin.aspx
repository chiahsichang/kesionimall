<%@ Page Language="C#" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.User_UserLogin" Codebehind="UserLogin.aspx.cs" %>
<%@ Import Namespace="Kesion.Publics" %>
<%@ Import Namespace="Kesion.Cache" %>
<%@ Import Namespace="Kesion.BLL" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title>�û���¼</title>
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
FONT-FAMILY:����;FONT-SIZE: 9pt;line-height: 130%;
}
a{text-decoration: none;} /* �������»���,��Ϊunderline */
a:link {color: #000000;} /* δ���ʵ����� */
a:visited {color: #333333;} /* �ѷ��ʵ����� */
a:hover{COLOR: #AE0927;} /* ����������� */
a:active {color: #0000ff;} /* ����������� */
#PopLogin td{font-size:14px;line-height:180%}
#PopLogin td a{color:#336699;text-decoration:underline}
#PopLogin td span{color:#5F5C67;font-size:12px}
#PopLogin td input{margin:2px}

-->
</style>
<script>
    function check() {
        if ($("#<%=this.UserName.ClientID %>").val() == '') {
            KesionJS.Alert('�������¼�û�����', '$("#<%=this.UserName.ClientID %>").focus();');
            return false;
        }
        if ($("#<%=this.PassWord.ClientID %>").val() == '') {
            KesionJS.Alert('�������¼���룡', '$("#<%=this.PassWord.ClientID %>").focus();');
            return false;
        }
        <%if (MyCache.GetCacheConfig(3).IndexOf("user/login.aspx") !=-1)
        { %>
        if ($("#<%=this.VerifyCode.ClientID %>").val() == '') {
            KesionJS.Alert('��������֤�룡', '$("#<%=this.VerifyCode.ClientID %>").focus();');
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
                        û���˺ţ�<a href="<%=BaseFun.GetRewriteUrl("reg") %>" target="_blank">����ע��</a><br/>
				��������, <a href="<%=BaseFun.GetRewriteUrl("getpassword") %>"  target="_blank">��Ҫ�һ�</a>
				
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
                        tp = "<br/>���ٵ�¼��" + tp;
                    }		    
                    Response.Write(tp);
		%>
				
				</td>
                    <td style="text-align: right; width: 65px;">
                        �û�����
                    </td>
                    <td>
                        <asp:TextBox ID="UserName" CssClass="textbox" MaxLength="20" Width="104px" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="UserName"
                            Display="None" ErrorMessage="�������û���"></asp:RequiredFieldValidator>
                    </td>
                </tr>
        <tr>
            <td style="text-align: right; width: 65px;">
                ��&nbsp; �룺</td>
            <td>
                <asp:TextBox ID="PassWord" TextMode="password" CssClass="textbox" runat="server" Width="104px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="Password"
                    Display="None" ErrorMessage="����������"></asp:RequiredFieldValidator></td>
        </tr>
        <tr id="vefify" runat="server">
            <td style="text-align: right; width: 65px;">
                ��֤�룺</td>
            <td>
                <asp:TextBox ID="VerifyCode" CssClass="textbox" Width="48px" runat="server"></asp:TextBox>
                <img src="../Plus/ValidateCode.aspx" border="0" style="cursor:hand" onClick="this.src='../Plus/ValidateCode.aspx?t='+Math.random();" />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="VerifyCode"
                    Display="None" ErrorMessage="��������֤��"></asp:RequiredFieldValidator></td>
        </tr>
        <tr>
            <td colspan="2" style="text-align: center">
             <asp:Button ID="Button1" runat="server" OnClientClick="return(check());" Text="�� ¼" OnClick="Button1_Click" />
            <asp:CheckBox ID="Cookies" runat="server" Checked="true" Text="���õ�¼" />
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
