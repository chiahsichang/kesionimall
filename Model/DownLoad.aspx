<%@ Page Language="C#" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.Model_DownLoad" Codebehind="DownLoad.aspx.cs" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>下载提示</title>
	<script src="../ks_inc/jquery.js" type="text/javascript"></script>
	<script src="../ks_inc/kesion.common.js" type="text/javascript"></script>
    <script> <!-- window.moveTo(100,100); window.resizeTo(550,400);//--></script>
	<style type="text/css">
	    body {font-size: 12px;font-family: 宋体;}
	    td {font-size: 12px; font-family: 宋体; line-height: 18px;table-layout:fixed;word-break:break-all}a {color: #555555; text-decoration: none}
	    a:hover {color: #FF8C40; text-decoration: underline}
	    th{ background-color: #0A95D2;color: white;font-size: 12px;font-weight:bold;height: 25px;}
	    .TableRow1 {background-color:#F7F7F7;}.TableRow2 {background-color:#F0F0F0;}
	    .TableBorder {border: 1px #3795D2 solid ; background-color: #FFFFFF;font: 12px;}
	    </style>
	 </head>
	 <body><br /><br />
	 <table width=500 border=0 align=center cellpadding=0 cellspacing=0 class=TableBorder>
	 <tr>  <th>系 统 提 示</th></tr><tr height=110>
	 <td class=TableRow1 align=center>
	  <%=MsgStr %>
	  </td>
	 </tr>
	 <tr height=22>
	 <td align=center class=TableRow2><a href=javascript:window.close()>关闭本窗口...</a></td></tr>
	 </table><br /><br />
	 </body>

</html>