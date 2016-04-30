<%@ Page Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.Admin_User_LogMoney" Title="Untitled Page" Codebehind="KS.LogMoney.aspx.cs" %>
<%@ Import Namespace="Kesion.Cache" %>
<%@ Import Namespace="Kesion.Publics" %>
<asp:Content ID="Content1" ContentPlaceHolderID="KSContent" Runat="Server">

 <div id="manage_top" class="menu_top_fixed">&nbsp;<strong>Ԥ������ϸ��¼����</strong>
 &nbsp;&nbsp;<strong>�û�����</strong><asp:TextBox ID="TxtKeyWord" runat="server" CssClass="textbox" />
<asp:DropDownList runat="server" ID="DrpInOrOut">
 <asp:ListItem Value="0" Selected="true">����</asp:ListItem>
 <asp:ListItem Value="1">����</asp:ListItem>
 <asp:ListItem Value="2">֧��</asp:ListItem>
</asp:DropDownList>
<asp:Button ID="BtnSearch" runat="server" Text="��������" CssClass="button" 
        onclick="BtnSearch_Click" />
</div>
 <div class="menu_top_fixed_height"></div>  


    <div class="tabs_header">
     <%if (!string.IsNullOrEmpty(KSCMS.S("userName"))){ %>
            <span style="float:right;padding-right:10px;">�鿴�û�<span style='color:red'><%=KSCMS.S("userName")%></span>��������ϸ</span>
      <%} %>
        <ul class="tabs">
        <li class='active'><a href="KS.LogMoney.aspx"><span>Ԥ������ϸ</span></a></li>
        <li><a href="KS.Consumer.aspx"><span><%=MyCache.GetCacheConfig(49) %>��ϸ</span></a></li>
        <li><a href="KS.LogScore.aspx"><span>������ϸ</span></a></li>
        </ul>
   </div>

    <asp:GridView runat="server" cssclass="CTable" EmptyDataText="û��Ԥ������ϸ��¼��" ID="grvList" AutoGenerateColumns="False" GridLines="None"  Width="99%" OnRowDataBound="grvList_RowDataBound" ShowFooter="True">
          <HeaderStyle CssClass="CTitle" />
        <EmptyDataRowStyle CssClass="emptycss" />
        <Columns>
            <asp:BoundField DataField="UserName" HeaderText="�û���" >
                <ItemStyle HorizontalAlign="Center" />
            </asp:BoundField>
            <asp:BoundField DataField="PayTime" HeaderText="����ʱ��" >
                <ItemStyle HorizontalAlign="Center" />
            </asp:BoundField>
            <asp:BoundField DataField="IP" HeaderText="IP��ַ" >
                <ItemStyle HorizontalAlign="Center" />
            </asp:BoundField>
            <asp:BoundField DataField="money" HeaderText="���루Ԫ��" HtmlEncode="False" DataFormatString="{0:n2}">
                <ItemStyle HorizontalAlign="Right" />
            </asp:BoundField>
            <asp:BoundField DataField="money" HeaderText="֧����Ԫ��" HtmlEncode="False" DataFormatString="{0:n2}">
                <ItemStyle HorizontalAlign="Right" />
            </asp:BoundField>
            <asp:BoundField DataField="InComeorPayOut" HeaderText="ժҪ" >
                <ItemStyle HorizontalAlign="Center" />
            </asp:BoundField>
            <asp:BoundField DataField="Inputer" HeaderText="����Ա" >
                <ItemStyle HorizontalAlign="Center" />
            </asp:BoundField>
            <asp:BoundField DataField="currmoney" HeaderText="��Ԫ��" HtmlEncode="False" DataFormatString="{0:n2}">
                <ItemStyle HorizontalAlign="Center" />
            </asp:BoundField>
           <asp:TemplateField HeaderText="��ע">
            <itemstyle horizontalalign="Left" Height="30px" width="300px"/>
            <itemtemplate>
                <span class="tips"><%# Eval("Remark") %></span>
            </itemtemplate>
            </asp:TemplateField>
        </Columns>

</asp:GridView>
     <KS:Page ID="Page1" runat="server" />
     
     <div style="border:1px dashed #cccccc; background-color:#f0f9fe; margin-top:10px;padding:10px; text-align: left; font-size: 12px;">
     <strong>�ر����ѣ�</strong> �����ϸ���¼̫�࣬Ӱ����ϵͳ���ܣ�����ɾ��һ��ʱ���ǰ�ļ�¼�Լӿ��ٶȡ������ܻ������Ա�ڲ鿴��ǰ�չ��ѵ���Ϣʱ�ظ��շѣ������������ڶ����Ѿ������⣩���޷�ͨ����ϸ��¼����ʵ������Ա������ϰ�ߵ����⡣ 
     <div>
     <strong>ɾ����Χ��</strong><asp:RadioButtonList ID="RdbDelType" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow">
      <asp:ListItem Value="1">10��ǰ</asp:ListItem>
      <asp:ListItem Value="2">1����ǰ</asp:ListItem>
      <asp:ListItem Value="3">2����ǰ</asp:ListItem>
      <asp:ListItem Value="4">3����ǰ</asp:ListItem>
      <asp:ListItem Value="5">6����ǰ</asp:ListItem>
      <asp:ListItem Value="6" Selected="True">1��ǰ</asp:ListItem>
         </asp:RadioButtonList>
         <asp:Button ID="BtnDel" runat="server" Text="ִ��ɾ��" OnClick="BtnDel_Click" CssClass="button" /></div>
     </div>
</asp:Content>


