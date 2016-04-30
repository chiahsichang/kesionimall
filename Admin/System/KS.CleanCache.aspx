<%@ Page Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.Admin_System_CleanCache" Title="Untitled Page" Codebehind="KS.CleanCache.aspx.cs" %>
<asp:Content ID="Content1" ContentPlaceHolderID="KSContent" Runat="Server">
  
   <div id="manage_top" style="padding-left:10px;text-align:left" class="toptitle menu_top_fixed">
             <input type="checkbox" name="chkall" id="chkall" onclick="CheckAll(this.form);"/><label for="chkall">全部选中</label>
            <asp:Button ID="DelButton" CssClass="button" runat="server" Text="更新选中的缓存" OnClick="DelButton_Click" />
            <asp:Button ID="Button1" CssClass="button" runat="server" Text="更新所有缓存" OnClick="Button1_Click" />
        </div>
   <div class="menu_top_fixed_height"></div> 

   
   
   
    <asp:Panel ID="ListPanel" runat="server" Width="100%">

        <KS:KSGV ID="List" runat="server" CssClass="CTable" AutoGenerateColumns="False" EmptyDataText="暂无缓存列表"
            OnRowDataBound="LogListView_RowDataBound" Width="99%" GridLines="None" PagerType="CustomNumeric" PageSize="20" OnRowCommand="List_RowCommand">
            <Columns>
                <asp:TemplateField HeaderText="选择">
                <ItemStyle HorizontalAlign="Center"  Width="60px"/>
                <ItemTemplate>
                <input type="checkbox"  name="ids" value="<%#Eval("path") %>" />
               </ItemTemplate>
                    
                </asp:TemplateField>
                <asp:BoundField DataField="name" HeaderText="缓存名称">
                 <ItemStyle Width="200px" font-bold="True" />
                </asp:BoundField>
                <asp:BoundField DataField="path" HeaderText="缓存路径">
                 <ItemStyle Width="160px"  forecolor="blue"/>
                </asp:BoundField>
                <asp:BoundField DataField="type" HeaderText="缓存类型">
                 <ItemStyle Width="60px" horizontalalign="Center" />
                </asp:BoundField>
                <asp:TemplateField HeaderText="操作">
                 <ItemStyle horizontalalign="Center" />
                <ItemTemplate>
                 <asp:LinkButton runat="server" id="view" CommandArgument=<%#Eval("path")+"#"+Eval("type") %>  CommandName="view">查看缓存内容</asp:LinkButton>
                
                 <asp:LinkButton runat="server" id="upcache" CommandArgument=<%#Eval("path") %>  CommandName="modify"><font color=red><b>更新缓存</b></font></asp:LinkButton>
                 
                </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            <HeaderStyle CssClass="CTitle" />
        </KS:KSGV>
        
        

        
 </asp:Panel>
        
<asp:Panel ID="ShowStrPanel" runat="server" Visible="false" Width="100%">
    <table width="100%" border="0" cellpadding="1" cellspacing="1" class="CTable"> 
          <tr>
            <td class="lefttd" align="right" style="width: 198px; height: 30px;"><b>缓存路径：</b></td>
            <td class="righttd" style="height: 30px">
                &nbsp;<asp:TextBox ID="CacheName" runat="server" Width="268px"></asp:TextBox>
                </td>
          </tr>
        <tr>
            <td align="right" class="lefttd" height="30" style="width: 198px">
                <strong>缓存内容：</strong></td>
            <td class="righttd">
                &nbsp;<asp:TextBox ID="CacheContent" runat="server" Width="422px" Height="165px" TextMode="MultiLine"></asp:TextBox></td>
        </tr>
        </table>
      <div style="text-align:center">
       <br />
      <input type="button" value="返回上一级" name="button1" class="button" onclick="javascript:history.back();" />
      </div>
</asp:Panel>
    
<asp:Panel ID="ShowDataTablePanel" runat="server" Visible="false" Width="100%">
          <KS:KSGV ID="KSGV1" runat="server" Width="100%" EmptyDataText="缓存数据不存在！" GridLines="None" OnRowDataBound="KSGV1_RowDataBound" AllowPaging="True" OnPageIndexChanging="KSGV1_PageIndexChanging" PageSize="20">
                      <HeaderStyle CssClass="CTitle" />
              <EmptyDataRowStyle CssClass="emptycss" />

          </KS:KSGV>

      <div style="text-align:center">
       <br />
      <input type="button" value="返回上一级" name="button1" class="button" onclick="history.back();" />
      </div>
    </asp:Panel>

</asp:Content>

