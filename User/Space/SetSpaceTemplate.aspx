<%@ Page Language="C#" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.User_SetSpaceTemplate" Codebehind="SetSpaceTemplate.aspx.cs" %>
<html>
	   <head>
	    <title>空间风格DIY 当前站点：<%=blogName%></title>
		<meta http-equiv=Content-Type content="text/html; charset=gb2312">
		<script src="../../ks_inc/jquery.js" type="text/javascript"></script>
		<script src="../../ks_inc/kesion.common.js" type="text/javascript"></script>
	   <style type="text/css">
		body{
			margin:0;
			color:#000;font:12px Verdana,Arial,Helvetica,sans-serif;
		}
		td{font:12px Verdana,Arial,Helvetica,sans-serif;}
        form,h1,ul,li{margin:0px;padding:0px;list-style-type:none}
		a {color:#555; padding:0px; text-decoration:none;blr:expression(this.onFocus=this.blur())}
		a:link {
			background: none transparent scroll repeat 0% 0%;color:#555;
		}
		a:hover {
			color: #ff0000; text-decoration: underline
		}
		.diytitle{height:30px;background:url(../images/navBg.gif) 0px -40px;font-size:14px;padding-left:30px;font-weight:bold;padding-top:4px;cursor: move;}
		.diytitle span{font-size:12px;font-weight:normal;color:#999;float:right;padding-right:20px}
		
/* TABS模块 */
.tabs{height:35px; margin-bottom:5px;background:#fff;border-bottom:#CCC 1px solid;width:100%}
.tabs ul{ margin-top:3px;margin-left:2px; display:inline; float:left; position:relative; bottom:-1px;}
.tabs li{margin-left:1px;width:116px;height:32px;line-height:32px; color:#2C602F; padding:0 1px; background:url(../images/t2.gif) no-repeat; cursor:pointer; float:left;text-align:center;}
.tabs li a{font-size:12px;font-weight:bold;}

.tabs li.select{line-height:32px;  background:url(../images/t1.gif) no-repeat;width:116px;height:32px; cursor:auto;}
.tplist{padding-left:30px;}
.tplist li{position:relative;list-style-type:none;width:155px;float:left;}
.tplist li a{cursor:pointer;display:block;width:128px;border:1px solid #efefef;padding:2px}
.tplist li a:hover{border:1px solid #ff6600;filter:alpha(opacity=60);}
.tplist li div{background:#000;color:#fff;width:125px;border:1px solid #cccccc}
.tplist .vip{background:url(../images/skinbg.png) -20px 23px;display:block;width:20px;height:20px;position:absolute;z-index:21;top:0px;right:0px}
.tplist .page{text-align:right;padding-right:30px;padding-bottom:2px}
.tplist .page a{font-size:14px;font-weight:bold}

/*DIY*/
#c1{}
#c1 h1{padding-left:10px;font-size:14px;font-weight:bold}
#c1 h1 span{color:#ff6600}
#c1 .photoname{height:130px;overflow:auto;width:240px}
#c1 .photoname li{text-align:center;width:100px;float:left;border:1px dashed #ccc;height:30px;line-height:30px;margin:2px}
.redborder a{color:red;}

#Layer1 {
	position:absolute;
	width:98%;
	height:225px;
	z-index:1;
	background:#fff;
	top:0px;
	border:1px solid #000;
	border-bottom:5px solid #999;
}	

/*按钮*/
button::-moz-focus-inner{border:0;padding:0;}
.pn{margin-right:3px;padding:0 20px;height:30px;border:1px solid #CFCFCF;-moz-border-radius:30px;-webkit-border-radius:30px;border-radius:30px;z-index:0;background:url(../images/pnp.png) no-repeat 50% -41px;color:#666;line-height:30px;font-size:14px;vertical-align:middle;cursor:pointer;position:relative\9;padding:0 0 0 20px\9;border:none\9;background:url(../images/pnp.png) no-repeat 0 0\9;overflow:visible\9;}
@media screen and (-webkit-min-device-pixel-ratio:0){.pn{font-family:"Microsoft YaHei","Hiragino Sans GB",STHeiti,SimHei,sans-serif;}}
.pn *{position:relative\9;display:block\9;padding-right:20px\9;*height:30px\9;background:url(../images/pnp.png) no-repeat 100% -40px\9;*line-height:30px\9;white-space:nowrap\9;font-weight:700;text-shadow:1px 1px 1px #EEE;}
.pn strong{padding-left:2px;letter-spacing:2px;font-weight:normal}

.pnc{color:#FFF;border-color:#10297B;background-position:50% -281px;background-position:0 -240px\9;}
.pnc *{background-position:100% -280px\9;text-shadow:1px 1px 1px #10297B;}
.pnp{background-position:50% -121px;background-position:0 -80px\9;border-color:#F0F3E6;}
.pnp *{background-position:100% -120px\9;text-shadow:1px 1px 1px #F0F3E6;}
	
.clear{height:1px;overflow:hidden;clear:both}
.hid{display:none}
</style>
	   </head>
	 <body scroll="no">
	   <script type="text/javascript">

	       $(document).ready(function () {
               //修改内容
	           $(".tplink").click(function () {

	               //var tplt = $(this).children("img").attr("tplt");
	               

	               var tpltID = $(this).children("img").attr("tpltID");
	               var tplt = "../../Space/?tpltId=" + tpltID;

	               $("#<%=this.tpltMainPath.ClientID%>").val(tpltID);


	               //var text = "<iframe name='viewframe' id='viewframe' src='" + tplt + "' height='100%' width='100%'></iframe>";
	              
	               
	               
	               $("#viewframe").attr("src", tplt);
	               //$("#ShowsTpl").prepend(text);
	               //$("#btn").trigger("click");
	           });

	           $("#styl1").click(function () {
	               $("#tplist").css("display", "block");
	               $("#tplist2").css("display", "none");
	               $(this).siblings().removeClass();
                   $(this).addClass("select");
	           });

	           $("#styl2").click(function () {
	               $("#tplist").css("display", "none");
	               $("#tplist2").css("display", "block");
	               $(this).siblings().removeClass();
	               $(this).addClass("select");
	           });

	       });

	       //onload();

	       function closeDiy() {
	           if (confirm("是否关闭？")) {
	               location.href = "../../space/?" + $("#<%=this.userid.ClientID%>").val();
	           }
	       }
	       

	   </script>
	   
	   <SCRIPT LANGUAGE="JavaScript">
		<!--
    //定义函数divMove
    function divMove(divObj) {
        with (this) {
            if (!divObj) return;
            this.hasDraged = false;
            this.dragObj = divObj;
            // 把鼠标的形状改成移动形
            dragObj.style.cursor = "move";
            // 定义鼠标按下时的操作
            dragObj.onmousedown = function () {
                var ofs = Offset(dragObj);
                dragObj.style.position = "absolute";
                dragObj.style.left = ofs.l;
                dragObj.style.top = ofs.t;
                dragObj.X = event.clientX - ofs.l;
                dragObj.Y = event.clientY - ofs.t;
                hasDraged = true;
            };

            // 定义鼠标移动时的操作
            dragObj.onmousemove = function () {
                if (!hasDraged) return;
                dragObj.setCapture();
                dragObj.style.left = event.clientX - dragObj.X;
                dragObj.style.top = event.clientY - dragObj.Y;
            };
            // 定义鼠标提起时的操作
            dragObj.onmouseup = function () {
                hasDraged = false;
                dragObj.releaseCapture();
            };
            function Offset(e) {
                var t = e.offsetTop;
                var l = e.offsetLeft;
                var w = e.offsetWidth;
                var h = e.offsetHeight;
                while (e = e.offsetParent) {
                    t += e.offsetTop;
                    l += e.offsetLeft;
                }
                return { t: t, l: l, w: w, h: h }
            };
        }
    };

    //-->
		</SCRIPT>
	   
	   <div id="Layer1">
		   <div class="diytitle"  onMouseDown="divMove($('#Layer1')[0]);">
		   	<span><script>if (document.all) {
    document.write('可以将鼠标移到这里，然后按住鼠标移动，查看被挡住的区域');
}</script> <label style="cursor:pointer" onClick="closeDiy()"><img src="../../SysImg/default/close.gif" align="absmiddle" /><strong>关闭</strong></label></span>

		   空间风格DIY
		   </div>
			<div class="tabs" style="display:none">	
			  <ul>
				 <li class="select" id="styl1"><a href="#">选择风格</a></li>
				 <li id="styl2"><a href="#">自定义装扮</a></li>
			 </ul>
			</div>
			<style type="text/css">
			    #contentlist .tplist a img {
			        border:2px solid #ccc;
			    }
			</style>

			<div id="contentlist">
				<div class="tplist" id="c0">
				  <ul id="tplist" >
                      <asp:Repeater ID="Rept" runat="server" >
                          <ItemTemplate>
                              <a href="javascript:SelectCurrentTmpt(this)" class="tplink" >
                                  <img onerror="this.src='../../sysimg/nopic.gif'" src='<%#Eval("TemplatePic") %>' tplt='<%#Eval("TemplateMain") %>' tpltID='<%#Eval("SkinID") %>' runat="server" width="120" height="120" /></a>
                          </ItemTemplate>
                      </asp:Repeater>
                  </ul>

                  <ul id="tplist2" style="height:120px; display:none;">
                      <div>loading...</div>
                  </ul>


				  <div style="margin-top:0px;padding-top:3px;padding-bottom:4px;padding-left:30px;border-top:1px dashed #ccc" >

                      <form runat="server" action="" method="post">

                          <asp:Button ID="Button1" runat="server" Text="保 存" OnClick="Button1_Click" />
                          <asp:Button ID="Button2" runat="server" Text="取 消" OnClick="Button2_Click" />
                          <asp:HiddenField ID="tpltMainPath" runat="server" />
                          <asp:HiddenField ID="userid" Value="0" runat="server" />


                          <asp:Button ID="btn" runat="server" Text="00000" OnClick="Button3_Click" style="display:none;" />

                      </form>
					
                  </div>
				  
				</div>
			</div>
			
			
	   </div>
         <div id="ShowsTpl" runat="server" >
             <asp:Literal ID="Literal1" runat="server"></asp:Literal>
         </div>
	   </body>
	   </html>
	   