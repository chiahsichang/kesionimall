<%@ Page Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.Admin_Log"  Title="�鿴ϵͳ��־" Codebehind="KS.Log.aspx.cs" %>
<%@ Register TagPrefix="KS" Namespace="Kesion.Controls" Assembly="Kesion.Controls" %>

<asp:Content ID="Content1" ContentPlaceHolderID="KSContent" Runat="Server">
        <div id="manage_top" class="menu_top_fixed">
          <ul>
            <li id='p3'><asp:LinkButton ID="delall" runat="server" OnClick="LinkButton1_Click"><b></b>ɾ��ȫ��</asp:LinkButton></li>
            <li id='p3'><asp:LinkButton ID="LinkButton3" runat="server" OnClientClick="return(confirm('�˲��������棬ȷ��ɾ��ѡ�еļ�¼��?'))" OnClick="Button2_Click"><b></b>ɾ��ѡ��</asp:LinkButton></li>
              <li id='p9'><asp:LinkButton ID="LinkButton2" runat="server" OnClick="LinkButton2_Click"><b></b>����鿴</asp:LinkButton></li>
            <li id='p7'><asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click1"><b></b>������Excel</asp:LinkButton></li>
          </ul>
        </div>     
         <div class="menu_top_fixed_height"></div>  
        <KS:KSGV ID="LogListView"  cssclass="CTable" runat="server" AutoGenerateColumns="False" EmptyDataText="���޲�����־��"
            OnRowDataBound="LogListView_RowDataBound" Width="100%" GridLines="None"  DataKeyNames="id">
            <Columns>
                <asp:TemplateField HeaderText="<input type='checkbox' name='chkall' id='chkall' onclick='CheckAll(this.form);'/>">
                <ItemStyle HorizontalAlign="Center"  Width="30" />
                <ItemTemplate>
                <input type="checkbox"  name="ids" value="<%#Eval("id") %>" />
                </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="Username" HeaderText="����Ա">
                 <ItemStyle HorizontalAlign="Center"  />
                </asp:BoundField>
                <asp:BoundField DataField="ActionIP" HeaderText="����IP">
                 <ItemStyle Width="100px" />
                </asp:BoundField>
                <asp:BoundField DataField="actiontime" HeaderText="����ʱ��">
                <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                 <asp:TemplateField HeaderText="����">
            <itemstyle horizontalalign="Left" Height="30px"/>
            <itemtemplate>
                <span class="tips"><%# Eval("description") %></span>
            </itemtemplate>
            </asp:TemplateField>
             
            </Columns>
            <HeaderStyle CssClass="CTitle" />
            <EmptyDataRowStyle CssClass="emptycss" />
           
        </KS:KSGV>
       

     <KS:Page ID="Page1" runat="server" />
</asp:Content>
