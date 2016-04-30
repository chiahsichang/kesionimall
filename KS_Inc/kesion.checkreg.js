var dArr=new Array();
$(document).ready(function(){
	init_reg();					     
	 regTypeTips();
	 $("input[name=groupid]").click(function(){
	   regTypeTips();
	   if (dArr[$(this).val()]!=undefined){
		   $("#userDetail").hide().html(dArr[$(this).val()]).fadeIn("slow");
	   }else{
	   loadDetailForm();
	   }
	 });
	 if ($("#detailForm").css("display")!="none"){
	  loadDetailForm();
	 }
	});
	function regTypeTips(){
	 var g=$("input[name=groupid]:checked").val();
	 if (g==undefined) g=$("#groupid").val();
	 $(".typetips").hide().html(""+$("#tips_"+g).html()).fadeIn("slow");
	}
	function loadDetailForm(){
	  if (EnabledRegField.indexOf("detail")==-1) return;
	  var groupid=$("input[name=groupid]:checked").val();
	  if (groupid==undefined) groupid=$("#GroupID").val();
	  if (groupid==undefined) return;
	      $("#loading").show();
		  $.get(appurl+"user/regajax.ashx",{action:"getregform",groupid:groupid},function(d){
           dArr[groupid]=d;
		   $("#userDetail").hide().html(d).fadeIn("slow");
		   $("#loading").hide();
	  });
	}
	
function getlicense()
{
  if (document.getElementById('viewlicense').checked==true)
    $('#license').slideDown();
  else
   $('#license').slideUp();
}
var msg	;
var bname_m=false;
var ajaxchk=null;
var ajaxstr=null;
function init_reg(){
	msg=new Array(
	"请输入"+minlen+"-"+maxlen+"位字符，英文、数字、下划线的组合。",
	"请输入4-14位字符，英文、数字的组合。",
	"请输入6位以上字符，不允许空格。",
	"请重复输入上面的密码。",
	"请选择密码提示问题。",
	"6个字符、数字或3个汉字以上（包括6个）。",
	"请输入您常用的电子邮箱地址。",
	"请输入手机号码。",
	"请输入验证码。"
	)
	document.getElementById("usernamemsg").innerHTML=msg[0];
	document.getElementById("passwordmsg1").innerHTML=msg[2];
	document.getElementById("passwordmsg2").innerHTML=msg[3];
	document.getElementById("questionmsg").innerHTML=msg[4];
	document.getElementById("answermsg").innerHTML=msg[5];
	document.getElementById("emailmsg").innerHTML=msg[6];
	document.getElementById("mobilemsg").innerHTML=msg[7];
	document.getElementById("chkcodemsg").innerHTML=msg[8];
}

