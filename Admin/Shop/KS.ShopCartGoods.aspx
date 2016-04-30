<%@ Page Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.Admin.Shop.Admin_ShopCartGoods" Title="���ﳵ��¼" Codebehind="KS.ShopCartGoods.aspx.cs" %>
<%@ Import Namespace="Kesion.Cache" %>
<asp:Content ID="Content1" ContentPlaceHolderID="KSContent" Runat="Server">
    <asp:Panel ID="listPanel" runat="server" Width="100%">
<div id="manage_top" class="menu_top_fixed">&nbsp;<strong>���ټ�����</strong>
<a href="KS.ShopCartGoods.aspx">���м�¼</a> | <a href="KS.ShopCartGoods.aspx?logType=1">24Сʱ�ڼ�¼</a> | <a href="KS.ShopCartGoods.aspx?logType=2">3���ڼ�¼</a> | <a href="KS.ShopCartGoods.aspx?logType=3">10���ڼ�¼</a> | <a href="KS.ShopCartGoods.aspx?logType=4">һ�����ڼ�¼</a> | <a href="KS.ShopCartGoods.aspx?logType=5">�������ڼ�¼</a>
</div> 
<div class="menu_top_fixed_height"></div>
    <div>
        <KS:KSGV ID="CartListView" cssclass="CTable" runat="server" AutoGenerateColumns="False" DataKeyNames="FieldID" GridLines="None"
            OnRowDataBound="FieldListView_RowDataBound" PagerType="CustomNumeric" Width="99%" EnableTheming="True" EmptyDataText="���ﳵ���Ҳ����κε���Ʒ��¼!">
            <Columns>
              <asp:TemplateField HeaderText="ѡ��">
                <itemstyle horizontalalign="Center" width="50px" />
                <itemtemplate>
                    <input type="checkbox"  name="ids" id="ids" value="<%#Eval("CartID") %>" />
                </itemtemplate>
              </asp:TemplateField>
            
                 <asp:TemplateField HeaderText="��Ʒ����">
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
               
                <asp:BoundField DataField="Num" DataFormatString="{0} ��" HeaderText="�û�������">
                  <itemstyle horizontalalign="Center" width="80px" />
                </asp:BoundField>
                <asp:BoundField DataField="AddDate" HeaderText="�µ�ʱ��">
                  <itemstyle horizontalalign="Center" width="130px" />
                </asp:BoundField>
                
                <asp:BoundField DataField="UserName" HeaderText="�û���">
                <itemstyle horizontalalign="Center" width="50px" />
                </asp:BoundField>
                <asp:BoundField DataField="IsAnonymous" HeaderText="�Ƿ��ο��µ�">
                <itemstyle width="80px" horizontalalign="Center" />
                </asp:BoundField>
                
        
            </Columns>
            <HeaderStyle CssClass="CTitle" />
            <EmptyDataRowStyle CssClass="emptycss" />
        </KS:KSGV>
        <br />
         <asp:Panel ID="Panel1" runat="server" Height="30px" Width="739px">
         &nbsp;&nbsp;&nbsp;&nbsp;<input type="checkbox" name="chkall" id="chkall" onclick="CheckAll(this.form);"/><label for="chkall">ȫ��ѡ��</label>
           &nbsp; <input type="button" value="����ɾ��ѡ�еļ�¼" onmouseover="this.className='button_on';" onmouseout="this.className='button';" class="button" onclick="if (GetIDS('del')){this.form.action='?action=del';this.form.submit()}" />
             <asp:Button ID="BtnDelAll" runat="server" Text="һ�����" CssClass="button" OnClientClick="return(confirm('�˲��������棬ȷ�ϲ�����'));" OnClick="BtnDelAll_Click" />
           <br />
          </asp:Panel>
        </div>
        
         <KS:Page ID="Page1" runat="server" />
         <br />
        <script type="text/javascript">
		showtips('<span class="state"><strong>˵����</strong><br /></span>ͨ����ҳ���������˽�����Щ�ͻ���������Щ��Ʒ����Ȥ!');
		</script>
		

     </asp:Panel>

  </asp:Content>