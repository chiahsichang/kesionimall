<%@ Page Language="C#" EnableEventValidation = "false"  MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.Admin_AdIpList" Title="Untitled Page" Codebehind="KS.AdIpList.aspx.cs" %>
<asp:Content ID="Content1" ContentPlaceHolderID="KSContent" Runat="Server">
    <KS:TopNav ID="TopNav1" runat="server" />
    <KS:KSGV ID="List" DataKeyNames="ID" runat="server" AutoGenerateColumns="False" EmptyDataText="找不到任何点击信息!"
        GridLines="None" HorizontalAlign="Center" OnRowCommand="list_RowCommand" OnRowDataBound="list_RowDataBound"
        PagerType="CustomNumeric" Width="100%" OnRowCreated="List_RowCreated" AllowPaging="True" OnPageIndexChanging="List_PageIndexChanging" PageSize="50">
        <EmptyDataRowStyle CssClass="emptycss" />
        <Columns>
            <asp:TemplateField HeaderText="选择">
                <itemstyle horizontalalign="Center" width="35px" />
                <itemtemplate>
                <input type="checkbox"  name="ids" id="ids" value="<%#Eval("id") %>" />
            
</itemtemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="ID" HeaderText="ID号">
                <itemstyle horizontalalign="Center" width="40px" />
            </asp:BoundField>

            <asp:BoundField DataField="AddDate" DataFormatString="{0}" HeaderText="点击时间" HtmlEncode="False">
                <itemstyle horizontalalign="Center" />
            </asp:BoundField>
            <asp:BoundField DataField="UserName" HeaderText="用户">
                <itemstyle horizontalalign="Center" />
            </asp:BoundField>
            <asp:BoundField DataField="UserIP" HeaderText="IP地址">
                <itemstyle horizontalalign="Center"/>
            </asp:BoundField>

            <asp:TemplateField HeaderText="↓管理操作">
                <itemstyle horizontalalign="Center" />
                <itemtemplate>
                     <asp:ImageButton ID="delete" runat="server" CommandArgument=<%#Eval("id") %>  CommandName="del" ImageUrl="../../admin/images/del.gif" ToolTip="从本专题中移除"></asp:ImageButton>
                 </itemtemplate>
            </asp:TemplateField>
        </Columns>
        <HeaderStyle CssClass="CTitle" />
    </KS:KSGV>
        <asp:Panel ID="Panel1" runat="server" Height="30px" Width="741px">
          <div style="margin-top:10px"></div>
            &nbsp;&nbsp;<input type="checkbox" name="chkall" id="chkall" onclick="CheckAll(this.form);"/><label for="chkall">全部选中</label>
            <asp:Button ID="DelButton" runat="server" Text="批量删除" OnClick="DelButton_Click" />
            &nbsp;&nbsp;<asp:Button ID="BtnDelAll" runat="server" Text="清空所有记录" 
                CssClass="button" onclick="BtnDelAll_Click" />
            &nbsp;&nbsp;<asp:Button ID="BtnExportExcel" runat="server" Text="导出Excel" 
                CssClass="button" onclick="BtnExportExcel_Click"/>
            &nbsp;&nbsp;
            <asp:Button ID="Button1" runat="server" Text="关闭窗口" /></asp:Panel>

</asp:Content>

