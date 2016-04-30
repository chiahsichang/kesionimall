<%@ Page Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.Admin_User_LogScore" Title="积分明细表" Codebehind="KS.LogScore.aspx.cs" %>
<%@ Import Namespace="Kesion.Cache" %>
<%@ Import Namespace="Kesion.Publics" %>
<asp:Content ID="Content1" ContentPlaceHolderID="KSContent" Runat="Server">
 
 <div id="manage_top" class="menu_top_fixed">&nbsp;<strong>积分明细管理</strong>
 &nbsp;&nbsp;<strong>用户名：</strong><asp:TextBox ID="TxtKeyWord" runat="server" CssClass="textbox" />
<asp:DropDownList runat="server" ID="DrpInOrOut">
 <asp:ListItem Value="0" Selected="true">所有</asp:ListItem>
 <asp:ListItem Value="1">收入</asp:ListItem>
 <asp:ListItem Value="2">支出</asp:ListItem>
</asp:DropDownList>
<asp:Button ID="BtnSearch" runat="server" Text="快速搜索" CssClass="button" 
        onclick="BtnSearch_Click" />
</div>
 <div class="menu_top_fixed_height"></div>  

 
   <div class="tabs_header">
   <%if (!string.IsNullOrEmpty(KSCMS.S("userName"))){ %>
            <span style="float:right;padding-right:10px;">查看用户<span style='color:red'><%=KSCMS.S("userName")%></span>的积分明细</span>
      <%} %>
    <ul class="tabs">
    <li><a href="KS.LogMoney.aspx"><span>预付款明细</span></a></li>
    <li><a href="KS.Consumer.aspx"><span><%=MyCache.GetCacheConfig(49) %>明细</span></a></li>
    <li class='active'><a href="KS.LogScore.aspx"><span>积分明细</span></a></li>
    </ul>
</div>


    <asp:GridView runat="server" ID="grvList" CssClass="CTable" AutoGenerateColumns="False" EmptyDataText="没有积分明细记录！" GridLines="None"  Width="99%" OnRowDataBound="grvList_RowDataBound" ShowFooter="True">
            <HeaderStyle CssClass="CTitle" />
        <EmptyDataRowStyle CssClass="emptycss" />
        <Columns>
            <asp:BoundField DataField="UserName" HeaderText="用户名" >
                <ItemStyle HorizontalAlign="Center" />
            </asp:BoundField>
            <asp:BoundField DataField="AddDate" HeaderText="发生时间" >
                <ItemStyle HorizontalAlign="Center" />
            </asp:BoundField>
            <asp:BoundField DataField="IP" HeaderText="IP地址" >
                <ItemStyle HorizontalAlign="Center" />
            </asp:BoundField>
            <asp:BoundField DataField="Score" HeaderText="收入" HtmlEncode="False">
                <ItemStyle HorizontalAlign="Left" />
            </asp:BoundField>
            <asp:BoundField DataField="Score" HeaderText="支出" HtmlEncode="False">
                <ItemStyle HorizontalAlign="Left" />
            </asp:BoundField>
            <asp:BoundField DataField="InorOutFlag" HeaderText="摘要" >
                <ItemStyle HorizontalAlign="Center" />
            </asp:BoundField>
            <asp:BoundField DataField="Inputer" HeaderText="操作员" >
                <ItemStyle HorizontalAlign="Center" />
            </asp:BoundField>
            
            
            <asp:TemplateField HeaderText="余额">
            <itemstyle Height="30px" horizontalalign="Center" />
            <itemtemplate>
                累计<%# Eval("NowScore") %>分 可用<font color=green><%# Eval("AvailableScore")%></font>分
            </itemtemplate>
            </asp:TemplateField>
            
            <asp:TemplateField HeaderText="备注">
            <itemstyle horizontalalign="Left" width="300px"/>
            <itemtemplate>
                <span class="tips"><%# Eval("Remark") %></span>
            </itemtemplate>
            </asp:TemplateField>
            
        </Columns>

</asp:GridView>
     <KS:Page ID="Page1" runat="server" />
     
     <div style="border:1px dashed #cccccc; background-color:#f0f9fe; margin-top:10px;padding:10px; text-align: left; font-size: 12px;">
     <strong>特别提醒：</strong> 如果明细表记录太多，影响了系统性能，可以删除一定时间段前的记录以加快速度。但可能会带来会员在查看以前收过费的信息时重复收费（这样会引发众多消费纠纷问题），无法通过明细记录来真实分析会员的消费习惯等问题。 
     <div>
     <strong>删除范围：</strong><asp:RadioButtonList ID="RdbDelType" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow">
      <asp:ListItem Value="1">10天前</asp:ListItem>
      <asp:ListItem Value="2">1个月前</asp:ListItem>
      <asp:ListItem Value="3">2个月前</asp:ListItem>
      <asp:ListItem Value="4">3个月前</asp:ListItem>
      <asp:ListItem Value="5">6个月前</asp:ListItem>
      <asp:ListItem Value="6" Selected>1年前</asp:ListItem>
         </asp:RadioButtonList>
         <asp:Button ID="BtnDel" runat="server" Text="执行删除" OnClick="BtnDel_Click" CssClass="button" /></div>
     </div>
</asp:Content>


