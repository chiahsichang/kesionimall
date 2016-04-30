<%@ Page Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.Admin_FormRecord" Title="Untitled Page" Codebehind="KS.FormRecord.aspx.cs" %>
<asp:Content ID="Content1" ContentPlaceHolderID="KSContent" Runat="Server">
    <asp:Panel ID="FormListPanel" runat="server" Width="100%">
        <KS:TopNav ID="TopNav1" runat="server" Text="�鿴�����ύ���" />
        <KS:KSGV ID="FormList" cssclass="CTable" runat='server' AutoGenerateColumns="False" EmptyDataText="û���Զ����" PagerType="CustomNumeric" Width="99%" HorizontalAlign="center" GridLines="None" OnRowDataBound="FormList_RowDataBound" OnRowCommand="FormList_RowCommand">
            <EmptyDataRowStyle CssClass="emptycss" />
            <Columns>
                <asp:BoundField DataField="formid" HeaderText="��ID" >
                    <itemstyle horizontalalign="Center" width="60px" />
                </asp:BoundField>
                <asp:BoundField DataField="subject" HeaderText="��Ŀ����" />
                <asp:TemplateField HeaderText="�ύ��¼��">
                    <itemstyle horizontalalign="Center" width="80px" />
                    <itemtemplate>
                    <font color=red><%#GetItemRecords(Convert.ToInt32(Eval("formid"))) %></font> ��
                    </itemtemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="�鿴��ϸ��¼">
                 <itemstyle horizontalalign="Center"/>
                 <itemtemplate>
                 
                   <asp:LinkButton runat="server" id="viewcard" commandargument=<%#Eval("formid") %> commandname="viewcard">��Ƭʽ�鿴</asp:LinkButton>
                   <asp:LinkButton runat="server" id="viewdetail" commandargument=<%#Eval("formid") %> commandname="viewdetail">�鿴����(����)</asp:LinkButton>
                   <asp:LinkButton runat="server" id="viewentrants" commandargument=<%#Eval("formid") %> commandname="viewentrants">�鿴����(����)</asp:LinkButton>

                 </itemtemplate>
                </asp:TemplateField>
            </Columns>
            <HeaderStyle CssClass="CTitle" />
        </KS:KSGV>
        
        <KS:Page ID="Page1" runat="server" />
        
    </asp:Panel>
</asp:Content>

