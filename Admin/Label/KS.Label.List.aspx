<%@ Page Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.Admin_Label_List" Title="循环栏目列表标签" Codebehind="KS.Label.List.aspx.cs" %>
<%@ Register Src="~/control/LabelJS.ascx" TagName="LabelJS" TagPrefix="uc1" %>
<%@ Import Namespace="Kesion.Cache"%>
<%@ Import Namespace="Kesion.BLL"%>

<asp:Content ID="Content1" ContentPlaceHolderID="KSContent" Runat="Server">
<uc1:LabelJS ID="LabelJS1" runat="server"/>

<script type="text/javascript">
  function checkform()
  {
   if (jQuery("#<%=this.LabelName.ClientID%>").val()=="")
   {
   KesionJS.Alert('请输入标签名称!',"jQuery('#<%=this.LabelName.ClientID%>').focus();");
   return false;
   }

   var printstyle = jQuery("#<%=this.PrintStyle.ClientID %> :radio[checked]").val();
   var childclass=0;
   if (jQuery('#<%=this.ChildClass.ClientID %>')[0].checked) childclass=1;
   var recommends=0;
   if (jQuery("#<%=this.Attribute.ClientID %>_0")[0].checked)
   recommends=1;
   var hot=0;
   if (jQuery("#<%=this.Attribute.ClientID %>_1")[0].checked)
   hot=1;
   var splendid=0;
   if (jQuery("#<%=this.Attribute.ClientID %>_2")[0].checked)
   splendid=1;
   var slide=0;
   if (jQuery("#<%=this.Attribute.ClientID %>_3")[0].checked)
   slide=1;
   var strip=0;
   if (jQuery("#<%=this.Attribute.ClientID %>_4")[0].checked)
   strip=1;
   var rolls=0;
   if (jQuery("#<%=this.Attribute.ClientID %>_5")[0].checked)
   rolls=1;
   var showclassname=0;
   if (jQuery("#<%=this.ShowFJ.ClientID %>_0")[0].checked)
    showclassname=1;
   var shownewpic=0;
   if (jQuery("#<%=this.ShowFJ.ClientID %>_1")[0].checked)
    shownewpic=1;
   var showhotpic=0;
   if (jQuery("#<%=this.ShowFJ.ClientID %>_2")[0].checked)
       showhotpic = 1;
   var ajax = 0;
   if (jQuery("#<%=this.ChkAjax.ClientID %>")[0].checked) ajax = 1;


   var classid = '';
   jQuery("#classid1 option:selected").each(function () {
       if (jQuery(this).val() != '0')
           if (classid == '')
               classid = jQuery(this).val()
           else
               classid += "," + jQuery(this).val();
   })
   if (classid == '') classid = '0';


if (jQuery("#classid1 option:selected").val() == "-1") classid = "-1";
   var str='{KS:Label Type="list"'
          + ' ChannelID="'+jQuery("#<%=this.ChannelID.ClientID %> option:selected").val()+'"'
          + ' ClassID="'+classid+'"'
          + ' ChildClass="'+childclass+'"'
          + ' SpecialID="'+jQuery("#specialid1 option:selected").val()+'"'
          + ' PrintStyle="' + printstyle + '"'
          + ' Ajax="'+ajax+'"'
          + ' Recommends="'+recommends+'"'
          + ' Hot="'+hot+'"'
          + ' Splendid="'+splendid+'"'
          + ' Slide="'+slide+'"'
          + ' Strip="'+strip+'"'
          + ' Rolls="'+rolls+'"'
          + ' Order="'+jQuery('#<%=this.Order.ClientID %>').val()+'"'
          + ' Num="'+jQuery('#<%=this.Num.ClientID %>').val()+'"'
          + ' Col="'+jQuery('#<%=this.Col.ClientID %>').val()+'"'
          + ' LinkTarget="'+jQuery('#<%=this.LinkTarget.ClientID %>').val()+'"'
          + ' NavType="'+jQuery('#<%=this.NavType.ClientID %>').val()+'"'
          + ' NavStr="'+jQuery('#<%=this.NavStr.ClientID %>').val()+'"'
          + ' DateStyle="'+jQuery('#<%=this.DateStyle.ClientID %>').val()+'"'
          + ' ShowClassName="'+showclassname+'"'
          + ' ClassLink="0"'
          + ' TitleLen="'+jQuery('#<%=this.TitleLen.ClientID %>').val()+'"'
          + ' TitleCss="'+jQuery('#<%=this.TitleCss.ClientID %>').val()+'"'
          + ' ShowNewPic="'+shownewpic+'"'
          + ' ShowHotPic="'+showhotpic+'"'
          +'}{/KS:Label}';
   jQuery("#<%=this.LabelContent.ClientID %>").val(str);
   return true;
}
jQuery(document).ready(function () {
    GetClassOption();
});
</script>
    <table style="margin:6px" width="98%" align="center" cellpadding="1" cellspacing="1" class="CTable">
        <tr>
            <td class="lefttd" style="height: 30px; text-align: right">
                <strong>标签名称：</strong></td>
            <td runat="server" class="righttd" style="height: 30px; text-align: left">
                <span style="color: #000066">{KS_</span><asp:TextBox CssClass="noborder" ID="LabelName" runat="server" Width="126px"></asp:TextBox><span style="color: #000066"> } * 调用格式：{KS_标签名称}</span><asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="LabelName"
                    Display="Dynamic" ErrorMessage="标签名称必须输入"></asp:RequiredFieldValidator></td>
        </tr>
    <tr>
     <td class="lefttd" style="text-align: right; height: 30px;">
         <strong>标签目录：</strong></td>
     <td class="righttd" style="text-align: left; height: 30px;"><span  id="classidarea" runat="server"></span><font color=red> 请选择标签所属目录，以便日后管理标签</font></td>
    </tr>
    </table>
        <table style="margin:6px" width="98%" align="center" cellpadding="1" cellspacing="1" class="CTable">
        <tr>
            <td class="lefttd" style="height: 30px; text-align: right">
                <strong>标签输出格式：</strong></td>
            <td runat="server" class="righttd"  style="height: 30px; text-align: left">
                    <asp:RadioButtonList ID="PrintStyle" runat="server" RepeatDirection="Horizontal">
                        <asp:ListItem Value="1" Selected="True">Table</asp:ListItem>
                        <asp:ListItem Value="2">纯LI输出(推荐)</asp:ListItem>
                    </asp:RadioButtonList></td>
            <td class="righttd">
                <strong>是否AJAX输出：</strong><asp:CheckBox runat="server" ID="ChkAjax" Text="AJAX输出" /></td>
        </tr>
            <tr>
                <td class="lefttd" style="height: 30px; text-align: right">
                    <strong>调用模型：</strong></td>
                <td runat="server" class="righttd" colspan="2" style="height: 30px; text-align: left">

                      <asp:DropDownList ID="ChannelID" runat="server">
                       <asp:ListItem Value="0">---不指定模型---</asp:ListItem>
                      </asp:DropDownList>
                    &nbsp; <strong>查询条数：</strong><asp:TextBox CssClass="textbox" style="text-align:center" ID="Num" runat="server" Width="41px">10</asp:TextBox>条&nbsp;
                    <strong>排序方式：</strong><asp:DropDownList ID="Order" runat="server">
                    <asp:ListItem Value="i.infoid desc">信息ID降序</asp:ListItem>
                    <asp:ListItem Value="i.infoid asc">信息ID升序</asp:ListItem>
                    <asp:ListItem Value="i.adddate desc">更新时间降序</asp:ListItem>
                    <asp:ListItem Value="i.adddate ast">更新时间升序</asp:ListItem>
                    <asp:ListItem Value="i.commentnum desc">总评论数降序</asp:ListItem>
                    <asp:ListItem Value="i.commentnum asc">总评论数升序</asp:ListItem>
                    <asp:ListItem Value="i.hits desc">总浏览数降序</asp:ListItem>
                    <asp:ListItem Value="i.hits asc">总浏览数升序</asp:ListItem>
                    <asp:ListItem Value="i.hitsbymonth desc">月浏览数降序</asp:ListItem>
                    <asp:ListItem Value="i.hitsbymonth asc">月浏览数升序</asp:ListItem>
                    <asp:ListItem Value="i.hitsbyweek desc">周浏览数降序</asp:ListItem>
                    <asp:ListItem Value="i.hitsbyweek asc">周浏览数升序</asp:ListItem>
                    <asp:ListItem Value="i.hitsbyday desc">日浏览数降序</asp:ListItem>
                    <asp:ListItem Value="i.hitsbyday asc">日浏览数升序</asp:ListItem>
                    <asp:ListItem Value="newid()">随机显示</asp:ListItem>
                     </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td class="lefttd" style="height: 30px; text-align: right">
                    <strong>所属栏目：</strong></td>
                <td runat="server" class="righttd" colspan="2" style="height: 30px; text-align: left">
                 <table border="0" cellpadding="0" cellspacing="0">
                     <tr>
                      <td><select name="classid1" id="classid1" multiple="multiple" size="3" style="width: 120px">
                      <option value="0">-不指定栏目-</option><option value="-1" style="color:red">当前栏目通用</option>
                      </select> 
                     </td>
                      <td>
                      <strong>&nbsp; 所属专题：</strong>
                      </td>
                      <td>
                       <select name="specialid1" id="specialid1" style="width: 120px">
                       <option value=''>-不指定专题-</option><option value="-1" style="color:red">当前专题通用</option>
                       <%=BaseFun.GetSpecialOption("0") %>
                       </select>
                      </td>
                      <td><asp:CheckBox ID="ChildClass" runat="server" Checked="true" Text="允许列出子栏目信息" />
