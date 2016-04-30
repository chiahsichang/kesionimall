/* *
 * 优惠券及显示订单金额等
 */
var selectedCoupon=0
var CouponNum=0;
var showCouponMsg=true;
var facevalue=0;
function checkCoupon(){
  $.get(appurl+'plus/ajaxs.ashx',{a:"validatecoupon"},function(s){
     var returnStr=unescape(s);
	 updateOrderFee(returnStr);
  });
}
function changeCoupon(val)
{
  if (selectedCoupon == val)
  {
    return;
  }
  else
  {
    selectedCoupon = val;
  }
  var url = 'plus/ajaxs.ashx';
  $.get(url,{action:"Shop_GetCoupon",CouponId:val},function(s){
  updateOrderFee(unescape(s));
  });
}
function updateOrderFee(returnStr){
	var goodsMoney=0;
	var maxdiscount=0;
	var availablemoney=0;
	var minAmount=0;
	var rarr=null;
	var str='';
	if (returnStr!='' && returnStr !=null)
	{
		  rarr=returnStr.split('|');
		  if (rarr.length<=1)
		  {
			   if (showCouponMsg){
					 if (returnStr.indexOf("登录后才可以使用优惠券")!=-1){ 
						  KesionJS.Alert(returnStr,"showuserlogin()");
					 }else{
						  KesionJS.Alert(returnStr);
					 }
				 return;
			   }
		  }else{
		  
			  facevalue=parseFloat(rarr[0]).toFixed(DecimalPlaces);
			  minAmount=parseFloat(rarr[1]).toFixed(DecimalPlaces);
			  maxdiscount=parseFloat(rarr[2]);
			  availablemoney=parseFloat(rarr[3]).toFixed(DecimalPlaces);
			  goodsMoney=parseFloat($("#orderTotalPrice").html()).toFixed(DecimalPlaces);  // 查找只含商品价格
			  if (parseFloat(goodsMoney)<parseFloat(minAmount))
			  {
				if (showCouponMsg)
				KesionJS.Alert('对不起,该优惠券最小订单商品金额(不含运费)为'+priceunitsymbol+minAmount+ ' '+priceunit+'才可使用!' );
				else
				KesionJS.Alert('对不起,优惠券['+rarr[4]+']最小订单商品(不含运费)总金额为'+priceunitsymbol+minAmount+ ' '+priceunit+'才可使用!' );
				$("#ORDER_COSTS").html('');
			  }else if(availablemoney<=0){
				if (showCouponMsg) KesionJS.Alert('对不起,该优惠券已用完!');
			  }else{
				 if (maxdiscount==0){
				 if (showCouponMsg) KesionJS.Alert('恭喜,该优惠券可抵用'+priceunitsymbol+facevalue+ ' '+priceunit+'!');
			   }else{
				  var allowmoney=parseFloat(goodsMoney)* (maxdiscount/100);                         //按百分比得可抵扣金额
				  if (allowmoney>availablemoney){
					 allowmoney=availablemoney;
				  }
				  if (availablemoney==facevalue || availablemoney-allowmoney!=0){
				  if (showCouponMsg) KesionJS.Alert('恭喜,该优惠券是按订单总金额的'+maxdiscount+'%抵用,最多不超过'+priceunitsymbol+facevalue+priceunit+',当前可用余额'+priceunitsymbol+parseFloat(availablemoney).toFixed(DecimalPlaces)+priceunit+'。在本订单中可抵用'+priceunitsymbol+parseFloat(allowmoney).toFixed(DecimalPlaces)+ ' '+priceunit+',使用后该优惠券还剩'+priceunitsymbol+(availablemoney-allowmoney).toFixed(DecimalPlaces)+priceunit+'!');
				  }else{
				  if (showCouponMsg) KesionJS.Alert('恭喜,该优惠券还可抵用'+priceunitsymbol+parseFloat(allowmoney).toFixed(DecimalPlaces)+ ' '+priceunit+',使用后该优惠券还剩'+priceunitsymbol+(availablemoney-allowmoney).toFixed(DecimalPlaces)+priceunit+'!');
				  }
				  facevalue=allowmoney;
			   }
			  str='<br />使用优惠券抵销：<font color=blue>'+priceunitsymbol+'<span id="couponfacemoney">'+parseFloat(facevalue).toFixed(DecimalPlaces) +'</span></font>'+priceunit;
			  $("#ORDER_COSTS").html(str);
		}
		
	  }
	}
	loadFrontPrice();
	showResultMoney();  //显示最终价格信息
}

