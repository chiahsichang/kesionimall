<%@ Page Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.Admin_ContentManage" Title="ģ���ĵ�����" Codebehind="KS.ContentManage.aspx.cs" %>
<%@ Import Namespace="Kesion.Cache" %>
<%@ Import Namespace="Kesion.BLL" %>
<%@ Import Namespace="Kesion.Publics"%>
<asp:Content ID="Content1" ContentPlaceHolderID="KSContent" Runat="Server">

<script type="text/javascript">
 <!--
   jQuery(document).ready(function(){
     jQuery("body").keydown(function()
     {
        if (event.ctrlKey)
		  switch  (event.keyCode)
		  {      
		  }
     });
   });

function GetMyIds() {
    var sid = null;
    for (var i = 0; i < document.getElementsByName("ids").length; i++) {
        var KS = document.getElementsByName("ids")[i];
        if (KS.checked == true) {
            if (sid == null)
                sid = KS.value;
            else
                sid += "," + KS.value;
        }
    }
    return sid;
 }
 function ContentAddSpecial(){
        var sid = GetMyIds();
        if (sid!=null) parent.openWin("<%=itemName %>����ר��","Content/KS.ContentAddSpecial.aspx?ContentID="+sid+"&ChannelID=<%=ChannelID%>",false,300,360);
 }
    function doDelete() {
        var sid = GetMyIds();
        if (sid == null) {
            KesionJS.Alert("��ѡ��Ҫɾ����<%=itemName%>");
            return false;
        } else {
            KesionJS.Confirm("ȷ��ɾ��ѡ��<%=itemName%>?", 'location.href = "<%=KSCMS.GetInstallDir()+MyCache.GetCacheConfig(4)%>/content/KS.ContentManage.aspx?action=del&channelid=<%=ChannelID%>&classid=<%=ClassID%>&page=<%=CurrPage%>&ids=' + sid + "\";", "");
        }
    }
 function ContentSetAttribute(){
      var sid = GetMyIds();
	  if (sid!=null)  parent.openWin("��������<%=itemName %>����","Content/KS.ContentBatch.Aspx?ContentID="+sid+"&ChannelID=<%=ChannelID %>",true);

}
function RefreshItem() {
    var sid = GetMyIds();
    if (sid != null) parent.openWin("��������<%=itemName %>HTML����", "Refresh/KS.RefreshHtml.Aspx?ChannelID=<%=ChannelID %>&refreshtype=itemids&action=content&ids=" + sid, false,650,250);
}
function ContentMove() {
    var sid = GetMyIds();
    if (sid != null) parent.openWin("<%=itemName %>�����ƶ�", "Content/KS.ClassMove.aspx?ContentID=" + sid + "&ChannelID=<%=ChannelID%>", true, 800, 360);

}
function keyWordFocus() {
    if (jQuery("#<%=this.KeyWord.ClientID %>").val() == '������ؼ��֣�') {
        jQuery("#<%=this.KeyWord.ClientID %>").val('');
    }
}
function keyWordBlur() {
    if (jQuery("#<%=this.KeyWord.ClientID %>").val() == '') {
        jQuery("#<%=this.KeyWord.ClientID %>").val('������ؼ��֣�');
    }
}
function doRejection(id) {
    top.openWin("�˸崦��", "Content/KS.ContentRejection.aspx?infoid=" + id, false,700, 400);
}
function doBatchRejection() {
    var sid = GetMyIds();
    if (sid != '') top.openWin("�����˸崦��", "Content/KS.ContentRejection.aspx?infoid=" + sid, false, 700, 400);
}
  //-->    
