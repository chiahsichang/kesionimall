<%@ Page Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.Admin.Shop.Admin_DataTable" Title="�鿴�������ݱ��¼" Codebehind="KS.Data.Table.aspx.cs" %>
<%@ Import Namespace="Kesion.Cache" %>
<%@ Import Namespace="Kesion.BLL" %>
<asp:Content ID="Content1" ContentPlaceHolderID="KSContent" Runat="Server">

<asp:Panel ID="listPanel" runat="server" Width="100%">
   <KS:TopNav ID="top1" runat="server" Text="�鿴���ݿ����������ݱ�" />
    <div>
      <script>
          function view(tablename) {
              parent.openWin('�鿴��['+tablename+']���ֶ�', 'System/KS.Data.Table.aspx?tablename=' + tablename, false);
          } 
      </script>
        <KS:KSGV ID="TableListView" cssclass="CTable" runat="server" AutoGenerateColumns="False"  GridLines="None"
            OnRowDataBound="FieldListView_RowDataBound" PagerType="CustomNumeric" Width="99%" EnableTheming="True" HorizontalAlign="Center" EmptyDataText="û�����ݱ�!">
            <Columns>
              <asp:TemplateField HeaderText="���">
                <itemstyle horizontalalign="Center" width="50px" />
                <itemtemplate>
                    <%#Container.DataItemIndex+1%>        
                </itemtemplate>
              </asp:TemplateField>
            
                 <asp:TemplateField HeaderText="���ݱ�">
                  <itemstyle/>
                <ItemTemplate>
                <%# Eval("TableName")%>
                
                </ItemTemplate>  
                </asp:TemplateField>
               
               <asp:TemplateField HeaderText="������">
                  <itemstyle horizontalalign="Center" />
                <ItemTemplate>
                <span style="color:Green"><%# Eval("num") %></span> ��
                </ItemTemplate>  
                </asp:TemplateField>
               <asp:TemplateField HeaderText="�ֶ�">
                  <itemstyle horizontalalign="Center" />
                <ItemTemplate>
                 <a href="javascript:;" onclick="view('<%# Eval("TableName")%>')">�鿴</a>
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
		showtips('<span class="state"><strong>˵����</strong><br /></span>�����г����ݿ�����б������ݱ���ļ�¼��!');
		</script>
		

     </asp:Panel>
     
     <asp:Panel ID="PanShow" runat="server" Visible="false">
     
     <KS:KSGV ID="FieldListView"  cssclass="CTable" runat="server" AutoGenerateColumns="False"  GridLines="None"
            OnRowDataBound="FieldListView_RowDataBound" PagerType="CustomNumeric" Width="99%" EnableTheming="True" HorizontalAlign="Center" EmptyDataText="û�����ݱ�!">
            <Columns>
              <asp:TemplateField HeaderText="���">
                <itemstyle horizontalalign="Center" width="50px" />
                <itemtemplate>
                    <%#Container.DataItemIndex+1%>        
                </itemtemplate>
              </asp:TemplateField>
            
                 <asp:TemplateField HeaderText="�ֶ�����">
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