<%@ Page Language="C#" MasterPageFile="~/User/User.master" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.MyExamRecord" Title="Untitled Page" Codebehind="MyExamRecord.aspx.cs" %>
<%@ Import Namespace="Kesion.Cache" %>
<%@ Import Namespace="Kesion.Publics" %>
<asp:Content ID="Content1" ContentPlaceHolderID="KSContent" Runat="Server">

<asp:Panel ID="PanList" runat="server">
    <div class="toptips tips">
     <span style="float:right">查看考试成绩及答案解释！</span> 共有：<asp:Label ID="Lab_Total_Info" runat="server" Text=""></asp:Label> 条考试记录
   </div>
   <style>
   .score{font-weight:bold;font-size:20px;}
   .score font{color:green;font-size:20px;padding-right:2px;}
   </style>
    <asp:Repeater ID="Repeater1" runat="server">
    <HeaderTemplate>
         <table id="tablist" width="98%" border="0" align="center" cellpadding="2" cellspacing="1" class="border">
      <tr align="center" class="title">
        	<td width="50" align="center">序号</td>
        	<td  align="center"> 试卷名称</td>
        	<td  align="center"> 得分</td>
        	<td  align="center"> 用时</td>
            <td width="100" align="center">考试时间</td>
            <td width="125" align="center">操作</td>
        </tr>
    </HeaderTemplate>
    <ItemTemplate>
      <tr class="tdbg">
          <td class="splittd" align="center"><%# Container.ItemIndex + 1 + (CurrPage - 1) * PageSize%>、</td>
          <td class="splittd"> <%# Eval("Title") %>   
          </td>
          <td class="splittd" style="text-align:center">
          <%# GetScore(Utils.StrToInt(Eval("IsPg")),Utils.StrToInt(Eval("ScorePubType")),string.IsNullOrEmpty(Convert.ToString(Eval("ScorePubDate")))?DateTime.Now:Convert.ToDateTime(Eval("ScorePubDate")),Convert.ToString(Eval("Score"))) %>
          
          
          </td>
          <td class="splittd" style="text-align:center"><%# Eval("KSSJ")%></td>
          <td class="splittd" align="center"><%# Utils.FormatHumanizedTime(Convert.ToDateTime(Eval("AddDate")))%></td>
          <td class="splittd" align="center">
           <a target="_blank" href='../../<%=MyCache.GetSJCacheConfig(1) %>/explained.aspx?scoreid=<%#Eval("scoreid") %>'>答案解释</a>&nbsp;
          <a  target="_blank" href="../../<%=MyCache.GetSJCacheConfig(1) %>/Reviews.aspx?id=<%# Eval("sjid") %>">发表心得(<%# Eval("CmtNum") %>)</a>
           </td>

      </tr>  

     </ItemTemplate>
     <FooterTemplate>
         <tr class="tdbg" style="display:<%# bool.Parse((Repeater1.Items.Count==0).ToString())?"":"none"%>">
                <td class="splittd" style="text-align:center" colspan="10">
                  没有考试记录！
                </td>
           </tr> 
      </table>
     </FooterTemplate>
    </asp:Repeater>
    
   <br />
    
     <KS:Page ID="Page1" runat="server" />
</asp:Panel>


</asp:Content>