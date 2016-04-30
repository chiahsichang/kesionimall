<%@ Page Language="C#" MasterPageFile="~/User/User.master" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.MyTopic" Title="Untitled Page" Codebehind="MyTopic.aspx.cs" %>
<%@ Import Namespace="Kesion.Cache" %>
<%@ Import Namespace="Kesion.Publics" %>
<%@ Import Namespace="Kesion.HtmlTags" %>
<asp:Content ID="Content1" ContentPlaceHolderID="KSContent" Runat="Server">
   

<div class="tabs">	
			<ul>
				<li<%=KSCMS.S("flag")==""?" class='puton'":string.Empty %>><a href="MyTopic.aspx">我发布的话题</a></li>
				<li<%=KSCMS.S("flag")=="1"?" class='puton'":string.Empty %>><a href="MyTopic.aspx?flag=1">我参与的话题</a></li>
			</ul>
</div>      

<asp:Panel ID="PanAsk" runat="server">
    <asp:Repeater ID="Repeater1" runat="server">
    <HeaderTemplate>
         <table id="tablist" width="98%" border="0" align="center" cellpadding="2" cellspacing="1" class="border">
      <tr align="center" class="title">
        	<td width="50" align="center">选择</td>
        	<td align="center">话题</td>
        	<td align="center" nowrap>回复/浏览</td>
            <td align="center">作者</td>
            <td align="center">操作</td>
        </tr>
    </HeaderTemplate>
    <ItemTemplate>
      <tr class="tdbg">
          <td class="splittd" align="center"><input type="checkbox" name="ids" value="<%#Eval("TopicID") %>" /></td>
          <td class="splittd"> 
           <a href="<%#BasicField.GetClubShowUrl(Utils.StrToInt(Eval("topicid"))) %>" target="_blank"><%# Utils.CutStr(Utils.RemoveHtml(Convert.ToString(Eval("Content"))), 80)%></a>
           <div class="tips">发布时间：<%# Utils.FormatHumanizedTime(Convert.ToDateTime(Eval("AddDate")))%> 是否审核：<%#Convert.ToString(Eval("verify"))=="1"?"<span style='color:green'>已审核</span>":"<span style='color:red'>未审核</span>" %> 版面：<%# MyCache.GetCacheBBSCategory(Convert.ToInt32(Eval("boardId")), "boardname") %></div>
          </td>
         
          <td class="splittd" style="text-align:center"><%# Eval("PostNum") %>/<%# Eval("Hits") %></td>
          <td class="splittd" style="text-align:center"><%# Eval("UserName") %></td>
          <td class="splittd" style="text-align:center">
               <%# MyCache.GetBBSCacheConfig(15).Equals("0") ? "---" : " <div class=\"bt\"><a onclick=\"return(confirm('确定删除吗？'));\" href='?action=delete&ids=" + Eval("topicid") + "'>删除</a></div>"%>
           </td>
      </tr>  
     </ItemTemplate>
     <FooterTemplate>
         <tr class="tdbg" style="display:<%# bool.Parse((Repeater1.Items.Count==0).ToString())?"":"none"%>">
                <td class="splittd" style="text-align:center" colspan="10">
                  没有记录！
                </td>
           </tr> 
      </table>
     </FooterTemplate>
    </asp:Repeater>
     &nbsp;&nbsp; &nbsp;&nbsp;
    &nbsp;&nbsp;<input type="checkbox" name="chkall" id="chkall" onclick="CheckAll(this.form);"/>全选  <asp:Button ID="ButtonRemove" CssClass="button" runat="server" Text="删 除" OnClick="ButtonRemove_Click"/>
   <br />
    
     <KS:Page ID="Page1" runat="server" />
</asp:Panel>



<asp:Panel ID="PanAnswer" runat="server" Visible="false">
 <asp:Repeater ID="Repeater2" runat="server">
    <HeaderTemplate>
         <table id="tablist" width="98%" border="0" align="center" cellpadding="2" cellspacing="1" class="border">
      <tr align="center" class="title">
        	<td width="50" align="center">序号</td>
        	<td align="center">话题</td>
            <td align="center">回复/浏览</td>
            <td align="center">操作</td>
        </tr>
    </HeaderTemplate>
    <ItemTemplate>
      <tr class="tdbg">
          <td class="splittd" align="center">
              <%# Container.ItemIndex + 1%> 
</td>
          <td class="splittd"><a href="<%#BasicField.GetClubShowUrl(Utils.StrToInt(Eval("topicid"))) %>" target="_blank"><%# Utils.CutStr(Utils.RemoveHtml(Convert.ToString(Eval("Subject"))), 80)%></a>
           <div class="tips">我的回复：<%# Utils.CutStr(Utils.RemoveHtml(Convert.ToString(Eval("Content"))),80)%></div>
           <div class="tips">发表时间：<%# Utils.FormatHumanizedTime(Convert.ToDateTime(Eval("AddDate")))%> 作者：<%#Eval("userName") %> 版面：<%# MyCache.GetCacheBBSCategory(Convert.ToInt32(Eval("boardId")), "boardname") %></div>
           
          </td>
           <td class="splittd" style="text-align:center"><%# Eval("PostNum") %>/<%# Eval("Hits") %></td>
          <td class="splittd" align="center">
               <%# MyCache.GetBBSCacheConfig(20).Equals("0") ? "---" : " <div class=\"bt\"><a onclick=\"return(confirm('确定删除吗？'));\" href='?action=deleteanswer&ids="+Eval("postid")+"&topicid=" + Eval("topicid") + "'>删除</a></div>"%>
           </td>

      </tr>  

     </ItemTemplate>
     <FooterTemplate>
         <tr class="tdbg" style="display:<%# bool.Parse((Repeater2.Items.Count==0).ToString())?"":"none"%>">
                <td class="splittd" style="text-align:center" colspan="10">
                  没有参与任何话题讨论！
                </td>
           </tr> 
      </table>
     </FooterTemplate>
    </asp:Repeater>
   <br />
    
     <KS:Page ID="Page2" runat="server" />

</asp:Panel>


</asp:Content>