<%@ Control Language="C#" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.Shop.OrderDetailControl" Codebehind="OrderDetailControl.ascx.cs" %>
<%@ Import Namespace="Kesion.Cache"%>
<%@ Import Namespace="Kesion.Publics"%>
<%@ Import Namespace="Kesion.APPCode"%>
<%@ Import Namespace="Kesion.BLL"%>
<KS:TopNav ID="TopNav1" runat="server" Text="查看订单详细信息" />


<asp:PlaceHolder ID="PlaceHolder1" runat="server">
<style>
 .wait,.wff,.wfk,.wxf{color:red;}
 .yff,.yfq, .yqs, .confirm,.yxf{color:green;}
.wx{color:#999;}
.jq{color:#888;}
.ddff{color:brown;}
.list_link{line-height:22px;border-left:1px solid #efefef;padding:5px;}
.border .img img{border:1px solid #ccc;padding:1px;}
</style>
<div class="message"><strong>

    订单编号：<asp:Label ID="LabOrderID" runat="server" Text="Label"></asp:Label>
            <%=dr["orderType"].ToString().Equals("1")?" <font color=red>团购</font>":"" %>
           
           
    订单状态：<%=Kesion.APPCode.OrderProcess.GetOrderStatus(false,Utils.StrToInt(dr["orderType"].ToString()), dr["OrderID"].ToString(), Utils.StrToInt(dr["ConsumptionMode"].ToString()), Utils.StrToInt(dr["IsBusinessConfirm"].ToString()), dr["alipaytradestatus"].ToString(), Utils.StrToInt(dr["status"].ToString()), Utils.StrToInt(dr["DeliverStatus"].ToString()), Utils.StrToDecimal(dr["MoneyReceipt"].ToString()), Utils.StrToDecimal(dr["OrderTotalPrice"].ToString())) %>
    
    
    <br />
<%if (MyCache.GetShopCommonConfig(41).Equals("1")){
  if (!string.IsNullOrEmpty(dr["business"].ToString())){ %>
  所属商家：<%=dr["business"].ToString() %>
      <br />商家确认：<%=Utils.StrToInt(dr["IsBusinessConfirm"].ToString())>0?"<span style='color:green'>已确认消费</span>":"<span style='color:red'>未确认消费</span>" %>
<%}
  }%>


    <%=Utils.StrToInt(dr["OrderType"].ToString())==0?"":Utils.StrToInt(dr["ConsumptionMode"].ToString())==1?" <span style='color:green'>物流</span>":" <span style='color:blue'>凭单</span>" %>

      </strong>
  </div>


<table border="0" cellpadding="2" cellspacing="1"  width="99%" class="CTable">
   <tr align="center" class="CTitle">
        <td  style="text-align:left;">
            <b>送货信息</b> (定购人：<font color='red'><asp:Label ID="LabUserName" runat="server" Text="Label"></asp:Label></font> <asp:Label ID="LabIsAnonymous" runat="server" Text="Label"></asp:Label>
           &nbsp; 定购时间：<asp:Label ID="LabInputTime" runat="server" Text="Label"></asp:Label>)
        </td>
    </tr>

  
    <tr>
     <td height="35">
     
              <div style='padding-left:63px;<%=(dr["orderType"].ToString()=="1" && dr["ConsumptionMode"].ToString()=="1") ?"display:none":"" %>'>
         联系手机：<%=dr["mobile"].ToString() %>
              <%if (!string.IsNullOrEmpty(dr["verifycode"].ToString())){ %>
              （手机验证码：<%=dr["verifycode"].ToString() %>)
              <%} %>
      
        <%if (!string.IsNullOrEmpty(dr["remark"].ToString())){ %>
         <br />订单附言：<%=dr["remark"].ToString() %>
      <%} %>
        </div>

     
    
     
   <table cellspacing="1" cellpadding="2" width="100%" align=center border=0 <%=(dr["ConsumptionMode"].ToString()!="0") ?"":" style='display:none'" %>>
    <tr class=tdbg>
      <td align=right width="12%">收货人姓名：</td>
      <td width="38%"><asp:Label ID="LabContactMan" runat="server" Text=""></asp:Label></td>
      <td align=right width="12%">联系电话：</td>
      <td width="38%">
          <asp:Label ID="LabMobile" runat="server" Text=""></asp:Label> <asp:Label ID="LabTel" runat="server" Text=""></asp:Label></td>
    </tr>
    <tr class=tdbg vAlign=top>
      <td align=right width="12%">收货人地址：</td>
      <td width="38%">
          <%=string.Concat(MyCache.GetAreaName(Convert.ToInt16(dr["provinceid"].ToString()), "city"), MyCache.GetAreaName(Convert.ToInt16(dr["cityid"].ToString()), "city"), MyCache.GetAreaName(Convert.ToInt16(dr["countyid"].ToString()), "city"), dr["address"].ToString()) %></td>
      <td align=right width="12%">邮政编码：</td>
      <td width="38%"><%=dr["zipCode"].ToString()%></td>
    </tr>
    <tr class=tdbg>
      <td align=right width="12%">收货人邮箱：</td>
      <td width="38%"><%=dr["Email"].ToString()%></td>
      <td align=right width="12%">送货方式：</td>
      <td width="38%">
          <asp:Label ID="LabDeliveyType" runat="server" Text=""></asp:Label>
          </td>
    </tr>
    <tr class=tdbg>
      <td align=right width="12%">付款方式：</td>
      <td width="38%">
          <asp:Label ID="LabPayType" runat="server" Text=""></asp:Label></td>
      <td align=right width="12%">送货时间：</td>
      <td width="38%"><%=dr["DeliveryTime"].ToString()%></td>
    </tr>
    <tr class=tdbg vAlign=top>
      <td align=right width="12%">送货日期：</td>
      <td width="38%"><%=dr["DeliveryDate"].ToString() == "0" ? dr["SpecifiedDate"].ToString() : dr["DeliveryDate"].ToString()%></td>
         <td align=right width="12%">
              订单附言：</td>
      <td width="38%"><%=dr["Remark"].ToString()%></td>
    </tr>
         </table>

     </td>
    
    </tr>
     <%if (dr["IsInvoice"].ToString() != "0")
           { %>
     <tr class="CTitle">
        <td style="text-align:left;"><b>发票信息</b> (<%=dr["Invoiced"].ToString()=="1"?"<font color=green>已开</font>":"<font color=red>未开</font>" %>)</td>
    </tr>
    <tr>
        <td style="text-align:left;height:26px;padding:2px 0px 0px 20px;">
            <asp:Label ID="LabInvoice" runat="server" Text=""></asp:Label>
        </td>
    </tr>
    <%} %>
     <tr class="CTitle">
        <td style="text-align:left;"><b>商品清单</b></td>
    </tr>
    <tr>
    <td>	
    
       <asp:GridView ID="GVGroupBuy" style="border-bottom:none" runat="server" AutoGenerateColumns="False" CssClass="CTable" EmptyDataText="没有数据!"  Width="99%" CellPadding="1" CellSpacing="1" GridLines="None">
         <Columns>
         
              <asp:TemplateField HeaderText="商品图片">
                <itemstyle horizontalalign="Center"/>
                <itemtemplate>
                    <img onerror="this.src='../../sysimg/nopic.gif'" src='<%# string.IsNullOrEmpty(Convert.ToString(Eval("photourl")))?MyCache.GetCacheShopConfig(9):Kesion.BLL.BaseFun.GetFullImageSrc(Convert.ToString(Eval("PhotoUrl")))  %>' width="40" height="40" style="border:1px solid #efefef;padding:1px" />
                </itemtemplate>
              </asp:TemplateField>
              <asp:TemplateField HeaderText="团购商品名称">
                <itemstyle horizontalalign="Left" width="350px" />
                <itemtemplate>
                 <a href="<%# Kesion.HtmlTags.BasicField.GetGroupBuyUrl(Convert.ToInt32(Eval("id"))) %>" target="_blank"><%# Eval("subject").ToString() %></a>
                </itemtemplate>
              </asp:TemplateField>

               <asp:TemplateField HeaderText="数量">
                <itemstyle horizontalalign="Center" />
                <itemtemplate>
                   <%# Eval("Num") %>
                </itemtemplate>
              </asp:TemplateField>
               <asp:TemplateField HeaderText="单件重量">
                <itemstyle horizontalalign="Center" />
                <itemtemplate>
                   <%#  string.Format("{0:G2} 公斤", Utils.StrToFloat(Eval("Weight")))%>
                </itemtemplate>
              </asp:TemplateField>

              <asp:TemplateField HeaderText="原价">
                <itemstyle horizontalalign="Center"/>
                <itemtemplate>
               <%=MyCache.GetCurrencySymbol %><%# Public.ReturnShopPrice(Utils.StrToDecimal(Eval("Price_Market")))%>
                </itemtemplate>
              </asp:TemplateField> 

              <asp:TemplateField HeaderText="团购价">
                <itemstyle horizontalalign="Center"/>
                <itemtemplate>
                <%=MyCache.GetCurrencySymbol %><%# Public.ReturnShopPrice(Utils.StrToDecimal(Eval("Price")))%>
                </itemtemplate>
              </asp:TemplateField> 
              <asp:TemplateField HeaderText="小计">
                <itemstyle horizontalalign="Center"/>
                <itemtemplate>
                <%=MyCache.GetCurrencySymbol %><%# Public.ReturnShopPrice(Utils.StrToDecimal(Eval("TotalPrice")))%>
                </itemtemplate>
              </asp:TemplateField> 

                <asp:TemplateField HeaderText="备注">
                <itemstyle horizontalalign="Center"/>
                <itemtemplate>
                    <%#Eval("remark") %>
                </itemtemplate>
              </asp:TemplateField>
         </Columns>
             <HeaderStyle CssClass="Title" Height="23px" />
             <RowStyle CssClass="tdbg" Height="22px" />
        </asp:GridView>
    	
        
         <asp:GridView ID="OrderItemList" style="border-bottom:none" runat="server" AutoGenerateColumns="False" CssClass="CTable" EmptyDataText="没有数据!"  Width="99%" CellPadding="1" CellSpacing="1" GridLines="None">
         <Columns>
         
              <asp:TemplateField HeaderText="商品图片">
                <itemstyle horizontalalign="Center" />
                <itemtemplate>
                    <img onerror="this.src='../../sysimg/nopic.gif'" src='<%# string.IsNullOrEmpty(Convert.ToString(Eval("DefaultPic")))?MyCache.GetCacheShopConfig(9):Kesion.BLL.BaseFun.GetFullImageSrc(Convert.ToString(Eval("DefaultPic")))  %>' width="60" height="45" style="border:1px solid #efefef;padding:1px" />
                </itemtemplate>
              </asp:TemplateField>
              <asp:TemplateField HeaderText="商品名称">
                <itemstyle horizontalalign="Left" />
                <itemtemplate>
                    <%# getProOrder(Utils.StrToInt((Eval("ClassID"))), Convert.ToString(Eval("FileName") + ""), Convert.ToString(Eval("TurnUrl") + ""), Utils.StrToInt(Eval("ItemID")), Utils.StrToInt(Eval("ChannelID")), Utils.StrToInt(Eval("InfoID")), string.IsNullOrEmpty(Convert.ToString(Eval("ITitle") + "")) ? Convert.ToString(Eval("Title") + "") : Convert.ToString(Eval("ITitle")), Utils.StrToInt(Eval("isBundleSale")), Utils.StrToInt(Eval("isChangeBuy")), Utils.StrToInt(Eval("isLimitBuy")),Convert.ToString(Eval("AttributeCart")),Utils.StrToInt(Eval("attrID")))%>
                </itemtemplate>
              </asp:TemplateField>
              <asp:TemplateField HeaderText="参与优惠">
                <itemstyle horizontalalign="Center" />
                <itemtemplate>
                   <%# Utils.StrToInt(Eval("IsPromotions"))==1?"是":"否"%>
                </itemtemplate>
              </asp:TemplateField>
              <asp:TemplateField HeaderText="发货方式">
                <itemstyle horizontalalign="Center" />
                <itemtemplate>
                   <%# Utils.StrToInt(Eval("producttype"))==2?"网上下载":"快递发送"%>
                </itemtemplate>
              </asp:TemplateField>

               <asp:TemplateField HeaderText="数量">
                <itemstyle horizontalalign="Center" />
                <itemtemplate>
                   <%# Convert.ToInt16(Eval("isBundleSale"))==1?"--":Convert.ToString(Eval("Num"))+" "+Convert.ToString(Eval("Unit")) %>
                </itemtemplate>
              </asp:TemplateField>
               <asp:TemplateField HeaderText="单件重量"  Visible="false">
                <itemstyle width="80px" horizontalalign="Center" />
                <itemtemplate>
                   <%# Utils.StrToInt(Convert.ToString(Eval("isBundleSale"))) == 1 ? "--" : string.Format("{0:G2} 公斤",Utils.StrToFloat(Convert.ToString(Eval("Weight"))))%>
                </itemtemplate>
              </asp:TemplateField>
               <asp:TemplateField HeaderText="单件积分"  Visible="false">
                <itemstyle width="80px" horizontalalign="Center" />
                <itemtemplate>
                   <%# Utils.StrToInt(Convert.ToString(Eval("isBundleSale"))) == 1 ? "--" : string.Format("{0:G2} 分", Utils.StrToFloat(Convert.ToString(Eval("Score"))))%>
                </itemtemplate>
              </asp:TemplateField>
              <asp:TemplateField HeaderText="市场价" Visible="false">
                <itemstyle horizontalalign="Center" width="50px"/>
                <itemtemplate>
                <%=MyCache.GetCurrencySymbol %><%# Public.ReturnShopPrice(Utils.StrToDecimal(Eval("Price_Market")))%>
                </itemtemplate>
              </asp:TemplateField> 
              <asp:TemplateField HeaderText="实价">
                <itemstyle horizontalalign="Center"/>
                <itemtemplate>
                    <%# Utils.StrToInt(Eval("changescore")) > 0 ? Eval("changescore") + "分" : string.Empty %>
                   <%# Convert.ToDecimal(Eval("price")) > 0 && Utils.StrToInt(Eval("changescore")) > 0 ? "+" : string.Empty%>
                   <%# Convert.ToDecimal(Eval("price")) > 0 ? MyCache.GetCurrencySymbol+Public.ReturnShopPrice(Utils.StrToDecimal(Eval("Price"))) : string.Empty%>

                </itemtemplate>
              </asp:TemplateField> 
              
              <asp:TemplateField HeaderText="小计">
                <itemstyle horizontalalign="Center" width="90px"/>
                <itemtemplate>
                   <%# Utils.StrToInt(Eval("changescore")) > 0 ? Utils.StrToInt(Eval("changescore")) * Utils.StrToInt(Eval("num")) + "分" : string.Empty%>
                   <%# Convert.ToDecimal(Eval("TotalPrice")) > 0 && Utils.StrToInt(Eval("changescore")) > 0 ? "+" : string.Empty%>
                   <%# Convert.ToDecimal(Eval("TotalPrice")) > 0 ? MyCache.GetCurrencySymbol + Public.ReturnShopPrice(Utils.StrToDecimal(Eval("TotalPrice"))) : string.Empty%>

                </itemtemplate>
              </asp:TemplateField> 

            
            
              <asp:TemplateField HeaderText="备注">
                <itemstyle horizontalalign="Center"/>
                <itemtemplate>
                    <%#Eval("remark") %>
                </itemtemplate>
              </asp:TemplateField>
         </Columns>
             <HeaderStyle CssClass="Title" Height="23px" />
             <RowStyle CssClass="tdbg" Height="22px" />
        </asp:GridView>
        
        <table border="0" cellpadding="0" cellspacing="0" class="CTable" style="border-top:none" width="99%">
        <tr>
         <td height="40" style="padding:3px"class="tdbg">
             商品金额：<%=MyCache.GetCurrencySymbol %><asp:Label ID="LabGoodsMoney" runat="server" Text="Label"></asp:Label> <%=MyCache.GetCurrencyUnit %>&nbsp;运费：<%=MyCache.GetCurrencySymbol %><asp:Label ID="LabFreight" runat="server" Text="Label"></asp:Label> <%=MyCache.GetCurrencyUnit %>
         
         支付方式可优惠：<span style="color:green"><%=MyCache.GetCurrencySymbol %><asp:Label ID="LabPayDiscount" runat="server" Text="Label"></asp:Label></span> <%=MyCache.GetCurrencyUnit %><span style="color:green"><asp:Label 
                 ID="LabCouponTips" runat="server"></asp:Label></span>
              <%if (Utils.StrToInt(dr["OrderScore"].ToString())>0){ %>
         可得积分： <asp:Label ID="LabScore" runat="server" ForeColor="red" Text=""></asp:Label> 分
          <%}
            if (Utils.StrToInt(dr["changescore"].ToString()) > 0)
            {
                Response.Write("&nbsp;&nbsp;<font color=green>本单为积分兑换订单，已支付积分<font color=brown>" + dr["changescore"].ToString() + "</font>分</font>");
            } %>
         <br />
         订单金额：商品金额-支付方式优惠+运费+税金-优惠券金额＝<%=MyCache.GetCurrencySymbol %><asp:Label ID="LabNoUseCouponMoney" runat="server" Text="0"></asp:Label> <%=MyCache.GetCurrencyUnit %>         </td>
         <td class="tdbg" width="300">
         订单金额：<span style="color:#555"><%=MyCache.GetCurrencySymbol %><asp:Label ID="LabNoUseCouponMoney1" runat="server" Text="Label"></asp:Label></span> <%=MyCache.GetCurrencyUnit %>
         已付款：<span style="color:Red"><%=MyCache.GetCurrencySymbol %><asp:Label ID="LabMoneyReceive" runat="server" Text="Label"></asp:Label></span> <%=MyCache.GetCurrencyUnit %>
        <%  if (Utils.StrToDecimal(dr["savemoney"].ToString()) > 0)
            {
                Response.Write("<br/><font color=green>本单商城活动优惠： <font color=brown>"+MyCache.GetCurrencySymbol + Kesion.APPCode.Public.ReturnShopPrice(dr["savemoney"].ToString()) + MyCache.GetCurrencyUnit+"</font></font>");
            } %>
             
              <br />
         应付金额：<span style="font-weight:bold;font-size:15px;color:#ff6600"><%=MyCache.GetCurrencySymbol %><asp:Label ID="LabTotalOrderMoney" runat="server" Text="Label"></asp:Label></span> <%=MyCache.GetCurrencyUnit %> 尚欠款：<span style="color:blue"><%=MyCache.GetCurrencySymbol %><asp:Label ID="LabNoPayMoney" runat="server" Text="Label"></asp:Label></span> <%=MyCache.GetCurrencyUnit %>
        
         </td>
        </tr>
        </table>
        <br />

         &nbsp;&nbsp;注:<font color=blue>“市场价”</font>指的是下单时的市场参考价格,<font color=red>“实价”</font>指的是系统自动计算出来的商品最终销售价格。“订单金额”指系统自动算出来的价格，本订单的最终价格以“应付金额”为准。

        <br />
   </td>
   </tr>
</table>

<asp:Panel ID="PanelConsumer" runat="server">
    <div style="margin:15px 0px 5px 7px"><B>本单跟踪记录</B>  </div>

    <script>
        var box='';
        function showOrderDetail(statusCode){
            var w=800;
            box=jQuery.dialog.open("content/showbox.aspx?action=order&orderid=<%=dr["orderid"].ToString()%>&statusCode="+statusCode,{ 
                title:'查看详情记录',
                width:w,
                height:415,

                cancelVal: '取消',
                max:false,
                min:false,
                cancel: true /*为true等价于function(){}*/ 
            });
        }
    </script>
    <asp:Repeater ID="RepeaterConsumer" runat="server" >
          <HeaderTemplate>
            <table class="CTable" cellSpacing=1 cellPadding=2 width="99%" align="center" border=0>
                <tr align="center" class="CTitle" >
        	   <td style="width:150px;text-align:center">处理时间</td>
                <td align="Left">处理信息</td>
        	    <td align="center">操作人</td>
        	    <td align="center">详情</td>
              </tr>

          </HeaderTemplate>
           <ItemTemplate>
           <tr class="tdbg">
              <td class="Ctd" align="center"><%# Eval("Adddate") %> </td>
              <td class="Ctd" style="width:180px;word-break:break-all">
              <%# Eval("Remark") %>
              </td>
              <td class="Ctd" align="center"><%# Eval("inputer") %></td>
               <td class="splittd" align="center">
                 <%#  Convert.ToString(Eval("StatusCode"))=="6" ||(Convert.ToString(Eval("StatusCode"))=="4" && dr["OrderType"].ToString()=="1")?"<a href='javascript:;' onclick='showOrderDetail("+ Eval("statusCode") +")'>查看详情</a>":( Convert.ToString(Eval("StatusCode"))=="3"?"<a href='javascript:;' onclick='showOrderDetail("+ Eval("statusCode") +")'>查看物流</a>":"-") %> 
              </td>
           </tr>     
           </ItemTemplate>

         <FooterTemplate>
             <tr class="tdbg" style="display:<%# bool.Parse((RepeaterConsumer.Items.Count==0).ToString())?"":"none"%>">
                <td class="splittd" style="text-align:center" colspan="7">
                  还没有跟踪记录!
                </td>
               </tr> 
            </table>
        </FooterTemplate>
    </asp:Repeater>

   
</asp:Panel>


 </asp:PlaceHolder>






<table width="100%" align="center" id="showDelviery" runat="server" visible="false">
<tr>
 <td>
  <script type="text/javascript">
		showtips(' <asp:Label ID="LabDeliveryInfo" runat="server"></asp:Label>');
		</script>
 </td>
</tr>
</table>

<div style="text-align:center" class="footer_page">
   <asp:Panel ID="printPanel" runat="server" HorizontalAlign="center" Visible="false">
        <input type="button" class="button" id="btnPrints" value="打印..." onclick="jQuery('#<%=this.printPanel.ClientID %>').hide();window.print();return false;"/>
        <input type="button" class="button" id="showOrder" value="取消返回" onclick="history.back();" /><br /><br />
        </asp:Panel>
        <asp:Panel ID="footPanel" runat="server">
        
        <%if (dr["status"].ToString() == "4")
          {
         %>
         <input type='button' class='button' name='Submit' value='同意退款，并结清订单' onClick="returns();">&nbsp;
		 <input type='button' class='button' name='Submit'  value='已和客户妥协订单恢复正常' onclick=KesionJS.Confirm("确定将本订单恢复正常状态吗？","location.href='KS.ShopOrder.aspx?Action=BankRefundOK&ID=<%=id%>';","")>
         <%}
          else
          { %>
            <%if (KSSecurity.CheckPurview(2)){ %>
        <input type="button" class="button" id="bankPayBtn" runat="server" value="支 付"/>
            <%} %>
            <%if (KSSecurity.CheckPurview(3)){ %>
        <input type="button" class="button" id="deliveryBtn" runat="server" value="发 货"/>
            <%} %>
            <%if (KSSecurity.CheckPurview(4)){ %>
        <input type="button" class="button" id="signBtn" runat="server" value="客户已签收"/>
        <input type="button" class="button" id="finishBtn" runat="server" value="结 清"/>
            <%} %>
             <%if (KSSecurity.CheckPurview(3)){ %>
        <input type="button" class="button" id="returnsBtn" runat="server" value=" 退货退款 "/>
            <%} %>
              <%if (KSSecurity.CheckPurview(7)){ %>
        <input type="button" class="button" id="invoiceBtn" runat="server" value=" 开 发 票 "/>
            <%} %>
        <%if (KSSecurity.CheckPurview(1)){ %>
        <input type="button" class="button" id="modifyBtn" runat="server" value="修 改"/>
        <%} %>
        <!--<input type="button" class="button" id="confirmBtn" runat="server" value="确认订单"/>-->
            <%if (KSSecurity.CheckPurview(5)){ %>
        <input type="button" class="button" id="canceledBtn" runat="server" value="订单作废"/>
            <%} %>
            <%if (KSSecurity.CheckPurview(0)){ %>
        <input type="button" class="button" id="delBtn" runat="server" value="删除订单"/>
            <%} %>
            <%if (KSSecurity.CheckPurview(8)){ %>
        <input type="button" class="button" id="printExpresBtn" runat="server" value="打印快递单"/>
            <%} %>
        <%} %>
        <asp:Button ID="BtnPrint" runat="server" Text="打印订单" CssClass="button" OnClick="BtnPrint_Click" />
        <%if (Utils.StrToFloat(dr["MoneyReceipt"].ToString())<=0 && (KSSecurity.CheckPurview(9)))
          {
         %>
        <asp:Button ID="BtnSMS" runat="server" Text="短信催付款" CssClass="button"  />
        <%} %>
            <%if (KSSecurity.CheckPurview(6)){ %>
        <asp:Button ID="Button1" runat="server" CssClass="button" OnClick="Button1_Click" Text="导出Word" />
            <%} %>
        <input type="button" class="button" id="backBtn" value="返 回" onclick="location.href='KS.ShopOrder.aspx';" />
            <br /><br />
        <script type="text/javascript">
            var id = "<%=id %>";
            function returns() {
                parent.openWin("录入退货退款信息", "Shop/KS.ShopOrder.aspx?action=returns&id=" + id, true, 800, 490);
            }
            jQuery(document).ready(function() {

                jQuery("#<%=this.printExpresBtn.ClientID %>").click(function() {
                    window.open('KS.ShopPrintExpress.aspx?id=' + id);
                });

                jQuery("#<%=this.confirmBtn.ClientID %>").click(function() {
                    top.openWin("确定订单", "Shop/KS.ShopOrder.aspx?action=confirmorder&id=" + id, true, 500, 200);

                });
                jQuery("#<%=this.canceledBtn.ClientID %>").click(function() {
                    top.openWin("订单作废", "Shop/KS.ShopOrder.aspx?action=canceledorder&id=" + id, true, 500, 240);
                });
                jQuery("#<%=this.bankPayBtn.ClientID %>").click(function() {
                    parent.openWin("支付订单", "Shop/KS.ShopOrder.aspx?action=bankPay&id=" + id, true, 800, 490);
                });
                jQuery("#<%=this.deliveryBtn.ClientID %>").bind("click", function() {
                    parent.openWin("录入发货信息", "Shop/KS.ShopOrder.aspx?action=delivery&id=" + id, true, 800, 490);
                });
                jQuery("#<%=this.BtnSMS.ClientID %>").bind("click", function() {
                parent.openWin("短信催单", "Shop/KS.ShopOrder.aspx?action=sendsms&id=" + id, true, 800, 490);
                });
                jQuery("#<%=this.returnsBtn.ClientID %>").bind("click", function() {
                    returns();
                });
                jQuery("#<%=this.invoiceBtn.ClientID %>").bind("click", function() {
                    parent.openWin("录入开发票信息", "Shop/KS.ShopOrder.aspx?action=invoice&id=" + id, true, 800, 490);
                });
                jQuery("#<%=this.modifyBtn.ClientID %>").bind("click", function() {
                    location.href = '?action=modify&id=' + id;
                });
                jQuery("#<%=this.signBtn.ClientID %>").bind("click", function() {
                    KesionJS.Confirm("确定用户已签收了吗？", 'location.href="Shop/KS.ShopOrder.aspx?id=' + id + '&action=signorder";', null);
                });
                jQuery("#<%=this.finishBtn.ClientID %>").bind("click", function() {
                    KesionJS.Confirm("订单一旦结清，就可能再对该订单进行任何操作，确定结清吗？", 'location.href="Shop/KS.ShopOrder.aspx?id=' + id + '&action=finishorder";', null);
                });
                jQuery("#<%=this.delBtn.ClientID %>").bind("click", function() {
                    KesionJS.Confirm("确定删除该订单吗？", 'location.href="Shop/KS.ShopOrder.aspx?id=' + id + '&action=delorder";', null);
                });
            });
        </script>    
        
        <%
            if (Utils.StrToInt(dr["smsnum"].ToString()) > 0)
            {
                %>
                <div class="message">
                <strong>提醒：</strong>该订单已发送了<font color=red><%=dr["SmsNum"].ToString() %></font>次的提醒付款消息。
                </div>
                <%
            }    
        %>  
         </asp:Panel>
    </asp:Panel>
 </div>



