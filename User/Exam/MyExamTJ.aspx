<%@ Page Language="C#" MasterPageFile="~/User/User.master" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.MyTrainTJ" Title="Untitled Page" Codebehind="MyExamTJ.aspx.cs" %>
<%@ Import Namespace="Kesion.Cache" %>
<%@ Import Namespace="Kesion.Publics" %>
<asp:Content ID="Content1" ContentPlaceHolderID="KSContent" Runat="Server">
  <div class="tabs">	
	<ul>
		<li<% =(KSCMS.S("action")=="")?" class='puton'":""%>><a href="MyExamTJ.aspx">����ɵ���ϰ�ɼ�</a></li>
		<li<% =(KSCMS.S("action")=="nofinish")?" class='puton'":""%>><a href="?action=nofinish">δ��ɵ���ϰ��¼</a></li>
	</ul>
  </div>

<asp:Panel ID="Pannel1" runat="server">
    <div class="toptips tips">
     <span style="float:right">�����Զ����Ŀ��Լ�¼���й���Ҳ���Զ��Ծ����²��ԣ�</span> ���У�<asp:Label ID="Lab_Total_Info" runat="server" Text=""></asp:Label> �����Լ�¼
   </div>
    <asp:Repeater ID="Repeater1" runat="server">
    <HeaderTemplate>
         <table id="tablist" width="98%" border="0" align="center" cellpadding="2" cellspacing="1" class="border">
      <tr align="center" class="title">
        	<td width="50" align="center">ѡ��</td>
        	<td  align="center"> �Ծ�����</td>
        	<td  align="center"> �÷�</td>
        	<td  align="center"> ��ʱ</td>
            <td width="100" align="center">����ʱ��</td>
            <td width="125" align="center">����</td>
        </tr>
    </HeaderTemplate>
    <ItemTemplate>
      <tr class="tdbg">
          <td class="splittd" align="center"><input type="checkbox" name="ids" value="<%#Eval("ScoreID") %>" /></td>
          <td class="splittd"> 
           <%# Eval("Title") %>
           <br /><a  target="_blank" href="../../<%=MyCache.GetSJCacheConfig(1) %>/Reviews.aspx?id=<%# Eval("sjid") %>">�������ĵ�(<%# Utils.StrToInt(Eval("CmtNum"))%>)</a>
          </td>
          <td class="splittd" align="center"><font color=red><%# Convert.ToSingle(Convert.ToString(Eval("score"))).ToString()%>
</font> ��</td>
          <td class="splittd" align="center"><%# Convert.ToString(Eval("KSSJ")).Replace(":", "��")%></td>
          <td class="splittd" align="center"><%# Utils.FormatHumanizedTime(Convert.ToDateTime(Eval("AddDate")))%></td>
          <td class="splittd" align="center">
           <div class="bt">
           <a target="_blank" href='../../<%=MyCache.GetSJCacheConfig(1) %>/explained<%# Utils.StrToInt(Eval("dtfs"))==3?"":""%>.aspx?scoreid=<%#Eval("scoreid") %>'>�鿴����</a></div>
           <div class="bt"><a target="_blank" href='../../<%=MyCache.GetSJCacheConfig(1) %>/confirm.aspx?id=<%#Eval("sjid") %>'>���¿���</a></div>
           <%# Convert.ToString(Eval("IsDelRecord")).Equals("1")?" <div class=\"bt\"><a onclick=\"return(confirm('ȷ��ɾ����'));\" href='?action=Cancel&ids="+Eval("scoreid") +"'>ɾ��</a></div>":string.Empty %>
          
           </td>

      </tr>  

     </ItemTemplate>
     <FooterTemplate>
         <tr class="tdbg" style="display:<%# bool.Parse((Repeater1.Items.Count==0).ToString())?"":"none"%>">
                <td class="splittd" style="text-align:center" colspan="10">
                  û�п��Լ�¼��
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
        	<td  align="center"> �Ծ�����</td>
        	<td  align="center"> ��ʱ��</td>
        	<td  align="center"> ����ʱ</td>
            <td width="100" align="center">�ϴβ���ʱ��</td>
            <td width="125" align="center">����</td>
        </tr>
    </HeaderTemplate>
    <ItemTemplate>
      <tr class="tdbg">
          <td class="splittd" align="center"><input type="checkbox" name="ids" value="<%#Eval("ScoreID") %>" /></td>
          <td class="splittd"> 
           <%# Eval("Title") %>
           <br /><a  target="_blank"  class="tips" href="../../<%=MyCache.GetSJCacheConfig(1) %>/Reviews.aspx?id=<%# Eval("sjid") %>" class="tips">�������ĵ�(<%# Utils.StrToInt(Eval("CmtNum")) %>)</a>
          </td>
          <td class="splittd" align="center"><%# Eval("totaltime")%> ����</td>
          <td class="splittd"><%# Convert.ToString(Eval("hasusetime")).Replace(":","����")%>��</td>
          <td class="splittd" align="center"><%# Eval("AddDate")%></td>
          <td class="splittd" align="center">
           <div class="bt">
           <div class="bt"><a target="_blank" href='../../<%=MyCache.GetSJCacheConfig(1) %>/confirm.aspx?id=<%#Eval("sjid") %>'>��������</a></div>
           <%# Convert.ToString(Eval("IsDelRecord")).Equals("1")?" <div class=\"bt\"><a onclick=\"return(confirm('ȷ��ɾ����'));\" href='?action=Cancel&ids="+Eval("scoreid") +"'>ɾ��</a></div>":string.Empty %>
           </td>

      </tr>  

     </ItemTemplate>
     <FooterTemplate>
         <tr class="tdbg" style="display:<%# bool.Parse((Repeater1.Items.Count==0).ToString())?"":"none"%>">
                <td class="splittd" style="text-align:center" colspan="10">
                  û��δ������Ծ�
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