function on_input(objname){
	var strtxt;
	var obj=document.getElementById(objname);
	obj.className="d_on";
	//alert(objname);
	switch (objname){
		case "usernamemsg":
			strtxt=msg[0];
			break;
		case "passwordmsg1":
			strtxt=msg[2];
			break;
		case "passwordmsg2":
			strtxt=msg[3];
			break;
		case "answermsg":
			strtxt=msg[5];
			break;
		case "emailmsg":
			strtxt=msg[6];
			break;
		case "mobilemsg":
			strtxt=msg[7];
			break;
		case "chkcodemsg":
		    strtxt=msg[8];
			break;	
	}
	obj.innerHTML=strtxt;
}
function out_username(){
	var obj=document.getElementById("usernamemsg");
	var str=sl(document.getElementById("UserName").value);
	var chk=true;
	//alert(str);
	if (str<minlen || str>maxlen){chk=false;}
	if (!chk){
		obj.className="d_err";
		obj.innerHTML=msg[0];
		return;
	}
	$.ajax({type:"get",async:false,url:appurl+"user/regajax.ashx?action=checkusername&username="+escape(document.getElementById("UserName").value)+"&anticache=" + Math.floor(Math.random()*1000),cache:false,dataType:"html",success:function(d){
			ajaxchk=d.split('|')[0];
			ajaxstr=d.split('|')[1];
	 }});

	if (ajaxchk=='ok'){
	  obj.className="d_ok";
	  obj.innerHTML=ajaxstr;
	 }else{
		obj.className="d_err";
		obj.innerHTML=ajaxstr;
	 }
}
function out_password1(){
	var obj=document.getElementById("passwordmsg1");
	var str=document.getElementById("PassWord").value;
	var chk=true;
	if (str=='' || str.length<6 || str.length>14){chk=false;}
	if (chk){
		obj.className="d_ok";
		obj.innerHTML='密码已经输入。';
	}else{
		obj.className="d_err";
		obj.innerHTML=msg[2];
	}
	return chk;
}
function out_password2(){
	var obj=document.getElementById("passwordmsg2");
	var str=document.getElementById("RePassWord").value;
	var chk=true;
	if (str!=document.getElementById("PassWord").value||str==''){chk=false;}
	if (chk){
		obj.className="d_ok";
		obj.innerHTML='重复密码输入正确。';
	}else{
		obj.className="d_err";
		obj.innerHTML=msg[3];
	}
	return chk;
}
function out_mobile(){
	var obj=document.getElementById("mobilemsg");
	var str=$("#Mobile").val();
	var t_str='';
	var chk=ismobile(str);
	if (chk){
		obj.className="d_ok";
		obj.innerHTML='手机号码输入正确。';
	}else{
		obj.className="d_err";
		obj.innerHTML=msg[7];
	}
	return chk;	
}
function ismobile(s)
{
   var p = /^(013|015|13|15|018|18)\d{9}$/;
   if(s.match(p) != null){
  return true;
  }
  return false;
}
function out_question(){
	var obj=document.getElementById("questionmsg");
	var str=document.getElementById("Question").value;
	var chk=true;
	if (str==''){chk=false}
	if (chk){
		obj.className="d_ok";
		obj.innerHTML='密码提示问题已经选择。';
	}else{
		obj.className="d_err";
		obj.innerHTML=msg[4];
	}
	return chk;
}
function out_answer(){
	var obj=document.getElementById("answermsg");
	var str=sl(document.getElementById("Answer").value);
	var chk=true;
	if (str<6 || str>40){chk=false}
	if (chk){
		obj.className="d_ok";
		obj.innerHTML='密码提示问题答案已经输入。';
	}else{
		obj.className="d_err";
		obj.innerHTML=msg[5];
	}
	return chk;
}
function out_email(){
	var obj=document.getElementById("emailmsg");
	var str=document.getElementById("Email").value;
	var chk=true;
	if (str==''|| !str.match(/^[\w\.\-]+@([\w\-]+\.)+[a-z]{2,4}$/ig)){chk=false}
	if (chk){
		obj.className="d_ok";
		obj.innerHTML='电子邮箱地址已经输入。';
	}else{
		obj.className="d_err";
		obj.innerHTML=msg[6];
		return chk;
	}
    $.ajax({type:"get",async:false,url:appurl+"user/regajax.ashx?action=checkemail&email="+str+"&anticache=" + Math.floor(Math.random()*1000),cache:false,dataType:"html",success:function(d){
			ajaxchk=d.split('|')[0];
			ajaxstr=d.split('|')[1];
	}});
	if (ajaxchk=='ok'){
	  obj.className="d_ok";
	  obj.innerHTML=ajaxstr;
	 }else{
		obj.className="d_err";
		obj.innerHTML=ajaxstr;
	 }
}
function out_chkcode()
{	var obj=document.getElementById("chkcodemsg");
	var str=sl(document.getElementById("Verifycode").value);
	var chk=true;
	if (str<4 || str>6){chk=false}
	if (chk){
		obj.className="d_ok";
		obj.innerHTML='验证码已经输入。';
	}else{
		obj.className="d_err";
		obj.innerHTML=msg[8];
	return chk;
	}
	$.ajax({type:"get",async:false,url:appurl+"user/regajax.ashx?action=checkcode&code="+document.getElementById("Verifycode").value+"&anticache=" + Math.floor(Math.random()*1000),cache:false,dataType:"html",success:function(d){
			ajaxchk=d.split('|')[0];
			ajaxstr=d.split('|')[1];
	}});
	if (ajaxchk=='ok'){
	  obj.className="d_ok";
	  obj.innerHTML=ajaxstr;
	 }else{
		obj.className="d_err";
		obj.innerHTML=ajaxstr;
	 }
}
function sl(st){
	sl1=st.length;
	strLen=0;
	for(i=0;i<sl1;i++){
		if(st.charCodeAt(i)>255) strLen+=2;
	 else strLen++;
	}
	return strLen;
}

