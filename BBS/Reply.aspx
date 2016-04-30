<%@ Page Language="C#" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.BBS_Reply" Codebehind="Reply.aspx.cs" %>
<%@ Import Namespace="Kesion.Publics" %>
<%@ Import Namespace="Kesion.Cache" %>
<!DOCTYPE html>
<html>
<head id="Head1" runat="server">
<title>回复帖子</title>
<meta http-equiv=Content-Type content="text/html; charset=utf-8">
<link href="../images/home.css" rel="stylesheet" />
<script src="../ks_inc/jquery.js" type="text/javascript"></script>
<script src="../ks_inc/Kesion.Common.js" type="text/javascript"></script>
<script src="images/club.js"></script>
    <style>
        .button {
            padding:6px;
        }
        .text {
            border:1px solid #ccc;
            padding:5px;
        }
    </style>
    <script>
        function check() {
            if ($("#content").val() == "") {
                KesionJS.Alert("请输入回复内容!","$('#content').focus();");
                
                return false;
            }
            return true;
        }
    </script>
</head>
    <body>
       <form runat="server" id="form1">
            <input type="hidden" name="TopicId" value="<%=KSCMS.S("TopicId") %>" />
           <table width="95%" align="center">
                <tr>
                    <td>
                    <textarea name="content" id="content" style="width:400px;height:120px"></textarea>
                    </td>
                </tr>
                <tr><td height="50">
                <asp:Button ID="BtnSubMit" runat="server" OnClientClick="return(check());" Text="提交回复" CssClass="button" OnClick="BtnSubMit_Click" />
                    </td></tr>
               </table>
    </form>
    </body>
</html>