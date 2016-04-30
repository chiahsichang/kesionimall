var hasCheckId;
var cbox='';
$(document).ready(function(){
    laodComparePro(1);
 });
function showCompareBox(){
	var str='<div class="procompare" id="procompare">';
	str+='  <div class="clear"></div>';
	str+='  <div class="procompareleft">';
	str+='	 <ul id="comparepro"><ul>';
	str+='  </div>';
	str+='  <div class="procompareright">';
	str+='  <br/><input type="button" value="开始对比" class="compareBtn" onclick="doProCompare()"/><br/>';
	str+='	<span><a href="javascript:;" onclick="cleanCompare()" style="color:#999">清空对比栏目</a></span>';
	str+='  </div>';
	str+='</div>';				   
	cbox=$.dialog({id:'mybox',title:'商品对比',content:str,fixed:true,top: '100%',max:false,min:false});
}
function laodComparePro(firstLoad){
     $.ajax({
		url: appurl+'shop/ProComment.ashx?action=loadComparePro',
		success: function(data) {
			
		     var d=data.split('$%$');
			 hasCheckId=d[1].split(',');
			  if (firstLoad==1){
				  if (d[1]=='') {
				  }else{
					showCompareBox();  
				  }
			 }else{
				 showCompareBox();
			 }
			 for(var i=0;i<hasCheckId.length;i++){
			  $("#comparecheck"+hasCheckId[i]).attr("checked",true);
			  $("#compare"+hasCheckId[i]).attr("class","checkcomparetrue");
			 }

			 $("#comparepro").html(d[0]);
		},
			cache: false
	});
 }
 function addToCompare(modelId,id,c){
      if (id == '') return;
	  $('#procompare').show();
	  if (c){
	   $("#compare"+id).attr("class","checkcomparetrue");
	  }else{
	  $("#compare"+id).attr("class","checkcomparefalse");
	  }
	  if (!c){
	   delFromCompare(id);
	  }else{
		$.ajax({
				url: appurl+'shop/ProComment.ashx?mid='+modelId+'&id=' + id + '&action=addToCompare',
					success: function(data) {
					    if(data.indexOf('error:')!=-1){
						  $("#comparecheck"+id).attr("checked",false);
						  $("#compare"+id).attr("class","checkcomparefalse");
						  KesionJS.Alert(data.split(':')[1]);
						}else{
						  laodComparePro(0);
						}
					},
					cache: false
		});
		}
 }
 function delFromCompare(id){
  $.ajax({
		url: appurl+'shop/ProComment.ashx?action=delFromCompare&id='+id,
		success: function(data) {
		    $("#comparecheck"+id).attr("checked",false);
			 $("#compare"+id).attr("class","checkcomparefalse");
			 laodComparePro(0);
		},
		cache: false
	});
 }
 function cleanCompare(){
   $.ajax({
		url: appurl+'shop/ProComment.ashx?action=cleanCompare',
		success: function(data) {
		    $(".checkcomparetrue").attr("class","checkcomparefalse");
			$(".comparecheck").attr("checked",false);
			laodComparePro(0);
			},
		cache: false
	});
 }
 function doProCompare(){
   if (hasCheckId.length<2){
     KesionJS.Alert('至少需要选择两件商品，才能比较!');
   }else{
     location.href=appurl+'shop/compare.aspx?id='+hasCheckId;
   }
 }