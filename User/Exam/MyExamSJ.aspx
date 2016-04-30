<%@ Page Language="C#" MasterPageFile="~/User/User.master" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.MyExamSJ" Title="Untitled Page" Codebehind="MyExamSJ.aspx.cs" %>
<%@ Import Namespace="Kesion.Cache" %>
<%@ Import Namespace="Kesion.Publics" %>
<asp:Content ID="Content1" ContentPlaceHolderID="KSContent" Runat="Server">

<asp:Panel ID="PanList" runat="server">
    <div class="toptips">
     <span style="float:right" class="tips">请选择已授权的试卷作答。</span> 共有：<asp:Label ID="Lab_Total_Info" runat="server" Text=""></asp:Label> 份考试
   </div>
    <asp:Repeater ID="Repeater1" runat="server">
    <HeaderTemplate>
         <table id="tablist" width="98%" border="0" align="center" cellpadding="2" cellspacing="1" class="border">
    </HeaderTemplate>
    <ItemTemplate>
      <tr class="tdbg">
          <td class="splittd" align="center" width="180" height="180">
           <div style="width:100px;padding:10px;background:#efefef"><img alt="<%# Eval("Title") %>" src="../../<%=MyCache.GetSJCacheConfig(1) %>/images/shijuan.jpg" width="100"/></div>
          </td>

          <td class="splittd" style="line-height:25px">
           <span style='font-size:18px;font-weight:bold'><%# Container.ItemIndex + 1 + (CurrPage - 1) * PageSize%>、<%# Eval("Title") %></span>
           <span class="tips"><br />考试时间：<%# Convert.ToString(Eval("OpenTimeLimit"))=="1"?Eval("TimeLimitBegin")+"至"+Eval("TimeLimitEnd"):"无限制" %>
          <br />试卷总分：<span style='color:brown;font-weight:bold'><%# Eval("score")%></span> 分
          时间限制：<%# Eval("KSSJ")%>分钟
          <br />考试权限：
          <%# Authorization(Convert.ToInt16(Eval("AuthorizationType")),Utils.StrToFloat(Eval("money")),Convert.ToString(Eval("groupids")))%>
           </span>
          </td>

          <td class="splittd" align="center">
          
           <a target="_blank" href='../../<%=MyCache.GetSJCacheConfig(1) %>/Go.aspx?id=<%#Eval("id") %>'>
           <img src="../../<%=MyCache.GetSJCacheConfig(1) %>/images/entersj.gif" title="进入考场"  />
           </a>
           <br />
<a  target="_blank" href="../../<%=MyCache.GetSJCacheConfig(1) %>/Reviews.aspx?id=<%# Eval("id") %>" class="tips">发表考试心得(<%# Eval("CmtNum") %>)</a>
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
    
     <KS:Page ID="Page1" runat="server" />
</asp:Panel>


</asp:Content>