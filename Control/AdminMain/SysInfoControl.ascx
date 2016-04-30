<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="SysInfoControl.ascx.cs" Inherits="Kesion.NET.WebSite.SysInfoControl" %>
<%@ Import Namespace="Kesion.Publics" %>
<div class="tabs_header">
    <ul class="tabs">
    <li class="active"><a href="?action=SysInfo"><span>查看系统信息</span></a></li>
    <li><a href="?action=WebMasterTool"><span>站长工具(PR/Alexa/收录查询)</span></a></li>
    </ul>
</div>		

 <style>
 .CTable td{padding:2px;}
 </style>
      <table cellSpacing=1 cellPadding=5 width="99%"  class="CTable" border=0>
    <tr>
      <td>

              <table height=30 cellSpacing=1 cellPadding=1 width="100%" border=0>
                <tr class="CTitle">
                  <td style="text-align:left"><b>.NET 服务器相关参数</b></td>
                </tr>
              </table>
              <table cellSpacing=0 cellPadding=0 width="100%" border=0>
                <tr>
                  <td width="135">服务器名称</td>
                  <td width="316"><asp:Label ID="servername" runat="server" Text="Label"></asp:Label></td>
                  <td width="132">服务器IP地址</td>
                  <td width="361" height=25>
                      <asp:label ID="serverip" runat="server" /></td>
                </tr>
                <tr><td colspan="4" background=../images/underline.gif height=1></td></tr>
                <tr>
                  <td width="135">服务器操作系统</td>
                  <td width="316"><asp:label ID="serverms" runat="server" /></td>
                  <td width="132">服务器域名:</td>
                  <td width="361" height=25><asp:label ID="server_name" runat="server" /></td>
                </tr>
                <tr><td colspan="4" background=../images/underline.gif height=1></td></tr>
                <tr>
                  <td width="135"><span class="td1">服务器IIS版本</span></td>
                  <td width="316"><asp:label ID="serversoft" runat="server" /></td>
                  <td width="132"><span class="td1">.NET解释引擎版本</span></td>
                  <td width="361" height=25><asp:label ID="servernet" runat="server" /></td>
                </tr>
                <tr><td colspan="4" background=../images/underline.gif height=1></td></tr>
                <tr>
                  <td width="135"><span class="td2">HTTPS</span></td>
                  <td width="316"><asp:label ID="serverhttps" runat="server" /></td>
                  <td width="132"><span class="td2">HTTP访问端口</span></td>
                  <td width="361" height=25><asp:label ID="serverport" runat="server" /></td>
                </tr>
                <tr><td colspan="4" background=../images/underline.gif height=1></td></tr>
                <tr>
                  <td width="135"><span class="td1">服务端脚本执行超时</span></td>
                  <td width="316"><asp:label ID="serverout" runat="server" />
				  秒</td>
                  <td width="132"><span class="td1">服务器当前时间</span></td>
                  <td width="361" height=25><asp:label ID="servertime" runat="server" /></td>
                </tr>
                <tr><td colspan="4" background=../images/underline.gif height=1></td></tr>
                <tr>
                  <td width="135"><span class="td2">执行文件绝对路径</span></td>
                  <td height="25" colspan="3"><asp:label ID="servernpath" runat="server" /></td>
                </tr>
                <tr><td colspan="4" background=../images/underline.gif height=1></td></tr>
                <tr>
                  <td width="135"><span class="td1">虚拟目录绝对路径</span></td>
                  <td height="25" colspan="3"><asp:label ID="serverppath" runat="server" /></td>
                </tr>
                <tr><td colspan="4" background=../images/underline.gif height=1></td></tr>
        </table>
		
		        <table height=30 cellSpacing=1 cellPadding=1 width="100%" border=0 style="margin-top:5px;">
                <tr class="CTitle">
                  <td style="text-align:left"><b>客户端相关信息</b></td>
                </tr>
              </table>
			  
              <table cellSpacing=0 cellPadding=0 width="100%" border=0>
                <tr>
                  <td width="135">你的IP地址</td>
                  <td width="316"><asp:label ID="cip" runat="server"></asp:label></td>
                  <td width="132">你的操作系统</td>
                  <td width="361" height=25>
                      <asp:label ID="ms" runat="server" /></td>
                </tr>
                <tr><td colspan="4" background=../images/underline.gif height=1></td></tr>
                <tr>
                  <td width="135">你的浏览器类型</td>
                  <td width="316"><asp:label ID="ie" runat="server" /></td>
                  <td width="132">浏览器版本</td>
                  <td width="361" height=25><asp:label ID="vi" runat="server" /></td>
                </tr>
                <tr><td colspan="4" background=../images/underline.gif height=1></td></tr>
                <tr>
                  <td width="135">支持JavaScript</td>
                  <td width="316"><asp:label ID="javas" runat="server" /></td>
                  <td width="132">支持VbScript</td>
                  <td width="361" height=25><asp:label ID="vbs" runat="server" /></td>
                </tr>
                <tr><td colspan="4" background=../images/underline.gif height=1></td></tr>
                <tr>
                  <td width="135">支持JavaApplets</td>
                  <td width="316"><asp:label ID="javaa" runat="server" /></td>
                  <td width="132">支持Cookies</td>
                  <td width="361" height=25><asp:label ID="cookies" runat="server" /></td>
                </tr>
                <tr><td colspan="4" background=../images/underline.gif height=1></td></tr>
                <tr>
                  <td width="135">语言:</td>
                  <td width="316"><asp:label ID="cl" runat="server"></asp:label></td>
                  <td width="132">IFrames:</td>
                  <td width="361" height=25><asp:label ID="frames" runat="server" /></td>
                </tr>
               
                <tr><td colspan="4" background=../images/underline.gif height=1></td></tr>
        </table>
		
      </td>
    </tr>
  </table>
<%=KSCMS.CopyRight() %>