var tOutTimes=OutTimes;
function leavePage() {
		 if (tOutTimes==0){
		 tOutTimes=OutTimes;
		 $("#SendMobileBtn").attr("disabled",false);
		 $("#SendMobileBtn").val("免费获取手机验证码")
		 }
		 else{
		 tOutTimes -= 1;
		 $("#SendMobileBtn").val("已发，如果"+tOutTimes+"秒后没有收到，可以重发!")
		 setTimeout("leavePage()", 1000);}
}

function getMobileCode(){
	var mobile=$("#Mobile").val();
	if (mobile==''){
	  $.dialog.alert('请选输入手机号码！',function(){ $("#Mobile").focus();});
	   return false;
	}
	if (ismobile(mobile)==false){
	  $.dialog.alert('手机号码格式不正确，请重新输入！',function(){ $("#Mobile").focus();});
	  return false;
	}
	$("#SendMobileBtn").attr("disabled",true);
	$.ajax({type:"get",async:false,url:appurl+"user/regajax.ashx?istest=0&action=sendmobilecode&model=userreg&mobile="+mobile+"&SessionID="+SessionID+"&anticache=" + Math.floor(Math.random()*1000),cache:false,dataType:"html",success:function(d){
		 if (d=='true'){
			leavePage();
		 }else{
			 $.dialog.alert(d,function(){$("#SendMobileBtn").attr("disabled",false); });
		 }
	}});
	return false;
	
}
function CheckForm() { 
	if (document.myform.UserName.value ==""){
	 $.dialog.alert("请填写您的会员名！",function(){document.myform.UserName.focus();});
	 return false;
	}
	
			
	 if ($("#PassWord").val() =="") {
			$.dialog.alert("请填写您的密码！",function(){$("#PassWord").focus();});
			return false; 
	}
	if($("#RePassWord").val()==""&& EnabledRegField.indexOf("repassword")!=-1){
			$.dialog.alert("请输入您的确认密码！",function(){$("#RePassWord").focus();});
			return false;
	}

	if ($("#PassWord").val()!=$("#RePassWord").val()&& EnabledRegField.indexOf("repassword")!=-1){
			$.dialog.alert("两次填写的密码不一致，请重新填写！",function(){$("#PassWord").focus();}); 
			return false; 
	} 
	if (document.myform.Question.value =="" && EnabledRegField.indexOf("question")!=-1){
			$.dialog.alert("请填写您的密码问题！",function(){document.myform.Question.focus();});
			return false;
	}
	if (document.myform.Answer.value =="" && EnabledRegField.indexOf("question")!=-1){
			$.dialog.alert("请填写您的问题答案！",function(){document.myform.Answer.focus();});
			return false;
	}
	if ($("#Email").val()=="" && EnabledRegField.indexOf("email")!=-1){
			$.dialog.alert("请输入您的电子邮件地址！",function(){$("#Email").focus();});
			return false;
	}
	if(($("#Email").val().indexOf("@")==-1 || $("#Email").val().indexOf(".")==-1) && EnabledRegField.indexOf("email")!=-1){
				$.dialog.alert("您输入的电子邮件地址有误！",function(){$("#Email").focus();});
				return false;
	}
	
	var mobile=$("#Mobile").val();
	if (mobile =="" && (EnabledRegField.indexOf("mobile")!=-1 || MobileReg==1)){
			$.dialog.alert("请输入您的手机号码！",function(){$("#Mobile").focus();});
			return false;
	}
	if (ismobile(mobile)==false&& (EnabledRegField.indexOf("mobile")!=-1 || MobileReg==1)){
	  $.dialog.alert('手机号码格式不正确，请重新输入！',function(){ $("#Mobile").focus();});
	}
	
	if (MobileReg==1 && $("#MobileCode").val()==''){
			 $.dialog.alert("请输入手机验证码！",function(){$("#MobileCode").focus();});
		     return false;
	}
	if (VerifyCodeReg==1 && $("#Verifycode").val()==''){
			 $.dialog.alert("请输入验证码！",function(){$("#Verifycode").focus();});
		     return false;
	}
			
	if ($("#viewlicense")[0].checked==false){
				$.dialog.alert("同意本站的会员服务条款才能完成注册！",function(){});
				return false;
	}
	return true;
}