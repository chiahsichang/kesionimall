<%@ Page Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.Admin.Shop.Admin_ShopLogInvoice" Title="��Ʊ��¼��ѯ" Codebehind="KS.ShopLogInvoice.aspx.cs" %>
<%@ Import Namespace="Kesion.Cache" %>
<%@ Import Namespace="Kesion.Publics" %>
<%@ Import Namespace="Kesion.APPCode" %>
<asp:Content ID="Content1" ContentPlaceHolderID="KSContent" Runat="Server">
    <asp:Panel ID="listPanel" runat="server" Width="100%">
<div id="manage_top" class="menu_top_fixed">&nbsp;<strong>���ټ�����</strong>
<a href="KS.ShopLogInvoice.aspx">���м�¼</a> | <a href="KS.ShopLogInvoice.aspx?logType=1">10���ڼ�¼</a> | <a href="KS.ShopLogInvoice.aspx?logType=2">һ�����ڼ�¼</a> | <a href="KS.ShopLogInvoice.aspx?logType=3">��˰��Ʊ</a> | <a href="KS.ShopLogInvoice.aspx?logType=4">��˰��Ʊ</a> | <a href="KS.ShopLogInvoice.aspx?logType=5">��ֵ˰��Ʊ</a>

     &nbsp;&nbsp;<strong>����=></strong>
    <asp:DropDownList ID="DrpSearchType" runat="server">
     <asp:ListItem Value="1">�ͻ�����</asp:ListItem>
     <asp:ListItem Value="2">�û�����</asp:ListItem>
     <asp:ListItem Value="3">������</asp:ListItem>
     <asp:ListItem Value="4">��Ʊ����</asp:ListItem>
     <asp:ListItem Value="5">��Ʊ��</asp:ListItem>
    </asp:DropDownList>
    <asp:TextBox ID="TxtKey" CssClass="textbox"  runat="server" Width="100px"></asp:TextBox> 
<asp:Button ID="Button1"
        runat="server" Text=" �� �� " CssClass="button" OnClick="Button1_Click" />
</div> 
<div class="menu_top_fixed_height"></div>      
    <div>
        <KS:KSGV ID="LogInvoiceView" cssclass="CTable" runat="server" AutoGenerateColumns="False" DataKeyNames="FieldID" GridLines="None"
            OnRowDataBound="FieldListView_RowDataBound" PagerType="CustomNumeric" Width="99%" EnableTheming="True" EmptyDataText="�Ҳ�������Ʊ��¼!">
            <Columns>
                 <asp:TemplateField HeaderText="������">
                  <itemstyle horizontalalign="Center" width="100px" />
                <ItemTemplate>
                  <a href='KS.ShopOrder.aspx?action=orderdetail&orderid=<%# Eval("OrderId").ToString() %>'><%# Eval("OrderId").ToString() %></a>
                </ItemTemplate>  
                </asp:TemplateField>
                <asp:BoundField DataField="InvoiceTitle" HeaderText="��Ʊ̧ͷ">
                </asp:BoundField>
                <asp:BoundField DataField="InvoiceType" HeaderText="��Ʊ����">
                  <itemstyle horizontalalign="Center" width="80px" />
                </asp:BoundField>
                <asp:BoundField DataField="InvoiceNum" HeaderText="��Ʊ����">
                  <itemstyle horizontalalign="Center" width="100px" />
                </asp:BoundField>

                 <asp:TemplateField HeaderText="��Ʊ���">
                <itemstyle horizontalalign="Center" width="100px"/>
                <itemtemplate>
               <%=MyCache.GetCurrencySymbol%><%# Public.ReturnShopPrice(Utils.StrToDecimal(Eval("MoneyTotal")))%>
                </itemtemplate>
              </asp:TemplateField> 

                <asp:BoundField DataField="InvoiceDate" HeaderText="ʱ��">
                <itemstyle horizontalalign="Center" width="100px" />
                </asp:BoundField>
                <asp:BoundField DataField="UserName" HeaderText="�û���">
                <itemstyle horizontalalign="Center" width="50px" />
                </asp:BoundField>
                <asp:BoundField DataField="ClientName" HeaderText="�ͻ�����">
                <itemstyle width="80px" horizontalalign="Center" />
                </asp:BoundField>
                
                
                <asp:BoundField DataField="HandlerName" HeaderText="��Ʊ��">
                  <itemstyle horizontalalign="Center" width="70px" />
                </asp:BoundField>
                
                <asp:TemplateField HeaderText="��Ʊ����">
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
		showtips('<span class="state"><strong>˵����</strong><br /></span>��ҳ���ѯ����Ʊ��¼ר�ã����ṩɾ���������!');
		</script>
		

     </asp:Panel>

  </asp:Content>