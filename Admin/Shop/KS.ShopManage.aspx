<%@ Page Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.Admin_ShopManage" Title="商品管理" Codebehind="KS.ShopManage.aspx.cs" %>
<%@ Import Namespace="Kesion.Cache" %>
<%@ Import Namespace="Kesion.APPCode" %>
<%@ Import Namespace="Kesion.BLL" %>
<%@ Import Namespace="Kesion.Publics"%>
<asp:Content ID="Content1" ContentPlaceHolderID="KSContent" Runat="Server">

<asp:Panel ID="PanelList" runat="server">
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
function doDelete() {
    var sid = GetMyIds();
    if (sid == null) {
        KesionJS.Alert("请选择要删除的<%=itemName%>");
            return false;
    } else {
        KesionJS.Confirm("确定删除选的<%=itemName%>?",'location.href = "<%=KSCMS.GetInstallDir()+MyCache.GetCacheConfig(4)%>/shop/KS.ShopManage.aspx?action=del&channelid=<%=ChannelID%>&classid=<%=ClassID%>&page=<%=CurrPage%>&ids='+sid+"\";","");
        }
    }
 function ContentSetAttribute(){
     var sid = GetMyIds();
	  if (sid!=null)  parent.openWin("批量设置<%=itemName %>属性","shop/KS.ShopBatch.Aspx?ContentID="+sid+"&ChannelID=<%=ChannelID %>",true);
}
function ContentMove() {
    var sid = GetMyIds();
    if (sid != null) parent.openWin("<%=itemName %>批量移动", "Content/KS.ClassMove.aspx?from=shop&ContentID=" + sid + "&ChannelID=<%=ChannelID%>", true,800, 360);
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
 function RefreshItem() {
        var sid = GetMyIds();
        if (sid != null) parent.openWin("批量生成<%=itemName %>HTML操作", "Refresh/KS.RefreshHtml.Aspx?ChannelID=<%=ChannelID %>&refreshtype=itemids&action=content&ids=" + sid, false,650,250);
}
  //-->    
</script>
<style>
#tip{
 position:absolute;
 border:1px solid #DAEAEE;
 background:#F6FBFF;
 padding:1px;
 color:#333;
 display:none;
}          </style>
<script type="text/javascript">
//<![CDATA[
jQuery(function(){  
   jQuery(".tip").mouseover(function(){
      newTitle=this.title;
   this.title="";
      var $tip=jQuery("<div id='tip'>"+newTitle+"</div>");
   jQuery("body").append($tip);
   jQuery("#tip").show();
   }).mouseout(function(){
      jQuery("#tip").remove();
   this.title=newTitle;
   }).mousemove(function(e){
      jQuery("#tip").css({
      "top":(e.pageY+20)+"px",
    "left":(e.pageX+10)+"px"
   })
   })
})
//]]>
</script>

		 
 <div id="manage_top" class="menu_top_fixed">
         <ul>
         <span style="float:right;padding-right:10px;"> <select name="classid" style="width:150px" OnChange="location.href='KS.ShopManage.Aspx?channelid=<%=ChannelID %>&classid='+this.value;">
                <option value=0>快速跳转到栏目...</option>
                <%=ClassManage.GetClassOptionByPurview(Convert.ToInt16(ChannelID),ClassID.ToString())%>
               </select>
         </span>
             <%if (KSSecurity.CheckPower("shop", KSSecurity.RemovePowerBadChar("Content/KS.Class.aspx?from=shop"), 0))
               { %>   
           <li id='p1'><asp:LinkButton ID="addclass" runat="server" OnClick="addclass_Click"><b></b>添加栏目</asp:LinkButton></li>
             <%} %>
              <%if (KSSecurity.CheckPower("shop", MyCache.GetCacheModel(ChannelID, 1),0)) { %>
           <li id='p8'><asp:LinkButton ID="addsubject" runat="server" OnClick="addsubject_Click"><b></b>添加<%=itemName %></asp:LinkButton></li>
             <%} %>
              <%if (KSSecurity.CheckPower("shop", MyCache.GetCacheModel(ChannelID, 1),2)) { %>
          <li id='p3'><a href="javascript:;" onclick="doDelete()"><b></b>删除</a></li>
             <%} %>


              <%if (KSSecurity.CheckPower("shop", MyCache.GetCacheModel(ChannelID, 1), 3))
                { %>
               <li id="p14"><asp:LinkButton ID="lkbVerify" OnClientClick="return(GetIDS());" runat="server" OnClick="Button1_Click"><b></b>批量审核</asp:LinkButton></li>
               <li id="p13"><asp:LinkButton ID="lkbUnVerify" OnClientClick="return(GetIDS());" runat="server" OnClick="Button2_Click"><b></b>取消审核</asp:LinkButton></li>
             <%} %>
             <%if (KSSecurity.CheckPower("shop", MyCache.GetCacheModel(ChannelID, 1), 4)) { %>
               <li id="p12"><asp:LinkButton ID="lkbClone" OnClientClick="return(GetIDS());" runat="server" OnClick="ButtonClone_Click"><b></b>克隆</asp:LinkButton></li>
            <%} %>
             <%if (KSSecurity.CheckPower("", "Shop/KS.ShopBatch.Aspx"))
               { %>
           <li id='p5'><asp:LinkButton ID="batchset" runat="server"><b></b>批量设置</asp:LinkButton></li>
             <%} %>
           <li id='p2'><asp:LinkButton ID="batchMove" runat="server"><b></b>批量移动</asp:LinkButton></li>
           <li id='p15'><asp:LinkButton ID="batchCreateHTML" runat="server" OnClientClick="RefreshItem();return(GetIDS());"><b></b>生成HTML</asp:LinkButton></li>
             <%if (KSSecurity.CheckPower("shop", MyCache.GetCacheModel(ChannelID, 1), 5))
                { %>
           <li id='p18'><asp:LinkButton ID="LinkButton1" runat="server" onclick="LinkButton1_Click"><b></b>导出Excel</asp:LinkButton></li>
             <%} %>

           </ul>
 </div>  
   <div class="menu_top_fixed_height"></div>     
   <div class="message" style="margin-top:-5px;">
          <table border="0" cellpadding="0" cellspacing="0" width="100%">
              <tr>
               <td style="height: 23px">
                  <b>快速搜索：</b>
                   <asp:DropDownList ID="Condition" runat="server">
                      <asp:ListItem Value="1">商品名称</asp:ListItem>
                      <asp:ListItem Value="2">录入者</asp:ListItem>
                      <asp:ListItem Value="3">商品编号</asp:ListItem>
                   </asp:DropDownList>
                    <asp:TextBox onfocus="keyWordFocus();" onblur="keyWordBlur();" style="color:#ccc" Text="请输入关键字！" CssClass="textbox"  ID="KeyWord" runat="server"></asp:TextBox>
                     <b>日期范围：</b>
                   <asp:TextBox ID="TextBox1" Width="150px" runat="server"  onclick="WdatePicker({dateFmt:&#39;yyyy-MM-dd HH:mm:ss&#39;});" CssClass="textbox Wdate"></asp:TextBox>至
                   <asp:TextBox ID="TextBox2" Width="150px" runat="server" onclick="WdatePicker({dateFmt:&#39;yyyy-MM-dd HH:mm:ss&#39;});"  CssClass="textbox Wdate"></asp:TextBox>

                   <asp:Button ID="Button4" runat="server" CssClass="button" Text="开始搜索" OnClick="Button4_Click" /></td>
              
               </tr>
               </table>
 </div>  
        
 <div class="tabs_header">
    <ul class="tabs">
    <li<%=KSCMS.S("showType")==""?" class='active'":string.Empty %>>
        <a href='KS.ShopManage.aspx?<%=UtilsQueryParam.Get("showtype") %>'><span>所有<%=itemName %></span></a></li>
    <li<%=KSCMS.S("showType")=="1"?" class='active'":string.Empty %>>
        <a href='KS.ShopManage.aspx?showType=1&amp;<%=UtilsQueryParam.Get("showtype") %>'><span>未审核的<%=itemName %></span></a></li>
    <li<%=KSCMS.S("showType")=="2"?" class='active'":string.Empty %>>
        <a href='KS.ShopManage.aspx?showType=2&amp;<%=UtilsQueryParam.Get("showtype") %>'><span>已审核的<%=itemName %></span></a></li>
    <li<%=KSCMS.S("showType")=="5"?" class='active'":string.Empty %>>
        <a href='KS.ShopManage.aspx?showType=5&amp;<%=UtilsQueryParam.Get("showtype") %>'><span>抢购的<%=itemName %></span></a></li>
    <li<%=KSCMS.S("showType")=="6"?" class='active'":string.Empty %>>
        <a href='KS.ShopManage.aspx?showType=6&amp;<%=UtilsQueryParam.Get("showtype") %>'><span>积分兑换</span></a></li>
    <li<%=KSCMS.S("showType")=="9"?" class='active'":string.Empty %>>
        <a href='KS.ShopManage.aspx?showType=9&amp;<%=UtilsQueryParam.Get("showtype") %>'><span>竞价</span></a></li>
    <li<%=KSCMS.S("showType")=="7"?" class='active'":string.Empty %>>
        <a href='KS.ShopManage.aspx?showType=7&amp;<%=UtilsQueryParam.Get("showtype") %>'><span>换购的<%=itemName %></span></a></li>
    <li<%=KSCMS.S("showType")=="8"?" class='active'":string.Empty %>>
        <a 
            href='KS.ShopManage.aspx?showType=8&amp;<%=UtilsQueryParam.Get("showtype") %>'><span>库存量低于10件</span></a></li>
    </ul>
     <span class="right">
     <b>属性筛选：</b>  
               <asp:CheckBoxList ID="Attribute" runat="server" RepeatLayout="Flow" RepeatDirection="Horizontal" AutoPostBack="True" OnSelectedIndexChanged="Arrtibute_SelectedIndexChanged">
                    <asp:ListItem Value="1">推荐</asp:ListItem>
                    <asp:ListItem Value="2">热点</asp:ListItem>
                    <asp:ListItem Value="3">精彩</asp:ListItem>
                    <asp:ListItem Value="4">头条</asp:ListItem>
                    <asp:ListItem Value="5">滚动</asp:ListItem>
                    <asp:ListItem Value="6">幻灯</asp:ListItem>
                </asp:CheckBoxList></span>
