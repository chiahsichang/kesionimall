function showTipsBox(msg,obj){
		var tipHtml="<div id='changeSucTip'><div id='tipContent'><div id='tipTitle'>"+msg+"<br/><br/><a href='javascript:closeWindow()'>关闭</a></div></div></div>";
		tipHtml+="<style>#changeSucTip{background: url(/sysimg/shop/cartTipBottom.gif) bottom no-repeat;height:80px;padding-bottom:4px;}#changeSucTip #tipContent{border:#ff9900 1px solid;background:#fffddd;border-bottom:none;height:77px;}#changeSucTip #tipTitle{margin-top:10px;text-align:center;}#changeSucTip #priceSpan{color:red;}</style>";
		
	    closeWindow();
		showMessageBox(tipHtml,obj,204);
		var mWin=jQuery('#mesWindow')[0];
		var isGrow=true;
		if(IsIE){
		try{
		  mWin.style.filter='alpha(opacty=90)';
		 }catch(e){isGrow=false;}
	  }
	 else{mWin.style.opacity=0.9;}
	 if(isGrow){setTimeout(function(){setGrowHidden(mWin,3,10);},4000);}
	 else{setTimeout(function(){closeWindow();},4000);}
  }
  function showMessageBox(content,obj,wWidth)
   {
   closeWindow();
   var pos=new getPos(obj);
   pos.Top=pos.Top-84;
   pos.Left=pos.Left-(204-pos.Width)/2;
   var bWidth=parseInt(document.documentElement.scrollWidth);
    var bHeight=parseInt(document.documentElement.scrollHeight);
	var mesW=document.createElement("div");
	mesW.id="mesWindow";
	mesW.innerHTML=content;
	if(bWidth-pos.Left<wWidth)
	{
	   styleStr="left:"+(pos.Left-wWidth)+"px;";
	}
	else
	{
	   styleStr="left:"+(pos.Left)+"px;";
	}
	styleStr+="top:"+pos.Top+"px;position:absolute;width:"+wWidth+"px;";
	mesW.style.cssText=styleStr;
	document.body.appendChild(mesW);
}
function closeWindow()
{
    if(jQuery('#mesWindow')[0]!=null)
    {  
       jQuery('#mesWindow')[0].parentNode.removeChild(jQuery('#mesWindow')[0]);
    }
}
function getPos(obj){
	this.Left=0;
	this.Top=0;
	this.Height=obj.offsetHeight;
	this.Width=obj.offsetWidth;
	var tempObj=obj;
	while (tempObj.tagName.toLowerCase()!="body" && tempObj.tagName.toLowerCase()!="html"){
		this.Left+=tempObj.offsetLeft;
		this.Top+=tempObj.offsetTop;
		tempObj=tempObj.offsetParent;
	}
}
function setGrowHidden(obj,intAlphaStep,intTimeStep)
{
    
    try{
        if(obj==null){return;}
        if(IsIE) 
        { 
            try{
            obj.filters.alpha.opacity-=intAlphaStep; 
            if (obj.filters.alpha.opacity>0) { 
            setTimeout(function(){setGrowHidden(obj,intAlphaStep,intTimeStep);},intTimeStep); 
            } 
            else {closeWindow();}
            }catch(e){closeWindow();}
        } 
        else 
        { 
            var curOpacity=obj.style.opacity;
            curOpacity-=intAlphaStep/100; 
            if (curOpacity>0) { 
            obj.style.opacity =curOpacity; 
            setTimeout(function(){setGrowHidden(obj,intAlphaStep,intTimeStep);},intTimeStep); 
            } 
            else {closeWindow();} 
        }
    }catch(e){}
}