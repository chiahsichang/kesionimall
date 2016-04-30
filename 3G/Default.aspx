<%@ Page Language="C#" AutoEventWireup="true"  %>
<%@ Import Namespace="Kesion.Cache" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>手机模拟器-<%=MyCache.GetCacheConfig(1) %></title>

    <style type="text/css">
header, hgroup, menu, nav, section, menu,footer,article,figure,figcaption,commend,aside{display:block;margin:0;padding:0;}
body,p,input,h1,h2,h3,h4,ul,li,dl,dt,dd,form,textarea{
	margin:0;
	padding:0;
	list-style:none;
	vertical-align:middle;
}
body{ 
	font-family:"\5FAE\8F6F\96C5\9ED1", Helvetica;
	font-size:16px; 
	
}
img {border:0; }

.main{
	width:1000px;
	margin:auto;
	
}

.main .foot{
	width:530px; height:100px; float:left; background:url(images/gantan.png) no-repeat; padding-top:90px;	font-size:24px;
	margin-top:120px;
}
.main .foot a{color:#2c84d6; padding-left:80px; font-family:simsun;font-size:18px;}
.main .iframe{
	width:392px; float:right;
	height:645px;
	padding-top:149px;
	padding-left:56px;
	background:url(images/mobilebg02.png) no-repeat 50% 0;
}



</style>
<SCRIPT LANGUAGE="JavaScript"> 
<!--
    if (navigator.platform != "Win32") {
        location.href = "index.aspx";
    }
//-->
</SCRIPT>

</head>
<body style="background:url(../images/downloat/baiyun.png) repeat-x">
	<div style="background:url(../images/downloat/baiyun02.png) no-repeat 50% 0;">
		<form id="form1" runat="server">
	   
	
	   <div class="main">
		<div class="foot"><font color="#e44242"><a href="#"><%=MyCache.GetCacheConfig(5)+MyCache.GetCacheConfig(0)%></a></div>
		<div class="iframe">
			<iframe width="340" id="mainiframe" height="513" scrolling="auto" marginwidth=0 marginheight=0 frameborder="0" src="index.aspx"></iframe>
	 
		</div>
	</div>
	<div style="clear:both;height:15px; overflow:hidden"></div>
	
		</form>
	</div>
</body>
</html>

<script runat="server" type="text/C#">

        protected void Page_Load(object sender, EventArgs e)
        {
        }
</script>