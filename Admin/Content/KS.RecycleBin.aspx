<%@ Page Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.Admin_RecycleBin" Title="回收站管理" Codebehind="KS.RecycleBin.aspx.cs" %>
<%@ Import Namespace="Kesion.Cache" %>
<%@ Import Namespace="Kesion.BLL" %>
<%@ Import Namespace="Kesion.Publics"%>
<asp:Content ID="Content1" ContentPlaceHolderID="KSContent" Runat="Server">
<body>
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
    if (sid != null) parent.openWin("<%=itemName %>批量移动", "Content/KS.ClassMove.aspx?ContentID=" + sid + "&ChannelID=<%=ChannelID%>", true, 600, 360);

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

  //-->    
</script>

		 
   <div id="manage_top" class="toptitle menu_top_fixed" style="text-align:left">
    <span style="float:right"><select name="classid" style="width:150px" OnChange="location.href='KS.RecycleBin.Aspx?classid='+this.value;">
                <option value=0>快速跳转到栏目...</option>
                <%=ClassManage.GetClassOptionByPurview(Convert.ToInt16(ChannelID),ClassID.ToString())%>
               </select>  </span>    
   
   回收站管理[共有<span style="color:Red"><%=totalNum%></span>篇文档]</div>
   <div class="menu_top_fixed_height"></div>
          
 <div class="message">
          <table border="0" cellpadding="0" cellspacing="0" width="100%">
              <tr>
               <td style="height: 23px">
                  <b>快速搜索：</b> <asp:TextBox onfocus="keyWordFocus();" onblur="keyWordBlur();" style="color:#ccc" Text="请输入关键字！" CssClass="textbox"  ID="KeyWord" runat="server"></asp:TextBox>&nbsp;条件：
                   <asp:DropDownList ID="Condition" runat="server">
                      <asp:ListItem Value="1">标题</asp:ListItem>
                      <asp:ListItem Value="2">录入者</asp:ListItem>
                      <asp:ListItem Value="3">作者</asp:ListItem>
                   </asp:DropDownList>
                   <asp:Button ID="Button4" runat="server" CssClass="button" Text="开始搜索" OnClick="Button4_Click" /></td>
               <td  align="center" style="height: 23px">
               <b>查看选项：</b> <asp:CheckBoxList ID="Attribute" runat="server" RepeatLayout="Flow" RepeatDirection="Horizontal" AutoPostBack="True" OnSelectedIndexChanged="Arrtibute_SelectedIndexChanged">
                    <asp:ListItem Value="1">推荐</asp:ListItem>
                    <asp:ListItem Value="2">热点</asp:ListItem>
                    <asp:ListItem Value="3">精彩</asp:ListItem>
                    <asp:ListItem Value="4">头条</asp:ListItem>
                    <asp:ListItem Value="5">滚动</asp:ListItem>
                    <asp:ListItem Value="6">幻灯</asp:ListItem>
                </asp:CheckBoxList>
               </td>
               </tr>
               </table>
 </div>


    <KS:KSGV ID="List" cssclass="CTable" runat="server" AutoGenerateColumns="False" PagerType="CustomNumeric"
        Width="99%" OnRowCommand="list_RowCommand" EmptyDataText="回收站中没有文档!" HorizontalAlign="Center" OnRowDataBound="list_RowDataBound" GridLines="None" OnRowCreated="List_RowCreated">
        <Columns>
            <asp:TemplateField HeaderText="选择">
                <ItemStyle HorizontalAlign="Center"  Width="35px"/>
                <ItemTemplate>
                <input type="checkbox"  name="ids" value="<%#Eval("Infoid") %>" />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="InfoID" HeaderText="ID号" >
                <itemstyle horizontalalign="Center" width="40px" />
            </asp:BoundField>
            <asp:TemplateField HeaderText="标题">
                <itemtemplate>
                    <span class="Recyc"></span>
                [<%# MyCache.GetCacheClass(Convert.ToInt32(Eval("classid")),1) %>]
                 <a href="../../model/view.aspx?m_id=<%#Eval("ChannelID")%>&id=<%#Eval("InfoID") %>" target="_blank" title='<%# Eval("Title") %>'><%# Utils.CutStr(Convert.ToString(Eval("Title")),50) %></a>
                </itemtemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="Inputer" HeaderText="录入者">
            <itemstyle horizontalalign="Center" />
            </asp:BoundField>
            <asp:BoundField DataField="AddDate" HtmlEncode="False" DataFormatString="{0:d}" HeaderText="添加时间">
            <itemstyle horizontalalign="Center"/>
            </asp:BoundField>
            <asp:BoundField DataField="Hits" HeaderText="点击数">
            <itemstyle horizontalalign="Center"  />
            </asp:BoundField>
            <asp:BoundField DataField="attribute" HeaderText="属性">
            <itemstyle horizontalalign="Center" />
            </asp:BoundField>
            <asp:BoundField DataField="verify" HeaderText="状态">
            <itemstyle horizontalalign="Center" />
            </asp:BoundField>
            <asp:BoundField DataField="ChannelID" HeaderText="模型ID">
            </asp:BoundField>

            
            <asp:TemplateField HeaderText="还原">
            <itemstyle horizontalalign="Center" />
            <itemtemplate>
              <asp:LinkButton ID="backBtn" CssClass="backBtn" title="还原" runat="server" CommandArgument=<%#Eval("Infoid") %>  CommandName="recyclebinback">还原</asp:LinkButton>
            </itemtemplate>
            </asp:TemplateField>
             <asp:TemplateField HeaderText="彻底删除">
                 <itemstyle horizontalalign="Center" width="25"/>
                 <itemtemplate>
              <a href="javascript:;" class="delete" title="彻底删除" onClick="KesionJS.Confirm('确定彻底删除吗?','location.href=\'<%=KSCMS.GetInstallDir()+MyCache.GetCacheConfig(4) %>/content/KS.RecycleBin.aspx?action=del&channelid=<%=ChannelID %>&classid=<%=ClassID %>&page=<%=CurrPage %>&ids=<%# Eval("InfoID") %>\';','');"></a>
                 </itemtemplate>
            </asp:TemplateField>

        </Columns>
        <EmptyDataRowStyle CssClass="emptycss" />
        <HeaderStyle CssClass="CTitle" />
    </KS:KSGV>
    
    <asp:Panel ID="Panel1" runat="server" Height="30px">
          <div style="margin-top:8px"></div>
            &nbsp;&nbsp;<input type="checkbox" name="chkall" id="chkall" onClick="CheckAll(this.form);"/><label for="chkall">全部选中</label>
            
            <input type="button" value="彻底删除" onMouseOver="this.className='button_on';" onMouseOut="this.className='button';" class="button" onClick="if (GetIDS('del')){ this.form.action='?action=del';this.form.submit()}" />
             
          <asp:Button ID="Button1" runat="server" Text="批量还原" onclick="Button1_Click1" />&nbsp;
            <input type="button" value="一键清空" onMouseOver="this.className='button_on';" onMouseOut="this.className='button';" class="button" onClick="KesionJS.Confirm('此操作不可逆，确定一键清空回收站里的所有文档吗?','location.href=\'<%=KSCMS.GetInstallDir()+MyCache.GetCacheConfig(4) %>/content/KS.RecycleBin.aspx?action=delall\';','');"/>
            
   </asp:Panel>
        


         <KS:Page ID="Page1" runat="server" />
        
        <script type="text/javascript">
		showtips('<span class="state"><strong>说明：</strong><br /></span>1、属性中的各项含义：<font color=blue>荐</font>---推荐，<font color=red>热</font>---热门，<font color=#ff6600>彩</font>---精彩，头---头条，<font color=red>滚</font>---滚动，<font color=brown>幻</font>---幻灯，<font color=green>评</font>---允许评论。<br />2、还原后，如果网站有启用生成静态HTML功能，建议前台页面重新发布生成一次。');
		</script>
</asp:Content>

