<%@ Page Language="C#" MasterPageFile="~/User/User.master" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.ExpressLog" Title="" Codebehind="ExpressLog.aspx.cs" %>
<asp:Content ID="Content1" ContentPlaceHolderID="KSContent" Runat="Server">
<style>
    .border .last {
        font-weight:bold;
    }
</style>
<asp:Panel ID="PayPannel" runat="server" Visible="false">
        <asp:PlaceHolder ID="PlaceHolder1" runat="server"></asp:PlaceHolder>
</asp:Panel>

</asp:Content>

