<%@ Page Language="C#" MasterPageFile="~/Admin/MasterPage.master" EnableEventValidation="false"  AutoEventWireup="true" Inherits="Kesion.NET.WebSite.Admin.Shop.Admin_ShopGroupBuySell" Title="团购商品销售详情" Codebehind="KS.ShopGroupBuySell.aspx.cs" %>
<%@ Import Namespace="Kesion.Publics" %>
<%@ Import Namespace="Kesion.BLL" %>
<asp:Content ID="Content1" ContentPlaceHolderID="KSContent" Runat="Server">
     <asp:Panel ID="TaskList" runat="server" Width="100%">

      <%
          int totalSellNum = Utils.StrToInt(DataFactory.GetOnlyValue("select sum(num) from ks_proorderitem i inner join ks_proorder o on i.orderid=o.orderid where o.ordertype=1 and i.infoid=" + ProId));
          int hasPayNum = Utils.StrToInt(DataFactory.GetOnlyValue("select sum(num) from ks_proorderitem i inner join ks_proorder o on i.orderid=o.orderid where o.ordertype=1 and o.MoneyReceipt>0 and i.infoid=" + ProId));
          int noPayNum = Utils.StrToInt(DataFactory.GetOnlyValue("select sum(num) from ks_proorderitem i inner join ks_proorder o on i.orderid=o.orderid where o.ordertype=1 and o.MoneyReceipt<=0 and i.infoid=" + ProId));
      %>
<div class="tabs_header">
    <ul class="tabs">
    <li<%=KSCMS.S("flag")==""?" class='active'":string.Empty %>><a href="KS.ShopGroupBuySell.aspx?proid=<%=ProId %>"><span>所有销售(<%=totalSellNum%>)</span></a></li>
    <li<%=KSCMS.S("flag")=="1"?" class='active'":string.Empty %>><a href="KS.ShopGroupBuySell.aspx?flag=1&proid=<%=ProId %>"><span>已付款(<font style='color:Green'><%=hasPayNum%></font>)</span></a></li>
    <li<%=KSCMS.S("flag")=="2"?" class='active'":string.Empty %>><a href="KS.ShopGroupBuySell.aspx?flag=2&proid=<%=ProId %>"><span>未付款(<font style='color:Red'><%=noPayNum%></font>)</span></a></li>
    </ul>
</div>
      
  <KS:KSGV ID="list" runat="server" AutoGenerateColumns="False" Width="99%" 
             EmptyDataText="没有销售记录!" GridLines="None" OnRowDataBound="list_RowDataBound"  OnRowCreated="list_RowCreated" 
             AllowPaging="True" HorizontalAlign="Center" >
          <Columns>
              <asp:TemplateField HeaderText="序号">
                <itemstyle horizontalalign="Center" width="40px" />
                <itemtemplate>
                    <%# (CurrPage-1)*PageSize+(Container.DataItemIndex+1)%> 

                </itemtemplate>
              </asp:TemplateField>
               
             <asp:TemplateField HeaderText="购买人">
             <itemstyle VerticalAlign="Top" />
             <itemtemplate>
              <%# Eval("username") %>
              </itemtemplate>
             </asp:TemplateField> 
             <asp:TemplateField HeaderText="购买时间">
             <itemstyle horizontalalign="Center" />
             <itemtemplate>
             <span style='color:#999999;'><%# Eval("inputtime") %></span>
             </itemtemplate>
             </asp:TemplateField>
             <asp:TemplateField HeaderText="购买数量">
             <itemstyle horizontalalign="Center" />
             <itemtemplate>
             <span style='color:#999999;'><%# Eval("num") %></span>
             </itemtemplate>
             </asp:TemplateField>
             <asp:TemplateField HeaderText="金额">
             <itemstyle horizontalalign="Center" />
             <itemtemplate>
             <span style='color:brown;font-size:14px'><%# DataBinder.Eval(Container.DataItem, "TotalPrice", "{0:c}元")%></span>
             </itemtemplate>
             </asp:TemplateField>
             
           
             
             
             <asp:TemplateField HeaderText="付款状态">
             <itemstyle horizontalalign="Center" width="55"/>
             <itemtemplate>
              <%# Convert.ToString(Eval("paystatus")) == "1" ? "<span style='color:green'>付清</span>" : (Convert.ToString(Eval("paystatus")) == "0"?"<span style='color:red'>未付清</span>":"<span style='color:blue'>已收定金</span>")%>
             </itemtemplate>
             </asp:TemplateField>
             
            <asp:TemplateField HeaderText="↓管理操作">
                <itemstyle horizontalalign="Center" />
             <itemtemplate>
              <a href="KS.ShopOrder.aspx?action=orderdetail&id=<%#Eval("oid") %>" target="main">定单详情</a>
                </itemtemplate>
            </asp:TemplateField>
          </Columns>
            <HeaderStyle CssClass="CTitle" />
            <EmptyDataRowStyle CssClass="emptycss" />
      </KS:KSGV>
     
    
    <KS:Page ID="Page1" runat="server" />
    
    <div class="message">
<strong>搜索购买记录：</strong>用户名<asp:TextBox runat="server" ID="TxtKeyWord" CssClass="textbox" /> 
</asp:DropDownList>
    <asp:Button ID="BtnSearch" runat="server" CssClass="button" Text="开始搜索" 
            onclick="BtnSearch_Click"  />
        </div>
        
    </asp:Panel>
    
 
    
</asp:Content>

