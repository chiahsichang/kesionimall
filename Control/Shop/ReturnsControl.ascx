<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ReturnsControl.ascx.cs" Inherits="Kesion.NET.WebSite.Shop.ReturnsControl" %>
  <%@ Import Namespace="Kesion.Cache"%>
<KS:TopNav ID="TopNav1" runat="server" Text="�����˻��˿��" />
<table class="Border" cellSpacing=1 cellPadding=2 width="99%" align="center" border=0>
    <tr class="Title" align=middle>
      <td colSpan=2 height=25><B>¼���˻��˿���Ϣ</B></td>
    </tr>
    <tr class=tdbg>
      <td align=right width="15%">�ͻ�������</td>
      <td><asp:Label ID="LabUserName" runat="server" Text=""></asp:Label>(<asp:Label ID="LabClientName" runat="server" Text=""></asp:Label>)</td>
        
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
                <span style="font-weight:bold;font-size:16px;color:brown"><%=MyCache.GetCurrencySymbol %><asp:Label ID="LabOrderTotalPrice" runat="server" Text=""></asp:Label></span> <%=MyCache.GetCurrencyUnit %>
                &nbsp;&nbsp;�� �� �<span style="font-weight:bold;font-size:16px;color:green"><%=MyCache.GetCurrencySymbol %><asp:Label ID="LabMoneyReceipt" runat="server" Text=""></asp:Label></span> <%=MyCache.GetCurrencyUnit %>
                
                </td>
            <td></td>
          </tr>

        </table>
      </td>
    </tr>
    <tr class=tdbg style="display:none">
      <td align=right width="15%">�ջ���Ϣ��</td>
      <td>
      ���ͷ�ʽ��<asp:Label ID="LabDeliveryType" runat="server" Text=""></asp:Label><br />
      �� �� �ˣ�<asp:Label ID="LabRealName" runat="server" Text=""></asp:Label><br />
      �ջ���ַ��<asp:Label ID="LabAddress" runat="server" Text=""></asp:Label><br />
      ��ϵ�绰��<asp:Label ID="LabTel" runat="server" Text=""></asp:Label><br />
      �������룺<asp:Label ID="LabZipCode" runat="server" Text=""></asp:Label><br />
      
      
      </td>
    </tr>
    
    <tr class=tdbg>
      <td align=right width="15%">�˻��˿����ڣ�</td>
      <td>
          <asp:TextBox  CssClass="textbox" ID="TxtDeliverDate" runat="server"></asp:TextBox>
          ��ʽ:YYYY-MM-DD hh:mm:ss</td>
    </tr>


    <tr class="tdbg">
      <td align="right" width="15%">�����ˣ�</td>
      <td>
      <asp:TextBox  CssClass="textbox" ID="TxtAdminName" runat="server" Width="200px"></asp:TextBox>
    </tr>
    <tr class="tdbg">
      <td align="right" width="15%">�˻��˿�ԭ��</td>
      <td>
      <asp:TextBox  CssClass="textbox" ID="TxtRemark" runat="server" Width="350px"></asp:TextBox>
      <span class="tips">����֪ͨ�ĸ������ݣ����Բ��</span>
    </tr>
    <tbody id="refund" runat="server">
     <tr class="tdbg">
      <td align="right" width="15%">�˿��</td>
      <td>
      <asp:TextBox  CssClass="textbox" ID="TxtMoney" runat="server" Width="50px"></asp:TextBox> <%=MyCache.GetCurrencyUnit %>
      </td>
    </tr>
     <tr class="tdbg">
      <td align="right" width="15%">�˿ʽ��</td>
      <td>
       <asp:RadioButtonList ID="RdbReturnMoneyType" runat="server">
        <asp:ListItem Value="1" Selected>�۳��Ľ����ӵ���Ա�ʽ������</asp:ListItem>
        <asp:ListItem Value="2">����������ʽ��������ת�ʣ��ֽ𽻸��ȵ�</asp:ListItem>
       </asp:RadioButtonList>
      </td>
    </tr>
     <tbody id='returnbank' style='display:none'>
     <tr class="tdbg">
        <td  align="right">�˻ص��������ƣ�</td>
         <td> 
          <asp:TextBox ID="TxtMoneyReturnBankName" MaxLength="100" width="200" runat="server" CssClass="textbox"></asp:TextBox> <span class="tips">���й���������ĳĳ������</span>
         </td>
     </tr>
     <tr class="tdbg">
        <td  align="right">�˻ص����п��ţ�</td>
         <td> 
          <asp:TextBox ID="TxtMoneyReturnBankCard" MaxLength="100" width="200"  runat="server" CssClass="textbox"></asp:TextBox> <span class="tips">����ȷ��д���п��š�</span>
         </td>
     </tr>
     <tr class="tdbg">
        <td align="right">���п��Ż�����</td>
         <td> 
          <asp:TextBox ID="TxtMoneyReturnCardName" MaxLength="100" width="200" runat="server" CssClass="textbox"></asp:TextBox> <span class="tips">����ȷ��д���п�������</span>
         </td>
     </tr>
     </tbody>
    
    </tbody>
    <tr class=tdbg>
      <td align=right width="15%">֪ͨ��Ա��</td>
      <td>
      <asp:CheckBox ID="SendMessageToUser" runat="server" Checked="true" Text="ͬʱʹ��վ�ڶ���֪ͨ��Ա�Ѿ��ɹ��˻��˿�" /><br />
      <asp:CheckBox ID="SendMailToUser" runat="server" Checked="true" Text="ͬʱ�����ʼ�֪ͨ��Ա�Ѿ��ɹ��˻��˿�" /><br />
      <%
       if (MyCache.GetCacheConfig(32) == "1")
        {  
      %>
      <asp:CheckBox ID="SendMobileToUser" runat="server" Checked="true" Text="ͬʱ�����ֻ�����֪ͨ��Ա�Ѿ��ɹ��˻��˿�" /></td>
      <%} %>
    </tr>
    <tr class=tdbg align=middle>
      <td colSpan=2 height=30 style="color:Red">
     ע�⣺�˿���Ϣһ��¼�룬�Ͳ������޸Ļ�ɾ��,���Ҷ������Զ��������ϣ������ڱ���֮ǰȷ����������</td>
    </tr>

    <tr class=tdbg align=middle>
      <td colSpan=2 height=30>
      <asp:Button ID="BtnSave" runat="server" Text="ȷ���˻�" CssClass="button" OnClick="BtnSave_Click" />
 &nbsp;
        <Input class=button onclick="parent.box.close();" type=button value=ȡ������ name=Submit></td>
    </tr>
  </table>

<script>
    function showbank() {
        var checkrad = jQuery("#<%=this.RdbReturnMoneyType.ClientID %> :radio[checked]").val();
        if (checkrad == 2) {
            jQuery("#returnbank").show();
        } else {
            jQuery("#returnbank").hide();
        }
    }
    jQuery(document).ready(function() {
        showbank();
    });
</script>