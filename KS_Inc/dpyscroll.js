$(document).ready(function(){
 try{
	document.execCommand("BackgroundImageCache",false,true);
}catch(e)
{}
function $$(){
	var elements=[];
	for(var i=0;i<arguments.length;i++){
		var element=arguments[i];
		if(typeof element=="string"){
			element=document.getElementById(element);
		}
		if(arguments.length==1){
			return element;
		}
		elements.push(element);
	}
	return elements;
}
function getStyle(obj,option){
	if(obj.currentStyle){
		var value=obj.currentStyle[option];
		if(value=="auto")value="0px";
	}else{
		var value=document.defaultView.getComputedStyle(obj,null)[option];
	}
	return value;
}
Function.prototype.bind=function(object){
	var method=this;
	return function(){
		method.apply(object,arguments);	
	}
}
var Class={
	create:function(){
		return function(){
			this.initialize.apply(this,arguments);	
		}
	}
}
var Scroll=Class.create();
Scroll.prototype={
	initialize:function(parent){
	    if($$(parent) == null)
	        return;
		this.parent=$$(parent);
		this.step=2;
		this.speed=30;
		var newIe= $.browser.msie && /MSIE 8.0/.test(navigator.userAgent);
		if(newIe)
		{
		    this.speed=15;
		}
		this.flagLeft=true;
		var obj_ul=this.parent.getElementsByTagName("ul")[0];
		var arr_li=obj_ul.getElementsByTagName("li");
		if (arr_li.length<=10) return;  //防止重复，退出！
		var obj_li=arr_li[0];
		try{
		var li_width=obj_li.offsetWidth;
		li_width+=parseInt(getStyle(obj_li,"marginLeft"))+parseInt(getStyle(obj_li,"marginRight"));	
		var ul_width=li_width*(arr_li.length);
		ul_width+=parseInt(getStyle(obj_ul,"paddingLeft"))+parseInt(getStyle(obj_ul,"paddingRight"));
		ul_width+=parseInt(getStyle(obj_ul,"marginLeft"))+parseInt(getStyle(obj_ul,"marginRight"));
		this.maxWidth=ul_width; //1547*2=3094
		obj_ul.parentNode.style.width=ul_width*2+"px"; //6188
		obj_ul.innerHTML+=obj_ul.innerHTML;
		if(this.parent.scrollLeft==0)
		{
		   $("#dpyleft img").removeClass("hand").attr("src","/sysimg/BLGray.png"); 
		}
        if(this.parent.scrollLeft>=this.maxWidth-886-30){
           $("#dpyright img").removeClass("hand").attr("src","/sysimg/BRGray.png");
           return;
        }
		if(arguments.length>1){
			this.arrowLeft=$$(arguments[1]);
			this.arrowLeft.onmouseover=function(){
				this.moveLeft();
				this.flagLeft=true;
			}.bind(this);
			this.arrowLeft.onmouseout=this.stop.bind(this);
		}
		if(arguments.length>2){
			this.arrowRight=$$(arguments[2]);
			this.arrowRight.onmouseover=function(){
				this.moveRight();
				this.flagLeft=false;
			}.bind(this);
			this.arrowRight.onmouseout=this.stop.bind(this);
		}
		}catch(e){
		}
	},
	moveLeft:function(){
        if(this.parent.scrollLeft==0){
			this.stop();
			$("#dpyleft img").removeClass("hand").attr("src","/sysimg/BLGray.png");
		}else{
			this.parent.scrollLeft-=this.step;
		}
		if(!$("#dpyright img").hasClass("hand"))
		{
		    $("#dpyright img").addClass("hand").attr("src","/sysimg/dpy__r3_c49.png"); 
		}
		this.timer=setTimeout(this.moveLeft.bind(this),this.speed);
	},
	moveRight:function(){
		if(this.parent.scrollLeft>this.maxWidth-886-30){
			this.stop();
			$("#dpyright img").removeClass("hand").attr("src","/sysimg/BRGray.png");
		}else{
			this.parent.scrollLeft+=this.step;
		}
		if(!$("#dpyleft img").hasClass("hand"))
		{
		    $("#dpyleft img").addClass("hand").attr("src","/sysimg/dpy__r3_c4.png"); 
		}
		this.timer=setTimeout(this.moveRight.bind(this),this.speed);
	},
	stop:function(){
		clearTimeout(this.timer);	
	},
	start:function(){
		if(this.flagLeft){
			this.moveLeft();
		}else{
			this.moveRight();
		}
	}
}
new Scroll("dpyscroll","dpyleft","dpyright");
}        
);