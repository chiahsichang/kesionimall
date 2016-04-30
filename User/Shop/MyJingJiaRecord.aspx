<%@ Page Language="C#" MasterPageFile="~/User/User.master" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.MyJingJiaRecord" Title="Untitled Page" Codebehind="MyJingJiaRecord.aspx.cs" %>
<%@ Import Namespace="Kesion.Cache" %>
<%@ Import Namespace="Kesion.Publics" %>
<asp:Content ID="Content1" ContentPlaceHolderID="KSContent" Runat="Server">

<asp:Panel ID="PanList" runat="server">
    <div class="toptips">
     商品名称：<%=dr["title"].ToString()%>其有<%=dr["times"].ToString() %>次竞价  最高出价<%=Kesion.APPCode.Public.ReturnShopPrice(dr["HightMoney"].ToString()) %>元。
   </div>
    <asp:Repeater ID="Repeater1" runat="server">
    <HeaderTemplate>
         <table id="tablist" width="98%" border="0" align="center" cellpadding="2" cellspacing="1" class="border">
      <tr align="center" class="title">
        	<td>序号</td>
        	<td>出价者</td>
        	<td>出价时间</td>
        	<td>竞价(元)</td>
        	<td>状态</td>
        	<td>确认</td>
        </tr>
    </HeaderTemplate>
    <ItemTemplate>
      <tr class="tdbg">
          <td class="splittd" style="text-align:center"><%# (CurrPage-1)*PageSize+Container.ItemIndex+1%></td>
          <td class="splittd" style="text-align:center"><%# Eval("username")%></td>
          <td class="splittd" style="text-align:center"><%# Eval("adddate")%></td>
          <td class="splittd" style="text-align:center"><%# Kesion.APPCode.Public.ReturnShopPrice(Convert.ToDecimal(Eval("Money"))) %></td>
          <td class="splittd" style="text-align:center">
             <%# (CurrPage-1)*PageSize+Container.ItemIndex+1<=Utils.StrToInt(dr["num"].ToString())?(dr["isend"].ToString().Equals("1")?"<span style='color:green'>中标</span>":"<span style='color:green'>领先</span>"):"<span style='color:#999'>落后</span>"%>
          </td>
          <td class="splittd" style="text-align:center">
              <%# GetConfirmInfo(Convert.ToInt32(Eval("Id")),Convert.ToInt32(Eval("iszb")),Convert.ToInt32(Eval("status")),Convert.ToString(Eval("username"))) %>
          </td>
      </tr>  

     </ItemTemplate>
     <FooterTemplate>
         <tr class="tdbg" style="display:<%# bool.Parse((Repeater1.Items.Count==0).ToString())?"":"none"%>">
                <td class="splittd" style="text-align:center" colspan="10">
                 您没有参与任何的商品竞价！
                </td>
           </tr> 
      </table>
     </FooterTemplate>
    </asp:Repeater>
    
   <br />
    
     <KS:Page ID="Page1" runat="server" />
     
   <br />
   
