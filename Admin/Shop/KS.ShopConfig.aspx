<%@ Page Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="True" Inherits="Kesion.NET.WebSite.Admin_ShopConfig" Title="商城参数设置" Codebehind="KS.ShopConfig.aspx.cs" %>
<%@ Import Namespace="Kesion.Cache" %>
<asp:Content ID="Content1" ContentPlaceHolderID="KSContent" Runat="Server">
    <KS:topnav id="TopNav1" runat="server" text="商城系统参数设置"></KS:topnav>
    
    
<div class="tab-page" id="ShopConfigPanel">

         <script>
             function showTax() {
                 var checkrad = jQuery("#<%=this.RdbTaxTF.ClientID %> :radio[checked]").val();
                 if (checkrad == 0) {
                     jQuery("#ShowTax").show();
                 } else {
                    jQuery("#ShowTax").hide();
                 }
             }
             function showSms() {
                 var checkrad = jQuery("#<%=this.RdbShopNewOrderSms.ClientID %> :radio[checked]").val();
                 if (checkrad == 0) {
                     jQuery("#ShowSms").hide();
                 } else {
                     jQuery("#ShowSms").show();
                 }
             }
             function showEmail() {
                 var checkrad = jQuery("#<%=this.RdbShopNewOrderEmailTF.ClientID %> :radio[checked]").val();
                 if (checkrad == 0) {
                     jQuery("#ShowEmail").hide();
                 } else {
                    jQuery("#ShowEmail").show();
                 }
             }
             jQuery(document).ready(function() {
                 showTax();
                 showSms();
                 showEmail();
             });
         </script>

         <script type="text/javascript">
           var tabPane1 = new WebFXTabPane( document.getElementById( "ShopConfigPanel" ), 1 )
         </script>
             
		 <div class="tab-page" id="tab0">
		  <h2 class="tab">基本参数</h2>
			<script type="text/javascript">
						 tabPane1.addTabPage( document.getElementById( "tab0" ) );
			</script>
    <table id="tbs" width="99%" border="0" cellpadding="1" cellspacing="1" class="CTable"> 
         <tr>
             <td class="lefttd" height="30" align="right" style="width: 198px"><b>商城运行模式：</b></td>
                <td class="righttd">
                 <asp:RadioButtonList ID="RdbRunType" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow">
                     <asp:ListItem Value="0" Selected="True">B2C</asp:ListItem>
                     <asp:ListItem Value="1">B2B2C</asp:ListItem>
                     <asp:ListItem Value="2">批发模式</asp:ListItem>
                 </asp:RadioButtonList>

                <span class="tips">运行模式为B2C时，商家无法发布商品。运行模式为B2B2C模式商家可以入驻，发布商品,销售及结算于一体。</span>
                
                </td>
        </tr>
         <tr>
             <td class="lefttd" height="30" align="right" style="width: 198px"><b>商城首页绑定二级域名：</b></td>
                <td class="righttd">
                <asp:TextBox ID="TxtShopBindDomain" runat="server" Width="200" CssClass="textbox"></asp:TextBox>
                <span class="tips">如：http://mall.kesion.com，后面不能加"/"，没有绑定二级域名请留空。</span>
                
                </td>
        </tr>
         <tr>
             <td class="lefttd" height="30" align="right" style="width: 198px"><b>团购首页绑定二级域名：</b></td>
                <td class="righttd">
                <asp:TextBox ID="TxtGroupBuyBindDomain" runat="server" Width="200" CssClass="textbox"></asp:TextBox>
                <span class="tips">如：http://tuan.kesion.com，后面不能加"/"，没有绑定二级域名请留空。</span>
                
                </td>
        </tr>
        <tr>
             <td class="lefttd" height="30" align="right" style="width: 198px"><b>您的位置：</b></td>
                <td class="righttd">
                   <script src="../../plus/area.aspx?ext=true&pid=<%=provinceid %>&cityid=<%=cityid %>&countyid=<%=countyid %>" type="text/javascript"></script>
                </td>
        </tr>
         <tr>
             <td class="lefttd" height="30" align="right" style="width: 198px"><b>商城是否允许游客购买：</b></td>
                <td class="righttd">
                    <asp:RadioButtonList ID="RdbAllowVisitorsToBuy" runat="server" RepeatDirection="Horizontal">
                    <asp:ListItem Value="0" Selected="True">不允许</asp:ListItem>
                    <asp:ListItem Value="1">允许</asp:ListItem>
                    </asp:RadioButtonList>
                </td>
         </tr>
        
         <tr>
             <td class="lefttd" height="30" align="right" style="width: 198px"><b>购物订单编号前缀：</b></td>
                <td class="righttd">
                   订单编号前缀：<asp:TextBox style="text-align:center" CssClass="textbox" ID="TxtOrderPrefix" runat="server" Width="50px"></asp:TextBox>
                   支付订单编号前缀：<asp:TextBox style="text-align:center" CssClass="textbox" ID="TxtPayPrefix" runat="server" Width="50px"></asp:TextBox> <span class="tips">不加前缀请留空</span>
                    <br />订单号生成规则：<br /><asp:RadioButtonList runat="server" ID="RdbOrderIdRule" RepeatLayout="Flow">
                      <asp:ListItem Value="0">前缀+18位随机数</asp:ListItem>
                      <asp:ListItem Value="1" Selected="True">前缀+时间格式（如201510012412）</asp:ListItem>
                      <asp:ListItem Value="2">前缀+年+月+日+6位随机数</asp:ListItem>
                　    </asp:RadioButtonList>
                   <br />

                </td>
         </tr>
         <tr>
             <td class="lefttd" height="30" align="right" style="width: 198px"><b>快递查询API授权KEY：</b></td>
                <td class="righttd">
                  <asp:TextBox CssClass="textbox" ID="TxtkuaidiKey" runat="server" Width="250px"></asp:TextBox> 
                   <span class="tips">不启用快递跟踪查询请留空。如果还没有授权KEY，可以<a href="http://www.kuaidi100.com/openapi/applyapi.shtml" target="_blank" style="color:red;">点此申请</a>。</span>

                </td>
         </tr>
         <tr>
             <td class="lefttd" height="30" align="right" style="width: 198px"><b>销售价名称：</b></td>
                <td class="righttd">
                  <asp:TextBox CssClass="textbox" ID="TxtPriceName" runat="server" style="text-align:center" Width="60px"></asp:TextBox> 
                   <span class="tips">如：一口价、淘宝价、京东价等。</span>

                </td>
         </tr>
         <tr>
             <td class="lefttd" height="30" align="right" style="width: 198px"><b>货币设置：</b></td>
                <td class="righttd">
                   保留小数位数 <asp:TextBox style="text-align:center" CssClass="textbox" ID="TxtShopPriceBit" runat="server" Width="50px"></asp:TextBox> 位
                   
                    <span class="tips">建议设置为“2”，即保留两位小数位。前台标签调用时，则以标签里设置的位数为准。</span>
                    <br />
                   货币符号 <asp:TextBox style="text-align:center" CssClass="textbox" ID="TxtShopPriceUnit" runat="server" Width="50px"></asp:TextBox> 如：¥,$等。
                    货币单位名称 <asp:TextBox style="text-align:center" CssClass="textbox" ID="TxtShopPriceZWUnit" runat="server" Width="50px"></asp:TextBox> 如：元，美元，日元等。
                </td>
         </tr>
        
        <tr>
            <td align="right" class="lefttd" height="30" style="width: 198px">
                <strong>商品没有图片时显示的默认图片：</strong></td>
            <td class="righttd">
                    <asp:TextBox CssClass="textbox" ID="TxtDefaultPic" runat="server" Width="250px"></asp:TextBox>&nbsp;<input type="button" class="button" onclick="OpenThenSetValue('../Include/SelectFile.aspx',550,290,window,jQuery('#<%=this.TxtDefaultPic.ClientID %>')[0]);" value="选择图片...">
                
                </td>
        </tr>
        <tr>
         <td align="right" class="lefttd" height="30" style="width: 198px">
            <strong>图片参数设置：</strong></td>
            <td class="righttd" style="text-align:left">
             <b>图片加水印：</b>
                <asp:RadioButtonList ID="RdbPictureAddWaterMark" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow">
                        <asp:ListItem Selected="True" Value="1">是</asp:ListItem>
                        <asp:ListItem Value="0">否</asp:ListItem>
                    </asp:RadioButtonList>

               <table border="0">
               <tr>
                    <td  class="righttd" height="30">
                        <strong>缩略图 宽度：</strong>
                            <asp:TextBox CssClass="textbox" ID="TxtThumbWidth" runat="server" Width="50px"></asp:TextBox> px 
                         <strong>高度：</strong><asp:TextBox CssClass="textbox" ID="TxtThumbHeight" runat="server" Width="50px"></asp:TextBox> px
                       <br /> <span class="tips">本频道默认自动生成的小图宽度和高度(建议高度设置成“0”，将自动根据宽度自适应。)</span>
                        </td>
                </tr>
               
                <tr>
                    <td class="righttd" height="30">
                        <strong>大图片 宽度：</strong>
                            <asp:TextBox CssClass="textbox" ID="TxtPictureWidth" runat="server" Width="50px"></asp:TextBox> px
                         <strong>高度：</strong> <asp:TextBox CssClass="textbox" ID="TxtPictureHeight" runat="server" Width="50px"></asp:TextBox> px 
                         <br />
                         <span class="tips">默认上传的大图宽度和高度(如果不想改变图片原图，建议宽度和高度都设置为“0”。)</span>
