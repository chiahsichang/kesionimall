// 选项卡
(function($) {
	$.fn.FengTab = function(config){
		// 默认参数
		config = $.extend({
			titCell			: "",
			mainCell		: "",
			defaultIndex	: 0,
			trigger			: "click",
			titOnClassName	: "on",
			showtime		: 200
		}, config);
		// 全局变量
		var obj	= $(this),
			tabLi	= obj.find(config.titCell).children(),
			conDiv	= obj.find(config.mainCell).children();
		// 显示内容部分处理
		conDiv.each(function(){
			var div		= $(this),
				index	= div.index();
					
			div.addClass("FengTabCon_"+index);
			if(index==config.defaultIndex){
				div.show();
			}else{
				div.hide();
			};
		});
		// 选项卡控制部分处理以及选项卡切换
		tabLi.each(function(){
			var li = $(this),
				index = li.index();
			
			if(index==config.defaultIndex){
				li.addClass(config.titOnClassName);
			};
			li.on(config.trigger, function(){
				li.addClass(config.titOnClassName).siblings().removeClass(config.titOnClassName);
				boxItem	= obj.find(config.mainCell).children(".FengTabCon_"+index);
				boxItem.stop();
				boxItem.fadeIn(config.showtime).siblings().hide();
			});
		});
	};
})(jQuery);

//二级导航弹出
   $(function(){
	   
	$(' .dd').hover(function(){
		$(this).children('.second-menu').stop(true,true).show('fast');
	},function(){
		$(this).children('.second-menu').stop(true,true).hide('fast');
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