</script>

		 
 <div id="manage_top" class="menu_top_fixed">
    <ul>
         <span style="float:right;padding-right:10px"><select name="classid" style="width:150px" OnChange="location.href='KS.ContentManage.Aspx?channelid=<%=ChannelID %>&classid='+this.value;">
                <option value=0>������ת����Ŀ...</option>
                <%=ClassManage.GetClassOptionByPurview(Convert.ToInt16(ChannelID),ClassID.ToString())%>
               </select>  </span> 
        <%if (KSSecurity.CheckPower("content", KSSecurity.RemovePowerBadChar("Content/KS.Class.aspx"),0)){ %>      
         <li id='p1'><asp:LinkButton ID="addclass" runat="server" OnClick="addclass_Click"><b></b>�����Ŀ</asp:LinkButton></li>
        <%} %>
        <%if (KSSecurity.CheckPower("content", MyCache.GetCacheModel(ChannelID, 1),0)) { %>
        <li id='p8'><asp:LinkButton ID="addsubject" runat="server" OnClick="addsubject_Click"><b></b>���</asp:LinkButton></li>
        <%} %>
        <%if (KSSecurity.CheckPower("content", MyCache.GetCacheModel(ChannelID, 1),2)) { %> 
         <li id='p3'><a href="javascript:;" onclick="doDelete()"><b></b>ɾ��</a></li>
         <%} %>

          <%if (KSSecurity.CheckPower("content", MyCache.GetCacheModel(ChannelID, 1), 3)){ %>
           <li id="p14"><asp:LinkButton ID="LkbVerify" OnClientClick="return(GetIDS());" runat="server" OnClick="Button1_Click"><b></b>�������</asp:LinkButton></li>
           <li id="p13"><asp:LinkButton ID="LkbUnVerify" OnClientClick="return(GetIDS());" runat="server" OnClick="Button2_Click"><b></b>ȡ�����</asp:LinkButton></li>
          <%} %>
         <%if (KSSecurity.CheckPower("content", MyCache.GetCacheModel(ChannelID, 1), 4)){ %>
           <li id="p12"><asp:LinkButton ID="LinkButton4" OnClientClick="return(GetIDS());" runat="server" OnClick="Button6_Click"><b></b>��¡</asp:LinkButton></li>
        <%} %>
        <%if (KSSecurity.CheckPower("", "Content/KS.ContentBatch.Aspx"))  { %>
           <li id='p5'><asp:LinkButton ID="batchset" runat="server"><b></b>����</asp:LinkButton></li>
        <%} %>
           <%if (KSSecurity.CheckPower("content", MyCache.GetCacheModel(ChannelID, 1), 5))  { %>
           <li id='p4'><asp:LinkButton ID="addspecial" runat="server"><b></b>����ר��</asp:LinkButton></li>
            <%} %>
           <li id='p2'><asp:LinkButton ID="batchMove" runat="server"><b></b>�ƶ�</asp:LinkButton></li>
           <li id='p15'><asp:LinkButton ID="LinkButton1" runat="server" OnClientClick="RefreshItem();return(GetIDS());"><b></b>����HTML</asp:LinkButton></li>
    </ul>
 </div>  
 <div class="menu_top_fixed_height"></div>
          
 <div class="message" style="margin-top:-5px;">
          <table border="0" cellpadding="0" cellspacing="0" width="100%" >
              <tr>
               <td style="height: 23px">
                  <b>����������</b> 
                  <asp:DropDownList ID="Condition" runat="server">
                      <asp:ListItem Value="1">����</asp:ListItem>
                      <asp:ListItem Value="2">¼����</asp:ListItem>
                      <asp:ListItem Value="3">����</asp:ListItem>
                   </asp:DropDownList>
                   <asp:TextBox onfocus="keyWordFocus();" onblur="keyWordBlur();" style="color:#ccc" Text="������ؼ��֣�" CssClass="textbox"  ID="KeyWord" runat="server"></asp:TextBox>
                   <b>���ڷ�Χ��</b>
                   <asp:TextBox ID="TxtBeginDate" Width="150px" runat="server"  onclick="WdatePicker({dateFmt:&#39;yyyy-MM-dd HH:mm:ss&#39;});" CssClass="textbox Wdate"></asp:TextBox>��
                   <asp:TextBox ID="TxtEndDate" Width="150px" runat="server" onclick="WdatePicker({dateFmt:&#39;yyyy-MM-dd HH:mm:ss&#39;});"  CssClass="textbox Wdate"></asp:TextBox>
                   <asp:Button ID="Button4" runat="server" CssClass="button" Text="��ʼ����" OnClick="Button4_Click" /></td>
             
               </tr>
               </table>
 </div>
 <div class="tabs_header">
    <ul class="tabs">
    <li<%=KSCMS.S("showType")==""?" class='active'":string.Empty %>><a href="KS.ContentManage.aspx?<%=UtilsQueryParam.Get("showtype") %>"><span>����<%=itemName %></span></a></li>
    <li<%=KSCMS.S("showType")=="1"?" class='active'":string.Empty %>><a href="KS.ContentManage.aspx?showType=1&<%=UtilsQueryParam.Get("showtype") %>"><span>δ��˵�<%=itemName %></span></a></li>
    <li<%=KSCMS.S("showType")=="2"?" class='active'":string.Empty %>><a href="KS.ContentManage.aspx?showType=2&<%=UtilsQueryParam.Get("showtype") %>"><span>����˵�<%=itemName %></span></a></li>
    <li<%=KSCMS.S("showType")=="3"?" class='active'":string.Empty %>><a href="KS.ContentManage.aspx?showType=3&<%=UtilsQueryParam.Get("showtype") %>"><span>�ݸ��<%=itemName %></span></a></li>
    <li<%=KSCMS.S("showType")=="4"?" class='active'":string.Empty %>><a href="KS.ContentManage.aspx?showType=4&<%=UtilsQueryParam.Get("showtype") %>"><span>���˻ص�<%=itemName %></span></a></li>
    </ul>
     <span class="right">
      <b>����ɸѡ��</b> <asp:CheckBoxList ID="Attribute" runat="server" RepeatLayout="Flow" RepeatDirection="Horizontal" AutoPostBack="True" OnSelectedIndexChanged="Arrtibute_SelectedIndexChanged">
                    <asp:ListItem Value="1">�Ƽ�</asp:ListItem>
                    <asp:ListItem Value="2">�ȵ�</asp:ListItem>
                    <asp:ListItem Value="3">����</asp:ListItem>
                    <asp:ListItem Value="4">ͷ��</asp:ListItem>
                    <asp:ListItem Value="5">����</asp:ListItem>
                    <asp:ListItem Value="6">�õ�</asp:ListItem>
                </asp:CheckBoxList></span>
