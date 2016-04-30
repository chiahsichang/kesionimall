<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="KS.ShopPrintExpress.aspx.cs" Inherits="Kesion.NET.WebSite.Admin.Shop.ShopPrintExpress " %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>快递单打印</title>
    <script src="../../ks_inc/jQuery.js"></script>
    <script src="../../ks_inc/Kesion.Common.js"></script>
    <style type="text/css">
	body{margin:0px;padding:0px;}
	.mo{display:block;
	border:0px solid #ff6600;
    padding:0px;
    height:22px;
	font-size:20px;
	line-height:22px;
    position:absolute;
        width:270px;
        word-break;break-all;
	}
	 .box{border:1px solid #cccccc;width:874px;height:483px;background:url(../../shop/express/<%=photoUrl%>) no-repeat;}
	 .bar{font-size:12px;border:1px solid #ccc;margin-bottom:6px;margin-top:5px;padding:2px;background:#f1f1f1;height:25px;width:870px;}
	 .noprint{border-top:2px solid #ccc;}
	 @media print {     
            .noprint{display: none; }     
    }     
    </style>
    <script type="text/javascript">
        function changesize(v) {
	   if (v==0) return;
         jQuery("#mybody").find("label").each(function(){
         jQuery(this)[0].style.fontSize = v + "px";
     });
    }
    jQuery(document).ready(function() {
        jQuery("#<%=this.DrpCorpID.ClientID %>").bind("change", function() {
            if (jQuery("#<%=this.DrpCorpID.ClientID %> option:selected").val() != '0') { location.href = '?id=<%=id%>&corpid=' + jQuery("#<%=this.DrpCorpID.ClientID %> option:selected").val(); }
        });
    });
	</script>
</head>
<body>
    <form id="form1" runat="server">
    <div id="mybody" class="box"><%=template%></div>
	<div class="noprint bar">
		<strong>选择快递单模板：</strong>
		<asp:DropDownList ID="DrpCorpID" runat="server">
		 <asp:ListItem Value="0">请选择...</asp:ListItem>
		</asp:DropDownList>

		打印字号：
		<asp:DropDownList ID="DrpPsize" runat="server" onChange="changesize(this.value);">
		<asp:ListItem Value='0'>请选择字号...</asp:ListItem>
		</asp:DropDownList>
		 

		<input type="button" value=" 开始打印 "  onclick="window.print()" class="button"/>
    </div>
    <div class="noprint">
    <script type="text/javascript">
        showtips('<img src="../../admin/images/dot.gif"> <strong>打印注意事项： </strong><br/>设置打印机的尺寸，开始->打印机和传真->右击 服务器属性->创建新格式->填写快递单尺寸（一般大小为：23cm*12.7cm）<br/>打印机后进纸的时候，纸张一定靠左，以左对齐，然后再对齐右边。这样不会打歪<br/>扫描好的快递单图片大小应该改成874*483<br/>把浏览器的页面设置量的 上和下改成0,页眉页脚都要设置为空（非常重要）<br/>要开始打印时需给打印机设置下纸张大小：选择打印机->打印首选项->高级->选择纸张规格，选择刚第一步添加的纸规格即可。');
		</script>
    </div>
    </form>
</body>
</html>
