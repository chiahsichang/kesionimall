<%@ Page Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.Admin_VoteLog" Title="ͶƱ��־����" Codebehind="KS.VoteLog.aspx.cs" %>
<asp:Content ID="Content1" ContentPlaceHolderID="KSContent" Runat="Server">
       <div id="manage_top" class="menu_top_fixed">
       <ul>
           <li id='p3'><asp:LinkButton ID="delallbutton" runat="server" OnClick="addclassbutton_Click"><b></b>ȫ��ɾ��</asp:LinkButton></li> 
           <li id='p18'><asp:LinkButton ID="delclassbutton" runat="server" OnClick="delclassbutton_Click"><b></b>����Excel</asp:LinkButton></li></ul>
    </div> 
    <div class="menu_top_fixed_height"></div> 
    <KS:KSGV ID="List" cssclass="CTable" runat="server"  AutoGenerateColumns="False"
        EmptyDataText="û�в���ͶƱ�ļ�¼" GridLines="None" OnRowDataBound="List_RowDataBound"
        PagerType="CustomNumeric" Width="99%" HorizontalAlign="center">
        <EmptyDataRowStyle CssClass="emptycss" />
        <Columns>
        <asp:TemplateField HeaderText="ѡ��">
                <itemstyle horizontalalign="Center" width="50px" />
                
                <itemtemplate>
<input type="checkbox"  name="ids" id="ids" value="<%#Eval("logid") %>" />
            
</itemtemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="LogID" HeaderText="ID">
                <itemstyle horizontalalign="Center" width="50px" />
            </asp:BoundField>
            <asp:BoundField DataField="subject" HeaderText="����">
            </asp:BoundField>
            <asp:BoundField DataField="username" HeaderText="�û���">
                <itemstyle horizontalalign="Center" width="80px" />
            </asp:BoundField>
            <asp:BoundField DataField="IP" HeaderText="IP��ַ">
                <itemstyle width="160px" />
            </asp:BoundField>
            <asp:BoundField DataField="VoteDate" HeaderText="����ʱ��">
                <itemstyle width="160px" />
            </asp:BoundField>
        </Columns>
        <HeaderStyle CssClass="CTitle" />
    </KS:KSGV>
    
    <asp:Panel ID="Panel1" runat="server" Height="30px" Width="100%">
            <div style="margin-top:5px;overflow:hidden;"></div>
            &nbsp;&nbsp;<input type="checkbox" name="chkall" id="chkall" onclick="CheckAll(this.form);"/><label for="chkall">ȫ��ѡ��</label>
            <asp:Button ID="DelButton" runat="server" Text="ɾ��ѡ�е���־" OnClick="DelButton_Click"/>
        <br />
        
       <KS:Page ID="Page1" runat="server" />
        
         <br />
        <script type="text/javascript">
            showtips('<span class="state"><strong>��ܰ��ʾ��</strong><br /></span><br/>��ҳ���г��ˣ��û������ͶƱ��ϸ�嵥������ԶԴ˽���ɾ����������ɾ������ܵ����û������ظ�ͶƱ��');
		</script>

        
        </asp:Panel>

</asp:Content>

