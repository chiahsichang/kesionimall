var swfu;
		var pid=0;
		function SetAddWater(obj){
		 if (obj.checked){
		 swfu.addPostParam("addwatermark","1");
		 }else{
		 swfu.addPostParam("addwatermark","0");
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
		
		function addImage(bigsrc,smallsrc,text,picid) {
			if (picid==undefined) picid=0;
			var newImgDiv = document.createElement("div");
			var delstr = '';
			delstr = '<a href="javascript:DelUpFiles('+pid+','+picid+')" style="color:#ff6600">[删除]</a>';
			newImgDiv.className = 'thumbshow';
			newImgDiv.id = 'thumbshow'+pid;
			document.getElementById("thumbnails").appendChild(newImgDiv);
			newImgDiv.innerHTML = '<a href="'+bigsrc+'" target="_blank"><span id="show'+pid+'"><img src="'+smallsrc+'" /></span></a>';
			newImgDiv.innerHTML += '<div style="margin-top:0px;text-align:left">'+delstr+' <b>注释：</b><input type="hidden" class="pics" id="pic'+pid+'" value="'+bigsrc+'|'+smallsrc+'|'+picid+'"/><input type="text" name="picinfo'+pid+'" value="'+text+'" picId="'+picid+'" style="width:150px;" class="textbox intro"/><span><a title="左移动排序" href="javascript:;" onclick="pic_move(this,1);">←左移动</a>&nbsp;&nbsp;&nbsp;<a title="右移动排序" href="javascript:;" onclick="pic_move(this,2);">右移动→</a></span></div>';
		    
			
			pid++;
			
		}
	
		window.onload = function () {
			swfu = new SWFUpload({
				// Backend Settings
				upload_url: upload_url,
				post_params: post_params,

				// File Upload Settings
				file_size_limit : "2 MB",	// 2MB
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
				button_text : '<span class="button">本地批量上传(单图限制2 MB)</span>',
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