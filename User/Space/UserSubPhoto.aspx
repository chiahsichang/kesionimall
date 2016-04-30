<%@ Page Title="" Language="C#" MasterPageFile="~/User/User.master" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.User_UserSubPhoto" Codebehind="UserSubPhoto.aspx.cs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="KSContent" Runat="Server">
    <% Kesion.APPCode.EditorAPI.EchoHead();%>
<asp:Panel ID="addPanel" runat="server" Width="100%" Visible="true">
  <script src="../../KS_Inc/DatePicker/WdatePicker.js"></script>

    <table width="100%" border="0" cellpadding="1" cellspacing="1" class="CTable">
        <tr class="title">
                 <td colspan="3"> 我的相册管理</td>
                </tr>
        
        <tr>

            <td align="right" class="lefttd">
                <strong>所属分类：</strong></td>
            <td class="righttd">
                &nbsp;<asp:DropDownList runat="server" ID="dropPhotoClass"></asp:DropDownList>

            </td>
        </tr>
        
       
                   <tr>
                       <td align="right" class="lefttd">
                           <strong>图片名称：</strong></td>
                       <td class="righttd">
                           &nbsp;<asp:TextBox CssClass="textbox" ID="txtPicName" runat="server" Width="400px"></asp:TextBox>
                           </td>
                   </tr>
        <tr>
            <td align="right" class="lefttd">
                <strong>关 键 字：</strong></td>
            <td class="righttd">
                &nbsp;<asp:TextBox CssClass="textbox" ID="txtTags" runat="server" Width="300px"></asp:TextBox><a href="javascript:GetKeyTags();">自动获得关键字Tag</a>
                </td>
        </tr>
        <tr>
            <td align="right" class="lefttd">
                <strong>图片作者：</strong></td>
            <td class="righttd">
                &nbsp;<asp:TextBox ID="txtAuthor" CssClass="textbox" runat="server" Width="203px"></asp:TextBox>
                &nbsp;
                </td>
        </tr>
        <tr>
            <td align="right" class="lefttd">
                <strong>图片来源：</strong></td>
            <td class="righttd">
                &nbsp;<asp:TextBox ID="txtSource" CssClass="textbox" runat="server" Width="203px"></asp:TextBox>
                &nbsp;
                
                
                </td>
        </tr>
        <tr>
            <td align="right" class="lefttd">
                <strong>添加时间：</strong></td>
            <td class="righttd">
                &nbsp;<asp:TextBox ID="txtAddTime" ReadOnly="true" CssClass="textbox" onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'});" runat="server"></asp:TextBox>

            </td>
        </tr>
        

        <tr>
            <td align="right" class="lefttd">
                <strong>相册介绍：</strong></td>
            <td class="righttd">
              <asp:TextBox ID="textContent" TextMode="multiLine" style="width:600px;height:150px;" runat="server"></asp:TextBox>
                <%
                    Kesion.APPCode.EditorAPI.EchoEditor("editor", textContent.ClientID, "Basic", 0, false, true, true, false);    
               %>

            </td>
        </tr>



        <tbody id="ContentArea">
	<tr class="tdbg">
		<td class="lefttd" style="text-align:right;">具体内容：</td><td class="list_right_box">&nbsp;<table style='margin-bottom:10px; display:none;' width='80%' ><tr><td><input checked type='radio' value='0' onclick="jQuery('#pagenums').hide();" name='showstyle'><img src='../sysimg/default/p0.gif' title='当图片组只有一张图片时无效,设置此样式无效!'></td><td><input type='radio' value='1' name='showstyle' onclick="    jQuery('#pagenums').hide();"><img src='../sysimg/default/p1.gif' title='当图片组只有一张图片时无效,设置此样式无效!'></td><td><input type='radio' value='2' name='showstyle' onclick="    jQuery('#pagenums').show();"><img src='../sysimg/default/p2.gif' title='当图片组只有一张图片时无效,设置此样式无效!'></td><td><input type='radio' value='3' name='showstyle' onclick="    jQuery('#pagenums').show();"><img src='../sysimg/default/p3.gif'></td></tr></table><div id="pagenums" style='margin:10px;font-weight:bold;display:none'>每页显示<input type="text" name="pagenum" id="pagenum" value="12" style="text-align:center;width:30px">张</div><link href="../plus/swfupload/images/default.css" rel="stylesheet" type="text/css" />
		<input type="hidden" runat="server" id="hidFileMaxSize" value="0" />
            <script type="text/javascript" src="../../plus/swfupload/swfupload/swfupload.js"></script>
		<script type="text/javascript" src="../../plus/swfupload/js/handlers.js"></script>
