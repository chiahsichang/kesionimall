<%@ Page Language="C#" MasterPageFile="~/User/User.master" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.MyCoupon" Title="Untitled Page" Codebehind="MyCoupon.aspx.cs" %>
<%@ Import Namespace="Kesion.Cache" %>
<%@ Import Namespace="Kesion.Publics" %>
<asp:Content ID="Content1" ContentPlaceHolderID="KSContent" Runat="Server">

<asp:Panel ID="PanList" runat="server">
    <div class="toptips">
     <span style="float:right">可以在此查看及管理您的所有优惠券！</span> 共有：<asp:Label ID="Lab_Total_Info" runat="server" Text=""></asp:Label> 张优惠券
   </div>
    <asp:Repeater ID="Repeater1" runat="server">
    <HeaderTemplate>
         <table id="tablist" width="98%" border="0" align="center" cellpadding="2" cellspacing="1" class="border">
      <tr align="center" class="title">
        	<td>优惠券号</td>
        	<td>优惠券名称</td>
        	<td>面值</td>
        	<td>剩余金额</td>
        	<td>最小订单金额</td>
        	<td>截止使用日期</td>
        	<td>最大抵扣额</td>
        	<td>使用情况</td>
        </tr>
    </HeaderTemplate>
    <ItemTemplate>
      <tr class="tdbg">
          <td class="splittd"><%# Eval("couponnum") %></td>
          <td class="splittd"> 
           <%# Eval("couponname") %>
          </td>
          <td class="splittd" nowrap><%# Math.Round(Convert.ToDecimal(Eval("facevalue")),2)%> <%=MyCache.GetCurrencyUnit%></td>
          <td class="splittd" align="center" nowrap><font color=green><%# Math.Round(Convert.ToDecimal(Eval("availablemoney")), 2)%> <%=MyCache.GetCurrencyUnit%></font></td>
          <td class="splittd" align="center" nowrap><%# Math.Round(Convert.ToDecimal(Eval("minamount")), 2)%> <%=MyCache.GetCurrencyUnit%></td>
          <td class="splittd" align="center" nowrap><%# Convert.ToDateTime(Eval("enddate")).ToShortDateString() %> </td>
          <td class="splittd" align="center"><%# Utils.StrToInt(Eval("maxdiscount")) == 0 ? Math.Round(Convert.ToDecimal(Eval("facevalue")), 2).ToString()+MyCache.GetCurrencyUnit : "按订单总额的" + Eval("maxdiscount") + "%"%> </td>
          <td class="splittd">
          <%# Convert.ToString(Eval("useflag")) == "1" ? (Math.Round(Convert.ToDecimal(Eval("availablemoney")), 2) > 0 ? "已使用，未用完" : "已用完")+("<a style=\'color:blue\' href='javascript:;' onclick=\"KesionJS.Tips('优惠券使用情况','<div class=tips>" + Eval("note") + "</div>',500,200,null);\" >（详情）</a>") : "<div style='text-align:center'><font color=#999999>未使用</font></div>"%>
          
          
          </td>

      </tr>  

     </ItemTemplate>
     <FooterTemplate>
         <tr class="tdbg" style="display:<%# bool.Parse((Repeater1.Items.Count==0).ToString())?"":"none"%>">
                <td class="splittd" style="text-align:center" colspan="10">
                  没有可用的优惠券！
                </td>
           </tr> 
      </table>
     </FooterTemplate>
    </asp:Repeater>
    
   <br />
    
     <KS:Page ID="Page1" runat="server" />
     
   <br />
   
   
   
   <script>
       function check() {
           if ($("#<%=this.TxtCouponNum.ClientID %>").val() == '') {
               $.dialog.alert('请输入优惠券号!', function() {
                   $("#<%=this.TxtCouponNum.ClientID %>").focus();
               });
           return false;
       }
       return true;
       }
   </script>
    <table width="98%" align="center" border="0" cellpadding="1" cellspacing="1" class="border"> 
    <tr class="title1">
     <td colspan=5>添加优惠券</td>
    </tr>

            <tr class="tdbg">
                <td class="lefttd" height="30">优惠券号: </td>
                <td class="righttd">
                    <asp:TextBox CssClass="textbox" ID="TxtCouponNum" runat="server"></asp:TextBox>
                     <span style="color:Red">*</span>
                     <asp:Button ID="BtnAddCoupon" OnClientClick="return(check());" CssClass="button" runat="server" Text="确定添加" 
                        onclick="BtnAddCoupon_Click" />
                </td>
            
            </tr>
      </table>
   
</asp:Panel>


</asp:Content>