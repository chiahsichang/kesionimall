<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.User_SubPhoto" Codebehind="KS.UserSubPhoto.aspx.cs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="KSContent" Runat="Server">

<asp:Panel ID="addPanel" runat="server" Width="100%" Visible="true">
<KS:TopNav ID="TopNav1" runat="server" Text="我的相册管理" />
    <table width="100%" border="0" cellpadding="1" cellspacing="1" class="CTable">
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
                &nbsp;<asp:TextBox ID="txtAddTime" ReadOnly="true" CssClass="textbox" onClick="popUpCalendar(this, this, dateFormat,-1,-1)" runat="server"></asp:TextBox>

            </td>
        </tr>
        

        <tr>
            <td align="right" class="lefttd">
                <strong>专题介绍：</strong></td>
            <td class="righttd">
              <asp:TextBox ID="textContent" TextMode="multiLine" style="width:80%;height:200px;" runat="server"></asp:TextBox>
           <% Kesion.APPCode.EditorAPI.EchoEditor("editor", this.textContent.ClientID, "Basic");%>


            </td>
        </tr>

          <script>
              var post_params={"AdminLoginCode":"<%=Kesion.Publics.KSCMS.GetCookie("Admin","AdminLoginCode") %>", "adminuser":"<%=Kesion.Publics.KSCMS.GetCookie("Admin","AdminUser") %>","adminpass":"<%=Kesion.Publics.KSCMS.GetCookie("Admin","AdminPass") %>","PowerList":"<%=Kesion.Publics.KSCMS.GetCookie("Admin","PowerList") %>","usertype":"<%=Kesion.Publics.KSCMS.GetCookie("Admin","UserType") %>","CreateThumbs":1,"ChannelID":2,"AutoRename":4,"fieldid":"-1","upbyswf":1};
             </script>

        <tbody id="ContentArea">
	<tr>
		<td class="lefttd" style="text-align:right;"><strong>具体内容：</strong><br /><input type="checkbox" name="saveimg" id="saveimg" value="1" checked>当添加的是网上地址时,自动采集存图<br /></td><td class="righttd">&nbsp;<strong>展示样式：</strong><br/><table style='margin-bottom:10px; display:none;' width='80%'><tr><td><input checked type='radio' value='0' onclick="jQuery('#pagenums').hide();" name='showstyle'><img src='../../sysimg/default/p0.gif' title='当图片组只有一张图片时无效,设置此样式无效!'></td><td><input type='radio' value='1' name='showstyle' onclick="    jQuery('#pagenums').hide();"><img src='../../sysimg/default/p1.gif' title='当图片组只有一张图片时无效,设置此样式无效!'></td><td><input type='radio' value='2' name='showstyle' onclick="    jQuery('#pagenums').show();"><img src='../../sysimg/default/p2.gif' title='当图片组只有一张图片时无效,设置此样式无效!'></td><td><input type='radio' value='3' name='showstyle' onclick="    jQuery('#pagenums').show();"><img src='../../sysimg/default/p3.gif'></td></tr></table><div id="pagenums" style='margin:10px;font-weight:bold;display:none'>每页显示<input type="text" name="pagenum" id="pagenum" value="12" style="text-align:center;width:30px">张</div><link href="../../plus/swfupload/images/default.css" rel="stylesheet" type="text/css" />
		<script type="text/javascript" src="../../plus/swfupload/swfupload/swfupload.js"></script>
		<script type="text/javascript" src="../../plus/swfupload/js/handlers.js"></script>
<script type="text/javascript">
    var upload_url="../include/upload.ashx";
    var flash_url="../../plus/swfupload/swfupload/swfupload.swf";
    var flash9_url="../../plus/swfupload/swfupload/swfupload_FP9.swf";
    var modelId="2";
    var buttonstyle="line-height:22px;font-family: Helvetica, Arial, sans-serif;color:#666666;font-size: 14px; ";
	  </script>
	  <script type="text/javascript" src="../../plus/swfupload/js/addphoto.js"></script>
	    <table>
		 <tr>
		  <td><div class="pn" style="margin: -6px 0px 0 0;"><span id="spanButtonPlaceholder"></span></div></td>
		 <td><button type="button"  class="pn" onclick="OnlineCollect('content/')" style="margin: -6px 0px 0 0;"><strong>网上采集</strong></button><button type="button"  class="pn" onClick="AddTJ('content/');" style="margin: -6px 0px 0 0;"><strong>图片库...</strong></button></td>
		 </tr>
		</table>

		<label><input type="checkbox" name="AddWaterFlag" value="1" onClick="SetAddWater(this)" checked="checked"/>图片添加水印</label>
		<div id="divFileProgressContainer"></div>
	    <div id="thumbnails"></div>
		<input type='hidden' name='PicUrls' runat="server" id='PicUrls'> </td>
	</tr>
</tbody>

        <tr>
            <td align="right" class="lefttd">
                <strong>缩 略 图：</strong></td>
            <td class="righttd">
                &nbsp;<asp:TextBox ID="txtPhotoUrl" CssClass="textbox" runat="server" Width="300px"></asp:TextBox>
                &nbsp;<input type="button" class="button" onclick="SelectFiles('<%=this.txtPhotoUrl.ClientID%>', 2);" value="选择图片" />
                
                </td>
        </tr>
 
        <asp:HiddenField runat="server" ID="modify" Value="0" />
        <asp:HiddenField runat="server" ID="userName" Value="admin" />
        <asp:HiddenField runat="server" ID="userId"  Value="0"/>
        <tr>
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
                    jQuery.get("../../plus/ajaxs.ashx", { a: "GetTags", text: text },
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

            if (jQuery('#<%=this.PicUrls.ClientID%>').val() == '' ) {
                KesionJS.Alert('请上传图片集!', null); return false;
            }

            if (jQuery("#<%=this.txtPhotoUrl.ClientID %>").val() == '') {
                KesionJS.Alert('选择缩略图!', 'jQuery("#<%=this.txtPhotoUrl.ClientID %>").focus()');
                return false
            }
            

            if (!is_number(jQuery("#<%=this.txtFund.ClientID %>").val())) {
                KesionJS.Alert('阅读资金必须为整数!', 'jQuery("#<%=this.txtFund.ClientID %>").focus()');
                return false
            }

            return CheckExterior();
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