<script type="text/javascript">
    var upload_url="../include/upload.ashx";
    var flash_url="../../plus/swfupload/swfupload/swfupload.swf";
    var flash9_url="../../plus/swfupload/swfupload/swfupload_FP9.swf";
    var modelId="19998";
    var buttonstyle="color:#555555;";


                var swfu;
                var pid=0,filemaxsize = "";
                filemaxsize = $("#<%= this.hidFileMaxSize.ClientID%>").val() + " kb";
                function SetAddWater(obj){
                    if (obj.checked){
                        swfu.addPostParam("AddWaterFlag","1");
                    }else{
                        swfu.addPostParam("AddWaterFlag","0");
                    }
                }
                //删除已经上传的图片
                function DelUpFiles(pid)
                {
                    jQuery("#thumbshow"+pid).remove();
                }	
                function pic_move(obj,fx){
                    var box_d=jQuery(obj).parent().parent().parent();
                    var box_fx='';
                    if (fx==1)
                    {box_fx=box_d.prev()}
                    else if(fx==2)
                    {box_fx=box_d.next()}
                    else
                    {box_fx=''}
                    if ( box_fx.length > 0 ) {
                        if(fx==1) box_fx.before(box_d.clone())
                        if(fx==2) box_fx.after(box_d.clone())
                        if(fx==1 || fx==2)box_d.remove()
                    } 
                }
		
                function addImage(bigsrc,smallsrc,text) {
                    var newImgDiv = document.createElement("div");
                    var delstr = '';
                    delstr = '<a href="javascript:DelUpFiles('+pid+')" style="color:#ff6600">[删除]</a>';
                    newImgDiv.className = 'thumbshow';
                    newImgDiv.id = 'thumbshow'+pid;
                    document.getElementById("thumbnails").appendChild(newImgDiv);
                    newImgDiv.innerHTML = '<a href="'+bigsrc+'" target="_blank"><span id="show'+pid+'"><img src="'+smallsrc+'" /></span></a>';
                    newImgDiv.innerHTML += '<div style="margin-top:0px;text-align:left">'+delstr+' <b>注释：</b><input type="hidden" class="pics" id="pic'+pid+'" value="'+bigsrc+'|'+smallsrc+'"/><input type="text" name="picinfo'+pid+'" value="'+text+'" style="width:150px;" class="textbox"/><span><a title="左移动排序" href="javascript:;" onclick="pic_move(this,1);">←左移动</a>&nbsp;&nbsp;&nbsp;<a title="右移动排序" href="javascript:;" onclick="pic_move(this,2);">右移动→</a></span></div>';
		
                    pid++;
			
                }
	
                window.onload = function () {
                    swfu = new SWFUpload({
                        // Backend Settings
                        upload_url: upload_url,
                        post_params: { "username":"<%=Kesion.Publics.KSCMS.GetCookie("User","username") %>","password":"<%=Kesion.Publics.KSCMS.GetCookie("User","password") %>", "CreateThumbs":1,"ChannelID":19998,"AutoRename":4,"addwatermark": "1", "fieldid":"-1","upbyswf":1},

                        // File Upload Settings
                        file_size_limit: filemaxsize,
                        file_types : "*.jpg; *.gif; *.png",
                        file_types_description : "支持.JPG.gif.png格式的图片,可以多选",
                        file_upload_limit : 0,

                        // Event Handler Settings - these functions as defined in Handlers.js
                        //  The handlers are not part of SWFUpload but are part of my website and control how
                        //  my website reacts to the SWFUpload events.
                        swfupload_preload_handler : preLoad,
                        swfupload_load_failed_handler : loadFailed,
                        file_queue_error_handler : fileQueueError,
                        file_dialog_complete_handler : fileDialogComplete,
                        upload_progress_handler : uploadProgress,
                        upload_error_handler : uploadError,
                        upload_success_handler : uploadSuccess,
                        upload_complete_handler : uploadComplete,

                        // Button Settings
                        //button_image_url : "../plus/swfupload/images/SmallSpyGlassWithTransperancy_17x18d.png",
                        button_placeholder_id : "spanButtonPlaceholder",
                        button_width: 195,
                        button_height: 22,
                        button_text : '<span class="button">本地批量上传(单图限制'+filemaxsize+')</span>',
                        button_text_style : '.button { '+buttonstyle+'} ',
                        button_text_top_padding: 3,
                        button_text_left_padding: 0,
                        button_window_mode: SWFUpload.WINDOW_MODE.TRANSPARENT,
                        button_cursor: SWFUpload.CURSOR.HAND,
				
                        // Flash Settings
                        flash_url : flash_url,
                        flash9_url : flash9_url,

                        custom_settings : {
                            upload_target : "divFileProgressContainer"
                        },
				
                        // Debug Settings
                        debug: false
                    });
                };
                var box='';
                function OnlineCollect(dir){
                   box=jQuery.dialog.open(dir+"showbox.aspx?action=collectbox",{ 
				title:'网上采集图片',
				width:440,
				height:215,
				cancelVal: '取消',
				max:false,
				min:false,
				ok:function(){
					var iframe = this.iframe.contentWindow;
					if (!iframe.document.body) {
						alert('iframe还没加载完毕呢')
						return false;
					};
					if (iframe.document.getElementById('collecthttp').value == '') {
						 KesionJS.Alert("请输入远程图片地址,一行一张地址！",null);
						 iframe.document.getElementById('collecthttp').focus();
						 return false;
					 } else {
						ProcessCollect(iframe.document.getElementById('collecthttp').value);
					 }
					
				},
				cancel: true /*为true等价于function(){}*/ 
			});

                }
                function AddTJ(dir){
                   box=jQuery.dialog.open(dir+"showbox.aspx?action=selecttp&channelid="+modelId,{ 
				title:'从上传文件中选择',
				width:440,
				height:165,
				cancelVal: '取消',
				max:false,
				min:false,
				ok:function(){
					var iframe = this.iframe.contentWindow;
					if (!iframe.document.body) {
						alert('iframe还没加载完毕呢')
						return false;
					};
					if (iframe.document.getElementById('x1').value == '') {
                        KesionJS.Alert('请选择一张小图地址!', '');
                        return false;
                    }
                    if (iframe.document.getElementById('x2').value == '') {
                        KesionJS.Alert('请选择一张大图地址!', '');
                        return false;
                    }
                    addImage(iframe.document.getElementById('x2').value, iframe.document.getElementById('x1').value, iframe.document.getElementById('x3').value)
                    iframe.document.getElementById('x1').value='';
                    iframe.document.getElementById('x2').value='';
                    iframe.document.getElementById('x3').value='';
				},
				cancel: true /*为true等价于function(){}*/ 
			});
                }

                function ProcessCollect(collecthttp){
                    if (collecthttp==''){
                        alert('请输入远程图片地址,一行一张地址!');
                        return false;
                    }
                    var carr=collecthttp.split('\n');
                    for(var i=0;i<carr.length;i++){
	   
                        var bigsrc=carr[i];
                        var smallsrc=carr[i];
                        addImage(bigsrc,smallsrc,'')
                    }
                }
            </script>
	    <table>
		 <tr>
		  <td><div class="button"><span id="spanButtonPlaceholder"></span></div></td>
		 <td><button type="button"  class="button" onclick="OnlineCollect('')">网上采集</button>&nbsp;<button type="button"  class="button" onClick="AddTJ('');">图片库...</button></td>
		 </tr>
		</table>

		<label><input type="checkbox" name="AddWaterFlag" value="1" onClick="SetAddWater(this)" checked="checked"/>图片添加水印</label>
		<div id="divFileProgressContainer"></div>
	    <div id="thumbnails"></div>
		<input type='hidden' name='PicUrls' id='PicUrls' runat="server" /> </td>
	</tr>
