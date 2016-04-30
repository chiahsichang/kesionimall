<%@ Page Language="C#" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.User.Include.UploadAttachment" Codebehind="UploadAttachment.aspx.cs" %>
<%@ Import Namespace="Kesion.Publics" %>
<%@ Import Namespace="Kesion.Cache" %>
<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
    <link href="/admin/style/Admin_Style.CSS" rel="stylesheet" type="text/css" />

    <style> 
body{margin:0px;padding:0px}
.uploadbutton{background:url(../../sysimg/default/picBnt.png) no-repeat;width:75px; margin-right:10px;width:75px; height:28px; line-height:28px;font-weight:700; color:#ffffff;background-position: left bottom;}
.uploadbutton1{background:url(../../sysimg/default/picBnt.png) no-repeat;width:75px; margin-right:10px;width:75px; height:28px; line-height:28px;font-weight:700; color:#ffffff;border:0px;margin-left:5px;}
 
/* -- Form Styles ------------------------------- */
form {	
	margin: 0;
	padding: 0;
}
 
div.fieldset {
	border:  1px solid #afe14c;
	margin: 5px 0;
	padding: 20px 10px;
}
div.fieldset span.legend {
	position: relative;
	background-color: #FFF;
	padding: 3px;
	top: -6px;
	font: 700 14px Arial, Helvetica, sans-serif;
	color: #73b304;
}
div.flash {
	margin: 5px 5px;
	border-color: #D9E4FF;
 
	-moz-border-radius-topleft : 5px;
	-webkit-border-top-left-radius : 5px;
    -moz-border-radius-topright : 5px;
    -webkit-border-top-right-radius : 5px;
    -moz-border-radius-bottomleft : 5px;
    -webkit-border-bottom-left-radius : 5px;
    -moz-border-radius-bottomright : 5px;
    -webkit-border-bottom-right-radius : 5px;
 
}
 
button,
input,
select,
textarea { 
	border-width: 1px; 
	margin-bottom: 10px;
	padding: 2px 3px;
}
 
 
input[disabled]{ border: 1px solid #ccc } /* FF 2 Fix */
 
label { 
	width: 150px; 
	text-align: right; 
	display:block;
	margin-right: 5px;
}
 
#btnSubmit { margin: 0 0 0 155px ; }
 
/* -- Table Styles ------------------------------- */
td {
	font: 10pt Helvetica, Arial, sans-serif;
	vertical-align: top;
}
 
.progressWrapper {
	width: 357px;
	overflow: hidden;
}
 
.progressContainer {
	margin: 5px;
	padding: 4px;
	border: solid 1px #E8E8E8;
	background-color: #F7F7F7;
	overflow: hidden;
}
/* Message */
.message {
	margin: 1em 0;
	padding: 10px 20px;
	border: solid 1px #FFDD99;
	background-color: #FFFFCC;
	overflow: hidden;
}
/* Error */
.red {
	border: solid 1px #B50000;
	background-color: #FFEBEB;
}
 
/* Current */
.green {
	border: solid 1px #DDF0DD;
	background-color: #EBFFEB;
}
 
/* Complete */
.blue {
	border: solid 1px #CEE2F2;
	background-color: #F0F5FF;
}
 
.progressName {
	font-size: 8pt;
	font-weight: 700;
	color: #555;
	width: 323px;
	height: 14px;
	text-align: left;
	white-space: nowrap;
	overflow: hidden;
}
 
.progressBarInProgress,
.progressBarComplete,
.progressBarError {
	font-size: 0;
	width: 0%;
	height: 2px;
	background-color: blue;
	margin-top: 2px;
}
 
.progressBarComplete {
	width: 100%;
	background-color: green;
	visibility: hidden;
}
 
.progressBarError {
	width: 100%;
	background-color: red;
	visibility: hidden;
}
 
.progressBarStatus {
	margin-top: 2px;
	width: 337px;
	font-size: 7pt;
	font-family: Arial;
	text-align: left;
	white-space: nowrap;
}
 
a.progressCancel {
	font-size: 0;
	display: block;
	height: 14px;
	width: 14px;
	background-image: url(../../plus/swfupload/images/cancelbutton.gif);
	background-repeat: no-repeat;
	background-position: -14px 0px;
	float: right;
}
 
a.progressCancel:hover {
	background-position: 0px 0px;
}
 
 
/* -- SWFUpload Object Styles ------------------------------- */
</style>
<script type="text/javascript" src="../../ks_inc/jquery.js"></script>
<script type="text/javascript" src="../../plus/swfupload/swfupload/swfupload.js"></script>
<script type="text/javascript" src="../../plus/swfupload/js/swfupload.queue.js"></script>
<script type="text/javascript" src="../../Plus/swfupload/js/BatchUploadfileprogress.js"></script>
<script type="text/javascript" src="../../Plus/swfupload/js/BatchUploadhandlers.js"></script>

<script type="text/javascript">

    function uploadAskPic(file, serverData) {
        try {
            if (serverData.substring(0, 6) == "error:") {
                alert(unescape(serverData).replace("error:",""));
            }else{
                var d=unescape(serverData).split('|');
                parent.showAskPic(serverData);
            }
            var progress = new FileProgress(file, this.customSettings.progressTarget);
            progress.setComplete();
            if (serverData.substring(0, 6) == "error:") {
                progress.setStatus("<img src='../../sysimg/default/no.gif' align='absmiddle'> <span style='color:red'>文件没有上传.</span>");
            }else{
                progress.setStatus("<img src='../../sysimg/default/yes.gif' align='absmiddle'> <span style='color:green'>上传完毕.</span>");
            }
            $("#info"+file.id).html("---");
            progress.toggleCancel(false);

        } catch (ex) {
            this.debug(ex);
        }
    }


    var swfu;
    var basictype = 1;
    window.onload = function () {
        var settings = {
            flash_url: "../../plus/swfupload/swfupload/swfupload.swf",
            flash9_url: "../../plus/swfupload/swfupload/swfupload_fp9.swf",

            <%if (KSCMS.S("upfrom")=="Admin"){ %>
            upload_url: "<%=KSCMS.GetInstallDir() %><%=MyCache.GetCacheConfig(4) %>/Include/Upload.ashx",
            post_params: { "AdminLoginCode":"<%=KSCMS.GetCookie("Admin","AdminLoginCode") %>", "adminuser":"<%=KSCMS.GetCookie("Admin","AdminUser") %>","adminpass":"<%=KSCMS.GetCookie("Admin","AdminPass") %>","PowerList":"<%=KSCMS.GetCookie("Admin","PowerList") %>","usertype":"<%=KSCMS.GetCookie("Admin","UserType") %>","EditorID":"<%=KSCMS.S("EditorID") %>","upBySwf": "1", "FieldID":"-1","AddWaterFlag": "1",  UpType: "File", BasicType: <%=basicType %>, ChannelID: <%=channelId %>, AutoRename: 4 },
            <%}else{ %>
            upload_url: "Upload.ashx",
            post_params: {  "username":"<%=KSCMS.GetCookie("User","username") %>","password":"<%=KSCMS.GetCookie("User","password") %>","EditorID":"<%=KSCMS.S("EditorID") %>","upBySwf": "1", "FieldID":"-1","AddWaterFlag": "1",  UpType: "File", BasicType: <%=basicType %>, ChannelID: <%=channelId %>, AutoRename: 4 },
            <%} %>

            file_size_limit: "<%=limitSize %>",
            file_types: "<%=fileExt %>",
            file_types_description: "选择文件",
            file_upload_limit: 50,
            file_queue_limit: 0,
            custom_settings: {
                progressTarget: "fsUploadProgress",
                cancelButtonId: "btnCancel"
            },
            debug: false,
            // Button settings
            button_image_url: "",
            button_width: "75",
            button_height: "28",
            button_placeholder_id: "spanButtonPlaceHolder",
            button_text: '<span class="btn">选择文件</span>',
            button_text_style: ".btn{color:#ffffff;font-weight:bold}",
            button_text_top_padding: 3,
            button_text_left_padding: 10,
            button_window_mode: SWFUpload.WINDOW_MODE.TRANSPARENT,
            button_cursor: SWFUpload.CURSOR.HAND,

            // The event handler functions are defined in handlers.js
            swfupload_preload_handler: preLoad,
            swfupload_load_failed_handler: loadFailed,
            file_queued_handler: fileQueued,
            file_queue_error_handler: fileQueueError,
            file_dialog_complete_handler: fileDialogComplete,
            upload_start_handler: uploadStart,
            upload_progress_handler: uploadProgress,
            upload_error_handler: uploadError,
            upload_success_handler: <%=channelId==20000?"uploadAskPic":"uploadSuccess"%>,
            upload_complete_handler: uploadComplete,
            queue_complete_handler: queueComplete	// Queue plugin event
        };

        swfu = new SWFUpload(settings);
    };
    var realcount = 1;
    var totalsize = 0;
    var o = null;

    UpdateBottom = function () {
        jQuery("#allnums").show();
        jQuery("#allnum").html(parseInt(realcount) - 1);
        var totalsizes = (totalsize / 1024).toFixed(2);
        jQuery("#showsize").html("共计:<span style='font-weight:bold;color:#ff6600'>" + totalsizes + "</span>K");
    }
    UploadFileInput_OnResize = function () {
       
       
        if (haslimit) return;
        UpdateBottom();
        jQuery('#fsUploadProgress').hide();
        jQuery("#table1").show();
        o = parent.document.getElementById("upiframe");
        if (parseInt(realcount) >= 2) {
            jQuery("#bbottom").attr("style", "background:#E8F2FF;height:25px;line-height:25px;padding-top:6px");
        }

        if (parseInt(realcount) == 1) {
            (o.style || o).height = '30px';
        } else {
            (o.style || o).height = (parseInt(realcount) * 30 + 90) + 'px';
        }

       <%if (KSCMS.S("from")=="user"){%>
        parent.autoIframeHeight();
        <%}%>


    }
    SetParentIframeHeight = function () {
        UploadFileInput_OnResize();
        if (realcount <= 1) { UploadFileInput_OnResize(); }
    }
    UploadFileInput_OnResize();
	</script>



</head>
<body>
    <form id="form1" runat="server">
    


    
	 <!--<div id="divStatus">0 Files Uploaded</div>-->
	 
	 <table cellspacing="0" cellpadding="0">
	 <tr>
	  <td>
	 <div class="uploadbutton" style="float:left;margin-left:10px;width:75px;"><span id="spanButtonPlaceHolder"></span></div>
			<input type="button" value="开始上传" onClick="swfu.startUpload();" class="uploadbutton1" />
	  </td>
	  <td style="padding-top:8px">
	   
	   单文件限制大小 <font color=red><%=limitSize>=1024? Math.Round((double)(limitSize/1024),2).ToString() +" MB":limitSize+" KB"%></font>
     </td>
	</tr>
	</table>
	<div class="fieldset flash" id="fsUploadProgress" style="margin-bottom:10px;display:none"><span class="legend">上传列表</span></div>
	
	<style type="text/css">
	 .sort td{height:30px;line-height:30px;text-align:center;background:#E8F2FF;font-size:12px}
	 .splittd{font-size:12px;border-bottom:1px solid #E8F2FF;height:28px;line-height:28px}
	 </style>
	<table border="0" id="ttable" cellpadding="0" cellspacing="1" width="100%">
	  <tbody id="table1" style="display:none">
	  <tr class="sort">
	   <td>文件名</td>
	   <td width="100">大小</td>
	   <td width="260">进度</td>
	   <td width="100">功能</td>
	  </tr>
	  <tbody id="t1"></tbody>
	  </tbody>
	 <tbody id='table2'>
	 <tr id="bbottom">
	  <td style="text-align:center" colspan="4">
	    <table border="0" width="100%" cellpadding="0" cellspacing="0">
		 <tr><td></td>
		 <td id="allnums" style="font-size:12px;line-height:25px;display:none;text-align:right;padding-right:4px"><span style="color:#ff6600;font-weight:bold;" id="allnum">0</span> 个文件等待上传,<span id="showsize"></span></td>
		</tr></table>
	  </td>
	</tr>
	 </tbody>
	</table>






    </form>
</body>
</html>
