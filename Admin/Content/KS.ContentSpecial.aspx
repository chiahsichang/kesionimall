<%@ Page Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.Admin_ContentSpecial" Title="Untitled Page" Codebehind="KS.ContentSpecial.aspx.cs" %>
<asp:Content ID="Content1" ContentPlaceHolderID="KSContent" Runat="Server">
    <KS:TopNav ID="TopNav1" runat="server" />
    <KS:KSGV ID="List" DataKeyNames="InfoID" CssClass="CTable" runat="server" AutoGenerateColumns="False" EmptyDataText="��ר�����Ҳ����κ���Ϣ!"
        GridLines="None" OnRowCommand="list_RowCommand" OnRowDataBound="list_RowDataBound"
        PagerType="CustomNumeric" Width="100%" OnRowCreated="List_RowCreated" AllowPaging="True" OnPageIndexChanging="List_PageIndexChanging" PageSize="15">
        <EmptyDataRowStyle CssClass="emptycss" />
        <Columns>
            <asp:TemplateField HeaderText="ѡ��">
                <itemstyle horizontalalign="Center" width="35px" />
                <itemtemplate>
                <input type="checkbox"  name="ids" id="ids" value="<%#Eval("Infoid") %>" />
            
</itemtemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="InfoID" HeaderText="ID��">
                <itemstyle horizontalalign="Center" width="40px" />
            </asp:BoundField>
            <asp:BoundField DataField="Title" DataFormatString="&lt;span class='doc_1'&gt;&lt;/span&gt;{0}"
                HeaderText="����" HtmlEncode="False" />
            <asp:BoundField DataField="Inputer" HeaderText="¼����">
                <itemstyle horizontalalign="Center" width="80px" />
            </asp:BoundField>
            <asp:BoundField DataField="AddDate" DataFormatString="{0:d}" HeaderText="���ʱ��" HtmlEncode="False">
                <itemstyle horizontalalign="Center" width="80px" />
            </asp:BoundField>
            <asp:BoundField DataField="Hits" HeaderText="�����">
                <itemstyle horizontalalign="Center" width="50px" />
            </asp:BoundField>
            <asp:BoundField DataField="verify" HeaderText="״̬">
                <itemstyle horizontalalign="Center" width="40px" />
            </asp:BoundField>
              <asp:BoundField DataField="ChannelID" HeaderText="ģ��ID" />
             <asp:TemplateField HeaderText="�༭">
                       <itemstyle horizontalalign="Center" width="25"/>
                        <itemtemplate>
                           <asp:LinkButton ToolTip="�༭" CssClass="edit" ID="modityBtn" runat="server" CommandArgument=<%#Eval("Infoid") %>  CommandName="modify"></asp:LinkButton>
                        </itemtemplate>
            </asp:TemplateField>
           <asp:TemplateField HeaderText="ɾ��">
                 <itemstyle horizontalalign="Center" width="25"/>
                 <itemtemplate>
                           <asp:LinkButton CssClass="delete" ID="delete" runat="server" CommandArgument=<%#Eval("Infoid") %>  CommandName="del" ToolTip="�ӱ�ר�����Ƴ�"></asp:LinkButton>
                 </itemtemplate>
            </asp:TemplateField>


        </Columns>
        <HeaderStyle CssClass="CTitle" />
    </KS:KSGV>
        <asp:Panel ID="Panel1" runat="server" Height="30px" Width="741px">
          <div style="margin-top:10px"></div>
            &nbsp;&nbsp;<input type="checkbox" name="chkall" id="chkall" onclick="CheckAll(this.form);"/><label for="chkall">ȫ��ѡ��</label>
            <asp:Button ID="DelButton" runat="server" Text="�����ӱ�ר�����Ƴ�" OnClick="DelButton_Click" />
            &nbsp;&nbsp;
            <asp:Button ID="Button1" runat="server" Text="�رմ���" /></asp:Panel>

</asp:Content>