</td>
                </tr>
              
               </table>
             
                
            </td>
        </tr>
        

          
         <tr>
             <td class="lefttd" height="30" align="right" style="width: 198px"><b>默认添加时商品价格是否含税：</b>
             </td>
                <td class="righttd">
                    <asp:RadioButtonList ID="RdbTaxTF" runat="server" RepeatDirection="Horizontal">
                        <asp:ListItem Selected="True" Value="1">是</asp:ListItem>
                        <asp:ListItem Value="0">否</asp:ListItem>
                    </asp:RadioButtonList>
                    <div id="ShowTax">
                    默认商品税率：<asp:TextBox style="text-align:center" CssClass="textbox" ID="TxtTax" runat="server" Width="50px"></asp:TextBox> %
                    </div>
                </td>
         </tr>
         <tr>
             <td class="lefttd" height="30" align="right" style="width: 198px"><b>售后评价设置：</b>
             </td>
                <td class="righttd">
                   <b>是否开启评价：</b>
                    <asp:RadioButtonList ID="RdbCommentTF" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow">
                        <asp:ListItem Selected="True" Value="1">是</asp:ListItem>
                        <asp:ListItem Value="0">否</asp:ListItem>
                    </asp:RadioButtonList>
                    <br />
                    <b>评价内容是否要审核：</b>
                    <asp:RadioButtonList ID="RdbCommentVerifyTF" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow">
                        <asp:ListItem Selected="True" Value="1">是</asp:ListItem>
                        <asp:ListItem Value="0">否</asp:ListItem>
                    </asp:RadioButtonList>
                </td>
         </tr>
         <tr>
             <td class="lefttd" height="30" align="right" style="width: 198px"><b>售前咨询设置：</b>
             </td>
                <td class="righttd">
                   <b>是否开启售前咨询：</b>
                    <asp:RadioButtonList ID="RdbAskTF" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow">
                        <asp:ListItem Selected="True" Value="1">是</asp:ListItem>
                        <asp:ListItem Value="0">否</asp:ListItem>
                    </asp:RadioButtonList>
                    <br />
                   <b>是否允许游客咨询：</b>
                    <asp:RadioButtonList ID="RdbAskVisitor" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow">
                        <asp:ListItem Selected="True" Value="1">允许</asp:ListItem>
                        <asp:ListItem Value="0">不允许</asp:ListItem>
                    </asp:RadioButtonList>
                    <br />
                   <b>是否允许晒图：</b>
                    <asp:RadioButtonList ID="RdbAskPic" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow">
                        <asp:ListItem Selected="True" Value="1">允许</asp:ListItem>
                        <asp:ListItem Value="0">不允许</asp:ListItem>
                    </asp:RadioButtonList>
                    <br />
                    <b>咨询内容是否要审核：</b>
                    <asp:RadioButtonList ID="RdbAskVerityTF" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow">
                        <asp:ListItem Selected="True" Value="1">是</asp:ListItem>
                        <asp:ListItem Value="0">否</asp:ListItem>
                    </asp:RadioButtonList>
                    <br />
                    <b>未回复的咨询是否内容页显示：</b>
                    <asp:RadioButtonList ID="RdbAskNoReplyShowTF" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow">
                        <asp:ListItem Selected="True" Value="1">是</asp:ListItem>
                        <asp:ListItem Value="0">否</asp:ListItem>
                    </asp:RadioButtonList>
                </td>
         </tr>
          
        
         
       

      
      
    </table>
  </div>

         
 <div class="tab-page" id="tab1">
		  <h2 class="tab">页面模板</h2>
			<script type="text/javascript">
				 tabPane1.addTabPage( document.getElementById( "tab1" ) );
			</script>
             <table width="100%"  border="0" cellpadding="1" cellspacing="1" class="CTable"> 
                 <tr>
                    <td class="lefttd" align="right" style="height:30px;width: 198px"><b>商城首页模板：</b></td>
                    <td class="righttd">
                     &nbsp;<asp:TextBox  CssClass="textbox" ID="TxtShopIndexTemplate" runat="server" Width="297px"></asp:TextBox>
                     <input type="button" class="button" onMouseOver="this.className='button_on';" onMouseOut="this.className='button';" value="选择模板..." onClick="SelectTemplate('<%=this.TxtShopIndexTemplate.ClientID%>');"/>
                    <a href="../../shop/index.aspx" target="_blank">预览</a></td>
                 </tr>
                  <tr>
                    <td class="lefttd" align="right" style="height:30px;width: 198px"><b>购物车模板：</b></td>
                    <td class="righttd">
                     &nbsp;<asp:TextBox  CssClass="textbox" ID="TxtShoppingCartTemplate" runat="server" Width="297px"></asp:TextBox>
                     <input type="button" class="button" onMouseOver="this.className='button_on';" onMouseOut="this.className='button';" value="选择模板..." onClick="SelectTemplate('<%=this.TxtShoppingCartTemplate.ClientID%>');"/>
                    </td>
                 </tr>
                  <tr>
                    <td class="lefttd" align="right" style="height:30px;width: 198px"><b>填写收货信息模板：</b></td>
                    <td class="righttd">
                     &nbsp;<asp:TextBox  CssClass="textbox" ID="TxtOrderConfirmTemplate" runat="server" Width="297px"></asp:TextBox>
                     <input type="button" class="button" onMouseOver="this.className='button_on';" onMouseOut="this.className='button';" value="选择模板..." onClick="SelectTemplate('<%=this.TxtOrderConfirmTemplate.ClientID%>');"/>
                    </td>
                 </tr>
                  <tr>
                    <td class="lefttd" align="right" style="height:30px;width: 198px"><b>订购成功模板：</b></td>
                    <td class="righttd">
                     &nbsp;<asp:TextBox  CssClass="textbox" ID="TxtOrderSuccessTemplate" runat="server" Width="297px"></asp:TextBox>
                     <input type="button" class="button" onMouseOver="this.className='button_on';" onMouseOut="this.className='button';" value="选择模板..." onClick="SelectTemplate('<%=this.TxtOrderSuccessTemplate.ClientID%>');"/>
                    </td>
                 </tr>
                 <tr>
                    <td class="lefttd" align="right" style="height:30px;width: 198px"><b>商品对比模板：</b></td>
                    <td class="righttd">
                     &nbsp;<asp:TextBox  CssClass="textbox" ID="TxtCompareTemplate" runat="server" Width="297px"></asp:TextBox>
                     <input type="button" class="button" onMouseOver="this.className='button_on';" onMouseOut="this.className='button';" value="选择模板..." onClick="SelectTemplate('<%=this.TxtCompareTemplate.ClientID%>');"/>
                      <a href="../../shop/compare.aspx" target="_blank">预览</a>
                    </td>
                 </tr>
                 <tr>
                    <td class="lefttd" align="right" style="height:30px;width: 198px"><b>积分兑换首页模板：</b></td>
                    <td class="righttd">
                     &nbsp;<asp:TextBox  CssClass="textbox" ID="TxtScoreChangeTemplate" runat="server" Width="297px"></asp:TextBox>
                     <input type="button" class="button" onMouseOver="this.className='button_on';" onMouseOut="this.className='button';" value="选择模板..." onClick="SelectTemplate('<%=this.TxtScoreChangeTemplate.ClientID%>');"/>
                      <a href="../../shop/score.aspx" target="_blank">预览</a>
                    </td>
                 </tr>
                  <tr>
                    <td class="lefttd" align="right" style="height:30px;width: 198px"><b>竞价首页模板：</b></td>
                    <td class="righttd">
                     &nbsp;<asp:TextBox  CssClass="textbox" ID="TxtJingJiaTemplate" runat="server" Width="297px"></asp:TextBox>
                     <input type="button" class="button" onMouseOver="this.className='button_on';" onMouseOut="this.className='button';" value="选择模板..." onClick="SelectTemplate('<%=this.TxtJingJiaTemplate.ClientID%>');"/>
                      <a href="../../shop/jingjia.aspx" target="_blank">预览</a>
                    </td>
                 </tr>
                  <tr>
                    <td class="lefttd" align="right" style="height:30px;width: 198px"><b>品牌首页模板：</b></td>
                    <td class="righttd">
                     &nbsp;<asp:TextBox  CssClass="textbox" ID="TxtBrandIndexTemplate" runat="server" Width="297px"></asp:TextBox>
                     <input type="button" class="button" onMouseOver="this.className='button_on';" onMouseOut="this.className='button';" value="选择模板..." onClick="SelectTemplate('<%=this.TxtBrandIndexTemplate.ClientID%>');"/>
                      <a href="../../shop/brandindex.aspx" target="_blank">预览</a>
                    </td>
                 </tr>
                  <tr style="display:none">
                    <td class="lefttd" align="right" style="height:30px;width: 198px"><b>品牌详情页模板：</b></td>
                    <td class="righttd">
                     &nbsp;<asp:TextBox  CssClass="textbox" ID="TxtBrandShowTemplate" runat="server" Width="297px"></asp:TextBox>
                     <input type="button" class="button" onMouseOver="this.className='button_on';" onMouseOut="this.className='button';" value="选择模板..." onClick="SelectTemplate('<%=this.TxtBrandShowTemplate.ClientID%>');"/>
                    </td>
                 </tr>
                 <tr>
                    <td class="lefttd" align="right" style="height:30px;width: 198px"><b>限时限量抢购首页模板：</b></td>
                    <td class="righttd">
                     &nbsp;<asp:TextBox  CssClass="textbox" ID="TxtLimitBuyIndexTemplate" runat="server" Width="297px"></asp:TextBox>
                     <input type="button" class="button" onMouseOver="this.className='button_on';" onMouseOut="this.className='button';" value="选择模板..." onClick="SelectTemplate('<%=this.TxtLimitBuyIndexTemplate.ClientID%>');"/>
                      <a href="../../shop/limitbuyindex.aspx" target="_blank">预览</a>
                    </td>
                 </tr>
                 <tr>
                    <td class="lefttd" align="right" style="height:30px;width: 198px"><b>团购首页(进行中的团购)模板：</b></td>
                    <td class="righttd">
                     &nbsp;<asp:TextBox  CssClass="textbox" ID="TxtGroupBuyIndexTemplate" runat="server" Width="297px"></asp:TextBox>
                     <input type="button" class="button" onMouseOver="this.className='button_on';" onMouseOut="this.className='button';" value="选择模板..." onClick="SelectTemplate('<%=this.TxtGroupBuyIndexTemplate.ClientID%>');"/>
                      <a href="../../shop/groupbuyindex.aspx" target="_blank">预览</a>
                    </td>
                 </tr>
                 <tr>
                    <td class="lefttd" align="right" style="height:30px;width: 198px"><b>往期团购模板：</b></td>
                    <td class="righttd">
                     &nbsp;<asp:TextBox  CssClass="textbox" ID="TxtGrouBuyHistoryTemplate" runat="server" Width="297px"></asp:TextBox>
                     <input type="button" class="button" onMouseOver="this.className='button_on';" onMouseOut="this.className='button';" value="选择模板..." onClick="SelectTemplate('<%=this.TxtGrouBuyHistoryTemplate.ClientID%>');"/>
                      <a href="../../shop/groupbuyhistory.aspx" target="_blank">预览</a>
                    </td>
                 </tr>
                 <tr>
                    <td class="lefttd" align="right" style="height:30px;width: 198px"><b>团购内容页模板：</b></td>
                    <td class="righttd">
                     &nbsp;<asp:TextBox  CssClass="textbox" ID="TxtGroupBuyShowTemplate" runat="server" Width="297px"></asp:TextBox>
                     <input type="button" class="button" onMouseOver="this.className='button_on';" onMouseOut="this.className='button';" value="选择模板..." onClick="SelectTemplate('<%=this.TxtGroupBuyShowTemplate.ClientID%>');"/>
                      <a href="../../shop/groupbuyshow.aspx" target="_blank">预览</a>
                    </td>
                 </tr>
                 <tr>
                    <td class="lefttd" align="right" style="height:30px;width: 198px"><b>团购购物车模板：</b></td>
                    <td class="righttd">
                     &nbsp;<asp:TextBox  CssClass="textbox" ID="TxtGroupBuyCartTemplate" runat="server" Width="297px"></asp:TextBox>
                     <input type="button" class="button" onMouseOver="this.className='button_on';" onMouseOut="this.className='button';" value="选择模板..." onClick="SelectTemplate('<%=this.TxtGroupBuyCartTemplate.ClientID%>');"/>
                      <a href="../../shop/groupbuycart.aspx" target="_blank">预览</a>
                    </td>
                 </tr>
                 <tr>
                    <td class="lefttd" align="right" style="height:30px;width: 198px"><b>团购订单提交成功模板：</b></td>
                    <td class="righttd">
                     &nbsp;<asp:TextBox  CssClass="textbox" ID="TxtGroupBuyCartSuccTemplate" runat="server" Width="297px"></asp:TextBox>
                     <input type="button" class="button" onMouseOver="this.className='button_on';" onMouseOut="this.className='button';" value="选择模板..." onClick="SelectTemplate('<%=this.TxtGroupBuyCartSuccTemplate.ClientID%>');"/>
                      <a href="../../shop/groupbuycart.aspx" target="_blank">预览</a>
                    </td>
                 </tr>
                 <tr style="display:none">
                    <td class="lefttd" align="right" style="height:30px;width: 198px"><b>团购切换城市模板：</b></td>
                    <td class="righttd">
                     &nbsp;<asp:TextBox  CssClass="textbox" ID="TxtGroupBuyChangeCityTemplate" runat="server" Width="297px"></asp:TextBox>
                     <input type="button" class="button" onMouseOver="this.className='button_on';" onMouseOut="this.className='button';" value="选择模板..." onClick="SelectTemplate('<%=this.TxtGroupBuyChangeCityTemplate.ClientID%>');"/>
                      <a href="../../shop/changeCity.aspx" target="_blank">预览</a>
                    </td>
                 </tr>
                 <tr>
                    <td class="lefttd" align="right" style="height:30px;width: 198px"><b>预约码申请模板：</b></td>
                    <td class="righttd">
                     &nbsp;<asp:TextBox  CssClass="textbox" ID="TxtBookCodeApplyTemplate" runat="server" Width="297px"></asp:TextBox>
                     <input type="button" class="button" onMouseOver="this.className='button_on';" onMouseOut="this.className='button';" value="选择模板..." onClick="SelectTemplate('<%=this.TxtBookCodeApplyTemplate.ClientID%>    ');"/>
                      <a href="../../shop/bookCodeApply.aspx" target="_blank">预览</a>
                    </td>
                 </tr>
             </table>
        </div>
        
        
         <div class="tab-page" id="smspage">
		  <h2 class="tab">手机短信模板</h2>
			<script type="text/javascript">
			    tabPane1.addTabPage(document.getElementById("smspage"));
			</script>
             <table width="100%"  border="0" cellpadding="1" cellspacing="1" class="CTable"> 
                 <tr>
                    <td class="lefttd" align="right" style="width: 198px">
                    <strong>新订单手机短信提醒管理员：</strong>
                    </td>
                    <td class="righttd">
                     <asp:RadioButtonList ID="RdbShopNewOrderSms" runat="server" RepeatLayout="Flow" RepeatDirection="Horizontal">
                      <asp:ListItem Value="0">不启用</asp:ListItem>
                      <asp:ListItem Value="1">有新订单就提醒</asp:ListItem>
                      <asp:ListItem Value="2">新订单和会员成功付款提醒</asp:ListItem>
                      <asp:ListItem Value="2">仅提醒会员成功付款的订单</asp:ListItem>
                     </asp:RadioButtonList>
                    </td>
                 </tr>
                 <tbody id="ShowSms">
                 <tr>
                    <td class="lefttd" align="right" style="width: 198px">
                    <strong>新订单手机短信提醒接收的手机：</strong>
                    </td>
                    <td class="righttd">
                    &nbsp;<asp:TextBox ID="TxtShopNewOrderMobile" runat="server" CssClass="textbox" Width="200px" />
                    <span class="tips">多个手机号请用英文逗号隔开。</span>
                    </td>
                 </tr>
                  <tr>
                    <td class="lefttd" align="right" style="width: 198px">
                    <strong>新订单手机短信接收提示内容：</strong><br />
                    <div class="tips">标签：订单号{$OrderID}  金额{$NoUseCouponMoney}  下单时间{$InputTime}  订单状态{$OrderStatus}  
                    </div></td>
                    <td class="righttd">
                     &nbsp;<asp:TextBox  CssClass="textbox textarea" ID="TxtSmsNewOrder" TextMode="multiLine" runat="server" Width="425px" Height="80px"></asp:TextBox>
                                <a class="textarea_min" href="javascript:zoomtextarea(-2,'<%=this.TxtSmsNewOrder.ClientID %>');"> </a>
                               <a class="textarea_max" href="javascript:zoomtextarea(2,'<%=this.TxtSmsNewOrder.ClientID %>');"></a>  
                    </td>
                 </tr>
