<%@ Page Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.Admin_UserDepartMentOrder" Title="һ����������" Codebehind="KS.UserDepartMentOrder.aspx.cs" %>
<asp:Content ID="Content1" ContentPlaceHolderID="KSContent" Runat="Server">
   <script language="JavaScript">
    document.oncontextmenu=new Function("event.returnValue=false;");
    document.onselectstart=new Function("event.returnValue=false;");
    </script>
    <KS:TopNav ID="TopNav1" runat="server" Text="&lt;ul&gt;&lt;li id='p9'&gt;&lt;b&gt;&lt;/b&gt;&lt;a href='javascript:history.back();'&gt;����&lt;/a&gt;&lt;/li&gt; һ����������" />

    <KS:KSGV ID="list" CssClass="CTable" runat="server" AutoGenerateColumns="False" EmptyDataText="��û�����Ӳ���!" GridLines="None" OnRowDataBound="list_RowDataBound" PagerType="CustomNumeric" Width="100%" OnDataBound="list_DataBound" OnRowCommand="list_RowCommand">
        <EmptyDataRowStyle CssClass="emptycss" />
        <Columns>
            <asp:BoundField DataField="DepartId" HeaderText="����ID" >
                <itemstyle horizontalalign="Center" width="50px" />
            </asp:BoundField>
            <asp:BoundField DataField="departmentname" HeaderText="��������" />
            <asp:BoundField DataField="root" HeaderText="���" >
                <itemstyle horizontalalign="Center" width="100px" />
            </asp:BoundField>
            <asp:TemplateField HeaderText="һ�������������">
            <itemtemplate>
             <table border="0" cellpadding="0" cellspacing="0" align="center">
                <tr>
                <td style="width: 49%">
                       <asp:DropDownList ID="DropUpOrder" runat="server" AutoPostBack="False">
                          <asp:ListItem Selected="True" Value="0">�������ƶ�</asp:ListItem>
                         </asp:DropDownList>
                        &nbsp;<asp:Button runat="server" ID="UpButton" onmouseover="this.className='button_on';" onmouseout="this.className='button';" class="button" Text="�޸�" commandname="uporder" commandargument=<%#Eval("root") %>></asp:Button>

              </td>
              <td>&nbsp;</td>
              <td style="width: 49%">
               <asp:DropDownList ID="DropDownOrder" runat="server" AutoPostBack="False">
                  <asp:ListItem Selected="True" Value="0">�������ƶ�</asp:ListItem>
               </asp:DropDownList>&nbsp;<asp:Button ID="DownButton" onmouseover="this.className='button_on';" onmouseout="this.className='button';" class="button" Text="�޸�" commandname="downorder" commandargument=<%#Eval("root") %> runat="server" />
            </td>
            </table>
</itemtemplate>
            
            </asp:TemplateField>
        </Columns>
        <HeaderStyle CssClass="CTitle" />
    </KS:KSGV>
    <KS:Page ID="Page1" runat="server" />
         
</asp:Content>
