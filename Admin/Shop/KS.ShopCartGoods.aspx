<%@ Page Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.Admin.Shop.Admin_ShopCartGoods" Title="购物车记录" Codebehind="KS.ShopCartGoods.aspx.cs" %>
<%@ Import Namespace="Kesion.Cache" %>
<asp:Content ID="Content1" ContentPlaceHolderID="KSContent" Runat="Server">
    <asp:Panel ID="listPanel" runat="server" Width="100%">
<div id="manage_top" class="menu_top_fixed">&nbsp;<strong>快速检索：</strong>
<a href="KS.ShopCartGoods.aspx">所有记录</a> | <a href="KS.ShopCartGoods.aspx?logType=1">24小时内记录</a> | <a href="KS.ShopCartGoods.aspx?logType=2">3天内记录</a> | <a href="KS.ShopCartGoods.aspx?logType=3">10天内记录</a> | <a href="KS.ShopCartGoods.aspx?logType=4">一个月内记录</a> | <a href="KS.ShopCartGoods.aspx?logType=5">三个月内记录</a>
</div> 
<div class="menu_top_fixed_height"></div>
    <div>
        <KS:KSGV ID="CartListView" cssclass="CTable" runat="server" AutoGenerateColumns="False" DataKeyNames="FieldID" GridLines="None"
            OnRowDataBound="FieldListView_RowDataBound" PagerType="CustomNumeric" Width="99%" EnableTheming="True" EmptyDataText="购物车里找不到任何的商品记录!">
            <Columns>
              <asp:TemplateField HeaderText="选择">
                <itemstyle horizontalalign="Center" width="50px" />
                <itemtemplate>
                    <input type="checkbox"  name="ids" id="ids" value="<%#Eval("CartID") %>" />
                </itemtemplate>
              </asp:TemplateField>
            
                 <asp:TemplateField HeaderText="商品名称">
                  <itemstyle/>
                <ItemTemplate>
                
                <table border='0'>
	               <tr>
	                <td>
	                <img src='<%# GetPicUrl(Convert.ToString(Eval("defaultpic"))) %>' width='60' height='50' align='left'/>
		            </td>
		            <td>
                    <%# GetTitle(Convert.ToString(Eval("attributecart")),Convert.ToInt16(Eval("AttrID")), Convert.ToInt16(Eval("CartID")), Convert.ToInt16(Eval("ChannelID")), Convert.ToInt16(Eval("InfoID")), Convert.ToString(Eval("Title")), Convert.ToInt16(Eval("IsBundleSale")), Convert.ToInt16(Eval("IsChangeBuy")))%>
                   
	              </td>
	              </tr>
	             </table>
                
                
                  
                </ItemTemplate>  
                </asp:TemplateField>
               
                <asp:BoundField DataField="Num" DataFormatString="{0} 件" HeaderText="用户购买数">
                  <itemstyle horizontalalign="Center" width="80px" />
                </asp:BoundField>
                <asp:BoundField DataField="AddDate" HeaderText="下单时间">
                  <itemstyle horizontalalign="Center" width="130px" />
                </asp:BoundField>
                
                <asp:BoundField DataField="UserName" HeaderText="用户名">
                <itemstyle horizontalalign="Center" width="50px" />
                </asp:BoundField>
                <asp:BoundField DataField="IsAnonymous" HeaderText="是否游客下单">
                <itemstyle width="80px" horizontalalign="Center" />
                </asp:BoundField>
                
        
            </Columns>
            <HeaderStyle CssClass="CTitle" />
            <EmptyDataRowStyle CssClass="emptycss" />
        </KS:KSGV>
        <br />
         <asp:Panel ID="Panel1" runat="server" Height="30px" Width="739px">
         &nbsp;&nbsp;&nbsp;&nbsp;<input type="checkbox" name="chkall" id="chkall" onclick="CheckAll(this.form);"/><label for="chkall">全部选中</label>
           &nbsp; <input type="button" value="批量删除选中的记录" onmouseover="this.className='button_on';" onmouseout="this.className='button';" class="button" onclick="if (GetIDS('del')){this.form.action='?action=del';this.form.submit()}" />
             <asp:Button ID="BtnDelAll" runat="server" Text="一键清空" CssClass="button" OnClientClick="return(confirm('此操作不可逆，确认操作吗？'));" OnClick="BtnDelAll_Click" />
           <br />
          </asp:Panel>
        </div>
        
         <KS:Page ID="Page1" runat="server" />
         <br />
        <script type="text/javascript">
		showtips('<span class="state"><strong>说明：</strong><br /></span>通过此页面您可以了解有哪些客户对您的哪些产品感兴趣!');
		</script>
		

     </asp:Panel>

  </asp:Content>