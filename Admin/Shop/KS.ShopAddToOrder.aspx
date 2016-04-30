<%@ Page Language="C#" ValidateRequest="false" EnableEventValidation="false" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.Admin_ProductAddToOrder" Title="搜索并将商品加入订单" Codebehind="KS.ShopAddToOrder.aspx.cs" %>
<%@ Import Namespace="Kesion.BLL"%>
<%@ Import Namespace="Kesion.Publics"%>
<asp:Content ID="Content1" ContentPlaceHolderID="KSContent" Runat="Server">
<script type="text/javascript">
 function returnBack(){
  parent.frames["main"].setProvince("2");
 }
 function returnIds(){
  var str='';
  jQuery("#<%=this.LstProId.ClientID %> option:selected").each(function(){
   if (str=='')
   str+=jQuery(this).val()+"|"+jQuery(this).text();
   else
   str+=","+jQuery(this).val()+"|"+jQuery(this).text();
  });
  parent.frames["main"].addOption(str);
 }
</script>
     <div style="text-align:center">
     
     <table border="0" width="100%" height="100%" align="center"  cellpadding="1" cellspacing="1" class="CTable">
     <tr>
      <td class="lefttd" style="line-height:30px;padding:5px;width:300px;text-align:left;padding-left:30px">
       <strong>快速搜索=> </strong><br />
       商品编号：<asp:TextBox  CssClass="textbox" ID="TxtProID" runat="server"></asp:TextBox><br />
       商品名称：<asp:TextBox  CssClass="textbox" ID="TxtTitle" runat="server"></asp:TextBox><br />
       所属分类：<select name="ClassID" id="ClassID">
       <option value="0">---选择分类---</option>
       <%=ClassManage.GetClassByBasicModel(4,"0") %>
       </select>
          <br /><br />
          <asp:Button ID="Button3" runat="server" OnClick="Button3_Click" CssClass="button" Text="开始搜索" /></td>
      <td class="righttd" style="padding-left:5px">
         
         <br /><div style="text-align:left">
         <strong>搜索结果：</strong>
         <asp:ListBox ID="LstProId" Height="257px" Width="324px" SelectionMode="Multiple" runat="server"></asp:ListBox>
           <br />  小提示：多选可按<span style="color:Red">Shife</span>键<br />
         <%if (KSCMS.S("action")=="ids"){%>
         <input type="button" class="button" value="确定选择" onclick="returnIds();"/>
         <%}else{ %>
         <asp:Button ID="Button1" runat="server" CssClass="button" Text="确定选择" OnClick="Button1_Click" />
         <%} %>
         <asp:Button ID="Button2" runat="server" CssClass="button" Text="关闭取消" />
      </div>
      </td>
     </tr>
     
     </table>
        

     </div>
</asp:Content>