<%@ Page Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.Admin_Content_DiggList" Title="Untitled Page" Codebehind="KS.DiggList.aspx.cs" %>
<%@ Import Namespace="Kesion.Cache" %>
<asp:Content ID="Content1" ContentPlaceHolderID="KSContent" Runat="Server">

<asp:Panel ID="mainPannel" runat="server" Width="100%">
<div id="manage_top" class="menu_top_fixed">
<ul>
<strong>���ٲ鿴��</strong>
<a href="javascript:void(0)" onclick="parent.openWin('�鿴Digg���ô���','content/KS.Digglist.aspx?action=code',false)"><img src="../../sysimg/s.gif" border="0" align="absmiddle" />���ô���</a>
<a href="?ChannelID=<%=ChannelID %>&Show=1">֧��������<%=ItemName %></a> | 
<a href="?ChannelID=<%=ChannelID %>&Show=2">���������ٵ�<%=ItemName %></a> | 
<a href="?ChannelID=<%=ChannelID %>&Show=3">����Ƽ�ʱ������</a> | 
<a href="?ChannelID=<%=ChannelID %>&Show=4">����Ƽ�ʱ�併��</a> | 
<div id="go">
<asp:DropDownList ID="S_ChannelID" runat="server">
<asp:ListItem Value="0">---��ģ�Ͳ鿴---</asp:ListItem>
</asp:DropDownList>
</div>
</ul>
</div>
<div class="menu_top_fixed_height"></div> 
    <KS:KSGV ID="List" cssclass="CTable" runat="server" Width="99%" PagerType="CustomNumeric" OnRowDataBound="List_RowDataBound" AutoGenerateColumns="False" EmptyDataText="û��digg��¼��" GridLines="None">
        <Columns>
            <asp:TemplateField HeaderText="ѡ��">
                <itemstyle width="45px" HorizontalAlign="Center" />
                <itemtemplate>
                <input type="checkbox"  name="ids" value="<%#Eval("diggid") %>" />
                
</itemtemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="title" HeaderText="���Ƽ�����Ŀ" />
            <asp:BoundField DataField="supportnum" HeaderText="֧����" DataFormatString="{0} ��">
            <itemstyle width="70px" HorizontalAlign="Center" forecolor="Red" />
            </asp:BoundField>
            <asp:BoundField DataField="AgainstNum" HeaderText="������" DataFormatString="{0} ��">
            <itemstyle width="70px" HorizontalAlign="Center" forecolor="green" />
            </asp:BoundField>
            <asp:BoundField DataField="lastdiggtime" HeaderText="����Ƽ�ʱ��">
            <itemstyle width="120px" HorizontalAlign="Center" />
            </asp:BoundField>
            <asp:BoundField DataField="lastdigguser" HeaderText="����Ƽ����û�">
            <itemstyle width="100px" HorizontalAlign="Center" />
            </asp:BoundField>
            <asp:TemplateField HeaderText="����ϸ��Ϣ">
            <itemstyle HorizontalAlign="Center" />
            <itemtemplate>
            <a href="KS.Digg.aspx?ChannelID=<%# Eval("ChannelID") %>&infoid=<%# Eval("infoid") %>">��ϸ��¼</a> | 
            <a href="<%# Kesion.HtmlTags.BasicField.GetItemUrl(Convert.ToInt32(Eval("ChannelID")),Convert.ToInt32(Eval("InfoID"))) %>" target="_blank">���<%# MyCache.GetCacheModel(Convert.ToInt16(Eval("ChannelID")),5) %></a>
            
</itemtemplate>
            </asp:TemplateField>
        </Columns>
        <EmptyDataRowStyle CssClass="emptycss" />
        <HeaderStyle CssClass="CTitle" />
    </KS:KSGV>

    <asp:Panel ID="Panel1" runat="server" Width="100%">
    <table cellpadding="0" cellspacing="0" style="width: 100%;margin-top:10px">
            <tr>
                <td style="height: 25px; width: 314px;">
                    &nbsp;<strong>ѡ��</strong><a href="javascript:Select(0);"><font color="#999999">ȫѡ</font></a> - <a href="javascript:Select(1);"><font color="#999999">��ѡ</font></a> - <a href="javascript:Select(2);"><font color="#999999">��ѡ</font></a>
                    &nbsp; &nbsp; &nbsp;
                                <input type="button" value="ɾ��ѡ�еļ�¼" onmouseover="this.className='button_on';" onmouseout="this.className='button';" class="button" onclick="if (GetIDS('del')){this.form.action='?action=del';this.form.submit()}" />

</td>
            </tr>
        </table>
         <KS:Page ID="Page1" runat="server" />
    </asp:Panel>
  </asp:Panel>
  
    
    
    <asp:Panel ID="codePannel" runat="server" Width="95%" HorizontalAlign="center" Visible="false">
    <KS:TopNav ID="top1" runat="server" Text="�鿴Digg���ô���" />
      <div style="font-weight:bold;text-align:left">��ʽһ</div>
      <img src="../../sysimg/dig/d1.jpg" />
     <textarea onmouseover="javascript:this.select();" name="textarea2" style="width:650px;height:90px">
