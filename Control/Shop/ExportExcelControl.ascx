<%@ Control Language="C#" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.Shop.ExportExcelControl" Codebehind="ExportExcelControl.ascx.cs" %>
<%@ Import Namespace="Kesion.Cache"%>

<KS:TopNav ID="TopNav1" runat="server" Text="��������Excel" />
<table class="Border" cellSpacing=1 cellPadding=2 width="99%" align="center" border=0>
    <tr class="Title" align=middle>
      <td height=25><B>��Ҫ�������ֶ�</B></td>
      <td height=25><B>��������</B></td>
    </tr>
    <tr class=tdbg>
      <td style="text-align:center;width:350px;">
              <script>
                  function SelectAll(f) {
                      jQuery("#"+f+" option").each(function () {
                          jQuery(this).attr("selected", true);
                      });
                  }
                  function UnSelectAll(f) {
                      jQuery("#" + f + " option").each(function () {
                          jQuery(this).attr("selected", false);
                      });
                  }
    </script>
        <asp:ListBox ID="LstField" runat="server" SelectionMode="Multiple" Width="250px" Height="280px">
            <asp:ListItem Value="OrderID" Selected="True">�������</asp:ListItem>
            <asp:ListItem Value="UserName"  Selected="True">�û���</asp:ListItem>
            <asp:ListItem Value="OrderTotalPrice" Selected="True">�����ܽ��</asp:ListItem>
            <asp:ListItem Value="RealName" Selected="True">��ϵ��</asp:ListItem>
            <asp:ListItem Value="Tel"  Selected="True">��ϵ�绰</asp:ListItem>
            <asp:ListItem Value="Mobile"  Selected="True">�ֻ�</asp:ListItem>
            <asp:ListItem Value="Address" Selected="True">�ͻ���ַ</asp:ListItem>
            <asp:ListItem Value="ZipCode" Selected="True">��������</asp:ListItem>
            <asp:ListItem Value="InputTime" Selected="True">����ʱ��</asp:ListItem>
            <asp:ListItem Value="ProductList" Selected="True" style="color:Red">��Ʒ���Ƽ���������</asp:ListItem>
            <asp:ListItem Value="OrderStatus" Selected="True">����״̬</asp:ListItem>
            <asp:ListItem Value="MoneyReceipt">�Ѹ�����</asp:ListItem>
            <asp:ListItem Value="SpecifiedDate">�ͻ�ָ����������</asp:ListItem>
            <asp:ListItem Value="deliveryTime">�ͻ�ָ�����ͻ�ʱ��</asp:ListItem>
            <asp:ListItem Value="Email">Email</asp:ListItem>
            <asp:ListItem Value="Invoiced">��Ʊ��Ϣ</asp:ListItem>
            <asp:ListItem Value="Freight">�˷�</asp:ListItem>
            <asp:ListItem Value="Taxes">˰��</asp:ListItem>
            <asp:ListItem Value="PayDiscountMoney">���ʽ�Ż�</asp:ListItem>
            <asp:ListItem Value="deliveryDate">����ʱ��</asp:ListItem>
            <asp:ListItem Value="ChangeScore">�һ�����</asp:ListItem>
            <asp:ListItem Value="Remark">������ע</asp:ListItem>
            <asp:ListItem Value="OrderType">��������</asp:ListItem>
            <asp:ListItem Value="ConsumptionMode">���ѷ�ʽ</asp:ListItem>
            <asp:ListItem Value="VerifyCode">������֤��</asp:ListItem>
         </asp:ListBox>
          <br />
           <input onclick="SelectAll('<%=this.LstField.ClientID %>    ')" type="button" class="button" value="ѡ�������ֶ�" name="Submit" /><br />
   <input onclick="UnSelectAll('<%=this.LstField.ClientID %>    ')" type="button" value="ȡ��ѡ���ֶ�" class="button" name="Submit" />
          <div class="tips">TIPS����Ctrl����Shift���Զ�ѡ��</div>
      </td>
      <td valign="top" style="line-height:26px;">
          <strong>�������ͣ�</strong>
          <asp:RadioButtonList ID="RdbOrderType" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow">
             <asp:ListItem Value="-1" Selected="True">����</asp:ListItem>
             <asp:ListItem Value="1">�Ź�����</asp:ListItem>
             <asp:ListItem Value="2">�̳Ƕ���</asp:ListItem>
              </asp:RadioButtonList>
          <br />
          <strong>����ģʽ��</strong>
          <asp:RadioButtonList ID="RdbConsumptionMode" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow">
             <asp:ListItem Value="-1" Selected="True">����</asp:ListItem>
             <asp:ListItem Value="1">ƾ������</asp:ListItem>
             <asp:ListItem Value="2">��Ҫ�ʼ�</asp:ListItem>
              </asp:RadioButtonList>
          <br />
          <strong>���ڷ�Χ��</strong>
        <input type="radio" name="limitDate" value="1" onclick="jQuery('#showdate').show();" checked="checked"/>����
        <input type="radio" name="limitDate" value="0" onclick="jQuery('#showdate').hide();" />������

       <div id="showdate">
       <strong>�������ڣ�</strong>��<asp:TextBox onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'});" ID="TxtBeginDate" CssClass="textbox" runat="server"></asp:TextBox>��
       <asp:TextBox onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'});" ID="TxtEndDate" CssClass="textbox" runat="server" />
      </div>
         <strong>����״̬��</strong><asp:RadioButtonList ID="RdbPayFlag" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow">
             <asp:ListItem Value="0" Selected="True">����</asp:ListItem>
             <asp:ListItem Value="1">�������Ѹ���</asp:ListItem>
             <asp:ListItem Value="2">������δ����</asp:ListItem>
              </asp:RadioButtonList>
          <br />
          <strong>�޶�������</strong>
     <asp:DropDownList ID="DrpExportTJ" runat="server">
                      <asp:ListItem Value="1">������</asp:ListItem>
                      <asp:ListItem Value="2">�û���</asp:ListItem>
                      <asp:ListItem Value="3">��ϵ��</asp:ListItem>
                      <asp:ListItem Value="3">�ֻ���</asp:ListItem>
                   </asp:DropDownList>
    <asp:TextBox  style="color:#ccc" Text="" CssClass="textbox" ID="TxtExportKey" runat="server"></asp:TextBox>
      
     <br />

      </td>
        
    </tr>


    <tr class=tdbg align=middle>
      <td colSpan=2 height=30>
      <asp:Button ID="BtnSave" runat="server" Text="ȷ������" CssClass="button" OnClick="BtnSave_Click" />
 &nbsp;
        <Input class=button onclick="history.back();" type=button value=ȡ������ name=Submit></td>
    </tr>
  </table>
