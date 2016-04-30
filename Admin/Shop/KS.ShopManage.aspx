<%@ Page Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.Admin_ShopManage" Title="��Ʒ����" Codebehind="KS.ShopManage.aspx.cs" %>
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
        KesionJS.Alert("��ѡ��Ҫɾ����<%=itemName%>");
            return false;
    } else {
        KesionJS.Confirm("ȷ��ɾ��ѡ��<%=itemName%>?",'location.href = "<%=KSCMS.GetInstallDir()+MyCache.GetCacheConfig(4)%>/shop/KS.ShopManage.aspx?action=del&channelid=<%=ChannelID%>&classid=<%=ClassID%>&page=<%=CurrPage%>&ids='+sid+"\";","");
        }
    }
 function ContentSetAttribute(){
     var sid = GetMyIds();
	  if (sid!=null)  parent.openWin("��������<%=itemName %>����","shop/KS.ShopBatch.Aspx?ContentID="+sid+"&ChannelID=<%=ChannelID %>",true);
}
function ContentMove() {
    var sid = GetMyIds();
    if (sid != null) parent.openWin("<%=itemName %>�����ƶ�", "Content/KS.ClassMove.aspx?from=shop&ContentID=" + sid + "&ChannelID=<%=ChannelID%>", true,800, 360);
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
 function RefreshItem() {
        var sid = GetMyIds();
        if (sid != null) parent.openWin("��������<%=itemName %>HTML����", "Refresh/KS.RefreshHtml.Aspx?ChannelID=<%=ChannelID %>&refreshtype=itemids&action=content&ids=" + sid, false,650,250);
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
                <option value=0>������ת����Ŀ...</option>
                <%=ClassManage.GetClassOptionByPurview(Convert.ToInt16(ChannelID),ClassID.ToString())%>
               </select>
         </span>
             <%if (KSSecurity.CheckPower("shop", KSSecurity.RemovePowerBadChar("Content/KS.Class.aspx?from=shop"), 0))
               { %>   
           <li id='p1'><asp:LinkButton ID="addclass" runat="server" OnClick="addclass_Click"><b></b>�����Ŀ</asp:LinkButton></li>
             <%} %>
              <%if (KSSecurity.CheckPower("shop", MyCache.GetCacheModel(ChannelID, 1),0)) { %>
           <li id='p8'><asp:LinkButton ID="addsubject" runat="server" OnClick="addsubject_Click"><b></b>���<%=itemName %></asp:LinkButton></li>
             <%} %>
              <%if (KSSecurity.CheckPower("shop", MyCache.GetCacheModel(ChannelID, 1),2)) { %>
          <li id='p3'><a href="javascript:;" onclick="doDelete()"><b></b>ɾ��</a></li>
             <%} %>


              <%if (KSSecurity.CheckPower("shop", MyCache.GetCacheModel(ChannelID, 1), 3))
                { %>
               <li id="p14"><asp:LinkButton ID="lkbVerify" OnClientClick="return(GetIDS());" runat="server" OnClick="Button1_Click"><b></b>�������</asp:LinkButton></li>
               <li id="p13"><asp:LinkButton ID="lkbUnVerify" OnClientClick="return(GetIDS());" runat="server" OnClick="Button2_Click"><b></b>ȡ�����</asp:LinkButton></li>
             <%} %>
             <%if (KSSecurity.CheckPower("shop", MyCache.GetCacheModel(ChannelID, 1), 4)) { %>
               <li id="p12"><asp:LinkButton ID="lkbClone" OnClientClick="return(GetIDS());" runat="server" OnClick="ButtonClone_Click"><b></b>��¡</asp:LinkButton></li>
            <%} %>
             <%if (KSSecurity.CheckPower("", "Shop/KS.ShopBatch.Aspx"))
               { %>
           <li id='p5'><asp:LinkButton ID="batchset" runat="server"><b></b>��������</asp:LinkButton></li>
             <%} %>
           <li id='p2'><asp:LinkButton ID="batchMove" runat="server"><b></b>�����ƶ�</asp:LinkButton></li>
           <li id='p15'><asp:LinkButton ID="batchCreateHTML" runat="server" OnClientClick="RefreshItem();return(GetIDS());"><b></b>����HTML</asp:LinkButton></li>
             <%if (KSSecurity.CheckPower("shop", MyCache.GetCacheModel(ChannelID, 1), 5))
                { %>
           <li id='p18'><asp:LinkButton ID="LinkButton1" runat="server" onclick="LinkButton1_Click"><b></b>����Excel</asp:LinkButton></li>
             <%} %>

           </ul>
 </div>  
   <div class="menu_top_fixed_height"></div>     
   <div class="message" style="margin-top:-5px;">
          <table border="0" cellpadding="0" cellspacing="0" width="100%">
              <tr>
               <td style="height: 23px">
                  <b>����������</b>
                   <asp:DropDownList ID="Condition" runat="server">
                      <asp:ListItem Value="1">��Ʒ����</asp:ListItem>
                      <asp:ListItem Value="2">¼����</asp:ListItem>
                      <asp:ListItem Value="3">��Ʒ���</asp:ListItem>
                   </asp:DropDownList>
                    <asp:TextBox onfocus="keyWordFocus();" onblur="keyWordBlur();" style="color:#ccc" Text="������ؼ��֣�" CssClass="textbox"  ID="KeyWord" runat="server"></asp:TextBox>
                     <b>���ڷ�Χ��</b>
                   <asp:TextBox ID="TextBox1" Width="150px" runat="server"  onclick="WdatePicker({dateFmt:&#39;yyyy-MM-dd HH:mm:ss&#39;});" CssClass="textbox Wdate"></asp:TextBox>��
                   <asp:TextBox ID="TextBox2" Width="150px" runat="server" onclick="WdatePicker({dateFmt:&#39;yyyy-MM-dd HH:mm:ss&#39;});"  CssClass="textbox Wdate"></asp:TextBox>

                   <asp:Button ID="Button4" runat="server" CssClass="button" Text="��ʼ����" OnClick="Button4_Click" /></td>
              
               </tr>
               </table>
 </div>  
        
 <div class="tabs_header">
    <ul class="tabs">
    <li<%=KSCMS.S("showType")==""?" class='active'":string.Empty %>>
        <a href='KS.ShopManage.aspx?<%=UtilsQueryParam.Get("showtype") %>'><span>����<%=itemName %></span></a></li>
    <li<%=KSCMS.S("showType")=="1"?" class='active'":string.Empty %>>
        <a href='KS.ShopManage.aspx?showType=1&amp;<%=UtilsQueryParam.Get("showtype") %>'><span>δ��˵�<%=itemName %></span></a></li>
    <li<%=KSCMS.S("showType")=="2"?" class='active'":string.Empty %>>
        <a href='KS.ShopManage.aspx?showType=2&amp;<%=UtilsQueryParam.Get("showtype") %>'><span>����˵�<%=itemName %></span></a></li>
    <li<%=KSCMS.S("showType")=="5"?" class='active'":string.Empty %>>
        <a href='KS.ShopManage.aspx?showType=5&amp;<%=UtilsQueryParam.Get("showtype") %>'><span>������<%=itemName %></span></a></li>
    <li<%=KSCMS.S("showType")=="6"?" class='active'":string.Empty %>>
        <a href='KS.ShopManage.aspx?showType=6&amp;<%=UtilsQueryParam.Get("showtype") %>'><span>���ֶһ�</span></a></li>
    <li<%=KSCMS.S("showType")=="9"?" class='active'":string.Empty %>>
        <a href='KS.ShopManage.aspx?showType=9&amp;<%=UtilsQueryParam.Get("showtype") %>'><span>����</span></a></li>
    <li<%=KSCMS.S("showType")=="7"?" class='active'":string.Empty %>>
        <a href='KS.ShopManage.aspx?showType=7&amp;<%=UtilsQueryParam.Get("showtype") %>'><span>������<%=itemName %></span></a></li>
    <li<%=KSCMS.S("showType")=="8"?" class='active'":string.Empty %>>
        <a 
            href='KS.ShopManage.aspx?showType=8&amp;<%=UtilsQueryParam.Get("showtype") %>'><span>���������10��</span></a></li>
    </ul>
     <span class="right">
     <b>����ɸѡ��</b>  
               <asp:CheckBoxList ID="Attribute" runat="server" RepeatLayout="Flow" RepeatDirection="Horizontal" AutoPostBack="True" OnSelectedIndexChanged="Arrtibute_SelectedIndexChanged">
                    <asp:ListItem Value="1">�Ƽ�</asp:ListItem>
                    <asp:ListItem Value="2">�ȵ�</asp:ListItem>
                    <asp:ListItem Value="3">����</asp:ListItem>
                    <asp:ListItem Value="4">ͷ��</asp:ListItem>
                    <asp:ListItem Value="5">����</asp:ListItem>
                    <asp:ListItem Value="6">�õ�</asp:ListItem>
                </asp:CheckBoxList></span>
</div>

    <KS:KSGV ID="List" cssclass="CTable" runat="server" AutoGenerateColumns="False" PagerType="CustomNumeric"
        Width="99%" OnRowCommand="list_RowCommand" EmptyDataText="û���ҵ���Ʒ��"  OnRowDataBound="list_RowDataBound" GridLines="None" OnRowCreated="List_RowCreated">
        <Columns>
            <asp:TemplateField HeaderText="&lt;input type='checkbox' name='chkall' id='chkall' onClick='CheckAll(this.form);'/&gt;">
                <ItemStyle HorizontalAlign="Center"  Width="30px"/>
                <ItemTemplate>
                <input type="checkbox"  name="ids" value="<%#Eval("Infoid") %>" />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="InfoID" HeaderText="ID��" Visible="false" >
                <itemstyle horizontalalign="Center" width="40px" />
            </asp:BoundField>

            <asp:TemplateField HeaderText="״̬">
              <itemstyle width="30px" horizontalalign="Center"/>
              <itemtemplate>
                   <a href="?action=setverify&infoid=<%#Eval("infoid")%>" <%# Convert.ToString(Eval("verify"))=="0"?"class='no' title='δ���'":"class='ok' title='�����'" %>></a>
              </itemtemplate>
            </asp:TemplateField>

            <asp:TemplateField HeaderText="��Ʒ����">
                <itemstyle   />
                <itemtemplate>
                <a class="tip" href="javascript:;" title='<img width=650 src=<%# String.IsNullOrEmpty(Convert.ToString(Eval("DefaultPic")))?"../../sysimg/nopic.gif":Eval("DefaultPic") %>>'><img  src='<%# Eval("DefaultPic") %>' style="border:1px solid #f1f1f1;padding:1px" align="left" width="45" height="45" onerror="this.src='../../sysimg/nopic.gif';" align="absmiddle" /></a>
               
                <a title="���Ԥ��" href="<%# Kesion.HtmlTags.BasicField.GetItemUrl(Utils.StrToInt(Eval("ChannelID")),Utils.StrToInt(Eval("InfoID"))) %>" style='color:<%# Eval("titlefontcolor")%>' target="_blank"><%# Utils.CutStr(Convert.ToString(Eval("Title")),60) %></a>
                <%# Convert.ToInt16(Eval("IsLimitbuy"))!=0?"<font color=red><i>��</i></font>":"" %>
                <%# Convert.ToInt16(Eval("IsScoreChange"))!=0?"<font color=green><i>����</i></font>":"" %>
                <%# Convert.ToInt16(Eval("IsChangeBuy"))!=0?"<font color=blue><i>����</i></font>":"" %>
                <%# Convert.ToInt16(Eval("GroupPrice"))==6?"<font color=brown><i>��</i></font>":"" %>
                <div class="tips"> ���ࣺ<%# MyCache.GetCacheClass(Convert.ToInt32(Eval("classid")),1) %> �г��ۣ�<span style="text-decoration:line-through"><%=MyCache.GetCurrencySymbol %><%# Public.ReturnShopPrice(Utils.StrToDecimal(Eval("Price"))) %></span><%=MyCache.GetCurrencyUnit %> <%=MyCache.GetSalesPriceName %>��<%=MyCache.GetCurrencySymbol %><%# Public.ReturnShopPrice(Utils.StrToDecimal(Eval("Price_Member"))) %><%=MyCache.GetCurrencyUnit %> ��棺<%# Eval("Amount") %><%#Eval("Unit") %></div>
                </itemtemplate>
            </asp:TemplateField>
        </Columns>
        <EmptyDataRowStyle CssClass="emptycss" />
        <HeaderStyle CssClass="CTitle" />
    </KS:KSGV>
    
          <div style="margin-top:8px"></div>
             
    
         <KS:Page ID="Page1" runat="server" />
        <script type="text/javascript">
		showtips('<span class="state"><strong>˵����</strong><br /></span>�����еĸ���壺<font color=blue>��</font>---�Ƽ���<font color=red>��</font>---���ţ�<font color=#ff6600>��</font>---���ʣ�ͷ---ͷ����<font color=red>��</font>---������<font color=brown>��</font>---�õƣ�<font color=green>��</font>---��������<br />');
		</script>

</asp:Panel>


<asp:Panel ID="PanelExcel" runat="server" Visible="false">
    <KS:TopNav ID="TopNav1" Text="��Ʒ����������Excel" runat="server" />

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
   <input onclick="SelectAll('ClassID1')" type="button" class="button" value="ѡ��������Ŀ" name="Submit" /><br />
   <input onclick="UnSelectAll('ClassID1')" type="button" value="ȡ��ѡ����Ŀ" class="button" name="Submit" /></div>
   <br /><font color=red>��ʾ��</font>���԰�ס��Shift����Ctrl������ѡ
   </td>
   <td vAlign="top" width="250">
   <strong>ѡ��Ҫ�������ֶΣ�</strong><br />

      <asp:ListBox ID="LstField" runat="server" SelectionMode="Multiple" Width="200px" Height="280px">
      
      </asp:ListBox>

      <div align="center" style="line-height:32px">
   <input onclick="SelectAll('<%=this.LstField.ClientID %>')" type="button" class="button" value="ѡ�������ֶ�" name="Submit" /><br />
   <input onclick="UnSelectAll('<%=this.LstField.ClientID %>')" type="button" value="ȡ��ѡ���ֶ�" class="button" name="Submit" />
  </div> <br /><font color=red>��ʾ��</font>���԰�ס��Shift����Ctrl������ѡ

   </td>
   <td valign="top">
   
   <br />
    <strong>������Ʒ����</strong>
    <asp:TextBox ID="TxtNum" runat="server" Text="0" CssClass="textbox" style="text-align:center;width:50px"/>
    �� <span class="tips">�����������롰0����</span><br />
    <strong>���ڷ�Χ��</strong>
        <input type="radio" name="limitDate" value="1" onclick="jQuery('#showdate').show();"/>����
        <input type="radio" name="limitDate" value="0" onclick="jQuery('#showdate').hide();" checked="checked" />������

       <div id="showdate" style="display:none">
      ������ڴ�<asp:TextBox onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'});" ID="TxtBeginDate" CssClass="textbox" runat="server"></asp:TextBox>��
       <asp:TextBox onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'});" ID="TxtEndDate" CssClass="textbox" runat="server" />
      </div>
    <br />
    <strong>�޶�������</strong>
     <asp:DropDownList ID="DrpExportTJ" runat="server">
                      <asp:ListItem Value="1">��Ʒ����</asp:ListItem>
                      <asp:ListItem Value="2">¼����</asp:ListItem>
                      <asp:ListItem Value="3">��Ʒ���</asp:ListItem>
                   </asp:DropDownList>
    <asp:TextBox  style="color:#ccc" Text="" CssClass="textbox" ID="TxtExportKey" runat="server"></asp:TextBox>
       <br /><strong>ѡ�</strong>
       <asp:CheckBox ID="CkbClassId" Checked="true" runat="server" Text="��Ŀ��ʾΪ����" />
     <br />
     <br />

     <asp:Button ID="BtnExcel" runat="server" Text="ȷ������Excel" CssClass="button"   onclick="BtnExcel_Click" />

   </td>
   </tr>
</table>


    </asp:Panel>

</asp:Content>
