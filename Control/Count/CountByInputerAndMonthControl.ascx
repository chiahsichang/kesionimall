<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="CountByInputerAndMonthControl.ascx.cs" Inherits="Kesion.NET.WebSite.CountByInputerAndMonthControl" %>
<%@ Import Namespace="Kesion.Cache" %>

<KS:TopNav ID="TopNav1" runat="server" />
<asp:Panel ID="Panel1" runat="server" Width="100%">
<script type="text/javascript">
    function showTime(){
                var l=jQuery("input[name=<%=this.RdbCountDate.UniqueID %>]").length;   
                 for(i=0;i<l;i++){
                 if(jQuery('#<%=this.RdbCountDate.ClientID %>_'   +   i).attr("checked")==true){
                  if (jQuery('#<%=this.RdbCountDate.ClientID %>_'   +   i).attr("value")=="2"){
                   jQuery("#showdate").css("display","");
                   }
                  else{
                   jQuery("#showdate").css("display","none");
                   }
                 }
            }
       }
    </script>
    <table  width="98%" align="center" border="0" cellpadding="1" cellspacing="1" class="CTable">
		<tr>
			<td align='right' class='lefttd'><strong>选择录入者：</strong></td>
            <td class="righttd">
                <asp:ListBox ID="LstbInputer" runat="server" Height="280px" Width="180px" SelectionMode="Multiple"></asp:ListBox>
			</td>
			<td align='right' class='lefttd'><strong>选择栏目：</strong></td>
			<td class="righttd">
    <select style="WIDTH: 250px; HEIGHT: 280px" multiple="multiple" size=2 name="ClassID" id="ClassID">
      <%=MyCache.GetClassOptionList(0) %>
    </select>
            </td>
		</tr>
		<tr>
			<td align='right' class='lefttd'><strong>统计日期范围：</strong></td>
			<td class="righttd" colspan="3">
                <asp:RadioButtonList ID="RdbCountDate" runat="server" RepeatDirection="horizontal">
                <asp:ListItem Value="1" Selected="True">统计本年度的文档</asp:ListItem>
                <asp:ListItem Value="2">统计指定时间段的文档</asp:ListItem>
                </asp:RadioButtonList>
			<div id="showdate" style="display:none">
			起始日期：<asp:TextBox ID="TxtBeginDate" runat="server" onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'});"></asp:TextBox>
			结束日期：<asp:TextBox ID="TxtEndDate" runat="server" onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'});"></asp:TextBox>
			</div>
			</td>
		</tr>
        		
	</table>
        <script type="text/javascript">
		showtips('<span class="state"><strong>Tips：</strong><br /></span>栏目/录入者可以按住“Shift” 或“Ctrl”键进行多个选择，栏目不选则表示所有，此处选择的栏目不包括子栏目,如要统到子栏目请将子栏目一并选择。');
		</script>
	<br />
	<KS:Foot ID="Foot1" runat="server" OnSubmit="Foot1_Submit" />
	</asp:Panel>
	
	<asp:Panel ID="Panel2" runat="server" Visible="false">
     <asp:Label ID="Label1" runat="server"></asp:Label>
     <div style="margin:10px;text-align:center"><input type="button" value=" 返 回 " onclick="javascript:history.back()" class="button"/></div>
    </asp:Panel>