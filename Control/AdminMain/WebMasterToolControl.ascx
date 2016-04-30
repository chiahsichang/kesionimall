<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="WebMasterToolControl.ascx.cs" Inherits="Kesion.NET.WebSite.WebMasterToolControl" %>
<div class="tabs_header">
    <ul class="tabs">
    <li><a href="?action=SysInfo"><span>查看系统信息</span></a></li>
    <li class="active"><a href="?action=WebMasterTool"><span>站长工具(PR/Alexa/收录查询)</span></a></li>
    </ul>
</div>		
<style>
.cxtest{width:410px;padding-top:10px;padding-bottom:10px;}
.cxtest span{font-size:14px;font-weight:bold;width:150px; float:left; color:#555;}
.cxtest .cxbox{ background:url(../../SysImg/default/cxbg.gif) no-repeat left top; height:28px; line-height:28px;width:250px; float:right;}
.cxtest .cxbox .button{width:40px; float:right; border:none;color:#000; background:none; height:28px; line-height:28px;}
</style>
<div class="cxtest mainarea" >
<span><img src="../../SysImg/default/icon001.gif" align="absmiddle"/> 您的网站域名：</span><div class="cxbox"><input style="height:24px;line-height:24px;width:193px;border: 0px solid red; margin-left:15px;margin-top:2px;color:#666; font-size:14px; float:left;" type="text" name="domain" id="domain" value="<%=HttpContext.Current.Request.Url.Host %>"/>
 <input type='button'  value='查询' class="button" onclick="window.open('http://tool.kesion.com/?w='+jQuery('#domain').val())" /></div>
</div><br />
  <script type="text/javascript">
		showtips('<span class="state"><strong>说明：</strong><br /></span>说明：利用本工具您可以查询指定网站的Google PageRank、网站被各大搜索引擎收录情况、网站Alexa排名等。');
</script>
 
 