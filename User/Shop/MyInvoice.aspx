<%@ Page Language="C#" MasterPageFile="~/User/User.master" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.User_MyInvoice" Title="Untitled Page" Codebehind="MyInvoice.aspx.cs" %>
<%@ Import Namespace="Kesion.Cache" %>
<%@ Import Namespace="Kesion.Publics" %>
<asp:Content ID="Content1" ContentPlaceHolderID="KSContent" Runat="Server">
     <script>
         function addInvoice(){
             top.openWin('新增发票信息', 'shop/MyInvoiceAdd.aspx?acion=add', true,860,500);
         }
         function modifyInvoice(id){
             top.openWin('修改发票信息', 'shop/MyInvoiceAdd.aspx?action=modify&id='+id, true,860,500);
         }
    </script>
	
     <input type="button" class="bigbutton" onclick="addInvoice();" value="新增发票信息" />
    <span class="tips">
    您已创建<span class="red"><%=num %></span> 个发票信息，最多可创建<span class="red">20</span>个。</span>
       
    <asp:Repeater ID="Repeater1" runat="server">
    <HeaderTemplate>
         <table id="tablist" width="98%" border="0" align="center" cellpadding="2" cellspacing="1" class="border">
      <tr  class="title">
        	<td width="50">序号</td>
        	<td>发票信息</td>
        	<td width="100">管理操作</td>
        </tr>
    </HeaderTemplate>
    <ItemTemplate>
       <tr class="tdbg">
          <td class="splittd" align="center">
          <%# Container.ItemIndex + 1%>、
          </td>
          <td class="splittd">
              <%# Convert.ToInt16(Eval("InvoiceType"))==1?"增值税发票":"普通发票（纸质）" %>
              <%# (Convert.ToInt16(Eval("TitleType"))==1|| Convert.ToInt16(Eval("InvoiceType"))==1)?"单位 "+Eval("CompanyName"):"个人" %>
          </td>
          <td class="splittd">
             <input type="button" class="button" value="修改" onclick="modifyInvoice(<%# Eval("invoiceid") %>);"/>
           <input type="button" class="button" value="删除" onclick="$.dialog.confirm('确定删除该发票信息吗？',function(){location.href='?action=del&id=<%# Eval("invoiceid") %>        ';},function(){});"/>

          </td>
      </tr>      
   
    </ItemTemplate>
     <FooterTemplate>
      <tr class="tdbg" style="display:<%# bool.Parse((Repeater1.Items.Count==0).ToString())?"":"none"%>">
                <td class="splittd" style="text-align:center" colspan="2" >
                  还没有添加发票信息！
                </td>
           </tr> 
    </table>
     </FooterTemplate>
    </asp:Repeater>
    <br />
   






</asp:Content>

