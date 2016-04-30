<%@ Page Language="C#" MasterPageFile="~/Admin/MasterPage.master" EnableEventValidation="false"  AutoEventWireup="true" Inherits="Kesion.NET.WebSite.Admin.Shop.Admin_ShopJingJiaRecord" Title="������Ʒ����" Codebehind="KS.ShopJingJiaRecord.aspx.cs" %>
<%@ Import Namespace="Kesion.Publics"%>
<%@ Import Namespace="Kesion.APPCode"%>
<%@ Import Namespace="Kesion.Cache"%>
<asp:Content ID="Content1" ContentPlaceHolderID="KSContent" Runat="Server">
  
   <asp:Panel ID="PanelRecord" runat="server" Visible="true">
        <KS:TopNav ID="TopNav1" runat="server" Text="�鿴���ۼ�¼" />
       <script>
           function ShowAddress(id) {
               parent.openWin("�鿴�ͻ���Ϣ", "Shop/KS.ShopJingJiaRecord.Aspx?askID=" + id + "&Action=ShowAddress", true);
           }

       </script>
  <KS:KSGV ID="JingJiaRecord" runat="server" cssclass="CTable" AutoGenerateColumns="False" Width="99%" 
             EmptyDataText="û���ҵ��κξ��ۼ�¼!" GridLines="None" OnRowDataBound="JingJiaRecord_RowDataBound"
             AllowPaging="false">
          <Columns>
              <asp:TemplateField HeaderText="ID">
                <itemstyle horizontalalign="Center" width="40px" />
                <itemtemplate>
                   <%# (currPage-1)*pagesize+Container.DataItemIndex+1%>
                </itemtemplate>
              </asp:TemplateField>
               
             <asp:TemplateField HeaderText="������">
             <itemstyle VerticalAlign="Top" />
             <itemtemplate><%# Eval("username") %>  </itemtemplate>
             </asp:TemplateField> 
             <asp:TemplateField HeaderText="����IP">
             <itemstyle VerticalAlign="Top" />
             <itemtemplate><%# Eval("UserIP") %>  </itemtemplate>
             </asp:TemplateField> 
             <asp:TemplateField HeaderText="����ʱ��">
             <itemstyle horizontalalign="Center" />
             <itemtemplate>
                 <%# Eval("AddDate") %>
             </itemtemplate>
             </asp:TemplateField>            
               <asp:TemplateField HeaderText="����(Ԫ)">
             <itemstyle horizontalalign="Center" />
             <itemtemplate>
                 <%# Kesion.APPCode.Public.ReturnShopPrice(Convert.ToDecimal(Eval("Money"))) %>
             </itemtemplate>
             </asp:TemplateField>
             <asp:TemplateField HeaderText="״̬">
             <itemstyle horizontalalign="Center" />
             <itemtemplate>
                <%# (currPage-1)*pagesize+Container.DataItemIndex+1<=num?"<font color=green>�ñ�</font>":"<span class='tips'>���</span>" %>
             </itemtemplate>
             </asp:TemplateField>
             <asp:TemplateField HeaderText="�ͻ�ȷ��">
             <itemstyle horizontalalign="Center" />
             <itemtemplate>
                <%# Convert.ToString(Eval("status"))=="1"?"<font color=green>��ȷ��</font>":(Convert.ToString(Eval("status"))=="2"?"<span class='tips'>�ܾ�����</span>":(Convert.ToString(Eval("iszb"))=="1"?"<span style='color:red'>δȷ��</span>":"-")) %>
             </itemtemplate>
             </asp:TemplateField>
              <asp:TemplateField HeaderText="�ʼ���Ϣ">
             <itemstyle horizontalalign="Center" />
             <itemtemplate>
                 <a href="javascript:;" <%# Convert.ToString(Eval("status"))!="1"?" style='display:none'":string.Empty %> onclick="ShowAddress(<%# Eval("ID") %>)">�鿴</a>
             </itemtemplate>
             </asp:TemplateField>
          </Columns>
            <HeaderStyle CssClass="CTitle" />
            <EmptyDataRowStyle CssClass="emptycss" />
      </KS:KSGV>

    
    <KS:Page ID="Page1" runat="server" />

           <div class="message">
    
   <strong>���������ߣ�</strong> <asp:TextBox runat="server" ID="TxtKeyWord" CssClass="textbox" /> 

    <asp:Button ID="BtnSearch" runat="server" CssClass="button" Text="��ʼ����" 
            onclick="BtnSearch_Click"  />
        </div>

   </asp:Panel>



    <asp:Panel ID="PanelShow" runat="server" Width="100%" Visible="false">
         <KS:TopNav ID="TopNav2" runat="server" Text="�鿴�ͻ���Ϣ" />
        <table width="99%" align="center" border="0" cellpadding="1" cellspacing="1" class="CTable"> 
          <tr>
            <td class="lefttd" height="30" align="right" style="width: 109px"><strong>�ջ��ˣ�</strong></td>
            <td class="righttd">
                &nbsp;<%=dr["RealName"].ToString() %>
            </td>
          </tr>
          <tr>
            <td class="lefttd" height="30" align="right" style="width: 109px"><strong>�ջ���ַ��</strong></td>
            <td class="righttd">
                &nbsp;<%=dr["Address"].ToString() %>
            </td>
          </tr>
          <tr>
            <td class="lefttd" height="30" align="right" style="width: 109px"><strong>�ջ��绰��</strong></td>
            <td class="righttd">
                 &nbsp;<%=dr["Mobile"].ToString() %>
            </td>
          </tr>
          <tr>
            <td class="lefttd" height="30" align="right" style="width: 109px"><strong>�ջ��ʱࣺ</strong></td>
            <td class="righttd">
                &nbsp;<%=dr["zipcode"].ToString() %>
            </td>
          </tr>
        </table>
        <br />
        <br />

    </asp:Panel>

    
</asp:Content>

