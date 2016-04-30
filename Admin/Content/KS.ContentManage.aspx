<%@ Page Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.Admin_ContentManage" Title="模型文档管理" Codebehind="KS.ContentManage.aspx.cs" %>
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
        if (sid!=null) parent.openWin("<%=itemName %>加入专题","Content/KS.ContentAddSpecial.aspx?ContentID="+sid+"&ChannelID=<%=ChannelID%>",false,300,360);
 }
    function doDelete() {
        var sid = GetMyIds();
        if (sid == null) {
            KesionJS.Alert("请选择要删除的<%=itemName%>");
            return false;
        } else {
            KesionJS.Confirm("确定删除选的<%=itemName%>?", 'location.href = "<%=KSCMS.GetInstallDir()+MyCache.GetCacheConfig(4)%>/content/KS.ContentManage.aspx?action=del&channelid=<%=ChannelID%>&classid=<%=ClassID%>&page=<%=CurrPage%>&ids=' + sid + "\";", "");
        }
    }
 function ContentSetAttribute(){
      var sid = GetMyIds();
	  if (sid!=null)  parent.openWin("批量设置<%=itemName %>属性","Content/KS.ContentBatch.Aspx?ContentID="+sid+"&ChannelID=<%=ChannelID %>",true);

}
function RefreshItem() {
    var sid = GetMyIds();
    if (sid != null) parent.openWin("批量生成<%=itemName %>HTML操作", "Refresh/KS.RefreshHtml.Aspx?ChannelID=<%=ChannelID %>&refreshtype=itemids&action=content&ids=" + sid, false,650,250);
}
function ContentMove() {
    var sid = GetMyIds();
    if (sid != null) parent.openWin("<%=itemName %>批量移动", "Content/KS.ClassMove.aspx?ContentID=" + sid + "&ChannelID=<%=ChannelID%>", true, 800, 360);

}
function keyWordFocus() {
    if (jQuery("#<%=this.KeyWord.ClientID %>").val() == '请输入关键字！') {
        jQuery("#<%=this.KeyWord.ClientID %>").val('');
    }
}
function keyWordBlur() {
    if (jQuery("#<%=this.KeyWord.ClientID %>").val() == '') {
        jQuery("#<%=this.KeyWord.ClientID %>").val('请输入关键字！');
    }
}
function doRejection(id) {
    top.openWin("退稿处理", "Content/KS.ContentRejection.aspx?infoid=" + id, false,700, 400);
}
function doBatchRejection() {
    var sid = GetMyIds();
    if (sid != '') top.openWin("批量退稿处理", "Content/KS.ContentRejection.aspx?infoid=" + sid, false, 700, 400);
}
  //-->    
