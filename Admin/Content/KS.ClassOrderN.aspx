<%@ Page Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.Admin_ClassOrderN" Title="N����Ŀ����" Codebehind="KS.ClassOrderN.aspx.cs" %>
<%@ Import Namespace="Kesion.Publics" %>
<asp:Content ID="Content1" ContentPlaceHolderID="KSContent" Runat="Server">
   <script language="JavaScript">
    //document.oncontextmenu=new Function("event.returnValue=false;");
    //document.onselectstart=new Function("event.returnValue=false;");
    </script>

    <div id="manage_top" class="toptitle menu_top_fixed">
        <ul><li id='p9'><a href="javascript:;" onclick="location.href='KS.Class.aspx?from=<%=KSCMS.S("from") %>';"><b></b>����</a></li> N ����Ŀ����</ul>
    </div>
    <div class="menu_top_fixed_height"></div> 



    <KS:KSGV ID="List" cssclass="CTable" runat="server" AutoGenerateColumns="False" EmptyDataText="û������κ���Ŀ!" GridLines="None" OnRowDataBound="List_RowDataBound" PagerType="CustomNumeric" Width="100%" OnRowCommand="List_RowCommand">
        <EmptyDataRowStyle CssClass="emptycss" />
        <Columns>
            <asp:BoundField DataField="ClassID" HeaderText="��ĿID" >
                <itemstyle horizontalalign="Center" width="50px" />
            </asp:BoundField>
            <asp:BoundField DataField="parentid" HeaderText="��ID" >
                <itemstyle horizontalalign="Center" width="50px" />
            </asp:BoundField>
            <asp:TemplateField HeaderText="��Ŀ����">
                <itemtemplate>
        <%# getClassListName(Eval("Classname", "{0}"), Convert.ToInt16(Eval("child")), Convert.ToInt16(Eval("NextID")), Convert.ToInt16(Eval("depth", "{0}")), Convert.ToInt16(Eval("ClassType", "{0}")))%>
            </itemtemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="OrderID" HeaderText="���" >
                <itemstyle horizontalalign="Center" />
            </asp:BoundField>
            <asp:TemplateField HeaderText="N����Ŀ����">
                <itemstyle horizontalalign="Center" width="400px" />
                <itemtemplate>
                <table border="0" cellpadding="0" cellspacing="0" align="center">
                <tr>
                <td style="width: 49%" nowrap>
                       <asp:DropDownList ID="DropUpOrder" runat="server" AutoPostBack="False">
                          <asp:ListItem Selected="True" Value="0">�������ƶ�</asp:ListItem>
                         </asp:DropDownList>
                        &nbsp;<asp:Button runat="server" ID="UpButton" onmouseover="this.className='button_on';" onmouseout="this.className='button';" class="button" Text="�޸�" commandname="upordern" commandargument=<%#Eval("root") %>></asp:Button>

              </td>
              <td>&nbsp;</td>
              <td style="width: 49%" nowrap>
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

