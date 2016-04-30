<%@ Page Language="C#" EnableEventValidation="false" EnableViewState="false"  ValidateRequest="false" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.Admin.Shop.Admin_Shop" Title="添加/编辑商品" Codebehind="KS.Shop.aspx.cs" %>
<%@ Import Namespace="Kesion.BLL" %>
<%@ Import Namespace="Kesion.Publics" %>
<%@ Import Namespace="Kesion.Cache" %>
<asp:Content ID="Content1" ContentPlaceHolderID="KSContent" Runat="Server">
     <link type="text/css" href="../../ks_inc/date/jquery-ui-1.8.16.custom.css" rel="stylesheet" />	
     <script src="../../ks_inc/DatePicker/WdatePicker.js"></script>
     <script src="../../ks_inc/weiboApi.js"></script>
        <script>
        function GetKeyTags() {
            var text = escape(jQuery('#Title').val());
            if (text != '') {
                jQuery('#KeyTags').val('请稍等,系统正在自动获取tags...').attr("disabled", true);
                jQuery.get("../../plus/ajaxs.ashx", { a: "GetTags", text: text },
				  function(data) { jQuery('#KeyTags').val(unescape(data)).attr("disabled", false); });
            } else { KesionJS.Alert('对不起,请先输入标题!',"jQuery('#Title').focus();"); }
        }
        function CheckProID() {
            if (jQuery('#ProID').val() == '') {
                jQuery('#ProID').focus(); KesionJS.Alert('请输入商品编号！', null); ;
                return false;
            }
            jQuery.get("../../plus/ajaxs.ashx", { a: "CheckProID", id: '<%=ContentID %>', proid: jQuery('#ProID').val() },
				  function (data) {
				      if (data == 'true') {
				          KesionJS.Alert('对不起，该编号不可用，已存在！');
				      } else {
				          KesionJS.Alert('恭喜，该商品编号未使用过！');
				      }
				  });


        }
        function Changes() {
            if (jQuery('#TurnUrlTF')[0].checked == true) { jQuery('#ContentArea').hide();jQuery('#TurnUrl').attr('disabled', false); }
            else {jQuery('#ContentArea').show(); jQuery('#TurnUrl').attr('disabled', true); }
        }

    </script>

    <KS:TopNav ID="TopNav1" runat="server" />
	
        <KS:ModelJS ID="ModelJS1" runat="server" />


		<div class="tab-page" id="ContentPanel<%=ChannelID %>">
         <script type="text/javascript">
           var tabPane1 = new WebFXTabPane( document.getElementById( "ContentPanel<%=ChannelID %>" ), 1 )
         </script>
            

            <asp:Repeater ID="RepeatFieldGroup" runat="server" OnItemDataBound="RepeatFieldGroup_ItemDataBound">
               <ItemTemplate>
                     <div class="tab-page" id='tab<%# Eval("ID") %>'>
		              <h2 class="tab"><%# Eval("GroupName") %></h2>
			            <script type="text/javascript">
			                tabPane1.addTabPage( document.getElementById( "tab<%# Eval("ID") %>" ) );
			            </script>
                               <table style="width:100%;" cellpadding="2" cellspacing="1" class="CTable">
                               <asp:Repeater ID="Repeater1" runat="server">
                                     <ItemTemplate>
                                         <KS:Fields ID="Fields1" ModelID='<%# ChannelID%>' FieldID='<%# Eval("Name")%>' FieldAlias='<%# Eval("FieldAlias")%>' FieldType='<%# Eval("FieldType")%>'
                                         Disabled='<%# Eval("Disabled")%>' FieldWidth='<%# Eval("FieldWidth")%>' FieldHeight='<%# Eval("FieldHeight")%>' Options='<%# Eval("options")%>'
                                         Tips='<%# Eval("Tips")%>' DefaultValue='<%# Eval("DefaultValue")%>' ToolBar='<%# Eval("ToolBar")%>' InputItem='<%# Eval("InputItem") %>' MustFillItem='<%# Eval("MustFillItem")%>'  runat="server">
                                         </KS:Fields>
                                     </ItemTemplate>
                                    </asp:Repeater>
                                </table>
                         </div>
               </ItemTemplate>
            </asp:Repeater>



		
		 <div class="tab-page" id="tab1">
		  <h2 class="tab">图片选项</h2>
			<script type="text/javascript">
						 tabPane1.addTabPage( document.getElementById( "tab1" ) );
			</script>
			<script type="text/javascript">
           function addColor(obj)
            {
                              var src  = obj.parentNode.parentNode;
                              var idx  = rowindex(src);
                              var tbl  = document.getElementById('color-table');
                              var row  = tbl.insertRow(idx + 1);
                              var cell = row.insertCell();
                              //cell.innerHTML = src.cells[0].innerHTML.replace(/(.*)(addColor)(.*)(\[)(\+)/i, "$1removeColor$3$4-");
                              cell.innerHTML='<a href="javascript:;" onclick="removeColor(this)">[-]</a> <input type="hidden" name="colorid" value="0" /> <input type="text" name="colorName" value="" />';
                              cell=row.insertCell();
                              cell.className='showprice';
                              if (parseInt(jQuery("input[name=GroupPrice][checked=true]").val())==3){
                               cell.style.display='none';
                              }
                              cell.innerHTML=src.cells[1].innerHTML;
                              cell=row.insertCell();
                              cell.innerHTML=src.cells[2].innerHTML;
            }
           function removeColor(obj)
            {
                              var row = rowindex(obj.parentNode.parentNode);
                              var tbl = document.getElementById('color-table');

                              tbl.deleteRow(row);
           }
             
            var Browser = new Object();
            Browser.isMozilla = (typeof document.implementation != 'undefined') && (typeof document.implementation.createDocument != 'undefined') && (typeof HTMLDocument != 'undefined');
            Browser.isIE = window.ActiveXObject ? true : false;
            Browser.isFirefox = (navigator.userAgent.toLowerCase().indexOf("firefox") != - 1);
            Browser.isSafari = (navigator.userAgent.toLowerCase().indexOf("safari") != - 1);
            Browser.isOpera = (navigator.userAgent.toLowerCase().indexOf("opera") != - 1);
            function rowindex(tr)
            {
              if (Browser.isIE)
              {
                return tr.rowIndex;
              }
              else
              {
                table = tr.parentNode.parentNode;
                for (i = 0; i < table.rows.length; i ++ )
                {
                  if (table.rows[i] == tr)
                  {
                    return i;
                  }
                }
              }
            } 
            //检查录入价格 
            function regInput(obj, reg, inputStr)
			{
				var docSel = document.selection.createRange()
				if (docSel.parentElement().tagName != "INPUT")    return false
				oSel = docSel.duplicate()
				oSel.text = ""
				var srcRange = obj.createTextRange()
				oSel.setEndPoint("StartToStart", srcRange)
				var str = oSel.text + inputStr + srcRange.text.substr(oSel.text.length)
				return reg.test(str)
			}


            function taxToggle() {
                var checkrad = jQuery("#<%=this.RdbTaxTF.ClientID %> :radio[checked]").val();
                if (checkrad == "0") {
                    jQuery("#taxShow").show();
                } else {
                jQuery("#taxShow").hide();
                }
            }    
           jQuery(document).ready(function(){
              taxToggle();
           });  
  			</script>
    <table style="width:100%;margin:0 auto;" cellpadding="2" cellspacing="1" class="CTable">
     <tr>
	     <td class="lefttd" style="text-align:right;"><strong>封面主图：</strong></td>
         <td class="righttd">
             <table border="0" width="100%">
                 <tr>
                     <td><input type="hidden" name="BigPhoto" id="BigPhoto" value="<%=BigPhotoUrl %>" />
                     <input  class="textbox" type="text" id="DefaultPic" name="DefaultPic" style="width:350px" value="<%=ThumbPhotoUrl %>">&nbsp;<input type="button" class="button" onclick="SelectFiles('DefaultPic',1);" value="选择图片">&nbsp;<input class="button" type='button' name='Submit' value='远程抓取图片...' onclick="    top.openWin('抓取远程图片','include/SaveBeyondfile.aspx?ChannelID=<%=ChannelID%>&FieldID=DefaultPic',false,500,150);">
                     <table border="0" width="100%" cellspacing="0" cellpadding="0">
                  <tr>
                   <td width="70">上传图片：</td><td><iframe src="../include/UpLoad.aspx?width=<%=MyCache.GetCacheShopConfig(5) %>&height=<%=MyCache.GetCacheShopConfig(6) %>&FieldID=DefaultPic&ChannelID=<%=ChannelID %>" marginheight="0" marginwidth="0"  width="100%" height="30" frameborder="0" scrolling="no"></iframe></td>
                 </tr>
             </table>   

                     </td>
                     <td>
                     <img src='<%=ThumbPhotoUrl %>' id='showDefaultPic' width='100' height='60' onerror="this.src='../../sysimg/nopic.gif';">
                     </td>
                 </tr>
             </table>
              

        </td>
      </tr>



     <tr>
      <td class="lefttd" align="right" valign="top"><strong>组图展示：</strong></td>
      <td class="righttd">


      <link href="../../plus/swfupload/images/default.css" rel="stylesheet" type="text/css" />
		<script type="text/javascript" src="../../plus/swfupload/swfupload/swfupload.js"></script>
		<script type="text/javascript" src="../../plus/swfupload/js/handlers.js"></script>