//显示付定金
function loadFrontPrice(){
	//==========================判断是否支持仅付定金 begin==================================　
     var total=0;
	 var payType=0;
	 $(".frontPrice").each(function(){
		   payType=$(this).attr("paytype");
		   if (payType!=0)
		   total+=parseFloat($(this).html())*parseFloat($("#num_"+$(this).attr("cartid")).val());
		   
	 });
	 if (total!=0){
	     $("#showFrontPrice").html("<br/><strong>"+((payType=="2")?"至少":"")+"需要支付订金：<span class='price'>"+priceunitsymbol+total.toFixed(DecimalPlaces)+priceunit+"</span></strong>");
	 }
	 //==========================判断是否支持仅付定金 end==================================　
}

//显示最终价格信息
function showResultMoney(){
	 
	var showResult=parseFloat($("#orderTotalPrice").html())-facevalue;   //最终价格等于商品价格－优惠券金额
	
	 //================================商场优惠  begin==============================================================
	if (mallActivities=="1"){
		 var totalYHPrice=0;
		  jQuery(".subtotal").each(function(){
			  if ($(this).attr("IsPromotions")=="1"){
				 totalYHPrice+=parseFloat($(this).html());
			 }
		 });
		var cxSaveMoney=0;
		if (totalYHPrice>0){
			  var cxarr=mallActivitieArr.split('§');
			  for(var ci=0;ci<cxarr.length;ci++){
				  var carr=cxarr[ci].split('|');
				  if (totalYHPrice>=parseFloat(carr[0])){
				   cxSaveMoney=carr[1];
				  }
			  }
			  if (parseFloat(cxSaveMoney)>0){
			    $("#showsave").show();
			  }else{
				$("#showsave").hide();  
			  }
			  $("#SaveMoney").html(parseFloat(cxSaveMoney).toFixed(DecimalPlaces));
		 }else{
			 $("#showsave").hide();
		 }
		 showResult=showResult-parseFloat($("#SaveMoney").html());
	 }
	 //================================商场优惠 end==============================================================
	 
	  $("#showMustPayPrice").html("<br/><strong>您需要支付：<span class='price'>"+priceunitsymbol+showResult.toFixed(DecimalPlaces)+priceunit+"</span></strong>");

	 
	 if ($("#orderScore").html()!='0'){ $("#showjf").show(); }
	 
}



function validateCoupon()
{
  if ($("#couponnum").val()=='')
  {
	  try{
       KesionJS.Alert('请输入优惠券号!','$("#couponnum").focus();');
	  }catch(e){
		  alert('请输入优惠券号!');
	  }
   return false;
  }
  if (CouponNum == $("#couponnum"))
  {
    return;
  }
  else
  {
    CouponNum = $("#couponnum");
  }
  showCouponMsg=true;
  var url = appurl+'plus/ajaxs.ashx';
  $.get(url,{a:"validatecoupon",CouponNum:$("#couponnum").val()},function(s){
    var returnStr=unescape(s);
	if (returnStr=='' || returnStr==null){
		try{
	      KesionJS.Alert('对不起,您输入的优惠券不可用!','$("#couponnum").val("");');
		}catch(e){
			alert('对不起,您输入的优惠券不可用!');
		}
	  return ;
	}
	 else{
	updateOrderFee(returnStr);
	}
  });
}

﻿

//＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝购物车相关操作 begin===============================================
function removeOnShoppingCart(cartid){ 
	   KesionJS.Confirm("确定从购物车里删除吗?","delfromcart("+cartid+")","");
	 }
	 function delfromcart(cartid){
	    jQuery.get(appurl+"plus/ajaxs.ashx", { a: "delfromcart", cartid:cartid},
			 function(data){
					if (data=="success"){
					 location.href='?app=shoppingcart';
					}else{
					 KesionJS.Alert('删除失败!');
					}
			  });
	 }
	 function addChangeBuyPro(proid,needPrice){
	    var totalPrice=parseFloat(jQuery("#orderTotalPrice").html());
		if (parseFloat(needPrice)>totalPrice){
		  KesionJS.Alert('对不起,您的订单金额不足,还差'+priceunitsymbol+(needPrice-totalPrice).toFixed(DecimalPlaces)+priceunit+'!');
		  return false;
		}
		if (jQuery("#chnagebuyproid")[0]){
		  if (jQuery("#chnagebuyproid").val()!=proid){
		    if (confirm('您已挑选过换购品,确认替换吗?')==false) return false;
		  }
		}
	     jQuery.get(appurl+"plus/ajaxs.ashx", { a: "addchangebuytocart", proid:proid},
			 function(data){
					if (data=="success"){
					 location.href='?app=shoppingcart';
					}else{
					 KesionJS.Alert('添加失败!');
					}
			  });
	 }
	 function removeAllPro(){
	   KesionJS.Confirm('确定清空购物车里的商品吗?','removeallprofromcart();','');
	 }
	 function removeallprofromcart(){
	   jQuery.get(appurl+"plus/ajaxs.ashx", { a: "removeallprofromcart"},
			 function(data){
					if (data=="success"){
					 location.href='?app=shoppingcart';
					}else{
					 KesionJS.Alert('删除失败!');
					}
			  });
	 }
	 function changeBar(t,cartid,obj){
	   var num=parseInt(jQuery("#num_"+cartid).val());
	   var ProID=jQuery("#proid_"+cartid).val()
	   if (t=='+'){
	    num++;
	   }else if(t=='o'){
	    num=parseInt(jQuery('#num_'+cartid).val());
	   }else{
	    num--;
	   }
	   if (num<=0){
		 removeOnShoppingCart(cartid);
	   }else{
	   
	    jQuery.getScript(appurl+'plus/ajaxs.ashx?a=setbuynum&cartid='+cartid+'&num='+num+'&ProID='+ProID,function(){
	          if (data.issuccess=='false')
			   KesionJS.Alert('操作失败了!');
			  else if (data.issuccess=='failnum')
			   KesionJS.Alert('库存量不足,最多还能购买'+data.amount+'件!');
			  else if (data.issuccess=='failmaxnum')
			   KesionJS.Alert('本商品限定每人最多只能购买'+data.amount+'件!');
			  else if (data.issuccess=='failminnum'){
			    if (confirm('本商品限定每人最少需要购买'+data.amount+'件,您要取消本次购买吗?')){ removeOnShoppingCart(cartid);	}
			   }
			  else if (data.issuccess=='reload'){
			   location.href='index.aspx?app=shoppingcart';
			  }
			  else if(data.issuccess=='true'){
			   jQuery("#num_"+cartid).val(num);
			   jQuery("#subtotal_"+cartid).html(parseFloat(num*parseFloat(jQuery('#price_'+cartid).html())).toFixed(DecimalPlaces));
			   jQuery("#changescoresubtotal_"+cartid).html(parseInt(num*parseInt(jQuery('#changescore_'+cartid).html())));
			   jQuery("#subscore_"+cartid).html(parseInt(num*parseInt(jQuery('#score_'+cartid).val())));
		   
			   var totalPrice=0;
			   var totalChangeScore=0;
			   var priceMarket=0;
			   var score=0;
			   jQuery(".subtotal").each(function(){
				 totalPrice+=parseFloat($(this).html());
			   });
			   jQuery(".changescoresubtotal").each(function(){
				 totalChangeScore+=parseInt($(this).html());
			   });
			   jQuery(".pricemarket").find('span').each(function(){
				 priceMarket+=parseFloat($(this).html())*parseFloat(jQuery("#num_"+$(this).attr("id")).val());
			   });
			   jQuery(".subscore").find('span').each(function(){
				score+=parseInt($(this).html());
			   });
			   
			   jQuery("#orderTotalChangeScore").html(totalChangeScore);
               jQuery("#orderTotalPrice").html(totalPrice.toFixed(DecimalPlaces));
			   jQuery("#orderScore").html(score);
			   showCouponMsg=false;  
			   checkCoupon();    //检查优惠券是否可用
			   var tips='';
			   if (totalChangeScore>0) tips="<font color=red>"+totalChangeScore+"分</font>";
			   if (totalPrice>0) tips+="+<font color=red>"+priceunitsymbol+totalPrice.toFixed(DecimalPlaces)+priceunit+"</font>";
			   showTipsBox("恭喜,商品数量更新成功,当前订单总金额："+tips+"。",obj);
			 }
		});	  
	   
       
	   }
	 }
//＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝购物车相关操作 end===============================================