</tbody>
             
                  <tr>
                    <td class="lefttd" align="right" style="width: 198px">
                    <strong>支付成功手机短信内容：</strong><br />可用标签详见下面的标签说明
                    </td>
                    <td class="righttd">
                        <table width="100%">
                            <tr>
                            <td><strong>1、一次性付款</strong><br />
                                  <table border="0">
                                        <tr>
                                          <td>普通订单发送</td>
                                          <td><asp:TextBox  CssClass="textbox textarea" ID="TxtSmsReceiveBank" TextMode="multiLine" runat="server" Width="425px" Height="50px"></asp:TextBox>
                                <a class="textarea_min" href="javascript:zoomtextarea(-2,'<%=this.TxtSmsReceiveBank.ClientID %>');"> </a>
                               <a class="textarea_max" href="javascript:zoomtextarea(2,'<%=this.TxtSmsReceiveBank.ClientID %>');"></a>  
                                          </td>
                                        </tr>
                                        <tr>
                                          <td>团购订单<br />验证码发送</td>
                                          <td><asp:TextBox  CssClass="textbox textarea" ID="TxtSMSGroupBuyPayOK" TextMode="multiLine" runat="server" Width="425px" Height="50px"></asp:TextBox>
                                          <a class="textarea_min" href="javascript:zoomtextarea(-2,'<%=this.TxtSMSGroupBuyPayOK.ClientID %>');"> </a>
                                           <a class="textarea_max" href="javascript:zoomtextarea(2,'<%=this.TxtSMSGroupBuyPayOK.ClientID %>');"></a>  
                                            <br />
                                              <div class="tips">
                                              Tips:主要用于发送确认码与商家核对确认消费。确认码标签为：{$VerifyCode}。不需要手机发送确认码请留空。
                                           </td></div>
                                        </tr>
             
                                    </table>

                            </td>
                           </tr>
                           <tr>
                            <td>
                                <strong>2、仅付订金</strong><br />
                                <table border="0">
                                        <tr>
                                          <td>普通订单发送</td>
                                          <td><asp:TextBox  CssClass="textbox textarea" ID="TxtSmsReceiveFrontMoney" TextMode="multiLine" runat="server" Width="425px" Height="50px"></asp:TextBox>
                                           <a class="textarea_min" href="javascript:zoomtextarea(-2,'<%=this.TxtSmsReceiveFrontMoney.ClientID %>');"> </a>
                                           <a class="textarea_max" href="javascript:zoomtextarea(2,'<%=this.TxtSmsReceiveFrontMoney.ClientID %>');"></a>  
                                          </td>
                                        </tr>
                                        <tr>
                                          <td>团购订单<br />验证码发送</td>
                                          <td><asp:TextBox  CssClass="textbox textarea" ID="TxtSMSGroupBuyPayFrontMoneyOK" TextMode="multiLine" runat="server" Width="425px" Height="50px"></asp:TextBox>
                                           <a class="textarea_min" href="javascript:zoomtextarea(-2,'<%=this.TxtSMSGroupBuyPayFrontMoneyOK.ClientID %>');"> </a>
                                           <a class="textarea_max" href="javascript:zoomtextarea(2,'<%=this.TxtSMSGroupBuyPayFrontMoneyOK.ClientID %>');"></a>  
                                              <br />
                                              <div class="tips">
                                              Tips:主要用于发送确认码与商家核对确认消费。确认码标签为：{$VerifyCode}。不需要手机发送确认码请留空。
                                           </td></div>
                                        </tr>
             
                                    </table>

                            </td>
                            </tr>
                        </table>

                       

                    </td>
                 </tr>
                  <tr>
                    <td class="lefttd" align="right" style="width: 198px">
                    <strong>退货退款成功手机短信内容：</strong><br />可用标签详见下面的标签说明
                    </td>
                    <td class="righttd">
                     &nbsp;<asp:TextBox  CssClass="textbox textarea" ID="TxtSmsRefund" TextMode="multiLine" runat="server" Width="425px" Height="50px"></asp:TextBox>
                                           <a class="textarea_min" href="javascript:zoomtextarea(-2,'<%=this.TxtSmsRefund.ClientID %>');"> </a>
                                           <a class="textarea_max" href="javascript:zoomtextarea(2,'<%=this.TxtSmsRefund.ClientID %>');"></a>  
                    </td>
                 </tr>
                  <tr>
                    <td class="lefttd" align="right" style="width: 198px">
                    <strong>开发票后手机短信内容：</strong><br />可用标签详见下面的标签说明
                    </td>
                    <td class="righttd">
                     &nbsp;<asp:TextBox  CssClass="textbox textarea" ID="TxtSmsInvoice" TextMode="multiLine" runat="server" Width="425px" Height="50px"></asp:TextBox>
                                           <a class="textarea_min" href="javascript:zoomtextarea(-2,'<%=this.TxtSmsInvoice.ClientID %>');"> </a>
                                           <a class="textarea_max" href="javascript:zoomtextarea(2,'<%=this.TxtSmsInvoice.ClientID %>');"></a>  
                    </td>
                 </tr>
                  <tr>
                    <td class="lefttd" align="right" style="width: 198px">
                    <strong>发出货物后手机短信内容：</strong><br />可用标签详见下面的标签说明
                    <br />快递公司标签：{$Express} 快递单标签：{$ExpressNo}
                    </td>
                    <td class="righttd">
                     &nbsp;<asp:TextBox  CssClass="textbox textarea" ID="TxtSmsShipping" TextMode="multiLine" runat="server" Width="425px" Height="50px"></asp:TextBox>
                       <a class="textarea_min" href="javascript:zoomtextarea(-2,'<%=this.TxtSmsShipping.ClientID %>');"> </a>
                       <a class="textarea_max" href="javascript:zoomtextarea(2,'<%=this.TxtSmsShipping.ClientID %>');"></a>  

                    </td>
                 </tr>
                 <tr>
                    <td class="lefttd" align="right" style="width: 198px">
                    <strong>订单作废时手机短信内容：</strong><br />
