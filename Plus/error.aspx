<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="error.aspx.cs" Inherits="Kesion.NET.WebSite.Plus.error" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title>操作提示信息</title>
    <script src="<%=ResolveUrl("~/ks_inc/jquery.js")%>" type="text/javascript"></script>
    <script src="<%=ResolveUrl("~/ks_inc/kesion.common.js")%>"></script>
    <style type="text/css">
    ul,li{list-style-type:none;}
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
     <script>
         <%if (isclose==3) {%>frameElement.api.opener.<%} %>jQuery.dialog.alert('<%= message%>',function(){<%=dofun%>});</script>
    </div>
    </form>
</body>
</html>
