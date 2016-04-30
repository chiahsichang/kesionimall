<%@ Control Language="C#" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.SystemInfoControl" Codebehind="SystemInfoControl.ascx.cs" %>
<%@ Import Namespace="Kesion.Publics" %>
<%@ Import Namespace="Kesion.Cache" %>

<div style="text-align:center">
<span style="cursor:pointer" onclick="window.open('http://www.kesion.com');" title="KESION 官方站"><img border="0" src="http://www.kesion.com/images/logo.png" /></span>
<br />
漳州市芗城区科兴信息技术有限公司 <span style="font-size:18px;">&copy;</span> 版权所有 <Br />
<span class="tips">Copyright 2006-<%=DateTime.Now.Year.ToString() %> kesion.com All Rights Reseved</span>
    </div>
<hr color="#cccccc" />

	当前版本：KesionI<%=Utils.GetSysInfo("//sysinfo/showver") %> Version <%=Utils.GetSysInfo("//sysinfo/version")%>
    <br />
    <span id="updateInfo"></span>
	<%if (MyCache.GetCacheConfig(56).IndexOf('1') >= 0) {%>
	  <span id="OfficialVersion"><img src="../../sysimg/loading.gif" align="absmiddle" />正在获取官方版本号...</span>
	<%} %>
    <span id="hidScript" style="display:none"><script src="http://www.kesion.com/WebSystem/net/Version"></script></span>
    <br />
    最后更新时间：<%=Utils.GetSysInfo("//sysinfo/updatedate") %>
       
               <%if (MyCache.GetCacheConfig(56).IndexOf('4') ==-1)
                 { %>
                 <input type="button" value="检测是否有新版本" onclick="checkNewVersion(0)" class="button" />
               <%} %>

               <!--检测最新版本号开始-->
               <script>
                   function checkNewVersion(autoCheck) {
                       jQuery.ajax({
                           url: "System/KS.Update.aspx",
                           cache: false,
                           data: "action=check",
                           success: function (d) {
                               switch (d) {
                                   case 'enabled': //未开启最新版本检测
                                       if (autoCheck == 0) {
                                           KesionJS.Alert("未开启最新版本检测,请打开admin/ks.update.aspx设置开启！");
                                       }
                                       break;
                                   case 'false': //已经是最新版本
                                       if (autoCheck == 0) {
                                           KesionJS.Alert("您当前已经是最新版本了！");
                                       }
                                       break;
                                   case 'true': //有可用的升级补丁
                                   if (autoCheck == 0) {
                                   alert("系统检测到有可用的升级版本！");
                                   }
                                       parent.openWin("升级提示：", "System/KS.Update.aspx?action=showupdateinfo&rnd="+Math.random(), false, 850, 350);
                                       break;
                               }
                           }
                       });
                   }
                   jQuery(document).ready(function () {
                       <%if (MyCache.GetCacheConfig(56).IndexOf('4') >= 0)
                         { %>
                         checkNewVersion(1);
                       <%} %>
                       jQuery("#OfficialVersion").html(jQuery("#hidScript").html());
                        <%if (MyCache.GetCacheConfig(56).IndexOf('2') >= 0) {%>
                       jQuery("#dtr").html(jQuery("#hidframe").html());
                        <%}%>

                   });
               </script>
               <!--检测最新版本号结束-->

			
<div class="detail" style="font-size:14px;margin-top:15px;">
	警告：本软件受著作权法和国际公约的保护，未经授权擅自复制传播本程序的部分或全部，可能受到严厉的民事及刑事制裁，并在法律的许可范围内受到可能的起诉。 
</div>
			