<style type="text/css">
	.mark {overflow:hidden;padding:15px 0 20px 111px; clear:both;}
	#mark0, #mark1 {background:url({$GetInstallDir}sysimg/dig/mark.gif) no-repeat -189px 0;border:0;cursor:pointer;float:left;height:48px;margin:0;overflow:hidden;padding:0;position:relative;width:189px;}
	#mark1 {background-position:-378px 0;margin-left:10px;}
	#barnum1, #barnum2 {color:#333333;font-family:arial;font-size:10px;font-weight:400;left:70px;line-height:12px;position:absolute;top:30px;}
	.bar {background-color:#FFFFFF;border:1px solid #40A300;height:5px;left:9px;overflow:hidden;position:absolute;text-align:left;top:32px;width:55px;}
	.bar div {background:transparent url({$GetInstallDir}sysimg/dig/bar_Footbg.gif) repeat-x ;height:5px;overflow:hidden; margin:0;}
	#mark1 .bar {border-color:#555555;}
	#mark1 .bar div {background:transparent url({$GetInstallDir}sysimg/dig/Barbg.gif) repeat-x ;}
</style>
	<div class="mark">
	 <div onClick="digg(0,{KS:Current:ModelID},{KS:Current:ItemID},'{$GetInstallDir}');" onfocus="this.blur()" onMouseOut="this.style.backgroundPosition='-189px 0'" onMouseOver="this.style.backgroundPosition='0 0'" id="mark0" style="background-position: -189px 0pt;">
	 <div class="bar"><div style="width: 0px;" id="digzcimg"></div></div>
	 <span id="barnum1"><span id="perz{KS:Current:ItemID}">0%</span> (<span id="s{KS:Current:ItemID}">0</span>)</span>
     </div>
	 <div onClick="digg(1,{KS:Current:ModelID},{KS:Current:ItemID},'{$GetInstallDir}');" onfocus="this.blur()" onMouseOut="this.style.backgroundPosition='-378px 0'" onMouseOver="this.style.backgroundPosition='-567px 0'" id="mark1" style="background-position: -378px 0pt;">
	<div class="bar"><div style="width: 0px;" id="digcimg"></div></div>
	 <span id="barnum2"><span id="perc{KS:Current:ItemID}">0%</span> (<span id="c{KS:Current:ItemID}">10</span>)</span>
	</div>
</div>
<script>show_digg1({KS:Current:ModelID},{KS:Current:ItemID},'{$GetInstallDir}');</script>

     </textarea>     
     
     <div style="font-weight:bold;text-align:left">��ʽ��</div>
     <img src="../../sysimg/dig/d2.jpg" />
     <textarea onmouseover="javascript:this.select();" name="textarea2" style="width:650px;height:90px">
     
<table width="200" border="0">
  <tr>
    <td>
        <div style="width:58px;">
          <div style="padding-top:10px;text-align:center;background:url({$GetInstallDir}sysimg/vote_bg_t.png) #FFF no-repeat;height:60px;"> <span id="s0{KS:Current:ItemID}" style="font-weight:bold;"></span> <br />
              <span>��֧��</span> </div>
          <div style="cursor:hand;padding-top:2px;height:25px;text-align:center;background: url({$GetInstallDir}sysimg/vote_bg_b.png)  no-repeat center 0;" id="d0{KS:Current:ItemID}"> <span onClick="javascript:digg(0,{KS:Current:ModelID},{KS:Current:ItemID},'{$GetInstallDir}');">��һ��</span> </div>
        </div>
      <script language="javascript">show_digg(0,{KS:Current:ModelID},{KS:Current:ItemID},'{$GetInstallDir}');</script></td>
    <td>
	 <div style="width:58px;">
          <div style="padding-top:10px;text-align:center;background:url({$GetInstallDir}sysimg/vote_bg_t.png) #FFF no-repeat;height:60px;"> <span id="s1{KS:Current:ItemID}" style="font-weight:bold;"></span> <br />
              <span>��֧��</span> </div>
          <div style="cursor:hand;padding-top:2px;height:25px;text-align:center;background: url({$GetInstallDir}sysimg/vote_bg_b.png)  no-repeat center 0;" id="d1{KS:Current:ItemID}"> <span onClick="javascript:digg(1,{KS:Current:ModelID},{KS:Current:ItemID},'{$GetInstallDir}');">��һ��</span> </div>
      </div>
      <script>show_digg(1,{KS:Current:ModelID},{KS:Current:ItemID},'{$GetInstallDir}');</script>
	</td>
  </tr>
</table>
             </textarea>
    </asp:Panel>
    
</asp:Content>

