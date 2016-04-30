<%@ Control Language="C#" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.Shop.DeliveryControl" Codebehind="DeliveryControl.ascx.cs" %>
<%@ Import Namespace="Kesion.Cache"%>

<asp:Panel ID="Panel1" runat="server">
<KS:TopNav ID="TopNav1" runat="server" Text="������������" />
<table class="CTable" cellSpacing=1 cellPadding=1 width="99%" border=0>
    <tr class=tdbg>
      <td align=right width="15%">�ͻ�������</td>
      <td><asp:Label ID="LabClientName" runat="server" Text=""></asp:Label></td>
        
    </tr>
    <tr class=tdbg>
      <td align=right width="15%">�û�����</td>
      <td><asp:Label ID="LabUserName" runat="server" Text=""></asp:Label></td>
    </tr>
    <tr class=tdbg>
      <td align=right width="15%">֧�����ݣ�</td>
      <td>
        <table cellSpacing=2 cellPadding=0 border=0>
          <tr class=tdbg>
            <td align=right width="15%">������ţ�</td>
            <td><asp:Label ID="LabOrderID" runat="server" Text=""></asp:Label></td>
            <td>&nbsp;</td>
          </tr>
          <tr class=tdbg>
            <td align=right width="15%">������</td>
            <td>
                <span style="font-weight:bold;font-size:16px;color:brown"><%=MyCache.GetCurrencySymbol %><asp:Label ID="LabOrderTotalPrice" runat="server" Text=""></asp:Label></span> <%=MyCache.GetCurrencyUnit %>   �Ѹ�� <%=MyCache.GetCurrencySymbol %><span style="font-weight:bold;font-size:16px;color:green"><asp:Label ID="LabMoneyReceipt" runat="server" Text=""></asp:Label></span> <%=MyCache.GetCurrencyUnit %></td>
          <td></td>
          </tr>
        </table>
      </td>
    </tr>
    <tr class=tdbg>
      <td align=right width="15%">�ջ���Ϣ��</td>
      <td>
      ���ͷ�ʽ��<asp:Label ID="LabDeliveryType" runat="server" Text=""></asp:Label><br />
      �ջ���ַ��<asp:Label ID="LabAddress" runat="server" Text=""></asp:Label>���� �� �ˣ�<asp:Label ID="LabRealName" runat="server" Text=""></asp:Label>
      &nbsp;&nbsp;��ϵ�绰��<asp:Label ID="LabTel" runat="server" Text=""></asp:Label>
      &nbsp;&nbsp;�������룺<asp:Label ID="LabZipCode" runat="server" Text=""></asp:Label>��
      
      
      </td>
    </tr>
    
    <tr class=tdbg id="alipay" visible="false" runat="server">
      <td align=right width="15%">֧�������׺ţ�</td>
      <td><asp:Label ID="LabAlipaytradeno" Text="" runat="server"></asp:Label>
      <br /><span style='font-weight:Bold;color:green'>��������֧������������,��������ͬʱ�ı�֧��������״̬��</span></td>
    </tr>

    
    <tr class=tdbg>
      <td align=right width="15%">�������ڣ�</td>
      <td>
          <asp:TextBox  CssClass="textbox" ID="TxtDeliverDate" runat="server"></asp:TextBox>
          ��ʽ:YYYY-MM-DD hh:mm:ss</td>
    </tr>
    <tr class=tdbg>
      <td align=right width="15%">��ݹ�˾��</td>
      <td>
         <asp:DropDownList CssClass="select" ID="DrpDeliveryCorpId" runat="server"></asp:DropDownList>
      </td>
    </tr>
    <tr class=tdbg>
      <td align=right width="15%">��ݵ��ţ�</td>
      <td>
      <asp:TextBox  CssClass="textbox" ID="TxtExpressOrderID" runat="server" Width="200px"></asp:TextBox>
    </tr>
    <tr class=tdbg>
      <td align=right width="15%">�����ˣ�</td>
      <td>
      <asp:TextBox  CssClass="textbox" ID="TxtAdminName" runat="server" Width="200px"></asp:TextBox>
    </tr>
    <tr class=tdbg>
      <td align=right width="15%">��ע��</td>
      <td>
      <asp:TextBox  CssClass="textbox" ID="TxtRemark" runat="server" Width="350px"></asp:TextBox>
    </tr>
    
    <tr class=tdbg>
      <td align=right width="15%">֪ͨ��Ա��</td>
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

    <tr class=tdbg align=middle>
      <td colSpan=2 height=30>
      <asp:Button ID="BtnSave" runat="server" Text="ȷ������" CssClass="button" OnClick="BtnSave_Click" />
 &nbsp;
        <Input class=button onclick="parent.box.close();" type=button value=ȡ������ name=Submit></td>
    </tr>
  </table>
</asp:Panel>

<asp:Panel ID="Panel2" runat="server">
<KS:TopNav ID="TopNav2" runat="server" Text="����ȷ������" />
<table class="Border" cellSpacing=1 cellPadding=2 width="99%" align="center" border=0>
    <tr class="Title" align=middle>
      <td colSpan=2 height=25><B>¼��������Ϣ</B></td>
    </tr>
    <tr class=tdbg>
      <td align=right width="15%"  height="30" class="lefttd">�Ź���Ʒ���ƣ�</td>
      <td><asp:Label ID="LabTitle" runat="server"></asp:Label>
         <asp:HiddenField ID="HidInfo" Value="0" runat="server" />

      </td>
        
    </tr>
    <tr class=tdbg>
      <td align=right width="15%"  height="30" class="lefttd">�����ţ�</td>
      <td><%=dr["orderid"].ToString() %></td>
        
    </tr>
    <tr class=tdbg>
      <td align=right width="15%" height="30" class="lefttd">�ֻ����룺</td>
      <td><%=dr["mobile"].ToString() %></td>
    </tr>
    <%if (!string.IsNullOrEmpty(dr["VerifyCode"].ToString()))
      { %>
    <tr class=tdbg>
      <td align=right width="15%" height="30" class="lefttd">��֤�룺</td>
      <td><%=dr["VerifyCode"].ToString() %></td>
    </tr>
    <%} %>
    <tr class=tdbg>
      <td align=right width="15%"  class="lefttd" height="30">���ѣ�</td>
      <td>
         ���ô���<span style="color:red"><asp:Label ID="LabTimes" runat="server">0</asp:Label></span>��
          
          ��������
          <asp:DropDownList ID="DrpTimes" runat="server">
          </asp:DropDownList>
          ��

      </td>
    </tr>
    <tr class=tdbg>
      <td align=right width="15%"  class="lefttd">��ע��</td>
      <td>
          <asp:TextBox ID="TxtRemark2" TextMode="MultiLine" Width="300px" Height="70px" Text="��������" runat="server" CssClass="textbox" />
         
      </td>
    </tr>
    <tr class=tdbg>
      <td align=right  class="lefttd">�����ˣ�</td>
      <td>
      <asp:TextBox  CssClass="textbox" ID="TxtAdminName2" runat="server" Width="200px"></asp:TextBox>
    </tr>
    <tr class=tdbg align="middle">
      <td colSpan=2 height="70">
      <asp:Button ID="Button1" runat="server" Text="ȷ������" CssClass="button" OnClick="Button1_Click"/>
 &nbsp;
        <Input class=button onclick="parent.box.close();" type=button value=ȡ������ name=Submit></td>
    </tr>
  </table>

</asp:Panel>