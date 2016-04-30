<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="CountOrderControl.ascx.cs" Inherits="Kesion.NET.WebSite.Shop.CountOrderControl" %>
 <table width="99%" style="margin-top:10px" border="0" align="center" cellpadding="1" cellspacing="1" class="CTable">
					  <tr class="tdbg">
						<td height='25' class='clefttitle' colspan='4'><strong>按时间段统计</strong> </td>
					  </tr>
					  <tr class="tdbg">
						<td height="30">&nbsp;&nbsp;开始日期<asp:TextBox CssClass="textbox" onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'});" ID="TxtBeginDate" runat="server"></asp:TextBox>
						&nbsp;&nbsp;
						结束日期
						<asp:TextBox CssClass="textbox" onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'});" ID="TxtEndDate" runat="server"></asp:TextBox> </td>
					  </tr>
					  <tr class="tdbg">
					   <td align="center">
					     <asp:Button CssClass="button" Text=" 开 始 统 计 " runat="server" ID="Button1" OnClick="Button1_Click" />
					   </td>
			 </tr>
</table>
<strong><asp:Label ID="LabTips" runat="server"></asp:Label></strong>
 <table width="90%" cellspacing="0" cellpadding="3" id="order_circs-table">
      <tr>
        <td align="center">
         <object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000"  codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,0,0" WIDTH="650" HEIGHT="400" id="OrderGeneral" ALIGN="middle">
          <PARAM NAME="FlashVars" value="&dataXML=<graph caption='订单概况' decimalPrecision='2' showPercentageValues='0' showNames='1' showValues='1' showPercentageInLabel='0' pieYScale='45' pieBorderAlpha='40' pieFillAlpha='70' pieSliceDepth='15' pieRadius='100' outCnvBaseFontSize='13' baseFontSize='12'><set value='<%=YQR%>' name='已确认' color='FFCC33' /><set value='<%=YCJ%>' name='已结清' color='33FF66' /><set value='<%=WQR%>' name='未确认' color='FF6600'  /><set value='<%=WX%>' name='无效订单' color='999999'  /></graph>">
          <PARAM NAME="movie" value="../../ks_inc/part/pie3d.swf?chartWidth=650&chartHeight=400">
          <PARAM NAME="quality" value="high">
          <PARAM NAME="bgcolor" value="#FFFFFF">
          <param name="wmode" value="opaque" />
          <EMBED src="../../ks_inc/part/pie3d.swf?chartWidth=650&chartHeight=400" FlashVars="&dataXML=<graph caption='订单概况' decimalPrecision='2' showPercentageValues='0' showNames='1' showValues='1' showPercentageInLabel='0' pieYScale='45' pieBorderAlpha='40' pieFillAlpha='70' pieSliceDepth='15' pieRadius='100' outCnvBaseFontSize='13' baseFontSize='12'><set value='<%=YQR%>' name='已确认' color='FFCC33' /><set value='<%=YCJ%>' name='已结清' color='33FF66' /><set value='<%=WQR%>' name='未确认' color='FF6600'  /><set value='<%=WX%>' name='无效订单' color='999999'  /></graph>" quality="high" bgcolor="#FFFFFF" WIDTH="650" HEIGHT="400" wmode="opaque" NAME="OrderGeneral" ALIGN="middle" TYPE="application/x-shockwave-flash" PLUGINSPAGE="http://www.macromedia.com/go/getflashplayer"></EMBED>
          </OBJECT>
                </td>
      </tr>
    </table>