<%@ Control Language="C#" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.Shop.InvoiceControl" Codebehind="InvoiceControl.ascx.cs" %>
<%@ Import Namespace="Kesion.Cache"%>

<KS:TopNav ID="TopNav1" runat="server" Text="��������Ʊ����" />
<table class="Border" cellSpacing=1 cellPadding=2 width="99%" align="center" border=0>
   
    <tr class=tdbg>
      <td align=right width="15%">�ͻ�������</td>
      <td>
          <asp:Label ID="LabUserName" runat="server" Text=""></asp:Label>
          (<asp:Label ID="LabClientName" runat="server" Text=""></asp:Label>)</td>
        
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
               <span style="font-weight:bold;font-size:16px;color:brown">  <%=MyCache.GetCurrencySymbol %><asp:Label ID="LabOrderTotalPrice" runat="server" Text=""></asp:Label></span> <%=MyCache.GetCurrencyUnit %>
               &nbsp;�� �� �<span style="font-weight:bold;font-size:16px;color:greeh">  <%=MyCache.GetCurrencySymbol %><asp:Label ID="LabMoneyReceipt" runat="server" Text=""></asp:Label></span> <%=MyCache.GetCurrencyUnit %>
               </td>
            <td></td>
          </tr>

        </table>
      </td>
    </tr>
    <tr class=tdbg>
      <td align=right width="15%">
          ��Ʊ��Ϣ��</td>
      <td>
          ��Ҫ��Ʊ��<asp:Label ID="LabNeedInvoice" runat="server"></asp:Label><br />
          <asp:Label ID="LabInoviceTitle" runat="server"></asp:Label><br />
          <%if (!string.IsNullOrEmpty(dr["remark"].ToString())){ %>
          �������ԣ�<%=dr["remark"].ToString() %>
          <%} %>
      </td>
    </tr>
    
    <tr class=tdbg>
      <td align=right width="15%">
          ��Ʊ���ڣ�</td>
      <td>
          <asp:TextBox  CssClass="textbox" ID="TxtInvoiceDate" runat="server"></asp:TextBox>
          ��ʽ:YYYY-MM-DD hh:mm:ss</td>
    </tr>


    <tr class="tdbg">
      <td align="right" width="15%">
          �� Ʊ �ˣ�</td>
      <td>
      <asp:TextBox  CssClass="textbox" ID="TxtHandlerName" runat="server" Width="200px"></asp:TextBox>
    </tr>
    <tr class="tdbg">
      <td align="right" width="15%" style="height: 23px">
          ��Ʊ���ͣ�</td>
      <td style="height: 23px">
          <asp:DropDownList ID="DrpInvoiceType" runat="server">
          <asp:ListItem Value="��˰��ͨ��Ʊ">��˰��ͨ��Ʊ</asp:ListItem>
          <asp:ListItem Value="��˰��ͨ��Ʊ">��˰��ͨ��Ʊ</asp:ListItem>
          <asp:ListItem Value="��ֵ˰ר�÷�Ʊ">��ֵ˰ר�÷�Ʊ</asp:ListItem>
          </asp:DropDownList>
    </tr>
    <tr class="tdbg">
        <td align="right" width="15%">
            ��Ʊ���룺</td>
        <td>
            <asp:TextBox  CssClass="textbox" ID="TxtInvoiceNum" runat="server" Width="200px"></asp:TextBox></td>
    </tr>
    <tr class="tdbg">
        <td align="right" width="15%">
            ��Ʊ̧ͷ��</td>
        <td>
            <asp:TextBox  CssClass="textbox" ID="TxtInvoiceTitle" runat="server" Width="200px"></asp:TextBox></td>
    </tr>
    <tr class="tdbg">
        <td align="right" width="15%">
            ��Ʊ��</td>
        <td>
            <asp:TextBox  CssClass="textbox" ID="TxtMoneyTotal" runat="server" Width="60px"></asp:TextBox>
             <%=MyCache.GetCurrencyUnit %></td>
    </tr>
    <tr class="tdbg">
        <td align="right" width="15%">
            ��Ʊ���ݣ�</td>
        <td>
            <asp:TextBox  CssClass="textbox" ID="TxtInvoiceContent" runat="server" Width="200px"></asp:TextBox></td>
    </tr>
    <tr class=tdbg>
      <td align=right width="15%">֪ͨ��Ա��</td>
      <td>
      <asp:CheckBox ID="SendMessageToUser" runat="server" Checked="true" Text="ͬʱʹ��վ�ڶ���֪ͨ��Ա��Ʊ�ѿ���" /><br />
      <asp:CheckBox ID="SendMailToUser" runat="server" Checked="true" Text="ͬʱ�����ʼ�֪ͨ��Ա��Ʊ�ѿ���" />
      <%
       if (MyCache.GetCacheConfig(32) == "1")
        {  
      %><br />
      <asp:CheckBox ID="SendMobileToUser" runat="server" Checked="true" Text="ͬʱ�����ֻ�����֪ͨ��Ա��Ʊ�ѿ���" /></td>
      <%} %>
      
    </tr>


    <tr class=tdbg align=middle>
      <td colSpan=2 height=30>
      <asp:Button ID="BtnSave" runat="server" Text="ȷ����Ʊ" CssClass="button" OnClick="BtnSave_Click" />
 &nbsp;
        <Input class=button onclick="parent.box.close();" type=button value=ȡ������ name=Submit></td>
    </tr>
  </table>
