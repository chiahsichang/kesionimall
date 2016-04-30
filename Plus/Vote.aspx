<%@ Page Language="C#" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.Plus_Vote" Codebehind="Vote.aspx.cs" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link href="{$GetInstallDir}images/home.css" rel="stylesheet" />
	<title>投票结果</title>
	<!--鼠标滑动特效start--> 
	<script src="{$GetInstallDir}ks_inc/jquery.js" type="text/javascript"></script>
	<script src="{$GetInstallDir}ks_inc/kesion.common.js" type="text/javascript"></script>
	<!--鼠标滑动特效end--> 

    <title>投票结果</title>
 <style type="text/css">
<!--
.style2 {	FONT-SIZE: 11pt; COLOR: #cc0000
}
TD {
	FONT-SIZE: 9pt; LINE-HEIGHT: 1.5
}
.idx{width:700px;margin:0 auto}
BODY {
	FONT-SIZE: 9pt; LINE-HEIGHT: 1.5
}
A:link {
	FONT-SIZE: 9pt; COLOR: #000000; TEXT-DECORATION: underline
}
A:visited {
	FONT-SIZE: 9pt; COLOR: #000000; TEXT-DECORATION: underline
}
A:hover {
	FONT-SIZE: 9pt; COLOR: red
}
.m1 {
	BORDER-TOP: #dfdfdb 1px solid; BORDER-LEFT: #dfdfdb 1px solid; BORDER-BOTTOM: #808080 1px solid
}
.m2 {
	BORDER-RIGHT: #dfdfdb 1px solid; BORDER-TOP: #dfdfdb 1px solid; BORDER-LEFT: #dfdfdb 1px solid; BORDER-BOTTOM: #808080 1px solid
}
.m3 {
	BORDER-RIGHT: #dfdfdb 1px solid; BORDER-TOP: #dfdfdb 1px solid; BORDER-LEFT: #dfdfdb 1px solid
}
.article {
	FONT-SIZE: 10pt; WORD-BREAK: break-all
}
.bn {
	FONT-SIZE: 0.1pt; COLOR: #ffffff; LINE-HEIGHT: 50%
}
.contents {
	FONT-SIZE: 1pt; COLOR: #f7f6f8
}
.nb {
	BORDER-RIGHT: #000000 1px solid; BORDER-TOP: #000000 1px solid; BORDER-LEFT: #000000 1px solid; BORDER-BOTTOM: #000000 1px solid; HEIGHT: 18px
}
.coolbg {
	BORDER-RIGHT: #acacac 2px solid; BORDER-BOTTOM: #acacac 2px solid; BACKGROUND-COLOR: #e6e6e6
}

-->
            </style>

</head>
<body>
   <table width="700" border="0" align="center" cellpadding="0" cellspacing="0">
				<tr> 
					<td valign="top" style="width: 606px">
			
						<table width="600" border="0" align="center" cellpadding="2" cellspacing="0" class="border">
							<tr class="title"> 
								<td height="35" colspan="3"><strong><IMG height=46 src="../sysimg/vote.gif" width=320></strong></td>
							</tr>
							<tr class="tdbg">
								<td>
								<form id="form1" runat="server">
									<table width="600" border="0" align="center" cellpadding="0" cellspacing="2">
										<tr>
										  <td colspan="3" align="right" bgcolor="#cccc99" height="6"></td>
									  </tr>
										<tr> 
										  <td align="right" bgcolor="#dfeae4" style="width: 98px"><strong>调查主题：</strong></td>
											<td colspan="2" bgcolor="#dfeae4">
                                                <asp:Label ID="Subject" runat="server" Text="Label"></asp:Label></td>
										</tr>
										<tr> 
										  <td align="right" bgcolor="#f0f2ea" style="width: 98px"><strong>总投票数：</strong></td>
											<td colspan="2" bgcolor="#f0f2ea"> 
                                                <asp:Label ID="TotalNum" runat="server" Text="Label"></asp:Label>
			　　　　　　　　　　　　　　　　</td>
										</tr>
										<tr> 
											<td colspan="3">
                                            <asp:Repeater ID="Repeater1" runat="server">
                                                <HeaderTemplate>
                                                <table border="0" cellpadding="1" cellspacing="1" class="CTable">
                                                 <tr class="CTitle">
                                                 <td height="25" width="190px"><strong>投票选项</strong></td>
                                                 <td align="center" width="90px"><strong>票数</strong></td>
                                                 <td align="center" width="388"><strong>百分比</strong></td>
                                                 </tr>
                                              </HeaderTemplate>
                                              <ItemTemplate> 
                                               <tr>
                                                <td height="25px" align="left" style="BORDER-BOTTOM: 1px solid"><font color="#ff6600"><%# Eval("itemname") %></font></td>
                                                <td align="center" style="BORDER-BOTTOM: 1px solid"><%# Eval("votenum") %></td>
                                                <td align="left" style="BORDER-BOTTOM: 1px solid">
                                                <%# GetVoteItemPer(Convert.ToInt32(Eval("votenum"))) %>
                                                </td>
                                               </tr>  
                                              </ItemTemplate>
                                              <FooterTemplate>
                                              </table>
                                              </FooterTemplate> 
                                            </asp:Repeater>
                                         
                                         
                                         </td>
										</tr>
									</table>	
									</form>		
										<%= GetVoteList() %>			
								</td>
							</tr>
						</table>
			
				  </td>
				</tr>
				<tr>
				  <td  bgcolor="#cccc99" height="6" style="width: 606px"></td>
			  </tr>
			  <tr>
				  <td style="width: 606px"><p align="center">【<a href="javascript:window.close();">关闭窗口</a>】<br>
			<br></p></td>
			  </tr>
			  
			</table>

</body>
</html>
