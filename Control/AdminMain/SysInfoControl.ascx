<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="SysInfoControl.ascx.cs" Inherits="Kesion.NET.WebSite.SysInfoControl" %>
<%@ Import Namespace="Kesion.Publics" %>
<div class="tabs_header">
    <ul class="tabs">
    <li class="active"><a href="?action=SysInfo"><span>�鿴ϵͳ��Ϣ</span></a></li>
    <li><a href="?action=WebMasterTool"><span>վ������(PR/Alexa/��¼��ѯ)</span></a></li>
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
                  <td style="text-align:left"><b>.NET ��������ز���</b></td>
                </tr>
              </table>
              <table cellSpacing=0 cellPadding=0 width="100%" border=0>
                <tr>
                  <td width="135">����������</td>
                  <td width="316"><asp:Label ID="servername" runat="server" Text="Label"></asp:Label></td>
                  <td width="132">������IP��ַ</td>
                  <td width="361" height=25>
                      <asp:label ID="serverip" runat="server" /></td>
                </tr>
                <tr><td colspan="4" background=../images/underline.gif height=1></td></tr>
                <tr>
                  <td width="135">����������ϵͳ</td>
                  <td width="316"><asp:label ID="serverms" runat="server" /></td>
                  <td width="132">����������:</td>
                  <td width="361" height=25><asp:label ID="server_name" runat="server" /></td>
                </tr>
                <tr><td colspan="4" background=../images/underline.gif height=1></td></tr>
                <tr>
                  <td width="135"><span class="td1">������IIS�汾</span></td>
                  <td width="316"><asp:label ID="serversoft" runat="server" /></td>
                  <td width="132"><span class="td1">.NET��������汾</span></td>
                  <td width="361" height=25><asp:label ID="servernet" runat="server" /></td>
                </tr>
                <tr><td colspan="4" background=../images/underline.gif height=1></td></tr>
                <tr>
                  <td width="135"><span class="td2">HTTPS</span></td>
                  <td width="316"><asp:label ID="serverhttps" runat="server" /></td>
                  <td width="132"><span class="td2">HTTP���ʶ˿�</span></td>
                  <td width="361" height=25><asp:label ID="serverport" runat="server" /></td>
                </tr>
                <tr><td colspan="4" background=../images/underline.gif height=1></td></tr>
                <tr>
                  <td width="135"><span class="td1">����˽ű�ִ�г�ʱ</span></td>
                  <td width="316"><asp:label ID="serverout" runat="server" />
				  ��</td>
                  <td width="132"><span class="td1">��������ǰʱ��</span></td>
                  <td width="361" height=25><asp:label ID="servertime" runat="server" /></td>
                </tr>
                <tr><td colspan="4" background=../images/underline.gif height=1></td></tr>
                <tr>
                  <td width="135"><span class="td2">ִ���ļ�����·��</span></td>
                  <td height="25" colspan="3"><asp:label ID="servernpath" runat="server" /></td>
                </tr>
                <tr><td colspan="4" background=../images/underline.gif height=1></td></tr>
                <tr>
                  <td width="135"><span class="td1">����Ŀ¼����·��</span></td>
                  <td height="25" colspan="3"><asp:label ID="serverppath" runat="server" /></td>
                </tr>
                <tr><td colspan="4" background=../images/underline.gif height=1></td></tr>
        </table>
		
		        <table height=30 cellSpacing=1 cellPadding=1 width="100%" border=0 style="margin-top:5px;">
                <tr class="CTitle">
                  <td style="text-align:left"><b>�ͻ��������Ϣ</b></td>
                </tr>
              </table>
			  
              <table cellSpacing=0 cellPadding=0 width="100%" border=0>
                <tr>
                  <td width="135">���IP��ַ</td>
                  <td width="316"><asp:label ID="cip" runat="server"></asp:label></td>
                  <td width="132">��Ĳ���ϵͳ</td>
                  <td width="361" height=25>
                      <asp:label ID="ms" runat="server" /></td>
                </tr>
                <tr><td colspan="4" background=../images/underline.gif height=1></td></tr>
                <tr>
                  <td width="135">������������</td>
                  <td width="316"><asp:label ID="ie" runat="server" /></td>
                  <td width="132">������汾</td>
                  <td width="361" height=25><asp:label ID="vi" runat="server" /></td>
                </tr>
                <tr><td colspan="4" background=../images/underline.gif height=1></td></tr>
                <tr>
                  <td width="135">֧��JavaScript</td>
                  <td width="316"><asp:label ID="javas" runat="server" /></td>
                  <td width="132">֧��VbScript</td>
                  <td width="361" height=25><asp:label ID="vbs" runat="server" /></td>
                </tr>
                <tr><td colspan="4" background=../images/underline.gif height=1></td></tr>
                <tr>
                  <td width="135">֧��JavaApplets</td>
                  <td width="316"><asp:label ID="javaa" runat="server" /></td>
                  <td width="132">֧��Cookies</td>
                  <td width="361" height=25><asp:label ID="cookies" runat="server" /></td>
                </tr>
                <tr><td colspan="4" background=../images/underline.gif height=1></td></tr>
                <tr>
                  <td width="135">����:</td>
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