可用标签详见下面的标签说明,作废原因标签：{$VoidBecause}
                    </td>
                    <td class="righttd">
                     &nbsp;<asp:TextBox  CssClass="textbox textarea" ID="TxtSmsOrdercancel" TextMode="multiLine" runat="server" Width="425px" Height="50px"></asp:TextBox>
                       <a class="textarea_min" href="javascript:zoomtextarea(-2,'<%=this.TxtSmsOrdercancel.ClientID %>');"> </a>
                       <a class="textarea_max" href="javascript:zoomtextarea(2,'<%=this.TxtSmsOrdercancel.ClientID %>');"></a>  
                    </td>
                 </tr>
                 <tr>
                    <td class="lefttd" align="right" style="width: 198px">
                    <strong>手机短信提醒付款的内容：</strong><br />
可用标签详见下面的标签说明
                    </td>
                    <td class="righttd">
                     &nbsp;<asp:TextBox  CssClass="textbox textarea" ID="TxtSmsPayTips" TextMode="multiLine" runat="server" Width="425px" Height="50px"></asp:TextBox>
                       <a class="textarea_min" href="javascript:zoomtextarea(-2,'<%=this.TxtSmsPayTips.ClientID %>');"> </a>
                       <a class="textarea_max" href="javascript:zoomtextarea(2,'<%=this.TxtSmsPayTips.ClientID %>');"></a>  
                    </td>
                 </tr>

                 

                  <tr>
                    <td class="lefttd" align="right" style="width: 198px">
                    <strong>标签含义：</strong>
                    </td>
                    <td class="righttd">
                     {$OrderID} --定单ID号<br />
                     {$ProductList} --商品清单<br />
{$ContactMan} --收货人姓名<br />
{$UserName} --订单所属用户名<br />
{$InputTime} --订单提交时间<br />
{$SiteName} --网站名称<br />
                    </td>
                 </tr>
            </table>
        </div>
        
        
		 <div class="tab-page" id="tab2">
		  <h2 class="tab">邮件模板</h2>
			<script type="text/javascript">
				 tabPane1.addTabPage( document.getElementById( "tab2" ) );
			</script>
             <table width="100%"  border="0" cellpadding="1" cellspacing="1" class="CTable"> 
             
                 <tr>
                    <td class="lefttd" align="right" style="width: 198px">
                    <strong>新订单邮件提醒管理员：</strong>
                    </td>
                    <td class="righttd">
                     <asp:RadioButtonList ID="RdbShopNewOrderEmailTF" runat="server" RepeatLayout="Flow" RepeatDirection="Horizontal">
                      <asp:ListItem Value="0">不启用</asp:ListItem>
                      <asp:ListItem Value="1">有新订单就提醒</asp:ListItem>
                      <asp:ListItem Value="2">新订单和会员成功付款提醒</asp:ListItem>
                      <asp:ListItem Value="2">仅提醒会员成功付款的订单</asp:ListItem>
                     </asp:RadioButtonList>
                    </td>
                 </tr>
                 <tbody id="ShowEmail">
                 <tr>
                    <td class="lefttd" align="right" style="width: 198px">
                    <strong>新订单接收提醒的邮箱：</strong>
                    </td>
                    <td class="righttd">
                    &nbsp;<asp:TextBox ID="TxtShopNewOrderReceiveEmail" runat="server" CssClass="textbox textarea" Width="200px" />
                   
                    </td>
                 </tr>
                  <tr>
                    <td class="lefttd" align="right" style="width: 198px">
                    <strong>新订单接收提醒的邮件内容：</strong><br />
                    支持HTML代码，可用标签详见下面的标签说明 
                    </div></td>
                    <td class="righttd">
                     &nbsp;<asp:TextBox  CssClass="textbox textarea" ID="TxtNewOrderTemplate" TextMode="multiLine" runat="server" Width="425px" Height="50px"></asp:TextBox>
                    </td>
                 </tr>
