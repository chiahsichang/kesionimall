<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="CountSaleControl.ascx.cs" Inherits="Kesion.NET.WebSite.Shop.CountSaleControl" %>
<%@ Import Namespace="Kesion.Cache" %>
 <table width="99%" style="margin-top:10px" border="0" align="center" cellpadding="1" cellspacing="1" class="CTable">
					  <tr class="tdbg">
						<td height='25' class='clefttitle' colspan='4' style="text-align:left"><strong>���²鿴����</strong> </td>
					  </tr>
					  <tr class="tdbg">
						<td height="30">&nbsp;&nbsp;
						<asp:DropDownList ID="DrpStartYear" runat="server">
						
						</asp:DropDownList>
						��
						<asp:DropDownList ID="DrpStartMonth" runat="server">
						</asp:DropDownList>
						��
						��
						<asp:DropDownList ID="DrpEndYear" runat="server">
						</asp:DropDownList>
						��
						<asp:DropDownList ID="DrpEndMonth" runat="server">
						</asp:DropDownList>��
						<asp:Button ID="Button1" runat="server" CssClass="button" Text=" �鿴���� " OnClick="Button1_Click1"></asp:Button>
						</td>
					  </tr>
					  <tr class="tdbg">
						<td height='25' class='clefttitle' colspan='4' style="text-align:left"><strong>����鿴����</strong> </td>
					  </tr>
					  <tr class="tdbg">
						<td height="30">&nbsp;&nbsp;
						<asp:DropDownList ID="DrpYearStart" runat="server">
						</asp:DropDownList>
						��
						��
						<asp:DropDownList ID="DrpYearEnd" runat="server">
						</asp:DropDownList>��
						
						<asp:Button ID="Button2" runat="server" CssClass="button" Text=" �鿴���� " OnClick="Button2_Click" />
						</td>
					  </tr>
		</table>   

      <!-- Ӫҵ�� -->
	  <div style="margin:10px;font-weight:Bold;color:#ff6600;font-size:14px">��Ч���۶�����(<asp:Label ID="LabTips2" runat="server"></asp:Label>)</div>
      <table width="90%" id="turnover-table">
        <tr><td align="center">
          <object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000"
            codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,0,0"
            width="100%" height="420" id="Object1" align="middle">
            <param NAME="movie" VALUE="../../ks_inc/part/column3d.swf?dataXML=<chart caption='' xAxisName='Ӫҵ��(��λ:<%=MyCache.GetCurrencyUnit %>)' showValues='0' decimals='0' formatNumberScale='0'><%=SalesXmlStr%></chart>">
            <param NAME="quality" VALUE="high">
            <param NAME="bgcolor" VALUE="#FFFFFF">
            <embed src="../../ks_inc/part/column3d.swf?dataXML=<chart caption='' xAxisName='Ӫҵ��(��λ:<%=MyCache.GetCurrencyUnit %>)' showValues='0' decimals='0' formatNumberScale='0'><%=SalesXmlStr%></chart>" quality="high" bgcolor="#FFFFFF"  width="100%" height="420" name="FCColumn2" align="middle" type="application/x-shockwave-flash" pluginspage="http://www.macromedia.com/go/getflashplayer"></object>
        </td></tr>
      </table>
    </div>


<div style="margin:10px;font-weight:Bold;color:#ff6600;font-size:14px">��Ч��������(<asp:Label ID="LabTips1" runat="server"></asp:Label>)</div>
   <div id="tabbody-div">
      <!-- �������� -->
      <table width="90%" id="order-table">
        <tr><td align="center">
          <object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000"
            codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,0,0"
            width="100%" height="420" id="FCColumn2" align="middle">
            <param NAME="movie" VALUE="../../ks_inc/part/column3d.swf?dataXML=<chart caption='' xAxisName='������(��λ:��)' showValues='0' decimals='0' formatNumberScale='0'><%=OrderXmlStr%></chart>">
            <param NAME="quality" VALUE="high">
            <param NAME="bgcolor" VALUE="#FFFFFF">
            <embed src="../../ks_inc/part/column3d.swf?dataXML=<chart caption='' xAxisName='������(��λ:��)' showValues='0' decimals='0' formatNumberScale='0'><%=OrderXmlStr%></chart>" quality="high" bgcolor="#FFFFFF"  width="100%" height="420" name="FCColumn2" align="middle" type="application/x-shockwave-flash" pluginspage="http://www.macromedia.com/go/getflashplayer"></object>
        </td></tr>
      </table>

    




<script type="text/javascript">
showtips('<span class="state"><strong>˵����</strong><br /></span>����Ч������ָ���Ƕ����ѱ�ȷ�ϻ����ѱ��ᵥ�Ķ���,����Ч���۶ָ�����ѱ�ȷ�ϻ����ѱ�����Ķ��������ܶ�!');
</script>