</div>

    <KS:KSGV ID="List" cssclass="CTable" runat="server" AutoGenerateColumns="False" PagerType="CustomNumeric"
        Width="99%" OnRowCommand="list_RowCommand" EmptyDataText="没有找到商品！"  OnRowDataBound="list_RowDataBound" GridLines="None" OnRowCreated="List_RowCreated">
        <Columns>
            <asp:TemplateField HeaderText="&lt;input type='checkbox' name='chkall' id='chkall' onClick='CheckAll(this.form);'/&gt;">
                <ItemStyle HorizontalAlign="Center"  Width="30px"/>
                <ItemTemplate>
                <input type="checkbox"  name="ids" value="<%#Eval("Infoid") %>" />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="InfoID" HeaderText="ID号" Visible="false" >
                <itemstyle horizontalalign="Center" width="40px" />
            </asp:BoundField>

            <asp:TemplateField HeaderText="状态">
              <itemstyle width="30px" horizontalalign="Center"/>
              <itemtemplate>
                   <a href="?action=setverify&infoid=<%#Eval("infoid")%>" <%# Convert.ToString(Eval("verify"))=="0"?"class='no' title='未审核'":"class='ok' title='已审核'" %>></a>
              </itemtemplate>
            </asp:TemplateField>

            <asp:TemplateField HeaderText="商品名称">
                <itemstyle   />
                <itemtemplate>
                <a class="tip" href="javascript:;" title='<img width=650 src=<%# String.IsNullOrEmpty(Convert.ToString(Eval("DefaultPic")))?"../../sysimg/nopic.gif":Eval("DefaultPic") %>>'><img  src='<%# Eval("DefaultPic") %>' style="border:1px solid #f1f1f1;padding:1px" align="left" width="45" height="45" onerror="this.src='../../sysimg/nopic.gif';" align="absmiddle" /></a>
               
                <a title="点击预览" href="<%# Kesion.HtmlTags.BasicField.GetItemUrl(Utils.StrToInt(Eval("ChannelID")),Utils.StrToInt(Eval("InfoID"))) %>" style='color:<%# Eval("titlefontcolor")%>' target="_blank"><%# Utils.CutStr(Convert.ToString(Eval("Title")),60) %></a>
                <%# Convert.ToInt16(Eval("IsLimitbuy"))!=0?"<font color=red><i>抢</i></font>":"" %>
                <%# Convert.ToInt16(Eval("IsScoreChange"))!=0?"<font color=green><i>积分</i></font>":"" %>
                <%# Convert.ToInt16(Eval("IsChangeBuy"))!=0?"<font color=blue><i>换购</i></font>":"" %>
                <%# Convert.ToInt16(Eval("GroupPrice"))==6?"<font color=brown><i>竞</i></font>":"" %>
                <div class="tips"> 分类：<%# MyCache.GetCacheClass(Convert.ToInt32(Eval("classid")),1) %> 市场价：<span style="text-decoration:line-through"><%=MyCache.GetCurrencySymbol %><%# Public.ReturnShopPrice(Utils.StrToDecimal(Eval("Price"))) %></span><%=MyCache.GetCurrencyUnit %> <%=MyCache.GetSalesPriceName %>：<%=MyCache.GetCurrencySymbol %><%# Public.ReturnShopPrice(Utils.StrToDecimal(Eval("Price_Member"))) %><%=MyCache.GetCurrencyUnit %> 库存：<%# Eval("Amount") %><%#Eval("Unit") %></div>
                </itemtemplate>
            </asp:TemplateField>
        </Columns>
        <EmptyDataRowStyle CssClass="emptycss" />
        <HeaderStyle CssClass="CTitle" />
    </KS:KSGV>
    
          <div style="margin-top:8px"></div>
             
    
         <KS:Page ID="Page1" runat="server" />
        <script type="text/javascript">
		showtips('<span class="state"><strong>说明：</strong><br /></span>属性中的各项含义：<font color=blue>荐</font>---推荐，<font color=red>热</font>---热门，<font color=#ff6600>彩</font>---精彩，头---头条，<font color=red>滚</font>---滚动，<font color=brown>幻</font>---幻灯，<font color=green>评</font>---允许评论<br />');
		</script>

