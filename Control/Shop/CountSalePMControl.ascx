<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="CountSalePMControl.ascx.cs" Inherits="Kesion.NET.WebSite.Shop.CountSalePMControl" %>
<%@ Import Namespace="Kesion.Cache"%>
<%@ Import Namespace="Kesion.Publics"%>
<%@ Import Namespace="Kesion.APPCode"%>
 <asp:GridView ID="SalePMList" cssclass="CTable" AllowSorting="true" style="border-bottom:none" runat="server" AutoGenerateColumns="False" EmptyDataText="û����������!"  Width="99%" CellPadding="1" CellSpacing="1" GridLines="None" HorizontalAlign="Center" OnRowDataBound="SalePMList_RowDataBound" OnRowCreated="SalePMList_RowCreated" OnSorting="SalePMList_Sorting">
         <Columns>
              <asp:TemplateField HeaderText="���">
                <itemstyle horizontalalign="Center" />
                <itemtemplate>
                   <%# this.SalePMList.PageIndex * this.SalePMList.PageSize + Container.DataItemIndex + 1%> 
                </itemtemplate>
              </asp:TemplateField>
              <asp:TemplateField HeaderText="��Ʒ����">
                <itemstyle horizontalalign="Left" />
                <itemtemplate>
                   <a href='../../model/view.aspx?m_id=<%# Eval("ChannelID") %>&id=<%#Eval("InfoID") %>' target='_blank'><%# Eval("Title")%></a> 
                </itemtemplate>
              </asp:TemplateField>
              <asp:BoundField DataField="SaleNum" DataFormatString="{0} ��" HeaderText="��������" SortExpression="SaleNum">
                <itemstyle width="140px" horizontalalign="Center" ForeColor="green" />
              </asp:BoundField>

               <asp:TemplateField HeaderText="�����۶�">
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
showtips('<span class="state"><strong>˵����</strong><br /></span>�����ͷ�ġ������������������۶�ɷֱ�ʵ��������!');
</script>
       