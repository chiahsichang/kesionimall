<%@ Page Language="C#" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.Shop.ShowPic" Codebehind="Index.aspx.cs" %>
<!DOCTYPE html>
<html>
<head id="Head1">
<title>
	<%=titleStr %>的清晰图片
</title>

<style type="text/css">
body {margin:0px; padding:0px; font-size:12px;background-color: #000000;color: #ffffff;}
</style>

<!-- include CSS always before including js -->
<link type="text/css" rel="stylesheet" href="../../ks_inc/tn3/skins/tn3/tn3.css"></link>
<!-- include jQuery library -->
<script type="text/javascript" src="../../ks_inc/jquery.js"></script>
<script type="text/javascript" src="../../ks_inc/kesion.common.js"></script>
<!-- include tn3 plugin -->
<script type="text/javascript" src="../../ks_inc/tn3/js/jquery.tn3lite.min.js"></script>

<!--  initialize the TN3 when the DOM is ready -->
<script type="text/javascript">
    $(document).ready(function () {
        //Thumbnailer.config.shaderOpacity = 1;
        var tn1 = $('.mygallery').tn3({
            skinDir: "skins",
            isFullScreen:true,
            imageClick: "fullscreen",
            image: {
                maxZoom: 1.5,
                crop: true,
                clickEvent: "dblclick",
                transitions: [{
                    type: "blinds"
                }, {
                    type: "grid"
                }, {
                    type: "grid",
                    duration: 460,
                    easing: "easeInQuad",
                    gridX: 1,
                    gridY: 8,
                    // flat, diagonal, circle, random
                    sort: "random",
                    sortReverse: false,
                    diagonalStart: "bl",
                    // fade, scale
                    method: "scale",
                    partDuration: 360,
                    partEasing: "easeOutSine",
                    partDirection: "left"
                }]
            }
        });
    });
</script>

</head>
<body scroll="no">
     <div id="album" style="display:none;position:fixed;text-align:center;background:#fff;color:#999;line-height:30px;z-index:10000;width:100%;height:30px;border-bottom:1px solid #ff6a00;">
         查看商品【<%=titleStr %>】图片集。
     </div>
    <div class="mygallery">
	<div class="tn3 album">
	    <h4>Fixed Dimensions</h4>
	    <div class="tn3 description">Images with fixed dimensions</div>
	    <div class="tn3 thumb">images/35x35/1.jpg</div>
	    <ol>
		<%=photoStr %>
	    </ol>
	</div>
    </div>
</body>
</html>
