<%@ Page Language="C#" MasterPageFile="~/User/User.master" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.User_Favorite_1" Title="Untitled Page" Codebehind="Favorite.aspx.cs" %>
<%@ Import Namespace="Kesion.Cache" %>
<%@ Import Namespace="Kesion.Publics" %>
<%@ Import Namespace="Kesion.HtmlTags" %>
<asp:Content ID="Content1" ContentPlaceHolderID="KSContent" Runat="Server">

<div class="tabs">	
			<ul>
				<li<%=KSCMS.S("flag")==""?" class='puton'":string.Empty %>><a href="Favorite.Aspx">���ղص��ĵ�</a></li>
				<li<%=KSCMS.S("flag")=="2"?" class='puton'":string.Empty %>><a href="Favorite.Aspx?flag=2">���ղص���Ʒ</a></li>
				<li<%=KSCMS.S("flag")=="1"?" class='puton'":string.Empty %>><a href="Favorite.Aspx?flag=1">���ղص��ʰ�����</a></li>
			</ul>
</div> 
    
    <div class="toptips">
    ������ʾ����������Ȥ����Ϣ�����ղ��Ѿ�û�м�ֵ����Ϣ�����Խ���ȡ���ղز�����
    </div>
  
  <asp:Panel ID="PanDoc" runat="server">
    <asp:Repeater ID="Repeater1" runat="server">
    <HeaderTemplate>
     <table id="tablist" width="98%" border="0" align="center" cellpadding="2" cellspacing="1" class="border">
      <tr class="title">
        	<td width="20" align="center">&nbsp;</td>
        	<td width="110" align="center"> ͼƬ</td>
            <td align="center"> ���� </td>
            <td width="100" align="center">�ղ�ʱ�� </td>
	        <td align="center" width="70">ȡ��</td>
        </tr>
    </HeaderTemplate>
    <ItemTemplate>
      <tr class="tdbg">
          <td class="splittd" align="center"><input type="checkbox" name="ids" value="<%#Eval("ID") %>" /></td>
          <td class="splittd" align="center"><img width="102" height="79" src="<%# GetPhoto(Convert.ToString(Eval("DefaultPic"))) %>" /></td>
          <td class="splittd">
          <%# GetSubject(Convert.ToInt16(Eval("ChannelID")),Convert.ToInt16(Eval("ClassID")),Convert.ToInt16(Eval("InfoID")),Convert.ToString(Eval("FileName")), Convert.ToString(Eval("TurnUrl")), Convert.ToString(Eval("Title")))%>
          <div style="margin-top:10px;color:#999999;">
          ����:<%# MyCache.GetCacheClass(Convert.ToInt16(Eval("ClassID")),1) %>&nbsp;&nbsp;
          ����ʱ��:<%# GetAddTime(Convert.ToDateTime(Eval("PubDate")))%>&nbsp;&nbsp;
          �����:<%#Eval("Hits") %>�˴�
          <%if (KSCMS.S("flag") == "2")
             { %>
             �г��ۣ�<span style='text-decoration:line-through'>��<%# Utils.StrToFloat(Eval("price")).ToString("F2")%>Ԫ</span> &nbsp;&nbsp;�̳Ǽۣ�<span style='color:#ff3300;font-weight:bold'>��<%# Utils.StrToFloat(Eval("price_member")).ToString("F2")%>Ԫ</span>
           <%} %>
          </div>
          </td>

          <td class="splittd" align="center">
          <span style="color:#ff6600;">
          <%# Utils.FormatHumanizedTime(Convert.ToDateTime(Eval("AddDate")))%>
          </span>
          </td>
          <td class="splittd" align="center">
          <a href="javascript:;" onclick="$.dialog.confirm('ȷ��ȡ�����ղ���?',function(){ location.href='?flag=<%=KSCMS.S("flag") %>&action=Cancel&ids=<%#Eval("ID") %>';},function(){});">ȡ ��</div>
          </td>
       
      </tr>  

     </ItemTemplate>
     <FooterTemplate>
     <tr class="tdbg" style="display:<%# bool.Parse((Repeater1.Items.Count==0).ToString())?"":"none"%>">
                <td class="splittd" style="text-align:center" colspan="10" >
                  ����û���ղ��κ���ϢŶ��
                </td>
           </tr> 
    </table>
     </FooterTemplate>
    </asp:Repeater>
 </asp:Panel>

  <asp:Panel ID="PanAsk" runat="server" Visible="false">
    <asp:Repeater ID="Repeater2" runat="server">
    <HeaderTemplate>
     <table id="tablist" width="98%" border="0" align="center" cellpadding="2" cellspacing="1" class="border">
      <tr class="title">
        	<td width="20" align="center">&nbsp;</td>
            <td align="center">����</td>
            <td width="100" align="center">�ղ�ʱ�� </td>
            <td align="center">�Ƿ���</td>
            <td align="center" nowrap>���ͷ�</td>
	        <td align="center" width="70">ȡ��</td>
        </tr>
    </HeaderTemplate>
    <ItemTemplate>
      <tr class="tdbg">
          <td class="splittd" align="center"><input type="checkbox" name="ids" value="<%#Eval("ID") %>" /></td>
          <td class="splittd">
            <a href="<%# BasicField.GetAskUrl(Convert.ToInt16(Eval("TopicID"))) %>" target="_blank"><%# Eval("Title") %></a>
           <div class="tips">����ʱ�䣺<%# Utils.FormatHumanizedTime(Convert.ToDateTime(Eval("PubDate")))%> �Ƿ���ˣ�<%#Convert.ToString(Eval("verify"))=="1"?"<span style='color:green'>�����</span>":"<span style='color:red'>δ���</span>" %> ���ࣺ<%# MyCache.GetCacheAskCategory(Convert.ToInt16(Eval("ClassID")),"classname") %></div>
           
          </div>
          </td>
          <td class="splittd" align="center">
          <span style="color:#ff6600;">
          <%# Utils.FormatHumanizedTime(Convert.ToDateTime(Eval("AddDate")))%>
          </span>
          </td> 
          <td class="splittd" style="text-align:center"><%#Convert.ToString(Eval("IsSolve")) == "1" ? "<span style='color:green'>�ѽ��</span>" : Convert.ToInt16(Eval("IsSolve"))==2?"�ѹر�":"<span style='color:red'>δ���</span>"%></td>
          <td class="splittd" style="text-align:center"><font color=red><%# Convert.ToSingle(Convert.ToString(Eval("reward"))).ToString()%>
</font> ��</td>
          <td class="splittd" align="center">
          <a href="javascript:;" onclick="$.dialog.confirm('ȷ��ȡ�����ղ���?',function(){ location.href='?flag=1&action=Cancel&ids=<%#Eval("ID") %>';},function(){});">ȡ ��</div>
          </td>
       
      </tr>  

     </ItemTemplate>
     <FooterTemplate>
     <tr class="tdbg" style="display:<%# bool.Parse((Repeater2.Items.Count==0).ToString())?"":"none"%>">
                <td class="splittd" style="text-align:center" colspan="10" >
                  ����û���ղ��κ�����Ŷ��
                </td>
           </tr> 
    </table>
     </FooterTemplate>
    </asp:Repeater>
 </asp:Panel>

    &nbsp;&nbsp;<br /><input type="checkbox" name="chkall" id="chkall" onclick="CheckAll(this.form);"/>ȫѡ&nbsp;
    <asp:Button ID="btnDelete" runat="server" CssClass="button" Text="ȡ��ѡ�е��ղ�" OnClick="btnDelete_Click" /><br />
     <KS:Page ID="Page1" runat="server" />

</asp:Content>