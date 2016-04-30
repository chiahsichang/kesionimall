<%@ Page Language="C#" validateRequest="false" enableEventValidation="false" viewStateEncryptionMode ="Never" AutoEventWireup="true" Inherits="Kesion.ICMS.InstallIndex" Codebehind="Index.aspx.cs" %>
<%@ Import Namespace="Kesion.Publics" %>
<%@ Import Namespace="Kesion.HtmlTags" %>
<!DOCTYPE html>
<html>
<head runat="server">
    <title>KESION(.NET版)V<%=Utils.GetSysInfo("//sysinfo/version")%> 产品安装向导</title>
    <link href="images/guide.css" rel="stylesheet" />
    <script src="../ks_inc/jquery.js"></script>
    <script src="../ks_inc/kesion.common.js"></script>
</head>
<body>
    <form id="form1" runat="server">

    <div class="idx"><div class="baiyun"></div></div>
	<div class="guide">
		<div class="guidetitle">
			<div class="l"></div><div class="r">当前安装版本：KesionI<%=Utils.GetSysInfo("//sysinfo/showver") %>  V<%=Utils.GetSysInfo("//sysinfo/version")%> <script src="http://www.kesion.com/WebSystem/net/Version"></script></div>
		</div>
		<div class="guidesm"><div class="l">欢迎使用KesionI<%=Utils.GetSysInfo("//sysinfo/showver") %>  V<%=Utils.GetSysInfo("//sysinfo/version")%> 安装向导。本向导即将安装软件到您的系统中，安装前仔细阅读一下协议，点击同意进入下一步。</div>
		<div class="r"><img src="images/download.png" width="80" /></div>
		<div class="clear"></div>
		</div>
		<div class="clear"></div>
		
		
		
		<asp:Panel ID="Step1" runat="server">
		<div class="datiao">
			<ul>
				<li class="curr">阅读许可协议</li>
				<li>检查安装环境</li>
				<li>创建数据库</li>
				<li>网站参数配置</li>
				<li>完成安装</li>
			</ul>
		</div>
		<div class="clear"></div>
		<div class="guideboxbig">
			<div class="guidebox">
			    <h4>KesionI<%=Utils.GetSysInfo("//sysinfo/showver") %>  V<%=Utils.GetSysInfo("//sysinfo/version")%>安装许可协议</h4>
	            <%=Kesion.HtmlTags.Function.ReadFile("license.txt").Replace("\n","<br/>").Replace("{$Version}","KESION(.NET版)")%>
			</div>
			<div class="clear blank10"></div>
			<div>
			<asp:Button ID="BtnAgree" runat="server" Text="我同意" CssClass="btnbg" 
                    onclick="BtnAgree_Click"/>
			<input name="" type="button" value="我不同意" onClick="window.close()" class="btnbg" />
			</div>
		</div>
		</asp:Panel>
		
		
		
		<asp:Panel ID="Step2" Visible="false" runat="server">
		<div class="datiao">
			<ul>
				<li>阅读许可协议</li>
				<li class="curr">检查安装环境</li>
				<li>创建数据库</li>
				<li>网站参数配置</li>
				<li>完成安装</li>
			</ul>
		</div>
		<div class="clear"></div>
		<div class="hjlist">
			<h5>环境检查</h5>
			<ul class="tit">
				<li class="li01">项目</li>
				<li class="li02">KESION所需配置</li>
				<li class="li04">当前服务器</li>
			</ul>
			<ul>
				<li class="li01">.NET 版本</li>
				<li class="li02">ASP.NET 4.0</li>
				<li class="li04"><img src="images/<%=Environment.Version.Major<4?"no.gif":"v.png" %>" align="absmiddle" /><%=Environment.Version.Major.ToString()%>.<%=Environment.Version.Minor%>.<%=Environment.Version.Build.ToString()%>.<%=Environment.Version.Revision%></li>
			</ul>
			<ul>
				<li class="li01">IIS版本</li>
				<li class="li02">IIS 6.0</li>
				<li class="li04"><img src="images/v.png" align="absmiddle" /><%=Request.ServerVariables["SERVER_SOFTWARE"] %></li>
			</ul>
			
			<div class="clear"></div>
			<h5>目录、文件权限检查</h5>
			<ul class="tit">
				<li class="li05">目录文件</li>
				<li class="li06">所需状态</li>
				<li class="li07">当前状态</li>
			</ul>
			<ul>
				<li class="li05"><%=KSCMS.GetInstallDir() %>config/</li>
				<li class="li06"><img src="images/v.png" align="absmiddle" />可写</li>
				<li class="li07">
				<%=CheckFolderCanSave(KSCMS.GetInstallDir() + "config/") == true ? "<img src='images/v.png' align='absmiddle' />可写" : "<img src='images/no.gif' align='absmiddle' /><font color=red>不可写</font>"%>
				</li>
			</ul>
			<ul>
				<li class="li05"><%=KSCMS.GetInstallDir() %>uploadfiles/</li>
				<li class="li06"><img src="images/v.png" align="absmiddle" />可写</li>
				<li class="li07">
				<%=CheckFolderCanSave(KSCMS.GetInstallDir() + "uploadfiles/") == true ? "<img src='images/v.png' align='absmiddle' />可写" : "<img src='images/no.gif' align='absmiddle' /><font color=red>不可写</font>"%>
				</li>
			</ul>
			<ul>
				<li class="li05"><%=KSCMS.GetInstallDir() %>template/</li>
				<li class="li06"><img src="images/v.png" align="absmiddle" />可写</li>
				<li class="li07">
				<%=CheckFolderCanSave(KSCMS.GetInstallDir() + "template/") == true ? "<img src='images/v.png' align='absmiddle' />可写" : "<img src='images/no.gif' align='absmiddle' /><font color=red>不可写</font>"%>
				</li>
			</ul>
			<ul>
				<li class="li05"><%=KSCMS.GetInstallDir() %>cache/</li>
				<li class="li06"><img src="images/v.png" align="absmiddle" />可写</li>
				<li class="li07">
				<%=CheckFolderCanSave(KSCMS.GetInstallDir() + "cache/") == true ? "<img src='images/v.png' align='absmiddle' />可写" : "<img src='images/no.gif' align='absmiddle' /><font color=red>不可写</font>"%>
				</li>
			</ul>
			<ul>
				<li class="li05"><%=KSCMS.GetInstallDir() %>conn.config</li>
				<li class="li06"><img src="images/v.png" align="absmiddle" />可写</li>
				<li class="li07">
				<%=CheckFileCanSave(KSCMS.GetInstallDir()+"conn.config") == true ? "<img src='images/v.png' align='absmiddle' />可写" : "<img src='images/no.gif' align='absmiddle' /><font color=red>不可写</font>"%>
				</li>
			</ul>
			<ul>
				<li class="li05"><%=KSCMS.GetInstallDir() %>web.config</li>
				<li class="li06"><img src="images/v.png" align="absmiddle" />可写</li>
				<li class="li07">
				<%=CheckFileCanSave(KSCMS.GetInstallDir() + "web.config") == true ? "<img src='images/v.png' align='absmiddle' />可写" : "<img src='images/no.gif' align='absmiddle' /><font color=red>不可写</font>"%>
				</li>
			</ul>

			<ul>
				<li class="li05"><%=KSCMS.GetInstallDir() %>HTML/</li>
				<li class="li06"><img src="images/v.png" align="absmiddle" />可写</li>
				<li class="li07">
				<%=CheckFolderCanSave(KSCMS.GetInstallDir() + "html/") == true ? "<img src='images/v.png' align='absmiddle' />可写" : "<img src='images/no.gif' align='absmiddle' /><font color=red>不可写</font>"%>
				</li>
			</ul>
			
			<div class="clear blank10"></div>
			<div style="padding:5px">
			<input name="" type="button" value="上一步" onClick="history.back()" class="btnbg" />
			<asp:Button runat="server" ID="BtnStep2Next" Text="下一步" CssClass="btnbg" 
                    onclick="BtnStep2Next_Click" />
			</div>
		</div>
		</asp:Panel>
		
		
		<asp:Panel ID="Step3" runat="server" Visible="false">
		 <div class="datiao">
			<ul>
				<li>阅读许可协议</li>
				<li>检查安装环境</li>
				<li class="curr">创建数据库</li>
				<li>网站参数配置</li>
				<li>完成安装</li>
			</ul>
		 </div>
		<div class="clear"></div>
		<div class="sjlist">
			<h5>填写数据库信息</h5>
			<ul>
				<li><span>数据库服务器：</span><asp:TextBox ID="TxtDBService" runat="server" Text="(local)" class="text" />数据库服务器地址, 一般为 (local)</li>
				<li><span>数据库名：</span><asp:TextBox ID="TxtDBName" runat="server" Text="KesionICMS" class="text" />
				如果数据库不存在，系统将自动创建。
				</li>
				<li><span>数据库用户名：</span><asp:TextBox ID="TxtDBUser" runat="server" Text="sa" class="text" /></li>
				<li><span>数据库密码：</span><asp:TextBox ID="TxtDBPass" runat="server" Text="989066" class="text" /></li>
				<li><span>初始数据：</span>&nbsp;<strong> <asp:CheckBox ID="CkbData" runat="server" Text="安装体验数据包(推荐)" Checked="true" /></strong>
				&nbsp;&nbsp;&nbsp;&nbsp;<a href="http://bbs.kesion.com/forumthread-1238712.html" target="_blank">如果无法在线安装，点此了解手工安装方式。</a>
				</li>
			</ul>
			<div class="clear"></div>
			
			<div style="padding:5px">
			<asp:Button ID="BtnStep3Next"  OnClientClick="return(doAjax())" runat="server" Text="下一步" CssClass="btnbg" 
                    onclick="BtnStep3Next_Click" />
			</div>
			<script>
			    var box = '';
			    function doAjax() {
			       
			        if (jQuery("#<%=this.TxtDBService.ClientID %>").val() == '') {
			            KesionJS.Alert("请输入数据库服务器地址！", "jQuery('#<%=this.TxtDBService.ClientID %>').focus();");
			            return false;
			        }
			        if (jQuery("#<%=this.TxtDBName.ClientID %>").val() == '') {
			            KesionJS.Alert("请输入数据库名称！", "jQuery('#<%=this.TxtDBName.ClientID %>').focus();");
			            return false;
			        }
			        if (jQuery("#<%=this.TxtDBUser.ClientID %>").val() == '') {
			            KesionJS.Alert("请输入数据库用户名！", "jQuery('#<%=this.TxtDBUser.ClientID %>').focus();");
			            return false;
			        }
			        if (jQuery("#<%=this.TxtDBPass.ClientID %>").val() == '') {
			            KesionJS.Alert("请输入数据库密码！", "jQuery('#<%=this.TxtDBPass.ClientID %>').focus();");
			            return false;
			        }

			        jQuery("#<%=this.BtnStep3Next.ClientID %>").attr("disabled", true);
			        $.dialog.tips('<div style="width:360px;height:80px;text-align:left;"><br/><br/>正在创建安装数据库，请稍候...&nbsp;&nbsp;</div>', 1, 'loading.gif', function () { doBegin(); });
			       // $.dialog.alert('<div style="width:360px;height:80px;text-align:left;"><br/><br/>正在创建安装数据库，请稍候...&nbsp;&nbsp;</div>', function() { doBegin(); });

			        return false;
			     }
			     function doBegin() {
			         var fulldata = 0;
			         if (jQuery("#<%=this.CkbData.ClientID %>")[0].checked == true) fulldata = 1;
			         $.ajax({
			             type: "get",
			             async: false,
			             url: "index.aspx?action=install&anticache=" + Math.floor(Math.random() * 1000) + "&fulldata=" + fulldata + "&dbserver=" + escape(jQuery("#<%=this.TxtDBService.ClientID %>").val()) + "&dbname=" + escape(jQuery("#<%=this.TxtDBName.ClientID %>").val()) + "&dbuser=" + escape(jQuery("#<%=this.TxtDBUser.ClientID %>").val()) + "&dbpass=" + escape(jQuery("#<%=this.TxtDBPass.ClientID %>").val()),
			             cache: false,
			             dataType: "html",
			             success: function(d) {
			                 if (d == 'success') {
			                     KesionJS.Alert("恭喜，KESION .NET版产品数据库安装成功，点击确定进入网站基本参数配置！", "location.href = 'index.aspx?action=finish';");
			                 } else {
			                 KesionJS.Alert(d);
			                 jQuery("#<%=this.BtnStep3Next.ClientID %>").attr("disabled", false);
			                 }

			             }
			         });
			     }
			</script>
			
			
		</div>
		
		</asp:Panel>
		
		<asp:Panel ID="Step4" runat="server" Visible="false">
		 <script>
		     function showwrzm() {
		         var checkrad = jQuery("#<%=this.RdbRZM.ClientID%> :radio[checked]").val();
		         if (checkrad == "0") {
		             jQuery("#rzm").css("display", "none");
		         } else {
		             jQuery("#rzm").css("display", "");
		         }
		     }
		 </script>
		 <div class="datiao">
			<ul>
				<li>阅读许可协议</li>
				<li>检查安装环境</li>
				<li>创建数据库</li>
				<li class="curr">网站参数配置</li>
				<li>完成安装</li>
			</ul>
		 </div>
		 <div class="clear"></div>
		 <div class="sjlist">
			<h5>网站参数配置</h5>
			<ul>
				<li><span>网站名称：</span><asp:TextBox ID="TxtSiteName" runat="server" Text="科兴网络开发" class="text" /><font color=red>*</font> 如：KesionICMS官方站</li>
				<li><span>网站域名：</span><asp:TextBox ID="TxtSiteUrl" runat="server" Text="http://localhost" class="text" /><font color=red>*</font> 后面不要带“/”。 
				如http://www.kesion.com。
				</li>
				<li><span>安装目录：</span><asp:TextBox ID="TxtInstallDir" runat="server" Text="http://localhost" class="text" /><font color=red>*</font> 后面不要带“/”。 
				系统会自动获取，建议不要修改。
				</li>
				<li><span>授 权 码：</span><asp:TextBox ID="TxtSiteKey" runat="server" Text="0" class="text" />
				免费版本用户请留空或填“0”。
				</li>
				<li><span>后台目录：</span><asp:TextBox ID="TxtManageDir" runat="server" Text="manage" class="text" /><font color=red>*</font> 如：Manage,Admin，不能加“/”。</li>
				<li><span>后台启用认证码：</span>
                    <asp:RadioButtonList ID="RdbRZM" onclick="showwrzm();" runat="server" RepeatDirection="Horizontal">
                        <asp:ListItem Value="1">启用</asp:ListItem>
                        <asp:ListItem Value="0" Selected="True">不启用</asp:ListItem>
                    </asp:RadioButtonList>

				</li>
				<li id="rzm" style="display:none;"><span>管理认证码：</span><asp:TextBox ID="TxtManageCode" runat="server" Text="8888" class="text" /></li>
               <li><span>后台启用验证码：</span>
                    <asp:RadioButtonList ID="RdbYZM" runat="server" RepeatDirection="Horizontal">
                        <asp:ListItem Value="1">启用</asp:ListItem>
                        <asp:ListItem Value="0" Selected="True">不启用</asp:ListItem>
                    </asp:RadioButtonList>

				</li>

			</ul>
			<div class="clear"></div>
			<h5>填写管理员信息</h5>
			<ul>
				<li><span>管理员账号：</span><asp:TextBox ID="TxtUserName" runat="server" Text="admin" class="text" /><font color=red>*</font> </li>
				<li><span>管理员密码：</span><asp:TextBox ID="TxtUserPass" runat="server" Text="admin888" class="text" /><font color=red>*</font> 管理员密码不能为空</li>
				<li><span>重复密码：</span><asp:TextBox ID="TxtReUserPass" runat="server" Text="admin888" class="text" /></li>
			</ul>
			<div class="clear blank10"></div>
			
			<div style="padding:5px">
			<asp:Button ID="Button1"  OnClientClick="return(doCheck())" runat="server" 
                    Text="下一步" CssClass="btnbg" onclick="Button1_Click" />
			</div>
		</div>
		
		<script>
			    function doCheck() {
			        if (jQuery("#<%=this.TxtSiteName.ClientID %>").val() == '') {
			            KesionJS.Alert("请输入网站名称！", "jQuery('#<%=this.TxtSiteName.ClientID %>').focus();");
			            return false;
			        }
			        if (jQuery("#<%=this.TxtSiteUrl.ClientID %>").val() == '') {
			            KesionJS.Alert("请输入网站网址！", "jQuery('#<%=this.TxtSiteUrl.ClientID %>').focus();");
			            return false;
			        }

			        if (jQuery("#<%=this.TxtUserName.ClientID %>").val() == '') {
			            KesionJS.Alert("请输入管理员登录账号！", "jQuery('#<%=this.TxtUserName.ClientID %>').focus();");
			            return false;
			        }
			        if (jQuery("#<%=this.TxtUserPass.ClientID %>").val() == '') {
			            KesionJS.Alert("请输入管理员登录密码！", "jQuery('#<%=this.TxtUserPass.ClientID %>').focus();");
			            return false;
			        }
			        if (jQuery("#<%=this.TxtUserPass.ClientID %>").val() != jQuery("#<%=this.TxtReUserPass.ClientID %>").val()) {
			            KesionJS.Alert("两次输入的登录密码不一致，请重输！", "jQuery('#<%=this.TxtUserPass.ClientID %>').focus();");
			            return false;
			        }

			        return true;
			     }
		</script>
		 
		 
		</asp:Panel>
		
		<asp:Panel ID="Step5" runat="server" Visible="false">
		<div class="datiao">
			<ul>
				<li>阅读许可协议</li>
				<li>检查安装环境</li>
				<li>创建数据库</li>
				<li>网站参数配置</li>
				<li class="curr">完成安装</li>
			</ul>
		 </div>
		<div class="clear"></div>
		
		<div class="hjlist" style="padding:20px"><br /><br />
		  <h4 style="color:Green;line-height:35px;"><img src="../sysimg/default/ok.png" align="absmiddle" />恭喜，KESION .NET版产品安装成功！
		  <br />为了您的网站安全，建议及时删除<font color=red>“install”</font>安装目录。</h4>
		  <div style="padding:10px"><br /><br />
		  <a href="../<%=this.TxtManageDir.Text %>/login.aspx">进入后台</a> | <a href="../">进入网站前台</a> | <a href="http://www.kesion.com/" target="_blank">浏览官方网站</a> | <a href="http://bbs.kesion.com/" target="_blank">浏览技术论坛</a>
		  </div>
		  <br /><br /><br /><br />
		  </div>
		</asp:Panel>
		
		
		
		
		
	</div>
	
	
	<div class="foot">
		<font disabled>Powered By KesionI<%=Utils.GetSysInfo("//sysinfo/showver") %> <a href="http://www.kesion.com/" target="_blank">www.kesion.com</a> inc.<br />福建·漳州科兴信息技术有限公司版权所有 © 2006-<%=DateTime.Now.Year.ToString() %> </font>
	</div>
    
    
    
    </form>
</body>
</html>
