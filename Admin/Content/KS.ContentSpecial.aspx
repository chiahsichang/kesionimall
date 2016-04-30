<%@ Page Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.Admin_ContentSpecial" Title="Untitled Page" Codebehind="KS.ContentSpecial.aspx.cs" %>
<asp:Content ID="Content1" ContentPlaceHolderID="KSContent" Runat="Server">
    <KS:TopNav ID="TopNav1" runat="server" />
    <KS:KSGV ID="List" DataKeyNames="InfoID" CssClass="CTable" runat="server" AutoGenerateColumns="False" EmptyDataText="该专题下找不到任何信息!"
        GridLines="None" OnRowCommand="list_RowCommand" OnRowDataBound="list_RowDataBound"
        PagerType="CustomNumeric" Width="100%" OnRowCreated="List_RowCreated" AllowPaging="True" OnPageIndexChanging="List_PageIndexChanging" PageSize="15">
        <EmptyDataRowStyle CssClass="emptycss" />
        <Columns>
            <asp:TemplateField HeaderText="选择">
                <itemstyle horizontalalign="Center" width="35px" />
                <itemtemplate>
                <input type="checkbox"  name="ids" id="ids" value="<%#Eval("Infoid") %>" />
            
</itemtemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="InfoID" HeaderText="ID号">
                <itemstyle horizontalalign="Center" width="40px" />
            </asp:BoundField>
            <asp:BoundField DataField="Title" DataFormatString="&lt;span class='doc_1'&gt;&lt;/span&gt;{0}"
                HeaderText="标题" HtmlEncode="False" />
            <asp:BoundField DataField="Inputer" HeaderText="录入者">
                <itemstyle horizontalalign="Center" width="80px" />
            </asp:BoundField>
            <asp:BoundField DataField="AddDate" DataFormatString="{0:d}" HeaderText="添加时间" HtmlEncode="False">
                <itemstyle horizontalalign="Center" width="80px" />
            </asp:BoundField>
            <asp:BoundField DataField="Hits" HeaderText="点击数">
                <itemstyle horizontalalign="Center" width="50px" />
            </asp:BoundField>
            <asp:BoundField DataField="verify" HeaderText="状态">
                <itemstyle horizontalalign="Center" width="40px" />
            </asp:BoundField>
              <asp:BoundField DataField="ChannelID" HeaderText="模型ID" />
             <asp:TemplateField HeaderText="编辑">
                       <itemstyle horizontalalign="Center" width="25"/>
                        <itemtemplate>
                           <asp:LinkButton ToolTip="编辑" CssClass="edit" ID="modityBtn" runat="server" CommandArgument=<%#Eval("Infoid") %>  CommandName="modify"></asp:LinkButton>
                        </itemtemplate>
            </asp:TemplateField>
           <asp:TemplateField HeaderText="删除">
                 <itemstyle horizontalalign="Center" width="25"/>
                 <itemtemplate>
                           <asp:LinkButton CssClass="delete" ID="delete" runat="server" CommandArgument=<%#Eval("Infoid") %>  CommandName="del" ToolTip="从本专题中移除"></asp:LinkButton>
                 </itemtemplate>
            </asp:TemplateField>


        </Columns>
        <HeaderStyle CssClass="CTitle" />
    </KS:KSGV>
        <asp:Panel ID="Panel1" runat="server" Height="30px" Width="741px">
          <div style="margin-top:10px"></div>
            &nbsp;&nbsp;<input type="checkbox" name="chkall" id="chkall" onclick="CheckAll(this.form);"/><label for="chkall">全部选中</label>
            <asp:Button ID="DelButton" runat="server" Text="批量从本专题中移除" OnClick="DelButton_Click" />
            &nbsp;&nbsp;
            <asp:Button ID="Button1" runat="server" Text="关闭窗口" /></asp:Panel>

</asp:Content>