</tbody>

        <tr>
            <td align="right" class="lefttd">
                <strong>缩 略 图：</strong></td>
            <td class="righttd">
                &nbsp;<asp:TextBox ID="txtPhotoUrl" CssClass="textbox" runat="server" Width="300px"></asp:TextBox>
                &nbsp;<input type="button" class="button" onclick="OpenThenSetValue('../Include/SelectFile.aspx?ChannelID=2', 550, 290, window, $('#<%=this.txtPhotoUrl.ClientID%>')[0] );" value="选择图片" />
                
                </td>
        </tr>
 
        <asp:HiddenField runat="server" ID="picId" Value="0" />
        <asp:HiddenField runat="server" ID="modify" Value="0" />
        <tr style="display:none">
            <td align="right" class="lefttd">
                <strong>阅读资金：</strong></td>
            <td class="righttd">
                &nbsp;<asp:TextBox CssClass="textbox" ID="txtFund" runat="server" Width="100px"></asp:TextBox>

            </td>
        </tr>

      </table>			


    <script type="text/javascript" >
        function GetKeyTags() {
            var text = escape(jQuery("#<%=this.txtPicName.ClientID %>").val());
            if (text != '') {
                jQuery("#<%=this.txtTags.ClientID %>").val('请稍等,系统正在自动获取tags...').attr("disabled", true);
                    jQuery.get("../plus/ajaxs.ashx", { a: "GetTags", text: text },
				      function (data) { jQuery("#<%=this.txtTags.ClientID %>").val(unescape(data)).attr("disabled", false); });
                    } else { KesionJS.Alert('对不起,请先输入标题!', "jQuery('#<%=this.txtPicName.ClientID %>').focus();"); }
            }
            jQuery(document).ready(function(){
                IniPicUrl();
            })

            function IniPicUrl(){
                var PicUrls='<%=this.PicUrls.Value%>';
                var PicUrlArr=null;
                if (PicUrls!='')
                { 
                    PicUrlArr=PicUrls.split('|||');
                    for ( var i=1 ;i<PicUrlArr.length+1;i++){ 
                        addImage(PicUrlArr[i-1].split('|')[1],PicUrlArr[i-1].split('|')[2],PicUrlArr[i-1].split('|')[0]);
                    }
                }
            }
        function CheckForm() {

            if (jQuery("#<%=this.dropPhotoClass.ClientID %>").val() == '0') {
                KesionJS.Alert('请选择相册分类!', 'jQuery("#<%=this.dropPhotoClass.ClientID %>").focus()');
                return false
            }

            if (jQuery("#<%=this.txtPicName.ClientID %>").val() == '') {
                KesionJS.Alert('请填写相册标题!', 'jQuery("#<%=this.txtPicName.ClientID %>").focus()');
                return false
            }

            if (!is_number(jQuery("#<%=this.txtFund.ClientID %>").val())) {
                KesionJS.Alert('阅读资金必须为整数!', 'jQuery("#<%=this.txtFund.ClientID %>").focus()');
                return false
            }

            

            jQuery('#<%=this.PicUrls.ClientID%>').val('');
            var picSrcs = '';
            var src = '';
            jQuery("#thumbnails").find(".pics").each(function () {
                src = jQuery(this).next().val().replace('|||', '').replace('|', '') + '|' + jQuery(this).val()
                if (picSrcs == '') {
                    picSrcs = src;
                } else {
                    picSrcs += '|||' + src;
                }
            });
            jQuery('#<%=this.PicUrls.ClientID%>').val(picSrcs);

            jQuery('#<%=this.PicUrls.ClientID%>').val();

            if (jQuery('#<%=this.PicUrls.ClientID%>').val() == '' && !(jQuery('#TurnUrlTF')[0].checked)) {
                KesionJS.Alert('请上传图片集!', null); return false;
            }

            if (jQuery("#<%=this.txtPhotoUrl.ClientID %>").val() == '') {
                KesionJS.Alert('选择缩略图!', 'jQuery("#<%=this.txtPhotoUrl.ClientID %>").focus()');
                return false
            }
            

            return true;
        }
        </script>


        <br />

        <p style="text-align:center;">
            <asp:Button ID="Button1" OnClientClick="return(CheckForm());" CssClass="button" runat="server" Text="OK!确定保存" OnClick="Button1_Click" />
                                &nbsp; &nbsp; &nbsp;
            <input type="button" onclick="history.go(-1)" class="button" value=" 返 回 " />
        </p>
    </asp:Panel>

</asp:Content>

