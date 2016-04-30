<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="CountSalePMControl.ascx.cs" Inherits="Kesion.NET.WebSite.Shop.CountSalePMControl" %>
<%@ Import Namespace="Kesion.Cache"%>
<%@ Import Namespace="Kesion.Publics"%>
<%@ Import Namespace="Kesion.APPCode"%>
 <asp:GridView ID="SalePMList" cssclass="CTable" AllowSorting="true" style="border-bottom:none" runat="server" AutoGenerateColumns="False" EmptyDataText="没有销售数据!"  Width="99%" CellPadding="1" CellSpacing="1" GridLines="None" HorizontalAlign="Center" OnRowDataBound="SalePMList_RowDataBound" OnRowCreated="SalePMList_RowCreated" OnSorting="SalePMList_Sorting">
         <Columns>
              <asp:TemplateField HeaderText="序号">
                <itemstyle horizontalalign="Center" />
                <itemtemplate>
                   <%# this.SalePMList.PageIndex * this.SalePMList.PageSize + Container.DataItemIndex + 1%> 
                </itemtemplate>
              </asp:TemplateField>
              <asp:TemplateField HeaderText="商品名称">
                <itemstyle horizontalalign="Left" />
                <itemtemplate>
                   <a href='../../model/view.aspx?m_id=<%# Eval("ChannelID") %>&id=<%#Eval("InfoID") %>' target='_blank'><%# Eval("Title")%></a> 
                </itemtemplate>
              </asp:TemplateField>
              <asp:BoundField DataField="SaleNum" DataFormatString="{0} 件" HeaderText="总销售量" SortExpression="SaleNum">
                <itemstyle width="140px" horizontalalign="Center" ForeColor="green" />
              </asp:BoundField>

               <asp:TemplateField HeaderText="总销售额">
                <itemstyle width="150px" horizontalalign="Center" />
                <itemtemplate>
               <%=MyCache.GetCurrencySymbol%><%# Public.ReturnShopPrice(Utils.StrToDecimal(Eval("SaleMoney")))%><%=MyCache.GetCurrencyUnit %>
                </itemtemplate>
              </asp:TemplateField> 

              
         </Columns>
            <HeaderStyle CssClass="CTitle" />
            <EmptyDataRowStyle CssClass="emptycss" />
 </asp:GridView>
<script type="text/javascript">
showtips('<span class="state"><strong>说明：</strong><br /></span>点击表头的“总销售量”或“总销售额”可分别实现排序功能!');
</script>
       