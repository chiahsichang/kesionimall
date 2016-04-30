<%@ Page Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.Admin_FormShowEntrants" Title="竖排查看表单提交记录" Codebehind="KS.FormShowEntrants.aspx.cs" %>
<asp:Content ID="Content1" ContentPlaceHolderID="KSContent" Runat="Server">
    <asp:Panel ID="listPanel" runat="server" Width="100%">
        <KS:TopNav ID="TopNav1" runat="server" />
        <KS:KSGV ID="list" runat='server' CssClass="CTable" AutoGenerateColumns="False" EmptyDataText="没有表单项" GridLines="None" OnRowDataBound="list_RowDataBound" PagerType="CustomNumeric" Width="99%" OnRowCommand="list_RowCommand">
            <EmptyDataRowStyle CssClass="emptycss" />
            <Columns>
                <asp:BoundField DataField="ID" HeaderText="序号" >
                    <itemstyle horizontalalign="Center" width="50px" />
                </asp:BoundField>

                <asp:TemplateField HeaderText="表单项名称">
                 <itemstyle horizontalalign="left"/>
                 <itemtemplate>
                  <strong><%# Eval("FieldName") %></strong>(<%# Eval("ItemID") %>)
                 </itemtemplate>
                </asp:TemplateField>

                <asp:BoundField DataField="FieldType" HeaderText="表单项类型" >
                    <itemstyle horizontalalign="Center" width="100px" />
                </asp:BoundField>

                
                <asp:TemplateField HeaderText="↓管理操作">
                 <itemstyle horizontalalign="Center"/>
                 <itemtemplate>
                  <asp:LinkButton runat="server" id="view" commandargument=<%#Eval("itemid") %> commandname="view">查看详细提交结果</asp:LinkButton>
                 </itemtemplate>
                </asp:TemplateField>
            </Columns>
            <HeaderStyle CssClass="CTitle" />
        </KS:KSGV>
    </asp:Panel>
    
    <asp:Panel ID="detailPanel" runat="server" Width="100%" Visible="false">
    <KS:TopNav ID="TopNav2" runat="server" />
    <KS:KSGV ID="DetailList" runat='server' CssClass="CTable" AutoGenerateColumns="False" EmptyDataText="没有提交记录" GridLines="None" PagerType="CustomNumeric" Width="99%" OnRowDataBound="DetailList_RowDataBound" >
            <EmptyDataRowStyle CssClass="emptycss" />
            <Columns>
                <asp:BoundField DataField="RecordID" HeaderText="序号" >
                    <itemstyle horizontalalign="Center" width="50px" />
                </asp:BoundField>
                <asp:BoundField DataField="UserName" HeaderText="用户名" >
                    <itemstyle width="60px" />
                </asp:BoundField>
                <asp:BoundField DataField="userip" HeaderText="用户IP" >
                    <itemstyle horizontalalign="Center" width="80px" />
                </asp:BoundField>
                <asp:BoundField DataField="adddate" HeaderText="提交时间" >
                    <itemstyle horizontalalign="Center" width="150px" />
                </asp:BoundField>

                 <asp:TemplateField HeaderText="提交内容">
                  <itemtemplate>
                  <%#Eval(Request.QueryString["Itemid"].ToString()) %>
                  
</itemtemplate>
                 </asp:TemplateField>
                
  
            </Columns>
            <HeaderStyle CssClass="CTitle" />
            <EmptyDataRowStyle CssClass="emptycss" />
        </KS:KSGV>
        
         <KS:Page ID="Page1" runat="server" />
    </asp:Panel>
</asp:Content>

