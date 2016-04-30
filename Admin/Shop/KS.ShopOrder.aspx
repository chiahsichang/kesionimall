<%@ Page Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.Admin.Shop.Admin_ShopOrder" Title="商城订单管理" Codebehind="KS.ShopOrder.aspx.cs" %>
<%@ Import Namespace="Kesion.Cache" %>
<%@ Import Namespace="Kesion.Publics" %>
<%@ Import Namespace="Kesion.APPCode" %>
<asp:Content ID="Content1" ContentPlaceHolderID="KSContent" Runat="Server">
    <asp:Panel ID="listPanel" runat="server" Width="100%">
      <div id="manage_top" class="menu_top_fixed">
           <ul>
               <li id='p3'><a href="javascript:;" onclick="if (GetIDS('del')){ $('#aspnetForm').attr('action','KS.ShopOrder.aspx?action=del');$('#aspnetForm').submit()}"><b></b>批量删除订单</a></li>
               <li id="p18"><asp:LinkButton ID="ExcelBtn" runat="server" Text="本页导出Excel" onclick="BtnSubmit_Click"><b></b>本页导出Excel</asp:LinkButton></li>
               <li id="p18"><asp:LinkButton ID="WordBtn" runat="server" Text="本页导出Word" onclick="Button3_Click"><b></b>本页导出Word</asp:LinkButton></li>
               <li id="p18"><a href="KS.ShopOrder.aspx?action=Exportexcel"><b></b>按条件导出Excel</a></li>

           </ul>
      </div>    
   <div class="menu_top_fixed_height"></div>      


        <div class="message" style="margin-top:-5px;">

             <asp:DropDownList Visible="false" ID="DrpSearch" runat="server" AutoPostBack="true" OnSelectedIndexChanged="DrpSearch_SelectedIndexChanged">
         <asp:ListItem Value="0">所有订单</asp:ListItem>
         <asp:ListItem Value="1">24小时内新订单</asp:ListItem>
         <asp:ListItem Value="2">最近10天内新订单</asp:ListItem>
         <asp:ListItem Value="3">最近一个内订单</asp:ListItem>
         <asp:ListItem Value="4">团购订单</asp:ListItem>
         <asp:ListItem Value="5">未付款的订单</asp:ListItem>
         <asp:ListItem Value="6">未付清的订单</asp:ListItem>
         <asp:ListItem Value="7">未送货的订单</asp:ListItem>
         <asp:ListItem Value="8">未签收的订单</asp:ListItem>
         <asp:ListItem Value="9">未开发票的订单</asp:ListItem>
         <asp:ListItem Value="10">未结清的有效订单</asp:ListItem>
         <asp:ListItem Value="11">已结清的订单</asp:ListItem>
         <asp:ListItem Value="12">需要发票的订单</asp:ListItem>
         <asp:ListItem Value="13">不需要发票的订单</asp:ListItem>
         <asp:ListItem Value="14">作废的订单</asp:ListItem>
        </asp:DropDownList>
        <strong>查找=></strong>
         <asp:DropDownList ID="DrpIsBusinessConfirm" runat="server">
             <asp:ListItem Value="-1">商家确认</asp:ListItem>
             <asp:ListItem Value="1">已确认消费</asp:ListItem>
             <asp:ListItem Value="0">未确认消费</asp:ListItem>
         </asp:DropDownList>
          时间段：从<asp:TextBox onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'});" ID="TxtBeginDate" runat="server" CssClass="textbox Wdate" Width="120px"></asp:TextBox>至
          <asp:TextBox onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'});" ID="TxtEndDate" runat="server" CssClass="textbox Wdate" Width="120px"></asp:TextBox>
    <asp:DropDownList ID="DrpSearchType" runat="server">
     <asp:ListItem Value="1">订单编号</asp:ListItem>
     <asp:ListItem Value="2">收货人</asp:ListItem>
     <asp:ListItem Value="3">用户名称</asp:ListItem>
     <asp:ListItem Value="4">联系地址</asp:ListItem>
     <asp:ListItem Value="5">联系电话</asp:ListItem>
    </asp:DropDownList><asp:TextBox ID="TxtKey"  CssClass="textbox"  runat="server" Width="100px"></asp:TextBox> 
    <span style="cursor:pointer" onclick="showA();">订购地区？</span>
    <span id="showArea"<%=(provinceId!=0||CityId!=0|| CountyId!=0)?"":" style='display:none;'" %>><script src="../../plus/area.aspx?pid=<%=provinceId %>&cityid=<%=CityId %>&countyId=<%=CountyId %>" id="area"></script></span>
     <asp:Button ID="Button1" runat="server" Text=" 查 找 " CssClass="button" OnClick="Button1_Click" />
     <script>
         function showA() {
             $("#showArea").toggle();
         }
     </script>
         </div>

