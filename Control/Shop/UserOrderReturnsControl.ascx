<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="UserOrderReturnsControl.ascx.cs" Inherits="Kesion.NET.WebSite.Shop.UserOrderReturnsControl" %>
<%@ Import Namespace="Kesion.Publics" %>
<%@ Import Namespace="Kesion.Cache" %>
<%@ Import Namespace="Kesion.Components" %>
<%@ Import Namespace="Kesion.BLL" %>

<table  cellspacing="1" cellpadding="3" class="border" width="98%" align="center" border="0">
	 <tr class="title">
         <td colspan="2"> 退货退款申请</td>
     </tr>
    
     <tr class="tdbg">
       <td  class="lefttd" align="right">订单编号：</td>
       <td><%=dr["orderid"].ToString() %>
       </td>
     </tr>
     <tr class="tdbg">
        <td  class="lefttd" align="right">订单费用：</td>
         <td style="height:30px"> 
          <%=MyCache.GetCurrencySymbol%><%=Utils.StrToFloat(dr["NoUseCouponMoney"].ToString()).ToString("F2")%>  <%=MyCache.GetCurrencyUnit%>
         
          &nbsp;&nbsp;已 付 款：<span style="font-weight:bold;font-size:16px;color:green"><%=MyCache.GetCurrencySymbol%><%=Utils.StrToFloat(dr["MoneyReceipt"].ToString()).ToString("f2") %></span> <%=MyCache.GetCurrencyUnit%>
         </td>
     </tr>
     <tr class="tdbg">
        <td  class="lefttd" align="right">退货退款原因：</td>
         <td> 
         <asp:TextBox ID="TxtReason" TextMode="MultiLine" runat="server" style="width:95%;height:200px;"></asp:TextBox>
                  <%Kesion.APPCode.EditorAPI.EchoHead(); %>
                  <% Kesion.APPCode.EditorAPI.EchoEditor("editor", TxtReason.ClientID, "Basic",0,false,true,true,false);%>

         
         </td>
     </tr>
     <tr class="tdbg">
        <td  class="lefttd" align="right">资金退回方式：</td>
         <td> 
          <asp:RadioButtonList ID="RdbReturnMoneyType" runat="server">
            <asp:ListItem Value="1" Selected>扣除的金额退回我的会员预付款中</asp:ListItem>
            <asp:ListItem Value="2">扣除的金额退回到我的银行帐号</asp:ListItem>
           </asp:RadioButtonList>

         
         </td>
     </tr>
     
     <tbody id="returnbank" style="display:none">
     <tr class="tdbg">
        <td  class="lefttd" align="right">退回的银行名称：</td>
         <td> 
          <asp:TextBox ID="TxtMoneyReturnBankName" MaxLength="100" width="200" runat="server" CssClass="textbox"></asp:TextBox> <span class="tips">如中国工商银行某某分理处。</span>
         </td>
     </tr>
     <tr class="tdbg">
        <td  class="lefttd" align="right">退回的银行卡号：</td>
         <td> 
          <asp:TextBox ID="TxtMoneyReturnBankCard" MaxLength="100" width="200"  runat="server" CssClass="textbox"></asp:TextBox> <span class="tips">请正确填写银行卡号。</span>
         </td>
     </tr>
     <tr class="tdbg">
        <td  class="lefttd" align="right">银行卡号户名：</td>
         <td> 
          <asp:TextBox ID="TxtMoneyReturnCardName" MaxLength="100" width="200" runat="server" CssClass="textbox"></asp:TextBox> <span class="tips">请正确填写银行卡户主。</span>
         </td>
     </tr>
     </tbody>
    

   
     <tr class="tdbg">
         <td></td>
         <td style="height:50px;">
             <asp:Button ID="BtnNext" runat="server" OnClientClick="return(checkform());" CssClass="button" Text="确定申请" OnClick="BtnNext_Click" /></td>
     </tr>
    </table>
    
    <script>
    function checkform() {
        if (editor.hasContents()==false) {
            KesionJS.Alert('请输入退货退款原因！', "editor.focus(); ");
               return false;
           }
           var checkrad = jQuery("#<%=this.RdbReturnMoneyType.ClientID %> :radio[checked]").val();
           if (checkrad == 2) {
               if ($("#<%=this.TxtMoneyReturnBankName.ClientID %>").val() == '') {
                   KesionJS.Alert('请输入银行名称！', "$('#<%=this.TxtMoneyReturnBankName.ClientID %>').focus()");
                   return false;
               }
               if ($("#<%=this.TxtMoneyReturnBankCard.ClientID %>").val() == '') {
                   KesionJS.Alert('请输入银行卡号！', "$('#<%=this.TxtMoneyReturnBankCard.ClientID %>').focus()");
                   return false;
               }
               if ($("#<%=this.TxtMoneyReturnCardName.ClientID %>").val() == '') {
                   KesionJS.Alert('请输入银行卡号户名！', "$('#<%=this.TxtMoneyReturnCardName.ClientID %>').focus()");
                   return false;
               }
           }
     }
     function showbank() {
         var checkrad = jQuery("#<%=this.RdbReturnMoneyType.ClientID %> :radio[checked]").val();
         if (checkrad == 2) {
             $("#returnbank").show();
         } else {
         $("#returnbank").hide();
         }
     }
</script>