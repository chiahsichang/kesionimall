<%@ Page Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.Admin_Label_FunLabel_RollsPic" Title="Untitled Page" Codebehind="KS.Label.RollsPic.aspx.cs" %>
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


   var direction = jQuery("#<%=this.Direction.ClientID %> :radio[checked]").val();
   var showtitle = jQuery("#<%=this.ShowTitle.ClientID %> :radio[checked]").val();
   
   var childclass=0;
   if (jQuery('#<%=this.ChildClass.ClientID %>')[0].checked) childclass=1;
   var recommends=0;
   
   
   var classid='';
	jQuery("#classid1 option:selected").each(function(){
		if (jQuery(this).val()!='0' && jQuery(this).val()!='-1')
			if (classid=='') 
				 classid=jQuery(this).val() 
			else
				 classid+=","+jQuery(this).val();
		})
   if (classid=='') classid='0';
   if (jQuery("#classid1 option:selected").val() == "-1") classid = "-1";

   var str='{KS:Label Type="RollsPic"'
          + ' ChannelID="'+jQuery("#<%=this.ChannelID.ClientID %> option:selected").val()+'"'
          + ' ClassID="'+classid+'"'
          + ' ChildClass="'+childclass+'"'
          + ' SpecialID="'+jQuery("#specialid1 option:selected").val()+'"'
          + ' Direction="'+direction+'"'
          + ' Num="'+jQuery('#<%=this.Num.ClientID %>').val()+'"'
          + ' Width="'+jQuery('#<%=this.Width.ClientID %>').val()+'"'
          + ' Height="'+jQuery('#<%=this.Height.ClientID %>').val()+'"'
          + ' PicWidth="'+jQuery('#<%=this.PicWidth.ClientID %>').val()+'"'
          + ' PicHeight="'+jQuery('#<%=this.PicHeight.ClientID %>').val()+'"'
          + ' ShowTitle="'+showtitle+'"'
          + ' TitleLen="'+jQuery('#<%=this.TitleLen.ClientID %>').val()+'"'
          + ' PicCss="'+jQuery('#<%=this.PicCss.ClientID %>').val()+'"'
          + ' TitleCss="'+jQuery('#<%=this.TitleCss.ClientID %>').val()+'"'
          + ' LinkTarget="'+jQuery('#<%=this.LinkTarget.ClientID %>').val()+'"'
          + ' Order="'+jQuery('#<%=this.Order.ClientID %>').val()+'"'
          + ' Speed="'+jQuery('#<%=this.Speed.ClientID %>').val()+'"'
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
                <strong>滚动方向：</strong></td>
            <td runat="server" class="righttd" style="height: 30px; text-align: left">
                    <asp:RadioButtonList ID="Direction" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow">
                        <asp:ListItem Value="left" Selected="True">向左滚动</asp:ListItem>
                        <asp:ListItem Value="right">向右滚动</asp:ListItem>
                        <asp:ListItem Value="up">向上滚动</asp:ListItem>
                        <asp:ListItem Value="down">向下滚动</asp:ListItem>
                    </asp:RadioButtonList></td>
        </tr>
            <tr>
                <td class="lefttd" style="height: 30px; text-align: right">
                    <strong>调用模型：</strong></td>
                <td runat="server" class="righttd" style="height: 30px; text-align: left">

                      <asp:DropDownList ID="ChannelID" runat="server">
                      <asp:ListItem Value="0">--不指定模型--</asp:ListItem>
                      </asp:DropDownList>
                    &nbsp; <strong>查询条数：</strong><asp:TextBox  CssClass="textbox" style="text-align:center" ID="Num" runat="server" Width="41px">10</asp:TextBox>条&nbsp;
                </td>
            </tr>
            <tr>
                <td class="lefttd" style="height: 30px; text-align: right">
                    <strong>所属栏目：</strong></td>
                <td runat="server" class="righttd" style="height: 30px; text-align: left">
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
                    <strong>排序方式：</strong></td>
                <td runat="server" class="righttd" style="height: 30px; text-align: left">
                    <asp:DropDownList ID="Order" runat="server">
                    <asp:ListItem Value="I.infoid desc">信息ID降序</asp:ListItem>
                    <asp:ListItem Value="I.infoid asc">信息ID升序</asp:ListItem>
                    <asp:ListItem Value="I.adddate desc">更新时间降序</asp:ListItem>
                    <asp:ListItem Value="I.adddate ast">更新时间升序</asp:ListItem>
                    <asp:ListItem Value="i.hits desc">总浏览数降序</asp:ListItem>
                    <asp:ListItem Value="i.hits asc">总浏览数升序</asp:ListItem>
                    <asp:ListItem Value="i.hitsbymonth desc">月浏览数降序</asp:ListItem>
                    <asp:ListItem Value="i.hitsbymonth asc">月浏览数升序</asp:ListItem>
                    <asp:ListItem Value="i.hitsbyweek desc">周浏览数降序</asp:ListItem>
                    <asp:ListItem Value="i.hitsbyweek asc">周浏览数升序</asp:ListItem>
                    <asp:ListItem Value="i.hitsbyday desc">日浏览数降序</asp:ListItem>
                    <asp:ListItem Value="i.hitsbyday asc">日浏览数升序</asp:ListItem>
                    <asp:ListItem Value="newid()">随机显示</asp:ListItem>
                      </asp:DropDownList>&nbsp; <span style="color: #ff0033">如果想让最新添加的显示在最前面，请选择自动ID降序</span></td>
            </tr>
            <tr>
                <td class="lefttd" style="height: 30px; text-align: right">
                    <strong>滚动区域：</strong></td>
                <td runat="server" class="righttd" style="height: 30px; text-align: left">
                    滚动宽度<asp:TextBox  CssClass="textbox" ID="Width" runat="server" Width="69px">450</asp:TextBox>px&nbsp;
                    滚动高度<asp:TextBox  CssClass="textbox" ID="Height" runat="server" Width="69px">120</asp:TextBox>px</td>
            </tr>
            <tr>
                <td class="lefttd" style="height: 30px; text-align: right">
                    <strong>图片大小：</strong></td>
                <td runat="server" class="righttd" style="height: 30px; text-align: left">
                    图片宽度<asp:TextBox  CssClass="textbox" ID="PicWidth" runat="server" Width="69px">130</asp:TextBox>px&nbsp;
                    图片高度<asp:TextBox  CssClass="textbox" ID="PicHeight" runat="server" Width="69px">90</asp:TextBox>px</td>
            </tr>
            <tr>
                <td class="lefttd" style="height: 30px; text-align: right">
                    <strong>显示标题：</strong></td>
                <td id="Td4" runat="server" class="righttd" style="height: 30px; text-align: left">
                    <asp:RadioButtonList ID="ShowTitle" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow">
                        <asp:ListItem Selected="True" Value="1">显示</asp:ListItem>
                        <asp:ListItem Value="0">不显示</asp:ListItem>
                    </asp:RadioButtonList>
                    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 标题字数<asp:TextBox  CssClass="textbox" style="text-align:center" ID="TitleLen" runat="server" Width="69px">30</asp:TextBox>
                    <font color=red>1个汉字算2个字符</font></td>
            </tr>
            <tr>
                <td class="lefttd" style="height: 30px; text-align: right">
                    <strong>样式设置：</strong></td>
                <td id="Td2" runat="server" class="righttd" style="height: 30px; text-align: left">
                    图片样式<asp:TextBox  CssClass="textbox" ID="PicCss" runat="server" Width="85px"></asp:TextBox>
                    &nbsp;&nbsp; 标题样式<asp:TextBox  CssClass="textbox" ID="TitleCss" runat="server" Width="85px"></asp:TextBox></td>
            </tr>
            <tr>
                <td class="lefttd" style="height: 30px; text-align: right">
                    <strong>链接目标：</strong></td>
                <td id="Td3" runat="server" class="righttd" style="height: 30px; text-align: left">
                    <asp:DropDownList ID="LinkTarget" runat="server">
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem>_blank</asp:ListItem>
                    <asp:ListItem>_parent</asp:ListItem>
                    <asp:ListItem>_top</asp:ListItem>
                    <asp:ListItem>_self</asp:ListItem>
                    </asp:DropDownList>
                    &nbsp; &nbsp;&nbsp; 滚动速度<asp:TextBox  CssClass="textbox" ID="Speed" runat="server" Text="30" Width="85px"></asp:TextBox></td>
            </tr>
      </table>
     <div style="text-align:center">
         <asp:TextBox ID="LabelContent" runat="server"></asp:TextBox>
     <asp:Button ID="Button1" CssClass="button" runat="server" Text="确定创建(O)" AccessKey="O" OnClick="Button1_Click"/>
           <input type="button" class="button" onclick="javascript:parent.box.close();" accesskey="C" value="关闭取消(C)" /><br />
     </div>

</asp:Content>

