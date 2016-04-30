<%@ Page Language="C#" MasterPageFile="~/User/UserNoLogin.master" AutoEventWireup="True" Inherits="Kesion.NET.WebSite.User_PayOnline_1" Title="在线支付" Codebehind="PayOnline.aspx.cs" %>
<%@ Import Namespace="Kesion.Cache" %>
<%@ Import Namespace="Kesion.Publics" %>
<asp:Content ID="Content1" ContentPlaceHolderID="KSContent" Runat="Server">

<asp:Panel ID="PnlStep1" runat="server" Width="100%">
 
    <div class="tabs" style="margin-left:10px">	
		<ul>             
           <li class='puton'><a href="<%=MyCache.GetCacheConfig(0) %>user/payonline.aspx">在线充值</a></li>
           <li><a href="<%=MyCache.GetCacheConfig(0) %>user/basic/UserCard.aspx">充值卡充值</a></li>
           <li><a href="<%=MyCache.GetCacheConfig(0) %>user/basic/FeePackages.aspx">购买套餐包</a></li>
		</ul>
	</div>

 <table cellspacing="1" cellpadding="3" class="border" width="98%" align="center" border="0">
	 <tr class="title">
         <td> 预存款充值</td>
     </tr>
     <tr class="tdbg">
         <td style="height:50px" class="splittd">
             &nbsp; 您好,<asp:Label ID="LabUserName" runat="server"></asp:Label> !您的身份级别：<asp:Label ID="LabGroupName" runat="server" Text="Label"></asp:Label>,
             可用预存款 <%=MyCache.GetCurrencySymbol %><font color=red><asp:Label ID="LabMoney" runat="server" /></font> <%=MyCache.GetCurrencyUnit %>(<a href="basic/LogMoney.aspx"><span style="color:blue;">明细</span></a>)，
             可用<asp:Label ID="LabPoint" runat="server" Text="Label"></asp:Label>(<a href="basic/Consumer.aspx"><span style="color:blue;">明细</span></a>)
             ，积分<font color=green><asp:Label ID="LabScore" runat="server" Text="Label"></asp:Label></font> 分(<a href="basic/LogScore.aspx"><span style="color:blue;">明细</span></a>)。
             </td>
     </tr>
     <tr class="tdbg">
         <td class="splittd" style="height:50px">
            &nbsp; 本次充值：<input type="text" class="textbox" name="money" style="text-align:center;width:50px"  value="100"/>
           <%=MyCache.GetCurrencyUnit %> <asp:Button ID="BtnNext" runat="server" CssClass="button" Text="下 一 步" OnClientClick="" OnClick="BtnNext_Click" />
         
         </td>
     </tr>


    </table>
    
    <br />
    <br />
    <style>
.border .unpay{color:red;}
.border .success{color:green;}
.border .wait{color:blue;}
</style>
    <asp:Repeater ID="Repeater1" runat="server">
    <HeaderTemplate>
         <table id="tablist" width="98%" border="0" align="center" cellpadding="2" cellspacing="1" class="border">
      <tr class="title">
        	<td colspan="10">历史充值记录</td>
        </tr>
      <tr align="center" class="title1">
        	<td>序号</td>
        	<td>充值单号</td>
        	<td>时间</td>
        	<td>充值金额</td>
        	<td>实收</td>
        	<td>状态</td>
        	<td>支付平台</td>
        	<td>操作</td>
        </tr>
    </HeaderTemplate>
    <ItemTemplate>
      <tr class="tdbg">
          <td class="splittd" style="text-align:center"><%# Container.ItemIndex + 1 + (CurrPage - 1) * PageSize%>、</td>
          <td class="splittd"><%# Eval("orderid") %></td>
          <td class="splittd"> 
           <%# Utils.FormatHumanizedTime(Convert.ToDateTime(Eval("AddDate")))%>
          </td>
          <td class="splittd" nowrap><%=MyCache.GetCurrencySymbol %><%# Math.Round(Convert.ToDecimal(Eval("paymoney")),2)%> <%=MyCache.GetCurrencyUnit %></td>
          <td class="splittd" nowrap><%=MyCache.GetCurrencySymbol %><span style="font-size:16px;font-weight:bold;color:#ff6600"><%# Math.Round(Convert.ToDecimal(Eval("realmoney")),2)%></span> <%=MyCache.GetCurrencyUnit %></td>
          <td class="splittd" style="text-align:center">
          <%# GetPayStatus(Convert.ToInt32(Eval("status"))) %>
          </td>
          <td class="splittd">
          <%# Eval("platname") %>
          </td>
          <td class="splittd"  style="text-align:center">
          <%# Eval("status").ToString() == "0" ? "<a href='?action=del&id=" + Eval("id") + @"' onclick=""return(confirm('确定删除吗？'))"">删除</a> | <a target='_blank' href='PayConfirm.aspx?from=recharge&platid="+Eval("platid")+"&orderid=" + Eval("orderid") + "'>支付</a>" : "---"%>
          
          </td>

      </tr>  

     </ItemTemplate>
     <FooterTemplate>
         <tr class="tdbg" style="display:<%# bool.Parse((Repeater1.Items.Count==0).ToString())?"":"none"%>">
                <td class="splittd" style="text-align:center" colspan="10">
                  没有充值记录！
                </td>
           </tr> 
      </table>
     </FooterTemplate>
    </asp:Repeater>
    
   <br />
    
     <KS:Page ID="Page1" runat="server" />
     
     
</asp:Panel>

<asp:Panel ID="PnlStep2" runat="server" Visible="false" Width="100%">
 
 <asp:PlaceHolder ID="PlaceHolder1" runat="server"></asp:PlaceHolder>
</asp:Panel>




</asp:Content>