<div class="tabs_header">
    <ul class="tabs">
    <li<%=KSCMS.S("showType")==""?" class='active'":string.Empty %>><a href="KS.ShopOrder.aspx"><span>所有订单</span></a></li>
    <li<%=KSCMS.S("showType")=="1"?" class='active'":string.Empty %>><a href="KS.ShopOrder.aspx?showType=1"><span style='color:Red;font-weight:bold'>24小时内新订单</span></a></li>
    <li<%=KSCMS.S("showType")=="2"?" class='active'":string.Empty %>><a href="KS.ShopOrder.aspx?showType=2"><span>已付款未发货</span></a></li>
    <li<%=KSCMS.S("showType")=="3"?" class='active'":string.Empty %>><a href="KS.ShopOrder.aspx?showType=3"><span>已付款未开票</span></a></li>
    <li<%=KSCMS.S("showType")=="4"?" class='active'":string.Empty %>><a href="KS.ShopOrder.aspx?showType=4"><span>交易中未结清</span></a></li>
    <li<%=KSCMS.S("showType")=="5"?" class='active'":string.Empty %>><a href="KS.ShopOrder.aspx?showType=5"><span>已结清</span></a></li>
    <li<%=KSCMS.S("showType")=="6"?" class='active'":string.Empty %>><a href="KS.ShopOrder.aspx?showType=6"><span>团购</span></a></li>
    <li<%=KSCMS.S("showType")=="8"?" class='active'":string.Empty %>><a href="KS.ShopOrder.aspx?showType=8"><span>积分兑换</span></a></li>
    <li<%=KSCMS.S("showType")=="7"?" class='active'":string.Empty %>><a href="KS.ShopOrder.aspx?showType=7"><span>作废</span></a></li>
    <%if (MyCache.GetShopCommonConfig(41).Equals("1")){ %>
    <li<%=KSCMS.S("showType")=="100"?" class='active'":string.Empty %>><a href="KS.ShopOrder.aspx?showType=100"><span>商家订单</span></a></li>
    <li<%=KSCMS.S("showType")=="101"?" class='active'":string.Empty %>><a href="KS.ShopOrder.aspx?showType=101"><span>商家已确认</span></a></li>
    <%} %>
    </ul>
</div>

