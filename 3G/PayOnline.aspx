<%@ Page Language="C#" MasterPageFile="User.master" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.User_PayOnline3G" Title="����֧��" Codebehind="PayOnline.aspx.cs" %>
<%@ Import Namespace="Kesion.Cache" %>
<%@ Import Namespace="Kesion.Publics" %>
<asp:Content ID="Content1" ContentPlaceHolderID="KSContent" Runat="Server">

<asp:Panel ID="PnlStep1" runat="server" Width="100%">
 <table  cellspacing="1" cellpadding="3" class="border" width="100%" align="center" style="padding-right:12px;" border="0">
	 <tr class="title">
         <td><strong>Ԥ����ֵ</strong></td>
     </tr>
     <tr class="tdbg">
         <td style="height:50px;color:#999" class="splittd">
              ����,<%=__info.UserName %>!
              <br />
             ����Ԥ��� <font color=red><%=__info.Money.ToString("f2") %></font> Ԫ��
            </td>
     </tr>
     <tr class="tdbg">
         <td class="splittd" style="height:50px">
             &nbsp; ���γ�ֵ��<input type="text" class="textbox" name="money" style="text-align:center;width:50px"  value="100"/>
           Ԫ
           <br />
            <asp:Button ID="BtnNext" runat="server" CssClass="button" Text="�� һ ��" OnClientClick="this.form.target='_parent';" OnClick="BtnNext_Click" />
         
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
        	<td><strong>��ʷ��ֵ��¼</strong></td>
        </tr>

    </HeaderTemplate>
    <ItemTemplate>
      <tr class="tdbg">
          <td class="splittd">
          <%# Container.ItemIndex + 1 + (CurrPage - 1) * PageSize%>����ֵ���ţ�<%# Eval("orderid") %><br />��ֵʱ�䣺<%# Utils.FormatHumanizedTime(Convert.ToDateTime(Eval("AddDate")))%><br />��ֵ����<%# Math.Round(Convert.ToDecimal(Eval("paymoney")),2)%>Ԫ
          <br />ʵ�ս���<span style="font-size:16px;font-weight:bold;color:#ff6600"><%# Math.Round(Convert.ToDecimal(Eval("realmoney")),2)%></span>Ԫ
          <br />��ֵ״̬��<%# Kesion.NET.WebSite.User_PayOnline_1.GetPayStatus(Convert.ToInt32(Eval("status")))%>
          <br />֧��ƽ̨�� <%# Eval("platname") %>
          <br />

          <%# Eval("status").ToString() == "0" ? @"<input type='button' class='button' onclick=""if (confirm('ȷ��ɾ����')){location.href='?action=del&id=" + Eval("id")+@"';}"" value='ɾ��'/> <input type='button' class='button' onclick=""window.open('../user/PayConfirm.aspx?from=recharge&platid="+Eval("platid")+"&orderid=" + Eval("orderid") + @"');"" value='֧��'/>" : "---"%>
          
          </td>

      </tr>  

     </ItemTemplate>
     <FooterTemplate>
         <tr class="tdbg" style="display:<%# bool.Parse((Repeater1.Items.Count==0).ToString())?"":"none"%>">
               <td class="empty">
                  û�г�ֵ��¼��
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

