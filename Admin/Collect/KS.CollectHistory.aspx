<%@ Page Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.Admin_CollectHistory" Title="�ɼ���ʷ��¼����" Codebehind="KS.CollectHistory.aspx.cs" %>
<asp:Content ID="Content1" ContentPlaceHolderID="KSContent" Runat="Server">
    <asp:Panel ID="ListPanel" runat="server" Width="100%">
    <div id="manage_top" class="menu_top_fixed">
       <ul>
          <strong>�ɼ���ʷ��¼����</strong>
          <div id="go">
           <asp:DropDownList ID="DrpQuickShow" runat="server">
            <asp:ListItem Value="0">--���ٲ���--</asp:ListItem>
            <asp:ListItem Value="1">���м�¼</asp:ListItem>
            <asp:ListItem Value="2">���гɹ���¼</asp:ListItem>
            <asp:ListItem Value="3">����ʧ�ܼ�¼</asp:ListItem>
           </asp:DropDownList>
           </div>
           </ul>
    </div> 
     <div class="menu_top_fixed_height"></div>   
    <KS:ksgv id="List" cssclass="CTable" runat="server" AutoGenerateColumns="False" EmptyDataText="û������κβɼ���ʷ��¼!" PagerType="CustomNumeric" Width="99%" GridLines="None" OnRowDataBound="List_RowDataBound" OnRowCommand="List_RowCommand" OnRowCreated="List_RowCreated" AllowPaging="False">
        <Columns>
            <asp:TemplateField HeaderText="ѡ��">
                <itemstyle horizontalalign="Center" width="50px" />
                
                <itemtemplate>
<input type="checkbox"  name="ids" id="ids" value="<%#Eval("HistoryID") %>" />
            
</itemtemplate>
            </asp:TemplateField>
            <asp:BoundField HeaderText="��Ϣ����" DataField="Title" >
             <itemstyle/>
            </asp:BoundField>

            <asp:TemplateField HeaderText="��Ϣ��ַ">
              <itemstyle/>
              <itemtemplate>
              <span class="tips"><%# Eval("ItemUrl") %></span>
              </itemtemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="�ɼ�ʱ��">
              <itemstyle/>
              <itemtemplate>
              <span class="tips"><%# Eval("RecordTime")%></span>
              </itemtemplate>
            </asp:TemplateField>

            
            <asp:TemplateField HeaderText="״̬">
                <ItemStyle  HorizontalAlign="Center" Width="50px" />
                    <ItemTemplate>
                   <a href="javascript:;" <%# Convert.ToString(Eval("IsSucceed"))=="0"?"class='no' title='��'":"class='ok' title='��'" %>></a>
                 </ItemTemplate>
                </asp:TemplateField>

 
            <asp:BoundField HeaderText="��ע" DataField="Remark" >
                <itemstyle width="150px" horizontalalign="Center" />
            </asp:BoundField>

            <asp:TemplateField HeaderText="ɾ��">
              <itemstyle width="30px" horizontalalign="Center"/>
              <itemtemplate>
             <asp:LinkButton runat="server" CssClass="delete" ToolTip="ɾ��" id="delete" commandargument=<%#Eval("Historyid") %> commandname="del"></asp:LinkButton>
              </itemtemplate>
            </asp:TemplateField>

            <asp:TemplateField HeaderText="�ɼ�">
                <itemstyle width="30px" horizontalalign="Center" />
             <itemtemplate>
             <asp:LinkButton runat="server" id="collect" CssClass="preview" commandargument=<%#Eval("itemid") %> commandname="collect"></asp:LinkButton>
            
            
</itemtemplate>
           
            </asp:TemplateField>
        </Columns>
        <HeaderStyle CssClass="CTitle" />
            <EmptyDataRowStyle CssClass="emptycss" />
    </KS:ksgv>
            <asp:Panel ID="Panel1" runat="server" Height="30px">
              <div style="margin-top:5px;overflow:hidden;"></div>
            &nbsp;&nbsp;<input type="checkbox" name="chkall" id="chkall" onclick="CheckAll(this.form);"/><label for="chkall">ȫ��ѡ��</label>
            <input type="button" value="ɾ��ѡ�е���Ŀ" onmouseover="this.className='button_on';" onmouseout="this.className='button';" class="button" onclick="if (GetIDS('del')){this.form.action='?action=del';this.form.submit()}" />
                    <asp:Button ID="DelAllButton" runat="server" Text="ɾ��ȫ����¼" OnClick="DelAllButton_Click"/>
                <asp:Button ID="DelSucceedButton" runat="server" Text="ɾ�����гɹ���¼" OnClick="DelSucceedButton_Click"/>
                <asp:Button ID="DelUnSucceedButton" runat="server" Text="ɾ������ʧ�ܼ�¼" OnClick="DelUnSucceedButton_Click"/><br />
<KS:Page ID="Page1" runat="server" />
           </asp:Panel>
</asp:Panel>

    

</asp:Content>
