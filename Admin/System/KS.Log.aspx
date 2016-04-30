<%@ Page Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.Admin_Log"  Title="查看系统日志" Codebehind="KS.Log.aspx.cs" %>
<%@ Register TagPrefix="KS" Namespace="Kesion.Controls" Assembly="Kesion.Controls" %>

<asp:Content ID="Content1" ContentPlaceHolderID="KSContent" Runat="Server">
        <div id="manage_top" class="menu_top_fixed">
          <ul>
            <li id='p3'><asp:LinkButton ID="delall" runat="server" OnClick="LinkButton1_Click"><b></b>删除全部</asp:LinkButton></li>
            <li id='p3'><asp:LinkButton ID="LinkButton3" runat="server" OnClientClick="return(confirm('此操作不可逆，确定删除选中的记录吗?'))" OnClick="Button2_Click"><b></b>删除选中</asp:LinkButton></li>
              <li id='p9'><asp:LinkButton ID="LinkButton2" runat="server" OnClick="LinkButton2_Click"><b></b>倒序查看</asp:LinkButton></li>
            <li id='p7'><asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click1"><b></b>导出到Excel</asp:LinkButton></li>
          </ul>
        </div>     
         <div class="menu_top_fixed_height"></div>  
        <KS:KSGV ID="LogListView"  cssclass="CTable" runat="server" AutoGenerateColumns="False" EmptyDataText="暂无操作日志！"
            OnRowDataBound="LogListView_RowDataBound" Width="100%" GridLines="None"  DataKeyNames="id">
            <Columns>
                <asp:TemplateField HeaderText="<input type='checkbox' name='chkall' id='chkall' onclick='CheckAll(this.form);'/>">
                <ItemStyle HorizontalAlign="Center"  Width="30" />
                <ItemTemplate>
                <input type="checkbox"  name="ids" value="<%#Eval("id") %>" />
                </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="Username" HeaderText="操作员">
                 <ItemStyle HorizontalAlign="Center"  />
                </asp:BoundField>
                <asp:BoundField DataField="ActionIP" HeaderText="操作IP">
                 <ItemStyle Width="100px" />
                </asp:BoundField>
                <asp:BoundField DataField="actiontime" HeaderText="操作时间">
                <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                 <asp:TemplateField HeaderText="描述">
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
