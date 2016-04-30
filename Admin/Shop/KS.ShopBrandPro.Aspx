<%@ Page Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.Admin.Shop.Admin_ShopBrandPro" Title="Ʒ���µ���Ʒ����" Codebehind="KS.ShopBrandPro.Aspx.cs" %>
<%@ Import Namespace="Kesion.Cache" %>
<%@ Import Namespace="Kesion.Publics" %>
<asp:Content ID="Content1" ContentPlaceHolderID="KSContent" Runat="Server">
    <asp:Panel ID="listPanel" runat="server" Width="100%">
      <div id="manage_top">
        
       &nbsp;&nbsp;<a href="KS.ShopBrand.aspx"><strong>�� ��</strong></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;����Ʒ��[<span style="color:Red"><asp:Label ID="LabBrandName"
           runat="server" Text="Label"></asp:Label></span>]�µ���Ʒ        
      </div>     

    <div>
        <KS:KSGV ID="ProListView" runat="server" AutoGenerateColumns="False" DataKeyNames="FieldID" GridLines="None"
            OnRowDataBound="FieldListView_RowDataBound" PagerType="CustomNumeric" Width="99%" EnableTheming="True" OnRowCommand="FieldListView_RowCommand" HorizontalAlign="Center" EmptyDataText="�Բ���,��Ʒ���»�û�������κ���Ʒ!">
            <Columns>
              <asp:TemplateField HeaderText="ѡ��">
                <itemstyle horizontalalign="Center" width="50px" />
                <itemtemplate>
                    <input type="checkbox"  name="ids" id="ids" value="<%#Eval("InfoID") %>" />
                </itemtemplate>
              </asp:TemplateField>

              <asp:TemplateField HeaderText="��ƷСͼ">
                <itemstyle horizontalalign="Center" width="80px" />
                <itemtemplate>
                    <img alt='<%#Eval("Title") %>' src='<%# string.IsNullOrEmpty(Convert.ToString(Eval("defaultPic")))?MyCache.GetCacheShopConfig(9):Eval("DefaultPic") %>' width="40" height="40" />
                </itemtemplate>
              </asp:TemplateField>
              <asp:TemplateField HeaderText="��Ʒ����">
                <itemtemplate>
                   <asp:HiddenField id="HidInfoId" value='<%#Eval("InfoID") %>' runat="server"></asp:HiddenField>
                   <%#Eval("Title") %>
                </itemtemplate>
              </asp:TemplateField>
              <asp:TemplateField HeaderText="�ο���">
                <itemstyle horizontalalign="Center" width="150px" />
                <itemtemplate>
                   <asp:TextBox runat="server" CssClass="textbox" id="TxtBrandNamePrice" width="50px" style="text-align:center" Text='<%#Utils.StrToFloat(Eval("Price")).ToString("F2") %>'></asp:TextBox>
                </itemtemplate>
              </asp:TemplateField>
              <asp:TemplateField HeaderText="��Ա��">
                <itemstyle horizontalalign="Center" width="150px" />
                <itemtemplate>
                   <asp:TextBox runat="server" CssClass="textbox" id="TxtBrandNameAmount" width="50px" style="text-align:center" Text='<%#Utils.StrToFloat(Eval("Price_Member")).ToString("F2") %>'></asp:TextBox>
                </itemtemplate>
              </asp:TemplateField>

              <asp:TemplateField HeaderText="�༭">
              <itemstyle width="30px" horizontalalign="Center"/>
              <itemtemplate>
                     <a class="edit" title="�༭" href='KS.Shop.aspx?Action=Edit&Channelid=<%#Eval("ChannelID") %>&ID=<%#Eval("InfoID") %>'>�޸�</a>
              </itemtemplate>
            </asp:TemplateField>
             
            <asp:TemplateField HeaderText="ɾ��">
                <itemstyle horizontalalign="Center" width="30px"/>
               <itemtemplate>
                     <asp:LinkButton ToolTip="�Ƴ�" CssClass="delete" runat="server" id="delete" commandargument=<%#Eval("InfoID") %> commandname="del"></asp:LinkButton>
               </itemtemplate>
            </asp:TemplateField>

              
            </Columns>
            <HeaderStyle CssClass="CTitle" />
            <EmptyDataRowStyle CssClass="emptycss" />
        </KS:KSGV>
        <br />
        <asp:Panel ID="Panel1" runat="server" Height="30px" Width="739px">
           &nbsp;
                    <input type="button" class="button" value="������Ʒ" class="button" onclick='parent.openWin("������Ʒ��Ʒ��[<%=BrandName %>]","Shop/KS.ShopAddToOrder.aspx?action=addtobrand&id=<%=brandId %>",true,700,380);' />

            <input type="button" value="�����Ƴ���Ʒ" onmouseover="this.className='button_on';" onmouseout="this.className='button';" class="button" onclick="if (GetIDS('del')){this.form.action='?brandId=<%=brandId %>&action=del';this.form.submit()}" />
           <asp:Button ID="BatchSetButton" Text="������������" runat="server" CssClass="button" OnClick="BatchSetButton_Click" />
         </asp:Panel>
        </div>
        
         <KS:Page ID="Page1" runat="server" />
        
          <br />
        <script type="text/javascript">
		showtips('<img src="../../admin/images/dot.gif"> <span><strong>˵����</strong><br /></span>��������������������Ʒ,�����Խ���Ʒ�Ӹ�Ʒ�����Ƴ�!');
		</script>
     </asp:Panel>
    
    

  </asp:Content>