</asp:Panel>


<asp:Panel ID="PanelExcel" runat="server" Visible="false">
    <KS:TopNav ID="TopNav1" Text="商品批量导出到Excel" runat="server" />

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
<table cellspacing="1" cellpadding="2" width="100%"  border="0" class="CTable" >
    <tr class="tdbg">
      <td vAlign="top" width="250" style="text-align:center">
          <asp:DropDownList ID="DropChannelID" runat="server" style="WIDTH: 200px;">
          </asp:DropDownList>
      <br />
<select style="WIDTH: 200px; HEIGHT: 280px" multiple size=2 name="ClassID1" id="ClassID1">
  <%
      Response.Write(MyCache.GetShopClassOptionList(ChannelID));
 %>
</select>
   <div align="center" style="line-height:32px">
   <input onclick="SelectAll('ClassID1')" type="button" class="button" value="选定所有栏目" name="Submit" /><br />
   <input onclick="UnSelectAll('ClassID1')" type="button" value="取消选定栏目" class="button" name="Submit" /></div>
   <br /><font color=red>提示：</font>可以按住“Shift”或“Ctrl”键多选
   </td>
   <td vAlign="top" width="250">
   <strong>选择要导出的字段：</strong><br />

      <asp:ListBox ID="LstField" runat="server" SelectionMode="Multiple" Width="200px" Height="280px">
      
      </asp:ListBox>

      <div align="center" style="line-height:32px">
   <input onclick="SelectAll('<%=this.LstField.ClientID %>')" type="button" class="button" value="选定所有字段" name="Submit" /><br />
   <input onclick="UnSelectAll('<%=this.LstField.ClientID %>')" type="button" value="取消选定字段" class="button" name="Submit" />
  </div> <br /><font color=red>提示：</font>可以按住“Shift”或“Ctrl”键多选

   </td>
   <td valign="top">
   
   <br />
    <strong>导出商品数：</strong>
    <asp:TextBox ID="TxtNum" runat="server" Text="0" CssClass="textbox" style="text-align:center;width:50px"/>
    件 <span class="tips">不限制请输入“0”。</span><br />
    <strong>日期范围：</strong>
        <input type="radio" name="limitDate" value="1" onclick="jQuery('#showdate').show();"/>限制
        <input type="radio" name="limitDate" value="0" onclick="jQuery('#showdate').hide();" checked="checked" />不限制

       <div id="showdate" style="display:none">
      添加日期从<asp:TextBox onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'});" ID="TxtBeginDate" CssClass="textbox" runat="server"></asp:TextBox>至
       <asp:TextBox onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'});" ID="TxtEndDate" CssClass="textbox" runat="server" />
      </div>
    <br />
    <strong>限定条件：</strong>
     <asp:DropDownList ID="DrpExportTJ" runat="server">
                      <asp:ListItem Value="1">商品名称</asp:ListItem>
                      <asp:ListItem Value="2">录入者</asp:ListItem>
                      <asp:ListItem Value="3">商品编号</asp:ListItem>
                   </asp:DropDownList>
    <asp:TextBox  style="color:#ccc" Text="" CssClass="textbox" ID="TxtExportKey" runat="server"></asp:TextBox>
       <br /><strong>选项：</strong>
       <asp:CheckBox ID="CkbClassId" Checked="true" runat="server" Text="栏目显示为名称" />
     <br />
     <br />

     <asp:Button ID="BtnExcel" runat="server" Text="确定导出Excel" CssClass="button"   onclick="BtnExcel_Click" />

   </td>
   </tr>
</table>


    </asp:Panel>

</asp:Content>