</asp:Panel>


    <asp:Panel ID="Panel1" runat="server" Visible="false">

      <script>
          function checkSubmitForm() {
              <%if (dr["producttype"].ToString().Equals("0")){%>
              if ($("#<%=this.TxtRealName.ClientID%>").val() == '') {
                  KesionJS.Alert("请输入收件人！", '$("#<%=this.TxtRealName.ClientID%>").focus()');
                  return false;
              }
              if ($("#<%=this.TxtMobile.ClientID%>").val() == '') {
                  KesionJS.Alert("请输入联系电话！", '$("#<%=this.TxtMobile.ClientID%>").focus()');
                  return false;
              }
              if ($("#<%=this.TxtAddress.ClientID%>").val() == '') {
                  KesionJS.Alert("请输入收件地址！", '$("#<%=this.TxtAddress.ClientID%>").focus()');
                  return false;
              }
              <%}%>
              return true;
          }
      </script>
      <table  cellspacing="1" cellpadding="3" class="border" width="100%" align="center" border="0">
	   <tr class="title">
         <td colspan="2"> 竞价交易确认</td>
        </tr>
        <tr class="tdbg">
         <td class="lefttd">商品名称：</td>
         <td><%=dr["title"].ToString()%></td>
        </tr>
        <tr class="tdbg">
         <td class="lefttd">出 价 人：</td>
         <td><asp:Label ID="LabJingJiaUserName" runat="server"></asp:Label></td>
        </tr>
        <tr class="tdbg">
         <td class="lefttd">出价时间：</td>
         <td><asp:Label ID="LabJingJiaAddDate" runat="server"></asp:Label></td>
        </tr>
        <tr class="tdbg">
         <td class="lefttd">竞得价格：</td>
         <td><asp:Label ID="LabJingJiaPrice" runat="server"></asp:Label>元</td>
        </tr>
        <tr class="tdbg">
         <td class="lefttd">还需支付：</td>
         <td><asp:Label ID="LabPayMoney" runat="server"></asp:Label>元</td>
        </tr>
        <tr class="tdbg">
         <td class="lefttd">确认状态：</td>
         <td><asp:Label ID="LabStatus" runat="server"></asp:Label></td>
        </tr>
        <tbody id="AddressInput" runat="server">
             <tr class="title">
             <td colspan="2">收货信息</td>
            </tr>
            <tr class="tdbg"> 
             <td class="lefttd">收 货 人：</td>
             <td><asp:TextBox ID="TxtRealName" CssClass="textbox" runat="server" MaxLength="20" /></td>
            </tr>
            <tr class="tdbg">
             <td class="lefttd">联系电话：</td>
             <td><asp:TextBox ID="TxtMobile" CssClass="textbox" runat="server" MaxLength="20"/></td>
            </tr>
            <tr class="tdbg">
             <td class="lefttd">收货地址：</td>
             <td><asp:TextBox ID="TxtAddress" CssClass="textbox" runat="server" MaxLength="200"/></td>
            </tr>
            <tr class="tdbg">
             <td class="lefttd">邮政编码：</td>
             <td><asp:TextBox ID="TxtZipCode" CssClass="textbox" runat="server" MaxLength="10"/></td>
            </tr>
        </tbody>
           <tbody id="AddressShow" runat="server">
             <tr class="title">
             <td colspan="2">收货信息</td>
            </tr>
            <tr class="tdbg"> 
             <td class="lefttd">收 货 人：</td>
             <td><asp:Label ID="LabRealName" runat="server" /></td>
            </tr>
            <tr class="tdbg">
             <td class="lefttd">联系电话：</td>
             <td><asp:Label ID="LabMobile" runat="server" /></td>
            </tr>
            <tr class="tdbg">
             <td class="lefttd">收货地址：</td>
             <td><asp:Label ID="LabAddress" runat="server" /></td>
            </tr>
            <tr class="tdbg">
             <td class="lefttd">邮政编码：</td>
             <td><asp:Label ID="LabZipCode" runat="server" /></td>
            </tr>
        </tbody>
      </table>
        <div style="text-align:left;padding:20px;padding-left:120px;"　id="showDoButton" runat="server">
            <asp:HiddenField ID="HidAskId" runat="server" Value="0" />
            <asp:Button ID="BtnConfirm" Text="确认交易" OnClientClick="return(checkSubmitForm())" CssClass="button" runat="server" OnClick="BtnConfirm_Click" />
            <asp:Button ID="BtnCancel" Text="拒绝交易" CssClass="button" runat="server" OnClientClick="return(confirm('温馨提示：拒绝交易，您将损失保证金,确认操作吗？'));" OnClick="BtnCancel_Click" />
            <input type="button" class="button" value="取消返回" onclick="history.back()" />
        </div>
   </asp:Panel>

</asp:Content>