<%@ Page Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.SystemInfo" Title="服务器信息" Codebehind="KS.SystemInfo.aspx.cs" %>
<%@ Import Namespace="Kesion.Publics" %>
<%@ Import Namespace="Kesion.Cache" %>
<asp:Content ID="Content1" ContentPlaceHolderID="KSContent" Runat="Server">
 <KS:TopNav ID="TopNav1" runat="server" Text="查看服务器信息" />
 <asp:PlaceHolder ID="PlaceHolder1"  runat="server"></asp:PlaceHolder>
</asp:Content>