<%@ Page Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.Admin.Shop.Admin_DataTable" Title="查看所有数据表记录" Codebehind="KS.Data.Table.aspx.cs" %>
<%@ Import Namespace="Kesion.Cache" %>
<%@ Import Namespace="Kesion.BLL" %>
<asp:Content ID="Content1" ContentPlaceHolderID="KSContent" Runat="Server">

<asp:Panel ID="listPanel" runat="server" Width="100%">
   <KS:TopNav ID="top1" runat="server" Text="查看数据库里所有数据表" />
    <div>
      <script>
          function view(tablename) {
              parent.openWin('查看表['+tablename+']的字段', 'System/KS.Data.Table.aspx?tablename=' + tablename, false);
          } 
      </script>
        <KS:KSGV ID="TableListView" cssclass="CTable" runat="server" AutoGenerateColumns="False"  GridLines="None"
            OnRowDataBound="FieldListView_RowDataBound" PagerType="CustomNumeric" Width="99%" EnableTheming="True" HorizontalAlign="Center" EmptyDataText="没有数据表!">
            <Columns>
              <asp:TemplateField HeaderText="序号">
                <itemstyle horizontalalign="Center" width="50px" />
                <itemtemplate>
                    <%#Container.DataItemIndex+1%>        
                </itemtemplate>
              </asp:TemplateField>
            
                 <asp:TemplateField HeaderText="数据表">
                  <itemstyle/>
                <ItemTemplate>
                <%# Eval("TableName")%>
                
                </ItemTemplate>  
                </asp:TemplateField>
               
               <asp:TemplateField HeaderText="数据量">
                  <itemstyle horizontalalign="Center" />
                <ItemTemplate>
                <span style="color:Green"><%# Eval("num") %></span> 条
                </ItemTemplate>  
                </asp:TemplateField>
               <asp:TemplateField HeaderText="字段">
                  <itemstyle horizontalalign="Center" />
                <ItemTemplate>
                 <a href="javascript:;" onclick="view('<%# Eval("TableName")%>')">查看</a>
                </ItemTemplate>  
                </asp:TemplateField>
        
            </Columns>
            <HeaderStyle CssClass="CTitle" />
            <EmptyDataRowStyle CssClass="emptycss" />
        </KS:KSGV>
        <br />

        </div>
        
         <br />
        <script type="text/javascript">
		showtips('<span class="state"><strong>说明：</strong><br /></span>这里列出数据库的所有表，及数据表里的记录数!');
		</script>
		

     </asp:Panel>
     
     <asp:Panel ID="PanShow" runat="server" Visible="false">
     
     <KS:KSGV ID="FieldListView"  cssclass="CTable" runat="server" AutoGenerateColumns="False"  GridLines="None"
            OnRowDataBound="FieldListView_RowDataBound" PagerType="CustomNumeric" Width="99%" EnableTheming="True" HorizontalAlign="Center" EmptyDataText="没有数据表!">
            <Columns>
              <asp:TemplateField HeaderText="序号">
                <itemstyle horizontalalign="Center" width="50px" />
                <itemtemplate>
                    <%#Container.DataItemIndex+1%>        
                </itemtemplate>
              </asp:TemplateField>
            
                 <asp:TemplateField HeaderText="字段名称">
                  <itemstyle/>
                <ItemTemplate>
                <%# Eval("COLUMN_NAME")%>
                
                </ItemTemplate>  
                </asp:TemplateField>
             
            </Columns>
            <HeaderStyle CssClass="CTitle" />
            <EmptyDataRowStyle CssClass="emptycss" />
        </KS:KSGV>
        
     </asp:Panel>

  </asp:Content>