<%@ Control Language="C#" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.Control_SpecialControl" Codebehind="SpecialControl.ascx.cs" %>
  <script type="text/javascript">
   <!--
	  SelectSpecial=function(){
		var strUrl = 'KS.SpecialSelect.aspx'; 
		parent.openWin('选择专题','content/KS.SpecialSelect.aspx',false,750,480);
	}
	
	function SelectAll(){
	   jQuery("#SpecialID option").each(function(){
			    jQuery(this).attr("selected",true);
		 });
	}
	function UnSelectAll(){
	  jQuery("#SpecialID option").each(function(){
			   jQuery(this).attr("selected",false);
		  });
	} 
	
	//-->
 </script>
 <table border=0 width='100%'>
 <tr>
	<td style="width:200px" id='SpecialList'>
          <select name='SpecialID' id="SpecialID" multiple="multiple" style="height:100px;width:200px;"><%=OptionStr%></select>
          <div style='text-align:center'><span style="color:Red">X</span> <a href='javascript:UnSelectAll()'><font color='#999999'>取消选定的专题</font></a></div></td>
	 <td><input class='button'  type='button' name='Submit' value='选择专题...' onclick='SelectSpecial();' /></td>
</table>