<%@ Page Language="C#" MasterPageFile="~/User/User.master" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.MyTrainRecord" Title="Untitled Page" Codebehind="MyTrainRecord.aspx.cs" %>
<%@ Import Namespace="Kesion.Cache" %>
<%@ Import Namespace="Kesion.Publics" %>
<asp:Content ID="Content1" ContentPlaceHolderID="KSContent" Runat="Server">
  <div class="tabs">	
	<ul>
		<li<% =(KSCMS.S("action")=="")?" class='puton'":""%>><a href="MyTrainRecord.aspx">����ɵ���ϰ�ɼ�</a></li>
		<li<% =(KSCMS.S("action")=="nofinish")?" class='puton'":""%>><a href="?action=nofinish">δ��ɵ���ϰ��¼</a></li>
	</ul>
  </div>

<asp:Panel ID="Pannel1" runat="server">
    <div class="toptips tips">
     <span style="float:right">�����Զ����Ŀ��Լ�¼���й���Ҳ���Զ��Ծ����²��ԣ�</span> ���У�<asp:Label ID="Lab_Total_Info" runat="server" Text=""></asp:Label> ����ϰ��¼
   </div>
    <asp:Repeater ID="Repeater1" runat="server">
    <HeaderTemplate>
         <table id="tablist" width="98%" border="0" align="center" cellpadding="2" cellspacing="1" class="border">
      <tr align="center" class="title">
        	<td width="50" align="center">ѡ��</td>
        	<td> ����</td>
        	<td> ��ϰ����</td>
        	<td  style="text-align:center"> �ܷ�</td>
        	<td  style="text-align:center"> �÷�</td>
        	<td  style="text-align:center"> ��ʱ</td>
            <td width="100" align="center">����ʱ��</td>
            <td width="125" align="center">����</td>
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
</font> ��</td>
          <td class="splittd" style="text-align:center"><font color=red><%#  Utils.StrToFloat(Convert.ToString(Eval("score"))).ToString()%>
</font> ��</td>
          <td class="splittd" align="center"><%# Convert.ToString(Eval("HasUseTime")).Replace(":", "��")%>��</td>
          <td class="splittd" align="center"><%# Utils.FormatHumanizedTime(Convert.ToDateTime(Eval("AddDate")))%></td>
          <td class="splittd" align="center">
           <div class="bt">
           <a target="_blank" href='../../<%=MyCache.GetSJCacheConfig(1) %>/trainexplained.aspx?ID=<%#Eval("ID") %>'>�𰸽���</a></div>
            <div class="bt"><a onclick="return(confirm('ȷ��ɾ����'));" href='?action=Cancel&ids=<%# Eval("ID") %>'>ɾ��</a></div>
          
           </td>

      </tr>  

     </ItemTemplate>
     <FooterTemplate>
         <tr class="tdbg" style="display:<%# bool.Parse((Repeater1.Items.Count==0).ToString())?"":"none"%>">
                <td class="splittd" style="text-align:center" colspan="10">
                  û����ϰ��¼��
                </td>
           </tr> 
      </table>
     </FooterTemplate>
    </asp:Repeater>
    
</asp:Panel>


<asp:Panel ID="Pannel2" runat="server" Visible="false" Width="100%">
<div class="toptips tips">
     <span style="float:right">�����Զ����Ŀ��Լ�¼���й���Ҳ���Զ��Ծ����²��ԣ�</span> ���У�<asp:Label ID="LabN" runat="server" Text=""></asp:Label> �����Լ�¼
   </div>
    <asp:Repeater ID="Repeater2" runat="server">
    <HeaderTemplate>
         <table id="tablist" width="98%" border="0" align="center" cellpadding="2" cellspacing="1" class="border">
      <tr align="center" class="title">
        	<td width="50" align="center">ѡ��</td>
        	<td  align="center"> ����</td>
        	<td  align="center"> �Ծ�����</td>
        	<td  align="center"> ����ʱ��</td>
        	<td  align="center"> ����ʱ</td>
            <td width="100" align="center">�ϴβ���ʱ��</td>
            <td width="125" align="center">����</td>
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
</font> ����</td>

          <td class="splittd" align="center"><%# Convert.ToString(Eval("HasUseTime")).Replace(":", "��")%>��</td>
          <td class="splittd" align="center"><%# !string.IsNullOrEmpty(Convert.ToString(Eval("posttime")))?Utils.FormatHumanizedTime(Convert.ToDateTime(Eval("posttime"))):"---"%></td>
          <td class="splittd" align="center">
           <div class="bt">
           <div class="bt"><a target="_blank" href='../../<%=MyCache.GetSJCacheConfig(1) %>/training.aspx?id=<%#Eval("id") %>'>������ϰ</a></div>
            <div class="bt"><a onclick="return(confirm('ȷ��ɾ����'));" href='?action=Cancel&ids=<%# Eval("ID") %>'>ɾ��</a></div>
          
           </td>

      </tr>  

     </ItemTemplate>
     <FooterTemplate>
         <tr class="tdbg" style="display:<%# bool.Parse((Repeater2.Items.Count==0).ToString())?"":"none"%>">
                <td class="splittd" style="text-align:center" colspan="10">
                  û��δ�������ϰ��
                </td>
           </tr> 
      </table>
     </FooterTemplate>
    </asp:Repeater>
    
   <br />
    


</asp:Panel>

   <br />
    
     <KS:Page ID="Page1" runat="server" />
         &nbsp;&nbsp;<input type="checkbox" name="chkall" id="chkall" onclick="CheckAll(this.form);"/>ȫѡ  <asp:Button ID="ButtonRemove" CssClass="button" runat="server" Text="�� ��" OnClick="ButtonRemove_Click"/>


</asp:Content>