<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Upload.aspx.cs" Inherits="Kesion.NET.WebSite.Admin.Include.Upload1" %>
<%@ Import Namespace="System.Xml" %>
<%@ Import Namespace="Kesion.Cache" %>
<%@ Import Namespace="Kesion.Publics" %>
<%@ Import Namespace="Kesion.BLL" %>
<%@ Import Namespace="Kesion.Config" %>
<%@ Import Namespace="Kesion.Components" %>
<%@ Import Namespace="Kesion.XML" %>
<!DOCTYPE html>
<html>
<head runat="server">
    <title>上传</title>
     <link href="../../admin/images/style.css" rel="stylesheet" type="text/css" />
     <script src="../../KS_Inc/Jquery.js" type="text/javascript"></script>
     <script src="../../KS_Inc/Kesion.Common.js" type="text/javascript"></script>
     <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
     <meta http-equiv="pragma" content="no-cache" /> 
</head>
<body<%=!string.IsNullOrEmpty(KSCMS.S("bgcolor")) ? " style='background:#"+KSCMS.S("bgcolor")+"'" : string.Empty %>>
<script runat="server">
    int upBySwf = 1;  //启用swfupload上传 1 启用 0不启用
    ModelInfo __info = null;
    string fieldId = "-1";
    string UpType = KSCMS.S("UpType");
    string CurrPath = KSCMS.S("CurrPath");   //从selectfile.aspx 文件上传时用到
    int isPic = Utils.StrToInt(KSCMS.S("IsPic"),0); //自定义字段，是不是图片字段 1是 0不是
    int AddWaterMark = Utils.StrToInt(KSCMS.S("AddWaterMark"), 1);
    int CreateThumbs = Utils.StrToInt(KSCMS.S("CreateThumbs"), 1);
    int channelId = Utils.StrToInt(KSCMS.S("channelid"));
    string FieldXML = string.Empty;
    string module = string.Empty;
    XmlNode xn = null;
    string btnText = "选择文件并上传...";
    int btnWidth = 110;
    int btnHeight = 25;
    protected void Page_Load(object sender, EventArgs e)
    {

        if (Utils.StrToInt(KSCMS.S("bthwidth")) > 0)
        {
            btnWidth = Utils.StrToInt(KSCMS.S("bthwidth"));
        }
        if (Utils.StrToInt(KSCMS.S("btnheight")) > 0)
        {
            btnHeight = Utils.StrToInt(KSCMS.S("btnheight"));
        }
        if (!string.IsNullOrEmpty(KSCMS.S("text")))
        {
            btnText = KSCMS.S("text"); 
        }
        
        
      if (!string.IsNullOrEmpty(KSCMS.S("fieldid")))
      {
          fieldId = KSCMS.S("fieldid");
      }
      if (fieldId.ToLower() == "defaultpic") isPic = 1;
      if (channelId > 0)
      {
          __info = ModelManage.GetModelInfo(channelId);
          if (__info != null)
          {
              FieldXML = __info.FieldsXML;
          }
      }
      
       #region 读配置文件
          module = KSCMS.S("module");
          if (!string.IsNullOrEmpty(module))
          {
              XmlDocument doc = new XmlDocument();
              doc.Load(Server.MapPath("~/config/uploadsetting.config"));
              xn = doc.SelectSingleNode("//uploadsetting/item[@module='" + module + "']");
              if (xn == null)
              {
                  KSCMS.Die("error!");
              }
              if (xn.Attributes["btntext"] != null)
              {
                  btnText = xn.SelectSingleNode("@btntext").InnerText;
              }
              if (xn.Attributes["btnwidth"] != null)
              {
                  btnWidth = Utils.StrToInt(xn.SelectSingleNode("@btnwidth").InnerText);
              }
              if (xn.Attributes["btnheight"] != null)
              {
                  btnHeight = Utils.StrToInt(xn.SelectSingleNode("@btnheight").InnerText);
              }
              if (xn.Attributes["showthumb"]!= null)
              {
                  isPic = Utils.StrToInt(xn.SelectSingleNode("@showthumb").InnerText);
              }
              if (xn.Attributes["addwatermark"] != null)
              {
                  AddWaterMark = Utils.StrToInt(xn.SelectSingleNode("@addwatermark").InnerText);
              }
              if (xn.Attributes["createthumbs"] != null)
              {
                  CreateThumbs = Utils.StrToInt(xn.SelectSingleNode("@createthumbs").InnerText);
               }
              
              
          }
          
       #endregion
      


      #region 从selectfile.aspx文件来的上传，允许改变上传路径,所以要判断上传路径合法性
      if (!string.IsNullOrEmpty(CurrPath))
      {
          //正则表达式   
          string strExp = @"^" + string.Concat(KSCMS.GetInstallDir(), MyCache.GetCacheConfig(22), @"\/");
          //创建正则表达式对象   
          Regex myRegex = new Regex(strExp);
          if (!myRegex.IsMatch(CurrPath))
          {
              KSCMS.Die("非法上传目录!");
          }
      }
      #endregion
   }


