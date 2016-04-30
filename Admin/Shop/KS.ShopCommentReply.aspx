<%@ Page Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.Admin.Shop.Admin_ShopCommentReply" Title="商品评价回复管理" Codebehind="KS.ShopCommentReply.aspx.cs" %>
<%@ Import Namespace="Kesion.Cache" %>
<%@ Import Namespace="Kesion.Publics" %>
<asp:Content ID="Content1" ContentPlaceHolderID="KSContent" Runat="Server">
<div id="manage_top" class="menu_top_fixed">
<span style="float:right;padding-right:5px;"><a href="KS.ShopComment.aspx" style="font-weight:bold">商品评价管理</a></span>&nbsp;<strong>评价查询：</strong>
 &nbsp;&nbsp;<strong>搜索=></strong>
    <asp:DropDownList ID="DrpSearchType" runat="server">
     <asp:ListItem Value="1">用户名称</asp:ListItem>
     <asp:ListItem Value="2">评价内容</asp:ListItem>
    </asp:DropDownList>
    <asp:TextBox ID="TxtKey"  CssClass="textbox" runat="server" Width="100px"></asp:TextBox> 
<asp:Button ID="Button1"
        runat="server" Text=" 查 找 " CssClass="button" OnClick="Button1_Click" />
</div> 
<div class="menu_top_fixed_height"></div>
<div class="tabs_header">
    <ul class="tabs">
        <li<%=KSCMS.S("logtype")==""?" class='active'":string.Empty %>><a href="KS.ShopCommentReply.aspx"><span>所有记录</span></a></li>
        <li<%=KSCMS.S("logtype")=="2"?" class='active'":string.Empty %>><a href="KS.ShopCommentReply.aspx?logType=2"><span style='color:Red;font-weight:bold'>未审核</span></a></li>
        <li<%=KSCMS.S("logtype")=="1"?" class='active'":string.Empty %>><a href="KS.ShopCommentReply.aspx?logType=1"><span>已审核</span></a></li>
    </ul>
</div>

   <asp:Panel ID="ListPannel" runat="server">
        <KS:KSGV ID="LogDeliveryView" CssClass="CTable" runat="server" AutoGenerateColumns="False" 
            DataKeyNames="FieldID" GridLines="None"
            OnRowDataBound="FieldListView_RowDataBound" Width="99%" 
            EnableTheming="True" EmptyDataText="没有找到任何商品评价回复记录!" 
            onrowcommand="LogDeliveryView_RowCommand">
            <Columns>
               <asp:TemplateField HeaderText="选择">
                <itemstyle horizontalalign="Center" width="40px" />
                <itemtemplate>
                    <input type="checkbox"  name="ids" id="ids" value="<%#Eval("id") %>" />
               </itemtemplate>
              </asp:TemplateField>
                
                 <asp:TemplateField HeaderText="评价内容">
                  <itemstyle horizontalalign="Left"  />
                 <ItemTemplate>
                 <%# Utils.CutStr(Convert.ToString(Eval("Content")),60) %>
                 </ItemTemplate>  
                </asp:TemplateField>


                <asp:BoundField DataField="UserName" HeaderText="评价人">
                  <itemstyle horizontalalign="Center" width="50px" />
                </asp:BoundField>
                
                <asp:BoundField DataField="AddDate" HeaderText="时间">
                <itemstyle horizontalalign="Center" width="100px" />
                </asp:BoundField>
              
             
                
                <asp:TemplateField HeaderText="状态">
                <itemstyle horizontalalign="Center" />
             <itemtemplate>
                <%# Convert.ToString(Eval("status"))=="1"?"<span style='color:green'>已审核</span>":"<span style='color:red'>未审核</span>" %>
               </itemtemplate>
            </asp:TemplateField>
 
                <asp:TemplateField HeaderText="↓操作">
                <itemstyle horizontalalign="Center" />
             <itemtemplate>
             <asp:LinkButton runat="server" id="showBtn" commandargument=<%#Eval("id") %> commandname="show"><img src="../../admin/images/comment.gif" align="absmiddle" border="0" title="查看详情"/>查看详情</asp:LinkButton>
               </itemtemplate>
            </asp:TemplateField>
            </Columns>
            <HeaderStyle CssClass="CTitle" />
            <EmptyDataRowStyle CssClass="emptycss" />
        </KS:KSGV>
        <br />

        
          <KS:Page ID="Page1" runat="server" />
         <asp:Panel ID="Panel1" runat="server" Height="30px">
              <div style="margin-top:5px;overflow:hidden;"></div>
            &nbsp;&nbsp;<input type="checkbox" name="chkall" id="chkall" onclick="CheckAll(this.form);"/><label for="chkall">全部选中</label>
             <input type="button" value="删除选中的评价回复" onmouseover="this.className='button_on';" onmouseout="this.className='button';" class="button" onclick="if (GetIDS('del')){this.form.action='?action=del';this.form.submit()}" />
            &nbsp;&nbsp;<asp:Button
                ID="Button2" runat="server" CssClass="button" Text="批量审核评价回复" onclick="Button2_Click"  />
          <asp:Button ID="Button3" runat="server" CssClass="button" Text="批量取消审核" onclick="Button3_Click" /></asp:Panel>   

         <br />
        <script type="text/javascript">
		showtips('<span class="state"><strong>说明：</strong><br /></span>对商品的评价内容回复进行审核，删除等操作!');
		</script>
		</asp:Panel>
		
		<asp:Panel runat="server" ID="showPannel" Visible="false">
		
		 <table width="99%" border="0" cellpadding="1" cellspacing="1" class="CTable"> 
		    <tr>
                 <td align="right" class="lefttd" style="width: 109px; height: 30px"><strong>评论人：</strong></td>
                 <td class="righttd" style="height: 30px;"><%=dr["UserName"].ToString() %>
                 </td>
             </tr>
		    <tr>
                 <td align="right" class="lefttd" style="width: 109px; height: 30px"><strong>评论时间：</strong></td>
                 <td class="righttd" style="height: 30px;"><%=dr["AddDate"].ToString()%>
                 </td>
             </tr>
		    <tr>
                 <td align="right" class="lefttd" style="width: 109px; height: 30px"><strong>评论内容：</strong></td>
                 <td class="righttd" style="height: 30px;"><%=dr["Content"].ToString().Replace("\n","<br/>")%>
                 </td>
             </tr>
		   
		    <tr>
                 <td align="right" class="lefttd" style="width: 109px; height: 30px"><strong>状态：</strong></td>
                 <td class="righttd" style="height: 30px;">
                 <%
                     if (dr["Status"].ToString() == "0")
                     {
                         Response.Write("<span style='color:red'>未审核</span>");
                     }
                     else
                     {
                         Response.Write("<span style='color:blue'>已审核</span>");
                     }
                  %>
                 </td>
             </tr>
            
		 </table>

         <div style="margin-top:20px;text-align:center">
          <input type="button" name="backBtn" class="button" value=" 返 回 " onclick="history.back()" />
         </div>

		</asp:Panel>


  </asp:Content>