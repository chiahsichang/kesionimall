var box;
var clubDir=appurl+"bbs";
var boardId=0;
var currpage=1;
var topicId=0;
var postTable="KS_BBSPost";
$(document).ready(function(){
	 initial();
});

var initial=function(){
	 $(".replyBtn").unbind("click").click(function(){ //回复按钮
			reply($(this).attr("topicid"),$(this)[0]);
	 });
	 $(".replybutton").unbind("click").click(function(){ //回复提交
			doReply($(this).attr("topicid"));
	 }); 
	 $(".replyContent").focus(function(){ //回复框获得焦点
		 if ($(this).val()=='我也说一句'){
			 $(this).val('');
		 }
	 }).blur(function(){
		 if ($(this).val()==''){
			 $(this).val('我也说一句');
		 }
	 });;
	 $(".digBtn").unbind("click").click(function(){ //Dig 
		 topicDig($(this).attr("topicid"),$(this).find("span"));
	 });

	 $(".manageBtn").unbind("click").click(function(){ //管理操作
		 topicManage($(this).attr("topicid"));
	 });
	 $(".delreplyBtn").unbind("click").click(function(){ //删除回复操作
	   replyDel($(this).attr("topicid"),$(this).attr("postid"));
	 });
	 initialText();

}
//ajax分页加载
 var loadData = function(action) {
            $.ajax({//初始化
                url: clubDir+"/Handle.aspx",
                type: 'GET',
                data: { action:action,page: currpage,boardId:boardId,topicId: topicId,postTable:postTable},
                dateType: 'html',
                timeout: 115000,
                success: function(msg) {
                    if (msg == "") {
                        clearInterval(s);//循环停止
                        $("#loading").html("已全部加载完");
                        return false;
                    } else {
                        $("#documentDiv").append(msg);
						initial();
                        currpage++;
                        $("#loading").html("滑动滚动条加载更多....");
                    }
                }
            });
};

function topicManage(topicId){
	var str="<a href='javascript:;' onclick='topicDel("+topicId+");'>删除</a> |"
	 +"<a href='javascript:;' onclick=topicSet("+topicId+",'setbest',1);>设置精华</a> |"
	 +"<a href='javascript:;' onclick=topicSet("+topicId+",'setbest',0);>取消精华</a> |"
	 +"<a href='javascript:;' onclick=topicSet("+topicId+",'settop',1);>设置置顶 |"
	 +"<a href='javascript:;' onclick=topicSet("+topicId+",'settop',0);>取消置顶 |"
	 +"<a href='javascript:;' onclick=topicSet("+topicId+",'settop',2);>设置总置顶";
	box=$.dialog({id:'mbox',title:'管理话题',content:str});
}

function reply(id,o){
	$("#rbox"+id).toggle();
	return;
	$.dialog.open(clubDir+"/reply.aspx?topicid="+id, {
	id:id,
	lock:true,
    title: false
    }, false);
}﻿

//列表页提交回复
function doReply(id){
	if ($("#replyContent"+id).val()==''||$("#replyContent"+id).val()=='我也说一句'){
		$.dialog.alert('请输入回复内容!');
		$("#replyContent"+id).focus();
		return false;
	}else{
	   $.get(clubDir+"/Handle.aspx",{action:"topicReply",rnd:Math.random(),boardId:boardId,content:$("#replyContent"+id).val(),topicid:id},function(r){ 
		    if (r.indexOf('error:')==-1){
			switch(r){
				case "nocontent":
				  $.dialog.alert('请输入回复内容!');
				  break;
			   case "nologin":
			   	 showuserlogin();
			     break;
			   case "error":
			     $.dialog.alert('找不到话题!');
				 break;
			   default:
			     $("#replyContent"+id).val('我也说一句');
			     var rarr=r.split('$#$');
				 $(".rnum"+id).html(rarr[0]);
				 if (rarr[1]=="1"){
					 $("#replylist"+id).prepend(rarr[2]);
				 }else{
					 $("#sreply"+id).append(rarr[2]);
				 }
				 closeDialog();
				 initial();
			     break;
			}
			}else{
				$.dialog.alert(r.replace(/error:/g,''));
			}
		 });
	}
	
}

