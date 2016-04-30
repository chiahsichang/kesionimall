<%@ Page Language="C#" MasterPageFile="~/User/User.master" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.User_MyGroupBuyOrder" Title="�ҵĶ���" Codebehind="MyGroupBuyOrder.aspx.cs" %>
<%@ Import Namespace="Kesion.Publics" %>
<%@ Import Namespace="Kesion.BLL" %>
<%@ Import Namespace="Kesion.Cache" %>
<%@ Import Namespace="Kesion.HtmlTags" %>
<%@ Import Namespace="Kesion.APPCode" %>

<asp:Content ID="Content1" ContentPlaceHolderID="KSContent" Runat="Server">

<asp:Panel ID="ListPannel" runat="server">
<style>
.border .wait,.border .wff,.border .wfk,.border .wxf{color:red;}
.border .yff,.border .yfq,.border .yqs,.border .confirm{color:green;}
    .border .yxf {
   color:#999; }
.border .wx{color:#999;}
.border .jq{color:#888;}
.border .tk{color:Purple}
.border .ddff{color:brown;}
.border .list_link{line-height:22px;border-left:1px solid #efefef;padding:5px;}
.border .img img{border:1px solid #ccc;padding:1px;}
</style>

<div class="tabs">	
			<ul>
				<li<%if (string.IsNullOrEmpty(KSCMS.S("show"))) Response.Write (" class='puton'"); %>><a href="MyGroupBuyOrder.aspx">��һ���µĶ���(<%=DataFactory.GetOnlyValue("select count(1) From KS_ProOrder Where datediff(month,[InputTime],getdate())=0 and UserName='"+(new TemporaryVar()).UserName+"'")  %>)</a></li>
				<li<%if (KSCMS.S("show")=="2") Response.Write (" class='puton'"); %>><a href="MyGroupBuyOrder.aspx?show=2">�������ڵĶ���(<%=DataFactory.GetOnlyValue("select count(1) From KS_ProOrder Where datediff(month,[InputTime],getdate())<=2 and UserName='"+(new TemporaryVar()).UserName+"'")  %>)</a></li>
				<li<%if (KSCMS.S("show")=="-1") Response.Write (" class='puton'"); %>><a href="MyGroupBuyOrder.aspx?show=-1">���еĶ���(<%=DataFactory.GetOnlyValue("select count(1) From KS_ProOrder Where UserName='"+(new TemporaryVar()).UserName+"'")  %>)</a></li>
			</ul>
</div>
<br />

    ����������
    <asp:DropDownList ID="DrpTJ" runat="server">
        <asp:ListItem Value="1">������</asp:ListItem>
        <asp:ListItem Value="2">�ֻ�����</asp:ListItem>
    </asp:DropDownList>
    �ؼ��֣�<asp:TextBox ID="TxtKey" runat="server" CssClass="textbox" />
    <asp:Button Text="��������" runat="server" CssClass="button" OnClick="Unnamed1_Click" />

  <asp:Repeater ID="Repeater1" runat="server"  onitemdatabound="Repeater1_ItemDataBound" >
          <HeaderTemplate>
          <table width="98%" align="center" border="0" cellpadding="1" cellspacing="1" class="border">
              <tr class="title">
               <td height="25" width="40" nowrap><b>���</b></td>
               <td style="width:500px;text-align:left">&nbsp;&nbsp;<b>��Ʒ</b></td>
               <td width="80" align="center"><b>����</b></td>
               <td width="80" align="center"><b>����</b></td>
               <td width="70" align="center"><b>ʵ��</b></td>
               <td width="70" align="center" nowrap><b>״̬</b></td>
               <td width="70" align="center" nowrap><b>����</b></td>
              </tr>
          </HeaderTemplate>
         <ItemTemplate>
         
             <TR class="title1">
				 <td colspan="7" style="padding-top:2px;padding-bottom:2px;padding-left:10px;">
				 <strong>
				<%# Container.ItemIndex + 1 + (CurrPage - 1) * PageSize%>�� ������ţ�<%#Eval("orderid")%>&nbsp;&nbsp;�µ�ʱ�䣺<%# Utils.FormatHumanizedTime(Convert.ToDateTime(Eval("InputTime"))) %></strong><%# Convert.ToInt16(Eval("ordertype")) == 1 ? "<span style='color:Red'>�Ź�</span>":string.Empty%><%# Convert.ToInt32(Eval("changescore")) >0 ? " <span style='color:green'>���ֶһ�</span>" : string.Empty%></td>
			</TR>
			<tr>
			<tr class="tdbg">
              <td class="list_link" align="center" width="25"></td>
			  <td  colspan="3" align="left">
             <asp:Repeater ID="Repeater2" runat="server">
               <ItemTemplate>
               <table width="100%" class="table1" cellpadding="0" cellspacing="0" border="0">
               <tr class="TR_BG_list">
                  <td class="splittd" align="left" style="width:500px">
                    <table border='0' width="100%" cellpadding="0" cellspacing="0">
		               <tr>
			            <td width="60" height="70" align="center" class="img"><img onerror="this.src='<%=MyCache.GetCacheShopConfig(9) %>';" src='<%# Eval("DefaultPic") %>' width='50' height='50' align='left'/></td>
			            <td>
                         <%# GetTitle(Convert.ToString(Eval("title")), Convert.ToString(Eval("fileName")), Convert.ToString(Eval("TurnUrl")), Utils.StrToInt(Eval("channelid")), Utils.StrToInt(Eval("classid")), Utils.StrToInt(Eval("infoid")), Convert.ToString(Eval("attributeCart")), Utils.StrToInt(Eval("attrid")))%>			            
		               </td>
		              </tr>
		             </table>
                  </td>
                  <td class="splittd" style="width:80px;"><%=MyCache.GetCurrencySymbol%><%# Public.ReturnShopPrice(Convert.ToString(Eval("Price"))) %></td>
                  <td class="splittd" style="width:80px;text-align:center"><%#Eval("num") %></td>
                </table> 
               
               </ItemTemplate>
             </asp:Repeater>
             </td>
             <td class="list_link" style="text-align:center" valign="top">
              <%# Utils.StrToInt(Eval("ChangeScore")) > 0 ? ""+Eval("ChangeScore") +"��+": string.Empty%>
              <%=MyCache.GetCurrencySymbol%><%# Public.ReturnShopPrice(Convert.ToString(Eval("OrderTotalPrice")))%></td>
             <td class="list_link" style="text-align:center" nowrap valign="top">
             <%# GetOrderStatus(Convert.ToString(Eval("OrderID")),Utils.StrToInt(Eval("ConsumptionMode")),Utils.StrToInt(Eval("IsBusinessConfirm")),Convert.ToString(Eval("alipaytradestatus")), Utils.StrToInt(Eval("status")), Convert.ToInt16(Eval("DeliverStatus")), Utils.StrToDecimal(Convert.ToString(Eval("MoneyReceipt"))), Utils.StrToDecimal(Convert.ToString(Eval("OrderTotalPrice"))))%>
             </td>
				<td nowrap class="list_link" style="text-align:center" valign="top">
				<a href="ShowMyOrder.aspx?id=<%# Eval("id") %>&from=business" target="_blank">��������</a>
				
				<%# Convert.ToString(Eval("ConsumptionMode")) == "0" ? @"<br/><a href='javascript:;' onclick=""location.href='MyGroupBuyOrder.aspx?id=" + Eval("id") + @"&action=GroupBuyConfirm';"">�鿴/ȷ������</a>" : ""%>
				<%# Convert.ToString(Eval("Status"))!="2" && Convert.ToString(Eval("ConsumptionMode")) == "1" && Convert.ToString(Eval("PayStatus"))=="1" && Convert.ToString(Eval("DeliverStatus")) != "1" ? @"<br/><a href='javascript:;' onclick=""location.href='MyGroupBuyOrder.aspx?id=" + Eval("id") + @"&action=BusinessDelivery';"">����</a>":""%>
                 <%# !string.IsNullOrEmpty(MyCache.GetShopCommonConfig(42)) && Convert.ToString(Eval("ConsumptionMode")) == "1" && Convert.ToString(Eval("DeliverStatus")) != "0" ? "<br/><a href='ExpressLog.aspx?action=ExpressLog&OrderID="+Eval("OrderID")+"'>�鿴����</a>" : string.Empty %>

				</td>

             </tr>
             
         </ItemTemplate>
          <FooterTemplate>
           <tr class="tdbg" style="display:<%# bool.Parse((Repeater1.Items.Count==0).ToString())?"":"none"%>">
                <td class="splittd" style="text-align:center" colspan="7">
                  ��û���κεĶ�����
                </td>
               </tr> 
           </table>
          </FooterTemplate>
        </asp:Repeater>
        
        
        
           <br />
    
     <KS:Page ID="Page1" runat="server" />
</asp:Panel>


<asp:Panel ID="ControlPannel" runat="server" Visible="false">
        <asp:PlaceHolder ID="PlaceHolder1" runat="server"></asp:PlaceHolder>
</asp:Panel>

</asp:Content>

