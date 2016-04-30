<%@ Page Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.Admin_Content_Comment" Title="Untitled Page" Codebehind="KS.Comment.aspx.cs" %>
<%@ Import Namespace="Kesion.Publics"%>
<asp:Content ID="Content1" ContentPlaceHolderID="KSContent" Runat="Server">
       <div id="manage_top" class="menu_top_fixed">
          <ul>
           <li id='p1'><asp:LinkButton ID="vbt" runat="server" OnClick="vbt_Click"><b></b>审核评论</asp:LinkButton></li>
           <li id='p13'><asp:LinkButton ID="cvbt" runat="server" OnClick="cvbt_Click"><b></b>取消审核</asp:LinkButton></li>
           <li id='p3'><asp:LinkButton ID="dbt" runat="server" OnClick="dbt_Click"><b></b>删除评论</asp:LinkButton></li>
          
             <%if (showType == 3)
            { %>
               <li id='p1'><asp:LinkButton ID="LinkButton1" runat="server" OnClientClick="return(GetIDS());" OnClick="Button3_Click"><b></b>批量设置正常评论</asp:LinkButton></li>
          <%} %>
               
           <div id='go'><asp:DropDownList ID="S_ChannelID" runat="server">
           <asp:ListItem Value="0">---分模型搜索---</asp:ListItem>
              </asp:DropDownList></div>
           </ul>
       </div> 
        <div class="menu_top_fixed_height"></div> 
<div class="tabs_header">
    <ul class="tabs">
    <li<%=KSCMS.S("showType")==""?" class='active'":string.Empty %>><a href="KS.Comment.Aspx"><span>所有评论</span></a></li>
    <li<%=KSCMS.S("showType")=="1"?" class='active'":string.Empty %>><a href="KS.Comment.Aspx?showType=1"><span>未审核的评论</span></a></li>
    <li<%=KSCMS.S("showType")=="2"?" class='active'":string.Empty %>><a href="KS.Comment.Aspx?showType=2"><span>已审核的评论</span></a></li>
    <li<%=KSCMS.S("showType")=="3"?" class='active'":string.Empty %>><a href="KS.Comment.Aspx?showType=3"><span>被举报的评论</span></a></li>
    </ul>
</div>
     
<KS:KSGV ID="list" cssclass="CTable" runat="server"  AutoGenerateColumns="False" PagerType="CustomNumeric" Width="99%" EmptyDataText="没有任何评论！" GridLines="None" OnRowDataBound="list_RowDataBound" OnRowCommand="list_RowCommand" OnRowCreated="list_RowCreated" AllowPaging="false" >
          <Columns>
               <asp:TemplateField HeaderText="&lt;input type='checkbox' name='chkall' id='chkall' onClick='CheckAll(this.form);'/&gt;">
                <ItemStyle HorizontalAlign="Center"  Width="30px"/>
                <ItemTemplate>
                <input type="checkbox"  name="ids" id="ids" value="<%#Eval("id") %>" />
                </ItemTemplate>
                </asp:TemplateField>
              <asp:TemplateField HeaderText="评论内容">
                  <itemtemplate>
                    <span class="plicon"></span>
                    <span style="cursor:pointer" onmousedown='parent.openWin("查看评论详情","content/KS.CommentShow.aspx?ID="+<%# Eval("ID") %>,false);return false;'>
                    <%# CutTitle(Convert.ToString(Eval("Content")),Convert.ToString(Eval("Reports"))) %>
                    </span>
               </itemtemplate>
              </asp:TemplateField>
              <asp:BoundField DataField="UserName" HeaderText="用户昵称" >
                  <itemstyle width="60px" horizontalalign="Center" />
              </asp:BoundField>
              <asp:BoundField DataField="Anonymous" HeaderText="身份" >
                  <itemstyle horizontalalign="Center" width="50px" />
              </asp:BoundField>
              <asp:BoundField DataField="UserIP" HeaderText="用户IP" >
                  <itemstyle horizontalalign="Center" width="80px" />
              </asp:BoundField>
              <asp:BoundField DataField="AddDate" HtmlEncode="False" DataFormatString="{0:d}" HeaderText="发表时间" >
                  <itemstyle horizontalalign="Center" width="100px" />
              </asp:BoundField>
              <asp:BoundField Visible="false" DataField="Support" HtmlEncode="False" DataFormatString="&lt;font color=red&gt;{0}&lt;/font&gt; 票" HeaderText="支持" >
                  <itemstyle horizontalalign="Center" width="60px" />
              </asp:BoundField>
               <asp:BoundField Visible="false" DataField="Opposition" HtmlEncode="False" DataFormatString="&lt;font color=ff6600&gt;{0}&lt;/font&gt; 票" HeaderText="反对" >
                  <itemstyle horizontalalign="Center" width="60px" />
              </asp:BoundField>


              <asp:TemplateField HeaderText="状态">
              <itemstyle width="30px" horizontalalign="Center"/>
              <itemtemplate>
                   <a href="?action=verify&id=<%#Eval("ID")%>" <%# Convert.ToString(Eval("verify"))=="0"?"class='no' title='未审核'":"class='ok' title='已审核'" %>></a>
              </itemtemplate>
            </asp:TemplateField>

              <asp:TemplateField HeaderText="查看">
                    <itemstyle width="30px" horizontalalign="Center"/>
                                <itemtemplate>
             <a href="#" class="preview" onclick='ShowComment(<%# Eval("ID") %>);return false;'></a>
                    </itemtemplate>
                </asp:TemplateField>
              <asp:TemplateField HeaderText="删除">
                    <itemstyle width="30px" horizontalalign="Center"/>
                                <itemtemplate>
             <asp:LinkButton runat="server" id="delete" CssClass="delete" commandargument=<%#Eval("id") %> commandname="del" ToolTip="删除"></asp:LinkButton>
                    </itemtemplate>
                </asp:TemplateField>


          </Columns>
            <HeaderStyle CssClass="CTitle" />
            <EmptyDataRowStyle CssClass="emptycss" />
      </KS:KSGV>

      <script>
          function ShowComment(id) {
              top.openWin('查看评论详情', 'content/KS.CommentShow.aspx?id=' + id, false, 780, 480);
          }
      </script>
  
          
          <KS:Page ID="Page1" runat="server" />
        <script type="text/javascript">
            showtips(' <span class="state"><strong>说明：</strong><br /></span>如果设置了评论奖励积分，那么审核通过后将直接给评论人加积分，之前评论被删除或是取消审核，送出去的积分将不能返回!');
		</script>

          
              
</asp:Content>

