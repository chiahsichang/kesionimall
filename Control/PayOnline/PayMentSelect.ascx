<%@ Control Language="C#" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.PayOnline.PayMentSelect" Codebehind="PayMentSelect.ascx.cs" %>
<%@ Import Namespace="Kesion.Publics" %>
<%@ Import Namespace="Kesion.Cache" %>
<%@ Import Namespace="Kesion.BLL" %>
<%@ Import Namespace="System.Data" %>
<table  cellspacing="1" cellpadding="3" class="border" width="98%" align="center" border="0">
	 <tr class="title">
             <td colspan="2" > 确认及选择支付接口平台</td>
     </tr>
    <%if (!string.IsNullOrEmpty((new TemporaryVar()).UserName)){ %>
     <tr class="tdbg">
         <td class="splittd lefttd" style="height: 25px">用 户 名： </td>
         <td class="splittd">
          <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
         </td>
     </tr>
    <%} %>
     <tr class="tdbg">
         <td class="splittd lefttd" style="height: 25px">支付编号： </td>
         <td class="splittd">
          <asp:Label ID="Label2" runat="server" Text="0"></asp:Label>
         </td>
     </tr>
     <tr class="tdbg">
         <td class="splittd lefttd" style="height: 25px">购买商品： </td>
         <td class="splittd"><span class="tips"><asp:Label ID="Label3" runat="server" Text="0"></asp:Label>
          </span>
         </td>
     </tr>
    <tr class="tdbg">
         <td class="splittd lefttd" style="height: 25px">支 付：</td>
         <td class="splittd">
             <%if (dr["isfrontPay"].ToString() == "0"){ %>
          <%=MyCache.GetCurrencySymbol %> <span style="font-size:16px;font-weight:bold;color:#ff6600"><%=Kesion.APPCode.Public.ReturnShopPrice(Utils.StrToDecimal((Utils.StrToFloat(dr["OrderTotalPrice"].ToString()) - Utils.StrToFloat(dr["MoneyReceipt"].ToString())).ToString()).ToString()) %>
          </span>  <%=MyCache.GetCurrencyUnit %>
             <%}else if (dr["isfrontPay"].ToString() == "1") { %>
            本单总金额 <%=MyCache.GetCurrencySymbol %><span style="font-size:16px;font-weight:bold;color:#ff6600"><%=Kesion.APPCode.Public.ReturnShopPrice(Utils.StrToDecimal((Utils.StrToFloat(dr["OrderTotalPrice"].ToString())).ToString())) %></span>元，本次支付订金：<%=MyCache.GetCurrencySymbol %> <span style="font-size:16px;font-weight:bold;color:#ff6600"><%=Kesion.APPCode.Public.ReturnShopPrice(Utils.StrToDecimal(dr["frontmoney"].ToString()))%></span> <%=MyCache.GetCurrencyUnit %>
             <%}else{ %>
            本单总金额 <%=MyCache.GetCurrencySymbol %><span style="font-size:16px;font-weight:bold;color:#ff6600"><%=Kesion.APPCode.Public.ReturnShopPrice(Utils.StrToDecimal((Utils.StrToFloat(dr["OrderTotalPrice"].ToString())).ToString())) %></span>元，本次支付：<%=MyCache.GetCurrencySymbol %> <input style="width:70px;text-align:center;" type="text" name="Money" id="Money" value="<%=Kesion.APPCode.Public.ReturnShopPrice(Utils.StrToDecimal((Utils.StrToFloat(dr["OrderTotalPrice"].ToString()) - Utils.StrToFloat(dr["MoneyReceipt"].ToString())).ToString()).ToString()) %>"/><%=MyCache.GetCurrencyUnit %>  Tips:本订单最少需要支付<span style="font-size:16px;font-weight:bold;color:#ff6600"><%=Kesion.APPCode.Public.ReturnShopPrice(Utils.StrToDecimal(dr["frontmoney"].ToString()))%></span><%=MyCache.GetCurrencyUnit %>订金
             <%} %>
         </td>
     </tr>
     <tr class="tdbg">
         <td class="splittd lefttd">选择支付平台：</td>
         <td  class="splittd">

             <div class="paylist">
                 <ul>
             <%
                 string payId = KSCMS.S("payid");
                 StringBuilder sb = new StringBuilder();
                 using (DataTable dt = CommonData.GetDataTable(4))
                 {
                     if (dt.Rows.Count > 0)
                     {
                         DataView dv = dt.DefaultView;
                         if (payToId != 0) //限制收款账号
                         {
                             dv.RowFilter="id="+payToId;
                         }
                         DataTable dtt = dv.ToTable();
                         foreach (DataRow drr in dtt.Rows)
                         {
                            
                             if (drr["isdefault"].ToString() == "1" && Utils.StrToInt(payId)==0)
                             {
                                 payId = drr["id"].ToString();
                             }
                             
                             sb.AppendLine(string.Format(@"<li{2} payid=""{3}""><img src=""{0}"" title=""{1}"" alt=""{1}""/></li>",drr["logo"].ToString(),drr["platname"].ToString(),payId==drr["id"].ToString()?@" style=""border:1px solid red""":string.Empty,drr["id"].ToString()));
                         }
                     }
                 }
                 Response.Write(sb.ToString());
              %>
                 </ul>
             </div>

         </td>
     </tr>
     
     <tr class="tdbg">
         <td colspan="2" style="height:70px;padding-left:220px;">

          <script>
              var pid=<%=payId%>;
              $(document).ready(function(){
                  $(".paylist").find("li").click(function(){
                      pid=$(this).attr("payid");
                      $(".paylist").find("li").attr("style","");
                      $(this).attr("style","border:1px solid red");
                  });
              });
              function doPay() {
                  <%if (dr["isfrontPay"].ToString() == "2"){ %>
                  location.href = '../user/PayConfirm.aspx?from=shop&money='+$("#Money").val()+'&OrderID=<%=this.Label2.Text%>&PlatID=' + pid;
                  <%}else{%>
                  location.href = '../user/PayConfirm.aspx?from=shop&OrderID=<%=this.Label2.Text%>&PlatID=' + pid;
                  <%}%>
              }
               </script>
             <input type="button" class="button" value="下 一 步" onclick="doPay()" />

          
             
             </td>
     </tr>
    </table>