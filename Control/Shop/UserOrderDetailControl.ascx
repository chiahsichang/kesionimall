<%@ Control Language="C#" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.Shop.UserOrderDetailControl" Codebehind="UserOrderDetailControl.ascx.cs" %>
<%@ Import Namespace="Kesion.Cache"%>
<%@ Import Namespace="Kesion.Publics"%>
<%@ Import Namespace="Kesion.APPCode"%>
<style>
.border .wait,.border .wff,.border .wfk{color:red;}
.border .yff,.border .yfq,.border .yqs,.border .confirm,.border .yxf{color:green;}
.border .wx{color:#999;}
.border .jq{color:#888;}
.border .tk{color:Purple}
.border .ddff{color:brown;}
.border .list_link{line-height:22px;border-left:1px solid #efefef;padding:5px;}
.border .img img{border:1px solid #ccc;padding:1px;}
@media print {     
          .noprint{display: none; }   
          
    }  
</style>

<table border="0" cellpadding="2" cellspacing="1" class="border" width="98%" align="center">
    <tr class="title1">
        <td>
          订单号：<asp:Label ID="LabOrderID" runat="server" Text="Label"></asp:Label> 
          
             订单状态：<%=Kesion.APPCode.OrderProcess.GetOrderStatus(false,Utils.StrToInt(dr["orderType"].ToString()), dr["OrderID"].ToString(), Utils.StrToInt(dr["ConsumptionMode"].ToString()), Utils.StrToInt(dr["IsBusinessConfirm"].ToString()), dr["alipaytradestatus"].ToString(), Utils.StrToInt(dr["status"].ToString()), Utils.StrToInt(dr["DeliverStatus"].ToString()), Utils.StrToDecimal(dr["MoneyReceipt"].ToString()), Utils.StrToDecimal(dr["OrderTotalPrice"].ToString())) %>

	  
          时间：<asp:Label ID="LabInputTime" runat="server" Text="Label"></asp:Label>
           &nbsp;
            
            
        </td>
    </tr>
    
   
    <tr>
     <td class="splittd" style="padding-left:20px;">
         <table width="100%">
             <tr>
             <td  valign="top">
        <strong>收货人信息：</strong>
         <br />
       <%if (!string.IsNullOrEmpty(dr["RealName"].ToString())){ %>
         收 货 人：<asp:Label ID="LabContactMan" runat="server" Text=""></asp:Label><br />
       <%} %>
      <%if (!string.IsNullOrEmpty(dr["Address"].ToString())){ %>
         地    址：<asp:Label ID="LabAddress" runat="server" Text=""></asp:Label><br />
         <%
         }
       if (!string.IsNullOrEmpty(dr["tel"].ToString())){ %>
         固定电话：<asp:Label ID="LabTel" runat="server" Text=""></asp:Label><br />
         <%} %>
        手机号码：<asp:Label ID="LabMobile" runat="server" Text=""></asp:Label><br />
       <%if (!string.IsNullOrEmpty(dr["email"].ToString())){ %>
        电子邮件：<asp:Label ID="LabEmail" runat="server" Text=""></asp:Label><br />
       <%} %>
     <%if (!string.IsNullOrEmpty(dr["ZipCode"].ToString())){ %>
         邮政编码： <asp:Label ID="LabZipCode" runat="server" Text=""></asp:Label><br />
      <%} %>
        <%if (dr["ordertype"].ToString() == "1" && !string.IsNullOrEmpty(dr["verifycode"].ToString()) && dr["business"].ToString() != (new TemporaryVar()).UserName)
                   { %>
         消费验证码：<span style="color:green;font-size:20px;"><%=dr["verifycode"].ToString() %></span> <br />
            <%} %>
        </td>
         <td valign="top">
             <%if (dr["orderType"].ToString() == "1" && dr["ConsumptionMode"].ToString() == "0") { }else{%>
             <strong>送货时间：</strong>
             
             <br />

             送货日期：<asp:Label ID="LabDeliveryDate" runat="server" Text=""></asp:Label><br />
             <%if (!string.IsNullOrEmpty(dr["DeliveryTime"].ToString())){ %>
             送货时间： <%=dr["DeliveryTime"].ToString() %><br />
             <%} %>
             
             <%}
               if (!string.IsNullOrEmpty(dr["Remark"].ToString())){ %>
             订单附言： <asp:Label ID="LabRemark" runat="server" Text=""></asp:Label>
             <%} %>
         </td>
         </tr></table>

          <strong>支付及配送方式：</strong>
         <br />
         付款方式：<asp:Label ID="LabPayType" runat="server" Text=""></asp:Label> 
         <%if (Utils.StrToFloat(dr["PayDiscountMoney"].ToString())>0){ %>
          支付方式可优惠：<span style="color:green"><%=MyCache.GetCurrencySymbol%><asp:Label ID="LabPayDiscount" runat="server" Text="Label"></asp:Label></span> <%=MyCache.GetCurrencyUnit%>
         <%} %><br />
         配送方式：<asp:Label ID="LabDeliveyType" runat="server" Text=""></asp:Label> 运费：<%=MyCache.GetCurrencySymbol%><asp:Label ID="LabFreight" runat="server" Text="Label"></asp:Label> <%=MyCache.GetCurrencyUnit%><br />
         <%if (dr["IsInvoice"].ToString()=="0")
         { %>
        
         <%}else{ %>
            <strong>发票信息：</strong><br />
           发票： <%=dr["Invoiced"].ToString()=="1"?"已开":"<font color=red>未开</font>"%>
           <br />
           <asp:Label ID="LabInvoice" runat="server" Text=""></asp:Label>		
          
        <%} %>
      

     </td>
    
    </tr>
    
    <tr>
    <td class="splittd">		
        <div style="padding-left:20px;height:25px;line-height:25px"><strong>商品清单：</strong></div>
        <asp:GridView ID="GVGroupBuy" style="border-bottom:none" runat="server" AutoGenerateColumns="False" CssClass="border" EmptyDataText="没有数据!"  Width="99%" CellPadding="1" CellSpacing="1" GridLines="None" HorizontalAlign="Center">
         <Columns>
         
              <asp:TemplateField HeaderText="图片">
                <itemstyle horizontalalign="Center" />
                <itemtemplate>
                    <img onerror="this.src='../../sysimg/nopic.gif';" src='<%# string.IsNullOrEmpty(Convert.ToString(Eval("photourl")))?MyCache.GetCacheShopConfig(9):Eval("PhotoUrl")  %>' width="60" height="45" style="border:1px solid #efefef;padding:1px" />
                </itemtemplate>
              </asp:TemplateField>
              <asp:TemplateField HeaderText="商品名称">
                <itemstyle horizontalalign="Left" Width="400px" />
                <itemtemplate>
                 <a href="../../shop/groupbuyshow.aspx?Id=<%# Eval("id") %>" target="_blank"><%# Eval("subject").ToString() %></a>
                </itemtemplate>
              </asp:TemplateField>

               <asp:TemplateField HeaderText="数量">
                <itemstyle width="50px" horizontalalign="Center" />
                <itemtemplate>
                   <%# Eval("Num") %>
                </itemtemplate>
              </asp:TemplateField>
      
                <asp:TemplateField HeaderText="原价">
                <itemstyle horizontalalign="Center" />
                <itemtemplate>
                <span style="text-decoration:line-through"><%=MyCache.GetCurrencySymbol%><%# Public.ReturnShopPrice(Utils.StrToDecimal(Eval("Price_Market")))%></span>
                </itemtemplate>
              </asp:TemplateField>  
              <asp:TemplateField HeaderText="团购价">
                <itemstyle horizontalalign="Center" ForeColor="Red" />
                <itemtemplate>
                <%=MyCache.GetCurrencySymbol%><%# Public.ReturnShopPrice(Utils.StrToDecimal(Eval("Price")))%>
                </itemtemplate>
              </asp:TemplateField>  
              <asp:TemplateField HeaderText="小计">
                <itemstyle horizontalalign="Center" />
                <itemtemplate>
                <%=MyCache.GetCurrencySymbol%><%# Public.ReturnShopPrice(Utils.StrToDecimal(Eval("TotalPrice")))%>
                </itemtemplate>
              </asp:TemplateField>  
     
           
         </Columns>
            <HeaderStyle CssClass="title" Height="23px" />
             <RowStyle CssClass="tdbg" Height="22px" />
        </asp:GridView>
        
        
         <asp:GridView ID="OrderItemList" style="border-bottom:none" runat="server" AutoGenerateColumns="False" CssClass="border" EmptyDataText="没有数据!"  Width="99%" CellPadding="1" CellSpacing="1" GridLines="None" HorizontalAlign="Center">
         <Columns>
              <asp:TemplateField HeaderText="图片">
                <itemstyle horizontalalign="Center" />
                <itemtemplate>
                    <img onerror="this.src='../../sysimg/nopic.gif';" src='<%# string.IsNullOrEmpty(Convert.ToString(Eval("DefaultPic")))?MyCache.GetCacheShopConfig(9):Eval("DefaultPic")  %>' width="60" onerror="this.src='<%=MyCache.GetCacheShopConfig(9) %>';" height="45" style="border:1px solid #efefef;padding:1px" />
                </itemtemplate>
              </asp:TemplateField>
              <asp:TemplateField HeaderText="商品名称">
                <itemstyle horizontalalign="Left" />
                <itemtemplate>
                    <%# getProOrder(Utils.StrToInt((Eval("ClassID"))), Convert.ToString(Eval("FileName") + ""), Convert.ToString(Eval("TurnUrl") + ""), Utils.StrToInt(Eval("ItemID")), Utils.StrToInt(Eval("ChannelID")), Utils.StrToInt(Eval("InfoID")), string.IsNullOrEmpty(Convert.ToString(Eval("ITitle") + "")) ? Convert.ToString(Eval("Title") + "") : Convert.ToString(Eval("ITitle")), Utils.StrToInt(Eval("isBundleSale")), Utils.StrToInt(Eval("isChangeBuy")), Utils.StrToInt(Eval("isLimitBuy")),Convert.ToString(Eval("AttributeCart")),Utils.StrToInt(Eval("attrID")))%>
                </itemtemplate>
              </asp:TemplateField>
       
               <asp:TemplateField HeaderText="数量">
                <itemstyle horizontalalign="Center" />
                <itemtemplate>
                   <%# Convert.ToInt16(Eval("isBundleSale"))==1?"--":Convert.ToString(Eval("Num"))+" "+Convert.ToString(Eval("Unit")) %>
                </itemtemplate>
              </asp:TemplateField>

              <asp:TemplateField HeaderText="参与优惠" Visible="false">
                <itemstyle horizontalalign="Center" />
                <itemtemplate>
                   <%# Utils.StrToInt(Eval("IsPromotions"))==1?"是":"否"%>
                </itemtemplate>
              </asp:TemplateField>
              <asp:TemplateField HeaderText="发货方式">
                <itemstyle horizontalalign="Center" />
                <itemtemplate>
                   <%# Utils.StrToInt(Eval("producttype"))==2?(Utils.StrToDecimal(dr["MoneyReceipt"].ToString())>=Utils.StrToDecimal(dr["OrderTotalPrice"].ToString())?"<input type='button' class='button' onclick=\"location.href='OrderDown.aspx?itemid="+Eval("itemid")+"&orderid="+dr["orderid"].ToString()+"';\" value='开始下载'/>":"网上下载"):"快递发送"%>
                </itemtemplate>
              </asp:TemplateField>


               <asp:TemplateField HeaderText="市场价" Visible="false">
                <itemstyle horizontalalign="Center" width="80px" />
                <itemtemplate>
                <span style="text-decoration:line-through"><%=MyCache.GetCurrencySymbol%><%# Public.ReturnShopPrice(Utils.StrToDecimal(Eval("Price_Market")))%></span>
                </itemtemplate>
              </asp:TemplateField>   
              
              <asp:TemplateField HeaderText="实价">
                <itemstyle horizontalalign="Center" width="90px" ForeColor="Red" />
                <itemtemplate>
                  <%# Utils.StrToInt(Eval("changescore")) > 0 ? Eval("changescore") + "分" : string.Empty %>
                   <%# Convert.ToDecimal(Eval("price")) > 0 && Utils.StrToInt(Eval("changescore")) > 0 ? "+" : string.Empty%>
                   <%# Convert.ToDecimal(Eval("price")) > 0 ? MyCache.GetCurrencySymbol+Public.ReturnShopPrice(Utils.StrToDecimal(Eval("Price"))) : string.Empty%>
                </itemtemplate>
              </asp:TemplateField>  
              <asp:TemplateField HeaderText="小计">
                <itemstyle horizontalalign="Center" />
                <itemtemplate>
                   <%# Utils.StrToInt(Eval("changescore")) > 0 ? Utils.StrToInt(Eval("changescore")) * Utils.StrToInt(Eval("num")) + "分" : string.Empty%>
                   <%# Convert.ToDecimal(Eval("TotalPrice")) > 0 && Utils.StrToInt(Eval("changescore")) > 0 ? "+" : string.Empty%>
                   <%# Convert.ToDecimal(Eval("TotalPrice")) > 0 ? MyCache.GetCurrencySymbol + Public.ReturnShopPrice(Utils.StrToDecimal(Eval("TotalPrice"))) : string.Empty%>
                </itemtemplate>
              </asp:TemplateField>  


         </Columns>
             <HeaderStyle CssClass="title1" Height="23px" />
             <RowStyle CssClass="tdbg" Height="22px" />
        </asp:GridView>
        
        <table border="0" cellpadding="0" cellspacing="0" class="border" style="border-top:none" width="99%" align="center">
        <tr>
         <td height="40" style="line-height:25px;padding:3px" class="tdbg">
             总商品金额：<%=MyCache.GetCurrencySymbol%><asp:Label ID="LabGoodsMoney" runat="server" Text="Label"></asp:Label> <%=MyCache.GetCurrencyUnit%>&nbsp;
         
        <span style="color:green"><asp:Label 
                 ID="LabCouponTips" runat="server"></asp:Label></span>
             <%if (Utils.StrToInt(dr["OrderScore"].ToString())>0){ %>
         可得积分：<asp:Label ID="LabScore" runat="server" ForeColor="red" Text=""></asp:Label> 分
             <%} %>
         <%if (Utils.StrToInt(dr["changescore"].ToString()) > 0)
            {
                Response.Write("&nbsp;&nbsp;<font color=green>本单为积分兑换订单，已支付积分<font color=brown>" + dr["changescore"].ToString() + "</font>分</font>");
            } %>
           </td>
         <td class="tdbg" width="260">
         订单金额：<span style="color:#555"><%=MyCache.GetCurrencySymbol%><asp:Label ID="LabNoUseCouponMoney" runat="server" Text="Label"></asp:Label></span> <%=MyCache.GetCurrencyUnit%>
         已付款：<span style="color:Red"><%=MyCache.GetCurrencySymbol%><asp:Label ID="LabMoneyReceive" runat="server" Text="Label"></asp:Label></span> <%=MyCache.GetCurrencyUnit%>
        <%  if (Utils.StrToDecimal(dr["savemoney"].ToString()) > 0)
            {
                Response.Write("<br/><font color=green>本单商城活动优惠： <font color=brown>"+MyCache.GetCurrencySymbol + Kesion.APPCode.Public.ReturnShopPrice(dr["savemoney"].ToString()) +MyCache.GetCurrencyUnit+"</font></font>");
            } %> <br />
         应付金额：<span style="font-weight:bold;font-size:15px;color:#ff6600"><%=MyCache.GetCurrencySymbol%><asp:Label ID="LabTotalOrderMoney" runat="server" Text="Label"></asp:Label></span> <%=MyCache.GetCurrencyUnit%> 尚欠款：<span style="color:blue"><%=MyCache.GetCurrencySymbol%><asp:Label ID="LabNoPayMoney" runat="server" Text="Label"></asp:Label></span> <%=MyCache.GetCurrencyUnit%>
         </td>
        </tr>
        </table>
   </td>
   </tr>
</table>




<asp:Panel ID="PanelConsumer" runat="server">
    <div style="margin:15px"><B>订单[<span style="color:Red"><%=dr["orderid"].ToString() %></span>]跟踪</B></div>
    <script>
        var box='';
        function showOrderDetail(statusCode){
            var w=800;
            box=jQuery.dialog.open("showbox.aspx?action=order&orderid=<%=dr["orderid"].ToString()%>&statusCode="+statusCode,{ 
                title:'查看详情记录',
                width:w,
                height:450,
                cancelVal: '取消',
                max:false,
                min:false,
                cancel: true /*为true等价于function(){}*/ 
            });
        }
    </script>
    <asp:Repeater ID="RepeaterConsumer" runat="server" >
          <HeaderTemplate>
            <table class="border" cellSpacing=1 cellPadding=2 width="99%" align="center" border=0>
                <tr align="center" class="title">
        	    <td style="width:150px;text-align:center">处理时间</td>
                <td align="Left">处理信息</td>
        	    <td align="center">操作人</td>
        	    <td align="center">详情</td>
              </tr>

          </HeaderTemplate>
           <ItemTemplate>
           <tr class="tdbg">
              <td class="splittd" style="width:150px;text-align:center"><%# Eval("Adddate") %> </td>
              <td class="splittd" style="word-break:break-all;text-align:left;"><%# GetLogContent(Convert.ToString(Eval("remark")),dr["business"].ToString()) %></td>
              <td class="splittd" align="center"><%# Eval("inputer") %></td>
              <td class="splittd" align="center">
                 <%#  Convert.ToString(Eval("StatusCode"))=="6" ||(Convert.ToString(Eval("StatusCode"))=="4" && dr["OrderType"].ToString()=="1")?"<a href='javascript:;' onclick='showOrderDetail("+ Eval("statusCode") +")'>查看详情</a>":( Convert.ToString(Eval("StatusCode"))=="3"?"<a href='javascript:;' onclick='showOrderDetail("+ Eval("statusCode") +")'>查看物流</a>":"-") %> 
              </td>
           </tr>     
           </ItemTemplate>

         <FooterTemplate>
             <tr class="tdbg" style="display:<%# bool.Parse((RepeaterConsumer.Items.Count==0).ToString())?"":"none"%>">
                <td class="splittd" style="text-align:center" colspan="7">
                  还没有记录!
                </td>
               </tr> 
            </table>
        </FooterTemplate>
    </asp:Repeater>


</asp:Panel>



<table width="100%" align="center" id="showDelviery" runat="server" visible="false">
<tr>
 <td style='padding:20px'>
  <script type="text/javascript">
      showtips('<asp:Label ID="LabDeliveryInfo" runat="server"></asp:Label>');
	</script>
 </td>
</tr>
</table>
 <br /><br />

        
        <asp:Panel ID="footPanel" runat="server">
        <div style="margin:10px;text-align:center;" class="noprint">
            <%if (KSCMS.S("from").Equals("business")){ %>
            <%}else{ %>
            <input type="button" class="button" id="yfkBtn" runat="server" value="订单支付"/>
            <input type="button" class="button" id="backBtn" runat="server" value="退货退款"/>
            <input type="button" class="button" id="signBtn" runat="server" value="确认收货"/>
           <input type="button" value="打印订单" class="button" onclick="window.open('MyOrderPrint.Aspx?id=<%=id %>');" />
            <input type="button" class="button" id="delBtn" runat="server" value="删除订单"/>
            <input type="button" class="button" id="backBtn" value="返回订单管理" onclick="history.back(-1);" /><br /><br />
            <%} %>
        </div>
        <script type="text/javascript">
            var id = "<%=id %>";
            var orderId = "<%=orderId %>";
           jQuery(document).ready(function() {


           jQuery("#<%=this.yfkBtn.ClientID %>").click(function() {
               location.href = 'myorder.aspx?action=pay&id=' + id;
           });


           jQuery("#<%=this.backBtn.ClientID %>").click(function() {
               location.href = 'myorder.aspx?action=returns&id=' + id;
           });


               jQuery("#<%=this.signBtn.ClientID %>").bind("click", function() {
                   KesionJS.Confirm("此操作不可逆，您确定收到商品了吗？", 'location.href="?id=' + id + '&action=signorder";', null);
               });

               jQuery("#<%=this.delBtn.ClientID %>").bind("click", function() {
                   KesionJS.Confirm("确定删除该订单吗？", 'location.href="myorder.aspx?id=' + id + '&action=delorder";', null);
               });
           });
           
        </script>      
        
  </asp:Panel>
         
         
         
         
   <asp:Repeater ID="Repeater1" runat="server">
    <HeaderTemplate>
         <table id="tablist" width="98%" border="0" align="center" cellpadding="2" cellspacing="1" class="border">
        <tr align="center" class="title">
            <td colspan="2" style="text-align:left">退货退款处理记录</td>
        </tr>
    </HeaderTemplate>
    <ItemTemplate>
      <tr class="tdbg">
          <td class="splittd" width="150">
           <strong>申请时间：</strong>
          </td>
          <td  class="splittd"><%# Eval("DeliverDate")%></td>
      </tr> 
      <tr class="tdbg">
          <td class="splittd" >
           <strong>申请退款退货的原因：</strong>
          </td>
          <td  class="splittd"><%# Eval("remark") %></td>
      </tr> 
      <tr class="tdbg">
          <td class="splittd" >
           <strong>资金退回方式：</strong>
          </td>
          <td  class="splittd"><%# getMoneyReturnType(Convert.ToInt16(Eval("MoneyReturnType")))%></td>
      </tr> 
      <tbody<%# Convert.ToInt16(Eval("MoneyReturnType"))==2?"":" style='display:none'" %>>
          <tr class="tdbg">
              <td class="splittd" >
               <strong>退回的银行名称：</strong>
              </td>
              <td  class="splittd"><%# Eval("MoneyReturnBankName")%></td>
          </tr> 
          <tr class="tdbg">
              <td class="splittd" >
               <strong>退回的银行卡号：</strong>
              </td>
              <td  class="splittd"><%# Eval("MoneyReturnBankCard")%></td>
          </tr> 
          <tr class="tdbg">
              <td class="splittd" >
               <strong>退回的银行卡号户名：</strong>
              </td>
              <td  class="splittd"><%# Eval("MoneyReturnCardName")%></td>
          </tr> 
       </tbody>
       
          <tr class="tdbg">
              <td class="splittd" >
               <strong>是否处理：</strong>
              </td>
              <td class="splittd"><%# Convert.ToInt16(Eval("status"))==1?"<span style='color:green'>已处理</span>":"<span style='color:red'>等待处理</span>"%></td>
          </tr> 
        <tbody<%# Convert.ToInt16(Eval("status"))==1?"":" style='display:none'" %>>
          <tr class="tdbg">
              <td class="splittd" >
               <strong>处理人：</strong>
              </td>
              <td  class="splittd"><%# Eval("HandlerName")%></td>
          </tr> 
          <tr class="tdbg">
              <td class="splittd" >
               <strong>处理时间：</strong>
              </td  class="splittd">
              <td><%# Eval("HandlerDate")%></td>
          </tr> 
          <tr class="tdbg">
              <td class="splittd" >
               <strong>处理结果：</strong>
              </td  class="splittd">
              <td><%# Convert.ToInt16(Eval("HandlerStatus"))==1?"同意退货退款":"妥协交易"%></td>
          </tr> 
        </tbody>
       
     </ItemTemplate>
     <FooterTemplate>
      </table>
     </FooterTemplate>
    </asp:Repeater>
         
         

