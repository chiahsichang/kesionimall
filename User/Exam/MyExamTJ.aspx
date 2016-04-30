<%@ Page Language="C#" MasterPageFile="~/User/User.master" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.MyTrainTJ" Title="Untitled Page" Codebehind="MyExamTJ.aspx.cs" %>
<%@ Import Namespace="Kesion.Cache" %>
<%@ Import Namespace="Kesion.Publics" %>
<asp:Content ID="Content1" ContentPlaceHolderID="KSContent" Runat="Server">
  <div class="tabs">	
	<ul>
		<li<% =(KSCMS.S("action")=="")?" class='puton'":""%>><a href="MyExamTJ.aspx">已完成的练习成绩</a></li>
		<li<% =(KSCMS.S("action")=="nofinish")?" class='puton'":""%>><a href="?action=nofinish">未完成的练习记录</a></li>
	</ul>
  </div>

<asp:Panel ID="Pannel1" runat="server">
    <div class="toptips tips">
     <span style="float:right">您可以对您的考试记录进行管理，也可以对试卷重新测试！</span> 共有：<asp:Label ID="Lab_Total_Info" runat="server" Text=""></asp:Label> 条考试记录
   </div>
    <asp:Repeater ID="Repeater1" runat="server">
    <HeaderTemplate>
         <table id="tablist" width="98%" border="0" align="center" cellpadding="2" cellspacing="1" class="border">
      <tr align="center" class="title">
        	<td width="50" align="center">选择</td>
        	<td  align="center"> 试卷名称</td>
        	<td  align="center"> 得分</td>
        	<td  align="center"> 用时</td>
            <td width="100" align="center">测试时间</td>
            <td width="125" align="center">操作</td>
        </tr>
    </HeaderTemplate>
    <ItemTemplate>
      <tr class="tdbg">
          <td class="splittd" align="center"><input type="checkbox" name="ids" value="<%#Eval("ScoreID") %>" /></td>
          <td class="splittd"> 
           <%# Eval("Title") %>
           <br /><a  target="_blank" href="../../<%=MyCache.GetSJCacheConfig(1) %>/Reviews.aspx?id=<%# Eval("sjid") %>">发表考试心得(<%# Utils.StrToInt(Eval("CmtNum"))%>)</a>
          </td>
          <td class="splittd" align="center"><font color=red><%# Convert.ToSingle(Convert.ToString(Eval("score"))).ToString()%>
</font> 分</td>
          <td class="splittd" align="center"><%# Convert.ToString(Eval("KSSJ")).Replace(":", "分")%></td>
          <td class="splittd" align="center"><%# Utils.FormatHumanizedTime(Convert.ToDateTime(Eval("AddDate")))%></td>
          <td class="splittd" align="center">
           <div class="bt">
           <a target="_blank" href='../../<%=MyCache.GetSJCacheConfig(1) %>/explained<%# Utils.StrToInt(Eval("dtfs"))==3?"":""%>.aspx?scoreid=<%#Eval("scoreid") %>'>查看详情</a></div>
           <div class="bt"><a target="_blank" href='../../<%=MyCache.GetSJCacheConfig(1) %>/confirm.aspx?id=<%#Eval("sjid") %>'>重新考试</a></div>
           <%# Convert.ToString(Eval("IsDelRecord")).Equals("1")?" <div class=\"bt\"><a onclick=\"return(confirm('确定删除吗？'));\" href='?action=Cancel&ids="+Eval("scoreid") +"'>删除</a></div>":string.Empty %>
          
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
        	<td  align="center"> 试卷名称</td>
        	<td  align="center"> 总时间</td>
        	<td  align="center"> 已用时</td>
            <td width="100" align="center">上次测试时间</td>
            <td width="125" align="center">操作</td>
        </tr>
    </HeaderTemplate>
    <ItemTemplate>
      <tr class="tdbg">
          <td class="splittd" align="center"><input type="checkbox" name="ids" value="<%#Eval("ScoreID") %>" /></td>
          <td class="splittd"> 
           <%# Eval("Title") %>
           <br /><a  target="_blank"  class="tips" href="../../<%=MyCache.GetSJCacheConfig(1) %>/Reviews.aspx?id=<%# Eval("sjid") %>" class="tips">发表考试心得(<%# Utils.StrToInt(Eval("CmtNum")) %>)</a>
          </td>
          <td class="splittd" align="center"><%# Eval("totaltime")%> 分钟</td>
          <td class="splittd"><%# Convert.ToString(Eval("hasusetime")).Replace(":","分钟")%>秒</td>
          <td class="splittd" align="center"><%# Eval("AddDate")%></td>
          <td class="splittd" align="center">
           <div class="bt">
           <div class="bt"><a target="_blank" href='../../<%=MyCache.GetSJCacheConfig(1) %>/confirm.aspx?id=<%#Eval("sjid") %>'>继续考试</a></div>
           <%# Convert.ToString(Eval("IsDelRecord")).Equals("1")?" <div class=\"bt\"><a onclick=\"return(confirm('确定删除吗？'));\" href='?action=Cancel&ids="+Eval("scoreid") +"'>删除</a></div>":string.Empty %>
           </td>

      </tr>  

     </ItemTemplate>
     <FooterTemplate>
         <tr class="tdbg" style="display:<%# bool.Parse((Repeater1.Items.Count==0).ToString())?"":"none"%>">
                <td class="splittd" style="text-align:center" colspan="10">
                  没有未做完的试卷！
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