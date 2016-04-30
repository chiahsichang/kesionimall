<%@ Page Language="C#" MasterPageFile="~/User/User.master" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.MyTopic" Title="Untitled Page" Codebehind="MyTopic.aspx.cs" %>
<%@ Import Namespace="Kesion.Cache" %>
<%@ Import Namespace="Kesion.Publics" %>
<%@ Import Namespace="Kesion.HtmlTags" %>
<asp:Content ID="Content1" ContentPlaceHolderID="KSContent" Runat="Server">
   

<div class="tabs">	
			<ul>
				<li<%=KSCMS.S("flag")==""?" class='puton'":string.Empty %>><a href="MyTopic.aspx">�ҷ����Ļ���</a></li>
				<li<%=KSCMS.S("flag")=="1"?" class='puton'":string.Empty %>><a href="MyTopic.aspx?flag=1">�Ҳ���Ļ���</a></li>
			</ul>
</div>      

<asp:Panel ID="PanAsk" runat="server">
    <asp:Repeater ID="Repeater1" runat="server">
    <HeaderTemplate>
         <table id="tablist" width="98%" border="0" align="center" cellpadding="2" cellspacing="1" class="border">
      <tr align="center" class="title">
        	<td width="50" align="center">ѡ��</td>
        	<td align="center">����</td>
        	<td align="center" nowrap>�ظ�/���</td>
            <td align="center">����</td>
            <td align="center">����</td>
        </tr>
    </HeaderTemplate>
    <ItemTemplate>
      <tr class="tdbg">
          <td class="splittd" align="center"><input type="checkbox" name="ids" value="<%#Eval("TopicID") %>" /></td>
          <td class="splittd"> 
           <a href="<%#BasicField.GetClubShowUrl(Utils.StrToInt(Eval("topicid"))) %>" target="_blank"><%# Utils.CutStr(Utils.RemoveHtml(Convert.ToString(Eval("Content"))), 80)%></a>
           <div class="tips">����ʱ�䣺<%# Utils.FormatHumanizedTime(Convert.ToDateTime(Eval("AddDate")))%> �Ƿ���ˣ�<%#Convert.ToString(Eval("verify"))=="1"?"<span style='color:green'>�����</span>":"<span style='color:red'>δ���</span>" %> ���棺<%# MyCache.GetCacheBBSCategory(Convert.ToInt32(Eval("boardId")), "boardname") %></div>
          </td>
         
          <td class="splittd" style="text-align:center"><%# Eval("PostNum") %>/<%# Eval("Hits") %></td>
          <td class="splittd" style="text-align:center"><%# Eval("UserName") %></td>
          <td class="splittd" style="text-align:center">
               <%# MyCache.GetBBSCacheConfig(15).Equals("0") ? "---" : " <div class=\"bt\"><a onclick=\"return(confirm('ȷ��ɾ����'));\" href='?action=delete&ids=" + Eval("topicid") + "'>ɾ��</a></div>"%>
           </td>
      </tr>  
     </ItemTemplate>
     <FooterTemplate>
         <tr class="tdbg" style="display:<%# bool.Parse((Repeater1.Items.Count==0).ToString())?"":"none"%>">
                <td class="splittd" style="text-align:center" colspan="10">
                  û�м�¼��
                </td>
           </tr> 
      </table>
     </FooterTemplate>
    </asp:Repeater>
     &nbsp;&nbsp; &nbsp;&nbsp;
    &nbsp;&nbsp;<input type="checkbox" name="chkall" id="chkall" onclick="CheckAll(this.form);"/>ȫѡ  <asp:Button ID="ButtonRemove" CssClass="button" runat="server" Text="ɾ ��" OnClick="ButtonRemove_Click"/>
   <br />
    
     <KS:Page ID="Page1" runat="server" />
</asp:Panel>



<asp:Panel ID="PanAnswer" runat="server" Visible="false">
 <asp:Repeater ID="Repeater2" runat="server">
    <HeaderTemplate>
         <table id="tablist" width="98%" border="0" align="center" cellpadding="2" cellspacing="1" class="border">
      <tr align="center" class="title">
        	<td width="50" align="center">���</td>
        	<td align="center">����</td>
            <td align="center">�ظ�/���</td>
            <td align="center">����</td>
        </tr>
    </HeaderTemplate>
    <ItemTemplate>
      <tr class="tdbg">
          <td class="splittd" align="center">
              <%# Container.ItemIndex + 1%> 
</td>
          <td class="splittd"><a href="<%#BasicField.GetClubShowUrl(Utils.StrToInt(Eval("topicid"))) %>" target="_blank"><%# Utils.CutStr(Utils.RemoveHtml(Convert.ToString(Eval("Subject"))), 80)%></a>
           <div class="tips">�ҵĻظ���<%# Utils.CutStr(Utils.RemoveHtml(Convert.ToString(Eval("Content"))),80)%></div>
           <div class="tips">����ʱ�䣺<%# Utils.FormatHumanizedTime(Convert.ToDateTime(Eval("AddDate")))%> ���ߣ�<%#Eval("userName") %> ���棺<%# MyCache.GetCacheBBSCategory(Convert.ToInt32(Eval("boardId")), "boardname") %></div>
           
          </td>
           <td class="splittd" style="text-align:center"><%# Eval("PostNum") %>/<%# Eval("Hits") %></td>
          <td class="splittd" align="center">
               <%# MyCache.GetBBSCacheConfig(20).Equals("0") ? "---" : " <div class=\"bt\"><a onclick=\"return(confirm('ȷ��ɾ����'));\" href='?action=deleteanswer&ids="+Eval("postid")+"&topicid=" + Eval("topicid") + "'>ɾ��</a></div>"%>
           </td>

      </tr>  

     </ItemTemplate>
     <FooterTemplate>
         <tr class="tdbg" style="display:<%# bool.Parse((Repeater2.Items.Count==0).ToString())?"":"none"%>">
                <td class="splittd" style="text-align:center" colspan="10">
                  û�в����κλ������ۣ�
                </td>
           </tr> 
      </table>
     </FooterTemplate>
    </asp:Repeater>
   <br />
    
     <KS:Page ID="Page2" runat="server" />

</asp:Panel>


</asp:Content>