</td>
                     </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td class="lefttd" style="height: 30px; text-align: right">
                    <strong>属性控制：</strong></td>
                <td runat="server" class="righttd" colspan="2" style="height: 30px; text-align: left">
                    <asp:CheckBoxList ID="Attribute" runat="server" RepeatDirection="Horizontal">
                        <asp:ListItem Value="1">推荐</asp:ListItem>
                        <asp:ListItem Value="2">热点</asp:ListItem>
                        <asp:ListItem Value="3">精彩</asp:ListItem>
                        <asp:ListItem Value="4">幻灯</asp:ListItem>
                        <asp:ListItem Value="5">头条</asp:ListItem>
                        <asp:ListItem Value="6">滚动</asp:ListItem>
                    </asp:CheckBoxList></td>
            </tr>
            <tr>
                <td class="lefttd" style="height: 30px; text-align: right">
                    <strong>标题字数：</strong></td>
                <td runat="server" class="righttd" style=" height: 30px; text-align: left; width: 175px;">
                    <asp:TextBox CssClass="textbox" style="text-align:center" ID="TitleLen" runat="server" Width="40px">30</asp:TextBox>
                    <font color=red>1个汉字算2个字符</font></td>
                <td runat="server" class="righttd" style="height: 30px; text-align: left">
                    <strong>排列列数：<asp:TextBox CssClass="textbox" style="text-align:center" ID="Col" runat="server" Width="41px">1</asp:TextBox></strong>列
                    
                    </td>
            </tr>
            <tr>
                <td class="lefttd" style="height: 30px; text-align: right">
                    <strong>标题样式：</strong></td>
                <td runat="server" class="righttd" style=" height: 30px; text-align: left; ">
                    <asp:TextBox  CssClass="textbox" ID="TitleCss" runat="server" Width="40px"></asp:TextBox>
                    <span style="color: red">填写在CSS里定义的样式名称</span></td>
                <td runat="server" class="righttd" style="height: 30px; text-align: left">
                    <strong>链接目标：</strong>
                    <asp:DropDownList ID="LinkTarget" runat="server">
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem>_blank</asp:ListItem>
                    <asp:ListItem>_parent</asp:ListItem>
                    <asp:ListItem>_top</asp:ListItem>
                    <asp:ListItem>_self</asp:ListItem>
                    </asp:DropDownList></td>
            </tr>
            <tr>
                <td class="lefttd" style="height: 30px; text-align: right">
                    <strong>附加显示：</strong></td>
                <td runat="server" class="righttd" colspan="2" style="height: 30px; text-align: left">
                    <asp:CheckBoxList ID="ShowFJ" runat="server" RepeatDirection="Horizontal">
                        <asp:ListItem Value="1">显示栏目名称</asp:ListItem>
                        <asp:ListItem Value="2">显示最新标志</asp:ListItem>
                        <asp:ListItem Value="3">显示热门标志</asp:ListItem>
                    </asp:CheckBoxList></td>
            </tr>
            <tr>
                <td class="lefttd" style="height: 30px; text-align: right">
                    <strong>导航类型：</strong></td>
                <td runat="server" class="righttd" colspan="2" style="height: 30px; text-align: left">
                    <asp:DropDownList ID="NavType" runat="server">
                    <asp:ListItem Value="0">文字导航</asp:ListItem>
                    <asp:ListItem Value="1">图片导航</asp:ListItem>
                </asp:DropDownList>
                    <asp:TextBox CssClass="textbox" ID="NavStr" runat="server" Width="145px">&#183;</asp:TextBox>&nbsp;
                    图片导航，请输入图片地址</td>
            </tr>
            <tr>
                <td class="lefttd" style="height: 30px; text-align: right">
                    <strong>日期格式：</strong><br />
                    <font color="blue">说明：</font>
                    </td>
                <td runat="server" class="righttd" colspan="2" style="height: 30px; text-align: left">
                    <asp:TextBox CssClass="textbox" ID="DateStyle" runat="server" Width="307px">YY-MM-DD</asp:TextBox>&nbsp;<br />
                    <span style="color: blue">Y4或YY表示四位的年份，Y2两位年份，MM表示月份，DD表示日，hh小时 mm分钟 ss钞</span></td>
            </tr>
      </table>
     <div style="text-align:center">
         <asp:TextBox ID="LabelContent" runat="server"></asp:TextBox>
     <asp:Button ID="Button1" CssClass="button" runat="server" OnClientClick="return(checkform())" Text="确定创建(O)" AccessKey="O" OnClick="Button1_Click"/>
           <input type="button" class="button" onclick="javascript:parent.box.close();" accesskey="C" value="关闭取消(C)" /><br />
     </div>


</asp:Content>

