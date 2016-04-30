<%@ Page Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.Admin.Shop.Admin_ShopLogInvoice" Title="发票记录查询" Codebehind="KS.ShopLogInvoice.aspx.cs" %>
<%@ Import Namespace="Kesion.Cache" %>
<%@ Import Namespace="Kesion.Publics" %>
<%@ Import Namespace="Kesion.APPCode" %>
<asp:Content ID="Content1" ContentPlaceHolderID="KSContent" Runat="Server">
    <asp:Panel ID="listPanel" runat="server" Width="100%">
<div id="manage_top" class="menu_top_fixed">&nbsp;<strong>快速检索：</strong>
<a href="KS.ShopLogInvoice.aspx">所有记录</a> | <a href="KS.ShopLogInvoice.aspx?logType=1">10天内记录</a> | <a href="KS.ShopLogInvoice.aspx?logType=2">一个月内记录</a> | <a href="KS.ShopLogInvoice.aspx?logType=3">地税普票</a> | <a href="KS.ShopLogInvoice.aspx?logType=4">国税普票</a> | <a href="KS.ShopLogInvoice.aspx?logType=5">增值税发票</a>

     &nbsp;&nbsp;<strong>搜索=></strong>
    <asp:DropDownList ID="DrpSearchType" runat="server">
     <asp:ListItem Value="1">客户姓名</asp:ListItem>
     <asp:ListItem Value="2">用户名称</asp:ListItem>
     <asp:ListItem Value="3">订单号</asp:ListItem>
     <asp:ListItem Value="4">发票号码</asp:ListItem>
     <asp:ListItem Value="5">开票人</asp:ListItem>
    </asp:DropDownList>
    <asp:TextBox ID="TxtKey" CssClass="textbox"  runat="server" Width="100px"></asp:TextBox> 
<asp:Button ID="Button1"
        runat="server" Text=" 查 找 " CssClass="button" OnClick="Button1_Click" />
</div> 
<div class="menu_top_fixed_height"></div>      
    <div>
        <KS:KSGV ID="LogInvoiceView" cssclass="CTable" runat="server" AutoGenerateColumns="False" DataKeyNames="FieldID" GridLines="None"
            OnRowDataBound="FieldListView_RowDataBound" PagerType="CustomNumeric" Width="99%" EnableTheming="True" EmptyDataText="找不到开发票记录!">
            <Columns>
                 <asp:TemplateField HeaderText="订单号">
                  <itemstyle horizontalalign="Center" width="100px" />
                <ItemTemplate>
                  <a href='KS.ShopOrder.aspx?action=orderdetail&orderid=<%# Eval("OrderId").ToString() %>'><%# Eval("OrderId").ToString() %></a>
                </ItemTemplate>  
                </asp:TemplateField>
                <asp:BoundField DataField="InvoiceTitle" HeaderText="发票抬头">
                </asp:BoundField>
                <asp:BoundField DataField="InvoiceType" HeaderText="发票类型">
                  <itemstyle horizontalalign="Center" width="80px" />
                </asp:BoundField>
                <asp:BoundField DataField="InvoiceNum" HeaderText="发票号码">
                  <itemstyle horizontalalign="Center" width="100px" />
                </asp:BoundField>

                 <asp:TemplateField HeaderText="发票金额">
                <itemstyle horizontalalign="Center" width="100px"/>
                <itemtemplate>
               <%=MyCache.GetCurrencySymbol%><%# Public.ReturnShopPrice(Utils.StrToDecimal(Eval("MoneyTotal")))%>
                </itemtemplate>
              </asp:TemplateField> 

                <asp:BoundField DataField="InvoiceDate" HeaderText="时间">
                <itemstyle horizontalalign="Center" width="100px" />
                </asp:BoundField>
                <asp:BoundField DataField="UserName" HeaderText="用户名">
                <itemstyle horizontalalign="Center" width="50px" />
                </asp:BoundField>
                <asp:BoundField DataField="ClientName" HeaderText="客户名称">
                <itemstyle width="80px" horizontalalign="Center" />
                </asp:BoundField>
                
                
                <asp:BoundField DataField="HandlerName" HeaderText="开票人">
                  <itemstyle horizontalalign="Center" width="70px" />
                </asp:BoundField>
                
                <asp:TemplateField HeaderText="发票内容">
                <itemtemplate>
                  <%# Eval("InvoiceContent")%>                
               </itemtemplate>
                </asp:TemplateField>
            </Columns>
            <HeaderStyle CssClass="CTitle" />
            <EmptyDataRowStyle CssClass="emptycss" />
        </KS:KSGV>
        <br />

        </div>
        
       <KS:Page ID="Page1" runat="server" />
         <br />
        <script type="text/javascript">
		showtips('<span class="state"><strong>说明：</strong><br /></span>此页面查询开发票记录专用，不提供删除等其操作!');
		</script>
		

     </asp:Panel>

  </asp:Content>