</script>

		 
 <div id="manage_top" class="menu_top_fixed">
    <ul>
         <span style="float:right;padding-right:10px"><select name="classid" style="width:150px" OnChange="location.href='KS.ContentManage.Aspx?channelid=<%=ChannelID %>&classid='+this.value;">
                <option value=0>快速跳转到栏目...</option>
                <%=ClassManage.GetClassOptionByPurview(Convert.ToInt16(ChannelID),ClassID.ToString())%>
               </select>  </span> 
        <%if (KSSecurity.CheckPower("content", KSSecurity.RemovePowerBadChar("Content/KS.Class.aspx"),0)){ %>      
         <li id='p1'><asp:LinkButton ID="addclass" runat="server" OnClick="addclass_Click"><b></b>添加栏目</asp:LinkButton></li>
        <%} %>
        <%if (KSSecurity.CheckPower("content", MyCache.GetCacheModel(ChannelID, 1),0)) { %>
        <li id='p8'><asp:LinkButton ID="addsubject" runat="server" OnClick="addsubject_Click"><b></b>添加</asp:LinkButton></li>
        <%} %>
        <%if (KSSecurity.CheckPower("content", MyCache.GetCacheModel(ChannelID, 1),2)) { %> 
         <li id='p3'><a href="javascript:;" onclick="doDelete()"><b></b>删除</a></li>
         <%} %>

          <%if (KSSecurity.CheckPower("content", MyCache.GetCacheModel(ChannelID, 1), 3)){ %>
           <li id="p14"><asp:LinkButton ID="LkbVerify" OnClientClick="return(GetIDS());" runat="server" OnClick="Button1_Click"><b></b>批量审核</asp:LinkButton></li>
           <li id="p13"><asp:LinkButton ID="LkbUnVerify" OnClientClick="return(GetIDS());" runat="server" OnClick="Button2_Click"><b></b>取消审核</asp:LinkButton></li>
          <%} %>
         <%if (KSSecurity.CheckPower("content", MyCache.GetCacheModel(ChannelID, 1), 4)){ %>
           <li id="p12"><asp:LinkButton ID="LinkButton4" OnClientClick="return(GetIDS());" runat="server" OnClick="Button6_Click"><b></b>克隆</asp:LinkButton></li>
        <%} %>
        <%if (KSSecurity.CheckPower("", "Content/KS.ContentBatch.Aspx"))  { %>
           <li id='p5'><asp:LinkButton ID="batchset" runat="server"><b></b>设置</asp:LinkButton></li>
        <%} %>
           <%if (KSSecurity.CheckPower("content", MyCache.GetCacheModel(ChannelID, 1), 5))  { %>
           <li id='p4'><asp:LinkButton ID="addspecial" runat="server"><b></b>加入专题</asp:LinkButton></li>
            <%} %>
           <li id='p2'><asp:LinkButton ID="batchMove" runat="server"><b></b>移动</asp:LinkButton></li>
           <li id='p15'><asp:LinkButton ID="LinkButton1" runat="server" OnClientClick="RefreshItem();return(GetIDS());"><b></b>生成HTML</asp:LinkButton></li>
    </ul>
 </div>  
 <div class="menu_top_fixed_height"></div>
          
 <div class="message" style="margin-top:-5px;">
          <table border="0" cellpadding="0" cellspacing="0" width="100%" >
              <tr>
               <td style="height: 23px">
                  <b>快速搜索：</b> 
                  <asp:DropDownList ID="Condition" runat="server">
                      <asp:ListItem Value="1">标题</asp:ListItem>
                      <asp:ListItem Value="2">录入者</asp:ListItem>
                      <asp:ListItem Value="3">作者</asp:ListItem>
                   </asp:DropDownList>
                   <asp:TextBox onfocus="keyWordFocus();" onblur="keyWordBlur();" style="color:#ccc" Text="请输入关键字！" CssClass="textbox"  ID="KeyWord" runat="server"></asp:TextBox>
                   <b>日期范围：</b>
                   <asp:TextBox ID="TxtBeginDate" Width="150px" runat="server"  onclick="WdatePicker({dateFmt:&#39;yyyy-MM-dd HH:mm:ss&#39;});" CssClass="textbox Wdate"></asp:TextBox>至
                   <asp:TextBox ID="TxtEndDate" Width="150px" runat="server" onclick="WdatePicker({dateFmt:&#39;yyyy-MM-dd HH:mm:ss&#39;});"  CssClass="textbox Wdate"></asp:TextBox>
                   <asp:Button ID="Button4" runat="server" CssClass="button" Text="开始搜索" OnClick="Button4_Click" /></td>
             
               </tr>
               </table>
 </div>
 <div class="tabs_header">
    <ul class="tabs">
    <li<%=KSCMS.S("showType")==""?" class='active'":string.Empty %>><a href="KS.ContentManage.aspx?<%=UtilsQueryParam.Get("showtype") %>"><span>所有<%=itemName %></span></a></li>
    <li<%=KSCMS.S("showType")=="1"?" class='active'":string.Empty %>><a href="KS.ContentManage.aspx?showType=1&<%=UtilsQueryParam.Get("showtype") %>"><span>未审核的<%=itemName %></span></a></li>
    <li<%=KSCMS.S("showType")=="2"?" class='active'":string.Empty %>><a href="KS.ContentManage.aspx?showType=2&<%=UtilsQueryParam.Get("showtype") %>"><span>已审核的<%=itemName %></span></a></li>
    <li<%=KSCMS.S("showType")=="3"?" class='active'":string.Empty %>><a href="KS.ContentManage.aspx?showType=3&<%=UtilsQueryParam.Get("showtype") %>"><span>草稿的<%=itemName %></span></a></li>
    <li<%=KSCMS.S("showType")=="4"?" class='active'":string.Empty %>><a href="KS.ContentManage.aspx?showType=4&<%=UtilsQueryParam.Get("showtype") %>"><span>被退回的<%=itemName %></span></a></li>
    </ul>
     <span class="right">
      <b>属性筛选：</b> <asp:CheckBoxList ID="Attribute" runat="server" RepeatLayout="Flow" RepeatDirection="Horizontal" AutoPostBack="True" OnSelectedIndexChanged="Arrtibute_SelectedIndexChanged">
                    <asp:ListItem Value="1">推荐</asp:ListItem>
                    <asp:ListItem Value="2">热点</asp:ListItem>
                    <asp:ListItem Value="3">精彩</asp:ListItem>
                    <asp:ListItem Value="4">头条</asp:ListItem>
                    <asp:ListItem Value="5">滚动</asp:ListItem>
                    <asp:ListItem Value="6">幻灯</asp:ListItem>
                </asp:CheckBoxList></span>
</div>
     

    <KS:KSGV ID="List"  runat="server" AutoGenerateColumns="False" PagerType="CustomNumeric" Width="99%" OnRowCommand="list_RowCommand" EmptyDataText="还没有添加文档!" OnRowDataBound="list_RowDataBound" GridLines="None" OnRowCreated="List_RowCreated" CssClass="CTable">
        <Columns>
            <asp:TemplateField HeaderText="&lt;input type='checkbox' name='chkall' id='chkall' onClick='CheckAll(this.form);'/&gt;">
                <ItemStyle HorizontalAlign="Center"  Height="30px" Width="35px"/>
                <ItemTemplate>
                <input type="checkbox"  name="ids" value="<%#Eval("Infoid") %>" />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="InfoID" HeaderText="ID号" Visible="false">
                <itemstyle horizontalalign="Center" width="40px" />
            </asp:BoundField>
            <asp:TemplateField HeaderText="标题">
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
                     <asp:Button ID="Button1" runat="server" Text="批量审核" OnClick="Button1_Click" />
                     <asp:Button ID="Button9" OnClientClick="doBatchRejection()" runat="server" Text="批量退稿"/>
                 <%} %>
             </span>
             
   </asp:Panel>
        


    
     <KS:Page ID="Page1" runat="server" />

        <script type="text/javascript">
		showtips('<span class="state"><strong>说明：</strong><br /></span>属性中的各项含义：<font color=blue>荐</font>---推荐，<font color=red>热</font>---热门，<font color=#ff6600>彩</font>---精彩，头---头条，<font color=red>滚</font>---滚动，<font color=brown>幻</font>---幻灯，<font color=green>评</font>---允许评论<br />');
		</script>
</asp:Content>