<asp:PlaceHolder ID="PlaceHolder2" runat="server">
<div class="border">
<style>
.border{border:0px;}
.border .wait,.border .wff,.border .wfk,.border .wxf{color:red;}
.border .yff,.border .yfq,.border .yqs,.border .confirm{color:green;}
.border .wx{color:#999;}
.border .jq{color:#888;}
.border .tf{color:brown;}
.border .tk{color:Purple}
.border .ddff{color:brown;}
.border .list_link{line-height:22px;border-left:1px solid #efefef;padding:5px;}
.border .img img{border:1px solid #ccc;padding:1px;}
</style>


  <asp:Repeater ID="Repeater1" runat="server"  onitemdatabound="Repeater1_ItemDataBound" >
          <HeaderTemplate>
          <table width="99%" class="CTable"  border="0" cellpadding="1" cellspacing="1" class="border">
              <tr class="CTitle">
               <td height="20" width="30" nowrap><input type="checkbox" name="chkall" id="chkall" onclick="CheckAll(this.form);"/></td>
               <td><b>订单编号</b></td>
               <td width="80" align="center"><b>用户名</b></td>
               <td align="center"><b>联系人</b></td>
               <td align="center"><b>地区</b></td>
               <td  align="center"><b>下单时间</b></td>
               <td width="70" align="center" nowrap><b>订单金额</b></td>
               <td width="70" align="center" nowrap><b>发票信息</b></td>
               <td width="100" align="center" nowrap><b>订单状态</b></td>
               <td width="50" align="center"><b>商品</b></td>
              </tr>
          </HeaderTemplate>
         <ItemTemplate>
               <tr onmouseover="this.className='CtrMouseOver'" onmouseout="this.className='CtrMouseOut'" onclick="chk(this);">
			<td class="Ctd" align="center" style="width:35px;">
                     <input type="checkbox"  name="ids" id="ids" value="<%#Eval("ID") %>" />
                </td><td class="Ctd">
                  <a title="点击查看订单[<%# Eval("orderid") %>]详情" href="?action=orderdetail&id=<%#Eval("ID")%>" title="<%#  Utils.StrToInt(Eval("smsnum"))>0?"累计发送 "+Eval("SmsNum")+" 过次的提醒付款消息":string.Empty%>"><%#Eval("OrderID") %></a>
                   <%# Utils.StrToInt(Eval("ordertype"))==1?" <span style='color:red'>团</span>":string.Empty %>
                   <%# Utils.StrToInt(Eval("changescore")) >0 ? " <span style='color:green'>兑换</span>" : string.Empty%>
                   <%# Utils.StrToInt(Eval("OrderType"))==0?"":Utils.StrToInt(Eval("ConsumptionMode"))==1?" <span style='color:green'>物流</span>":" <span style='color:blue'>凭单</span>" %>
                </td><td class="Ctd" align="center" style="width:50px;">
                   <%# Convert.ToString(Eval("IsAnonymous"))=="1"?"<span style='color:#999999'>游客</span>":Eval("username")%>
                </td>
                <td class="Ctd" align="center"><%# Eval("RealName") %></td>
                <td class="Ctd tips" align="center"><%# MyCache.GetAreaName(Utils.StrToInt(Eval("ProvinceID")),"city") %><%# MyCache.GetAreaName(Utils.StrToInt(Eval("CityID")),"city") %><%# MyCache.GetAreaName(Utils.StrToInt(Eval("CountyID")),"city") %></td>
                 <td class="Ctd" align="center"><%#Eval("InputTime") %></td>
                   <td class="Ctd" align="center" style="width:70px;">
               <%=MyCache.GetCurrencySymbol %><%# Public.ReturnShopPrice(Utils.StrToDecimal(Eval("OrderTotalPrice"))) %></td><td class="Ctd" align="center" style="width:70px;">
                  <%# getInvoiceInfo(Utils.StrToInt(Convert.ToString(Eval("Invoiced"))), Utils.StrToInt(Convert.ToString(Eval("IsInvoice"))))%>
                </td><td class="Ctd" align="center">
             <%# GetOrderStatus(Utils.StrToInt(Eval("OrderType")),Convert.ToString(Eval("OrderID")),Utils.StrToInt(Eval("ConsumptionMode")),Utils.StrToInt(Eval("IsBusinessConfirm")),Convert.ToString(Eval("alipaytradestatus")), Convert.ToInt16(Eval("status")), Convert.ToInt16(Eval("DeliverStatus")), Utils.StrToDecimal(Convert.ToString(Eval("MoneyReceipt"))), Utils.StrToDecimal(Convert.ToString(Eval("OrderTotalPrice"))))%>
                </td>
                <td align="center"><a href="javascript:;" onclick="jQuery('#s<%# Eval("orderid") %>').toggle();">商品</a></td>
			
             <tr id="s<%# Eval("orderid") %>" style="display:none;">
                 <td></td>
                 <td colspan="10">
                      <asp:Repeater ID="Repeater2" runat="server">
                       <HeaderTemplate>
                            <table width="60%" align="left" class="border" cellspacing="1" cellpadding="1"  border="0">
                            <tr class="CTitle">
                                <td>商品</td>
                                <td style="width:80px;text-align:center">单价</td>
                                <td style="width:80px;text-align:center">数量</td>
                            </tr>
                       </HeaderTemplate>
                       <ItemTemplate>
                      
                       <tr>
                          <td class="Ctd" align="left">
                            <table border='0' width="100%" cellpadding="0" cellspacing="0">
		                       <tr>
			                    <td width="35" height="50" align="center" class="img"><img src='<%# string.IsNullOrEmpty(Convert.ToString(Eval("DefaultPic")))?MyCache.GetCacheShopConfig(9):Kesion.BLL.BaseFun.GetFullImageSrc(Convert.ToString(Eval("DefaultPic")))  %>' width='30' height='30' align='left'/></td>
			                    <td>
                           <%#  getProOrder(Utils.StrToInt((Eval("ClassID"))), Convert.ToString(Eval("FileName") + ""), Convert.ToString(Eval("TurnUrl") + ""), Utils.StrToInt(Eval("ItemID")), Utils.StrToInt(Eval("ChannelID")), Utils.StrToInt(Eval("InfoID")),  Convert.ToString(Eval("Title")), Utils.StrToInt(Eval("isBundleSale")), Utils.StrToInt(Eval("isChangeBuy")), Utils.StrToInt(Eval("isLimitBuy")),Convert.ToString(Eval("AttributeCart")),Utils.StrToInt(Convert.ToString(Eval("AttrID"))))%>

		                       </td>
		                      </tr>
		                     </table>
                          </td>
                          <td class="Ctd" style="width:80px;text-align:center"><%=MyCache.GetCurrencySymbol %><%# Public.ReturnShopPrice(Convert.ToString(Eval("Price"))) %></td>
                          <td class="Ctd" style="width:80px;text-align:center"><%#Eval("num") %></td>
                       </tr>
                       </ItemTemplate>
                           <FooterTemplate>
                               </table> 
                           </FooterTemplate>
                     </asp:Repeater>
                 </td>
             </tr></tr>
       </ItemTemplate>
             <FooterTemplate>
           <tr class="tdbg" style="display:<%# bool.Parse((Repeater1.Items.Count==0).ToString())?"":"none"%>">
                <td class="splittd" style="text-align:center" colspan="10">
                  还没有任何的订单！
                </td>
               </tr> 
           </table>
          </FooterTemplate>
</asp:Repeater>
</asp:PlaceHolder>
    
        <KS:Page ID="Page1" runat="server" />
        <script type="text/javascript">
            showtips('<span class="state"><strong>说明：</strong><br /></span>1、带“<span style=\'color:red\'>团</span>”字的订单表示团购的订单，带“<span style=\'color:green\'>兑换</span>”字的订单表示积分兑换的订单；<br/>2、显示“<span style=\'color:blue\'>凭单</span>”表示该订单通过手机验证码验证消费，显示“<span style=\'color:green\'>物流</span>”表示该订单需要发货；<br/>3、为便于销售统计已确认、已结清、或已收到汇款(包括仅收到预付款)的订单不能删除；<br/>4、积分兑换的订单未结清删除的，所消费的积分将返回用户账号上。');
		</script>
     </asp:Panel>
    
    <asp:Panel ID="showPanel" runat="server" Width="100%" Visible="false">

        <asp:PlaceHolder ID="PlaceHolder1" runat="server"></asp:PlaceHolder>
       
    </asp:Panel>
    
    

  </asp:Content>