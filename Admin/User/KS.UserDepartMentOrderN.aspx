<%@ Page Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.Admin_UserDepartMentOrderN" Title="N级部门排序" Codebehind="KS.UserDepartMentOrderN.aspx.cs" %>
<asp:Content ID="Content1" ContentPlaceHolderID="KSContent" Runat="Server">
   <script language="JavaScript">
    document.oncontextmenu=new Function("event.returnValue=false;");
    document.onselectstart=new Function("event.returnValue=false;");
    </script>

       <div id="manage_top" class="toptitle menu_top_fixed">
        <ul><li id='p9'><b></b><a href="javascript:;" onclick="location.href='KS.UserDepartMent.aspx';">返回</a></li> N级部门排序</ul>
    </div>
    <div class="menu_top_fixed_height"></div> 


    <KS:KSGV ID="List" CssClass="CTable" runat="server" AutoGenerateColumns="False" EmptyDataText="没有添加任何部门!" GridLines="None" OnRowDataBound="List_RowDataBound" PagerType="CustomNumeric" Width="99%" OnRowCommand="List_RowCommand">
        <EmptyDataRowStyle CssClass="emptycss" />
        <Columns>
            <asp:BoundField DataField="DepartID" HeaderText="部门ID" >
                <itemstyle horizontalalign="Center" width="50px" />
            </asp:BoundField>
            <asp:BoundField DataField="parentid" HeaderText="父ID" >
                <itemstyle horizontalalign="Center" width="50px" />
            </asp:BoundField>
            <asp:TemplateField HeaderText="部门名称">
                <itemtemplate>
        <%# getClassListName(Eval("departMentname", "{0}"), Convert.ToInt16(Eval("child")), Convert.ToInt16(Eval("NextID")), Convert.ToInt16(Eval("depth", "{0}")))%>
            </itemtemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="OrderID" HeaderText="序号" />
            <asp:TemplateField HeaderText="N级部门排序">
                <itemtemplate>
                <table border="0" cellpadding="0" cellspacing="0" align="center">
                <tr>
                <td style="width: 49%">
                       <asp:DropDownList ID="DropUpOrder" runat="server" AutoPostBack="False">
                          <asp:ListItem Selected="True" Value="0">↑向上移动</asp:ListItem>
                         </asp:DropDownList>
                        &nbsp;<asp:Button runat="server" ID="UpButton" onmouseover="this.className='button_on';" onmouseout="this.className='button';" class="button" Text="修改" commandname="upordern" commandargument=<%#Eval("root") %>></asp:Button>

              </td>
              <td>&nbsp;</td>
              <td style="width: 49%">
               <asp:DropDownList ID="DropDownOrder" runat="server" AutoPostBack="False">
                  <asp:ListItem Selected="True" Value="0">↓向下移动</asp:ListItem>
               </asp:DropDownList>&nbsp;<asp:Button ID="DownButton" onmouseover="this.className='button_on';" onmouseout="this.className='button';" class="button" Text="修改" commandname="downordern" commandargument=<%#Eval("root") %> runat="server" />
            </td>
            </table>
        </itemtemplate>
            </asp:TemplateField>
        </Columns>
        <HeaderStyle CssClass="CTitle" />
    </KS:KSGV>
     <KS:Page ID="Page1" runat="server" />
</asp:Content>

