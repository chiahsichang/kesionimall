<%@ Page Language="C#" ValidateRequest="false" EnableEventValidation="false" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.Admin_AddMoney" Title="预付款" Codebehind="KS.AddMoney.aspx.cs" %>
<%@ Import Namespace="Kesion.Cache" %>
<asp:Content ID="Content1" ContentPlaceHolderID="KSContent" Runat="Server">
    <script>
        function doChanage(v) {
            if (v == "2") {
                $("#shows").show();
            } else{ 
                $("#shows").hide();
            }
        }
    </script>
     <table width="100%" border="0" cellpadding="1" cellspacing="1" class="CTable"> 
          <tr>
              <td align="right" class="lefttd" style="width:150px">
                  <strong>用 户 名：</strong></td>
              <td class="righttd">
                  &nbsp;<%=userNames %>
                  </td>
          </tr>

         <tr>
             <td align="right" class="lefttd" style="text-align: right">
                 <strong>充值类型：</strong></td>
             <td class="righttd">
                  <asp:DropDownList ID="DrpCZType" runat="server">
                      <asp:ListItem Value="0">预付款</asp:ListItem>
                      <asp:ListItem Value="1">点券</asp:ListItem>
                      <asp:ListItem Value="2">积分</asp:ListItem>
                  </asp:DropDownList>
                 <span id="shows" style="display:none">
                  <asp:CheckBox ID="CkbAvailableScore"  Checked="true" runat="server" Text="同时加入可用积分"/></span>
            </td>
         </tr>
        
         <tr>
             <td align="right" class="lefttd" style="text-align: right">
                 <strong>操作类型：</strong></td>
             <td class="righttd">
                 <asp:RadioButtonList ID="RdbType" runat="server" RepeatDirection="Horizontal">
                     <asp:ListItem Selected="True" Value="1">增加</asp:ListItem>
                     <asp:ListItem Value="2">减少</asp:ListItem>
                 </asp:RadioButtonList></td>
         </tr>
           <tr>
              <td align="right" class="lefttd" style="text-align: right">
                  <strong>操作金额：</strong></td>
              <td class="righttd">
                  &nbsp;<asp:TextBox CssClass="textbox" ID="TxtPoint" runat="server" style="text-align:center" Width="61px" Text="100"></asp:TextBox></td>
          </tr>
           <tr>
              <td align="right" class="lefttd" style="text-align: right">
                  <strong>备注说明：</strong></td>
              <td class="righttd">
                  &nbsp;<asp:TextBox CssClass="textbox" ID="TxtRemark" runat="server" TextMode="multiLine" Width="364px" Height="80" Text="后台充值"></asp:TextBox>&nbsp;</td>
          </tr>
      </table>
      <div style="text-align:center;margin-top:15px">
      <asp:Button ID="Button1" runat="server" CssClass="button" Text="确定充值" OnClick="Button1_Click" />
         <asp:Button ID="Button2" runat="server" CssClass="button" Text="关闭取消" /></div>

</asp:Content>
