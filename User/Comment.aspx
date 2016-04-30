<%@ Page Language="C#" MasterPageFile="~/User/User.master" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.User_Favorite" Title="Untitled Page" Codebehind="Comment.aspx.cs" %>
<%@ Import Namespace="Kesion.Publics" %>
<%@ Import Namespace="Kesion.Cache" %>
<asp:Content ID="Content1" ContentPlaceHolderID="KSContent" Runat="Server">
<script language="javascript" type="text/javascript">
function cancel(id)
{
  if (confirm('确定删除该评论吗?'))
  {
   location.href='?action=Delete&ids='+id;
  }
}
</script>

<div class="tabs">	
			<ul>
				<li<%=KSCMS.S("flag")=="1"||string.IsNullOrEmpty(KSCMS.S("flag"))?" class='puton'":string.Empty %>><a href="?flag=1">用户给我的评论</a></li>
				<li<%=KSCMS.S("flag")=="2"?" class='puton'":string.Empty %>><a href="?flag=2">我发表的评论</a></li>
			</ul>
</div>


    <asp:Repeater ID="Repeater1" runat="server">
    <HeaderTemplate>
         <table id="tablist" width="98%" border="0" align="center" cellpadding="2" cellspacing="1" class="border">
         <tr class="title">
          <td>选择</td>
          <td></td>
          <td>内容</td>
          <td>评论人</td>
          <td>时间</td>
          <td>操作</td>
         </tr>
    </HeaderTemplate>
    <ItemTemplate>
      <tr class="tdbg">
        <%if (flag=="2") {%>
          <td class="splittd" align="center"><input type="checkbox" name="ids" value='<%#Eval("id") %>' /></td>
          <%} %>
          <td class="splittd" align="center"><img src="images/comment.gif" /></td>
          <td class="splittd">
          评论内容:<%# GetCommentContent(Convert.ToString(Eval("Content")))%>
          <div style="margin-top:10px;color:#999999;">
          分类:<%# MyCache.GetCacheClass(Convert.ToInt16(Eval("ClassID")),1) %>&nbsp;&nbsp;标题: <%# GetSubject(Convert.ToInt16(Eval("ChannelID")),Convert.ToInt16(Eval("ClassID")),Convert.ToInt16(Eval("InfoID")),Convert.ToString(Eval("FileName")), Convert.ToString(Eval("TurnUrl")), Convert.ToString(Eval("Title")))%>
          </div>
          </td>

          <td class="splittd" align="center">
               <%#Eval("UserName") %>
          </td>
          <td class="splittd">

         <%# Utils.FormatHumanizedTime(Convert.ToDateTime(Eval("AddDate")))%>
          
          </td>
          <%if (flag=="2") {%>
          <td class="splittd" align="center">
          <div class="bt" onclick='cancel(<%#Eval("ID") %>);'>删 除</div>
          </td>
          <%} %>
      </tr>  

     </ItemTemplate>
     <FooterTemplate>
        <tr class="tdbg" style="display:<%# bool.Parse((Repeater1.Items.Count==0).ToString())?"":"none"%>">
                <td class="splittd" style="text-align:center" colspan="10">
                  没有评论记录！
                </td>
           </tr> 
    </table>
     </FooterTemplate>
    </asp:Repeater>
    <%if (flag=="2")
      { %>
    &nbsp;&nbsp;<input type="checkbox" name="chkall" id="chkall" onclick="CheckAll(this.form);"/>全选&nbsp;
    <asp:Button ID="btnDelete" CssClass="button" runat="server" Text="删除选中的评论" OnClick="btnDelete_Click" /><br />
    <%} %>
    
     <KS:Page ID="Page1" runat="server" />

</asp:Content>