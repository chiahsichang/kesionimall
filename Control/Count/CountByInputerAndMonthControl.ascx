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
			<td align='right' class='lefttd'><strong>ѡ��¼���ߣ�</strong></td>
            <td class="righttd">
                <asp:ListBox ID="LstbInputer" runat="server" Height="280px" Width="180px" SelectionMode="Multiple"></asp:ListBox>
			</td>
			<td align='right' class='lefttd'><strong>ѡ����Ŀ��</strong></td>
			<td class="righttd">
    <select style="WIDTH: 250px; HEIGHT: 280px" multiple="multiple" size=2 name="ClassID" id="ClassID">
      <%=MyCache.GetClassOptionList(0) %>
    </select>
            </td>
		</tr>
		<tr>
			<td align='right' class='lefttd'><strong>ͳ�����ڷ�Χ��</strong></td>
			<td class="righttd" colspan="3">
                <asp:RadioButtonList ID="RdbCountDate" runat="server" RepeatDirection="horizontal">
                <asp:ListItem Value="1" Selected="True">ͳ�Ʊ���ȵ��ĵ�</asp:ListItem>
                <asp:ListItem Value="2">ͳ��ָ��ʱ��ε��ĵ�</asp:ListItem>
                </asp:RadioButtonList>
			<div id="showdate" style="display:none">
			��ʼ���ڣ�<asp:TextBox ID="TxtBeginDate" runat="server" onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'});"></asp:TextBox>
			�������ڣ�<asp:TextBox ID="TxtEndDate" runat="server" onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'});"></asp:TextBox>
			</div>
			</td>
		</tr>
        		
	</table>
        <script type="text/javascript">
		showtips('<span class="state"><strong>Tips��</strong><br /></span>��Ŀ/¼���߿��԰�ס��Shift�� ��Ctrl�������ж��ѡ����Ŀ��ѡ���ʾ���У��˴�ѡ�����Ŀ����������Ŀ,��Ҫͳ������Ŀ�뽫����Ŀһ��ѡ��');
		</script>
	<br />
	<KS:Foot ID="Foot1" runat="server" OnSubmit="Foot1_Submit" />
	</asp:Panel>
	
	<asp:Panel ID="Panel2" runat="server" Visible="false">
     <asp:Label ID="Label1" runat="server"></asp:Label>
     <div style="margin:10px;text-align:center"><input type="button" value=" �� �� " onclick="javascript:history.back()" class="button"/></div>
    </asp:Panel>