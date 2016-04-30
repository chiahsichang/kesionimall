<%@ Page Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.Admin_User_LogRecharge" Title="Untitled Page" Codebehind="KS.LogRecharge.aspx.cs" %>
<%@ Import Namespace="Kesion.Publics"%>
<asp:Content ID="Content1" ContentPlaceHolderID="KSContent" Runat="Server">
<div id="manage_top" class="menu_top_fixed">&nbsp;<strong>在线充值记录管理</strong>
 &nbsp;&nbsp;<strong>用户名：</strong><asp:TextBox ID="TxtKeyWord" runat="server" CssClass="textbox" />
<asp:Button ID="BtnSearch" runat="server" Text="快速搜索" CssClass="button" 
        onclick="BtnSearch_Click" />
</div>
 <div class="menu_top_fixed_height"></div>  



 <div class="tabs_header">
    <ul class="tabs">
    <li<%=KSCMS.S("status")==""?" class='active'":string.Empty %>><a href="KS.LogRecharge.aspx?<%=UtilsQueryParam.Get("status") %>"><span>所有记录</span></a></li>
    <li<%=KSCMS.S("status")=="2"?" class='active'":string.Empty %>><a href="KS.LogRecharge.aspx?status=2&<%=UtilsQueryParam.Get("status") %>"><span>支付成功，未入账</span></a></li>
    <li<%=KSCMS.S("status")=="1"?" class='active'":string.Empty %>><a href="KS.LogRecharge.aspx?status=1&<%=UtilsQueryParam.Get("status") %>"><span>支付成功，已入账</span></a></li>
    <li<%=KSCMS.S("status")=="0"?" class='active'":string.Empty %>><a href="KS.LogRecharge.aspx?status=0&<%=UtilsQueryParam.Get("status") %>"><span>未支付</span></a></li>
    </ul>
</div>

    <asp:GridView runat="server" cssclass="CTable" ID="grvList" EmptyDataText="没有充值记录！" AutoGenerateColumns="False" GridLines="None"  Width="99%" OnRowDataBound="grvList_RowDataBound" ShowFooter="True">
            <HeaderStyle CssClass="CTitle" />
        <EmptyDataRowStyle CssClass="emptycss" />
        <Columns>
           <asp:TemplateField HeaderText="操作">
                <ItemStyle HorizontalAlign="Center" />
                <itemtemplate>
                       <%# Container.DataItemIndex + 1 + (CurrPage - 1) * pagesize%>、                 
               </itemtemplate>
                </asp:TemplateField>     
            <asp:BoundField DataField="OrderID" HeaderText="充值单号" >
                <ItemStyle HorizontalAlign="Left" />
            </asp:BoundField>
            <asp:BoundField DataField="UserName" HeaderText="用户名" >
                <ItemStyle HorizontalAlign="Center" />
            </asp:BoundField>
            <asp:BoundField DataField="AddDate" HeaderText="时间" >
                <ItemStyle HorizontalAlign="Center" />
            </asp:BoundField>

            <asp:BoundField DataField="paymoney" HeaderText="充值金额（元）" HtmlEncode="False" DataFormatString="{0:n2}">
                <ItemStyle HorizontalAlign="Right" />
            </asp:BoundField>
            <asp:BoundField DataField="realmoney" HeaderText="实收金额（元）" HtmlEncode="False" DataFormatString="{0:n2}">
                <ItemStyle HorizontalAlign="Right" />
            </asp:BoundField>
            <asp:BoundField DataField="status" HeaderText="状态" >
                <ItemStyle HorizontalAlign="Center" />
            </asp:BoundField>
            <asp:BoundField DataField="PlatName" HeaderText="支付平台" >
                <ItemStyle HorizontalAlign="Center" />
            </asp:BoundField>
              <asp:TemplateField HeaderText="操作">
                <ItemStyle Height="30px" HorizontalAlign="Center" />
                <itemtemplate>
                 <%# Convert.ToInt16(Eval("status"))==2?"<a href='?action=addmoney&id="+Eval("id")+@"' onclick=""return(confirm('此操作不可逆，确定收到款项了吗？'));"">入账</a>":"" %>
                 <%# Convert.ToInt16(Eval("status"))!=2?"<a href='?action=del&id="+Eval("id")+@"' onclick=""return(confirm('此操作不可逆，确定删除吗？'))"">删除</a>":"" %>
                 
               </itemtemplate>
                </asp:TemplateField>
        </Columns>

</asp:GridView>
     <KS:Page ID="Page1" runat="server" />
     
     <div style="border:1px dashed #cccccc; background-color:#f0f9fe; margin-top:10px;padding:10px; text-align: left; font-size: 12px;">
     <strong>特别提醒：</strong> 如果明细表记录太多，影响了系统性能，可以删除一定时间段前的记录以加快速度。但可能会带来会员无法查看以前的历史充值记录。 充值成功，未入账的记录是不能删除的。
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


