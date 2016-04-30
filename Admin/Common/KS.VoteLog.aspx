<%@ Page Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.Admin_VoteLog" Title="投票日志管理" Codebehind="KS.VoteLog.aspx.cs" %>
<asp:Content ID="Content1" ContentPlaceHolderID="KSContent" Runat="Server">
       <div id="manage_top" class="menu_top_fixed">
       <ul>
           <li id='p3'><asp:LinkButton ID="delallbutton" runat="server" OnClick="addclassbutton_Click"><b></b>全部删除</asp:LinkButton></li> 
           <li id='p18'><asp:LinkButton ID="delclassbutton" runat="server" OnClick="delclassbutton_Click"><b></b>导出Excel</asp:LinkButton></li></ul>
    </div> 
    <div class="menu_top_fixed_height"></div> 
    <KS:KSGV ID="List" cssclass="CTable" runat="server"  AutoGenerateColumns="False"
        EmptyDataText="没有参与投票的记录" GridLines="None" OnRowDataBound="List_RowDataBound"
        PagerType="CustomNumeric" Width="99%" HorizontalAlign="center">
        <EmptyDataRowStyle CssClass="emptycss" />
        <Columns>
        <asp:TemplateField HeaderText="选择">
                <itemstyle horizontalalign="Center" width="50px" />
                
                <itemtemplate>
<input type="checkbox"  name="ids" id="ids" value="<%#Eval("logid") %>" />
            
</itemtemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="LogID" HeaderText="ID">
                <itemstyle horizontalalign="Center" width="50px" />
            </asp:BoundField>
            <asp:BoundField DataField="subject" HeaderText="主题">
            </asp:BoundField>
            <asp:BoundField DataField="username" HeaderText="用户名">
                <itemstyle horizontalalign="Center" width="80px" />
            </asp:BoundField>
            <asp:BoundField DataField="IP" HeaderText="IP地址">
                <itemstyle width="160px" />
            </asp:BoundField>
            <asp:BoundField DataField="VoteDate" HeaderText="参与时间">
                <itemstyle width="160px" />
            </asp:BoundField>
        </Columns>
        <HeaderStyle CssClass="CTitle" />
    </KS:KSGV>
    
    <asp:Panel ID="Panel1" runat="server" Height="30px" Width="100%">
            <div style="margin-top:5px;overflow:hidden;"></div>
            &nbsp;&nbsp;<input type="checkbox" name="chkall" id="chkall" onclick="CheckAll(this.form);"/><label for="chkall">全部选中</label>
            <asp:Button ID="DelButton" runat="server" Text="删除选中的日志" OnClick="DelButton_Click"/>
        <br />
        
       <KS:Page ID="Page1" runat="server" />
        
         <br />
        <script type="text/javascript">
            showtips('<span class="state"><strong>温馨提示：</strong><br /></span><br/>本页面列出了，用户参与的投票详细清单，你可以对此进行删除操作！但删除后可能导致用户可以重复投票。');
		</script>

        
        </asp:Panel>

</asp:Content>