</tbody>
             
             
                  <tr style="display:none">
                    <td class="lefttd" align="right" style="width: 198px">
                    <strong>确认订单时站内短信/Email通知内容：</strong><br />
支持HTML代码，可用标签详见下面的标签说明
                    </td>
                    <td class="righttd">
                     &nbsp;<asp:TextBox  CssClass="textbox textarea" ID="TxtConfirmTemplate" TextMode="multiLine" runat="server" Width="425px" Height="70px"></asp:TextBox>
                    </td>
                 </tr>
                  
                  <tr>
                    <td class="lefttd" align="right" style="width: 198px">
                    <strong>支付成功后站内短信/Email通知内容：</strong><br />
支持HTML代码，可用标签详见下面的标签说明
                    </td>
                    <td class="righttd">
                     &nbsp;<asp:TextBox  CssClass="textbox textarea" ID="TxtReceiveBankTemplate" TextMode="multiLine" runat="server" Width="425px" Height="70px"></asp:TextBox>
                       <a class="textarea_min" href="javascript:zoomtextarea(-2,'<%=this.TxtReceiveBankTemplate.ClientID %>');"> </a>
                       <a class="textarea_max" href="javascript:zoomtextarea(2,'<%=this.TxtReceiveBankTemplate.ClientID %>');"></a>  
                    </td>
                 </tr>
                  <tr>
                    <td class="lefttd" align="right" style="width: 198px">
                    <strong>退货退款后站内短信/Email通知内容：</strong><br />
