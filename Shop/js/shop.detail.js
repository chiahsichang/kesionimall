 <!--
 var priceunitsymbol=''; //货币符号
 var priceunit='';  //货币符号单位
 var salespricename='销售价'; //销售价格名称
 var prounit='';    //商品单位
 var modelid=4;     //模型id
 var classid='';    //商品栏目id
 var infoid=0;  //商品id
 var dir='/';
 var dis=1;  //会员组折扣
 
 var shop={
		check:function(a){
			  if ($("#bookcode")[0]!=undefined){
				   if ($("#bookcode").val()==''){
					  KesionJS.Message("error.gif",'请选择输入邀请码才能购买！','$("#bookcode").focus();');
                      return false;
				   }
			  }
			  for(var k=0;k<=a;k++)
			  {
			   if ($("#attr"+k).val()==''){
			     KesionJS.Message("error.gif",'请选择'+$("#attrname"+k).html().replace('：','！'),'');
				 return false;
			   }
			  }
			  if ($("#stock").text()<=0){
				  $.dialog.tips('对不起，该商品缺货！');
				  return false;
			  }
			  if ($("#num").val()==0||$("#num").val()==''){
			   $.dialog.tips('请输入购买数量!');
			   return false;
			  }
			  if (parseInt($("#num").val())>parseInt($("#stock").text())){
			   $.dialog.tips('对不起，您最多只能购买'+$("#stock").text()+'!');
			   return false;
			  }
			  return true;
			  
			 },
             gobuy:function(a){
			  if (shop.check(a)){$("#buyform").submit();}
		     },
			 checkchangebuy:function(changebuyneedprice){
				 var totalprice=parseFloat($("#totalprice").text());
				 if (totalprice<parseFloat(changebuyneedprice)){
					  $.dialog.tips('对不起,您的订单费用不足,还差￥' +(parseFloat(changebuyneedprice)-totalprice).toFixed(2)+' 元!');
					  return false;
				 }
				 return true;
			 },
			 buynum:function(f){
			   var maxordernum=parseInt($("#maxordernum").val());
			   if (f==1 && maxordernum>0 && (parseInt($("#num").val())+1)>maxordernum){
				    $.dialog.tips('对不起，您最多只能买'+maxordernum+' '+$("#unit").text()+'!');
					$("#num").val(maxordernum);
				    return;
			   }
			   if (f==0&&parseInt($("#num").val())<=1){
				    $.dialog.tips('对不起，您最少要购买1'+$("#unit").text()+'!');
				    return;
			   }
			   if (f==0 && parseInt($("#num").val())>0){
				   $("#num").val(parseInt($("#num").val())-1);
				   return;
			   }
			   if (f==1 && (parseInt($("#num").val())+1)>parseInt($("#stock").text()))
			   {
				   if (parseInt($("#stock").text())==0){
					 $.dialog.tips('对不起,该商品缺货!');
				   }else{
			         $.dialog.tips('对不起，您最多只能购买'+$("#stock").text()+$("#unit").text()+'!');
				   }
			    return;
			   }else{
				   $("#num").val(parseInt($("#num").val())+1) ;
			   }
			 },
			 buynums:function(type,proid,attrid,cartid,buynum,f){
				if (buynum!=0){$("#Q_"+cartid)[0].disabled=true;}
				$.get(dir+"shop/ajax.getdate.asp",{action:'getcartstock',type:type,buynum:buynum,cartid:cartid,f:f,proid:proid,attrid:attrid},function(s){
				  s=unescape(s);
				  if (buynum!=0){$("#Q_"+cartid)[0].disabled=false;}
				   if (s!='succ'){
					  $.dialog.tips(s.split('|')[1]);
					  return;
				   }else{
					  if (f==0){
						 $("#Q_"+cartid).val(parseInt($("#Q_"+cartid).val())-1);
					  }else{
						 $("#Q_"+cartid).val(parseInt($("#Q_"+cartid).val())+1);
					  }
					  shop.changecart(cartid);
				   }
				});

			 },
			 changecart:function(cartid){
				var price=$("#hidmyprice"+cartid).text();
				var score=$("#hidmyscore"+cartid).text();
				 var num=parseInt($("#Q_"+cartid).val());
					  $("#myprice"+cartid).html((price*num).toFixed(2));
					  $("#myscore"+cartid).html(score*num);
					  var totalmyprice=0;
					  var totalmyscore=0;
					  $("#shoppingtable").find("SPAN[name=totalmyprice]").each(function(){
							totalmyprice+=parseFloat($(this).text());															
					  });
					  $("#shoppingtable").find("SPAN[name=totalmyscore]").each(function(){
							totalmyscore+=parseInt($(this).text());															
					  });
					  $("#totalprice").html(totalmyprice.toFixed(2));
					  $("#totalscore").html(totalmyscore);
			 },
			 getAttr:function(obj,i,a,l,num,ids){
				 if (obj.innerHTML.indexOf('title')==-1){
					$("#attr"+i).val(obj.innerHTML.replace(/<I.*<\/I>/ig,"")); 
				 }else{
					$("#attr"+i).val($("#"+obj.id).find("IMG").attr("title"));
				 }
			  if (i==1){
			   $("#attr2").val('');
			   $("#attr3").val('');
			  }else if(a==3&&i==2){
			   $("#attr3").val('');
			  }
			  
			  for(var k=0;k<=l;k++)
			  { 
			    $("#att"+i+k).removeClass("curr").addClass("txt");
			  }
			  $(obj).removeClass("txt").addClass("curr");
			  if (i==a){
               $("#attrid").val(ids);
			   try{
			   $('.showDynamicPrice').html(priceunitsymbol +(parseFloat(itemattr[ids][3])*dis).toFixed(2)+ priceunit);
			   $.getScript(dir+'shop/GetStock.aspx?attrid='+ids,function(a){
					$(".stock").html(a);
					if (parseInt($("#num").val())>parseInt($("#stock").text()) && parseInt($("#stock").text())>0){
					 $("#num").val($("#stock").text());
				    }
				});
			   }catch(e){
			   }

			  }else{
               $("#attrid").val('');
			  }
			  if (num!=0&&ids!=undefined){
				var str2='';
				var str22='';
				var idsarr=ids.split(",");
				var maxprice=minprice=0;
				var maxprice_market=minprice_market=0;
				for(var k=0;k<idsarr.length;k++){
					 var id=idsarr[k];
					 var itemvalue=itemattr[id][1];
					 if (num==3){
						itemvalue=itemattr[id][2]; 
					 }
					  str2+=itemvalue+"^"+id+",,,";
					  if (str22.indexOf(itemvalue)==-1){
					    str22+=itemvalue+",,,";
					  }
					if (parseFloat(itemattr[id][3])<minprice||minprice==0){minprice=itemattr[id][3];}
					if (parseFloat(itemattr[id][3])>maxprice||maxprice==0){maxprice=itemattr[id][3];}
					if (parseFloat(itemattr[id][5])<minprice_market||minprice_market==0){minprice_market=itemattr[id][5];}
					if (parseFloat(itemattr[id][5])>maxprice_market||maxprice_market==0){maxprice_market=itemattr[id][5];}
				}
				if (minprice==maxprice){
				   	$('.showDynamicPrice').html(priceunitsymbol +(minprice*dis).toFixed(2)+ priceunit);
					promotPrice=parseFloat(minprice*dis);
                    try{
					checkBundleSale();
					}catch(e){
					}
				}else{
					$('.showDynamicPrice').html(priceunitsymbol+ (minprice*dis).toFixed(2)+priceunit+'~'+priceunitsymbol+(maxprice*dis).toFixed(2)+priceunit);
				}
								
				if (minprice_market==maxprice_market){
				   	$('.showPriceMarket').html(priceunitsymbol +minprice_market.toFixed(2)+ priceunit);
				}else{
					$('.showPriceMarket').html(priceunitsymbol+ minprice_market.toFixed(2)+priceunit+'~'+priceunitsymbol+maxprice_market.toFixed(2)+priceunit);
				}
					
				str22arr=str22.split(',,,');
				str2arr=str2.split(',,,');
				var new2str='';
				for(var i=0;i<str22arr.length-1;i++){
				      var ids2="";
					  for(var k=0;k<str2arr.length-1;k++){
					    if (str22arr[i]==str2arr[k].split('^')[0]){
						  if (ids2==""){
						   ids2=str2arr[k].split('^')[1];
						  }else{
						   ids2=ids2 + "," +str2arr[k].split('^')[1]
						  }
						}
					  }
					  if (i==0){
					   new2str=str22arr[i] + "^" + ids2;
					  }else{
					   new2str=new2str + ",,," + str22arr[i] + "^" + ids2;
					  }	
				}
				new2str=new2str.split(',,,');
				var strs="<span id='attrname"+num+"'>"+ myitemname[num-1]+ "：</span>";
				var vlan=new2str.length-1;
				var haspro=false
				for(var k=0;k<=vlan;k++){
					itemvalue=new2str[k].split("^")[0];
					var itemids=new2str[k].split("^")[1];
					var itemcss='txt';
					
					var iiarr=itemvalue.split('|')
					var vv='';
					if (iiarr[1]!=''){
						vv="<img src='" + iiarr[1] +"' width='25' height='25' title='" + iiarr[0] +"'/>";
					}else{
					    vv=iiarr[0];
					}
					if (num==2){
						if (itemids.indexOf(",")!=-1){
							 haspro=true;
							 strs+='<span id="att'+num+k+'" class="'+itemcss+' s'+itemids+'" title="'+vv+'"  onclick="shop.getAttr(this,2,'+a+','+vlan+',3,\''+itemids+'\')">'+vv+'<i><img src="'+dir+'sysimg/default/item_sel.gif"/></i></span> ';
						}else{
						$.ajax({
						   type: "POST",
						   async: false,//同步调用
						   url: '/shop/GetStock.aspx',
						   data: 'attrid='+itemids,
						   success: function (data) {
								if (parseInt(data)>0){
									haspro=true;
					               strs+='<span id="att'+num+k+'" class="'+itemcss+' s'+itemids+'" title="'+vv+'" onclick="shop.getAttr(this,2,'+a+','+vlan+',3,\''+itemids+'\')">'+vv+'<i><img src="'+dir+'sysimg/default/item_sel.gif"/></i></span> ';
								}else{
								 // strs+='<span id="att'+num+k+'" class="'+itemcss+' s'+itemids+'" style="display:no1ne" disabled>'+vv+'</span> ';
								  strs+='<span id="att'+num+k+'" class="'+itemcss+' s'+itemids+'" title="缺货" style="background:#f1f1f1" onclick="shop.getAttr(this,2,'+a+','+vlan+',3,\''+itemids+'\')">'+vv+'<i><img src="'+dir+'sysimg/default/item_sel.gif"/></i></span> ';
								}
								
								
						   }
						});
					}
						
					}else{
						
						$.ajax({
						   type: "POST",
						   async: false,//同步调用
						   url: '/shop/GetStock.aspx',
						   data: 'attrid='+itemids,
						   success: function (data) {
								if (parseInt(data)>0){
									haspro=true;
								  strs+='<span id="att'+num+k+'" class="'+itemcss+'" title="'+vv+'"  onclick="shop.getAttr(this,3,'+a+','+vlan+',0,'+itemids+')">'+vv+'<i><img src="'+dir+'sysimg/default/item_sel.gif"/></i></span> ';
								}else{
								  strs+='<span id="att'+num+k+'" class="'+itemcss+'"  title="缺货" style="background:#f1f1f1"  onclick="shop.getAttr(this,3,'+a+','+vlan+',0,'+itemids+')">'+vv+'<i><img src="'+dir+'sysimg/default/item_sel.gif"/></i></span> ';
								}
						   }
						});
						
					}
				}
				
				//if (haspro==false) strs+="<span>缺货</span>";
	           jQuery("#showattr"+num).html(strs);
               // alert(str22);
			  }
			  
			 // alert($("#showattr3").html());
			 
			  
			  var attr='';
			  var attrs='';
			  for(var k=0;k<=a;k++)
			  {
				   if ($("#attr"+k).val()!='' && $("#attr"+k).val()!=undefined){
					if (attr==''){
					  attr='“'+$("#attr"+k).val()+'”';
					  attrs=$("#attrname"+k).html()+$("#attr"+k).val();
					 }else{
					  attr+=',“'+$("#attr"+k).val()+'”';
					  attrs+='  '+$("#attrname"+k).html()+$("#attr"+k).val();
					 }
				   }
			  }
			  $("#buyselect").html("<b>已选择：<font color=brown>"+attr+"</font></b>");
			  $(".bindattr").html("("+attr+")");
			 },
			 addCart:function(ev,id,a,m){
			  var dir=appurl;
			  if (shop.check(a)){
				var top=$('#carbtn').offset().top - $(document).scrollTop()+28;
				if (top<0) top=28;
				var left=parseInt($('#carbtn').offset().left);
				if (left+400-parseInt($(document.body).width())>0) left=left-300;
				 var str="<img src='"+dir+"shop/images/suc.gif' align='absmiddle'><span style='font-size:14px;color:#000;'>已成功添加到购物车！</span><div id='cartShow' style='width:380px;height:160px;'></div><div class='jrgwc'> <a href=\'"+dir+"index.aspx?app=orderinfo\'><img src=\'"+dir+"shop/images/hesuan.gif\'></a> <a href=\'"+dir+"index.aspx?app=shoppingcart\'><img src=\'"+dir+"shop/images/chakangouwuche.gif\'></a></form></div>";

				var kbid='';
				$("input[name=Bundid]").each(function(){
					if ($(this)[0].checked){
						kbid+=','+$(this)[0].value;
					}
				 });
				jQuery.getScript(dir+'plus/Ajaxs.ashx?BundleIDs='+kbid+'&id='+id+'&attrid='+$("#attrid").val()+'&m='+m+'&a=addCart&num='+$("#num").val(),function(){
				  if (data.flag=='error'){
						    alert('参数出错啦!');
					}else if (data.flag=='error1'){
						    alert('对不起，您没有登录!');
							showuserlogin();
					   }else{
					    	$.dialog({id:'mycart',title:'购物车内商品',max:false,min:false,content:str,left: left,top: top});
				            $("#cartShow").html(unescape(data.str));
					   }																														                 
				 });
				
			   }
			 }
 }
 
 
 function showBuyInfo(id){
	 jQuery.ajax({
		 type: "POST",
		 url: "/plus/ajaxs.ashx",
		 data: "a=getcartinfo&proid="+id,
		 success: function(data){
			$("#showCarInfo").html(data);
			 if ($("#carbox").is(":hidden")==false) $("#showLimitEndTime").show();
		}
	});
}


