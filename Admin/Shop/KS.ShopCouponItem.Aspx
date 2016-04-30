<%@ Page Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.Admin.Shop.Admin_ShopCouponItem" Title="�Ż�ȯ����" Codebehind="KS.ShopCouponItem.Aspx.cs" %>
<%@ Import Namespace="Kesion.Cache" %>
<%@ Import Namespace="Kesion.Publics" %>
<asp:Content ID="Content1" ContentPlaceHolderID="KSContent" Runat="Server">
    <asp:Panel ID="listPanel" runat="server" Width="100%">
      <div id="manage_top">
        
       &nbsp;&nbsp;<a href="KS.ShopLimitBuy.aspx"><strong>�� ��</strong></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;�鿴[<span style="color:Red"><asp:Label ID="LabCouponName"
           runat="server" Text="Label"></asp:Label></span>]�µ��Ż�ȯ�б�        
      </div>     
          <div class="menu_top_fixed_height"></div>

    <div>
        <KS:KSGV ID="ProListView" runat="server" CssClass="CTable" AutoGenerateColumns="False" DataKeyNames="FieldID" GridLines="None"
            OnRowDataBound="FieldListView_RowDataBound" PagerType="CustomNumeric" Width="99%" EnableTheming="True" OnRowCommand="FieldListView_RowCommand" HorizontalAlign="Center" EmptyDataText="û���Ż�ȯ!">
            <Columns>
              <asp:TemplateField HeaderText="ѡ��">
                <itemstyle horizontalalign="Center" width="50px" />
                <itemtemplate>
                    <input type="checkbox"  name="ids" id="ids" value="<%#Eval("CouponUserID") %>" />
                </itemtemplate>
              </asp:TemplateField>

          
              <asp:TemplateField HeaderText="�Ż�ȯ��">
                <itemtemplate>
                   <%#Eval("CouponNum") %>
                </itemtemplate>
              </asp:TemplateField>
             <asp:TemplateField HeaderText="��ֵ">
                <itemstyle horizontalalign="Center" width="70px" />
                <itemtemplate>
                <%=MyCache.GetCurrencySymbol %><%# Kesion.APPCode.Public.ReturnShopPrice(Eval("FaceValue")) %><%=MyCache.GetCurrencyUnit %>
                </itemtemplate>
              </asp:TemplateField>

              <asp:TemplateField HeaderText="���ֿ۶�">
                <itemstyle horizontalalign="Center" width="150px" />
                <itemtemplate>
                <%# GetDiscoutStr(Convert.ToString(Eval("MaxDiscount"))) %>
                </itemtemplate>
              </asp:TemplateField>

                 <asp:TemplateField HeaderText="���ý��">
                <itemstyle horizontalalign="Center" width="70px" />
                <itemtemplate>
                <%=MyCache.GetCurrencySymbol %><%# Kesion.APPCode.Public.ReturnShopPrice(Eval("AvailableMoney")) %><%=MyCache.GetCurrencyUnit %>
                </itemtemplate>
              </asp:TemplateField>

   
              <asp:BoundField DataField="UserName" HeaderText="ʹ����">
                <itemstyle width="70px" horizontalalign="Center" />
                </asp:BoundField>
              
              <asp:TemplateField HeaderText="ʹ�����">
                <itemstyle horizontalalign="Center" width="150px" />
                <itemtemplate>
                <%# GetUseStr(Convert.ToInt16(Convert.ToString(Eval("UseFlag"))),Convert.ToString(Eval("AvailableMoney")),Convert.ToString(Eval("Note"))) %>
                </itemtemplate>
              </asp:TemplateField>

                <asp:TemplateField HeaderText="��������">
                <itemtemplate>
                     <asp:LinkButton runat="server" id="delete" commandargument=<%#Eval("couponuserID") %> commandname="del">ɾ��</asp:LinkButton>
                
               </itemtemplate>
                <itemstyle horizontalalign="Center" width="100px" />
                </asp:TemplateField>
            </Columns>
            <HeaderStyle CssClass="CTitle" />
            <EmptyDataRowStyle CssClass="emptycss" />
        </KS:KSGV>
        <br />
        <asp:Panel ID="Panel1" runat="server" Height="30px" Width="739px">
        
        &nbsp;&nbsp;<input type="checkbox" name="chkall" id="chkall" onclick="CheckAll(this.form);"/><label for="chkall">ȫ��ѡ��</label>
           &nbsp; <input type="button" value="����ɾ���Ż�ȯ" onmouseover="this.className='button_on';" onmouseout="this.className='button';" class="button" onclick="if (GetIDS('del')){this.form.action='?couponid=<%=couponId %>&action=del';this.form.submit()}" />
           
           <input class="button" type="button" value=" �� ӡ " onclick="window.print()">
           
           <input class="button" type="button" value=" �� �� " onclick="location.href='KS.ShopCouponPub.aspx?couponid=<%=couponId %>';">
         </asp:Panel>
        </div>
        
          <KS:Page ID="Page1" runat="server" />
        
        
          <br />
        <script type="text/javascript">
            showtips('<span class="state"><strong>˵����</strong><br /></span>����������������ɾ���Ż�ȯ���Ǵ�ӡ�Ż�ȯ�ȹ�������!');
		</script>
     </asp:Panel>
    
    

  </asp:Content>