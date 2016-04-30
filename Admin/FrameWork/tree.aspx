<%@ Page Language="C#" AutoEventWireup="false"  EnableViewState="false" Inherits="tree" Codebehind="tree.aspx.cs" %>
<%@ Import Namespace="Kesion.Publics" %>
<%@ Import Namespace="Kesion.BLL" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="../../admin/style/Admin_Style.CSS" rel="stylesheet" type="text/css" />
<title>菜单</title>
<script src="../../ks_inc/jQuery.js"></script>
<script src="../../ks_inc/ContextMenu.js"></script>
<script src="../../ks_inc/SelectElement.js"></script>
<script>
 /*
 作用:如果按下ctrl或是alt或是shit键,使MainFrame始终获得焦点
 */
 document.onkeydown=keyDown;
 function keyDown()
 { 
  if ((event.ctrlKey)||(event.altKey)||(event.keyCode==46))   
   {
     if (typeof(parent.frames['main'])=='object')
     { 
      parent.frames['main'].focus();
	  }
    else
     top.frames['main'].focus();	
  }
 }

		var DocElementArrInitialFlag=false;
		var DocElementArr = new Array();
		var DocMenuArr=new Array();
		var SelectedFile='',SelectedFolder='';
		var currmodelid='';currclassid='';
		jQuery(document).ready(function(){
			if (DocElementArrInitialFlag) return;
			InitialDocElementArr('FolderID','SingleID');
			InitialDocMenuArr();
			DocElementArrInitialFlag=true;
		});
		function InitialDocMenuArr()
		{  
		  
		    DocMenuArr[DocMenuArr.length]=new ContextMenuItem("parent.AddInfo();",'添加信息(N)','disabled');
		    <%if (KSSecurity.CheckPower("content","c001")){ %>	  
		    DocMenuArr[DocMenuArr.length]=new ContextMenuItem("parent.AddSubClass();",'添加子栏目(M)','disabled');
		    DocMenuArr[DocMenuArr.length]=new ContextMenuItem('seperator','','');
			DocMenuArr[DocMenuArr.length]=new ContextMenuItem("parent.AddClass();",'添加栏目(A)','disabled');
			DocMenuArr[DocMenuArr.length]=new ContextMenuItem("parent.ModifyClass('');",'编辑栏目(E)','disabled');
			DocMenuArr[DocMenuArr.length]=new ContextMenuItem("parent.DelClass();",'删除栏目(D)','disabled');
		   <%} %>
			DocMenuArr[DocMenuArr.length]=new ContextMenuItem('seperator','','');
			DocMenuArr[DocMenuArr.length]=new ContextMenuItem("parent.Reload('');",'刷 新(Z) ','');
		}
		
		//初始化不可用菜单项
		DocDisabledContextMenu=function()
		{ 
			DisabledContextMenu('FolderID','SingleID','编辑栏目(E),删除栏目(D),添加子栏目(M),添加信息(N)','克 隆(V)','添加子栏目(M)','克 隆(V)','克 隆(V)','克 隆(V)')

		}
		
		//当点击栏目时
		a_click=function(objA,modelID,ClassID,ClassType){
		           	DocElementArr.length=0;
					if (lastA){
						lastA.className=''; 
					}
					//objA.className='TreeSelected'; 
					currclassid=ClassID;
					currmodelid=modelID
					lastA = objA; 
					if (ClassType==1)
					{
					<%if (Utils.RemoveXss(KSCMS.S("Action"))=="shop"){ %>
					parent.frames['main'].location.href="../Shop/KS.ShopManage.aspx?classid=" + ClassID;
					<%}else{ %>
					parent.frames['main'].location.href="../Content/KS.ContentManage.aspx?classid=" + ClassID;
					<%} %>
					}
					else if(ClassType==3){
					parent.frames['main'].location.href="../Content/KS.SinglePage.aspx?channelid="+modelID+"&classid=" + ClassID;
					}
					InitialDocElementArr('FolderID','SingleID');

		}
		o_Click=function(objA){
			if (lastA){
			lastA.className=''; 
			}
		    objA.className='TreeSelected'; 
			lastA = objA; 
		}
		//添加信息
		AddInfo=function(){
		<%if (Utils.RemoveXss(KSCMS.S("Action"))=="shop"){ %>
		  parent.frames['main'].location.href="../Shop/KS.Shop.aspx?action=Add&ChannelID="+currmodelid+"&classid="+currclassid;
        <%}else{ %>
		  parent.frames['main'].location.href="../Content/KS.Content.aspx?action=Add&ChannelID="+currmodelid+"&classid="+currclassid;
        <%} %>
		}
		//添加子栏目
		AddSubClass=function(){
		 parent.frames['main'].location.href="../Content/KS.Class.aspx?from=<%=Utils.RemoveXss(KSCMS.S("Action")) %>&action=add&modelid="+currmodelid+"&parentid="+currclassid;
		}
		AddClass=function(){
		 parent.frames['main'].location.href="../Content/KS.Class.aspx?from=<%=Utils.RemoveXss(KSCMS.S("Action")) %>&action=add";
		}
		//编辑栏目
		ModifyClass=function(){
		 parent.frames['main'].location.href="../Content/KS.Class.aspx?from=<%=Utils.RemoveXss(KSCMS.S("Action")) %>&action=edit&classid="+currclassid;
		}
		//删除栏目
		DelClass=function(){
		 if (confirm('删除栏目将同时删除隶属于该栏目下的所有信息，确定删除该栏目吗？')){
		parent.frames['main'].location.href="../Content/KS.Class.aspx?from=<%=Utils.RemoveXss(KSCMS.S("Action")) %>&Action=del&ClassID="+currclassid;
		}
		}
		//刷新 
		Reload=function(){
		 location.reload();
		}
		
		
