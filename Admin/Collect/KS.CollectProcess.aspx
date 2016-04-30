<%@ Page Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.Admin_Collect_CollectProcess" Title="Untitled Page" Codebehind="KS.CollectProcess.aspx.cs" %>
<asp:Content ID="Content1" ContentPlaceHolderID="KSContent" Runat="Server">
  <KS:TopNav ID="TopNav2" runat="server" Text="采集工作正在初始化" />
    <asp:Panel ID="PannelStep1" runat="server" Width="100%">
    <div style="text-align:center"><br /><br /><br /><br />
        <script type="text/javascript">
		showtips('<p align="center"><span>本采集系统由漳州科兴信息技术有限公司独立开发,系统正在初始化,请稍候...<img src="../../admin/images/loading.gif"><br/><br /></span><strong><font color=red>使用声明:采集信息如果涉及到版权问题与漳州科兴信息技术有限公司无关!</font></strong><br /><br />');
		</script>
		<script language="javascript" type="text/javascript">
		 Reload=function(){
		  location.href="?ItemId=<%=M_ItemID %>&Action=start";
		 }
		 window.setTimeout("Reload()",3000);
		</script>
    </div>
    </asp:Panel>
    
    <asp:Panel ID="PannelStep2" runat="server" Width="100%" Visible="false">
    <table width="98%" border="0" align="center" cellpadding="0" cellspacing="1">
	  <tr>
	   <td height="45" colspan="2" align="left">
	    </td>
	    </tr>
	   </table>
    
    </asp:Panel>
  
  

</asp:Content>

