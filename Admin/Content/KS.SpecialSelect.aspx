<%@ Page Language="C#" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.Admin_SpecialSelect" Codebehind="KS.SpecialSelect.aspx.cs" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>菜单</title>
</head>
<style type="text/css">
	body{
		margin:0px;
		padding:10px;
		text-align:left;
		font-size:12px;
		background:#f0f9fe;
	}
	A {
	COLOR: #036; TEXT-DECORATION: none
}
A:hover {
	COLOR: #258dc9; TEXT-DECORATION: underline
}
</style>
	<body class="lefttd">
		<script type="text/javascript" src="../../ks_inc/jquery.js"></script>
		<script type="text/javascript">
		    var ids = "";
		    function ok() {
			   UpdateSpecial(ids);
				top.box.close();
	  }
	  
	 function  UpdateSpecial(arrstr){
		 if (arrstr!=''){
		  var idarr =arrstr.split('###');
		  for (var ii = 0; ii < idarr.length; ii++) {
			 var arr=idarr[ii].split('@@@');
			 var isadd=true;
			 $('#SpecialID option',top.frames["main"].document).each(function(){
			   if ($(this).val()==arr[0]){
			     isadd=false;
			   }
			 });
			 if (isadd){
			 jQuery('#SpecialID',top.frames["main"].document).append("<option value='"+arr[0]+"' selected>"+arr[1]+"</option>");
			  }
	      }
		
		}
	}
      function set(specialid,specialname)
	 {
          if (ids == '') {
              ids = specialid + '@@@' + specialname;
          } else {
              ids +="###"+ specialid + '@@@' + specialname;
          }
	  }
	 

				var lastA = null;
	  			function changeExtImg(objImg){
					if (!objImg){ return; }	
					var fileName = objImg.src.toLowerCase().substring(objImg.src.lastIndexOf("/"));
					switch(fileName){
						case "/p0.gif":
							objImg.src = "../../admin/images/tree/m0.gif";
							break;
						case "/p1.gif":
							objImg.src = "../../admin/images/tree/m1.gif";
							break;
						case "/p2.gif":
							objImg.src = "../../admin/images/tree/m2.gif";
							break;
						case "/p3.gif":
							objImg.src = "../../admin/images/tree/m3.gif";
							break;
						case "/m0.gif":
							objImg.src = "../../admin/images/tree/p0.gif";
							break;
						case "/m1.gif":
							objImg.src = "../../admin/images/tree/p1.gif";
							break;
						case "/m2.gif":
							objImg.src = "../../admin/images/tree/p2.gif";
							break;
						case "/m3.gif":
							objImg.src = "../../admin/images/tree/p3.gif";
							break;
					}
				}
	  			function changeFolderImg(objImg){
					if (!objImg){ return; }	
					var fileName = objImg.src.toLowerCase().substring(objImg.src.lastIndexOf("/"));
					switch(fileName){
						case "/folder.gif":
							objImg.src = "../../admin/images/tree/folderopen.gif";
							break;
						case "/folderopen.gif":
							objImg.src = "../../admin/images/tree/folder.gif";
							break;
					}
				}
				function a_click(objA){
					if (lastA){
						lastA.className=''; 
					}
					objA.className='bold'; 
					lastA = objA; 
				}
	  			function writetree(objreturn,pid,AtEnd){
					var process = document.getElementById("process_" + pid);
					var tree = document.getElementById("tree_" + pid);
					var dataArray = objreturn.getElementsByTagName('treexml');
					var dataArrayLen = dataArray.length;
					changeExtImg(document.getElementById("treeExt_" + pid));
					changeFolderImg(document.getElementById("treeFolder_" + pid));
					for (i=0;i<dataArrayLen;i++){
						var thispid = dataArray[i].getAttribute("pid");
						var thismodelid=dataArray[i].getAttribute("modelid");
						var childcount = dataArray[i].getAttribute("childcount");
						var thisEnd = i==dataArrayLen-1;
						var layer = dataArray[i].getAttribute("layer");
							//显示树型线
							list = "";
							for (l=1;l<=layer;l++){
								if (AtEnd){
								list += "<nobr><img src = \"../../admin/images/tree/L5.gif\" align=\"absmiddle\" />";
							    }
							    else{
								    list += "<img src = \"../../admin/images/tree/L4.gif\" align=\"absmiddle\" />";
							    }
							}
							if (childcount>0){
								folder = "folder.gif";
								if (layer==0 && thisEnd){
										src = "p2.gif";
								}
								else{
									if (thisEnd && layer>0){
										src = "P2.gif";
									}
									else{
											src = "P1.gif";
									}
								}
							}
							else{
								folder = "file.gif";
								if (layer==0 && thisEnd){
										src = "m2.gif";
								}
								else{
									if (thisEnd){
										src = "L2.gif";
									}
									else{
											src = "L1.gif";
									}
								}
							}
	                       
						 list += "<img id='treeExt_" + thispid + "' src = '../../admin/images/tree/" + src + "' align='absmiddle' /><img id='treeFolder_" + thispid + "' src = '../../admin/images/tree/" + folder + "' align='absmiddle' /> <a href='javascript:void(0)'title='" + dataArray[i].getAttribute("name") + "' onclick='a_click(this);'>" + dataArray[i].getAttribute("name") + "</a></nobr>";
						 if (childcount==0){
						 list +="<input type='checkbox' onclick='set("+thispid+",\""+dataArray[i].getAttribute("name")+"\");' name='id'>";
						 }
						 
						var div_treetitle =  document.createElement("DIV");
							div_treetitle.id = "treetitle_" + thispid;
							div_treetitle.className = "tree_treetitle";
							if (childcount>0){
								div_treetitle.onclick = new Function("getsubtree(" + thispid + "," + thisEnd + ");");
							}
							div_treetitle.innerHTML = list;
							tree.appendChild(div_treetitle);
						var div_tree = document.createElement("DIV");
							div_tree.id = "tree_" + thispid;
							div_tree.className = "tree_tree";
							tree.appendChild(div_tree);
					}
					process.style.display="none";
				}
				function getsubtree(pid,AtEnd){
					if (!document.getElementById("tree_" + pid)){
						document.writeln("<div id='tree_" + pid + "'></div>");
					}
					if (!document.getElementById("process_" + pid)){
						var div = document.createElement("DIV");
						div.id = "process_" + pid;
						div.className = "tree_process";
						div.innerHTML = "<img src='../../admin/images/loading.gif' />载入中...";
						document.getElementById("tree_" + pid).appendChild(div);
						
						jQuery.ajax({url:"../../plus/ajaxs.ashx",dataType: "xml", cache:false,data:"a=specialclasstree&pid="+pid,success:function(obj){
						 writetree(obj, pid,AtEnd);
						}});
					}
					else{
						changeExtImg(document.getElementById("treeExt_" + pid));
						changeFolderImg(document.getElementById("treeFolder_" + pid));
						if (document.getElementById("tree_" + pid).style.display == "none"){
							document.getElementById("tree_" + pid).style.display = "block";
						}
						else{												
							document.getElementById("tree_" + pid).style.display = "none";
						}
					}
				}
		</script>
		
		
		
		<div class="framemenu">
			<strong>选择专题</strong>
				<script type="text/javascript">
					getsubtree(-1);
				</script>

               
		</div>
		<br/><br/><br/>
	</div>

	</div>

        <div style="width:100%;height:35px;line-height:35px;background:#fff;border-top:1px solid #ccc;bottom:0px;position:fixed;text-align:center;z-index:1">
             <input type="button" value="完成选择" onClick="ok()" class="button" />
              </div>
	</body>
	</html>