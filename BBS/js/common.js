/*
KesionCMSͨ�ýű���������������2012-2-9
*/




var installdir='/';           //ϵͳ��װĿ¼������ȷ��д���簲װ��kesionĿ¼�£�����Ϊ installdir='/kesion/'

//�ݴ��ű�
ResumeError=function (){return true;}
window.onerror = ResumeError;

 //����Ƿ������ַ�
is_zw=function(str){
	exp=/[0-9a-zA-Z_.,#@!$%^&*()-+=|\?/<>]/g;
	if(str.search(exp) != -1){return false;}
	return true;
}
//��֤�Ƿ��������
CheckBadChar=function (Obj,AlertStr)
{
	exp=/[,��]/g;
	if(Obj.value.search(exp) != -1)
	{   alert(AlertStr+"���ܰ�������");
	    Obj.value="";
		Obj.focus();
		return false;
	}
	return true;
}
// ����Ƿ���Ч����չ��
IsExt=function(FileName, AllowExt){
		var sTemp;
		var s=AllowExt.toUpperCase().split("|");
		for (var i=0;i<s.length ;i++ ){
			sTemp=FileName.substr(FileName.length-s[i].length-1);
			sTemp=sTemp.toUpperCase();
			s[i]="."+s[i];
			if (s[i]==sTemp){
				return true;
				break;
			}
		}
		return false;
}
//����Ƿ����ַ���һ
is_number=function(a){
  return !isNaN(a)
}
//������ַ�����
CheckNumber=function(Obj,DescriptionStr){
	if (Obj.value!='' && (isNaN(Obj.value) || Obj.value<0))
	{
		alert(DescriptionStr+"Ӧ����Ч���֣�");
		Obj.value="";
		Obj.focus();
		return false;
	}
	return true;
}
//�������ʼ���Ч��
is_email=function(str){ 
if((str.indexOf("@")==-1)||(str.indexOf(".")==-1)){
	return false;
	}
	return true;
}
//������ڸ�ʽ�Ƿ�Ϊ2008-01-01 13:01:01
is_date=function(str){   
var reg = /^(\d{1,4})(-|\/)(\d{1,2})\2(\d{1,2}) (\d{1,2}):(\d{1,2}):(\d{1,2})$/; 
var r = str.match(reg); 
if(r==null)return is_shortdate(str); 
var d= new Date(r[1], r[3]-1,r[4],r[5],r[6],r[7]); 
var v=(d.getFullYear()==r[1]&&(d.getMonth()+1)==r[3]&&d.getDate()==r[4]&&d.getHours()==r[5]&&d.getMinutes()==r[6]&&d.getSeconds()==r[7]);
if (v==false)
  return is_shortdate(str)
 else
 return true;
}
////������ڸ�ʽ�Ƿ�Ϊ2008-01-01
is_shortdate=function(str){
var r = str.match(/^(\d{1,4})(-|\/)(\d{1,2})\2(\d{1,2})$/); 
if(r==null)return false; 
var d= new Date(r[1], r[3]-1, r[4]); 
return (d.getFullYear()==r[1]&&(d.getMonth()+1)==r[3]&&d.getDate()==r[4]);	
}

/* ���ѡ�б���li */
function chk_iddiv(id){
	var objc=document.getElementById("c"+id); //��ѡ��
	var obju=document.getElementById("u"+id);//ul
	if (objc.checked==''){
		objc.checked='checked';
		obju.style.background='#EEF8FE';
		//obju.className='listmouseover';
	}else{
		objc.checked='';
		obju.style.background='';
		//obju.className='list';
	}
}
/**/
function chk_idBatch(form,askString){
	var bCheck;
	bCheck=false;
	for (var i=0;i < form.elements.length;i++)
    {
    var e = form.elements[i];
    if (e.name == "id"){
       if (e.checked ==1){
       		bCheck=true;
       		break;
       	}
		}
	}
	
	if (bCheck==false){
		alert("��ѡ��Ҫ����������!")
		return false;
		}
	else{
		return confirm('ȷ��Ҫ'+askString+"?");
		}
}
function get_Ids(form)
{  
	var ids='';
	$("input[type=checkbox]").each(function(){
		if ($(this).prop("name")=="id"){
		  if ($(this).prop("checked")==true){
			  if (ids==''){
				   ids=$(this).val();
			  }else{
				   ids+=","+$(this).val();
			  }
		  }
		}
	});

	return ids;
}
function Select(flag)
{  

  $("input[type=checkbox]").each(function(){
  if ($(this).prop("name")=="id"){
	var objc=$("#c"+$(this).val()); 
	var obju=$("#u"+$(this).val());
	switch (flag){
	  case 0:  //ȫѡ
	   objc.prop("checked",true);
	   obju.attr("style","background:#eef8fe");
	   break;
	  case 1: //��ѡ
		if (objc.prop("checked")==false){
			objc.prop("checked",true);
			obju.attr("style","background:#eef8fe");
		}else{
			objc.prop("checked",false);
	    	obju.attr("style","background:");
		}
		break;
	 case 2:  //��ѡ
		objc.prop("checked",false);
	    obju.attr("style","background:");
		break;
	 }
  }
 })
}


// utility function called by getCookie( )
 function getCookieVal(offset) {
			var endstr = document.cookie.indexOf (";", offset);
			if (endstr == -1) {
				endstr = document.cookie.length;
			}
		    return unescape(document.cookie.substring(offset, endstr));
}
// primary function to retrieve cookie by name
function getCookie(name) {
			var arg = name + "=";
			var alen = arg.length;
			var clen = document.cookie.length;
			var i = 0;
			while (i < clen) {
				var j = i + alen;
				if (document.cookie.substring(i, j) == arg) { 
					return getCookieVal(j);
				}
				i = document.cookie.indexOf(" ", i) + 1;
				if (i == 0) break; 
			}
			return "";
}
// store cookie value with optional details as needed
function setCookie(name, value) {document.cookie = name + "=" + escape (value)}
// remove the cookie by setting ancient expiration date
function deleteCookie(name,path,domain) {
			if (getCookie(name)) {document.cookie = name + "="}
}

function CheckAll(form)
{
	 for (var i=0;i<form.elements.length;i++)
	 {
		var e = form.elements[i];
		if (e.Name != 'chkAll'&&e.disabled==false)
		e.checked = form.chkAll.checked;
	}
 } 
function OpenWindow(Url,Width,Height,WindowObj){
	var ReturnStr=showModalDialog(Url,WindowObj,'dialogWidth:'+Width+'pt;dialogHeight:'+Height+'pt;status:no;help:no;scroll:no;status:0;help:0;scroll:0;');
	return ReturnStr;
}
var obj=null;
var picobj=null;
var box='';
function OpenThenSetValue(Url,Width,Height,WindowObj,SetObj,pic){
	box=top.$.dialog({title:'ѡ���ļ�',content:'url:'+Url+'&fieldId='+SetObj.id+'&pic='+pic,width:820,height:450});
}
function OpenModalDialog(Url,Width,Height,WindowObj,SetObj,pic){
	if (document.all){
	var ReturnStr=showModalDialog(Url,WindowObj,'dialogWidth:'+Width+'pt;dialogHeight:'+Height+'pt;status:no;help:no;scroll:no;status:0;help:0;scroll:0;');
	if (ReturnStr!='' && ReturnStr!=undefined){SetObj.value=ReturnStr;SetObj.focus();
	 if (pic!=''&& pic!=undefined){$("#"+pic).attr("src",ReturnStr);}
	}
	return ReturnStr;
	}else{
	 obj=SetObj;
	 picobj=pic;
	 Width=Width+180;
	 Height=Height+80;
	 var iTop = (window.screen.availHeight-30-Height)/2; //��ô��ڵĴ�ֱλ��;
     var iLeft = (window.screen.availWidth-10-Width)/2; //��ô��ڵ�ˮƽλ��;
	 window.open(Url,'newWin','modal=yes,top='+iTop+',left='+iLeft+',width='+Width+',height='+Height+',resizable=no,scrollbars=no');
	}
}
function setVal(v){
obj.value=v;obj.focus();
if (picobj!=''&&picobj!=null){$("#"+picobj).attr("src",v);}
}
function CheckEnglishStr(Obj,DescriptionStr)
{
	var TempStr=Obj.value,i=0,ErrorStr='',CharAscii;
	if (TempStr!='')
	{
		for (i=0;i<TempStr.length;i++)
		{
			CharAscii=TempStr.charCodeAt(i);
			if (CharAscii>=255||CharAscii<=31)
			{
				ErrorStr=ErrorStr+TempStr.charAt(i);
			}
			else
			{
				if (!CheckErrorStr(CharAscii))
				{
					ErrorStr=ErrorStr+TempStr.charAt(i);
				}
			}
		}
		if (ErrorStr!='')
		{
			alert("������Ϣ:\n\n"+DescriptionStr+'���ַǷ��ַ�:'+ErrorStr);
			Obj.focus();
			return false;
		}
		if (!(((TempStr.charCodeAt(0)>=48)&&(TempStr.charCodeAt(0)<=57))||((TempStr.charCodeAt(0)>=65)&&(TempStr.charCodeAt(0)<=90))||((TempStr.charCodeAt(0)>=97)&&(TempStr.charCodeAt(0)<=122))))
		{
			alert(DescriptionStr+'���ַ�ֻ�ܹ�Ϊ���ֻ�����ĸ');
			Obj.focus();
			return false;
		}
	}
	return true;
}
function CheckErrorStr(CharAsciiCode)
{
	var TempArray=new Array(34,47,92,42,58,60,62,63,124);
	for (var i=0;i<TempArray.length;i++)
	{
		if (CharAsciiCode==TempArray[i]) return false;
	}
	return true;
}
//Obj�����Ķ���,OpStr--BottomFrame��ʾ��ǰ��������ʾ��Ϣ,ButtonSymbol��ť״̬,MainUrl--MainFrame������
function SelectObjItem1(Obj,OpStr,ButtonSymbol,MainUrl,ChannelID)
{   if (OpStr!='')
    {
		window.parent.parent.frames['BottomFrame'].location.href='Post.Asp?ChannelID='+escape(ChannelID)+'&OpStr='+escape(OpStr)+'&ButtonSymbol='+escape(ButtonSymbol);
		}
	if(MainUrl!='')
	{window.parent.parent.frames['MainFrame'].location.href=MainUrl;
	}

}
function FolderClick(Obj,el)
{   	var i=0;
  for (var i=0;i<document.all.length;i++)
	   {
		if (document.all(i).className=='FolderSelected') document.all(i).className='';
	    }
	         Obj.className='FolderSelected';
	  
              for (i=0;i<DocElementArr.length;i++)
			{
				if (el==DocElementArr[i].Obj)
				{
					if (DocElementArr[i].Selected==false)
					{
						DocElementArr[i].Obj.className='FolderSelectItem';
						DocElementArr[i].Selected=true;
					}
					else
					{
						DocElementArr[i].Obj.className='FolderItem';
						DocElementArr[i].Selected=false;
					}
				}
			}
}
function InsertKeyWords(obj,KeyWords)
{ 
	if (KeyWords!='')
	{
		if (obj.value.search(KeyWords)==-1)
		{
			if (obj.value=='') obj.value=KeyWords;
			else obj.value=obj.value+','+KeyWords;
			
		}
	}
	if (KeyWords == 'Clean')
	{
		obj.value = '';
	}
	return;
}
//���Ͳ���������Frames����
function SendFrameInfo(MainUrl,LeftUrl,ControlUrl){
	location.href=MainUrl;
    parent.LeftInfoFrame.location.href=LeftUrl;
	 $(parent.document).find('#BottomFrame')[0].src=ControlUrl;
}

function InsertFileFromUp(FileList,fileSize,maxId,title,EditorId)
{  //alert(EditorId+"="+FileList);
    var files=FileList.split('/');
	var file=files[files.length-1];
	var fileext = FileList.substring(FileList.lastIndexOf(".") + 1, FileList.length).toLowerCase();
    if (fileext=="gif" || fileext=="jpg" || fileext=="jpeg" || fileext=="bmp" || fileext=="png")
		  { if (EditorId==''){
			 insertHTMLToEditor('<img src="'+FileList+'" border="0"/><br/>');	
		  }else{
			 insertHTMLToEditorById(EditorId,'<img src="'+FileList+'" border="0"/><br/>');	
		  }
	  }else if (fileext=="flv"||fileext=="mp4" || fileext=="f4v" || fileext=="wmv" || fileext=="swf" || fileext=="rm" || fileext=="rmvb"){
		  insertHTMLToEditor('[media='+fileext+',500,450,1]'+FileList+'[/media]');	
	  }else{
	  var str="<div class=\"quote\">[UploadFiles]"+maxId+","+fileSize+","+fileext+","+title+"[/UploadFiles]</div><p></p><br/>";
	     if (EditorId==''||EditorId==undefined){
		 insertHTMLToEditor(str);	
		 }else{
		 insertHTMLToEditorById(EditorId,str);	
		 }
	 }
}
function insertHTMLToEditorById(editorId,codeStr) {eval(editorId+".execCommand('insertHtml', '"+codeStr+"');") } 
//ѡ�񸽼�
var box='';
function PopInsertAnnex(upfrom){
	box=$.dialog({title:'ѡ�񸽼�����',content:'url:../plus/selectAnnex.asp?upfrom='+upfrom,width:690,height:400});
}
function Getcolor(obj,Url){
	box=$.dialog({id:'colorbox',title:false,content:'url:'+Url,top:$('#'+obj).position().top+80,width:225,height:148,min:false,max:false,padding:0});
}
function OpenImgCutWindow(deloriginphoto,installdir,photourl){
	OpenImgCutWindows(deloriginphoto,installdir,photourl,$('#PhotoUrl')[0]);
}
function OpenImgCutWindows(deloriginphoto,installdir,photourl,obj){
	OpenThenSetValue(installdir+'plus/ImgCut.asp?del='+deloriginphoto+'&photourl='+photourl,680,380,window,obj);
}

//��վ��֤��,���� writeVerifyCode(��װĿ¼,��ʾtips,cssname);
if (typeof codenum == 'undefined'){	var codenum = 1;}else{codenum++;}
function writeVerifyCode(dir,tips,cssname){
codenum++;	if (dir==undefined) dir='/';if (tips==undefined) tips=0;if (cssname==undefined) cssname='textbox';
document.write('<span style="position: relative;"><input name="Verifycode" id="Verifycode" tabindex="2" maxlength="5" size="6" class="'+cssname+'" onblur="if(!seccodefocus) {document.getElementById(\'codebox'+codenum+'\').style.display=\'none\';}"  id="Verifycode"  onfocus="showverifycode('+codenum+')"  autocomplete="off"/><div class="verifybox"  style="position:absolute;display:none;cursor: pointer;width: 124px; height: 44px;left:0px;top:40px;z-index:10009;padding:0;" id="codebox'+codenum+'" onmouseout="seccodefocus = 0" onmouseover="seccodefocus = 1"><img width="145" src="'+dir+'plus/verifycode.asp?time=0.001" id="vcodeimg'+codenum+'" title="�����������ˢ��" onclick="showverifycode('+codenum+');"/></div></span>');
if (tips==1) document.write('&nbsp;<span style="color:#999">��������ͼ���ַ�</span>&nbsp;');
}
var seccodefocus = 0;
function showverifycode(id) {
    var obj=document.getElementById("codebox"+id);
	obj.style.top = (-parseInt(obj.style.height) - 4) + 'px';
	obj.style.left = '0px';
	obj.style.display = '';
	var pos=getElementPos("codebox"+id);
	if (pos.y<0) obj.style.top=parseInt(obj.style.height)-20+"px";
document.getElementById('vcodeimg'+id).src =document.getElementById('vcodeimg'+id).src.split('?')[0]+'?time=' + Math.random();
	try{$("#codebox"+id).fadeOut('fast').fadeIn('fast');}catch(e){}
}
function getElementPos(elementId) {
 var ua = navigator.userAgent.toLowerCase();
 var isOpera = (ua.indexOf('opera') != -1);
 var isIE = (ua.indexOf('msie') != -1 && !isOpera); // not opera spoof
 var el = document.getElementById(elementId);
 if(el.parentNode === null || el.style.display == 'none') { return false; }      
 var parent = null;var pos = []; var box;     
 if(el.getBoundingClientRect)    //IE
 {  box = el.getBoundingClientRect();var scrollTop = Math.max(document.documentElement.scrollTop, document.body.scrollTop); var scrollLeft = Math.max(document.documentElement.scrollLeft, document.body.scrollLeft);return {x:box.left + scrollLeft, y:box.top + scrollTop};}else if(document.getBoxObjectFor)    // gecko    
 {box = document.getBoxObjectFor(el); var borderLeft = (el.style.borderLeftWidth)?parseInt(el.style.borderLeftWidth):0; 
  var borderTop = (el.style.borderTopWidth)?parseInt(el.style.borderTopWidth):0; 
  pos = [box.x - borderLeft, box.y - borderTop];} else    // safari & opera    
 {pos = [el.offsetLeft, el.offsetTop]; parent = el.offsetParent; if (parent != el) {while (parent) {pos[0] += parent.offsetLeft; pos[1] += parent.offsetTop;  parent = parent.offsetParent;}}   
  if (ua.indexOf('opera') != -1 || ( ua.indexOf('safari') != -1 && el.style.position == 'absolute' )) { pos[0] -= document.body.offsetLeft;pos[1] -= document.body.offsetTop;}}              
 if (el.parentNode) {parent = el.parentNode;} else {parent = null;}
 while (parent && parent.tagName != 'BODY' && parent.tagName != 'HTML') { // account for any scrolled ancestors
  pos[0] -= parent.scrollLeft;pos[1] -= parent.scrollTop;if (parent.parentNode) {parent = parent.parentNode;} else { parent = null;}}
 return {x:pos[0], y:pos[1]};
}

function AddFavorite(sURL, sTitle) {
    try { //IE
        window.external.addFavorite(sURL, sTitle);
    } catch (e) {
        try { //Firefox
            window.sidebar.addPanel(sTitle, sURL, "");
        } catch (e) {
   try{//Chrome�޷��Զ��ղأ��ô�����Ӧ�ó���Ľݷ�ʽ�������Js��Ч��ȫ www.www.111cn.net
    createShortcut();
   } catch(e){
    alert("�밴Ctrl+D֮�󰴡�ȷ��������ղ�!");
   }
        }
    }
}
function setHomepage(pageURL) {
    if (document.all) {
        document.body.style.behavior='url(#default#homepage)';
        document.body.setHomePage(pageURL);
    }
    else {
            try { //IE
                netscape.security.PrivilegeManager.enablePrivilege("UniversalXPConnect");
            } catch (e) {
    try{ //Firefox
     var prefs = Components.classes['@mozilla.org/preferences-service;1']
.getService(Components. interfaces.nsIPrefBranch);
     prefs.setCharPref('browser.startup.homepage',pageURL);
    } catch(e) {
                alert( "�����������֧�ָò�������ʹ��������˵��ֶ�����." );
    }
            }
    }
}

var KesionJS={
		//ͨ�öԻ���
		Alert:function(msg,act){ 
		  if (frameElement==null || frameElement.api==undefined){
			 this.Alert1(msg,act); 
		  }else{
			 var api = frameElement.api, W = api.opener;
			 W.jQuery.dialog.alert(msg,function(){   setTimeout(function(){ eval(act);},1);});
		  }
		},
		Alert1:function(msg,act){ 
		  jQuery.dialog.alert(msg,function(){eval(act);});
		},
		AlertByTime:function(src,msg,t){
		   if (src==1){
			    src="success.gif";
		   }else{
			   src="error.gif";
		   }
		   if (t=='') t=2;
		   jQuery.dialog.tips(msg,t,src,function(){});

		},
		Confirm:function(msg,fun1,fun2){
		   if (frameElement==null ||frameElement.api==undefined){
			   this.Confirm1(msg,fun1,fun2);
		   }else{
			   var api = frameElement.api, W = api.opener;
			   W.jQuery.dialog.confirm(msg,function(){setTimeout(function(){ eval(fun1);},1);},function(){ setTimeout(function(){ eval(fun2);},1);});
		   }
		},
		Confirm1:function(msg,fun1,fun2){
			jQuery.dialog.confirm(msg,function(){eval(fun1);},function(){eval(fun2);});
		},
		Message:function(ico,msg,fun){
			if (frameElement==null ||frameElement.api==undefined){
			 this.Message1(ico,msg,fun); 
		  }else{
			  var api = frameElement.api, W = api.opener;
			  W.jQuery.dialog.tips(msg,2,ico,function(){ setTimeout(function(){ eval(fun);},1); });
			  
		  }
		},
		Message1:function(ico,msg,fun){
			jQuery.dialog.tips(msg,2,ico,function(){eval(fun);});
		},
		Tips:function(title,msg,w,h){
			jQuery.dialog({ title:title,
				content: msg,
				width:w,
				height:h,
				max:false,
				min:false
			});
			
		}

};

/*����л��ű�*/

function scrollDoor(){
}
scrollDoor.prototype = {
	sd : function(menus,divs,openClass,closeClass){
		var _this = this;
		if(menus.length != divs.length)
		{
			alert("�˵������������ݲ�������һ��!");
			return false;
		}				
		for(var i = 0 ; i < menus.length ; i++)
		{	
			_this.$(menus[i]).value = i;				
			_this.$(menus[i]).onmouseover = function(){
					
				for(var j = 0 ; j < menus.length ; j++)
				{						
					_this.$(menus[j]).className = closeClass;
					_this.$(divs[j]).style.display = "none";
				}
				_this.$(menus[this.value]).className = openClass;	
				_this.$(divs[this.value]).style.display = "block";				
			}
		}
		},
	$ : function(oid){
		if(typeof(oid) == "string")
		return document.getElementById(oid);
		return oid;
	}
}

//==============================��ʱ��������ʱ================================/
function GetHtmlStr(id,num){
    $.ajax({
      type: "get",
      url: installdir+"shop/limitBuy.asp",
      data: "id="+id+"&num="+num+"&fresh=" + Math.random(),
      cache:false, 
      success: function(result){
		    result=unescape(result);
            $("#loading"+id).hide();
            $("#hasQiangGou"+id).show();
            eval(result.split('|')[0]);
            $("#qianggou"+id).html(result.split('|')[1]);
      }
    });
}

//������ʱ/��������
function getLimitBuy(taskid,num)
{
	document.writeln('<div id="loading'+taskid+'" class="loading"><img src='+installdir+'/images/loading.gif" /></div>');
	document.writeln('<div id="hasQiangGou'+taskid+'" style="display:none;"><ul><li>');
	document.writeln('	 <div class="dade" id="time'+taskid+'">���ڼ��ء�</div>');
	document.writeln('	 <div class="Product_List_S" id="qianggou'+taskid+'"></div></li></ul>');
	document.writeln('</div>');
	GetHtmlStr(taskid,num);  //�첽����������
}


//��ʾʣ��ʱ��
var serverTime = new Date() ;
var dateTime = new Date(); 
var difference = dateTime.getTime() - serverTime.getTime(); 
function StringToDate(DateStr)  
{   
    var converted = Date.parse(DateStr);  
    var myDate = new Date(converted);  
    if (isNaN(myDate))  
    {    
	   var arys= DateStr.split(' '); 
       var arys1=arys[0].split('-');
	   var arys2=arys[1].split(':');
        myDate = new Date(arys1[0],--arys1[1],arys1[2],arys2[0],-arys2[1],arys2[2]);  
    }  
    return myDate;  
}  
function show_date_time(begin,end,bjq,f){
	    var beginTime =StringToDate(begin)
	    var endTime =StringToDate(end)
        var nowTime = new Date(); 
        var nMS=endTime.getTime() - nowTime.getTime() + difference; 
        var myD=Math.floor(nMS/(1000 * 60 * 60 * 24)); 
        var myH=Math.floor(nMS/(1000*60*60)) % 24; 
        var myM=Math.floor(nMS/(1000*60)) % 60; 
        var myS=Math.floor(nMS/1000) % 60; 
        var myMS=Math.floor(nMS/100) % 10; 
	    if(myD>= 0){ 
            var str ='';
			if (myD>0) str=myD+"��";
			str+=myH+"Сʱ"+myM+"��"+myS+"."+myMS+"��"; 
        }else{ 
           var str = "";     
		   if (f==0) {
			 var tt=beginTime.getTime()-nowTime.getTime();
			  if (tt>0){
			   str="�𱬽�����...";
			  }else{
			   str="�ѽ���.";
			  }
		   }else{str = "�ѽ���.";}
        } 
		document.getElementById(""+bjq+"").innerHTML=str;
	window.setTimeout("show_date_time('"+begin+"','"+end+"','"+bjq+"','"+f+"')", 100);
}
//==============================��ʱ��������ʱ����================================/


//===================================��ǩAjax�����ʼ==========================================================
var labelid="";
var classid="";
var infoid="";
var refreshtype="";
var specialid="";
var objid="";
function getlabeltag(){
    var labelItem = document.getElementsByTagName("span"); 
    for(var i=0; i<labelItem.length; i++){
        var obj = labelItem[i];   
		if (typeof(obj.id)!="undefined"&&(obj.id.substring(0,2)=="ks"||obj.id.substring(0,3)=="SQL"))
		{
		  if (obj.id.substring(0,2)=="ks")
		   {
			  var idarr=obj.id.split('_');
			  var labelid=idarr[0].replace("ks","");
			  var typeid=idarr[1];
			  var classid=idarr[2];
			  var infoid=idarr[3];
			  var channelid=idarr[4];
			  try{  
			  getlabelcontent("plus/ajaxs.asp",obj,labelid,"Label",typeid,channelid,classid,infoid)
			   }catch(e){}
		   }
		   else if (obj.id.substring(0,3)=="SQL")
		   {
			  if ($("#"+obj.id).attr("ispage")==1){
				 labelid=$("#"+obj.id).attr("labelname");
				 classid=$("#"+obj.id).attr("classid");
				 infoid=$("#"+obj.id).attr("infoid");
				 objid=obj.id;
				 loadPage(objid,1,labelid,classid,infoid,refreshtype,specialid)
			  }else{
				  
				   var p=obj.id.substring(obj.id.indexOf("ksr")+3);
				   var parr=p.split('p');
				   var classid=0;
				   var infoid=0;
				   var channelid=0;
				   if (p!='') 
				   {  infoid=parr[0];
					  classid=parr[1];
				   }
					try{getlabelcontent("plus/ajaxs.asp",obj,obj.id,"SQL",0,channelid,classid,infoid);   
					 }catch(e){}
			  }
		   }
		}
  }
}
function getlabelcontent(posturl,obj,labelid,action,typeid,channelid,classid,infoid)
{ 
	var senddata="?action=AjaxLabel&labeltype="+action+"&labelid="+escape(labelid)+"&labtype="+typeid+"&channelid=" +channelid+"&classid="+classid+"&infoid="+infoid+getUrlParam();
 obj.innerHTML="<span align='center'><img src='"+installdir+"images/loading.gif'>���ڼ�������...</span>";
 $.ajax({
		  type:"post",
		  url:installdir+posturl+senddata,
		  cache:false,
		  success:function(d){
			obj.innerHTML=d;
  }});
}
//ȡurl���Ĳ���
function getUrlParam()
{
	var URLParams = new Object() ;
	var aParams = document.location.search.substr(1).split('&') ;//substr(n,m)��ȡ�ַ���n��m,split('o')��oΪ���,�ָ��ַ���Ϊ����
	if(aParams!=''&&aParams!=null){
		var sum=new Array(aParams.length);//��������
		for (i=0 ; i < aParams.length ; i++) {
		sum[i]=new Array();
		var aParam = aParams[i].split('=') ;//�ԵȺŷָ�
		URLParams[aParam[0]] = aParam[1] ;
		sum[i][0]=aParam[0];
		sum[i][1]=aParam[1];
		}
		var p='';
		for(i=0;i<sum.length;i++)
		{
		  p=p+'&'+sum[i][0]+"="+sum[i][1]
		}
	   return p;
	}else{
	   return "";
	}
}


function loadPage(id,page,labelname,classid,infoid,refreshtype,specialid)
{ 
  var labelid="{"+labelname+"}";
   $("#"+id).html("<div align='center'><img src='"+installdir+"images/loading.gif'>���ڶ�ȡ����...</div>");
   $.ajax({
		  type:"post",
		  url:installdir+"plus/ajaxs.asp?action=AjaxSqlLabel&labelid="+escape(labelid)+"&infoid="+infoid+"&classid="+classid+"&refreshtype="+refreshtype+"&specialid=" +specialid+"&curpage="+page+getUrlParam(),
		  cache:false,
		  success:function(d){
			$("#"+id).html("<ul>"+d+"</ul>");
  }});

}

function turn(page,labelname)
{
	if (page==-1){
		 alert("�Ѿ�����ҳ�ˣ�");
	}else if (page==-2){
		alert("�Ѿ������һҳ�ˣ�")
	}else{
		labelid=labelname;
		objid=$("[labelname='"+labelname+"']").attr("id");
		classid=$("[labelname='"+labelname+"']").attr("classid");
		infoid=$("[labelname='"+labelname+"']").attr("infoid");
		loadPage(objid,page,labelid,classid,infoid,refreshtype,specialid)
	}
}
$(document).ready(function(){
 getlabeltag();
});
//===================================��ǩAjax�������==========================================================




