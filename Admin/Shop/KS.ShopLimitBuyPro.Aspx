<%@ Page Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.Admin.Shop.Admin_ShopLimitBuyPro" Title="抢购商品管理" Codebehind="KS.ShopLimitBuyPro.Aspx.cs" %>
<%@ Import Namespace="Kesion.Cache" %>
<%@ Import Namespace="Kesion.Publics" %>
<%@ Import Namespace="Kesion.APPCode" %>
<asp:Content ID="Content1" ContentPlaceHolderID="KSContent" Runat="Server">
    <asp:Panel ID="listPanel" runat="server" Width="100%">
      <div id="manage_top">
        
       &nbsp;&nbsp;<a href="KS.ShopLimitBuy.aspx"><strong>返 回</strong></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="LabTaskName"
           runat="server" Text="Label"></asp:Label>      
      </div>     
         <div class="menu_top_fixed_height"></div>
    <div>
        <KS:KSGV ID="ProListView" CssClass="CTable" runat="server" AutoGenerateColumns="False" DataKeyNames="FieldID" GridLines="None"
            OnRowDataBound="FieldListView_RowDataBound" PagerType="CustomNumeric" Width="99%" EnableTheming="True" OnRowCommand="FieldListView_RowCommand"  EmptyDataText="对不起,抢购任务您还没有添加任何抢购商品,请到商品管理里添加!">
            <Columns>
              <asp:TemplateField HeaderText="选择">
                <itemstyle horizontalalign="Center" width="50px" />
                <itemtemplate>
                    <input type="checkbox"  name="ids" id="ids" value="<%#Eval("InfoID") %>" />
                </itemtemplate>
              </asp:TemplateField>

              <asp:TemplateField HeaderText="商品小图">
                <itemstyle horizontalalign="Center" width="80px" />
                <itemtemplate>
                    <img alt='<%#Eval("Title") %>' src='<%# string.IsNullOrEmpty(Convert.ToString(Eval("defaultPic")))?MyCache.GetCacheShopConfig(9):Eval("DefaultPic") %>' width="40" height="40" />
                </itemtemplate>
              </asp:TemplateField>
              <asp:TemplateField HeaderText="商品名称">
                <itemtemplate>
                   <asp:HiddenField id="HidInfoId" value='<%#Eval("InfoID") %>' runat="server"></asp:HiddenField>
                   <a href='../../model/view.aspx?m_id=<%#Eval("ChannelID") %>&id=<%# Eval("InfoID") %>' target="_blank"><%#Eval("Title") %></a>
                </itemtemplate>
              </asp:TemplateField>
              <asp:TemplateField HeaderText="市场价">
                <itemstyle horizontalalign="Center" width="150px" />
                <itemtemplate>
                   <asp:TextBox CssClass="textbox" runat="server" id="TxtPrice" width="50px" style="text-align:center" Text='<%# Public.ReturnShopPrice(Utils.StrToDecimal(Eval("Price"))) %>'></asp:TextBox>
                </itemtemplate>
              </asp:TemplateField>
              <asp:TemplateField HeaderText="抢购价">
                <itemstyle horizontalalign="Center" width="150px" />
                <itemtemplate>
                   <asp:TextBox CssClass="textbox" runat="server" id="TxtLimitBuyPrice" width="50px" style="text-align:center" Text='<%# Public.ReturnShopPrice(Utils.StrToDecimal(Eval("LimitBuyPrice"))) %>'></asp:TextBox>
                </itemtemplate>
              </asp:TemplateField>
              <asp:TemplateField HeaderText="抢购数量">
                <itemstyle horizontalalign="Center" width="150px" />
                <itemtemplate>
                   <asp:TextBox CssClass="textbox" runat="server" id="TxtLimitBuyAmount" width="50px" style="text-align:center" Text='<%#Eval("LimitBuyAmount") %>'></asp:TextBox>
                </itemtemplate>
              </asp:TemplateField>

              <asp:TemplateField HeaderText="编辑">
              <itemstyle width="30px" horizontalalign="Center"/>
              <itemtemplate>
                     <a class="edit" title="编辑" href='KS.Shop.aspx?Action=Edit&Channelid=<%#Eval("ChannelID") %>&ID=<%#Eval("InfoID") %>'></a>
              </itemtemplate>
            </asp:TemplateField>
             <asp:TemplateField HeaderText="删除">
              <itemstyle width="30px" horizontalalign="Center"/>
              <itemtemplate>
                     <asp:LinkButton ToolTip="删除" CssClass="delete" runat="server" id="delete" commandargument=<%#Eval("InfoID") %> commandname="del"></asp:LinkButton>
              </itemtemplate>
            </asp:TemplateField>


              
            </Columns>
            <HeaderStyle CssClass="CTitle" />
            <EmptyDataRowStyle CssClass="emptycss" />
        </KS:KSGV>
        <br />
        <asp:Panel ID="Panel1" runat="server" Height="30px" Width="739px">
           &nbsp; <input type="button" value="批量删除订单" onmouseover="this.className='button_on';" onmouseout="this.className='button';" class="button" onclick="if (GetIDS('del')){this.form.action='?taskId=<%=taskId %>&action=del';this.form.submit()}" />
           <asp:Button ID="BatchSetButton" Text="批量保存设置" runat="server" CssClass="button" OnClick="BatchSetButton_Click" />
          <input type="button" id="addProBtn" onclick="addPro()" class="button" value="添加抢购商品" />
          <script type="text/javascript">
              function addPro() {
                  top.openWin("添加限时限量抢购商品", "Shop/KS.ShopAddLimitPro.aspx?taskId=<%=taskId %>", false, 400, 200);
              }
         
          </script>
          
          
         </asp:Panel>
        </div>
        
         <KS:Page ID="Page1" runat="server" />
        
        
          <br />
        <script type="text/javascript">
		showtips('<span class="state"><strong>说明：</strong><br /></span>您可以在这里批量修改抢购商品的价格及抢购数,还可以将抢购商品移除!');
		</script>
     </asp:Panel>
    
    

  </asp:Content>