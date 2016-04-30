<%@ Page Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.Admin.Shop.Admin_ShopBrandPro" Title="品牌下的商品管理" Codebehind="KS.ShopBrandPro.Aspx.cs" %>
<%@ Import Namespace="Kesion.Cache" %>
<%@ Import Namespace="Kesion.Publics" %>
<asp:Content ID="Content1" ContentPlaceHolderID="KSContent" Runat="Server">
    <asp:Panel ID="listPanel" runat="server" Width="100%">
      <div id="manage_top">
        
       &nbsp;&nbsp;<a href="KS.ShopBrand.aspx"><strong>返 回</strong></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;管理品牌[<span style="color:Red"><asp:Label ID="LabBrandName"
           runat="server" Text="Label"></asp:Label></span>]下的商品        
      </div>     

    <div>
        <KS:KSGV ID="ProListView" runat="server" AutoGenerateColumns="False" DataKeyNames="FieldID" GridLines="None"
            OnRowDataBound="FieldListView_RowDataBound" PagerType="CustomNumeric" Width="99%" EnableTheming="True" OnRowCommand="FieldListView_RowCommand" HorizontalAlign="Center" EmptyDataText="对不起,该品牌下还没有添加任何商品!">
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
                   <%#Eval("Title") %>
                </itemtemplate>
              </asp:TemplateField>
              <asp:TemplateField HeaderText="参考价">
                <itemstyle horizontalalign="Center" width="150px" />
                <itemtemplate>
                   <asp:TextBox runat="server" CssClass="textbox" id="TxtBrandNamePrice" width="50px" style="text-align:center" Text='<%#Utils.StrToFloat(Eval("Price")).ToString("F2") %>'></asp:TextBox>
                </itemtemplate>
              </asp:TemplateField>
              <asp:TemplateField HeaderText="会员价">
                <itemstyle horizontalalign="Center" width="150px" />
                <itemtemplate>
                   <asp:TextBox runat="server" CssClass="textbox" id="TxtBrandNameAmount" width="50px" style="text-align:center" Text='<%#Utils.StrToFloat(Eval("Price_Member")).ToString("F2") %>'></asp:TextBox>
                </itemtemplate>
              </asp:TemplateField>

              <asp:TemplateField HeaderText="编辑">
              <itemstyle width="30px" horizontalalign="Center"/>
              <itemtemplate>
                     <a class="edit" title="编辑" href='KS.Shop.aspx?Action=Edit&Channelid=<%#Eval("ChannelID") %>&ID=<%#Eval("InfoID") %>'>修改</a>
              </itemtemplate>
            </asp:TemplateField>
             
            <asp:TemplateField HeaderText="删除">
                <itemstyle horizontalalign="Center" width="30px"/>
               <itemtemplate>
                     <asp:LinkButton ToolTip="移除" CssClass="delete" runat="server" id="delete" commandargument=<%#Eval("InfoID") %> commandname="del"></asp:LinkButton>
               </itemtemplate>
            </asp:TemplateField>

              
            </Columns>
            <HeaderStyle CssClass="CTitle" />
            <EmptyDataRowStyle CssClass="emptycss" />
        </KS:KSGV>
        <br />
        <asp:Panel ID="Panel1" runat="server" Height="30px" Width="739px">
           &nbsp;
                    <input type="button" class="button" value="添加商品" class="button" onclick='parent.openWin("添加商品至品牌[<%=BrandName %>]","Shop/KS.ShopAddToOrder.aspx?action=addtobrand&id=<%=brandId %>",true,700,380);' />

            <input type="button" value="批量移除商品" onmouseover="this.className='button_on';" onmouseout="this.className='button';" class="button" onclick="if (GetIDS('del')){this.form.action='?brandId=<%=brandId %>&action=del';this.form.submit()}" />
           <asp:Button ID="BatchSetButton" Text="批量保存设置" runat="server" CssClass="button" OnClick="BatchSetButton_Click" />
         </asp:Panel>
        </div>
        
         <KS:Page ID="Page1" runat="server" />
        
          <br />
        <script type="text/javascript">
		showtips('<img src="../../admin/images/dot.gif"> <span><strong>说明：</strong><br /></span>您可以在这里批添加商品,还可以将商品从该品牌中移除!');
		</script>
     </asp:Panel>
    
    

  </asp:Content>