支持HTML代码，可用标签详见下面的标签说明
                    </td>
                    <td class="righttd">
                     &nbsp;<asp:TextBox  CssClass="textbox textarea" ID="TxtRefundTemplate" TextMode="multiLine" runat="server" Width="425px" Height="70px"></asp:TextBox>
                       <a class="textarea_min" href="javascript:zoomtextarea(-2,'<%=this.TxtRefundTemplate.ClientID %>');"> </a>
                       <a class="textarea_max" href="javascript:zoomtextarea(2,'<%=this.TxtRefundTemplate.ClientID %>');"></a>  
                    </td>
                 </tr>
                  <tr>
                    <td class="lefttd" align="right" style="width: 198px">
                    <strong>开发票后站内短信/Email通知内容：</strong><br />
支持HTML代码，可用标签详见下面的标签说明
                    </td>
                    <td class="righttd">
                     &nbsp;<asp:TextBox  CssClass="textbox textarea" ID="TxtInvoiceTemplate" TextMode="multiLine" runat="server" Width="425px" Height="70px"></asp:TextBox>
                       <a class="textarea_min" href="javascript:zoomtextarea(-2,'<%=this.TxtInvoiceTemplate.ClientID %>');"> </a>
                       <a class="textarea_max" href="javascript:zoomtextarea(2,'<%=this.TxtInvoiceTemplate.ClientID %>');"></a>  
                    </td>
                 </tr>
                  <tr>
                    <td class="lefttd" align="right" style="width: 198px">
                    <strong>发出货物后站内短信/Email通知内容：</strong><br />
