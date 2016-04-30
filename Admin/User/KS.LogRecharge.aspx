<%@ Page Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.Admin_User_LogRecharge" Title="Untitled Page" Codebehind="KS.LogRecharge.aspx.cs" %>
<%@ Import Namespace="Kesion.Publics"%>
<asp:Content ID="Content1" ContentPlaceHolderID="KSContent" Runat="Server">
<div id="manage_top" class="menu_top_fixed">&nbsp;<strong>���߳�ֵ��¼����</strong>
 &nbsp;&nbsp;<strong>�û�����</strong><asp:TextBox ID="TxtKeyWord" runat="server" CssClass="textbox" />
<asp:Button ID="BtnSearch" runat="server" Text="��������" CssClass="button" 
        onclick="BtnSearch_Click" />
</div>
 <div class="menu_top_fixed_height"></div>  



 <div class="tabs_header">
    <ul class="tabs">
    <li<%=KSCMS.S("status")==""?" class='active'":string.Empty %>><a href="KS.LogRecharge.aspx?<%=UtilsQueryParam.Get("status") %>"><span>���м�¼</span></a></li>
    <li<%=KSCMS.S("status")=="2"?" class='active'":string.Empty %>><a href="KS.LogRecharge.aspx?status=2&<%=UtilsQueryParam.Get("status") %>"><span>֧���ɹ���δ����</span></a></li>
    <li<%=KSCMS.S("status")=="1"?" class='active'":string.Empty %>><a href="KS.LogRecharge.aspx?status=1&<%=UtilsQueryParam.Get("status") %>"><span>֧���ɹ���������</span></a></li>
    <li<%=KSCMS.S("status")=="0"?" class='active'":string.Empty %>><a href="KS.LogRecharge.aspx?status=0&<%=UtilsQueryParam.Get("status") %>"><span>δ֧��</span></a></li>
    </ul>
</div>

    <asp:GridView runat="server" cssclass="CTable" ID="grvList" EmptyDataText="û�г�ֵ��¼��" AutoGenerateColumns="False" GridLines="None"  Width="99%" OnRowDataBound="grvList_RowDataBound" ShowFooter="True">
            <HeaderStyle CssClass="CTitle" />
        <EmptyDataRowStyle CssClass="emptycss" />
        <Columns>
           <asp:TemplateField HeaderText="����">
                <ItemStyle HorizontalAlign="Center" />
                <itemtemplate>
                       <%# Container.DataItemIndex + 1 + (CurrPage - 1) * pagesize%>��                 
               </itemtemplate>
                </asp:TemplateField>     
            <asp:BoundField DataField="OrderID" HeaderText="��ֵ����" >
                <ItemStyle HorizontalAlign="Left" />
            </asp:BoundField>
            <asp:BoundField DataField="UserName" HeaderText="�û���" >
                <ItemStyle HorizontalAlign="Center" />
            </asp:BoundField>
            <asp:BoundField DataField="AddDate" HeaderText="ʱ��" >
                <ItemStyle HorizontalAlign="Center" />
            </asp:BoundField>

            <asp:BoundField DataField="paymoney" HeaderText="��ֵ��Ԫ��" HtmlEncode="False" DataFormatString="{0:n2}">
                <ItemStyle HorizontalAlign="Right" />
            </asp:BoundField>
            <asp:BoundField DataField="realmoney" HeaderText="ʵ�ս�Ԫ��" HtmlEncode="False" DataFormatString="{0:n2}">
                <ItemStyle HorizontalAlign="Right" />
            </asp:BoundField>
            <asp:BoundField DataField="status" HeaderText="״̬" >
                <ItemStyle HorizontalAlign="Center" />
            </asp:BoundField>
            <asp:BoundField DataField="PlatName" HeaderText="֧��ƽ̨" >
                <ItemStyle HorizontalAlign="Center" />
            </asp:BoundField>
              <asp:TemplateField HeaderText="����">
                <ItemStyle Height="30px" HorizontalAlign="Center" />
                <itemtemplate>
                 <%# Convert.ToInt16(Eval("status"))==2?"<a href='?action=addmoney&id="+Eval("id")+@"' onclick=""return(confirm('�˲��������棬ȷ���յ���������'));"">����</a>":"" %>
                 <%# Convert.ToInt16(Eval("status"))!=2?"<a href='?action=del&id="+Eval("id")+@"' onclick=""return(confirm('�˲��������棬ȷ��ɾ����'))"">ɾ��</a>":"" %>
                 
               </itemtemplate>
                </asp:TemplateField>
        </Columns>

</asp:GridView>
     <KS:Page ID="Page1" runat="server" />
     
     <div style="border:1px dashed #cccccc; background-color:#f0f9fe; margin-top:10px;padding:10px; text-align: left; font-size: 12px;">
     <strong>�ر����ѣ�</strong> �����ϸ���¼̫�࣬Ӱ����ϵͳ���ܣ�����ɾ��һ��ʱ���ǰ�ļ�¼�Լӿ��ٶȡ������ܻ������Ա�޷��鿴��ǰ����ʷ��ֵ��¼�� ��ֵ�ɹ���δ���˵ļ�¼�ǲ���ɾ���ġ�
     <div>
     <strong>ɾ����Χ��</strong><asp:RadioButtonList ID="RdbDelType" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow">
      <asp:ListItem Value="1">10��ǰ</asp:ListItem>
      <asp:ListItem Value="2">1����ǰ</asp:ListItem>
      <asp:ListItem Value="3">2����ǰ</asp:ListItem>
      <asp:ListItem Value="4">3����ǰ</asp:ListItem>
      <asp:ListItem Value="5">6����ǰ</asp:ListItem>
      <asp:ListItem Value="6" Selected>1��ǰ</asp:ListItem>
         </asp:RadioButtonList>
         <asp:Button ID="BtnDel" runat="server" Text="ִ��ɾ��" OnClick="BtnDel_Click" CssClass="button" /></div>
     </div>
</asp:Content>


