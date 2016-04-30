<%@ Page Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" CodeBehind="KS.ShopStats.aspx.cs" Inherits="Kesion.NET.WebSite.Admin.Shop.Admin_ShopStats" Title="销售数据统计" %>
<asp:Content ID="Content1" ContentPlaceHolderID="KSContent" runat="server">
<div id="manage_top" class="menu_top_fixed">&nbsp;<strong>统计中心：</strong>
<a href="KS.ShopStats.aspx">综合数据/指标</a> | <a href="KS.ShopStats.aspx?action=CountOrder">订单统计</a> | <a href="KS.ShopStats.aspx?action=CountSale">销售概况</a> | <a href="KS.ShopStats.aspx?action=CountSalePM">销售量(额)排行 TOP 100</a> 
</div>
 <div class="menu_top_fixed_height"></div>
<asp:PlaceHolder ID="PlhControl" runat="server"></asp:PlaceHolder>

</asp:Content>
