<%@ Page Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" CodeBehind="KS.ShopStats.aspx.cs" Inherits="Kesion.NET.WebSite.Admin.Shop.Admin_ShopStats" Title="��������ͳ��" %>
<asp:Content ID="Content1" ContentPlaceHolderID="KSContent" runat="server">
<div id="manage_top" class="menu_top_fixed">&nbsp;<strong>ͳ�����ģ�</strong>
<a href="KS.ShopStats.aspx">�ۺ�����/ָ��</a> | <a href="KS.ShopStats.aspx?action=CountOrder">����ͳ��</a> | <a href="KS.ShopStats.aspx?action=CountSale">���۸ſ�</a> | <a href="KS.ShopStats.aspx?action=CountSalePM">������(��)���� TOP 100</a> 
</div>
 <div class="menu_top_fixed_height"></div>
<asp:PlaceHolder ID="PlhControl" runat="server"></asp:PlaceHolder>

</asp:Content>
