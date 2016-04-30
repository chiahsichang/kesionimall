<%@ Page Language="C#" MasterPageFile="~/User/CssFrame.master" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.User_MyInvoiceAdd" Title="Untitled Page" Codebehind="MyInvoiceAdd.aspx.cs" %>
<%@ Import Namespace="Kesion.Cache" %>
<%@ Import Namespace="Kesion.Publics" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    

    <script type="text/javascript">
        function loadICity() {
            var pid = jQuery("#i_provinceid option:selected").val();
            if (pid != '') {
                jQuery.get("../../plus/ajaxs.ashx", { a: "loadCityoption", pid: pid },
                    function (data) {

                        if (data != null && data != '') {
                            jQuery("#showicity").show();
                            jQuery("#i_cityid").empty().append("<option value=''>请选择...</option>").append(data);
                        } else {
                            jQuery("#showicity").hide();
                            jQuery("#i_cityid").empty().append("<option value=''>请选择...</option>");
                        }
                        jQuery("#showicounty").hide();
                        jQuery("#i_countyid").empty().append("<option value=''>请选择...</option>");
                    });
            }
            jQuery("#showselectiarea").html(jQuery("#i_provinceid option:selected").get(0).text);
        }
        function loadICounty() {
            var cid = jQuery("#i_cityid option:selected").val();
            if (cid != '') {


                jQuery.get("../../plus/ajaxs.ashx", { a: "loadcountyoption", cid: cid },
                    function (data) {
                        if (data != null && data != '') {
                            jQuery("#showicounty").show();
                            jQuery("#i_countyid").empty().append("<option value=''>请选择...</option>").append(data);
                        } else {
                            jQuery("#showicounty").hide();
                            jQuery("#i_countyid").empty().append("<option value=''>请选择...</option>");
                        }
                    });
            }
            loadISelect();
        }
        function loadISelect() {
            var str = jQuery("#i_provinceid option:selected").get(0).text;
            try {
                if (jQuery("#i_cityid option:selected").val() != '') str += jQuery("#i_cityid>option:selected").get(0).text;
                if (jQuery("#i_countyid option:selected").val() != '') str += jQuery("#i_countyid>option:selected").get(0).text;
            } catch (e) {
            }
            jQuery("#showselectiarea").html(str);
        }
        var i_provinceid = 0;
        var i_cityid = 0;
        var i_countyid = 0;
        function saveInvoice(obj) {

            var invoiceType = $("input[name=InvoiceType]:checked").val();
            var titleType = $("input[name=TitleType]:checked").val();

            if (invoiceType == 1) {
                if ($("#i_ComapanyName").val() == '') {
                    KesionJS.Alert('请输入单位名称!', 'jQuery("#i_ComapanyName").focus();');
                    return false;
                }
                if ($("#i_NSRSBH").val() == '') {
                    KesionJS.Alert('请输入纳税人识别号!', 'jQuery("#i_NSRSBH").focus();');
                    return false;
                }
                if ($("#i_Address").val() == '') {
                    KesionJS.Alert('请输入注册地址!', 'jQuery("#i_Address").focus();');
                    return false;
                }
                if ($("#i_Tel").val() == '') {
                    KesionJS.Alert('请输入注册电话!', 'jQuery("#i_Tel").focus();');
                    return false;
                }
                if ($("#i_Bank").val() == '') {
                    KesionJS.Alert('请输入开户银行!', 'jQuery("#i_Bank").focus();');
                    return false;
                }
                if ($("#i_BankNum").val() == '') {
                    KesionJS.Alert('请输入开户银行账号!', 'jQuery("#i_BankNum").focus();');
                    return false;
                }

                //检查收发票人信息
                if ($("#S_ContactMan").val() == '') {
                    KesionJS.Alert('请输入收票人姓名!', 'jQuery("#S_ContactMan").focus();');
                    return false;
                }
                if ($("#S_Mobile").val() == '') {
                    KesionJS.Alert('请输入收票人手机号码!', 'jQuery("#S_Mobile").focus();');
                    return false;
                }

                i_provinceid = jQuery("#i_provinceid option:selected").val();
                if (i_provinceid == '') {
                    KesionJS.Alert('请选择收票人所在地区!');
                    return false;
                }
                i_cityid = jQuery("#i_cityid option:selected").val();
                if (i_cityid == '') {
                    KesionJS.Alert('请选择收票人所在城市!');
                    return false;
                }
                if (jQuery("#i_countyid")[0]) {
                    i_countyid = jQuery("#i_countyid option:selected").val();
                }

                if ($("#S_Address").val() == '') {
                    KesionJS.Alert('请输入收票人地址!', 'jQuery("#S_Address").focus();');
                    return false;
                }


            } else {
                if (titleType == 1 && $("#InvoiceTitle").val() == '') {
                    KesionJS.Alert('请输入发票抬头!', 'jQuery("#InvoiceTitle").focus();');
                    return false;
                }
            }

            jQuery.get("../../plus/ajaxs.ashx", { a: "saveinvoice", invoiceId: $("#invoiceId").val(), invoiceType: invoiceType, titleType: titleType, invoiceTitle: $("#InvoiceTitle").val(), companyName: $("#i_ComapanyName").val(), NSRSBH: $("#i_NSRSBH").val(), Address: $("#i_Address").val(), Tel: $("#i_Tel").val(), bank: $("#i_Bank").val(), bankNum: $("#i_BankNum").val(), contactMan: $("#S_ContactMan").val(), Mobile: $("#S_Mobile").val(), i_provinceid: i_provinceid, i_cityid: i_cityid, i_countyid: i_countyid, s_address: $("#S_Address").val() },
                   function (data) {
                       if (data == "exists") {
                           KesionJS.Alert('对不起，存在相同的记录，不能再添加!');
                       } else if (data == "full") {
                           KesionJS.Alert('对不起，最多只能添加20个发票信息!');
                       } else {
                           if (parseInt($("#invoiceId").val()) == 0)
                               alert('恭喜,添加成功!');
                           else
                               alert('恭喜,修改成功!');
                           top.frames['main'].location.reload();
                           top.box.close();
                       }
                   });



            return false;


        }


        function loadModifyInvoice(id) {
            jQuery.getScript('../../plus/ajaxs.ashx?a=modifyinvoice&invoiceId=' + id, function () {
                if (invoice.issuccess == 'true') {
                    $("input[name=InvoiceType][value=" + invoice.invoicetype + "]").attr("checked", true);
                    $("input[name=TitleType][value=" + invoice.titletype + "]").attr("checked", true);
                    $("#InvoiceTitle").val(invoice.companyname);
                    $("#i_ComapanyName").val(invoice.companyname);
                    $("#i_NSRSBH").val(invoice.nsrsbh);
                    $("#i_Address").val(invoice.address);
                    $("#i_Tel").val(invoice.tel);
                    $("#i_Bank").val(invoice.bank);
                    $("#i_BankNum").val(invoice.banknum);
                    $("#S_ContactMan").val(invoice.contactman);
                    $("#S_Mobile").val(invoice.mobile);
                    $("#S_Address").val(invoice.contactaddress);
                    jQuery("#i_provinceid option[value=" + invoice.provinceid + "]").attr("selected", true);
                    if (parseInt(invoice.cityid) != 0) {
                        $.get("../../plus/ajaxs.ashx", { a: "loadCityoption", pid: invoice.provinceid },
                         function (data) {
                             if (data != null && data != '') {
                                 jQuery("#showicity").show();
                                 jQuery("#i_cityid").empty().append("<option value=''>请选择---</option>").append(data).val(invoice.cityid);
                                 loadISelect();
                             } else {
                                 jQuery("#showicity").hide();
                                 jQuery("#i_cityid").empty().append("<option value=''>请选择---</option>");
                             }
                         });
                    } else {
                        jQuery("#showicity").hide();
                        jQuery("#i_cityid").empty().append("<option value=''>请选择---</option>");
                    }

                    if (parseInt(invoice.countyid) != 0) {
                        jQuery.get("../../plus/ajaxs.ashx", { a: "loadcountyoption", cid: invoice.cityid },
                        function (data) {
                            if (data != null && data != '') {
                                jQuery("#showicounty").show();
                                jQuery("#i_countyid").empty().append("<option value=''>请选择...</option>").append(data).val(invoice.countyid);
                                loadISelect();
                            } else {
                                jQuery("#showicounty").hide();
                                jQuery("#i_countyid").empty().append("<option value=''>请选择...</option>");
                            }
                        });
                    } else {
                        jQuery("#showicounty").hide();
                        jQuery("#i_countyid").empty().append("<option value=''>请选择...</option>");
                    }

                    initialInvoicePanel();

                } else {
                    alert('对不起,找不发票记录!');
                }
            });

        }


        $(function () {
            <%if (KSCMS.S("Action") == "modify")
              {
                  Response.Write("loadModifyInvoice(" + KSCMS.S("id") + ");");
              }%>
            
            initialInvoicePanel();
            $("input[name=InvoiceType]").click(function () { initialInvoicePanel(); });
            $("input[name=TitleType]").click(function () { initialInvoicePanel(); });

        });

        function initialInvoicePanel() {
            var invoiceType = $("input[name=InvoiceType]:checked").val();
            if (invoiceType == 0) {
                $("#showInvoiceTitle").show();
                $("#showZZSFP").hide();
                $("#showInvoiceAddress").hide();
            } else {
                $("#showInvoiceTitle").hide();
                $("#showZZSFP").show();
                $("#showInvoiceAddress").show();
            }

            var titleType = $("input[name=TitleType]:checked").val();
            if (titleType == 1) {
                $("#showInvoiceTitleCompany").show();
            } else {
                $("#showInvoiceTitleCompany").hide();
            }
        }

	</script>


    <style>
	.cleft{width:120px;text-align:right;color:#666;}
	.cleft font{font-weight:normal;color:#ff6600}
	.ccleft{width:120px;text-align:right;color:#777;}
	.ccleft font{font-weight:normal;color:#ff6600}
	.ttitle{font-size:14px;height:50px;line-height:50px;font-weight:bold;padding-left:10px;color:#666;}
	.ctable td{color:#666;}
	</style>
              <input type="hidden" name="invoiceId" id="invoiceId" value="<%=Utils.StrToInt(KSCMS.S("id")) %>" />
			<table width="98%" border="0" cellpadding="1" cellspacing="1" class="border">
             <tr>
			 <td colspan="2"  class="ttitle">发票信息</td>
			</tr>
			<tr>
			 <td class="cleft">发票开具方式：</td>
			 <td>
				 <label><input type="radio" value="0" name="InvoiceType" checked/>普通发票（纸质）</label>
				 <label><input type="radio" value="1" name="InvoiceType"/>增值税发票</label>
			 </td>
			</tr>
			<tbody id="showInvoiceTitle">
			<tr>
			 <td class="cleft">发票抬头：</td>
			 <td>
				 <label><input type="radio" value="0" name="TitleType" checked/>个人</label>
				 <label><input type="radio" value="1" name="TitleType"/>单位</label>
				 <span id="showInvoiceTitleCompany">
				 <input type="text"  name="InvoiceTitle" id="InvoiceTitle" class="textbox" size="30" maxlength="200"/>
				 </span>
			 </td>
			</tr>
			</tbody>
			
			<tbody id="showZZSFP")>
			<tr>
			 <td class="cleft">开票信息：</td>
			 <td>
				  <table class="cctable">
					<tr>
					 <td class="ccleft"><font color=red>*</font>单位名称：</td>
					 <td><input type="text" class="textbox" size="30" name="i_ComapanyName" id="i_ComapanyName"/></td>
					</tr>
					<tr>
					 <td class="ccleft"><font color=red>*</font>纳税人识别号：</td>
					 <td> <input type="text" class="textbox" size="30"  name="i_NSRSBH" id="i_NSRSBH"/></td>
					</tr>
					<tr>
					 <td class="ccleft"><font color=red>*</font>注册地址：</td>
					 <td> <input type="text" class="textbox" size="30"  name="i_Address" id="i_Address"/></td>
					</tr>
					<tr>
					 <td class="ccleft"><font color=red>*</font>注册电话：</td>
					 <td> <input type="text" class="textbox" size="30" name="i_Tel" id="i_Tel"/></td>
					</tr>
					<tr>
					 <td class="ccleft"><font color=red>*</font>开户银行：</td>
					 <td> <input type="text" class="textbox" size="30" name="i_Bank" id="i_Bank"/></td>
					</tr>
					<tr>
					 <td class="ccleft"><font color=red>*</font>银行帐户：</td>
					 <td> <input type="text" class="textbox" size="30"  name="i_BankNum" id="i_BankNum"/></td>
					</tr>
				  </table>
			 </td>
			</tr>
			</tbody>
			
			<tbody id="showInvoiceAddress")>
			<tr>
			 <td colspan="2"  class="ttitle">收票人地址</td>
			</tr>
			<tr>
			 <td class="cleft">收票人地址：</td>
			 <td>
				<table class="cctable">
					<tr>
					 <td class="ccleft"><font color=red>*</font>收票人姓名：</td>
					 <td><input type="text" class="textbox" size="30" name="S_ContactMan" id="S_ContactMan" maxlength="20"/></td>
					</tr>
					<tr>
					 <td class="ccleft"><font color=red>*</font>收票人手机：</td>
					 <td> <input type="text" class="textbox" size="30" name="S_Mobile" id="S_Mobile" maxlength="20"/></td>
					</tr>
					<tr>
					 <td class="ccleft"><font color=red>*</font>收票人地区：</td>
					 <td>  <asp:Label ID="LabProvince" runat="server"></asp:Label>
					  <span id="showicity" style="display:none"><select name="i_cityid" id="i_cityid" onchange="loadICounty();"></select></span>
					  <span id="showicounty" style="display:none"><select name="i_countyid" onchange="loadISelect();" id="i_countyid"></select></span></td>
					</tr>
					<tr>
					 <td class="ccleft"><font color=red>*</font>收票人地址：</td>
					 <td> <span id="showselectiarea"></span><input type="text" class="textbox" size="20" name="S_Address" id="S_Address" maxlength="120"/>
					 只需填街道地址及门牌号
					 </td>
					</tr>
				</table>
			 </td>
			</tr>
			</tbody>
			<tr>
			 <td class="cleft">&nbsp;</td><td> <input type="button" value="保存发票信息" class="button" onclick="saveInvoice(this)" /></td>
			</tr>
			</table>
		

</asp:Content>