支持HTML代码，可用标签详见下面的标签说明 <br />快递公司标签：{$Express} 快递单标签：{$ExpressNo}
                    </td>
                    <td class="righttd">
                     &nbsp;<asp:TextBox  CssClass="textbox textarea" ID="TxtShippingTemplate" TextMode="multiLine" runat="server" Width="425px" Height="70px"></asp:TextBox>
                       <a class="textarea_min" href="javascript:zoomtextarea(-2,'<%=this.TxtShippingTemplate.ClientID %>');"> </a>
                       <a class="textarea_max" href="javascript:zoomtextarea(2,'<%=this.TxtShippingTemplate.ClientID %>');"></a>  
                    </td>
                 </tr>
                 <tr>
                    <td class="lefttd" align="right" style="width: 198px">
                    <strong>订单作废时站内短信/Email通知内容：</strong><br />
支持HTML代码，可用标签详见下面的标签说明,作废原因标签：{$VoidBecause}
                    </td>
                    <td class="righttd">
                     &nbsp;<asp:TextBox  CssClass="textbox textarea" ID="TxtCanceledTemplate" TextMode="multiLine" runat="server" Width="425px" Height="70px"></asp:TextBox>
                       <a class="textarea_min" href="javascript:zoomtextarea(-2,'<%=this.TxtCanceledTemplate.ClientID %>');"> </a>
                       <a class="textarea_max" href="javascript:zoomtextarea(2,'<%=this.TxtCanceledTemplate.ClientID %>');"></a>  
                    </td>
                 </tr>
                 <tr>
                    <td class="lefttd" align="right" style="width: 198px">
                    <strong>提醒付款的站内短信/Email通知内容：</strong><br />
支持HTML代码，可用标签详见下面的标签说明
                    </td>
                    <td class="righttd">
                     &nbsp;<asp:TextBox  CssClass="textbox textarea" ID="TxtPayTipsTemplate" TextMode="multiLine" runat="server" Width="425px" Height="70px"></asp:TextBox>
                       <a class="textarea_min" href="javascript:zoomtextarea(-2,'<%=this.TxtPayTipsTemplate.ClientID %>');"> </a>
                       <a class="textarea_max" href="javascript:zoomtextarea(2,'<%=this.TxtPayTipsTemplate.ClientID %>');"></a>  
                    </td>
                 </tr>
                  <tr>
                    <td class="lefttd" align="right" style="width: 198px">
                    <strong>标签含义：</strong>
                    </td>
                    <td class="righttd">
                     {$OrderID} --定单ID号<br />
{$ContactMan} --收货人姓名<br />
{$UserName} --订单所属用户名<br />
{$InputTime} --订单提交时间<br />
{$OrderInfo} --订单详细信息<br />
                    </td>
                 </tr>
                  <tr>
                    <td class="lefttd" align="right" style="width: 198px">
                    <strong>发放优惠券邮件内容：</strong><br />
