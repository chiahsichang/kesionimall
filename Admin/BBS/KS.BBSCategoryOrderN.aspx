<%@ Page Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.Admin_BBSCategoryOrderN" Title="N����������" Codebehind="KS.BBSCategoryOrderN.aspx.cs" %>
<asp:Content ID="Content1" ContentPlaceHolderID="KSContent" Runat="Server">
   <script language="JavaScript">
    document.oncontextmenu=new Function("event.returnValue=false;");
    document.onselectstart=new Function("event.returnValue=false;");
    </script>


       <div id="manage_top" class="toptitle menu_top_fixed">
        <ul><li id='p9'><b></b><a href="javascript:;" onclick="location.href='KS.BBSCategory.aspx';">����</a></li> N����̳��������</ul>
    </div>
    <div class="menu_top_fixed_height"></div> 

    <KS:KSGV ID="List" runat="server" CssClass="CTable" AutoGenerateColumns="False" EmptyDataText="û������κΰ���!" GridLines="None" OnRowDataBound="List_RowDataBound" PagerType="CustomNumeric" Width="99%" OnRowCommand="List_RowCommand">
        <EmptyDataRowStyle CssClass="emptycss" />
        <Columns>
            <asp:BoundField DataField="BoardID" HeaderText="����ID" >
                <itemstyle horizontalalign="Center" width="50px" />
            </asp:BoundField>
            <asp:BoundField DataField="parentid" HeaderText="��ID" >
                <itemstyle horizontalalign="Center" width="50px" />
            </asp:BoundField>
            <asp:TemplateField HeaderText="��������">
                <itemtemplate>
        <%# getClassListName(Eval("BoardName", "{0}"), Convert.ToInt16(Eval("child")), Convert.ToInt16(Eval("NextID")), Convert.ToInt16(Eval("depth", "{0}")),1)%>
            </itemtemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="OrderID" HeaderText="���" />
            <asp:TemplateField HeaderText="N����������">
                <itemtemplate>
                <table border="0" cellpadding="0" cellspacing="0" align="center">
                <tr>
                <td style="width: 49%">
                       <asp:DropDownList ID="DropUpOrder" runat="server" AutoPostBack="False">
                          <asp:ListItem Selected="True" Value="0">�������ƶ�</asp:ListItem>
                         </asp:DropDownList>
                        &nbsp;<asp:Button runat="server" ID="UpButton" onmouseover="this.className='button_on';" onmouseout="this.className='button';" class="button" Text="�޸�" commandname="upordern" commandargument=<%#Eval("root") %>></asp:Button>

              </td>
              <td>&nbsp;</td>
              <td style="width: 49%">
               <asp:DropDownList ID="DropDownOrder" runat="server" AutoPostBack="False">
                  <asp:ListItem Selected="True" Value="0">�������ƶ�</asp:ListItem>
               </asp:DropDownList>&nbsp;<asp:Button ID="DownButton" onmouseover="this.className='button_on';" onmouseout="this.className='button';" class="button" Text="�޸�" commandname="downordern" commandargument=<%#Eval("root") %> runat="server" />
            </td>
            </table>
        </itemtemplate>
            </asp:TemplateField>
        </Columns>
        <HeaderStyle CssClass="CTitle" />
    </KS:KSGV>
     <KS:Page ID="Page1" runat="server" />
</asp:Content>

