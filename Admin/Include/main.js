function Exit(){KesionJS.Confirm("确定退出系统吗?","location.href='Index.aspx?Action=Logout';",null); }
var box=null;
function openWin(title,url,isreload,width,height){ 
      if (width==null) width=760;
      if (height == null) height = 450;
	  
	  box=$.dialog.open(url,{ id:'topbox',lock: true, title: title, width: width, height: height, close: function() {
       if (isreload) {
          top.frames['main'].location.reload();
          }
      }
      });
}
   
   
$(function() {
			
        //调整宽和高
        $(".rightmain").width($(window).width() - $(".leftmain").width());
        $(".leftmain").height($(window).height() - $(".top").height());
        $("#main").height($(".leftmain").height());

        //关于
        $('.topnav li').hover(function () {
            $(this).children('ul').stop(true, true).show();
        }, function () {
            $(this).children('ul').stop(true, true).hide();
        });


        //顶部菜单
        $('.topnav > ul > li:not([class="about"])').click(function (i) {
            $('.topnav > ul > li').removeClass("curr");
            $(this).addClass("curr");
            $(".leftmain div.content").hide();
            $("#left" + $(this).index()).fadeIn();
            if (isCloseLeft) closeLeft();
        });


        //左边菜单
        $(".leftmain div.content").each(function () {
            var index = $(this).index();
            var aMenuOneLi = $("#left" + index + " .menu-one > li");
            var aMenuTwo = $("#left" + index + " .menu-two");
            $("#left" + index + " .menu-one > li > .header").each(function (i) {
                $(this).click(function () {
                    if ($(aMenuTwo[i]).css("display") == "block") {
                        $(aMenuTwo[i]).slideUp(100);
                        $(aMenuOneLi[i]).removeClass("menu-show")
                    } else {
                        for (var j = 0; j < aMenuTwo.length; j++) {
                            $(aMenuTwo[j]).slideUp(100);
                            $(aMenuOneLi[j]).removeClass("menu-show");
                        }
                        $(aMenuTwo[i]).slideDown(100);
                        $(aMenuOneLi[i]).addClass("menu-show")
                    }
                });
            });
        });

    });
 var isCloseLeft = false;
function closeLeft() {
        if (isCloseLeft == false) {
            $("#closeBtn").attr("class", "left_frame_close");
            $(".leftmain").hide();
            $(".rightmain").width($(window).width());
            isCloseLeft = true;
        }
        else {
            $("#closeBtn").attr("class", "left_frame_open");
            $(".leftmain").show();
            $(".rightmain").width($(window).width() - $(".leftmain").width());
            isCloseLeft = false;

        }

 }   
   
   
function showPlan(d) {
     openWin("查看["+d+"]工作计划", "User/KS.AdminPlan.aspx?action=show&date="+d,false, 820, 450);
 }
   
   
   
var isLoadField=false;
function loadModelField(){
    if (isLoadField==false){
        jQuery("#showfield").html("<img src='../admin/images/loading.gif' />加载中...");
        jQuery.get('../plus/ajaxs.ashx',{a:"getmodelfieldmanage"},function(r){
           jQuery("#showfield").html(r);
           isLoadField=true;
        });
    }
   }

function fHideFocus(tName){
		aTag=document.getElementsByTagName(tName);
		for(i=0;i<aTag.length;i++)aTag[i].onfocus=function(){this.blur();};
}
fHideFocus("A");

var checkPerSecond=120; //120秒检测一次
var checkInterval=null;
jQuery(document).ready(function() {

 if (showtips=='true'){ 
	 checkMsg();
	 checkInterval=setInterval("checkMsg();", 1000*checkPerSecond); }
});﻿

function stopInterval(){
    clearInterval(checkInterval);
}
function checkMsg(){
	$.ajax({type:"get",async:false,url:"../plus/Ajaxs.ashx?a=admincheckmsg&anticache=" + Math.floor(Math.random()*1000),cache:false,dataType:"html",success:function(d){
  if (d!=''){																																								   var mytips=$.dialog.notice({
		title: '消息提示',
		width: 320,  /*必须指定一个像素宽度值或者百分比，否则浏览器窗口改变可能导致lhgDialog收缩 */
		height: 150,
		padding:"0px",
		max: false,
		min: false,
		content: 'loading...',
		time: 1200
	});
	mytips.content("<div class='sliupmsgtips'><ul>"+d+"</ul></div><div style='text-align:right'><label><input type='checkbox' onclick='stopInterval()'>不再提示</label></div>");
  }
																																									 }});
	
	
}

/* 扩展窗口外部方法 */
$.dialog.notice = function(options) {
        var opts = options || {},
        api, aConfig, hide, wrap, top,
        duration = opts.duration || 800;

        var config = {
            id: 'Notice',
            left: '100%',
            top: '100%',
            fixed: true,
            drag: false,
            resize: false,
            init: function(here) {
                api = this;
                aConfig = api.config;
                wrap = api.DOM.wrap;
                top = parseInt(wrap[0].style.top);
                hide = top + wrap[0].offsetHeight;

                wrap.css('top', hide + 'px')
            .animate({ top: top + 'px' }, duration, function() {
                opts.init && opts.init.call(api, here);
            });
            },
            close: function(here) {
                wrap.animate({ top: hide + 'px' }, duration, function() {
                    opts.close && opts.close.call(this, here);
                    aConfig.close = $.noop;
                    api.close();
                });

                return false;
            }
        };

        for (var i in opts) {
            if (config[i] === undefined) config[i] = opts[i];
        }

        return $.dialog(config);
}; 