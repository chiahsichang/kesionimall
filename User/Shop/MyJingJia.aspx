<%@ Page Language="C#" MasterPageFile="~/User/User.master" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.MyJingJia" Title="Untitled Page" Codebehind="MyJingJia.aspx.cs" %>
<%@ Import Namespace="Kesion.Cache" %>
<%@ Import Namespace="Kesion.Publics" %>
<asp:Content ID="Content1" ContentPlaceHolderID="KSContent" Runat="Server">

<asp:Panel ID="PanList" runat="server">
    <div class="toptips">
     �����룺<asp:Label ID="Lab_Total_Info" runat="server" Text=""></asp:Label> ����Ʒ�ľ���
   </div>
    <asp:Repeater ID="Repeater1" runat="server">
    <HeaderTemplate>
         <table id="tablist" width="98%" border="0" align="center" cellpadding="2" cellspacing="1" class="border">
      <tr align="center" class="title">
        	<td>��Ʒ����</td>
        	<td>���ļ�</td>
        	<td>����״̬</td>
        	<td>���۴���</td>
        	<td>�ҵĳ���</td>
        	<td>��������</td>
        	<td>�ñ����</td>
        	<td>����</td>
        </tr>
    </HeaderTemplate>
    <ItemTemplate>
      <tr class="tdbg">
          <td class="splittd"><%# (CurrPage-1)*PageSize+Container.ItemIndex+1%>��<%# Eval("title") %></td>
          <td class="splittd" style="text-align:center"><%# Kesion.APPCode.Public.ReturnShopPrice(Convert.ToDecimal(Eval("Money"))) %></td>
          <td class="splittd" style="text-align:center"><%# Convert.ToString(Eval("isend")).Equals("1")?"<span style='color:#999'>�ѽ���</span>":"<span style='color:green'>����</span>" %></td>
          <td class="splittd" style="text-align:center">
              <a title="�鿴����"��style="text-decoration:underline" href="MyJingJiaRecord.aspx?infoid=<%# Eval("infoid") %>"><%# Eval("Times") %>��</a>
          </td>
          <td class="splittd" style="text-align:center"><%# Kesion.APPCode.Public.ReturnShopPrice(Convert.ToDecimal(GetMyJingJiaInfo(Convert.ToInt32(Eval("InfoID")),"money"))) %></td>
          <td class="splittd" style="text-align:center"><%#GetMyJingJiaInfo(Convert.ToInt32(Eval("InfoID")),"adddate") %></td>
          <td class="splittd" style="text-align:center">
          <%# GetMyJingJiaQK(Convert.ToInt32(Eval("InfoID")), Convert.ToInt32(GetMyJingJiaInfo(Convert.ToInt32(Eval("InfoID")),"id")),Convert.ToInt32(Eval("num")),Convert.ToInt32(Eval("isend"))) %>
          
          </td>
          <td class="splittd" style="text-align:center">
               <a title="�鿴����"<%# GetMyJingJiaInfo(Convert.ToInt32(Eval("InfoID")),"iszb")=="1"?"":" style='display:none' " %> href="MyJingJiaRecord.aspx?action=confirm&infoid=<%# Eval("infoid") %>&askid=<%# GetMyJingJiaInfo(Convert.ToInt32(Eval("InfoID")),"id") %>">����ȷ��</a>

          </td>
      </tr>  

     </ItemTemplate>
     <FooterTemplate>
         <tr class="tdbg" style="display:<%# bool.Parse((Repeater1.Items.Count==0).ToString())?"":"none"%>">
                <td class="splittd" style="text-align:center" colspan="10">
                 ��û�в����κε���Ʒ���ۣ�
                </td>
           </tr> 
      </table>
     </FooterTemplate>
    </asp:Repeater>
    
   <br />
    
     <KS:Page ID="Page1" runat="server" />
     
   <br />
   
   
  
</asp:Panel>


</asp:Content>