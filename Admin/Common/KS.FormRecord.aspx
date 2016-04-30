<%@ Page Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.Admin_FormRecord" Title="Untitled Page" Codebehind="KS.FormRecord.aspx.cs" %>
<asp:Content ID="Content1" ContentPlaceHolderID="KSContent" Runat="Server">
    <asp:Panel ID="FormListPanel" runat="server" Width="100%">
        <KS:TopNav ID="TopNav1" runat="server" Text="查看各表单提交结果" />
        <KS:KSGV ID="FormList" cssclass="CTable" runat='server' AutoGenerateColumns="False" EmptyDataText="没有自定义表单" PagerType="CustomNumeric" Width="99%" HorizontalAlign="center" GridLines="None" OnRowDataBound="FormList_RowDataBound" OnRowCommand="FormList_RowCommand">
            <EmptyDataRowStyle CssClass="emptycss" />
            <Columns>
                <asp:BoundField DataField="formid" HeaderText="表单ID" >
                    <itemstyle horizontalalign="Center" width="60px" />
                </asp:BoundField>
                <asp:BoundField DataField="subject" HeaderText="项目名称" />
                <asp:TemplateField HeaderText="提交记录数">
                    <itemstyle horizontalalign="Center" width="80px" />
                    <itemtemplate>
                    <font color=red><%#GetItemRecords(Convert.ToInt32(Eval("formid"))) %></font> 条
                    </itemtemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="查看详细记录">
                 <itemstyle horizontalalign="Center"/>
                 <itemtemplate>
                 
                   <asp:LinkButton runat="server" id="viewcard" commandargument=<%#Eval("formid") %> commandname="viewcard">卡片式查看</asp:LinkButton>
                   <asp:LinkButton runat="server" id="viewdetail" commandargument=<%#Eval("formid") %> commandname="viewdetail">查看详情(横排)</asp:LinkButton>
                   <asp:LinkButton runat="server" id="viewentrants" commandargument=<%#Eval("formid") %> commandname="viewentrants">查看详情(竖排)</asp:LinkButton>

                 </itemtemplate>
                </asp:TemplateField>
            </Columns>
            <HeaderStyle CssClass="CTitle" />
        </KS:KSGV>
        
        <KS:Page ID="Page1" runat="server" />
        
    </asp:Panel>
</asp:Content>

