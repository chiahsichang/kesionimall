<%@ Page Language="C#" validateRequest="false" enableEventValidation="false" viewStateEncryptionMode ="Never" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.Admin.L" CodeBehind="Login.aspx.cs" %>
<%@ Import Namespace="Kesion.Publics" %>
<%@ Import Namespace="Kesion.Cache" %><!DOCTYPE html>
<html>
<head runat="server">
    <title>Kesion ICMS</title>
<script src="../KS_Inc/jQuery.js"></script>
<script src="../KS_Inc/Kesion.Common.js"></script>
<!--[if IE 6]>
  <script src="/admin/include/iepng.js" type="text/javascript"></script>
  <script type="text/javascript">
    try{
     EvPNG.fix('div, ul, img, li, input, em, a, p,i,b,span,em,' ); 
    }catch(e){
    }
  </script>
  <![endif]-->
<script>
    $(function(){
        $("#<%=this.UserName.ClientID%>").focus(function(){
            if ($(this).val()=='请输入登录账号'){ $(this).val(''); }
        }).blur(function(){
            if ($(this).val()==''){ $(this).val('请输入登录账号'); }
        });
        $("#<%=this.UserPass.ClientID%>").focus(function(){
            if ($(this).val()=='******'){ $(this).val(''); }
        }).blur(function(){
            if ($(this).val()==''){ $(this).val('******'); }
        });
        $("#<%=this.AdminLoginCode.ClientID%>").focus(function(){
            if ($(this).val()=='******'){ $(this).val(''); }
        }).blur(function(){
            if ($(this).val()==''){ $(this).val('******'); }
        });
    });
	function CheckMobile(){
	if (jQuery("#<%=this.TxtMobile.ClientID %>").val() == '') {
	        KesionJS.Alert('请输入手机号码!', 'jQuery("#<%=this.TxtMobile.ClientID %>").focus();');
	        return false;
	    }
	if (jQuery("#<%=this.TxtMobileCode.ClientID %>").val() == '') {
	        KesionJS.Alert('请输入手机验证码!', 'jQuery("#<%=this.TxtMobileCode.ClientID %>").focus();');
	        return false;
	    }
	}
	function CheckForm() {
	    if (jQuery("#<%=this.UserName.ClientID %>").val() == ''||jQuery("#<%=this.UserName.ClientID %>").val() == '请输入登录账号') {
	        KesionJS.Alert('请输入登录用户名!', 'jQuery("#<%=this.UserName.ClientID %>").focus();');
	        return false;
	    }
	    if (jQuery("#<%=this.UserPass.ClientID %>").val() == ''||jQuery("#<%=this.UserPass.ClientID %>").val() == '******') {
	        KesionJS.Alert('请输入登录密码!', 'jQuery("#<%=this.UserPass.ClientID %>").focus();');
	        return false;
	    }
	    <%if (MyCache.GetCacheConfig(3).IndexOf("login.aspx") == 0)
            { %>
	    if (jQuery("#<%=this.ValidateCode.ClientID %>").val() == '') {
	        KesionJS.Alert('请输入验证码!', 'jQuery("#<%=this.ValidateCode.ClientID %>").focus();');
	        return false;
	    }
	    <%} 
	    if (MyCache.GetCacheConfig(18) == "1")
            {%>
	     if (jQuery("#<%=this.AdminLoginCode.ClientID %>").val() == '') {
	        KesionJS.Alert('请输入认证码!', 'jQuery("#<%=this.AdminLoginCode.ClientID %>").focus();');
	        return false;
	    }
	    <%} %>
	    return true;
	}

var OutTimes=<%=MyCache.GetCacheConfig(38) %>;	
function leavePage() {
		 if (OutTimes==0){
		     $("#SendMobileBtn").attr("disabled",false);
		     $("#SendMobileBtn").val("发送验证码")
		 }
		 else{
		 OutTimes -= 1;
		 $("#SendMobileBtn").val(""+OutTimes+"秒可重发")
		 setTimeout("leavePage()", 1000);}
}
function getMobileCode(){
	var mobile=$("#<%=this.TxtMobile.ClientID %>").val();
	if (mobile==''){
	  $.dialog.alert('请选输入手机号码！',function(){ $("#<%=this.TxtMobile.ClientID %>").focus();});
	   return false;
	}
	if (ismobile(mobile)==false){
	  $.dialog.alert('手机号码格式不正确，请重新输入！',function(){ $("#<%=this.TxtMobile.ClientID %>").focus();});
	  return false;
	}
	$("#SendMobileBtn").attr("disabled",true);
	$.ajax({type:"get",async:false,url:"../user/regajax.ashx?action=sendmanagemobilecode&mobile="+mobile+"&anticache=" + Math.floor(Math.random()*1000),cache:false,dataType:"html",success:function(d){
		 if (d=='true'){
		    $.dialog.tips("已成功发送，请注意查收！",2,"success.gif",function(){ });
			leavePage();
		 }else{
		 		$("#SendMobileBtn").attr("disabled",false);
			 $.dialog.alert(d,function(){ });
		 }
	}});
	return false;
	
}
 </script>

    <link href="../admin/images/login/login.css" rel="stylesheet" type="text/css" />