</script>
<style type="text/css">
	body{margin:0px;padding:0px;padding-top:10px;text-align:left;font-size:12px;}
	A {COLOR: #036; TEXT-DECORATION: none;blr:expression(this.onFocus=this.blur())}
    A:hover {COLOR: #258dc9; TEXT-DECORATION: underline}
</style>
</head>
<body onclick="SelectElement();" onselectstart="return false;" style="background-color:transparent">
<script>
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
						var classtype=dataArray[i].getAttribute("classtype");
						var classename=jQuery(dataArray[i]).find("classename").text();
						var name=jQuery(dataArray[i]).find("name").text();
						var childcount = dataArray[i].getAttribute("childcount");
						var pubflag=dataArray[i].getAttribute("pubflag");
						var thisEnd = i==dataArrayLen-1;
						var layer = dataArray[i].getAttribute("layer");
                        
							//显示树型线
							list = "";
							for (l=1;l<=layer;l++){
							  list += "<img src = \"../../admin/images/tree/L4.gif\" align=\"absmiddle\" />";
							}
							if (childcount>0){
								folder = "folder.gif";
								if (layer==0 && thisEnd){
										src = "p1.gif";
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
										src = "m1.gif";
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
							
						var disabled="";
						if (dataArray[i].getAttribute("disabled")=='false') disabled="disabled";
	
							
	                    if(classtype==3){
	                     if (disabled=="") disabled="SingleID='"+thispid+"'";
						 list += "<img id='treeExt_" + thispid + "' src = '../../admin/images/tree/" + src + "' align='absmiddle' /><span "+disabled+" onmousedown='mousedown(this);'><img id='treeFolder_" + thispid + "' src = '../../admin/images/doc.gif' align='absmiddle' /><span style='cursor:hand;' title='" + name + "' onmousedown='a_click(this,"+thismodelid+","+thispid+","+classtype+");'>" + name + "<font color=blue>(单)</font></span></span>";
						}
						else if(classtype==2){
						 if (disabled=="") disabled="SingleID='"+thispid+"'";
						 list += "<img id='treeExt_" + thispid + "' src = '../../admin/images/tree/" + src + "' align='absmiddle' /><span "+disabled+" onmousedown='mousedown(this);'><img id='treeFolder_" + thispid + "' src = '../../admin/images/doc.gif' align='absmiddle' /><span style='cursor:hand;' title='" + name + "' onmousedown='a_click(this,"+thismodelid+","+thispid+","+classtype+");'>" + name + "<a href='"+classename+"' target='_blank'><font color=green>(外)</font></a></span></span>";
						}
						else
						{
						 if (disabled=="") disabled="FolderID='"+thispid+"'";
						 list += "<img id='treeExt_" + thispid + "' src = '../../admin/images/tree/" + src + "' align='absmiddle' /><span "+disabled+" onmousedown='mousedown(this);' onmouseout=jQuery('#a"+thispid+"').hide(); onmouseover=jQuery('#a"+thispid+"').show()><img id='treeFolder_" + thispid + "' src = '../../admin/images/tree/" + folder + "' align='absmiddle' /><span style='cursor:pointer;' title='" + name + "' onmousedown='a_click(this,"+thismodelid+","+thispid+","+classtype+");'>" + name;
						 if (pubflag==1) list += " <a id='a"+thispid+"' href='<%=Utils.RemoveXss(KSCMS.S("Action"))=="shop"?"../Shop/KS.Shop.aspx":"../content/KS.Content.aspx" %>?action=Add&classid="+thispid+"&channelid="+thismodelid+"' target='main' style='text-decoration:none;display:none;color:#ff6600'>+</a>";
						 list +="</span></span>";
						}
						var div_treetitle =  document.createElement("DIV");
							div_treetitle.id = "treetitle_" + thispid;
							div_treetitle.className = "tree_treetitle";
							if (childcount>0){
								div_treetitle.onclick = new Function("getsubtree(" + thispid + "," + thisEnd + ");");
							}
							list="<div style='white-space:nowrap;'>"+list+"</div>";
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
				    jQuery('#ajaxmsg',window.parent.document).toggle();
					if (!document.getElementById("tree_" + pid)){
						document.writeln("<div id='tree_" + pid + "'></div>");
					}
					if (!document.getElementById("process_" + pid)){
						var div = document.createElement("DIV");
						div.id = "process_" + pid;
						div.className = "tree_process";
						div.innerHTML = "<img src='../../admin/images/loading.gif' />载入中...";
						document.getElementById("tree_" + pid).appendChild(div);
						<%if (Utils.RemoveXss(KSCMS.S("Action")) == "shop"){
						 if (KSSecurity.CheckPower("mall", "mall100")){%>
						jQuery.ajax({url:"../../plus/ajaxs.ashx",dataType: "xml", cache:false,data:"from=shop&a=classtree&pid="+pid,success:function(obj){
						 writetree(obj, pid,AtEnd);
						}});
						<%}else{ %>
						document.getElementById("tree_" + pid).innerHTML='';
						<%}
						}else{ 
						if (KSSecurity.CheckPower("content", "c100")){%>
						jQuery.ajax({url:"../../plus/ajaxs.ashx",dataType: "xml", cache:false,data:"a=classtree&pid="+pid,success:function(obj){
						 writetree(obj, pid,AtEnd);
						}});
						<%}else{%>
						document.getElementById("tree_" + pid).innerHTML='';
						<% }}%>
					} 
					else{
						changeExtImg(document.getElementById("treeExt_" + pid));
						changeFolderImg(document.getElementById("treeFolder_" + pid));
						jQuery("#tree_"+pid).toggle();

					}
					jQuery('#ajaxmsg',window.parent.document).toggle();
				}
		</script>
		
		
		
		<div class="framemenu">
		  
		<%if (Utils.RemoveXss(KSCMS.S("Action")) == "shop")
    { %>
			<img src="../../admin/images/home.gif" align="absmiddle" />商品管理
		<%}
    else
    { %>
			<img src="../../admin/images/home.gif" align="absmiddle" />文档管理 <a href="../Content/KS.ContentManage.aspx?from=<%=Utils.RemoveXss(KSCMS.S("Action"))%>&showType=1" target="main" style="color:blue">稿件审核</a>
		<%} %>
				<script>
					getsubtree(0);
				</script>
        <div onClick="getsubtree(-1,true);">
			<img id="treeExt_-1" src="../../admin/images/tree/M2.gif" width="20" height="20" align="absmiddle" /><img id="treeFolder_-1" src="../../admin/images/ico/gn.png" align="absmiddle" /><span style="font-weight:bold;cursor:hand">功能选项</span>
		</div>
		<div id="process_-1"></div>
		<div id="tree_-1" style="DISPLAY:block;margin-left:-20px">
		<%if (Utils.RemoveXss(KSCMS.S("Action")) == "shop")
    { %>
          <%if (KSSecurity.CheckPower("mall", "mall001"))
           {%>
			<div><img src="../../admin/images/tree/L1.gif" width="20" height="20" border="0"><img src="../../admin/images/ico/pz.png" width="16" height="16" align="absmiddle" /> <a onClick="o_Click(this)" href="../Shop/KS.ShopConfig.Aspx" target="main">商城系统配置</a></div>	
			<%} %>
			<%if (KSSecurity.CheckPower("mall", "mall002"))
           {%>
			<div><img src="../../admin/images/tree/L1.gif" width="20" height="20" border="0"><img src="../../admin/images/ico/dd.png" align="absmiddle" width="16" height="16"> <a onClick="o_Click(this)" href="../Shop/KS.ShopOrder.aspx" target="main">订单管理</a></div>
			<%} %>
			<%if (KSSecurity.CheckPower("mall", "mall003"))
     {%>
			<div><img src="../../admin/images/tree/L1.gif" width="20" height="20" border="0"><img src="../../admin/images/ico/fth.png" align="absmiddle" width="16" height="16"> <a onClick="o_Click(this)" href="../Shop/KS.ShopLogDelivery.aspx" target="main">发退货查询处理</a></div>
			<%} %>
			<%if (KSSecurity.CheckPower("mall", "mall004"))
     {%>
			<div><img src="../../admin/images/tree/L1.gif" width="20" height="20" border="0"><img src="../../admin/images/ico/fp.png" align="absmiddle" width="16" height="16"> <a onClick="o_Click(this)" href="../Shop/KS.ShopLogInvoice.aspx" target="main">已开发票查询</a></div>
			<%} %>
			<%if (KSSecurity.CheckPower("mall", "mall005"))
     {%>
			<div><img src="../../admin/images/tree/L1.gif" width="20" height="20" border="0"><img src="../../admin/images/ico/lm.png" align="absmiddle" width="16" height="16"> <a onClick="o_Click(this)" href="../Content/KS.Class.aspx?from=shop" target="main">商品栏目管理</a></div>
			<%} %>
            <%if (KSSecurity.CheckPower("mall", "mall019"))
     { %>
			<div><img src="../../admin/images/tree/L1.gif" width="20" height="20" border="0"><img src="../../admin/images/ico/comment.png" align="absmiddle"> <a onClick="o_Click(this)" href="../Shop/KS.ShopComment.aspx" target="main">商品评价管理</a></div>
			<%} %>
            <%if (KSSecurity.CheckPower("mall", "mall020"))
     { %>
			<div><img src="../../admin/images/tree/L1.gif" width="20" height="20" border="0"><img src="../../admin/images/ico/ico6.png" align="absmiddle"> <a onClick="o_Click(this)" href="../Shop/KS.ShopAsk.aspx" target="main">商品咨询管理</a></div>
			<%} %>

            <%if (KSSecurity.CheckPower("mall", "mall018"))
     { %>
			<div><img src="../../admin/images/tree/L1.gif" width="20" height="20" border="0"><img src="../../admin/images/ico/recyclebin.gif" align="absmiddle"> <a onClick="o_Click(this)" href="../Shop/KS.ShopRecycleBin.aspx" target="main">回收站管理</a></div>
			<%} %>

			<%if (KSSecurity.CheckPower("mall", "mall006"))
     {%>
			<div><img src="../../admin/images/tree/L1.gif" width="20" height="20" border="0"><img src="../../admin/images/ico/qg.png" align="absmiddle" width="16" height="16"> <a onClick="o_Click(this)" href="../Shop/KS.ShopLimitBuy.aspx" target="main">限时/限量抢购管理</a></div>
			<%} %>
            
			<%if (KSSecurity.CheckPower("mall", "mall017"))
     {%>
			<div><img src="../../admin/images/tree/L1.gif" width="20" height="20" border="0"><img src="../../admin/images/ico/gwc.png" align="absmiddle" width="16" height="16"> <a onClick="o_Click(this)" href="../Shop/KS.ShopGroupBuy.aspx" target="main">团购管理</a></div>
			<%}
               %>
			<%if (KSSecurity.CheckPower("mall", "mall007"))
     {%>
			<div><img src="../../admin/images/tree/L1.gif" width="20" height="20" border="0"><img src="../../admin/images/ico/sx.png" width="16" height="16"> <a onClick="o_Click(this)" href="../Shop/KS.ShopBatch.Aspx" target="main">商品属性批量设置</a></div>	
			<%} %>
			<%if (KSSecurity.CheckPower("mall", "mall008"))
     {%>
			<div><img src="../../admin/images/tree/L1.gif" width="20" height="20" border="0"><img src="../../admin/images/ico/yhj.png" align="absmiddle" width="16" height="16"> <a onClick="o_Click(this)" href="../Shop/KS.ShopCoupon.aspx" target="main">优惠券管理</a></div>
			<%} %>
			<%if (KSSecurity.CheckPower("mall", "mall021"))
     {%>
			<div><img src="../../admin/images/tree/L1.gif" width="20" height="20" border="0"><img src="../../admin/images/ico/yhj.png" align="absmiddle" width="16" height="16"> <a onClick="o_Click(this)" href="../Shop/KS.ShopBookCode.aspx" target="main">预约码管理</a></div>
			<%} %>

			<%if (KSSecurity.CheckPower("mall", "mall009"))
     {%>
			<div><img src="../../admin/images/tree/L1.gif" width="20" height="20" border="0"><img src="../../admin/images/ico/gg.png" align="absmiddle" width="16" height="16"> <a onClick="o_Click(this)" href="../Shop/KS.ShopSpecification.aspx" target="main">商品规格管理</a></div>
			<%} %>
			<%if (KSSecurity.CheckPower("mall", "mall010"))
     {%>
			<div><img src="../../admin/images/tree/L1.gif" width="20" height="20" border="0"><img src="../../admin/images/ico/pp.png" align="absmiddle" width="16" height="16"> <a onClick="o_Click(this)" href="../Shop/KS.ShopBrand.aspx" target="main">商品品牌管理</a></div>
			<%} %>
	<%if (KSSecurity.CheckPower("mall", "mall011"))
   {%>
			<div><img src="../../admin/images/tree/L1.gif" width="20" height="20" border="0"><img src="../../admin/images/ico/ps.png" align="absmiddle" width="16" height="16"> <a onClick="o_Click(this)" href="../Shop/KS.ShopDelivery.aspx" target="main">配送方式管理</a></div>
			<%} %>
		<%if (KSSecurity.CheckPower("mall", "mall012"))
    {%>
			<div><img src="../../admin/images/tree/L1.gif" width="20" height="20" border="0"><img src="../../admin/images/ico/pay.png" align="absmiddle" width="16" height="16"> <a onClick="o_Click(this)" href="../Shop/KS.ShopPaymentType.aspx" target="main">支付方式管理</a></div>
			<%} %>
			<%if (KSSecurity.CheckPower("mall", "mall013"))
    {%>
			<div><img src="../../admin/images/tree/L1.gif" width="20" height="20" border="0"><img src="../../admin/images/ico/gwc.png" align="absmiddle" width="16" height="16"> <a onClick="o_Click(this)" href="../Shop/KS.ShopCartGoods.aspx" target="main">购物车内商品管理</a></div>
			<%} %>
			<%if (KSSecurity.CheckPower("mall", "mall014"))
     {%>
			<div><img src="../../admin/images/tree/L1.gif" width="20" height="20" border="0"><img src="../../admin/images/ico/sh.png" align="absmiddle" width="16" height="16"> <a onClick="o_Click(this)" href="../Shop/KS.ShopDeliveryAddress.aspx" target="main">收货地址管理</a></div>
			<%} %>
			<%if (KSSecurity.CheckPower("mall", "mall015"))
     { %>
			<div><img src="../../admin/images/tree/L1.gif" width="20" height="20" border="0"><img src="../../admin/images/ico/wl.png" align="absmiddle" width="16" height="16"> <a onClick="o_Click(this)" href="../Shop/KS.ShopDeliveryCorp.aspx" target="main">物流公司管理</a></div>
			<%} %>
			<%if (KSSecurity.CheckPower("mall", "mall016"))
     { %>
			<div><img src="../../admin/images/tree/L1.gif" width="20" height="20" border="0"><img src="../../admin/images/ico/sjtj.png" align="absmiddle" width="16" height="16"> <a onClick="o_Click(this)" href="../Shop/KS.ShopStats.aspx" target="main">销售数据统计</a></div>
			<%} %>
		<%}
    else
    { %>
		    <%if (KSSecurity.CheckPower("content", "c001"))
        { %>
			<div><img src="../../admin/images/tree/L5.gif" width="20" height="20" border="0" align="absmiddle" ><img src="../../admin/images/tree/L1.gif" width="20" height="20" border="0" align="absmiddle" ><img src="../../admin/images/ico/ico2.png" align="absmiddle" width="16" height="16"> <a onClick="o_Click(this)" href="../Content/KS.Class.aspx" target="main">栏目管理</a></div>
			<%} %>
			<%if (KSSecurity.CheckPower("content", "c002"))
     { %>
			<div><img src="../../admin/images/tree/L5.gif" width="20" height="20" border="0" align="absmiddle" ><img src="../../admin/images/tree/L1.gif" width="20" height="20" border="0" align="absmiddle" ><img src="../../admin/images/ico/zt.png" align="absmiddle"> <a onClick="o_Click(this)" href="../Content/KS.Special.aspx" target="main">专题管理</a></div>
			<%} %>

            <%if (KSSecurity.CheckPower("content", "c012"))
     { %>
			<div><img src="../../admin/images/tree/L5.gif" width="20" height="20" border="0" align="absmiddle" ><img src="../../admin/images/tree/L1.gif" width="20" height="20" border="0" align="absmiddle" ><img src="../../admin/images/ico/recyclebin.gif" align="absmiddle"> <a onClick="o_Click(this)" href="../Content/KS.RecycleBin.aspx" target="main">回收站管理</a></div>
			<%} %>

			<%if (KSSecurity.CheckPower("content", "c003"))
     { %>
			<div><img src="../../admin/images/tree/L5.gif" width="20" height="20" border="0" align="absmiddle" ><img src="../../admin/images/tree/L1.gif" width="20" height="20" border="0" align="absmiddle" ><img src="../../admin/images/ico/comment.png" align="absmiddle"> <a onClick="o_Click(this)" href="../Content/KS.Comment.aspx" target="main">评论管理</a></div>
			<%} %>
			<%if (KSSecurity.CheckPower("content", "c004"))
     { %>
			<div><img src="../../admin/images/tree/L5.gif" width="20" height="20" border="0" align="absmiddle" ><img src="../../admin/images/tree/L1.gif" width="20" height="20" border="0" align="absmiddle" ><img src="../../admin/images/ico/ico1.png" align="absmiddle"> <a onClick="o_Click(this)" href="../Content/KS.DiggList.aspx" target="main">DIGG管理</a></div>
			<%} %>
			<%if (KSSecurity.CheckPower("content", "c005"))
     { %>
			<div><img src="../../admin/images/tree/L5.gif" width="20" height="20" border="0" align="absmiddle" ><img src="../../admin/images/tree/L1.gif" width="20" height="20" border="0" align="absmiddle" ><img src="../../admin/images/ico/pq.png" align="absmiddle"> <a onClick="o_Click(this)" href="../Content/KS.Mood.aspx" target="main">表情管理</a></div>
			<%} %>
			<%if (KSSecurity.CheckPower("content", "c006"))
     { %>
			<div><img src="../../admin/images/tree/L5.gif" width="20" height="20" border="0" align="absmiddle" ><img src="../../admin/images/tree/L1.gif" width="20" height="20" border="0" align="absmiddle" ><img src="../../admin/images/ico/ico5.png" width="16" height="16" align="absmiddle" > <a onClick="o_Click(this)" href="../Content/KS.Author.aspx" target="main">作者管理</a></div>
			<%} %>
			<%if (KSSecurity.CheckPower("content", "c007"))
     { %>
			<div><img src="../../admin/images/tree/L5.gif" width="20" height="20" border="0" align="absmiddle" ><img src="../../admin/images/tree/L1.gif" width="20" height="20" border="0" align="absmiddle" ><img src="../../admin/images/ico/ico6.png" width="16" height="16" align="absmiddle" > <a onClick="o_Click(this)" href="../Content/KS.CopyFrom.aspx" target="main">来源管理</a></div>	
			<%} %>
			<%if (KSSecurity.CheckPower("content", "c008"))
     { %>
			<div><img src="../../admin/images/tree/L5.gif" width="20" height="20" border="0" align="absmiddle" ><img src="../../admin/images/tree/L1.gif" width="20" height="20" border="0" align="absmiddle" ><img src="../../admin/images/ico/ico7.png" width="16" height="16" align="absmiddle" > <a onClick="o_Click(this)" href="../Content/KS.ContentBatch.Aspx" target="main">批量设置</a></div>	
			<%} %>
			<%if (KSSecurity.CheckPower("content", "c009"))
     { %>
			<div><img src="../../admin/images/tree/L5.gif" width="20" height="20" border="0" align="absmiddle" ><img src="../../admin/images/tree/L1.gif" width="20" height="20" border="0" align="absmiddle" ><img src="../../admin/images/ico/ico8.png" align="absmiddle" width="16" height="16" align="absmiddle"  > <a onClick="o_Click(this)" href="../Content/KS.KeyTags.aspx" target="main">关键字Tags</a></div>
			<%} %>
			<%if (KSSecurity.CheckPower("content", "c010"))
     { %>
			<div><img src="../../admin/images/tree/L5.gif" width="20" height="20" border="0" align="absmiddle" ><img src="../../admin/images/tree/L2.gif" width="20" height="20" border="0" align="absmiddle" ><img src="../../admin/images/ico/ico9.png" width="16" height="16" align="absmiddle" > <a onClick="o_Click(this)" href="../Content/KS.DownServer.aspx" target="main">下载服务器</a></div>
			<%} %>
	 <%} %>
		</div>
	

		</div>
		
	</div>

	</div>
	<br />
	</body>
	</html>