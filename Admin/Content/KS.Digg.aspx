<%@ Page Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.Admin_Content_Digg" Title="Untitled Page" Codebehind="KS.Digg.aspx.cs" %>
<%@ Import Namespace="Kesion.Cache" %>
<asp:Content ID="Content1" ContentPlaceHolderID="KSContent" Runat="Server">
<ul id="manage_top" class="menu_top_fixed">
 <table border=0 width="100%" cellpadding="0" cellspacing="0">
  <tr>
  <td align="center">
   <b>查看详细推荐记录</b>
  </td>
  </tr>
  </table>
</ul>
<div class="menu_top_fixed_height"></div> 
    <KS:KSGV ID="List" runat="server" Width="99%" CssClass="CTable" PagerType="CustomNumeric" OnRowDataBound="List_RowDataBound" AutoGenerateColumns="False" EmptyDataText="没用digg记录！" GridLines="None" OnRowCommand="List_RowCommand">
        <Columns>
            <asp:TemplateField HeaderText="选择">
                <itemstyle width="45px" HorizontalAlign="Center" />
                <itemtemplate>
                <input type="checkbox"  name="ids" value="<%#Eval("id") %>" />
             </itemtemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="title" HeaderText="被推荐的项目" />
            <asp:BoundField DataField="username" HeaderText="推荐用户">
            <itemstyle width="70px" HorizontalAlign="Center"/>
            </asp:BoundField>
            <asp:BoundField DataField="diggtime" HeaderText="推荐时间">
            <itemstyle width="120px" HorizontalAlign="Center" />
            </asp:BoundField>
            <asp:BoundField DataField="UserIP" HeaderText="推荐用户IP">
            <itemstyle width="100px" HorizontalAlign="Center" />
            </asp:BoundField>
            <asp:TemplateField HeaderText="类型">
                <itemstyle width="45px" HorizontalAlign="Center" />
                <itemtemplate>
                <%#Convert.ToString(Eval("DiggType"))=="0"?"<font color=green>支持</font>":"<font color=blue>反对</font>"  %>
             </itemtemplate>
            </asp:TemplateField>

            <asp:TemplateField HeaderText="↓详细信息">
            <itemstyle HorizontalAlign="center" />
            <itemtemplate>
            <a href="<%# Kesion.HtmlTags.BasicField.GetItemUrl(ChannelID,Convert.ToInt32(Eval("InfoID"))) %>" target="_blank">浏览<%=MyCache.GetCacheModel(ChannelID,5) %></a>
            | <asp:LinkButton runat="server" CommandName="del" CommandArgument='<%# Eval("id") %>'>删除</asp:LinkButton>      
            </itemtemplate>
            </asp:TemplateField>
        </Columns>
        <EmptyDataRowStyle CssClass="emptycss" />
        <HeaderStyle CssClass="CTitle" />
    </KS:KSGV>

    <asp:Panel ID="Panel1" runat="server" Width="100%">
    <table cellpadding="0" cellspacing="0" style="width: 100%;margin-top:10px">
            <tr>
                <td style="height: 25px; width: 314px;">
                    &nbsp;<strong>选择：</strong><a href="javascript:Select(0);"><font color="#999999">全选</font></a> - <a href="javascript:Select(1);"><font color="#999999">反选</font></a> - <a href="javascript:Select(2);"><font color="#999999">不选</font></a>
                    &nbsp; &nbsp; &nbsp;<asp:Button ID="Button1" runat="server" Text="删除选中的文章" OnClick="Button1_Click" /></td>
            </tr>
        </table>
         <KS:Page ID="Page1" runat="server" />
    </asp:Panel>
    <br />
    <br />
</asp:Content>

