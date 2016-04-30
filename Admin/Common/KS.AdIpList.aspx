<%@ Page Language="C#" EnableEventValidation = "false"  MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.Admin_AdIpList" Title="Untitled Page" Codebehind="KS.AdIpList.aspx.cs" %>
<asp:Content ID="Content1" ContentPlaceHolderID="KSContent" Runat="Server">
    <KS:TopNav ID="TopNav1" runat="server" />
    <KS:KSGV ID="List" DataKeyNames="ID" runat="server" AutoGenerateColumns="False" EmptyDataText="�Ҳ����κε����Ϣ!"
        GridLines="None" HorizontalAlign="Center" OnRowCommand="list_RowCommand" OnRowDataBound="list_RowDataBound"
        PagerType="CustomNumeric" Width="100%" OnRowCreated="List_RowCreated" AllowPaging="True" OnPageIndexChanging="List_PageIndexChanging" PageSize="50">
        <EmptyDataRowStyle CssClass="emptycss" />
        <Columns>
            <asp:TemplateField HeaderText="ѡ��">
                <itemstyle horizontalalign="Center" width="35px" />
                <itemtemplate>
                <input type="checkbox"  name="ids" id="ids" value="<%#Eval("id") %>" />
            
</itemtemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="ID" HeaderText="ID��">
                <itemstyle horizontalalign="Center" width="40px" />
            </asp:BoundField>

            <asp:BoundField DataField="AddDate" DataFormatString="{0}" HeaderText="���ʱ��" HtmlEncode="False">
                <itemstyle horizontalalign="Center" />
            </asp:BoundField>
            <asp:BoundField DataField="UserName" HeaderText="�û�">
                <itemstyle horizontalalign="Center" />
            </asp:BoundField>
            <asp:BoundField DataField="UserIP" HeaderText="IP��ַ">
                <itemstyle horizontalalign="Center"/>
            </asp:BoundField>

            <asp:TemplateField HeaderText="���������">
                <itemstyle horizontalalign="Center" />
                <itemtemplate>
                     <asp:ImageButton ID="delete" runat="server" CommandArgument=<%#Eval("id") %>  CommandName="del" ImageUrl="../../admin/images/del.gif" ToolTip="�ӱ�ר�����Ƴ�"></asp:ImageButton>
                 </itemtemplate>
            </asp:TemplateField>
        </Columns>
        <HeaderStyle CssClass="CTitle" />
    </KS:KSGV>
        <asp:Panel ID="Panel1" runat="server" Height="30px" Width="741px">
          <div style="margin-top:10px"></div>
            &nbsp;&nbsp;<input type="checkbox" name="chkall" id="chkall" onclick="CheckAll(this.form);"/><label for="chkall">ȫ��ѡ��</label>
            <asp:Button ID="DelButton" runat="server" Text="����ɾ��" OnClick="DelButton_Click" />
            &nbsp;&nbsp;<asp:Button ID="BtnDelAll" runat="server" Text="������м�¼" 
                CssClass="button" onclick="BtnDelAll_Click" />
            &nbsp;&nbsp;<asp:Button ID="BtnExportExcel" runat="server" Text="����Excel" 
                CssClass="button" onclick="BtnExportExcel_Click"/>
            &nbsp;&nbsp;
            <asp:Button ID="Button1" runat="server" Text="�رմ���" /></asp:Panel>

</asp:Content>

