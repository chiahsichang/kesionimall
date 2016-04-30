<%@ Page Title="" Language="C#" MasterPageFile="~/User/User.master" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.User_MyTrainingSJ" Codebehind="MyTrainingSJ.aspx.cs" %>
<%@ Import Namespace="Kesion.Cache" %>
<%@ Import Namespace="Kesion.Publics" %>
<%@ Import Namespace="Kesion.BLL" %>

<asp:Content ID="Content1" ContentPlaceHolderID="KSContent" Runat="Server">



<asp:Panel ID="PanList" runat="server">
   <div style="padding:5px;color:#fff;border:0px;font-size:20px;font-weight:bold;background:url(../images/usertu6.gif);"><img src="../images/friends.png" align="middle" />当前[<%=MyCache.GetCacheSJCategory(classId,"classname") %>]练习场</div>
  
  <div style="margin-top:5px">
  <strong>
  搜索试卷：
  </strong>
  试卷名称<asp:TextBox ID="TxtKeyWord" CssClass="textbox" runat="server"></asp:TextBox>
  <input type="button" value="搜索试卷" class="button" onclick="dosearch();" />
  
  </div>
  <script>
      function dosearch() {
          location.href = '?classid=<%=classId %>&key='+$('#<%=this.TxtKeyWord.ClientID %>').val();
      }
  </script>
<div class="tabs">	
	<ul>
      <%=ShowBySJType()%>
	</ul>
</div>  
    <asp:Repeater ID="Repeater1" runat="server">
    <HeaderTemplate>
         <table id="tablist" width="99%" border="0" align="center" cellpadding="2" cellspacing="1" class="border">
    </HeaderTemplate>
    <ItemTemplate>
      <tr class="tdbg">
          <td class="splittd" align="center" width="180" height="160">
           <div style="width:100px;padding:10px;background:#efefef"><img alt="<%# Eval("Title") %>" src='../../<%=MyCache.GetSJCacheConfig(1) %>/images/shijuan.jpg' onerror="this.src='../<%=MyCache.GetSJCacheConfig(1) %>/images/shijuan.jpg';" width="80"/></div>
          </td>

          <td class="splittd" style="line-height:25px">
           <span style='font-size:18px;font-weight:bold'><%# Eval("Title") %></span>
          <br /><span class="tips">上传时间：<%# Eval("AddDate") %>总分：<%# Eval("score") %>分  <%=MyCache.GetCacheConfig(49) %>：<%# Eval("money") %><%=MyCache.GetCacheConfig(50) %><br />&nbsp;&nbsp;共有<span style="color:Red"><%# Eval("TestHits")%></span>人练习</span> &nbsp;<a class="tips" href="../<%=MyCache.GetSJCacheConfig(1) %>/Reviews.aspx?id=<%# Eval("id") %>" target="_blank">发表心得(<%# Utils.StrToInt(Eval("CmtNum")) %>)</a>
          </td>

          <td class="splittd" align="center">
           <a target="_blank" title="点击进入考试" href='../../<%=MyCache.GetSJCacheConfig(1) %>/confirm.aspx?id=<%#Eval("id") %>'>
           <img src="../../../<%=MyCache.GetSJCacheConfig(1) %>/images/entersj.gif" title="进入考场"  />
           </a>
           </td>

      </tr>  

     </ItemTemplate>
     <FooterTemplate>
         <tr class="tdbg" style="display:<%# bool.Parse((Repeater1.Items.Count==0).ToString())?"":"none"%>">
                <td class="splittd" style="text-align:center" colspan="10">
                  没有找到试卷！
                </td>
           </tr> 
      </table>
     </FooterTemplate>
    </asp:Repeater>
    
    
   <br />
    
     <KS:Page ID="Page1" runat="server" />
</asp:Panel>




</asp:Content>