</head>




<body class="loginbg">
 <form id="form1" runat="server">
   <div>
      <div class="loginbox">
         <div class="title">
           <img src="../admin/images/login/kesionicms.png" />
         </div>
         
         <div class="box">
            <ul>
                
                <asp:Panel ID="PanStep1" runat="server">
                
                    <li><span class="wz">手机号码：</span>
                        <asp:TextBox ID="TxtMobile" CssClass="sj od" runat="server" MaxLength="12"></asp:TextBox>
                    </li>
                     <li><span class="wz">验 证 码：</span>
                      <asp:TextBox ID="TxtMobileCode" CssClass="pas od" runat="server" MaxLength="6"></asp:TextBox> 
                      <span class="pic">
                     <input type="button" onClick="getMobileCode()" value="发送验证码" class="sendbtn" id="SendMobileBtn"/>
                      </span>
                   </li>
                     <li class="bu">
                      <asp:Button ID="ImageButton2" runat="server" Text="登录"  OnClientClick="return(CheckMobile());" CssClass="but1 btn" OnClick="ImageButton1_Click"/>
                      <input name="" value="取消" type="button" class="but2 btn" onClick="javascript:location.href='/';"/>
                        <asp:ValidationSummary ID="ValidationSummary2" runat="server" ShowMessageBox="True" ShowSummary="False" />
                   </li>

                </asp:Panel>



                 <asp:Panel ID="PanStep2" runat="server" Visible="false">
                   <li><span class="wz">账  号：</span>
                     <asp:TextBox ID="UserName" CssClass="txt od" runat="server" Text="请输入登录账号" MaxLength="20"></asp:TextBox> <asp:RequiredFieldValidator
                     ID="RequiredFieldValidator1" runat="server" ControlToValidate="UserName" Display="None"
                     ErrorMessage="请输入用户名!"></asp:RequiredFieldValidator>
                   </li>
                   <li style="position:relative;"><span class="wz">密  码：</span>
                       <asp:TextBox ID="UserPass" CssClass="pas od" value="******" TextMode="Password" MaxLength="50" runat="server"></asp:TextBox><asp:RequiredFieldValidator
                     ID="RequiredFieldValidator2" runat="server" ErrorMessage="请输入登录密码!" ControlToValidate="UserPass" Display="None"></asp:RequiredFieldValidator>
                 
                     <asp:PlaceHolder ID="PlaceHolder1"  runat="server"></asp:PlaceHolder>

                   </li>
                   <li id="CodeArea" runat="server"><span class="wz">认证码：</span>
                       <asp:TextBox ID="AdminLoginCode" TextMode="password" value="******" MaxLength="50" CssClass="rz od" runat="server"></asp:TextBox><span id="AdminLoginCodeArea" runat="server"></span><asp:RequiredFieldValidator
                     ID="RequiredFieldValidator4" runat="server" ErrorMessage="请输入认证码!" ControlToValidate="AdminLoginCode" Display="None"></asp:RequiredFieldValidator>
                   </li>
                   <li id="VefifyCode" runat="server"><span class="wz">验证码：</span>
                    <asp:TextBox ID="ValidateCode" runat="server" CssClass="yz od" MaxLength="10"></asp:TextBox><asp:RequiredFieldValidator
                     ID="RequiredFieldValidator3" runat="server" ErrorMessage="请输入验证码!" ControlToValidate="ValidateCode" Display="None"></asp:RequiredFieldValidator>
                     <span class="pic">
                     <asp:Image ID="ValidateCode1" runat="server"  ToolTip="看不清，点击刷新！" ImageUrl="../plus/ValidateCode.aspx" ImageAlign="AbsMiddle" /> </span>
                   </li>
                   <li class="bu">
                      <asp:Button ID="ImageButton1" runat="server" Text="登录" OnClientClick="return(CheckForm());" CssClass="but1 btn" OnClick="ImageButton2_Click"/>
                      <input name="" value="取消" type="button" class="but2 btn" onClick="javascript:location.href='/';"/>
                        <asp:ValidationSummary ID="ValidationSummary1" runat="server" ShowMessageBox="True" ShowSummary="False" />
                   </li>
                 </asp:Panel>

            </ul>
            <div class="clear"></div>
         </div>
      </div>
	  
	 <div class="copyright"> Copyright &copy;2006-<%=DateTime.Now.Year.ToString()%> <a href="http://www.kesion.com" target="_blank"> www.kesion.com</a>,All Rights Reserved.
      <br />Powered by KesionI<%=Utils.GetSysInfo("//sysinfo/showver") %> Version <%=Utils.GetSysInfo("//sysinfo/version")%>  漳州科兴信息技术有限公司
    </div>
   </div>
     <script>
         jQuery(document).ready(function(){
             jQuery("#<%=this.form1.ClientID %>").attr("action","<%=Request.Url.Segments[Request.Url.Segments.Length - 1] %>");
       });
   </script> 
   </form>
</body>
</html>