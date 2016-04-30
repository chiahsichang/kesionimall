function page(pagestyle,perpagenum,itemunit,FExt,LinkUrlFname)
{
 //得到当前页码
  var url=window.location.href;
  var urls=url.split("_");
  var page=urls[urls.length-1].split('.')[0];
  if (checkRate(page)==false) page=TotalPage;
  page=TotalPage-page+1;	
  
  if (page<0 || (typeof(urls[2])=="undefined") && urls[0].toLowerCase().indexOf("index")<0 && urls[0].toLowerCase().indexOf("default")<0 && isNaN(page)) page=1

  var HomeLink=LinkUrlFname+FExt;
  
  jQuery("#totalpage").html(TotalPage);
  jQuery("#totalrecord").html(TotalPut);
  jQuery("#currpage").html(page);
  jQuery("#perpagenum").html(perpagenum);
  if (document.getElementById('turnpage')!=undefined){
   for(var i=1;i<=TotalPage;i++){ 
	 if (i==1)
	 document.getElementById('turnpage').options[i-1]=new Option('第'+i+'页',HomeLink);
	 else
	 document.getElementById('turnpage').options[i-1]=new Option('第'+i+'页',LinkUrlFname+'_'+eval(TotalPage-i+1)+FExt);
   }
  document.getElementById('turnpage').options(page-1).selected=true;
  }
}
function checkRate(value)
{
     var re = /^[0-9]+.?[0-9]*$/;   //判断字符串是否为数字     //判断正整数 /^[1-9]+[0-9]*]*$/   
     if (!re.test(value))
    {
        return false;
     }
	 return true;
}  