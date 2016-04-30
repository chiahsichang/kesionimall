<%@ Page Language="C#" MasterPageFile="User.master" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.User_PayOnline3G" Title="在线支付" Codebehind="PayOnline.aspx.cs" %>
<%@ Import Namespace="Kesion.Cache" %>
<%@ Import Namespace="Kesion.Publics" %>
<asp:Content ID="Content1" ContentPlaceHolderID="KSContent" Runat="Server">

<asp:Panel ID="PnlStep1" runat="server" Width="100%">
 <table  cellspacing="1" cellpadding="3" class="border" width="100%" align="center" style="padding-right:12px;" border="0">
	 <tr class="title">
         <td><strong>预存款充值</strong></td>
     </tr>
     <tr class="tdbg">
         <td style="height:50px;color:#999" class="splittd">
              您好,<%=__info.UserName %>!
              <br />
             可用预存款 <font color=red><%=__info.Money.ToString("f2") %></font> 元，
            </td>
     </tr>
     <tr class="tdbg">
         <td class="splittd" style="height:50px">
             &nbsp; 本次充值：<input type="text" class="textbox" name="money" style="text-align:center;width:50px"  value="100"/>
           元
           <br />
            <asp:Button ID="BtnNext" runat="server" CssClass="button" Text="下 一 步" OnClientClick="this.form.target='_parent';" OnClick="BtnNext_Click" />
         
         </td>
     </tr>


    </table>
    
    <style>
.border .unpay{color:red;}
.border .success{color:green;}
.border .wait{color:blue;}
</style>
    <asp:Repeater ID="Repeater1" runat="server">
    <HeaderTemplate>
         <table id="tablist" width="100%" style="padding-right:12px;" border="0" align="center" cellpadding="2" cellspacing="1" class="border">
      <tr class="title">
        	<td><strong>历史充值记录</strong></td>
        </tr>

    </HeaderTemplate>
    <ItemTemplate>
      <tr class="tdbg">
          <td class="splittd">
          <%# Container.ItemIndex + 1 + (CurrPage - 1) * PageSize%>、充值单号：<%# Eval("orderid") %><br />充值时间：<%# Utils.FormatHumanizedTime(Convert.ToDateTime(Eval("AddDate")))%><br />充值金额：￥<%# Math.Round(Convert.ToDecimal(Eval("paymoney")),2)%>元
          <br />实收金额：￥<span style="font-size:16px;font-weight:bold;color:#ff6600"><%# Math.Round(Convert.ToDecimal(Eval("realmoney")),2)%></span>元
          <br />充值状态：<%# Kesion.NET.WebSite.User_PayOnline_1.GetPayStatus(Convert.ToInt32(Eval("status")))%>
          <br />支付平台： <%# Eval("platname") %>
          <br />

          <%# Eval("status").ToString() == "0" ? @"<input type='button' class='button' onclick=""if (confirm('确定删除吗？')){location.href='?action=del&id=" + Eval("id")+@"';}"" value='删除'/> <input type='button' class='button' onclick=""window.open('../user/PayConfirm.aspx?from=recharge&platid="+Eval("platid")+"&orderid=" + Eval("orderid") + @"');"" value='支付'/>" : "---"%>
          
          </td>

      </tr>  

     </ItemTemplate>
     <FooterTemplate>
         <tr class="tdbg" style="display:<%# bool.Parse((Repeater1.Items.Count==0).ToString())?"":"none"%>">
               <td class="empty">
                  没有充值记录！
                </td>
           </tr> 
      </table>
     </FooterTemplate>
    </asp:Repeater>
    
   <br />
    
    <asp:Label ID="LabPageStr" runat="server"></asp:Label>
     <div style="height:75px"></div>

</asp:Panel>

<asp:Panel ID="PnlStep2" runat="server" Visible="false" Width="100%">
 
   <asp:PlaceHolder ID="PlaceHolder1" runat="server"></asp:PlaceHolder>
   <div style="height:75px"></div>

</asp:Panel>



</asp:Content>