</script>  
    
   
<%if (upBySwf == 1)  //用swfupload 
  { %>
      <script>
          <%
      if (!string.IsNullOrEmpty(module))  //XML配置上传
      {
        %>
          var limitSize=<%=xn.SelectSingleNode("@limitsize").InnerText%>; //限制大小 KB
          var fileExt="<%=Utils.getSwfUploadExt(xn.SelectSingleNode("@allowext").InnerText) %>"
          <%
      }else if (fieldId=="-1"){
              if (__info!=null){  //有指定模型%>
		 	    var limitSize=<%=__info.AllowUpFilesSize%>; //限制大小 KB
			    var fileExt="<%=Utils.getSwfUploadExt(string.Concat(__info.AllowUpFlashType, "|", __info.AllowUpMediaType, "|", __info.AllowUpOtherType, "|", __info.AllowUpPhotoType, "|", __info.AllowUpRealType)) %>" //限制扩展名
			     <%}else{    //未指定模型读取整站配置的%>
			     var limitSize=<%=MyCache.GetCacheConfig(51)%>; //限制大小 KB
			     var fileExt="<%=Utils.getSwfUploadExt(MyCache.GetCacheConfig(52)) %>"
              <%} %>
          <%}else if (fieldId.ToLower()=="doc"){
		 %>
          var limitSize=<%=__info.AllowUpFilesSize%>; //限制大小 KB
          var fileExt="*.doc;*.docx" //限制扩展名
          <%}else if (fieldId.ToLower()=="defaultpic"){
		 %>
		 	var limitSize=<%=__info.AllowUpFilesSize%>; //限制大小 KB
			var fileExt="<%=Utils.getSwfUploadExt(__info.AllowUpPhotoType) %>" //限制扩展名
		<%}else{ %>
		 	var limitSize=<%=Utils.StrToInt(XmlObject.GetStrXmlNode(FieldXML, string.Format(@"//Model/Field[@Name='{0}']/MaxFileSize", fieldId)), 0)%>; //限制大小 KB
			var fileExt="<%=Utils.getSwfUploadExt(XmlObject.GetStrXmlNode(FieldXML, string.Format(@"//Model/Field[@Name='{0}']/AllowFileExt", fieldId))) %>" //限制扩展名
		<%} %>
      </script>
  
     <%if (UpType == "UpByBar")  //上传（带进度条）
       { %>
       <script>
			var dir='../../';  //安装目录
			var uploadUrl="upload.ashx";  //上传处理文件地址
			var post_params={"AdminLoginCode":"<%=KSCMS.GetCookie("Admin","AdminLoginCode") %>", "adminuser":"<%=KSCMS.GetCookie("Admin","AdminUser") %>","adminpass":"<%=KSCMS.GetCookie("Admin","AdminPass") %>","PowerList":"<%=KSCMS.GetCookie("Admin","PowerList") %>","usertype":"<%=KSCMS.GetCookie("Admin","UserType") %>","upBySwf":1,ChannelID:<%=channelId%>,"UpType":"<%=UpType%>","FieldID":"<%=fieldId%>","CurrPath":"<%=CurrPath %>","AutoRename":4};
           var buttonstyle="color:#ffffff;";
			function uploadSuccess(file, serverData) {
				try {
					if (serverData.substring(0, 6) == "error:") {
						alert(unescape(serverData).replace("error:",""));
					 }else{
					     <%if (fieldId=="-1"){
					       if (KSCMS.S("from")=="selectfile"){
					       %>
					       jQuery("#FileUrl",parent.document).val(serverData);
					       parent.frames["FolderList"].location.href="FileList.aspx?ChannelID=<%=channelId %>&CurrPath=<%=CurrPath %>";
					       parent.frames["PreviewArea"].location.href="Preview.aspx?FilePath="+serverData;

					       <%}else{ %>
					        parent.SetDownUrlByUpLoad(serverData,file.size);  //下载的软件

					     <%}
					     }else{ %>
						  parent.document.getElementById('<%=fieldId%>').value=serverData;
						<%} %>
						
					}
				} catch (ex) {
					this.debug(ex);
				}
		}
		function SetAutoReName(obj){if (obj.checked){swfu.addPostParam("NoReName","0");}else{swfu.addPostParam("NoReName","1");}}
		function SetAddWaterFlag(obj) { if (obj.checked) { swfu.addPostParam("AddWaterMark", "1"); } else { swfu.addPostParam("AddWaterMark", "0"); } }
		</script>
		<script src="../../Plus/swfupload/swfupload/swfupload.js"></script>
		<script src="../../Plus/swfupload/swfupload/swfupload.queue.js"></script>
		<script src="../../Plus/swfupload/swfupload/swfupload.speed.js"></script>

		<table border='0' cellpadding="0" cellspacing="0">
		 <tr><td><div class="uptips" id="showspeed"><div class="button" id="shows"><span id="spanButtonPlaceholder"></span></div></div></td>
		 <td><label><input type="checkbox" onclick="SetAutoReName(this)" name="AutoReName" value="4" checked>自动更名</label>
		 <%if (ConfigManage.GetConfig().WaterMarkStatus!=0){ %>
		  <label><input name="AddWaterFlag" type="checkbox" id="Checkbox1" onclick="SetAddWaterFlag(this)" value="1">添加水印</label> 
             <%} %>
		 </td>
		 </tr>
		</table>
       
       <div id="tipss" style="display:none">
        <div id="UploadTips" style="padding:5px"><style>#UploadTips span{color:#ff6600;}</style><div style="display:none">Files Queued:<span id="tdFilesQueued"></span>Files Uploaded:	<span id="tdFilesUploaded"></span>Errors:	<span id="tdErrors"></span></div>当前速度:<span id="tdCurrentSpeed">0</span> 平均速度：<span  id="tdAverageSpeed">0</span><br/>已上传：<span id="tdPercentUploaded">0%</span> 大小：<span id="tdSizeUploaded">0</span>&nbsp;剩余时间：<span id="tdTimeRemaining">0</span> 已用时：<span id="tdTimeElapsed">0</span><br/><strong>正在上传中... 请耐心等待!!! 直到该提示框消失。</strong><span style="display:none">Moving Average Speed:<span id="tdMovingAverageSpeed"></span>Progress Event Count:<span id="tdProgressEventCount"></span></span></div></div>
       </div>
       
       
  
     <%}
       else
       { //上传（不带进度条）
      %>
  
  		<script src="../../plus/swfupload/swfupload/swfupload.js"></script>
		<script  src="../../plus/swfupload/js/handlers.js"></script>
		<script type="text/javascript">
		function uploadSuccess1(file, serverData) {
			try {
				if (serverData.substring(0, 6) == "error:") {
					KesionJS.AlertByTime('2',unescape(serverData).replace("error:",""),2);
				} else { 
				    <%
                   if (!string.IsNullOrEmpty(module))  //XML配置上传
                   {
                       string dofun = xn.InnerText;
                       dofun = Utils.ReplaceString(dofun, "{#return}", "serverData", true);
                       dofun = Utils.ReplaceString(dofun, "{#fieldid}",fieldId, true);
                       Response.Write(dofun);
                    
                  }else  if(fieldId.ToLower()=="doc"){%>
				    parent.document.getElementById('<%=fieldId%>').value=serverData;
				    parent.document.getElementById('<%=fieldId%>').focus();
				    //alert(serverData);
				    parent.document.getElementById('ipdoc').innerHTML = "<div style=\"border:solid 1px #FF0000\">使用动态创建的$(document).ready(function)方法</div>";
				  <%}else if (fieldId.ToLower()!="defaultpic"){ //自定义字段 %>
					 parent.document.getElementById('<%=fieldId%>').value=serverData;
					 KesionJS.AlertByTime('1','恭喜文件上传成功！',2);
				  <%}else{%>
				    
				     if (serverData.indexOf('@')==-1){
				       parent.document.getElementById('<%=fieldId%>').value=serverData;
				     }else{
				        var d=serverData.split('@');
				        parent.document.getElementById('DefaultPic').value=d[1];
				         try{
				             parent.document.getElementById('BigPhoto').value=d[0];
				             
                         }catch(e){
				         }
				         <%if (__info.BasicType==1){%>
				             parent.insertHTMLToEditor('<img src="'+d[0]+'" />');
				        <%}%>
				     }
				    $('#show<%=fieldId%>', parent.document).attr("src",d[1]);
				 <%} %>
				}
			} catch (ex) {
				this.debug(ex);
			}
		}
		function fileDialogComplete1(numFilesSelected, numFilesQueued){
		 if (numFilesQueued>1){
		   alert('只能选择一个文件!');
		 }else if(numFilesQueued==1){
		  this.startUpload(this.getFile(0).ID);
		 }
		}
		var swfu;
		window.onload = function () {
		
			swfu = new SWFUpload({
				// Backend Settings
				upload_url: "upload.ashx",
				post_params: { "AdminLoginCode":"<%=KSCMS.GetCookie("Admin","AdminLoginCode") %>","adminuser":"<%=KSCMS.GetCookie("Admin","AdminUser") %>","adminpass":"<%=KSCMS.GetCookie("Admin","AdminPass") %>","PowerList":"<%=KSCMS.GetCookie("Admin","PowerList") %>","usertype":"<%=KSCMS.GetCookie("Admin","UserType") %>","upBySwf":1,UpType:"<%=UpType%>",module:"<%=module%>",ChannelID:<%=channelId%>,"FieldID":"<%=fieldId%>","ispic":<%=isPic%>,"AutoRename":4,"AddWaterMark":<%=AddWaterMark%>,"CreateThumbs":<%=CreateThumbs%><%if (isPic==1){ %>,"ThumbsWidth":jQuery('#PicWidth').val(),"ThumbsHeight":jQuery('#PicHeight').val()  <%} %>},

				// File Upload Settings
				file_size_limit : limitSize,	// 限制大小
				file_types :fileExt,
				//file_types_description : "支持.JPG.gif.png格式的图片",
				file_upload_limit : 0,

				// Event Handler Settings - these functions as defined in Handlers.js
				//  The handlers are not part of SWFUpload but are part of my website and control how
				//  my website reacts to the SWFUpload events.
				swfupload_preload_handler : preLoad,
				swfupload_load_failed_handler : loadFailed,
				file_queue_error_handler : fileQueueError,
				file_dialog_complete_handler : fileDialogComplete1,
				upload_progress_handler : uploadProgress,
				upload_error_handler : uploadError,
				upload_success_handler : uploadSuccess1,
				upload_complete_handler : null,

				// Button Settings
				//button_image_url : "../plus/swfupload/images/SmallSpyGlassWithTransperancy_17x18d.png",
				button_placeholder_id : "spanButtonPlaceholder",
				
				button_width: <%=btnWidth%>,
			    button_height: <%=btnHeight%>,
				button_text : '<span class="button"><%=btnText%></span>',
			    button_text_style : '.button { width:<%=btnWidth%>px;line-height:<%=btnHeight%>px;font-family: Helvetica, Arial, sans-serif;color:#ffffff;} ',
				button_text_top_padding: 0,
				button_text_left_padding: 0,
				button_window_mode: SWFUpload.WINDOW_MODE.TRANSPARENT,
				button_cursor: SWFUpload.CURSOR.HAND,
				
				// Flash Settings
				flash_url : "../../plus/swfupload/swfupload/swfupload.swf",
				flash9_url : "../../plus/swfupload/swfupload/swfupload_FP9.swf",

				custom_settings : {
					upload_target : "divFileProgressContainer"
				},
				
				// Debug Settings
				debug: false
			});
		};
		</script>
		<table cellspacing="0" cellspadding="0" border="0">
		 <tr>
		  <td width="<%=btnWidth%>">
		  <div class="button" style="width:<%=btnWidth%>px;height:<%=btnHeight%>px;line-height:<%=btnHeight%>px;margin-top:2px;"><span id="spanButtonPlaceholder">选择文件</span></div>
		 </td>
	<%
           if (!string.IsNullOrEmpty(module))
           {

               if (xn.Attributes["tips"] != null )
               {
                       string tips = xn.SelectSingleNode("@tips").InnerText;
                       if (!string.IsNullOrEmpty(tips))
                       {
                           string sizeStr = string.Empty;
                           float size = Utils.StrToFloat(xn.SelectSingleNode("@limitsize").InnerText);
                           if (size > 1024)
                           {
                               sizeStr = (size / 1024).ToString("F0") + "MB";
                           }
                           else
                           {
                               sizeStr = xn.SelectSingleNode("@limitsize").InnerText + "KB";
                           }
                           tips = Utils.ReplaceString(tips, "{#size}", sizeStr, true);
                           tips = Utils.ReplaceString(tips, "{#ext}", xn.SelectSingleNode("@allowext").InnerText, true);
                           Response.Write(string.Format(@"<td style='color:#999;padding-left:5px;'>{0}</td>", tips));
                       }
                  
               }
           }
     if (isPic==1)
      {%>
		  <td>&nbsp;<label><input type="checkbox" name="DefaultUrl" id="DefaultUrl" onclick="SetDefaultUrl(this)" value="1" checked>缩略图</label> 
            <%if (ConfigManage.GetConfig().WaterMarkStatus!=0){ %>     
          <label><input name="AddWaterFlag" type="checkbox" id="AddWaterFlag" onclick="SetAddWaterFlag(this)" value="1" checked>水印</label> 
              <%} %>

		  <strong>缩略图大小：</strong>宽<input name="PicWidth" onkeyup="SetThumbWidth()" id="PicWidth" class="textbox" style="width:40px;text-align:center" value="<%=!string.IsNullOrEmpty(KSCMS.S("Width"))?KSCMS.S("width"):ConfigManage.GetConfig().ThumbsWidth.ToString() %>">PX 高<input name="PicHeight" id="PicHeight" class="textbox" onkeyup="SetThumbHeight()" style="width:40px;text-align:center" value="<%=!string.IsNullOrEmpty(KSCMS.S("height"))?KSCMS.S("height"):ConfigManage.GetConfig().ThumbsHeight.ToString() %>">PX
          <!--<span style="color:red">如果选择自动生成缩略图,则不开启图片裁剪窗口</span>-->
		  <script type="text/javascript">
		      function SetThumbWidth() { swfu.addPostParam("ThumbsWidth", jQuery('#PicWidth').val()); }
		      function SetThumbHeight() { swfu.addPostParam("ThumbsHeight", jQuery('#PicHeight').val()); }
		      function SetDefaultUrl(obj) { if (obj.checked) { swfu.addPostParam("CreateThumbs", "1"); } else { swfu.addPostParam("CreateThumbs", "0"); } }
		      function SetAddWaterFlag(obj) { if (obj.checked) { swfu.addPostParam("AddWaterMark", "1"); } else { swfu.addPostParam("AddWaterMark", "0"); } }
		     
		  </script>
		  </td>
		  <%}%>
		 </tr>
		</table>
  
  
  
  <%} %>
  
  
  
<%}
  else   //普通方式上传
  { %>
    <form name="upform" ID="upform" action="upload.ashx" method="post" enctype="multipart/form-data">
          <input type="file" name="file1" class="textbox">
          <input type="hidden" name="channelid" value="<%=channelId %>" />
          <input type="hidden" name="upBySwf" value="0" />
          <input type="hidden" name="fieldid" value="<%=fieldId %>"/>
          <input type="submit" value="确定上传" class="button"/>

         <%if (fieldId.ToLower().Equals("defaultpic"))
           {%>
          <label> <input type="checkbox" name="CreateThumbs" value="1" checked />缩略图</label>
          <label> <input type="checkbox" name="AddWaterMark" value="1" checked />水印</label>
          <%
    } %>

         </form>

<%} %>
</body>
</html>
