<%@ Page Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" CodeBehind="KS.PKZTYJ.aspx.cs" Inherits="Kesion.NET.WebSite.Admin.Common.PKZTYJ" Title="无标题页" %>
<%@ Import Namespace="Kesion.Publics" %>
<asp:Content ID="Content1" ContentPlaceHolderID="KSContent" runat="server">
    <KS:TopNav ID="TopNav1" runat="server" />
    
    
    <div class="tabs_header">
        <ul class="tabs">
        <li<%=KSCMS.S("showType")==""?" class='active'":string.Empty %>><a href="KS.PKZTYJ.aspx"><span>所有观点</span></a></li>
        <li<%=KSCMS.S("showType")=="1"?" class='active'":string.Empty %>><a href="KS.PKZTYJ.aspx?showType=1"><span>未审核的观点</span></a></li>
        <li<%=KSCMS.S("showType")=="2"?" class='active'":string.Empty %>><a href="KS.PKZTYJ.aspx?showType=2"><span>已审核的观点</span></a></li>
        </ul>
    </div>
    
    <asp:GridView ID="grvList" cssclass="CTable" runat="server" EmptyDataText="没有用户提交观点！" AutoGenerateColumns="False" GridLines="None" Width="99%" OnRowDataBound="GridView1_RowDataBound" OnRowCommand="grvList_RowCommand">
       <HeaderStyle CssClass="CTitle" />
        <EmptyDataRowStyle CssClass="emptycss" />
           <Columns>
            <asp:TemplateField HeaderText="选择">
                <itemstyle horizontalalign="Center" width="50px" />
                <itemtemplate>
                 <input type="checkbox"  name="ids" id="ids" value="<%#Eval("id") %>" />
                </itemtemplate>
               </asp:TemplateField>
            <asp:TemplateField HeaderText="状态">
              <itemstyle width="30px" horizontalalign="Center"/>
              <itemtemplate>
                   <a href="?action=status&id=<%#Eval("id")%>" <%# Convert.ToString(Eval("status"))=="0"?"class='no' title='未审核'":"class='ok' title='已审核'" %>></a>
              </itemtemplate>
            </asp:TemplateField>

               <asp:TemplateField HeaderText="内容">
                <ItemTemplate>
                <span style="cursor:pointer" onmousedown='parent.openWin("查看PK观点详情","common/KS.PKGDShow.aspx?ID="+<%# Eval("ID") %>,false,600,400);return false;'><%# Utils.GetSubString(Convert.ToString(Eval("Content")), 40, "...") %></span>
                </ItemTemplate>
               </asp:TemplateField>
               <asp:TemplateField HeaderText="PK主题">
                <ItemTemplate>
                 <a href='../../plus/pk/pk.aspx?id=<%#Eval("pkid") %>' target='_blank'><%#Eval("Title") %></a>
                </ItemTemplate>
               </asp:TemplateField>
               <asp:BoundField DataField="UserName" HeaderText="用户" >
                   <ItemStyle HorizontalAlign="Center" />
               </asp:BoundField>
               <asp:BoundField DataField="AddDate" HeaderText="时间" >
                   <ItemStyle HorizontalAlign="Center" />
               </asp:BoundField>
               <asp:BoundField DataField="Role" HeaderText="观点" >
                   <ItemStyle HorizontalAlign="Center" />
               </asp:BoundField>
              <asp:TemplateField HeaderText="删除">
              <itemstyle width="30px" horizontalalign="Center"/>
              <itemtemplate>
                 <asp:LinkButton ToolTip="删除" CssClass="delete" ID="LKBDel" runat="server" commandargument='<%#Eval("id") %>' commandname="del"></asp:LinkButton>
              </itemtemplate>
            </asp:TemplateField>
              
           </Columns>
           <HeaderStyle CssClass="CTitle" />
            <EmptyDataRowStyle CssClass="emptycss" />
     </asp:GridView>
     
     <div style="margin-top:5px;overflow:hidden;"></div>
            &nbsp;&nbsp;<input type="checkbox" name="chkall" id="chkall" onclick="CheckAll(this.form);"/><label for="chkall">全部选中</label>
             <input type="button" value="删除选中的观点" onmouseover="this.className='button_on';" onmouseout="this.className='button';" class="button" onclick="if (GetIDS('del')){this.form.action='?action=del';this.form.submit()}" />
            &nbsp;&nbsp;<asp:Button
                ID="Button1" runat="server" Text="批量审核观点" OnClick="Button1_Click" />
          <asp:Button ID="Button2" runat="server" Text="批量取消审核" OnClick="Button2_Click" />
     
    <KS:Page ID="Page1" runat="server" />

</asp:Content>
