<%@ Page Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.Admin.Shop.Admin_ShopCouponItem" Title="优惠券管理" Codebehind="KS.ShopCouponItem.Aspx.cs" %>
<%@ Import Namespace="Kesion.Cache" %>
<%@ Import Namespace="Kesion.Publics" %>
<asp:Content ID="Content1" ContentPlaceHolderID="KSContent" Runat="Server">
    <asp:Panel ID="listPanel" runat="server" Width="100%">
      <div id="manage_top">
        
       &nbsp;&nbsp;<a href="KS.ShopLimitBuy.aspx"><strong>返 回</strong></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;查看[<span style="color:Red"><asp:Label ID="LabCouponName"
           runat="server" Text="Label"></asp:Label></span>]下的优惠券列表        
      </div>     
          <div class="menu_top_fixed_height"></div>

    <div>
        <KS:KSGV ID="ProListView" runat="server" CssClass="CTable" AutoGenerateColumns="False" DataKeyNames="FieldID" GridLines="None"
            OnRowDataBound="FieldListView_RowDataBound" PagerType="CustomNumeric" Width="99%" EnableTheming="True" OnRowCommand="FieldListView_RowCommand" HorizontalAlign="Center" EmptyDataText="没有优惠券!">
            <Columns>
              <asp:TemplateField HeaderText="选择">
                <itemstyle horizontalalign="Center" width="50px" />
                <itemtemplate>
                    <input type="checkbox"  name="ids" id="ids" value="<%#Eval("CouponUserID") %>" />
                </itemtemplate>
              </asp:TemplateField>

          
              <asp:TemplateField HeaderText="优惠券号">
                <itemtemplate>
                   <%#Eval("CouponNum") %>
                </itemtemplate>
              </asp:TemplateField>
             <asp:TemplateField HeaderText="面值">
                <itemstyle horizontalalign="Center" width="70px" />
                <itemtemplate>
                <%=MyCache.GetCurrencySymbol %><%# Kesion.APPCode.Public.ReturnShopPrice(Eval("FaceValue")) %><%=MyCache.GetCurrencyUnit %>
                </itemtemplate>
              </asp:TemplateField>

              <asp:TemplateField HeaderText="最大抵扣额">
                <itemstyle horizontalalign="Center" width="150px" />
                <itemtemplate>
                <%# GetDiscoutStr(Convert.ToString(Eval("MaxDiscount"))) %>
                </itemtemplate>
              </asp:TemplateField>

                 <asp:TemplateField HeaderText="可用金额">
                <itemstyle horizontalalign="Center" width="70px" />
                <itemtemplate>
                <%=MyCache.GetCurrencySymbol %><%# Kesion.APPCode.Public.ReturnShopPrice(Eval("AvailableMoney")) %><%=MyCache.GetCurrencyUnit %>
                </itemtemplate>
              </asp:TemplateField>

   
              <asp:BoundField DataField="UserName" HeaderText="使用人">
                <itemstyle width="70px" horizontalalign="Center" />
                </asp:BoundField>
              
              <asp:TemplateField HeaderText="使用情况">
                <itemstyle horizontalalign="Center" width="150px" />
                <itemtemplate>
                <%# GetUseStr(Convert.ToInt16(Convert.ToString(Eval("UseFlag"))),Convert.ToString(Eval("AvailableMoney")),Convert.ToString(Eval("Note"))) %>
                </itemtemplate>
              </asp:TemplateField>

                <asp:TemplateField HeaderText="管理操作">
                <itemtemplate>
                     <asp:LinkButton runat="server" id="delete" commandargument=<%#Eval("couponuserID") %> commandname="del">删除</asp:LinkButton>
                
               </itemtemplate>
                <itemstyle horizontalalign="Center" width="100px" />
                </asp:TemplateField>
            </Columns>
            <HeaderStyle CssClass="CTitle" />
            <EmptyDataRowStyle CssClass="emptycss" />
        </KS:KSGV>
        <br />
        <asp:Panel ID="Panel1" runat="server" Height="30px" Width="739px">
        
        &nbsp;&nbsp;<input type="checkbox" name="chkall" id="chkall" onclick="CheckAll(this.form);"/><label for="chkall">全部选中</label>
           &nbsp; <input type="button" value="批量删除优惠券" onmouseover="this.className='button_on';" onmouseout="this.className='button';" class="button" onclick="if (GetIDS('del')){this.form.action='?couponid=<%=couponId %>&action=del';this.form.submit()}" />
           
           <input class="button" type="button" value=" 打 印 " onclick="window.print()">
           
           <input class="button" type="button" value=" 发 放 " onclick="location.href='KS.ShopCouponPub.aspx?couponid=<%=couponId %>';">
         </asp:Panel>
        </div>
        
          <KS:Page ID="Page1" runat="server" />
        
        
          <br />
        <script type="text/javascript">
            showtips('<span class="state"><strong>说明：</strong><br /></span>您可以在这里批量删除优惠券或是打印优惠券等管理操作!');
		</script>
     </asp:Panel>
    
    

  </asp:Content>