<script type="text/javascript">
    var post_params={"AdminLoginCode":"<%=Kesion.Publics.KSCMS.GetCookie("Admin","AdminLoginCode") %>", "adminuser":"<%=Kesion.Publics.KSCMS.GetCookie("Admin","AdminUser") %>","adminpass":"<%=Kesion.Publics.KSCMS.GetCookie("Admin","AdminPass") %>","PowerList":"<%=Kesion.Publics.KSCMS.GetCookie("Admin","PowerList") %>","usertype":"<%=Kesion.Publics.KSCMS.GetCookie("Admin","UserType") %>","CreateThumbs":1,"ThumbsWidth":<%=Utils.StrToInt(MyCache.GetCacheShopConfig(5)) %>,"ThumbsHeight":<%=Utils.StrToInt(MyCache.GetCacheShopConfig(6)) %>,"ChannelID":<%=ChannelID%>,"AutoRename":4,"addwatermark":"<%=MyCache.GetCacheShopConfig(10)%>","fieldid":"-1","upbyswf":1};
    var upload_url="../include/upload.ashx";
    var flash_url="../../plus/swfupload/swfupload/swfupload.swf";
    var flash9_url="../../plus/swfupload/swfupload/swfupload_FP9.swf";
    var modelId="<%=ChannelID%>";
    var buttonstyle="line-height:22px;font-family: Helvetica, Arial, sans-serif;color:#ffffff;font-size: 12px; ";
	  </script>
	  <script type="text/javascript" src="../../plus/swfupload/js/addphoto.js"></script>
	    <table>
		 <tr>
		  <td><div class="button" style="margin: -3px 0px 0 0;"><span id="spanButtonPlaceholder"></span></div></td>
		 <td>&nbsp;<button type="button"  class="button" onclick="OnlineCollect('content/')" style="margin: -6px 0px 0 0;">网上采集</button> <button type="button"  class="button" onClick="AddTJ('content/');" style="margin: -6px 0px 0 0;">图片库...</button></td>
		 </tr>
		</table>

		<label><input type="checkbox" name="AddWaterFlag" value="1" onClick="SetAddWater(this)"<%=MyCache.GetCacheShopConfig(10)=="1"?@" checked=""checked""":string.Empty %>/>图片添加水印</label>
		<div id="divFileProgressContainer"></div>
	    <div id="thumbnails"></div>
		<input type='hidden' name='PicUrls' id='PicUrls'>

          <span style="display:none">
          <asp:Label ID="LabImages" runat="server"></asp:Label>
          </span>
          <script>
              $(document).ready(function(){
                  var pics=$("#<%=this.LabImages.ClientID%>").html();
                  if (pics!=''){
                      var picArr=pics.split('|||');
                      for(var i=0;i<picArr.length;i++){
                          var ppArr=picArr[i].split('|');
                          addImage(ppArr[3],ppArr[2],ppArr[1],ppArr[0]);
                      }
                  }
                  $("#thumbnails").find(".intro").blur(function(){
                      setProIntro($(this).attr("picId"),$(this).val());
                  });
              });
              //删除相册图片
              function DelUpFiles(pid,picId){
                  jQuery('#ajaxmsg',window.parent.document).toggle();
                  jQuery.ajax({
                      type: "POST",
                      url: "KS.Shopajaxs.aspx",
                      data: "action=del&id="+picId+"&channelid=<%=ChannelID%>&infoid=<%=ContentID%>",
                      success: function(data){
                          jQuery('#ajaxmsg',window.parent.document).toggle();
                          if (data=="success"){
                              jQuery("#thumbshow"+pid).remove();
                          }else{
                              KesionJS.Alert('删除操作失败!',null);
                          }
                      }
                  });
              }
              //更新相册文字
              function setProIntro(id,val){
                  jQuery('#ajaxmsg',window.parent.document).toggle();
                  jQuery.ajax({
                      type: "POST",
                      url: "KS.Shopajaxs.aspx",
                      data: "action=update&id="+id+"&intro="+val,
                      success: function(data){
                          jQuery('#ajaxmsg',window.parent.document).toggle();
                      }
                  });
              }
          </script>





      </td>
     </tr>
        
        <tr>
            <td align="right" class="lefttd">
                <strong>审核状态：</strong></td>
            <td class="righttd">
                <asp:RadioButtonList ID="Verify" runat="server" RepeatDirection="Horizontal">
                    <asp:ListItem Value="2">草稿</asp:ListItem>
                    <asp:ListItem Value="0">待审核</asp:ListItem>
                    <asp:ListItem Selected="True" Value="1">已审核</asp:ListItem>
                </asp:RadioButtonList></td>
        </tr>
        <tr>
            <td align="right" class="lefttd">
                <strong>绑定模板：</strong></td>
            <td class="righttd">
             <div id="templateselect" runat="server">
            <input type='radio' name='templateflag' onclick='KesionJS.GetTemplateArea(this.value);' value='2' checked="checked" />继承栏目设定
            <input type='radio' onclick='KesionJS.GetTemplateArea(this.value);' name='templateflag' value='1'/>自定义
            </div>
            <div id='templatearea'<%=KSCMS.S("Action")=="Edit"?"":"style='display:none'" %>>
            Web模板：<asp:TextBox CssClass="textbox" Width="300px" ID="TemplateFile" runat="server"></asp:TextBox>
                <input class="button" onclick="SelectTemplate('<%=this.TemplateFile.ClientID %>');"
                    onmouseout="this.className='button';" onmouseover="this.className='button_on';"
                    type="button" value="选择模板..." />
                    <div<%=MyCache.GetCacheConfig(72)=="0"?" style='display:none'":"" %>>3G 模板：<asp:TextBox CssClass="textbox" Width="300px" ID="Template3GFile" runat="server"></asp:TextBox>
                <input class="button" onclick="SelectTemplate('<%=this.Template3GFile.ClientID %>');"
                    onmouseout="this.className='button';" onmouseover="this.className='button_on';"
                    type="button" value="选择模板..." />
                    </div>
              </div> 
              </div> 
            </td>
        </tr>
        <tr>
            <td align="right" class="lefttd">
                <strong>文 件 名：</strong>
            </td>
            <td class="righttd">
             <div id="filenameselect" runat="server">
            <input type='radio' value='0' name='filetype' onclick='KesionJS.GetFileNameArea(this.value);' checked="checked"/>自动生成 
            <input type='radio' value='1' name='filetype' onclick='KesionJS.GetFileNameArea(this.value);' />自定义
             </div>
            <div id='filearea'<%=KSCMS.S("Action")=="Edit"?"":"style='display:none'" %>>
                <asp:TextBox CssClass="textbox" ID="FileName" runat="server"></asp:TextBox>
                <asp:HiddenField ID="HidFileName" runat="server" />
                <span style="color:Red">可带路径,如 help.html,news/news_1.shtml等</span>
            </div>   
            </td>
        </tr>
    </table>
			
			
		</div>
		
		
		<div class="tab-page" id="tab2">
		  <h2 class="tab">价格&规格&限购</h2>
			<script type="text/javascript">
						 tabPane1.addTabPage( document.getElementById( "tab2" ) );
			</script>
            <table style="width:100%;margin:0 auto;" cellpadding="2" cellspacing="1" class="CTable">
           <tr>
           <script>
               jQuery(document).ready(function() {
                   showProductType();
                   showFront();
               });
               function showProductType()
               { 
                   var checkrad = jQuery("#<%=this.RdbProductType.ClientID %> :radio[checked]").val();
                   $("#limitBuyShow").hide();
                   $("#showscore").hide();
                   $("#GroupPriceArea").hide();
                   $("#changeBuyShow").hide();
                   $("#showLimitTime").hide();
                   $("#JinJiaShow").hide();
                   $("#showOtherLimit").show();
                   $("#showGroupPriceRate").hide();
                   $("#showProSpecial").show();
                   $("#showPayType").show();
                   switch (checkrad){
                       case "0":
                           $("#showGroupPriceRate").show();
                           break;
                       case "1":
                       case "2":
                           if (checkrad=="1"){
                               $("#showLimitTime").show();
                           }
                           jQuery("#limitBuyShow").show();
                           jQuery('#ajaxmsg',window.parent.document).toggle();
                           jQuery("#limitBuyShow").css("display","");
                           jQuery.ajax({
                               type: "POST",
                               url: "KS.Shopajaxs.aspx",
                               data: "action=limitbuytask&tasktype="+checkrad,
                               success: function(data){
                                   jQuery("#LimitBuyTaskID").empty();
                                   jQuery("#LimitBuyTaskID").append(data);
                                   jQuery('#ajaxmsg',window.parent.document).toggle();
                                   jQuery('#LimitBuyTaskID').val(<%=LimitBuyTaskID %>);
                                   }
                             });

                           break;
                       case "3":
                           $("#showscore").show();
                           break;
                       case "4":
                           $("#GroupPriceArea").show();
                           break;
                       case "5":
                           $("#changeBuyShow").show();
                           break;
                       case "6":
                           $("#JinJiaShow").show();
                           $("#showOtherLimit").hide();
                           $("#showProSpecial").hide(); //竞价不支持规格
                           $("#showPayType").hide();
                           break;
                   }
               
                   }
               </script>
            <td align="right" class="lefttd">
                <strong>商品价格：</strong></td>
            <td class="righttd">
                 <div>参考价：<%=MyCache.GetCurrencySymbol %><asp:TextBox ID="TxtPrice" CssClass="textbox" Text="0" runat="server" onKeyPress= "return regInput(this,/^\d*\.?\d{0,2}$/,String.fromCharCode(event.keyCode))" onpaste="return regInput(this,/^\d*\.?\d{0,2}$/,window.clipboardData.getData('Text'))" ondrop="return regInput(this,    /^\d*\.?\d{0,2}$/,event.dataTransfer.getData('Text'))" Width="60px" style="text-align:center"></asp:TextBox>
                  <%=MyCache.GetCurrencyUnit %>&nbsp;<span class="tips">显示市场参考价格，与实际交易无关！</span></div>
               <div><%=MyCache.GetSalesPriceName %>：<%=MyCache.GetCurrencySymbol %><asp:TextBox CssClass="textbox" Text="0" ID="TxtPrice_Member" runat="server" onKeyPress= "return regInput(this,/^\d*\.?\d{0,2}$/,String.fromCharCode(event.keyCode))" onpaste="return regInput(this,/^\d*\.?\d{0,2}$/,window.clipboardData.getData('Text'))" ondrop="return regInput(this,    /^\d*\.?\d{0,2}$/,event.dataTransfer.getData('Text'))" style="width:60px;text-align:center"/> <%=MyCache.GetCurrencyUnit %>&nbsp;<span class="tips">如果没有设置规格所有会员都以此价格为准，否则以规格里设置的价格计算。</span></div>
              </td>
           </tr>
           <tr>
            <td align="right" class="lefttd">
                <strong>商品促销：</strong></td>
            <td class="righttd">
               <asp:RadioButtonList ID="RdbProductType" onclick="showProductType();" runat="Server" RepeatDirection="Horizontal">
                <asp:ListItem Value="0" Selected="True">普通商品</asp:ListItem>
                <asp:ListItem Value="1">限时抢购</asp:ListItem>
                <asp:ListItem Value="2">限量抢购</asp:ListItem>
                <asp:ListItem Value="3">积分兑换</asp:ListItem>
                <asp:ListItem Value="4">按用户组定价</asp:ListItem>
                <asp:ListItem Value="5">换购商品</asp:ListItem>
                <asp:ListItem Value="6">竞价</asp:ListItem>
               </asp:RadioButtonList>
               <div id="limitBuyShow" style="display:none" class="message">
                抢购任务:<select name="LimitBuyTaskID" id="LimitBuyTaskID"></select><a href="KS.ShopLimitBuy.aspx" onclick="return(confirm('本页面的数据将丢失,确定离开本页面吗?'))">抢购任务管理</a><br />
                <div id="showLimitTime" style="display:none">抢购时间段：<asp:TextBox ID="TxtBeginDate" runat="server" onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'});" Width="200" CssClass="textbox Wdate" />至<asp:TextBox Width="200" onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'});" ID="TxtEndDate" runat="server" CssClass="textbox Wdate" /><span class="tips">Tips:只有在指定时间段内才能购买。</span></div>
                抢 购 价:<asp:TextBox Text="10" CssClass="textbox" ID="TxtLimitBuyPrice" onKeyPress= "return regInput(this,/^\d*\.?\d{0,2}$/,String.fromCharCode(event.keyCode))" onpaste="return regInput(this,/^\d*\.?\d{0,2}$/,window.clipboardData.getData('Text'))" ondrop="return regInput(this,    /^\d*\.?\d{0,2}$/,event.dataTransfer.getData('Text'))" style="width:60px;text-align:center" runat="server"></asp:TextBox><%=MyCache.GetCurrencyUnit %>&nbsp;&nbsp;<span class="tips">如果有启用规格属性，则按规格里设置的价格计算。</span><br />
                抢购数量:<asp:TextBox Text="100" CssClass="textbox" ID="TxtLimitBuyAmount" onKeyPress= "return regInput(this,/^\d*\.?\d{0,2}$/,String.fromCharCode(event.keyCode))" onpaste="return regInput(this,/^\d*\.?\d{0,2}$/,window.clipboardData.getData('Text'))" ondrop="return regInput(this,    /^\d*\.?\d{0,2}$/,event.dataTransfer.getData('Text'))" style="width:60px;text-align:center" runat="server"></asp:TextBox>件&nbsp;&nbsp;<span class="tips">设置允许让抢购的商品数,如果有启用规格属性，则按规格里设置的库存计算。</span>
               </div>

              <div id="showscore" style="display:none" class="message">
                  兑换积分：<asp:TextBox ID="TxtChangeScore" Text="0" runat="server" CssClass="textbox" onKeyPress= "return regInput(this,/^\d*\.?\d{0,2}$/,String.fromCharCode(event.keyCode))" onpaste="return regInput(this,/^\d*\.?\d{0,2}$/,window.clipboardData.getData('Text'))" ondrop="return regInput(this,    /^\d*\.?\d{0,2}$/,event.dataTransfer.getData('Text'))" style="width:60px;text-align:center"></asp:TextBox>分
                  <div class="tips">
                      <%=MyCache.GetSalesPriceName %>不为“0”，表示本商品将可以用现金+积分的形式兑换。
                  </div>
              </div>
              <div id='GroupPriceArea' style="display:none" class="message">
                  <div class="tips">Tips:如果启用商品规格属性，则以商品规格设置的价格为准计算销售价。</div>
                  <asp:Label ID="LabGroupPrice" runat="server"></asp:Label></div>

              <div id="changeBuyShow" style="display:none" class="message">
                订单满足金额：<%=MyCache.GetCurrencySymbol %><asp:TextBox CssClass="textbox" ID="TxtChangeBuyNeedPrice" onKeyPress= "return regInput(this,/^\d*\.?\d{0,2}$/,String.fromCharCode(event.keyCode))" onpaste="return regInput(this,/^\d*\.?\d{0,2}$/,window.clipboardData.getData('Text'))" ondrop="return regInput(this,    /^\d*\.?\d{0,2}$/,event.dataTransfer.getData('Text'))" runat="server" Width="60px" style="text-align:center"></asp:TextBox><%=MyCache.GetCurrencyUnit %> 
                换购价格：<%=MyCache.GetCurrencySymbol %><asp:TextBox CssClass="textbox" ID="TxtChangeBuyPresentPrice" onKeyPress= "return regInput(this,/^\d*\.?\d{0,2}$/,String.fromCharCode(event.keyCode))" onpaste="return regInput(this,/^\d*\.?\d{0,2}$/,window.clipboardData.getData('Text'))" ondrop="return regInput(this,    /^\d*\.?\d{0,2}$/,event.dataTransfer.getData('Text'))" runat="server" Width="60px" style="text-align:center"></asp:TextBox><%=MyCache.GetCurrencyUnit %>
                <br />
                 <span class="tips">Tips:当购买商品总金额>=订单满足金额时,可以根据换购价格得到此商品。</span>
                </div>

                 <div id="JinJiaShow" style="display:none" class="message">
                      起拍价格：<%=MyCache.GetCurrencySymbol %><asp:TextBox Text="1" CssClass="textbox" ID="TxtJinJiaMoney" onKeyPress= "return regInput(this,/^\d*\.?\d{0,2}$/,String.fromCharCode(event.keyCode))" onpaste="return regInput(this,/^\d*\.?\d{0,2}$/,window.clipboardData.getData('Text'))" ondrop="return regInput(this,    /^\d*\.?\d{0,2}$/,event.dataTransfer.getData('Text'))" runat="server" Width="60px" style="text-align:center"></asp:TextBox><%=MyCache.GetCurrencyUnit %> 
                     <span class="tips">Tips:如设置为“1”，表示1元起拍。最小拍价单位为“1”,不支持小数。</span>
                     <br />
                      竞价时间段：<asp:TextBox ID="TxtJinJiaBeginDate" runat="server" onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'});" Width="200" CssClass="textbox Wdate" />至<asp:TextBox Width="200" onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'});" ID="TxtJinJiaEndDate" runat="server" CssClass="textbox Wdate" /><span class="tips">Tips:只有在指定时间段内才能竞价。</span>
                       <br />
                      可供竞价商品数量：<asp:TextBox Text="1" CssClass="textbox" ID="TxtJinJiaNum" onKeyPress= "return regInput(this,/^\d*\.?\d{0,2}$/,String.fromCharCode(event.keyCode))" onpaste="return regInput(this,/^\d*\.?\d{0,2}$/,window.clipboardData.getData('Text'))" ondrop="return regInput(this,    /^\d*\.?\d{0,2}$/,event.dataTransfer.getData('Text'))" style="width:60px;text-align:center" runat="server"></asp:TextBox>件
                     <br />冻结保证金：<%=MyCache.GetCurrencySymbol %><asp:TextBox Text="10" CssClass="textbox" ID="TxtJinJiaBZJ" onKeyPress= "return regInput(this,/^\d*\.?\d{0,2}$/,String.fromCharCode(event.keyCode))" onpaste="return regInput(this,/^\d*\.?\d{0,2}$/,window.clipboardData.getData('Text'))" ondrop="return regInput(this,    /^\d*\.?\d{0,2}$/,event.dataTransfer.getData('Text'))" runat="server" Width="60px" style="text-align:center"></asp:TextBox><%=MyCache.GetCurrencyUnit %> 
                     <br />拍卖即将结束，如果有新的出价，系统会自动延长<asp:TextBox Text="5" CssClass="textbox" ID="TxtJinJiaTCTime"  ondrop="return regInput(this,    /^\d*\.?\d{0,2}$/,event.dataTransfer.getData('Text'))" runat="server" Width="60px" style="text-align:center"></asp:TextBox> 分钟
                     <br />状态：<asp:RadioButtonList ID="RdbJingJiaStatus" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow">
                               <asp:ListItem Value="0" Selected="True">正常</asp:ListItem>
                         <asp:ListItem Value="1">已结束</asp:ListItem>
                              </asp:RadioButtonList>
                </div>

            </td>
        </tr>


        <tr id="showProSpecial">
            <td align="right" class="lefttd">
                <strong>商品规格：</strong></td>
            <td class="righttd">
            <style type="text/css">
					  .atcs li{padding:2px;float:left;border:1px #efefef solid;background:#FFFFF6;margin-right:6px;margin-bottom:2px;width:90px;line-height:30px;height:30px;overflow:hidden;}
					  .ttt{background:#FFFFF6;border:1px #F9C943 solid;width:50px;height:20px;line-height:20px;text-align:center}
			 </style>

         

             <script type="text/javascript">
					  var hasSpecification=false;
					  function getSpecification(){
					   var tid=jQuery("#ClassID option:selected").val();
					   if (tid=='0'){
					    alert('请先选择商品分类!');
						return false;
					   }
					   jQuery(parent.document).find("#ajaxmsg").toggle();
                       jQuery.get("KS.ShopAjaxs.aspx",{action:"getspecification",id:<%=Utils.StrToInt(KSCMS.S("ID"))%>,channelid:<%=ChannelID%>,classid:tid},function(d){ 
					        var r=d.split('|');
							if (r[0]=='error'){alert(r[1]);return;}else{hasSpecification=true;jQuery("#cartattr").html(d);}
							jQuery(parent.document).find("#ajaxmsg").toggle();
						});
					  }




                 //table合并单元格,上下行来比较 
                 function merge(){ 
                     var totalCols = $("#specialtable").find("tr:eq(0)").find("td").length; 
                     var totalRows = $("#specialtable").find("tr").length; 
                     for(var col=$(".atcs").length-1;col>=1;col--){ 
                         spanNum =1; 
                         startCell = $("#specialtable").find("tr").eq(totalRows-1).find("td").eq(col); 
                         for(var row = totalRows-1;row>=1;row--){ 
                             targetCell = $("#specialtable").find("tr").eq(row-1).find("td").eq(col); 
                             if(startCell.text() == targetCell.text() && startCell.text()!=""){ 
                                 spanNum++; 
                                 targetCell.attr("rowSpan",spanNum); 
                                 startCell.attr("style","display:none"); 
                                 // startCell.attr("style","display:none"); 
                             }else{ 
                                 spanNum =1; 
                             } 
                             startCell = targetCell; 
                         } 
                     } 
                     for(var j=$(".atcs").length-1;j>=1;j--){ 
                         for(var i=totalRows-1;i>=1;i--){ 
                             cell = $("#specialtable").find("tr").eq(i).find("td").eq(j); 
                             if(cell.attr("style")!=undefined){ 
                                 if(cell.attr("style")=="display:none"){ 
                                     cell.remove(); 
                                 } 
                             } 
                         } 
                     } 
                 } 

                 //table排序
                 jQuery.fn.sortElements = (function(){
                     var sort = [].sort;
                     return function(comparator, getSortable) {
                         getSortable = getSortable || function(){return this;};
                         var placements = this.map(function(){
                             var sortElement = getSortable.call(this),
                                 parentNode = sortElement.parentNode,
                                 // Since the element itself will change position, we have
                                 // to have some way of storing it's original position in
                                 // the DOM. The easiest way is to have a 'flag' node:
                                 nextSibling = parentNode.insertBefore(
                                     document.createTextNode(''),
                                     sortElement.nextSibling
                                 );
            
                             return function() {
                
                                 if (parentNode === this) {
                                     throw new Error(
                                         "You can't sort elements if any one is a descendant of another."
                                     );
                                 }
                                 // Insert before flag:
                                 parentNode.insertBefore(this, nextSibling);
                                 // Remove flag:
                                 parentNode.removeChild(nextSibling);
                
                             };
                         });
                         return sort.call(this, comparator).each(function(i){
                             placements[i].call(getSortable.call(this));
                         });
                     };
                 })();

                 //调用排序
                 function tableSort(){
                     var table = $('#specialtable');//table的id
                     $('#sort_header').each(function(){
                         var th = $(this),
                           thIndex = th.index(),
                           inverse = false;
                         table.find('#alist td').filter(function(){
                             return $(this).index() === thIndex;
                         }).sortElements(function(a, b){
                             return $.text([a]) > $.text([b]) ?
                               inverse ? -1 : 1
                               : inverse ? 1 : -1;
                         }, function(){
                             return this.parentNode; 
                         });
                         inverse = !inverse;
                     });
                 }

                 jQuery.fn.ResetTable=function(){
                     $("tr",this).each(function(trindex,tritem){
                         $(tritem).find("td").each(function(tdindex,tditem){
                             var Rcount=$(tditem).attr("rowspan");
                             var Ccount=$(tditem).attr("colspan");
                             var newtd="<td class='Ctd'>"+$(tditem).text()+"</td>";
                             if(Rcount>1){
                                 var parent=$(tditem).parent("tr")[0];
                                 while(Rcount >1){
                                     $(parent).next().find("td").eq(tdindex).before(newtd);
                                     parent=$(parent).next();
                                     Rcount--;
                                 }
                                 $(tditem).removeAttr("rowspan");
                             }
     
                             if(Ccount>1){
                                 while(Ccount>1){
                                     $(tditem).after(newtd);
                                     Ccount--;
                                 }
                                 $(tditem).removeAttr("colspan");
                             }
     
                         });
    
                     });
                 }
                
				 function delrowajax(r,id){
					   if (confirm('此操作不可逆，确定删除该货号吗？')){
					   jQuery.get("KS.ShopAjaxs.aspx",{action:"deletespecificationproitem",id:id},function(d){ 
					        var r=d.split('|');
							if (r[0]=='error'){lert(r[1]);return;}
						});
						delrow(r);
						}
					  }

				 function additemno(c){
					    var row=parseInt(jQuery("#totalrow").val())+1;
						var imgstr1='';
						if (jQuery("#attr0img"+(row-1)+"")[0]!=undefined){imgstr1="<img style='cursor:pointer' id='showattr0img"+row+"' src='../../sysimg/nopic.gif' width='25' title='选择图片' height='25' align='absmiddle' onclick=\"SelectFiles('attr0img"+row+"',<%=ChannelID%>);\"/><input type='hidden' name='attr0img"+row+"' id='attr0img"+row+"' value='/sysimg/nopic.gif'/>";}else{imgstr1='';}
				         var str='<tr id="row'+row+'"><td class="Ctd" style="text-align:center" nowrap><input type="hidden" name="specialids" value="'+row+'"/><input style="width:80px" value="NO'+row+'" type="text" name="aitemno'+row+'" id="aitemno'+row+'" size="10" class="textbox"/></td><td style="text-align:center" class="Ctd" nowrap>'+imgstr1+' <input style="width:80px" type="text" name="attr0'+row+'" class="ttt" size="8" value=""/></td>';
						if (c>=1){
						    if (jQuery("#attr1img"+(row-1)+"")[0]!=undefined){imgstr1="<img style='cursor:pointer' id='showattr1img"+row+"' src='../../sysimg/nopic.gif' width='25' title='选择图片' height='25' align='absmiddle' onclick=\"SelectFiles('attr1img"+row+"',<%=ChannelID%>);\"/><input type='hidden' name='attr1img"+row+"' id='attr1img"+row+"' value='/sysimg/nopic.gif'/>";}else{imgstr1='';}
						    str+='<td style="text-align:center" class="Ctd" nowrap>'+imgstr1+' <input type="text" style="width:80px" size="8" name="attr1'+row+'" class="ttt" value=""/></td>';
						 if (c>=2){
						     if (jQuery("#attr2img"+(row-1)+"")[0]!=undefined){imgstr1="<img style='cursor:pointer' id='showattr2img"+row+"' src='../../sysimg/nopic.gif' width='25' title='选择图片' height='25' align='absmiddle'/><input type='hidden' name='attr2img"+row+"' id='attr2img"+row+"' value='/sysimg/nopic.gif' onclick=\"SelectFiles('attr2img"+row+"',<%=ChannelID%>);\"/>";}else{imgstr1='';}
						     str+='<td style="text-align:center" class="Ctd" nowrap>'+imgstr1+' <input type="text" style="width:80px"  size="8" name="attr2'+row+'" class="ttt" value=""/></td>';
						 }
						}
						str+=rowstr(row,true);
						jQuery("#alist").append(str);
						jQuery("#totalrow").val(row);
					  }
				
                 function rowstr(row,showdel){
                     var str='<td class="Ctd" attrprice" style="text-align:center;" nowrap><input style="width:80px;text-align:center;" type="text" name="aprice_market'+row+'" value="'+jQuery("#<%=this.TxtPrice.ClientID %>").val()+'" size="4" class="textbox"/><%=MyCache.GetCurrencyUnit %></td>';
                     str+='<td class="Ctd" attrprice" style="text-align:center;" nowrap><input style="width:80px;text-align:center;" type="text" name="aprice'+row+'" value="'+jQuery("#<%=this.TxtPrice_Member.ClientID %>").val()+'" size="4" class="textbox"/><%=MyCache.GetCurrencyUnit %></td>';
                     str+='<td class="Ctd"" style="text-align:center;" nowrap><input style="width:80px;text-align:center;" type="text" name="aamount'+row+'" value="'+jQuery("#<%=this.TxtAmount.ClientID %>").val()+'" size="4" class="textbox"/>件</td>';
                     <% if (Kesion.XML.XmlObject.GetStrXmlNode(fieldsxml, "//Model/Field[@Name='Weight']/Disabled").ToLower().Equals("true"))
                    {%>
                     str+='<td class="Ctd" attrprice" nowrap style="text-align:center;"><input style="width:80px;text-align:center;" type="text" name="aweight'+row+'" value="'+(jQuery("#Weight")[0]==undefined?'':jQuery("#Weight").val())+'" size="4" class="textbox"/>KG</td>';
                     <%}%>
                         if(showdel){
                             str+='<td class="Ctd"" nowrap style="text-align:center"><a href="javascript:delrow(\''+row+'\');">删除</a></td>';
                         }
					      str+='</tr>';
					   return str;
					  }

                 function getChangePicTr(i,ii){
                     var src=$("#cc"+i+ii).attr("src");
                     var tname=$("#cc"+i+ii).val();
                     var str='<tr id="sp'+(i+""+ii)+'"><td style="padding-left:10px" nowrap>'
                     str+='<img style="width:13px;height:13px;border:1px solid #ccc;padding:1px" id="oldimg'+i+ii+'" style="cursor:hand" src="'+src+'" align="bottom"/> <span class="a'+i+ii+'">'+tname+'</span></td>';
                     str+='<td><table><tr><td nowrap><input type="button" value="选择图片" class="button" onclick="SelectFiles(\'timg' + i + ii + '\',<%=ChannelID%>);"/></td><td style="padding-top:8px"><iframe src="../include/UpLoad.aspx?module=shopspecial&FieldID=timg' + i + ii+'" marginheight="0" marginwidth="0" frameborder="0" width="100%" height="30" scrolling="no"></iframe></td></tr></table></td>';
                     str+='<td style="width:60px;text-align:center"><img onclick="delChangePic('+i+','+ii+');" src="../../sysimg/nopic.gif" width=45 height=45 title="删除" style="cursor:pointer;padding:1px solid #cccccc;display:none;" id=\'showtimg' +i + ii + '\'/></td></tr>';
                     return str;
                 }
                 function delChangePic(i,ii){
                     if (confirm('确认删除吗？')){
                         $('#timg' + i + ii).val($("#oldimg"+i+ii).attr("src"));
                         $('#showtimg' + i + ii).hide();
                     }
                 }

                 function delrow(r){  
                    // $("#specialtable").ResetTable();
                     jQuery("#row"+r).remove();
                   
                     
                 }
                 function changeTname(i,ii,obj){
                     $(".a"+i+ii).html(obj.value);
                 }

                 function getlist(t,showType,i,ii,obj){
                     if (obj.checked){
                         $("#tname"+i+ii).show();
                         $("#ttname"+i+ii).hide();
                     }else{
                         $("#tname"+i+ii).hide();
                         $("#ttname"+i+ii).show();
                     }

                     //更改图片
                     if (showType==2){
                         if ($("#showspecialpictable")[0]==undefined){
                             var str='<table id="showspecialpictable" border="0" class="CTable"" style="width:600px">';
                             str+="<tr class='CTitle'><td>"+$("#attrtitle"+i).val()+"</td>";
                             str+="<td style='text-align:left'>图片（无图片可不填）</td></tr>";
                             str+=getChangePicTr(i,ii);
                             str+="</table><br/>";
                             $("#showspecialpic").html(str);
                         }else{
                             if (obj.checked){
                                 $("#showspecialpictable").append(getChangePicTr(i,ii));
                             }else{
                                 $('#timg' + i + ii).val($("#oldimg"+i+ii).attr("src"));
                                 $("#sp"+(i+""+ii)).remove();
                             }

                         }
                     }

                     var titlestr='';
                     var totalLen=$(".atcs").length;
                     for (var i=0;i<3;i++){
                         eval("var str"+i+"='';");
                         jQuery("input[name='cc"+i+"']:checked").each(function(){
                            eval("str"+i+"+=','+jQuery(this).val();");
                         })
                     }
                     for(var i=0;i<totalLen;i++){
                         if (eval("str"+i)==''){
                             $("#specialtable").hide();
                             $("#showselectspecialtips").show().html('您需要选择所有的属性，才能组合成完整的规格信息！');
                             return;
                         }
                         if (titlestr==''){titlestr=jQuery("#attrtitle"+i).val();}else{titlestr=titlestr+','+jQuery("#attrtitle"+i).val();}

                     }
                     $("#showselectspecialtips").hide();
                     $("#specialtable").show();
                     jQuery("#AttributeCart").val(titlestr);
                    
                       var newrow='';
                       $("#specialitem0").find("input[type=checkbox]").each(function(){
                             
                             var this0=$(this);
                             var i0=$(this).attr("i");
                             var ii0=$(this).attr("ii");

                             var rowid=i0+ii0;
                                
                             if (totalLen==1){  //只有一个属性
                                
                                 if ($("#cc"+i0+ii0).prop("checked")==true){
                                     if ($('#row'+rowid)[0]==undefined){
                                         newrow='<tr id="row'+rowid+'" style="text-align:center;">';
                                         newrow=newrow+'<td class="Ctd" style="text-align:center;display:none" nowrap>'+rowid+'</td>';
                                         newrow=newrow+'<td class="Ctd" nowrap><span class="a'+i0+ii0+'">'+$(this).val()+'</span></td>';
                                         newrow=newrow+'<td class="Ctd" nowrap>';
                                         newrow=newrow+' <input type="hidden" name="specialids" value="'+rowid+'"/>';
                                         newrow=newrow+' <input type="hidden" name="attr0'+rowid+'" id="attr0'+rowid+'" value="tname'+i0+ii0+'"/>';
                                         newrow=newrow+' <input type="hidden" name="attr0img'+rowid+'" id="attr0img'+rowid+'" value="timg'+i0+ii0+'"/>';
                                         newrow=newrow+' <input style="width:80px" type="text" name="aitemno'+rowid+'" id="aitemno'+rowid+'"  size="10" class="textbox"/>';
                                         newrow=newrow+'</td>'+rowstr(rowid,false);
                                         $("#alist").append(newrow);
                                     }
                                 }else{
                                     jQuery("#row"+rowid).remove();
                                 }
                             }


                             $("#specialitem1").find("input[type=checkbox]").each(function(){
                                 var this1=$(this);
                                 var i1=$(this).attr("i");
                                 var ii1=$(this).attr("ii");
                                 var rowid=i0+ii0+i1+ii1;
                                
                                 if (totalLen==2){  //两个属性
                                     if ($("#cc"+i0+ii0).prop("checked")==true && $("#cc"+i1+ii1).prop("checked")==true){
                                         if ($('#row'+rowid)[0]==undefined){
                                             newrow='<tr id="row'+rowid+'" style="text-align:center;">';
                                             newrow=newrow+'<td class="Ctd" style="text-align:center;display:none" nowrap>'+rowid+'</td>';
                                             newrow=newrow+'<td class="Ctd" nowrap><span class="a'+i0+ii0+'">'+this0.val()+'</span></td>';
                                             newrow=newrow+'<td class="Ctd" nowrap><span class="a'+i1+ii1+'">'+$(this).val()+'</span></td>';
                                             newrow=newrow+'<td class="Ctd" nowrap>';
                                             newrow=newrow+' <input type="hidden" name="specialids" value="'+rowid+'"/>';
                                             newrow=newrow+' <input type="hidden" name="attr0'+rowid+'" id="attr0'+rowid+'" value="tname'+i0+ii0+'"/>';
                                             newrow=newrow+' <input type="hidden" name="attr1'+rowid+'" id="attr1'+rowid+'" value="tname'+i1+ii1+'"/>';
                                             newrow=newrow+' <input type="hidden" name="attr0img'+rowid+'" id="attr0img'+rowid+'" value="timg'+i0+ii0+'"/>';
                                             newrow=newrow+' <input type="hidden" name="attr1img'+rowid+'" id="attr1img'+rowid+'" value="timg'+i1+ii1+'"/>';
                                             newrow=newrow+' <input style="width:80px" type="text" name="aitemno'+rowid+'" id="aitemno'+rowid+'"  size="10" class="textbox"/>';
                                             newrow=newrow+'</td>'+rowstr(rowid,false);
                                             $("#alist").append(newrow);
                                         }
                                     }else{
                                        // delrow(rowid) 
                                        jQuery("#row"+rowid).remove();
                                     }
                                 }

                                 $("#specialitem2").find("input[type=checkbox]").each(function(){
                                     var i2=$(this).attr("i");
                                     var ii2=$(this).attr("ii");
                                     var rowid=i0+ii0+i1+ii1+i2+ii2;
                                     if (totalLen==3){  //三个属性
                                         if ($("#cc"+i0+ii0).prop("checked")==true && $("#cc"+i1+ii1).prop("checked")==true && $("#cc"+i2+ii2).prop("checked")==true){
                                             if ($('#row'+rowid)[0]==undefined){
                                                 newrow='<tr id="row'+rowid+'" style="text-align:center;">';
                                                 newrow=newrow+'<td class="Ctd" style="text-align:center;display:none" nowrap>'+rowid+'</td>';
                                                 newrow=newrow+'<td class="Ctd" nowrap><span class="a'+i0+ii0+'">'+this0.val()+'</span></td>';
                                                 newrow=newrow+'<td class="Ctd" nowrap><span class="a'+i1+ii1+'">'+this1.val()+'</span></td>';
                                                 newrow=newrow+'<td class="Ctd" nowrap><span class="a'+i2+ii1+'">'+$(this).val()+'</span></td>';
                                                 newrow=newrow+'<td class="Ctd" nowrap>';
                                                 newrow=newrow+' <input type="hidden" name="specialids" value="'+rowid+'"/>';
                                                 newrow=newrow+' <input type="hidden" name="attr0'+rowid+'" id="attr0'+rowid+'" value="tname'+i0+ii0+'"/>';
                                                 newrow=newrow+' <input type="hidden" name="attr1'+rowid+'" id="attr1'+rowid+'" value="tname'+i1+ii1+'"/>';
                                                 newrow=newrow+' <input type="hidden" name="attr2'+rowid+'" id="attr2'+rowid+'" value="tname'+i2+ii2+'"/>';
                                                 newrow=newrow+' <input type="hidden" name="attr0img'+rowid+'" id="attr0img'+rowid+'" value="timg'+i0+ii0+'"/>';
                                                 newrow=newrow+' <input type="hidden" name="attr1img'+rowid+'" id="attr1img'+rowid+'" value="timg'+i1+ii1+'"/>';
                                                 newrow=newrow+' <input type="hidden" name="attr2img'+rowid+'" id="attr2img'+rowid+'" value="timg'+i2+ii2+'"/>';
                                                 newrow=newrow+' <input style="width:80px" type="text" name="aitemno'+rowid+'" id="aitemno'+rowid+'"  size="10" class="textbox"/>';
                                                 newrow=newrow+'</td>'+rowstr(rowid,false);
                                                 $("#alist").append(newrow);
                                             }
                                         }else{
                                             jQuery("#row"+rowid).remove();
                                         }
                                     }

                                 });


                             });

                         });
                   

                         tableSort();
                         merge();
                        
					  }

					  function showFront(){
					      if (jQuery("#<%=this.DrpPayType.ClientID %> option:selected").val() >= 1) {
					          jQuery("#ShowDJ").show();
                           } else {
					          jQuery("#ShowDJ").hide();
                           }
					  }
					 </script>
            
            
            <asp:Label ID="LabSpecification" runat="server"></asp:Label>
            
             </td></tr>
            <tr>
                <td class="lefttd" style="height:0px">
                 <input type='hidden' name='AttributeCart' id='AttributeCart' value='<%=AttributeCart %>'/>
                <input type='hidden' name='totalrow' id='totalrow' value='<%=row %>'/>
                </td>
                <td class="righttd" id='cartattr'> </td>
            </tr>
 <tbody  id="showPayType">
       <tr>
              <td class="lefttd" align="right"><strong>支付限制：</strong></td>
              <td class="righttd">
                  
                  <asp:DropDownList ID="DrpPayType" runat="server">
                       <asp:ListItem Value="0" Selected="True">全额支付</asp:ListItem>
                      <asp:ListItem Value="1">只允许支付订金</asp:ListItem>
                      <asp:ListItem Value="2">支付订金不能少于</asp:ListItem>
                  </asp:DropDownList>
                  <span id="ShowDJ" style="display:none"><%=MyCache.GetCurrencySymbol %><asp:TextBox ID="TxtFrontPrice" CssClass="textbox" Text="100" runat="server" onKeyPress= "return regInput(this,/^\d*\.?\d{0,2}$/,String.fromCharCode(event.keyCode))" onpaste="return regInput(this,/^\d*\.?\d{0,2}$/,window.clipboardData.getData('Text'))" ondrop="return regInput(this,    /^\d*\.?\d{0,2}$/,event.dataTransfer.getData('Text'))" Width="60px" style="text-align:center"></asp:TextBox>
<%=MyCache.GetCurrencyUnit %>
                  </span>
         </td>
      </tr>
      <tr>
              <td class="lefttd" align="right"><strong>收款账号：</strong></td>
              <td class="righttd">
                  
                  <asp:DropDownList ID="DrpPayID" runat="server">
                  </asp:DropDownList>
                
         </td>
      </tr>
</tbody>

                <tr>
                    <td align="right" class="lefttd">
                        <strong>是否参与全场活动促销：</strong></td>
                    <td class="righttd">
                        <asp:RadioButtonList ID="RdbIsPromotions" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow">
                            <asp:ListItem Value="0" Selected="True">否</asp:ListItem>
                            <asp:ListItem Value="1">是</asp:ListItem>
                        </asp:RadioButtonList>
                         <br />
                        <span class="tips">设置“是”后，将根据商城参数设置里的购买满多少<%=MyCache.GetCurrencyUnit%>，减免多少<%=MyCache.GetCurrencyUnit%>的活动。</span>
                    </td>
                </tr>
                <tr id="showGroupPriceRate">
                    <td align="right" class="lefttd">
                        <strong>是否参与用户组折扣：</strong></td>
                    <td class="righttd">
                        <asp:RadioButtonList ID="RdbIsGroupRate" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow">
                            <asp:ListItem Value="0" Selected="True">否</asp:ListItem>
                            <asp:ListItem Value="1">是</asp:ListItem>
                        </asp:RadioButtonList>
                       <br />
                        <span class="tips">设置“是”后，普通商品将根据用户组里设置的折扣率计算价格,抢购、积分兑换、换购及竞价商品不参与此折扣。</span>
                    </td>
                </tr>

        
        
        <tr>
            <td align="right" class="lefttd" style="height: 30px"> <strong>价格含税：</strong></td>
            <td class="righttd" style="height: 30px">
             <asp:RadioButtonList ID="RdbTaxTF" runat="server"  RepeatDirection="Horizontal">
              <asp:ListItem Value="0">不含税</asp:ListItem>
              <asp:ListItem Value="1">含税</asp:ListItem>
             </asp:RadioButtonList>
             <div id="taxShow">
             税率：<asp:TextBox ID="TxtTax" runat="server" CssClass="textbox" onKeyPress= "return regInput(this,/^\d*\.?\d{0,2}$/,String.fromCharCode(event.keyCode))" onpaste="return regInput(this,/^\d*\.?\d{0,2}$/,window.clipboardData.getData('Text'))" ondrop="return regInput(this,    /^\d*\.?\d{0,2}$/,event.dataTransfer.getData('Text'))" style="width:60px;text-align:center"></asp:TextBox> %
             </div>
            </td>
        </tr>
        <tbody id="showOtherLimit">
        <tr>
            <td align="right" class="lefttd" style="height: 30px">
                <strong>库存设置：</strong></td>
            <td class="righttd" style="height: 30px">
              当前库存：<asp:TextBox CssClass="textbox" ID="TxtAmount" runat="server" style="text-align:center" Text="1000" Width="45px"></asp:TextBox>&nbsp;
              库存报警设置：<asp:TextBox CssClass="textbox" ID="TxtAlarmNum" runat="server" style="text-align:center" Text="10" Width="40px"></asp:TextBox> <span class="tips">设置为0不报警提示</span>
             </td>
        </tr>
        <tr>
            <td align="right" class="lefttd" style="height: 30px">
                <strong>订购限制：</strong></td>
            <td class="righttd" style="height: 30px">
                <script>
                    $(document).ready(function(){
                        $("#<%=this.RdbLimitBookCode.ClientID%>").change(function(){
                            showLimitBookCode();
                        });
                        showLimitBookCode();
                    });
                   
                    function showLimitBookCode() {
                        if (jQuery("#<%=this.RdbLimitBookCode.ClientID%> :radio[checked]").val() == "1") {
                            jQuery("#bookCodeLimit").show();
                        } else {
                            jQuery("#bookCodeLimit").hide();
                        }
                        jQuery.ajax({
                            type: "POST",
                            url: "KS.Shopajaxs.aspx",
                            data: "action=bookcode&typeid="+$("#<%=this.TxtBookTypeID.ClientID%>").val(),
                            success: function(data){
                                jQuery("#BookType").empty().append("<option value='0'>=选择邀请码分类=</option>").append(data);
                            }
                        });


                    }

                </script>
               

                
                <div><strong>启用预约码限制<span class="tips">(启用后，只有预约码的顾客才能购买。)</span>：</strong></div>
                <asp:RadioButtonList ID="RdbLimitBookCode" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow">
                    <asp:ListItem Value="0" Selected="True">不启用</asp:ListItem>
                    <asp:ListItem Value="1">启用</asp:ListItem>
                </asp:RadioButtonList>
                <asp:TextBox ID="TxtBookTypeID" style="display:none" runat="server" Text="0" />
                 <div id="bookCodeLimit" style="display:none;">
                    <select name="BookType" id="BookType">

                    </select>
                </div>
                <div><strong>每个城市限制销售：</strong><asp:TextBox ID="TxtCityLimit" runat="server" CssClass="textbox" style="text-align:center" Text="0" Width="45px" />件 <span class="tips">不限制请输入“0”。</span></div>
                <div><strong>订购数量限制：</strong></div>
                <div>
                最少订购<asp:TextBox CssClass="textbox" ID="TxtMinOrderNum" runat="server" style="text-align:center" Text="0" Width="45px"></asp:TextBox>件&nbsp;
                最多允许订购<asp:TextBox CssClass="textbox" ID="TxtMaxOrderNum" runat="server" style="text-align:center" Text="0" Width="45px"></asp:TextBox>件
                <span class="tips">设置为“0”不启用此项限制。</span>
                    </div>
                </td>
        </tr>
        </tbody>
        <tr>
            <td align="right" class="lefttd" style="height: 30px">
                <strong>赠送积分：</strong></td>
            <td class="righttd" style="height: 30px">
                <asp:TextBox ID="TxtScore" CssClass="textbox" Text="0" Width="50px" style="text-align:center" runat="server"></asp:TextBox> 分
                <span class="tips">
                成功购买本商品一件可以得到的积分。如这里设置1分,用户购买10件,则可以得10分。</span>
             </td>
        </tr>
     </table>			
			
	</div>
		
	<div class="tab-page" id="tab4">
		  <h2 class="tab"<%=__modelinfo.ChargesOption==1?"":" style='display:none'" %>>捆绑销售</h2>
			<script type="text/javascript">
						 tabPane1.addTabPage( document.getElementById( "tab4" ) );
			</script>
            <table style="width:100%;margin:0 auto;" cellpadding="2" cellspacing="1" class="CTable">
           <tr>
			<td class="righttd" style="width: 550px">
			 <script type="text/javascript">
		  function getProduct()
		  {	 jQuery('#ajaxmsg',window.parent.document).fadeIn("slow");		 
			 var key=jQuery('input[name=key]').val();
			 var kbtid=jQuery('#kbtid option:selected').val();
			 var priceType=jQuery('#PriceType option:selected').val();
			 var minPrice=jQuery("#minPrice").val();
			 var maxPrice=jQuery("#maxPrice").val();
			 var str='';
			 if (key!=''){
			   str='商品名称:'+key;
			 } 
			 if (kbtid!='' && kbtid !='0'){
			   str+=' 栏目:'+jQuery('#kbtid option:selected').get(0).text
			 }
			 if (priceType!=0){
			   str+= minPrice +' <%=MyCache.GetCurrencyUnit%>';
			   switch (parseInt(priceType)){
			     case 1 :
				  str+='<=商城价<=';
				  break;
			     case 2 :
				   str+='<=会员价<=';
				   break;
			     case 3 :
				  str+='<=市场价<=';
				  break;
			   }
			   str+= maxPrice +' <%=MyCache.GetCurrencyUnit%>';
			   
			 }
			 if (str!='') str='<strong>条件:</strong><font color=red>'+str+'</font>';
			 jQuery("#keyarea").html(str);
			 
			 jQuery.get("KS.Shopajaxs.aspx", { action: "searchproduct", proid:jQuery("#proids").val(),id:<%=ContentID%>,pricetype:priceType,key: key,tid:kbtid,minPrice:minPrice,maxPrice:maxPrice},
			 function(data){
					jQuery('#ajaxmsg',window.parent.document).fadeOut("slow");
					jQuery("#prolist").empty();
					jQuery("#prolist").append(data);
			  });
		  }
			     function addProductIn(){
			         var proid=jQuery('#prolist option:selected').val();
			         if (proid!=undefined){
			             parent.openWin('设置捆绑销售价格','shop/KS.ShopSetBundleSale.Aspx?infoid='+proid,false,550,250);
			         }else{
			             KesionJS.Alert('请选择要加入捆绑销售的商品!',null);
			         }
			     }
			     function updateKBXS(arrstr)
			     {
			         if (arrstr!=''){
			             var finder=false;
			             var arr=arrstr.split('@@@');
			             jQuery('#<%=this.kbprolist.ClientID%> option').each(function(){
				     if (arr[0]==this.value.split('|')[0] && arr[1]==this.value.split('|')[1]){
				         this.text=arr[3]+"[捆绑销售价:￥"+arr[2]+"元]";
				         this.value=arr[0]+"|"+arr[1]+"|"+arr[2];
				         finder=true;}
				 });
			     
				 if (finder==false){
				     jQuery('#<%=this.kbprolist.ClientID%>').append("<option value='"+arr[0]+"|"+arr[1]+"|"+arr[2]+"' selected>"+arr[3]+"[捆绑销售价:￥"+arr[2]+"元]</option>");
				  }
                  parent.box.close();
              }
              jQuery("#<%=this.kbprolist.ClientID%> option").attr("selected",true);

		  }
		  function modifyKBXS(){
		      var l=jQuery('#<%=this.kbprolist.ClientID%> option:selected').length;
		      if (l==1){
		          var kb=jQuery('#<%=this.kbprolist.ClientID%>>option:selected').val().split('|');
		       parent.openWin('设置捆绑销售价格','shop/KS.ShopSetBundleSale.Aspx?kbprice='+kb[2]+'&infoid='+kb[0]+"|"+kb[1],false,350,200);
		   }else if(l==0){
		       KesionJS.Alert('请选择一个商品!',null);
		   }else{
		       KesionJS.Alert('一次只能选择一个商品!',null);
		   }
       }
		  function delAllKBXS(){
		    jQuery("#<%=this.kbprolist.ClientID%>").empty();
		  }
		  function delSelectKBXS(){
		      var dest = document.getElementById('<%=this.kbprolist.ClientID%>');
			  for (var i = dest.options.length - 1; i >= 0 ; i--)
					  {
						  if (dest.options[i].selected)
						  {
							  dest.options[i] = null;
						  }
					  }
		   jQuery("#<%=this.kbprolist.ClientID%> option").attr("selected",true);
		  }
		  function selectAllKBXS(){
		   jQuery("#<%=this.kbprolist.ClientID%> option").each(function(){
		      jQuery(this).attr("selected",true);
		   });
		  }
		</script>
			  &nbsp;<strong>快速搜索=></strong>
			  <br/>
			  &nbsp;商品编号: <input type="text" class="textbox" name="proids" id="proids" size='15' /> 可留空<br/>
			 &nbsp;商品名称: <input type="text" class='textbox' name="key" />
			 <br/>&nbsp;所属栏目: <select size='1' name='kbtid' id='kbtid'><option value=''>--栏目不限--</option>
			 <%=ClassManage.GetClassOptionByPurview(Convert.ToInt16(ChannelID), "0")%>
			 </select>
			 <br/>&nbsp;价格范围:
			<input type='text' name='minPrice' class='textbox' size='5' style='width:60px;text-align:center' id='minPrice' value='10' /> <%=MyCache.GetCurrencyUnit%>
			<= <select name="PriceType" id="PriceType">
			  <option value="0">--不限制--</option>
			  <option value="1">商城价</option>
			  <option value="2">会员价</option>
			 </select>
			 <= <input type='text' class='textbox' name='maxPrice' size='5' style='width:60px;text-align:center' id='maxPrice' value='100' /> <%=MyCache.GetCurrencyUnit%>
			  
			  <br/> <br/>
			  &nbsp;<input type="button" onclick="getProduct()" value="开始搜索" class="button" name="s1" />
			
			</td>
			<td class="righttd">
			<div id='keyarea'></div>
			<strong>查询到的商品:</strong>			
			<br/>
			 <select name="prolist" size="5" style="width:360px;height:140px" id="prolist"></select>
			 <br/>
			 <input type="button" onclick="addProductIn()" value="将选中的商品加入捆绑销售" class="button" />
			</td>
		  </tr>
		  <tr>
		    <td class="righttd">
			  <strong>捆绑销售商品:</strong><br/>
                <asp:ListBox ID="kbprolist" runat="server" Width="550px" Height="160px" SelectionMode="Multiple"></asp:ListBox></td>
			<td class="righttd" style="line-height:35px;">
			<input type="button" class="button" value="修改选中商品价格" onclick="modifyKBXS()"/><br/>
			<input type="button" class="button" value="移除选中商品" onclick="delSelectKBXS()"/><br/>
			<input type="button" class="button" value="全部移除" onclick="delAllKBXS()" /><br/>
			<input type="button" class="button" value="全部全中" onclick="selectAllKBXS()" />
			</td>
		  </tr>             
             
            </table>
   </div>
	
		<div class="tab-page" id="seooption">
		  <h2 class="tab" <%=__modelinfo.SeoOption==1?"":" style='display:none'" %>>SEO选项</h2>
			<script type="text/javascript">
			    tabPane1.addTabPage(document.getElementById("seooption"));
			</script>
    <table style="width:100%;margin:0 auto;" cellpadding="2" cellspacing="1" class="CTable">
     <tr>
       <td class="lefttd" align="right"><strong>页面标题：</strong></td>
       <td class="righttd">
          <asp:TextBox ID="TxtSeoTitle" runat="server" Width="450px"  CssClass="textbox" />
           <br />
         <span class='tips'>留空则默认显示文章名称,模板里请用标签{KS:Field:SEOTitle}调用。</span>
        </td>
     </tr>
     <tr>
       <td class="lefttd" align="right"><strong>页面关键字：</strong>(meta_keywords)</td>
       <td class="righttd">
          <asp:TextBox TextMode="MultiLine" Rows="5" ID="TxtSeoKeyWords" runat="server" Width="450px" Height="100px" CssClass="textbox textarea" />
           <a class="textarea_max" href="javascript:zoomtextarea(5,'<%=this.TxtSeoKeyWords.ClientID %>');"></a>
           <a class="textarea_min" href="javascript:zoomtextarea(-5,'<%=this.TxtSeoKeyWords.ClientID %>');"></a> 
           <br />
            <span class='tips'>留空则默认显示文章里设置的KeyWords,模板里请用标签{KS:Field:SEOKeyWords}调用。</span>
        </td>
     </tr>
     <tr>
       <td class="lefttd" align="right"><strong>页面描述：</strong>(meta_description)</td>
       <td class="righttd">
          <asp:TextBox TextMode="MultiLine" Rows="5" ID="TxtSeoDescription" runat="server" Width="450px" Height="100px"  CssClass="textbox" />
           <a class="textarea_max" href="javascript:zoomtextarea(5,'<%=this.TxtSeoDescription.ClientID %>');"></a>
           <a class="textarea_min" href="javascript:zoomtextarea(-5,'<%=this.TxtSeoDescription.ClientID %>');"></a> 
           <br />
         <span class='tips'>留空则默认显示文章简介,模板里请用标签{KS:Field:SEODescription}调用。</span>
        </td>
     </tr>
    </table>
</div>
		
		
		
	
	  </div>


    

    <div style="clear:both;text-align:center">
    <br />
    <KS:Foot ID="Foot1" runat="server" OnSubmit="Foot1_Submit" />
    </div>
</asp:Content>