支持HTML代码，可用标签{$SiteName},{$CouponNum},{$UserName},{$FaceValue},{$BeginDate},{$EndDate}
                    </td>
                    <td class="righttd">
                     &nbsp;<asp:TextBox  CssClass="textbox textarea" ID="TxtCouponTemplate" TextMode="multiLine" runat="server" Width="425px" Height="80px"></asp:TextBox>
                       <a class="textarea_min" href="javascript:zoomtextarea(-2,'<%=this.TxtCouponTemplate.ClientID %>');"> </a>
                       <a class="textarea_max" href="javascript:zoomtextarea(2,'<%=this.TxtCouponTemplate.ClientID %>');"></a>  
                    </td>
                 </tr>
                 
              </table>
         </div>        
        
        <div class="tab-page" id="tab3">
		  <h2 class="tab">订单详情模板</h2>
			<script type="text/javascript">
				 tabPane1.addTabPage( document.getElementById( "tab3" ) );
			</script>
             <table width="100%"  border="0" cellpadding="1" cellspacing="1" class="CTable"> 
                  <tr>
                    <td class="lefttd" align="right" style="width: 198px">
                    <strong>订单打印模板：</strong><br />
支持HTML代码
                    </td>
                    <td class="righttd">
                    <asp:TextBox  CssClass="textbox textarea" ID="TxtOrderPrintTemplate" style="width:600px;height:300px" TextMode="multiLine" runat="server" Width="425px" Height="70px"></asp:TextBox>
                       <a class="textarea_min" href="javascript:zoomtextarea(-2,'<%=this.TxtOrderPrintTemplate.ClientID %>');"> </a>
                       <a class="textarea_max" href="javascript:zoomtextarea(2,'<%=this.TxtOrderPrintTemplate.ClientID %>');"></a>  
                    </td>
                 </tr>
             </table>
       </div> 
       
       <div class="tab-page" id="express">
		  <h2 class="tab">发货信息配置</h2>
			<script type="text/javascript">
			    tabPane1.addTabPage(document.getElementById("express"));
			</script>
             <table width="100%"  border="0" cellpadding="1" cellspacing="1" class="CTable"> 
                  <tr>
                    <td class="lefttd" align="right">
                    <strong>公司名称：</strong></td>
                    <td class="righttd">
                    <asp:TextBox  CssClass="textbox" ID="TxtExpressCompanyName" runat="server" Width="300px"></asp:TextBox>
                    </td>
                 </tr>
                  <tr>
                    <td class="lefttd" align="right">
                    <strong>发货人姓名：</strong></td>
                    <td class="righttd">
                    <asp:TextBox  CssClass="textbox" ID="TxtExpressContactMan" runat="server" Width="300px"></asp:TextBox>
                    </td>
                 </tr>
                  <tr>
                    <td class="lefttd" align="right">
                    <strong>发货详细地址：</strong></td>
                    <td class="righttd">
                    <asp:TextBox  CssClass="textbox" ID="TxtExpressAdress" runat="server" Width="300px"></asp:TextBox>
                    </td>
                 </tr>
                  <tr>
                    <td class="lefttd" align="right">
                    <strong>发货地邮编：</strong></td>
                    <td class="righttd">
                    <asp:TextBox  CssClass="textbox" ID="TxtExpressZipCode" runat="server" Width="300px"></asp:TextBox>
                    </td>
                 </tr>
                  <tr>
                    <td class="lefttd" align="right">
                    <strong>发货人手机：</strong></td>
                    <td class="righttd">
                    <asp:TextBox  CssClass="textbox" ID="TxtExpressMobile" runat="server" Width="300px"></asp:TextBox>
                    </td>
                 </tr>
                  <tr>
                    <td class="lefttd" align="right">
                    <strong>发货人电话：</strong></td>
                    <td class="righttd">
                    <asp:TextBox  CssClass="textbox" ID="TxtExpressPhone" runat="server" Width="300px"></asp:TextBox>
                    </td>
                 </tr>
                  <tr>
                    <td class="lefttd" align="right">
                    <strong>其它说明1：</strong></td>
                    <td class="righttd">
                    <asp:TextBox  CssClass="textbox" ID="TxtExpressOther1" runat="server" Width="300px"></asp:TextBox>
                    </td>
                 </tr>
                  <tr>
                    <td class="lefttd" align="right">
                    <strong>其它说明2：</strong></td>
                    <td class="righttd">
                    <asp:TextBox  CssClass="textbox" ID="TxtExpressOther2" runat="server" Width="300px"></asp:TextBox>
                    </td>
                 </tr>
                  <tr>
                    <td class="lefttd" align="right">
                    <strong>其它说明3：</strong></td>
                    <td class="righttd">
                    <asp:TextBox  CssClass="textbox" ID="TxtExpressOther3" runat="server" Width="300px"></asp:TextBox>
                    </td>
                 </tr>
                  <tr>
                    <td class="lefttd" align="right">
                    <strong>其它说明4：</strong></td>
                    <td class="righttd">
                    <asp:TextBox  CssClass="textbox" ID="TxtExpressOther4" runat="server" Width="300px"></asp:TextBox>
                    </td>
                 </tr>
                  <tr>
                    <td class="lefttd" align="right">
                    <strong>其它说明5：</strong></td>
                    <td class="righttd">
                    <asp:TextBox  CssClass="textbox" ID="TxtExpressOther5" runat="server" Width="300px"></asp:TextBox>
                      <div class="tips">TIPS:以上录入框如果文字太长，可以输入&lt;br&gt;换行。</div>

                    </td>
                 </tr>
             </table>
       </div>
        
        
    </div>
    
    
    
    
    
    <br />
    <br style="clear:both" />
        <br />
    <KS:Foot runat="server" CancelButtonEnabled="false" ID="Foot1" OnSubmit="Foot1_Submit"/>
    <KS:Tips ID="Tips1" runat="server" ImagePath="../../admin/images/" />

</asp:Content>

