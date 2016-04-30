<%@ Page Language="C#"  AutoEventWireup="true" Inherits="Kesion.NET.WebSite.User_OrderPrint" Title="订单打印" Codebehind="MyOrderPrint.aspx.cs" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="Kesion.Publics" %>
<%@ Import Namespace="Kesion.BLL" %>
<%@ Import Namespace="Kesion.Cache" %>
<%@ Import Namespace="Kesion.HtmlTags" %>
<%@ Import Namespace="Kesion.APPCode" %>
<!DOCTYPE html>
<html>
<head><meta http-equiv="Content-Type" content="text/html; charset=utf-8" /><title>
	订单打印-<%=MyCache.GetCacheConfig(1) %>
</title>
    <style type="text/css">
* {margin:0;padding:0}
body {font:12px/1.5  "宋体";color:#333}
.w{width:100%}
.m1 td{height:0.6cm;line-height:0.6cm;}
.t3,.t7,.t6{width:1.6cm}
.t1{width:6.8cm}
.t5{width:1.1cm}
.tb4{border-collapse:collapse;border:1px solid #000}
.tb4 th, .tb4 td,.d1{border:1px solid #000}
.tb4 td {padding:1px}
.tb4 th {height:0.6cm;font-weight:normal}
.m1,.m2,.m3{padding-top:10px}
.d1{padding:10px}
.d2{text-align:right;padding:10px 0;font-size:14px}
.logo{border-bottom:1px solid #ccc;padding:10px}
.footer{border-top:1px solid #ccc;text-align:center;padding:10px}
.v-h{ text-align:center}
.m2{padding-left:1px}
</style>
<style type="text/css" media="print">
.v-h {display:none;}
</style>

</head>
<body>
	<form name="form1">
		<div class="v-h"><input name="printBtn" style="padding:5px;" type="button" value="打印" onclick="javascript: window.print();" /></div>
		<div class="w">
			<div class="logo"><img width="170" height="60" src="<%=MyCache.GetCacheConfig(6) %>" alt="<%=MyCache.GetCacheConfig(1) %>" /></div>
			<div class="m1">
				<table width="100%" border="0" cellspacing="0" cellpadding="0" class="tb1">
					<tr>
						<td class="t1"><strong>订单编号：</strong><%=dr["orderid"].ToString() %></td>
						<td class="t2"><strong>订购时间：</strong><%=dr["inputtime"].ToString() %></td>
					</tr>
				</table>
				<table width="100%" border="0" cellspacing="0" cellpadding="0" class="tb2">
					<tr>
						<td class="t1"><strong>客户姓名：</strong><%=dr["realname"].ToString() %></td>
                       
						<td class="t2"><strong>联系方式：</strong>
                          <%=dr["mobile"].ToString() %>
                            <%if (!string.IsNullOrEmpty(dr["tel"].ToString())) {Response.Write(dr["tel"].ToString());} %>
						</td>
                      
					</tr>
				</table>
				<table width="100%" border="0" cellspacing="0" cellpadding="0" class="tb3">
					<tr>
                         <%if (orderType==1){ %>
                        <td class="t8"><strong>消费验证码：<%=dr["VerifyCode"].ToString() %></strong>
                       </td>
                        <%}else{ %>
						<td class="t8"><strong>客户地址：</strong><%=dr["address"].ToString() %></td>
                          <%} %>
				    </tr>
				</table>
			</div>
			<div class="m2">


         <asp:Repeater ID="Repeater1" runat="server">
              <HeaderTemplate>
             <table width="100%" border="0" cellspacing="0" cellpadding="0" class="tb4">
					<tr>
						<th class="t3">商品编号</th>
						<th class="t4">商品名称</th>
						<th class="t5">数量</th>
						<th class="t7">商品金额</th>
				    </tr>
              </HeaderTemplate>
             <ItemTemplate>
                 <tr>
							<td><%# Container.ItemIndex + 1 %></td>
							<td><div class="p-name"><%# Eval("title") %></div></td>
							<td><%# Eval("num") %></td>
							<td><%=MyCache.GetCurrencySymbol%><%# Kesion.APPCode.Public.ReturnShopPrice(Utils.StrToDecimal(Eval("totalprice")))%></td>
				    	</tr>
              </ItemTemplate>
            <FooterTemplate>
           </table>
          </FooterTemplate>
            </asp:Repeater>

				
					
	    </div>
    <div class="m3">
	    <div class="d1">
	    商品总金额：<%=Utils.StrToDecimal(dr["goodsmoney"].ToString()).ToString("F2") %><%=MyCache.GetCurrencyUnit%>  + 税费：<%=Utils.StrToDecimal(dr["taxes"].ToString()).ToString("f2") %><%=MyCache.GetCurrencyUnit%> + 运费：<%=Utils.StrToDecimal(dr["freight"].ToString()).ToString("f2") %><%=MyCache.GetCurrencyUnit%> - 付款优惠：<%=Utils.StrToDecimal(dr["paydiscountmoney"].ToString()).ToString("f2") %><%=MyCache.GetCurrencyUnit%> - 优惠券：<%=Utils.StrToDecimal(dr["usecouponmoney"].ToString()).ToString("f2") %><%=MyCache.GetCurrencyUnit%>
	    </div>
	    <div class="d2"><strong>订单支付金额：<%=MyCache.GetCurrencySymbol%><%=Utils.StrToDecimal(dr["nousecouponmoney"].ToString()).ToString("f2") %></strong></div>
    </div>
    <div class="footer">
	    <p class="p1">Powered By <a href="http://www.kesion.com" target="_blank">Kesion.Com</a> &copy; <%=DateTime.Now.Year.ToString() %></p>
    </div>
    </div>
    </form>

</body>
</html>

<script runat="server">
 public DataRow dr = null;
 public int orderType = 0;
 int id = 0;
protected void Page_Load(object sender, EventArgs e)
 {
     new TemporaryVar().FromPage = string.Empty;
     CheckUserLogin.Run();
     id = Utils.StrToInt(KSCMS.S("id"));
     if (id == 0) JS.AlertClose("错误参数！");
     string sqlStr = "Select top 1 * FROM KS_ProOrder Where (business='"+UserManage.GetUserInfo().UserName+"' or username='" + UserManage.GetUserInfo().UserName + "') and ID=" + id;
     using (DataTable dt = DataFactory.GetDataTable(sqlStr))
     {
         if (dt.Rows.Count > 0)
         {
             dr = dt.Rows[0];

             orderType = Utils.StrToInt(dr["orderType"].ToString());
             if (orderType == 1)
             {
                 #region 团购商品
                 using (DataTable dti = DataFactory.GetDataTable("Select top 100  I.ID,I.ClassID,I.Subject,I.PhotoUrl,I.Weight,O.* From KS_ProOrderItem o left join KS_ProGroupBuy i on o.infoid=i.id Where O.OrderID='" + dr["orderid"].ToString() + "' order by O.ItemID"))
                 {
                     if (dti.Rows.Count > 0)
                     {
                         this.Repeater1.DataSource = dti;
                         this.Repeater1.DataBind();
                     }
                 }
                 #endregion
             }
             else
             {
                 using (DataTable dti = ShopManage.GetProductFromOrderItem(dr["OrderID"].ToString()))
                 {
                     this.Repeater1.DataSource = dti;
                     this.Repeater1.DataBind();
                 }
             }
             
             
         }
         else
         {
             JS.AlertClose("出错！");
         }
     }
 }
</script>