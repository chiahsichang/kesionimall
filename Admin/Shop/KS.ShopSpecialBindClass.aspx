<%@ Page Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.Admin_ShopSpecialBindClass" Title="��Ŀ�����󶨹��" Codebehind="KS.ShopSpecialBindClass.aspx.cs" %>
<%@ Import Namespace="Kesion.Publics" %>
<asp:Content ID="Content1" ContentPlaceHolderID="KSContent" Runat="Server">
   <script language="JavaScript">
    //document.oncontextmenu=new Function("event.returnValue=false;");
    //document.onselectstart=new Function("event.returnValue=false;");
    </script>

    <div id="manage_top" class="toptitle menu_top_fixed">
        <ul><li id='p9'><b></b><a href="KS.ShopSpecial.aspx">����</a></li> ��Ʒ��Ŀ�����󶨹����</ul>
    </div>
    <div class="menu_top_fixed_height"></div> 



    <KS:KSGV ID="List" cssclass="CTable" runat="server" AutoGenerateColumns="False" EmptyDataText="û������κ���Ŀ!" GridLines="None" OnRowDataBound="List_RowDataBound" PagerType="CustomNumeric" Width="100%">
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
            <asp:TemplateField HeaderText="�󶨹����">
                <itemstyle horizontalalign="Center" width="400px" />
                <itemtemplate>
                       <asp:HiddenField ID="HidProSpecialID" Value='<%# Eval("prospecialid") %>' runat="server" />
                       <asp:DropDownList ID="DrpProSpecialID" runat="server" AutoPostBack="False">
                          <asp:ListItem Value="0">-ѡ������-</asp:ListItem>
                        </asp:DropDownList>
               </itemtemplate>
            </asp:TemplateField>
        </Columns>
        <HeaderStyle CssClass="CTitle" />
    </KS:KSGV>

    <div style="margin:20px;text-align:center;">
        <asp:Button ID="BtnBatchSave" runat="server" Text="����������Ŀ�󶨹����" CssClass="button" OnClick="BtnBatchSave_Click" />
         </div>

     <KS:Page ID="Page1" runat="server" />
</asp:Content>

