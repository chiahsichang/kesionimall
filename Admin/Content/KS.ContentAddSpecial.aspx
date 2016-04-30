<%@ Page Language="C#" ValidateRequest="false" EnableEventValidation="false" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.Admin_ContentAddSpecial" Title="添加/编辑信息" Codebehind="KS.ContentAddSpecial.aspx.cs" %>
<asp:Content ID="Content1" ContentPlaceHolderID="KSContent" Runat="Server">
     <div style="text-align:center">
         ID列表：<asp:TextBox ID="ContentIDS" runat="server" ReadOnly="True"></asp:TextBox>
    <div id="SpecialPannel" runat="server">
     </div>
         小提示：多选可按<font color=red>Shift</font>键<br />
      <asp:Button ID="Button1" runat="server" CssClass="button" Text="确定加入" OnClick="Button1_Click" />
         <asp:Button ID="Button2" runat="server" CssClass="button" Text="关闭取消" /></div>
    </form>
</asp:Content>
