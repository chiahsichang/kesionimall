<%@ Control Language="C#" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.Control_LabelJS" Codebehind="LabelJS.ascx.cs" %>
  <script type="text/javascript">
   <!--
	 function GetClassOption()
  {
    var channelid=jQuery("#<%=ModelClientID %> option:selected").val();
    jQuery.get('KS.GetClassOption.aspx',{channelid:channelid,getspecial:1,stamp:Math.random() },function(s){
	var p=s.split("@@@");
	 jQuery("#classid1").empty();
	 jQuery("#classid1").append('<option value="0">-不指定栏目-</option><option value="-1" style="color:red">当前栏目通用</option>');
	 jQuery('#classid1').append(p[0]);
	 jQuery("#specialid1").empty();
	 jQuery("#specialid1").append('<option value="">-不指定专题-</option><option value="-1" style="color:red">当前专题通用</option>');
	 jQuery('#specialid1').append(p[1]);
       
    });
  }
  function selectclassid(v) {
      
   var va=v.split(',');
   for(var i=0;i<jQuery("#classid1")[0].options.length;i++)
   {
    for(var n=0;n<va.length;n++)
    {
        if(va[n]==jQuery("#classid1")[0].options[i].value)
        {
          jQuery("#classid1")[0].options[i].selected=true;
        }
    }
   } 
  }
  function selectspecialid(v)
  {
    for(var i=0;i<jQuery("#specialid1")[0].options.length;i++)
   {
        if(v==jQuery("#specialid1")[0].options[i].value)
          jQuery("#specialid1")[0].options[i].selected=true;
         
   }  
  }
   
	
	//-->
 </script>
