<%@ Page Language="C#" MasterPageFile="~/User/User.master" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.User_MyInvoice" Title="Untitled Page" Codebehind="MyInvoice.aspx.cs" %>
<%@ Import Namespace="Kesion.Cache" %>
<%@ Import Namespace="Kesion.Publics" %>
<asp:Content ID="Content1" ContentPlaceHolderID="KSContent" Runat="Server">
     <script>
         function addInvoice(){
             top.openWin('������Ʊ��Ϣ', 'shop/MyInvoiceAdd.aspx?acion=add', true,860,500);
         }
         function modifyInvoice(id){
             top.openWin('�޸ķ�Ʊ��Ϣ', 'shop/MyInvoiceAdd.aspx?action=modify&id='+id, true,860,500);
         }
    </script>
	
     <input type="button" class="bigbutton" onclick="addInvoice();" value="������Ʊ��Ϣ" />
    <span class="tips">
    ���Ѵ���<span class="red"><%=num %></span> ����Ʊ��Ϣ�����ɴ���<span class="red">20</span>����</span>
       
    <asp:Repeater ID="Repeater1" runat="server">
    <HeaderTemplate>
         <table id="tablist" width="98%" border="0" align="center" cellpadding="2" cellspacing="1" class="border">
      <tr  class="title">
        	<td width="50">���</td>
        	<td>��Ʊ��Ϣ</td>
        	<td width="100">�������</td>
        </tr>
    </HeaderTemplate>
    <ItemTemplate>
       <tr class="tdbg">
          <td class="splittd" align="center">
          <%# Container.ItemIndex + 1%>��
          </td>
          <td class="splittd">
              <%# Convert.ToInt16(Eval("InvoiceType"))==1?"��ֵ˰��Ʊ":"��ͨ��Ʊ��ֽ�ʣ�" %>
              <%# (Convert.ToInt16(Eval("TitleType"))==1|| Convert.ToInt16(Eval("InvoiceType"))==1)?"��λ "+Eval("CompanyName"):"����" %>
          </td>
          <td class="splittd">
             <input type="button" class="button" value="�޸�" onclick="modifyInvoice(<%# Eval("invoiceid") %>);"/>
           <input type="button" class="button" value="ɾ��" onclick="$.dialog.confirm('ȷ��ɾ���÷�Ʊ��Ϣ��',function(){location.href='?action=del&id=<%# Eval("invoiceid") %>        ';},function(){});"/>

          </td>
      </tr>      
   
    </ItemTemplate>
     <FooterTemplate>
      <tr class="tdbg" style="display:<%# bool.Parse((Repeater1.Items.Count==0).ToString())?"":"none"%>">
                <td class="splittd" style="text-align:center" colspan="2" >
                  ��û����ӷ�Ʊ��Ϣ��
                </td>
           </tr> 
    </table>
     </FooterTemplate>
    </asp:Repeater>
    <br />
   






</asp:Content>