function topicDig(id,o){
	$.get(clubDir+"/Handle.aspx",{action:"topicDig",rnd:Math.random(),topicid:id},function(r){ if (r=="error"){$.dialog.tips('您已投过票了!');}else{ o.html(r);}});
}
function topicSet(id,flag,v){
	$.get(clubDir+"/Handle.aspx",{action:"topicSet",rnd:Math.random(),topicid:id,flag:flag,v:v},function(r){ closeDialog(); if (r=="error"){$.dialog.tips('对不起，您没有操作权限!');}else{ $.dialog.tips('恭喜，操作成功！'); 
	 if (flag=='setbest'){
		 if (v==1){
			 $("#rico"+id).append("<span class='best_ico'></span>");
		 }else{
			 $("#rico"+id).find(".best_ico").remove();
		 }
	 }else if (flag=='settop'){
		  if (v==1){
			 $("#rico"+id).append("<span class='top_ico'></span>");
			 $("#rico"+id).find(".alltop_ico").remove();
		 }else if (v==2){
			 $("#rico"+id).append("<span class='alltop_ico'></span>");
			 $("#rico"+id).find(".top_ico").remove();
		 }else{
			 $("#rico"+id).find(".top_ico").remove();
			 $("#rico"+id).find(".alltop_ico").remove();
		 }
	 }
																																															   }});
}
function topicDel(id){
	$.dialog.confirm('您确认删除操作？', function(){
		$.get(clubDir+"/Handle.aspx",{action:"topicDel",rnd:Math.random(),boardid:boardId,topicid:id},function(r){ closeDialog(); if (r=="error"){$.dialog.tips('没权限操作!');}else{ KesionJS.Message("successed","恭喜，删除成功!","$('#tr"+id+"').remove();") }});
	}, function(){
	});
}
function replyDel(topicId,postId){
	$.dialog.confirm('您确认删除该回复吗？', function(){
		$.get(clubDir+"/Handle.aspx",{action:"replyDel",rnd:Math.random(),boardid:boardId,topicid:topicId,postId:postId},function(r){ closeDialog(); var arr=r.split(':'); if (arr[0]=="error"){$.dialog.tips(arr[1]);}else{ KesionJS.Message("successed","恭喜，删除成功!","$('#myreply"+postId+"').remove();$('.rnum"+topicId+"').html(parseInt($('.rnum"+topicId+"').html())-1);") }});
	}, function(){
	});
	
	
}
//关闭所有弹窗
function closeDialog(){
	var list = art.dialog.list;
	for (var i in list) {
		list[i].close();
	};
}

var pos=null;
function setPos(id)
{ if (document.all){
			jQuery("#"+id).focus();
		    pos = document.selection.createRange();
		  }else{
		    pos = jQuery("#"+id)[0].selectionStart;
		  }
}
function InsertValue(Val,id) {
	    if (pos == null) { if ( $("#"+id).val()=='说两句^_^' || $("#"+id).val()=='我也说一句'){ $("#"+id).val('');} setPos(id) }
			 if (document.all){
			  pos.text=Val;
			 }else{
			   var obj=jQuery("#"+id);
			   var lstr=obj.val().substring(0,pos);
			   var rstr=obj.val().substring(pos);
			   obj.val(lstr+Val+rstr);
			 }
}
function showemot(o,topicId){
	 var c=$("#emot").html();
	 if (topicId!=undefined) c=c.replace(/objId/g,'replyContent'+topicId);
	 $.dialog({title:false,width:500,follow:o,content:c,padding:'10px'});
}
function checkcommentlength(cobj, cmax,id) {
			if (cmax <= 0) return;
			if (cobj.value.length > cmax) {
				cobj.value = cobj.value.substring(0, cmax);
				$.dialog.alert("字数不能超过" + cmax + "个字符!", function() { });
			} else {
				var remain = String(cmax - cobj.value.length);
	
				$('#'+id).html(remain);
			}
}
		
function initialText(){
	var slideHeight = 72; // px
	$(".showContent").each(function(){
			 var defHeight = $(this).height();		
			 if(defHeight >= slideHeight){
				var o=$(this);
				if (o.html().indexOf('ckplayer')!=-1) return; //含视频退出
				if (o.next().html()!='') return;
				o.css('height' , slideHeight + 'px');
				o.next().append('<a href="#"><span style="padding-left:10px">[全文]</span></a>');
				o.next().find('a').click(function(){
					var curHeight = o.height();
					if(curHeight == slideHeight){
						o.animate({
						  height: defHeight
						}, "normal");
						$(this).html('<span style="padding-left:10px">[收起]</span>');
						o.find('.gradient').fadeOut();
					}else{
						o.animate({
						  height: slideHeight
						}, "normal");
						$(this).html('<span style="padding-left:10px">[全文]<span>');
						o.find('.gradient').fadeIn();
					}
					return false;
				});	
		}
	});
}


