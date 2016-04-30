<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="KS.ShopPrintExpress.aspx.cs" Inherits="Kesion.NET.WebSite.Admin.Shop.ShopPrintExpress " %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>��ݵ���ӡ</title>
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
		<strong>ѡ���ݵ�ģ�壺</strong>
		<asp:DropDownList ID="DrpCorpID" runat="server">
		 <asp:ListItem Value="0">��ѡ��...</asp:ListItem>
		</asp:DropDownList>

		��ӡ�ֺţ�
		<asp:DropDownList ID="DrpPsize" runat="server" onChange="changesize(this.value);">
		<asp:ListItem Value='0'>��ѡ���ֺ�...</asp:ListItem>
		</asp:DropDownList>
		 

		<input type="button" value=" ��ʼ��ӡ "  onclick="window.print()" class="button"/>
    </div>
    <div class="noprint">
    <script type="text/javascript">
        showtips('<img src="../../admin/images/dot.gif"> <strong>��ӡע����� </strong><br/>���ô�ӡ���ĳߴ磬��ʼ->��ӡ���ʹ���->�һ� ����������->�����¸�ʽ->��д��ݵ��ߴ磨һ���СΪ��23cm*12.7cm��<br/>��ӡ�����ֽ��ʱ��ֽ��һ������������룬Ȼ���ٶ����ұߡ������������<br/>ɨ��õĿ�ݵ�ͼƬ��СӦ�øĳ�874*483<br/>���������ҳ���������� �Ϻ��¸ĳ�0,ҳüҳ�Ŷ�Ҫ����Ϊ�գ��ǳ���Ҫ��<br/>Ҫ��ʼ��ӡʱ�����ӡ��������ֽ�Ŵ�С��ѡ���ӡ��->��ӡ��ѡ��->�߼�->ѡ��ֽ�Ź��ѡ��յ�һ����ӵ�ֽ��񼴿ɡ�');
		</script>
    </div>
    </form>
</body>
</html>