</div>
     

    <KS:KSGV ID="List"  runat="server" AutoGenerateColumns="False" PagerType="CustomNumeric" Width="99%" OnRowCommand="list_RowCommand" EmptyDataText="��û������ĵ�!" OnRowDataBound="list_RowDataBound" GridLines="None" OnRowCreated="List_RowCreated" CssClass="CTable">
        <Columns>
            <asp:TemplateField HeaderText="&lt;input type='checkbox' name='chkall' id='chkall' onClick='CheckAll(this.form);'/&gt;">
                <ItemStyle HorizontalAlign="Center"  Height="30px" Width="35px"/>
                <ItemTemplate>
                <input type="checkbox"  name="ids" value="<%#Eval("Infoid") %>" />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="InfoID" HeaderText="ID��" Visible="false">
                <itemstyle horizontalalign="Center" width="40px" />
            </asp:BoundField>
            <asp:TemplateField HeaderText="����">
                <itemtemplate>
                    <span class="<%# GetInfoPic(Convert.ToString(Eval("DefaultPic"))) %>_<%=MyCache.GetCacheModel(ChannelID,4) %>"></span>
                [<%# MyCache.GetCacheClass(Convert.ToInt32(Eval("classid")),1) %>]
                 <a href="<%# Kesion.HtmlTags.BasicField.GetItemUrl(Utils.StrToInt(Eval("ChannelID")),Utils.StrToInt(Eval("InfoID"))) %>" target="_blank" title='<%# Eval("Title") %>' style='color:<%# Eval("titlefontcolor")%>'><%# Utils.CutStr(Convert.ToString(Eval("Title")),50) %></a>
                </itemtemplate>
            </asp:TemplateField>
        </Columns>
        <EmptyDataRowStyle CssClass="emptycss" />
        <HeaderStyle CssClass="CTitle" />
    </KS:KSGV>
    
    <asp:Panel ID="Panel1" runat="server" Height="30px">
          <div style="margin-top:8px"></div>
            
        
             <span runat="server" id="showVerify" visible="false">

                  <%if (KSSecurity.CheckPower("content", MyCache.GetCacheModel(ChannelID, 1), 3))      { %>
                     <asp:Button ID="Button1" runat="server" Text="�������" OnClick="Button1_Click" />
                     <asp:Button ID="Button9" OnClientClick="doBatchRejection()" runat="server" Text="�����˸�"/>
                 <%} %>
             </span>
             
   </asp:Panel>
        


    
     <KS:Page ID="Page1" runat="server" />

        <script type="text/javascript">
		showtips('<span class="state"><strong>˵����</strong><br /></span>�����еĸ���壺<font color=blue>��</font>---�Ƽ���<font color=red>��</font>---���ţ�<font color=#ff6600>��</font>---���ʣ�ͷ---ͷ����<font color=red>��</font>---������<font color=brown>��</font>---�õƣ�<font color=green>��</font>---��������<br />');
		</script>
</asp:Content>

