<%@ Page Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.Admin_FormShowEntrants" Title="���Ų鿴���ύ��¼" Codebehind="KS.FormShowEntrants.aspx.cs" %>
<asp:Content ID="Content1" ContentPlaceHolderID="KSContent" Runat="Server">
    <asp:Panel ID="listPanel" runat="server" Width="100%">
        <KS:TopNav ID="TopNav1" runat="server" />
        <KS:KSGV ID="list" runat='server' CssClass="CTable" AutoGenerateColumns="False" EmptyDataText="û�б���" GridLines="None" OnRowDataBound="list_RowDataBound" PagerType="CustomNumeric" Width="99%" OnRowCommand="list_RowCommand">
            <EmptyDataRowStyle CssClass="emptycss" />
            <Columns>
                <asp:BoundField DataField="ID" HeaderText="���" >
                    <itemstyle horizontalalign="Center" width="50px" />
                </asp:BoundField>

                <asp:TemplateField HeaderText="��������">
                 <itemstyle horizontalalign="left"/>
                 <itemtemplate>
                  <strong><%# Eval("FieldName") %></strong>(<%# Eval("ItemID") %>)
                 </itemtemplate>
                </asp:TemplateField>

                <asp:BoundField DataField="FieldType" HeaderText="��������" >
                    <itemstyle horizontalalign="Center" width="100px" />
                </asp:BoundField>

                
                <asp:TemplateField HeaderText="���������">
                 <itemstyle horizontalalign="Center"/>
                 <itemtemplate>
                  <asp:LinkButton runat="server" id="view" commandargument=<%#Eval("itemid") %> commandname="view">�鿴��ϸ�ύ���</asp:LinkButton>
                 </itemtemplate>
                </asp:TemplateField>
            </Columns>
            <HeaderStyle CssClass="CTitle" />
        </KS:KSGV>
    </asp:Panel>
    
    <asp:Panel ID="detailPanel" runat="server" Width="100%" Visible="false">
    <KS:TopNav ID="TopNav2" runat="server" />
    <KS:KSGV ID="DetailList" runat='server' CssClass="CTable" AutoGenerateColumns="False" EmptyDataText="û���ύ��¼" GridLines="None" PagerType="CustomNumeric" Width="99%" OnRowDataBound="DetailList_RowDataBound" >
            <EmptyDataRowStyle CssClass="emptycss" />
            <Columns>
                <asp:BoundField DataField="RecordID" HeaderText="���" >
                    <itemstyle horizontalalign="Center" width="50px" />
                </asp:BoundField>
                <asp:BoundField DataField="UserName" HeaderText="�û���" >
                    <itemstyle width="60px" />
                </asp:BoundField>
                <asp:BoundField DataField="userip" HeaderText="�û�IP" >
                    <itemstyle horizontalalign="Center" width="80px" />
                </asp:BoundField>
                <asp:BoundField DataField="adddate" HeaderText="�ύʱ��" >
                    <itemstyle horizontalalign="Center" width="150px" />
                </asp:BoundField>

                 <asp:TemplateField HeaderText="�ύ����">
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

