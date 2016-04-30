<%@ Page Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.Admin_ExeSQL"  Title="在线执行SQL" Codebehind="KS.ExeSQL.aspx.cs" %>
<%@ Register TagPrefix="KS" Namespace="Kesion.Controls" Assembly="Kesion.Controls" %>

<asp:Content ID="Content1" ContentPlaceHolderID="KSContent" Runat="Server">
        <KS:TopNav ID="TopNav1" runat="server" Text="在线执行SQL语句" />
    <div style="width:98%;margin:0 auto;">
        <asp:TextBox ID="SQL" runat="server" Columns="5" Rows="5" TextMode="MultiLine" Width="100%"></asp:TextBox>
        <asp:Panel ID="Panel1" runat="server" Height="25px" Width="100%" CssClass="lefttd">
            <asp:Button ID="Button1" CssClass="button" runat="server" Text="立即执行" OnClick="Button1_Click" />
            <font color="#ff0000">说明：一次只能执行一条SQL语句，如果您对SQL语句不了解，建议不要使用．</font>
         </asp:Panel>
        <asp:Panel ID="listresult" runat="server" Height="372px" Width="100%" style="overflow:scroll;">
        <asp:GridView ID="list" runat="server" CellPadding="4" ForeColor="#333333">
            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
            <EditRowStyle BackColor="#999999" />
            <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        </asp:GridView>
        </asp:Panel>
        
        <div ID="totalresult" runat="server"></div>
       
    </div>
</asp:Content>
