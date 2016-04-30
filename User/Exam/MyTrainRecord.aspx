<%@ Page Language="C#" MasterPageFile="~/User/User.master" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.MyTrainRecord" Title="Untitled Page" Codebehind="MyTrainRecord.aspx.cs" %>
<%@ Import Namespace="Kesion.Cache" %>
<%@ Import Namespace="Kesion.Publics" %>
<asp:Content ID="Content1" ContentPlaceHolderID="KSContent" Runat="Server">
  <div class="tabs">	
	<ul>
		<li<% =(KSCMS.S("action")=="")?" class='puton'":""%>><a href="MyTrainRecord.aspx">已完成的练习成绩</a></li>
		<li<% =(KSCMS.S("action")=="nofinish")?" class='puton'":""%>><a href="?action=nofinish">未完成的练习记录</a></li>
	</ul>
  </div>

<asp:Panel ID="Pannel1" runat="server">
    <div class="toptips tips">
     <span style="float:right">您可以对您的考试记录进行管理，也可以对试卷重新测试！</span> 共有：<asp:Label ID="Lab_Total_Info" runat="server" Text=""></asp:Label> 条练习记录
   </div>
    <asp:Repeater ID="Repeater1" runat="server">
    <HeaderTemplate>
         <table id="tablist" width="98%" border="0" align="center" cellpadding="2" cellspacing="1" class="border">
      <tr align="center" class="title">
        	<td width="50" align="center">选择</td>
        	<td> 分类</td>
        	<td> 练习名称</td>
        	<td  style="text-align:center"> 总分</td>
        	<td  style="text-align:center"> 得分</td>
        	<td  style="text-align:center"> 用时</td>
            <td width="100" align="center">测试时间</td>
            <td width="125" align="center">操作</td>
        </tr>
    </HeaderTemplate>
    <ItemTemplate>
      <tr class="tdbg">
          <td class="splittd" align="center"><input type="checkbox" name="ids" value="<%#Eval("ID") %>" /></td>
          <td class="splittd" style="text-align:center"><%# MyCache.GetCacheSJCategory(Convert.ToInt16(Eval("classid")),"classname")%></td>
          <td class="splittd"> 
         <%# Eval("Title") %>
          </td>
          <td class="splittd" style="text-align:center"><font color=red><%#  Utils.StrToFloat(Convert.ToString(Eval("Sysscore"))).ToString()%>
</font> 分</td>
          <td class="splittd" style="text-align:center"><font color=red><%#  Utils.StrToFloat(Convert.ToString(Eval("score"))).ToString()%>
</font> 分</td>
          <td class="splittd" align="center"><%# Convert.ToString(Eval("HasUseTime")).Replace(":", "分")%>秒</td>
          <td class="splittd" align="center"><%# Utils.FormatHumanizedTime(Convert.ToDateTime(Eval("AddDate")))%></td>
          <td class="splittd" align="center">
           <div class="bt">
           <a target="_blank" href='../../<%=MyCache.GetSJCacheConfig(1) %>/trainexplained.aspx?ID=<%#Eval("ID") %>'>答案解释</a></div>
            <div class="bt"><a onclick="return(confirm('确定删除吗？'));" href='?action=Cancel&ids=<%# Eval("ID") %>'>删除</a></div>
          
           </td>

      </tr>  

     </ItemTemplate>
     <FooterTemplate>
         <tr class="tdbg" style="display:<%# bool.Parse((Repeater1.Items.Count==0).ToString())?"":"none"%>">
                <td class="splittd" style="text-align:center" colspan="10">
                  没有练习记录！
                </td>
           </tr> 
      </table>
     </FooterTemplate>
    </asp:Repeater>
    
</asp:Panel>


<asp:Panel ID="Pannel2" runat="server" Visible="false" Width="100%">
<div class="toptips tips">
     <span style="float:right">您可以对您的考试记录进行管理，也可以对试卷重新测试！</span> 共有：<asp:Label ID="LabN" runat="server" Text=""></asp:Label> 条考试记录
   </div>
    <asp:Repeater ID="Repeater2" runat="server">
    <HeaderTemplate>
         <table id="tablist" width="98%" border="0" align="center" cellpadding="2" cellspacing="1" class="border">
      <tr align="center" class="title">
        	<td width="50" align="center">选择</td>
        	<td  align="center"> 分类</td>
        	<td  align="center"> 试卷名称</td>
        	<td  align="center"> 限制时间</td>
        	<td  align="center"> 已用时</td>
            <td width="100" align="center">上次测试时间</td>
            <td width="125" align="center">操作</td>
        </tr>
    </HeaderTemplate>
    <ItemTemplate>
      <tr class="tdbg">
          <td class="splittd" align="center"><input type="checkbox" name="ids" value="<%#Eval("ID") %>" /></td>
          <td class="splittd" style="text-align:center;"><%# MyCache.GetCacheSJCategory(Convert.ToInt16(Eval("classid")),"classname")%></td>
<td class="splittd"> 
           <%# Eval("Title") %>
          </td>
          <td class="splittd" style="text-align:center"><font color=red><%#  Eval("limittime")%>
</font> 分钟</td>

          <td class="splittd" align="center"><%# Convert.ToString(Eval("HasUseTime")).Replace(":", "分")%>秒</td>
          <td class="splittd" align="center"><%# !string.IsNullOrEmpty(Convert.ToString(Eval("posttime")))?Utils.FormatHumanizedTime(Convert.ToDateTime(Eval("posttime"))):"---"%></td>
          <td class="splittd" align="center">
           <div class="bt">
           <div class="bt"><a target="_blank" href='../../<%=MyCache.GetSJCacheConfig(1) %>/training.aspx?id=<%#Eval("id") %>'>继续练习</a></div>
            <div class="bt"><a onclick="return(confirm('确定删除吗？'));" href='?action=Cancel&ids=<%# Eval("ID") %>'>删除</a></div>
          
           </td>

      </tr>  

     </ItemTemplate>
     <FooterTemplate>
         <tr class="tdbg" style="display:<%# bool.Parse((Repeater2.Items.Count==0).ToString())?"":"none"%>">
                <td class="splittd" style="text-align:center" colspan="10">
                  没有未做完的练习！
                </td>
           </tr> 
      </table>
     </FooterTemplate>
    </asp:Repeater>
    
   <br />
    


</asp:Panel>

   <br />
    
     <KS:Page ID="Page1" runat="server" />
         &nbsp;&nbsp;<input type="checkbox" name="chkall" id="chkall" onclick="CheckAll(this.form);"/>全选  <asp:Button ID="ButtonRemove" CssClass="button" runat="server" Text="移 除" OnClick="ButtonRemove_Click"/>


</asp:Content>