<%@ Page Title="" Language="C#" MasterPageFile="User.master" AutoEventWireup="true" CodeBehind="Order.aspx.cs" Inherits="Kesion.NET.WebSite._3G.Order3G" %>
<%@ Import Namespace="Kesion.Publics" %>
<asp:Content ID="Content1" ContentPlaceHolderID="KSContent" runat="server">

<asp:Panel ID="ListPannel" runat="server">
<style> 
						.sborder .wait,.sborder .wff,.sborder .wfk{color:red;}
						.sborder .yff,.sborder .yfq,.sborder .yqs,.sborder .confirm{color:green;}
						.sborder .wx{color:#999;}
						.sborder .jq{color:#888;}
						.sborder .tk{color:Purple}
						.sborder .ddff{color:brown;}
						.sborder .list_link{line-height:22px;border-left:1px solid #efefef;padding:5px;}
						.sborder .img img{border:1px solid #ccc;padding:1px;}
</style>

    <asp:Repeater ID="Repeater1" runat="server"  onitemdatabound="Repeater1_ItemDataBound" >
          <HeaderTemplate>
          </HeaderTemplate>
         <ItemTemplate>
         

          <table class="sborder" style="padding:12px 15px; line-height:24px;color:#555;font-size:14px">
							<tr>
							   <td  class="splittd">


订单编号：<%# Eval("OrderID") %>				<%# Convert.ToInt16(Eval("ordertype")) == 1 ? (string.Concat("<span style='color:Red'>团购</span>",!string.IsNullOrEmpty(Eval("verifycode").ToString())?"<br/> 消费验证码：<span style='color:green'>"+Eval("verifycode").ToString()+"</span>":string.Empty)):string.Empty%>

                 <%# Convert.ToInt32(Eval("changescore")) >0 ? " <span style='color:green'>积分兑换</span>" : string.Empty%>   
								  
								<br/>定购时间：<%# Utils.FormatHumanizedTime(Convert.ToDateTime(Eval("InputTime"))) %>
								<%# Utils.StrToInt(Eval("orderscore"))>0?"<br/>赠送积分："+ Eval("orderscore")+"分":string.Empty %>
								<br/>应付金额：<%# Utils.StrToInt(Eval("ChangeScore")) > 0 ? ""+Eval("ChangeScore") +"分+": string.Empty%>
                                  <%# Eval("OrderTotalPrice","{0:c}")%>
								&nbsp;已付：<span style='color:green'><%# Eval("moneyreceipt","{0:c}")%></span>元
								 <br/>订单状态：<%# Kesion.APPCode.OrderProcess.GetOrderStatus(true,Utils.StrToInt(Eval("orderType")),Convert.ToString(Eval("OrderID")),Utils.StrToInt(Eval("ConsumptionMode")),Utils.StrToInt(Eval("IsBusinessConfirm")),Convert.ToString(Eval("alipaytradestatus")), Convert.ToInt16(Eval("status")), Convert.ToInt16(Eval("DeliverStatus")), Utils.StrToDecimal(Convert.ToString(Eval("MoneyReceipt"))), Utils.StrToDecimal(Convert.ToString(Eval("OrderTotalPrice"))))%>
								 <br/>商品清单：

                                  <asp:Repeater ID="Repeater2" runat="server">
                                   <ItemTemplate>
                                       <%#Eval("title")%> X <%#Eval("num") %><br />
                
                                   </ItemTemplate>
                                 </asp:Repeater>


								 </td>
									  </tr>
							</table>


          
             
			<div align=center id='buttonarea'>
				
				
				<%# Convert.ToString(Eval("DeliverStatus")) == "1" ? @"<input type='button' class='button' onclick=""if (confirm('此操作不可逆，您确定收到商品了吗？')){location.href='../user/shop/ShowMyOrder.aspx?id=" + Eval("id") + @"&action=signorder';}"" value='确认收货'/>" : ""%>
				<%# Convert.ToString(Eval("DeliverStatus")) == "2" && Convert.ToString(Eval("Status"))!= "2" ? @"<input type='button' class='button' onclick=""if (confirm('订单一旦结清，就可能再对该订单进行任何操作，确定结清吗？')){ location.href='../user/shop/ShowMyOrder.aspx?id=" + Eval("id") + @"&action=finishorder';}"" value='结清'/>" : ""%>
				<%# Convert.ToString(Eval("status")) == "0" && Convert.ToString(Eval("DeliverStatus")) == "0" && Utils.StrToFloat(Convert.ToString(Eval("MoneyReceipt"))) == 0 ? @"<input type='button' class='button' onclick=""if (confirm('此操作不可逆，确定执行删除操作吗？')){ location.href='?action=delorder&id=" + Eval("id")+@"';}"" value='删除'/>" : ""%>
				<%# Convert.ToString(Eval("PayStatus")) != "1" && Convert.ToInt16(Eval("status")) < 2  ? @" <input type='button' class='button' value='在线支付' onclick=""location.href='payonline.aspx?from=shop&orderid=" + Eval("orderid") + @"';""/> <input type='button' class='button' onclick=""location.href='?action=pay&id=" + Eval("id") + @"';"" value='预付款支付'/>" : ""%>
			</div>	
             <hr size="1"/>
         </ItemTemplate>
          <FooterTemplate>
          <div style="display:<%# bool.Parse((Repeater1.Items.Count==0).ToString())?"":"none"%>">
          <div class="empty">还没有任何的订单！</div>
          </div>
          </FooterTemplate>
        </asp:Repeater>

       <label id="LabPageStr" runat="server"></label>
</asp:Panel>

 <asp:Panel ID="PayPannel" runat="server" Visible="false">
        <asp:PlaceHolder ID="PlaceHolder1" runat="server"></asp:PlaceHolder>
 </asp:Panel>
</asp:Content>


