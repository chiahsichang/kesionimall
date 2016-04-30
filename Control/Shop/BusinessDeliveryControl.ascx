<%@ Control Language="C#" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.Shop.BusinessDeliveryControl" Codebehind="BusinessDeliveryControl.ascx.cs" %>
<%@ Import Namespace="Kesion.Cache"%>

<asp:Panel ID="Panel1" runat="server">
<table class="border" cellspacing="1" cellPadding="2" width="99%" align="center" border=0>
    <tr class="title" align=middle>
      <td colSpan=2 height=35><B>����[<asp:Label ID="LabOrderID" runat="server" Text=""></asp:Label>]��������</B></td>
    </tr>
    <tr class="tdbg">
      <td align=right class="lefttd">�ͻ�������</td>
      <td><asp:Label ID="LabClientName" runat="server" Text=""></asp:Label></td>
    </tr>
    <tr class="tdbg">
      <td align=right class="lefttd">�û�����</td>
      <td><asp:Label ID="LabUserName" runat="server" Text=""></asp:Label></td>
    </tr>
    <tr class="tdbg">
      <td align=right class="lefttd" >������</td>
      <td>
             <span style="font-weight:bold;font-size:16px;color:brown"><%=MyCache.GetCurrencySymbol %><asp:Label ID="LabOrderTotalPrice" runat="server" Text=""></asp:Label></span> <%=MyCache.GetCurrencyUnit %>   �Ѹ�� <%=MyCache.GetCurrencySymbol %><span style="font-weight:bold;font-size:16px;color:green"><asp:Label ID="LabMoneyReceipt" runat="server" Text=""></asp:Label></span> <%=MyCache.GetCurrencyUnit %></td>
      </td>
    </tr>
    <tr class="tdbg">
      <td align=right  class="lefttd" >�ջ���Ϣ��</td>
      <td>
      �ջ���ַ��<asp:Label ID="LabAddress" runat="server" Text=""></asp:Label>���� �� �ˣ�<asp:Label ID="LabRealName" runat="server" Text=""></asp:Label>
      &nbsp;&nbsp;��ϵ�绰��<asp:Label ID="LabTel" runat="server" Text=""></asp:Label>
      &nbsp;&nbsp;�������룺<asp:Label ID="LabZipCode" runat="server" Text=""></asp:Label>��
      
      </td>
    </tr>
    
    <tr class="tdbg" id="alipay" visible="false" runat="server">
      <td class="lefttd"  align=right>֧�������׺ţ�</td>
      <td><asp:Label ID="LabAlipaytradeno" Text="" runat="server"></asp:Label>
      <br /><span style='font-weight:Bold;color:green'>��������֧������������,��������ͬʱ�ı�֧��������״̬��</span></td>
    </tr>

    
    <tr class="tdbg">
      <td class="lefttd"  align=right>�������ڣ�</td>
      <td>
          <asp:TextBox  CssClass="textbox" ID="TxtDeliverDate" runat="server"></asp:TextBox>
          <span class="tips">��ʽ:YYYY-MM-DD hh:mm:ss</span></td>
    </tr>
    <tr class="tdbg">
      <td class="lefttd"  align=right>��ݹ�˾��</td>
      <td>
         <asp:DropDownList CssClass="select" ID="DrpDeliveryCorpId" runat="server"></asp:DropDownList>
      </td>
    </tr>
    <tr class="tdbg">
      <td class="lefttd"  align=right>��ݵ��ţ�</td>
      <td>
      <asp:TextBox  CssClass="textbox" ID="TxtExpressOrderID" runat="server" Width="200px"></asp:TextBox>
    </tr>
    <tr class="tdbg">
      <td class="lefttd" align=right>�����ˣ�</td>
      <td>
      <asp:TextBox  CssClass="textbox" ReadOnly="true" ID="TxtAdminName" runat="server" Width="200px"></asp:TextBox>
    </tr>
    <tr class="tdbg">
      <td class="lefttd" align=right>��ע��</td>
      <td>
      <asp:TextBox  CssClass="textbox" ID="TxtRemark" runat="server" Width="350px"></asp:TextBox>
    </tr>
    
    <tr class="tdbg">
      <td class="lefttd" align=right>֪ͨ��Ա��</td>
      <td>
      <asp:CheckBox ID="SendMessageToUser" runat="server" Checked="true" Text="ͬʱʹ��վ�ڶ���֪ͨ��Ա�Ѿ�����" /><br />
      <asp:CheckBox ID="SendMailToUser" runat="server" Checked="true" Text="ͬʱ�����ʼ�֪ͨ��Ա�Ѿ�����" />
            <%
       if (MyCache.GetCacheConfig(32) == "1")
        {  
      %>
     <br /> <asp:CheckBox ID="SendMobileToUser" runat="server" Checked="true" Text="ͬʱ�����ֻ�����֪ͨ��Ա�Ѿ�����" /></td>
      <%} %>
      
      </td>
    </tr>

    <tr class="tdbg" align="middle">
      <td colSpan="2" height="50">
      <asp:Button ID="BtnSave" runat="server" Text="ȷ������" CssClass="button" OnClick="BtnSave_Click" />
 &nbsp;
        <Input class=button onclick="history.back();" type=button value=ȡ������ name=Submit></td>
    </tr>
  </table>
</asp:Panel>