jQuery.fn.rowspan = function(colIdx) { //封装的一个JQuery小插件 
	return this.each(function(){ 
	var that; 
	$('tr', this).each(function(row) { 
	$('td:eq('+colIdx+')', this).filter(':visible').each(function(col) { 
	if (that!=null && $(this).html() == $(that).html()) { 
	rowspan = $(that).attr("rowSpan"); 
	if (rowspan == undefined) { 
	$(that).attr("rowSpan",1); 
	rowspan = $(that).attr("rowSpan"); } 
	rowspan = Number(rowspan)+1; 
	$(that).attr("rowSpan",rowspan); 
	$(this).hide(); 
	} else { 
	that = this; 
	} 
	}); 
	}); 
	}); 
} 

			 
$(document).ready(function(){
	
	//合并
	$("#specialtable").rowspan(0); 
	$("#specialtable").rowspan(1); 

						   
	//加载价格信息					   
	$(".showDynamicPrice").html('loading...');
	$.getScript(dir+'plus/ajaxs.ashx?a=getproprice&modelid='+modelid+'&proid='+infoid,function(){
		dis=DynamicPrice.discount;
		 var str;
		if (DynamicPrice.isLimitBuy=="1"){  //限时
		     $("#showPriceName").html("限时抢购价：");
		}else if (DynamicPrice.isLimitBuy=="2"){ //限量
		     $("#showPriceName").html("限量抢购价：");
		}else{
			$("#showPriceName").html(salespricename+"：");
		}
		$(".showDynamicPrice").html(DynamicPrice.str);
		$(".stock").html(DynamicPrice.limitBuyAmount);
	});
	
	//点分享送积分
	$(".bshare-custom").find("A").click(function(){
		return(addScore(classid,infoid));
	});	
		

 });
 //-->
