<%@ Page Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.Admin_CollectHistory" Title="采集历史记录管理" Codebehind="KS.CollectHistory.aspx.cs" %>
<asp:Content ID="Content1" ContentPlaceHolderID="KSContent" Runat="Server">
    <asp:Panel ID="ListPanel" runat="server" Width="100%">
    <div id="manage_top" class="menu_top_fixed">
       <ul>
          <strong>采集历史记录管理</strong>
          <div id="go">
           <asp:DropDownList ID="DrpQuickShow" runat="server">
            <asp:ListItem Value="0">--快速查找--</asp:ListItem>
            <asp:ListItem Value="1">所有记录</asp:ListItem>
            <asp:ListItem Value="2">所有成功记录</asp:ListItem>
            <asp:ListItem Value="3">所有失败记录</asp:ListItem>
           </asp:DropDownList>
           </div>
           </ul>
    </div> 
     <div class="menu_top_fixed_height"></div>   
    <KS:ksgv id="List" cssclass="CTable" runat="server" AutoGenerateColumns="False" EmptyDataText="没有添加任何采集历史记录!" PagerType="CustomNumeric" Width="99%" GridLines="None" OnRowDataBound="List_RowDataBound" OnRowCommand="List_RowCommand" OnRowCreated="List_RowCreated" AllowPaging="False">
        <Columns>
            <asp:TemplateField HeaderText="选择">
                <itemstyle horizontalalign="Center" width="50px" />
                
                <itemtemplate>
<input type="checkbox"  name="ids" id="ids" value="<%#Eval("HistoryID") %>" />
            
</itemtemplate>
            </asp:TemplateField>
            <asp:BoundField HeaderText="信息名称" DataField="Title" >
             <itemstyle/>
            </asp:BoundField>

            <asp:TemplateField HeaderText="信息地址">
              <itemstyle/>
              <itemtemplate>
              <span class="tips"><%# Eval("ItemUrl") %></span>
              </itemtemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="采集时间">
              <itemstyle/>
              <itemtemplate>
              <span class="tips"><%# Eval("RecordTime")%></span>
              </itemtemplate>
            </asp:TemplateField>

            
            <asp:TemplateField HeaderText="状态">
                <ItemStyle  HorizontalAlign="Center" Width="50px" />
                    <ItemTemplate>
                   <a href="javascript:;" <%# Convert.ToString(Eval("IsSucceed"))=="0"?"class='no' title='否'":"class='ok' title='是'" %>></a>
                 </ItemTemplate>
                </asp:TemplateField>

 
            <asp:BoundField HeaderText="备注" DataField="Remark" >
                <itemstyle width="150px" horizontalalign="Center" />
            </asp:BoundField>

            <asp:TemplateField HeaderText="删除">
              <itemstyle width="30px" horizontalalign="Center"/>
              <itemtemplate>
             <asp:LinkButton runat="server" CssClass="delete" ToolTip="删除" id="delete" commandargument=<%#Eval("Historyid") %> commandname="del"></asp:LinkButton>
              </itemtemplate>
            </asp:TemplateField>

            <asp:TemplateField HeaderText="采集">
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
            &nbsp;&nbsp;<input type="checkbox" name="chkall" id="chkall" onclick="CheckAll(this.form);"/><label for="chkall">全部选中</label>
            <input type="button" value="删除选中的项目" onmouseover="this.className='button_on';" onmouseout="this.className='button';" class="button" onclick="if (GetIDS('del')){this.form.action='?action=del';this.form.submit()}" />
                    <asp:Button ID="DelAllButton" runat="server" Text="删除全部记录" OnClick="DelAllButton_Click"/>
                <asp:Button ID="DelSucceedButton" runat="server" Text="删除所有成功记录" OnClick="DelSucceedButton_Click"/>
                <asp:Button ID="DelUnSucceedButton" runat="server" Text="删除所有失败记录" OnClick="DelUnSucceedButton_Click"/><br />
<KS:Page ID="Page1" runat="server" />
           </asp:Panel>
</asp:Panel>

    

</asp:Content>
