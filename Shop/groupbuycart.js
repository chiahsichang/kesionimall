var totalPrice=0;
var priceMarket=0;
var defaultFreight=0;
var DecimalPlaces=2;
jQuery(document).ready(function(){
	if (showDeliveryFlag==0){ //不显示邮寄信息
		$("#showDelivery").hide();
       OrderCalculat();
	}else{
		$("#showDelivery").show();
		showDeliveryList();
	}
	if (showPayMentFlag==1){
		 $("#showPayment").show();
	}else{
		 $("#showPayment").hide();
	}
	if (IsBusiness!=1){
		 $(".yfarea").hide();
	}
	
});
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
	    alert('购买数量不能小于0');
		return;
	   }
       jQuery.getScript(dir+'plus/ajaxs.ashx?a=setgroupbuynum&cartid='+cartid+'&num='+num+'&ProID='+ProID,function(){
			 if (data.issuccess=='false')
			   alert('操作失败了!');
			  else if (data.issuccess=='failmaxnum')
			      alert('本商品限定每人最多只能购买' + data.amount + '件!');
			  else if (data.issuccess=='failamount')
			      alert('库存量不足，最多还能购买' + data.amount + '件!');
			  else if (data.issuccess=='reload'){
			   location.href='index.aspx?app=shoppingcart';
			  }
			  else if(data.issuccess=='true'){
			   jQuery("#num_"+cartid).val(num);
			   
			   if (IsBusiness!=1){ 
			       showDeliveryList(); //网店自己销售的商品才重新加载配送方式，以便重计运费
			       jQuery("#subtotal_"+cartid).html(parseFloat(num*parseFloat(jQuery('#price_'+cartid).html())).toFixed(DecimalPlaces));
			   }else{
				   jQuery("#subtotal_"+cartid).html(parseFloat(parseFloat($("#freight_"+cartid).html())+num*parseFloat(jQuery('#price_'+cartid).html())).toFixed(DecimalPlaces));
			   }
			   OrderCalculat();
			   showTipsBox("恭喜,商品数量更新成功,当前订单总金额<font color=red>￥"+totalPrice.toFixed(DecimalPlaces)+"</font>元",obj)
			  
			 }
		});	   
	   
	 }
	
	function OrderCalculat(){
	           //运费
			  var freight=0;
			  if (showDeliveryFlag==1 && IsBusiness!=1){
				  var deliveryId=jQuery("input[name=DeliveryID]:checked").val();
				  freight=jQuery("#Freight_"+deliveryId).val();
			      if (freight==undefined) freight=defaultFreight;
			  }else if (IsBusiness==1){
				    jQuery(".subfreight").find('span').each(function(){
					 freight+=parseFloat($(this).html());
				   });
				   $("#ShowDeliveryList").html("<div class='deliverytips'>温馨提示：本单由合作商家负责发货。</div>");
			  }
			  jQuery("#orderFreight").html(freight);
			  jQuery("#TotalFreight").val(freight);
			  
			   var score=0;
			   totalPrice=priceMarket=0;
			   jQuery(".subtotal").find('span').each(function(){
				 totalPrice+=parseFloat($(this).html());
			   });
			   jQuery(".pricemarket").find('span').each(function(){
				 priceMarket+=parseFloat($(this).html())*parseFloat(jQuery("#num_"+$(this).attr("id")).val());
			   });
			   var goodsTotalPrice=totalPrice;
			   
			  
			  if (IsBusiness!=1){ 
			   totalPrice+=parseFloat(freight);
			   jQuery("#SaveMoney").html((priceMarket-goodsTotalPrice).toFixed(DecimalPlaces));
			  }else{ //商家
				jQuery("#SaveMoney").html((priceMarket-goodsTotalPrice+freight).toFixed(DecimalPlaces));
			  }
			   //付款方式优惠
			  var payDiscount=0;
			  if (showPayMentFlag==1){
				  var paymentId=jQuery("input[name=PayMentID]:checked").val();
				  payDiscount=totalPrice-totalPrice*parseFloat(jQuery("#Discount_"+paymentId).val())/100;
			  }
			  totalPrice=totalPrice-payDiscount;
              jQuery("#orderTotalPrice").html(totalPrice.toFixed(DecimalPlaces));
			   
               
	 }
	 

	var defaultFreight=0;
	function showDeliveryList(){
				  var addressId=$("input[name=addressId]:checked").val();
				  if (addressId==undefined){
				   $("#ShowDeliveryList").html("<div style='padding:10px 10px 10px 30px;background:#ffffee url(../s_images/i.gif) no-repeat 10px 9px;margin-top:10px;border:1px #FCE2AA solid;color:#e00;'>您还没有填写收货地址，请先完善并保存您的收货信息。</div>");
				  }else{
				 
				 
				  
				  $("#ShowDeliveryList").html("<div style='padding:10px;background:#ffffee;margin:5px 2px;border:1px #f9c943 solid;font-weight:bold'><img src='"+dir+"sysimg/loading.gif' align='absmiddle'/>系统正在加载配送地址,请稍候...</div>");
				  var provinceId=$("#provinceid_"+addressId).val()
				  var cityId=$("#city_"+addressId).val();
				  if (provinceId==undefined || provinceId=='0'){
				  provinceId=$("#provinceid option:selected").val();
				  }
				  if (cityId==undefined || cityId=='0'){
				  cityId=$("#cityid option:selected").val();
				  }
				  jQuery.get(dir+"plus/ajaxs.ashx", { a: "loaddeliverlist", provinceid:provinceId,cityId:cityId},
					 function(data){
					  var d=data.split("@@@");
					   //计算订单费用
					  defaultFreight=d[0];
					  $("#ShowDeliveryList").html(d[1]);
					  OrderCalculat();
					 })
				   }
		
			}
 function checkOrder(){
			   var addrId=jQuery("input[name=addressId]:checked").val();
			   if (showDeliveryFlag==1 && (addrId==0 || addrId==undefined)){
				alert('请先完善并保存收货地址！');
				return false;
			   }
			   if (showDeliveryFlag==0 && $("#mobile").val()==''){
				alert('此单凭手机验证码消费，请输入您的手机号！');
				return false;
			   }
			  
			   return true;
 } ﻿