<%@ Control Language="C#" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.SystemInfoControl" Codebehind="SystemInfoControl.ascx.cs" %>
<%@ Import Namespace="Kesion.Publics" %>
<%@ Import Namespace="Kesion.Cache" %>

<div style="text-align:center">
<span style="cursor:pointer" onclick="window.open('http://www.kesion.com');" title="KESION �ٷ�վ"><img border="0" src="http://www.kesion.com/images/logo.png" /></span>
<br />
������ܼ����������Ϣ�������޹�˾ <span style="font-size:18px;">&copy;</span> ��Ȩ���� <Br />
<span class="tips">Copyright 2006-<%=DateTime.Now.Year.ToString() %> kesion.com All Rights Reseved</span>
    </div>
<hr color="#cccccc" />

	��ǰ�汾��KesionI<%=Utils.GetSysInfo("//sysinfo/showver") %> Version <%=Utils.GetSysInfo("//sysinfo/version")%>
    <br />
    <span id="updateInfo"></span>
	<%if (MyCache.GetCacheConfig(56).IndexOf('1') >= 0) {%>
	  <span id="OfficialVersion"><img src="../../sysimg/loading.gif" align="absmiddle" />���ڻ�ȡ�ٷ��汾��...</span>
	<%} %>
    <span id="hidScript" style="display:none"><script src="http://www.kesion.com/WebSystem/net/Version"></script></span>
    <br />
    ������ʱ�䣺<%=Utils.GetSysInfo("//sysinfo/updatedate") %>
       
               <%if (MyCache.GetCacheConfig(56).IndexOf('4') ==-1)
                 { %>
                 <input type="button" value="����Ƿ����°汾" onclick="checkNewVersion(0)" class="button" />
               <%} %>

               <!--������°汾�ſ�ʼ-->
               <script>
                   function checkNewVersion(autoCheck) {
                       jQuery.ajax({
                           url: "System/KS.Update.aspx",
                           cache: false,
                           data: "action=check",
                           success: function (d) {
                               switch (d) {
                                   case 'enabled': //δ�������°汾���
                                       if (autoCheck == 0) {
                                           KesionJS.Alert("δ�������°汾���,���admin/ks.update.aspx���ÿ�����");
                                       }
                                       break;
                                   case 'false': //�Ѿ������°汾
                                       if (autoCheck == 0) {
                                           KesionJS.Alert("����ǰ�Ѿ������°汾�ˣ�");
                                       }
                                       break;
                                   case 'true': //�п��õ���������
                                   if (autoCheck == 0) {
                                   alert("ϵͳ��⵽�п��õ������汾��");
                                   }
                                       parent.openWin("������ʾ��", "System/KS.Update.aspx?action=showupdateinfo&rnd="+Math.random(), false, 850, 350);
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
               <!--������°汾�Ž���-->

			
<div class="detail" style="font-size:14px;margin-top:15px;">
	���棺�����������Ȩ���͹��ʹ�Լ�ı�����δ����Ȩ���Ը��ƴ���������Ĳ��ֻ�ȫ���������ܵ����������¼������Ʋã����ڷ��ɵ���ɷ�Χ���ܵ����ܵ����ߡ� 
</div>
			