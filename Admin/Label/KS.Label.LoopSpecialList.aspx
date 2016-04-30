<%@ Page Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.Admin_Label_LoopSpecialList" Title="Untitled Page" Codebehind="KS.Label.LoopSpecialList.aspx.cs" %>
<%@ Import Namespace="Kesion.Cache" %>
<%@ Import Namespace="Kesion.Publics" %>
<asp:Content ID="Content1" ContentPlaceHolderID="KSContent" Runat="Server">
<script type="text/javascript">
  function checkform()
  {
   if (jQuery("#<%=this.LabelName.ClientID%>").val()=="")
   {
   jQuery("#<%=this.LabelName.ClientID%>").focus();
   KesionJS.Alert('请输入标签名称',null);
   return false;
   }
   
   var printstyle=jQuery("#<%=this.PrintStyle.ClientID %> :radio[checked]").val();
   var ajax = 0;
   if (jQuery("#<%=this.ChkAjax.ClientID %>")[0].checked) ajax = 1;
   
   var recommends=0;
   if (jQuery("#<%=this.Attribute.ClientID %>_0")[0].checked)
   recommends=1;
   var showpiconly=0;
   if (jQuery("#<%=this.Attribute.ClientID %>_1")[0].checked)
   showpiconly=1;
   
   var classid='';
	jQuery("#<%=this.LxtClassID.ClientID %> option:selected").each(function(){
		if (jQuery(this).val()!='0' && jQuery(this).val()!='-1')
			if (classid=='') 
				 classid=jQuery(this).val() 
			else
				 classid+=","+jQuery(this).val();
		})
   if (classid=='') classid='0';
   
   
   var str='{KS:Label Type="loopspeciallist"'
          + ' PrintStyle="'+printstyle+'"'
          + ' ShowStyle="' + jQuery("#<%=this.ShowStyle.ClientID %> option:selected").val() + '"'
          + ' Ajax="'+ajax+'"'
          + ' ClassID="'+classid+'"'
          + ' Num="'+jQuery('#<%=this.Num.ClientID %>').val()+'"'
          + ' Col="'+jQuery('#<%=this.Col.ClientID %>').val()+'"'
          + ' InfoCol="'+jQuery('#<%=this.InfoCol.ClientID %>').val()+'"'
          + ' Recommends="'+recommends+'"'
          + ' ShowPicOnly="'+showpiconly+'"'
          + ' PicWidth="'+jQuery('#<%=this.PicWidth.ClientID %>').val()+'"'
          + ' PicHeight="'+jQuery('#<%=this.PicHeight.ClientID %>').val()+'"'
          + ' LinkTarget="'+jQuery('#<%=this.LinkTarget.ClientID %>').val()+'"'
          + ' NavType="'+jQuery('#<%=this.NavType.ClientID %>').val()+'"'
          + ' NavStr="'+jQuery('#<%=this.NavStr.ClientID %>').val()+'"'
          + ' DateStyle="'+jQuery('#<%=this.DateStyle.ClientID %>').val()+'"'
          + ' Order="'+jQuery('#<%=this.Order.ClientID %>').val()+'"'
          + ' TitleLen="'+jQuery('#<%=this.TitleLen.ClientID %>').val()+'"'
          + ' IntroLen="'+jQuery('#<%=this.IntroLen.ClientID %>').val()+'"'
          + ' TitleCss="'+jQuery('#<%=this.TitleCss.ClientID %>').val()+'"'
          + '}{/KS:Label}';

   jQuery("#<%=this.LabelContent.ClientID %>").val(str);
   return true;
  }
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
         <strong>标签目录</strong></td>
     <td class="righttd" style="text-align: left; height: 30px;"><span  id="classidarea" runat="server"></span><font color=red> 请选择标签所属目录，以便日后管理标签</font></td>
    </tr>
    </table>
        <table style="margin:6px" width="98%" align="center" cellpadding="1" cellspacing="1" class="CTable">
        <tr>
            <td class="lefttd" style="height: 30px; text-align: right">
                <strong>标签输出格式：</strong></td>
            <td runat="server" class="righttd" style="height: 30px; text-align: left">
                    <asp:RadioButtonList ID="PrintStyle" runat="server" RepeatDirection="Horizontal">
                        <asp:ListItem Value="1" Selected="True">Table</asp:ListItem>
                        <asp:ListItem Value="2">纯LI输出(推荐)</asp:ListItem>

                    </asp:RadioButtonList></td>
             <td class="righttd" >
                <strong>是否AJAX输出：</strong><asp:CheckBox runat="server" ID="ChkAjax" Text="AJAX输出" /></td>
        </tr>
            <tr>
                <td class="lefttd" style="height: 30px; text-align: right">
                    <strong>栏目列数：</strong></td>
                <td runat="server" class="righttd" colspan="2" style="height: 30px; text-align: left">
                    <asp:TextBox ID="Col" CssClass="textbox" runat="server" style="text-align:center" Width="41px">2</asp:TextBox>
                    <strong>查询条数：</strong><asp:TextBox  CssClass="textbox" style="text-align:center" ID="Num" runat="server" Width="41px">10</asp:TextBox><strong>条&nbsp; <span style="background-color: #f0f9fe">
                            排序方式</span>：</strong><asp:DropDownList ID="Order" runat="server">
                    <asp:ListItem Value="s.specialid desc">专题ID降序</asp:ListItem>
                    <asp:ListItem Value="s.specialid asc">专题ID升序</asp:ListItem>
                    <asp:ListItem Value="s.adddate desc">更新时间降序</asp:ListItem>
                    <asp:ListItem Value="s.adddate ast">更新时间升序</asp:ListItem>
                      </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td class="lefttd" style="height: 23px; text-align: right">
                    <strong>参与循环的分类：</strong></td>
                <td runat="server" class="righttd" colspan="2" style="height: 23px; text-align: left">
                    <asp:ListBox ID="LxtClassID" runat="server" Height="45px" SelectionMode="Multiple">
                        <asp:ListItem Value="0">---不指定分类---</asp:ListItem>
                    </asp:ListBox>
                    &nbsp; &nbsp; <font color=green>栏目循环体模板:<%=KSCMS.GetInstallDir() %><%=MyCache.GetCacheConfig(13) %>/config/label_loopspeciallist.config</font></td>
            </tr>
            <tr>
                <td class="lefttd" style="height: 30px; text-align: right">
                    <strong>显示样式：</strong></td>
                <td runat="server" class="righttd"  style="height: 30px; text-align: left; width: 251px;">
                   
                    <asp:DropDownList ID="ShowStyle" runat="server" style="width:180px">
                    <asp:ListItem Value="0">标题式</asp:ListItem>
                    <asp:ListItem Value="1">仅显示图片</asp:ListItem>
                    <asp:ListItem Value="2">上图片＋下名称</asp:ListItem>
                    <asp:ListItem Value="3">左图片+右介绍</asp:ListItem>
                    <asp:ListItem Value="4">左图片＋右（上名称＋下简介）</asp:ListItem>
                    </asp:DropDownList>
                    </td>
                 <td class="righttd">
                    <asp:CheckBoxList ID="Attribute" runat="server" RepeatDirection="Horizontal">
                        <asp:ListItem Value="1">仅显示推荐专题</asp:ListItem>
                        <asp:ListItem Value="2">仅显示图片专题</asp:ListItem>
                    </asp:CheckBoxList></td>
            </tr>
            <tr>
                <td class="lefttd" style="height: 30px; text-align: right">
                    <strong>标题字数：</strong></td>
                <td runat="server" class="righttd" style=" height: 30px; text-align: left; width: 251px;">
                    <asp:TextBox  CssClass="textbox" ID="TitleLen" runat="server" Width="69px">30</asp:TextBox>
                    <font color=red>1个汉字算2个字符</font></td>
                <td runat="server" class="righttd" style="height: 30px; text-align: left" id="Td1">
                    <strong>简介字数：</strong><asp:TextBox  CssClass="textbox" ID="IntroLen" runat="server" Width="41px">50</asp:TextBox>
                    
                    </td>
            </tr>
            <tr>
                <td class="lefttd" style="height: 30px; text-align: right">
                    <strong>标题样式：</strong></td>
                <td runat="server" class="righttd" style=" height: 30px; text-align: left; width: 251px;" id="Td2">
                    <asp:TextBox ID="TitleCss"  CssClass="textbox" runat="server" Width="66px"></asp:TextBox>
                    <span style="color: red">填写在CSS里定义的样式名称</span></td>
                <td runat="server" class="righttd" style="height: 30px; text-align: left" id="Td3">
                    <strong>信息列数：</strong><asp:TextBox  CssClass="textbox" ID="InfoCol" runat="server" Width="41px">1</asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="lefttd" style="height: 30px; text-align: right">
                    <strong>图片设置：</strong></td>
                    <td runat="server" class="righttd" style="height: 30px; text-align: left; width: 251px;" id="Td4">
                    宽度：<asp:TextBox  CssClass="textbox" ID="PicWidth" runat="server" Width="30px" Text="130"></asp:TextBox>px
                     高度：<asp:TextBox  CssClass="textbox" ID="PicHeight" runat="server" Width="30px" Text="90"></asp:TextBox>px
                    </td>
                    <td class="righttd">
                        <strong>链接目标：</strong>
                    <asp:DropDownList ID="LinkTarget" runat="server">
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem>_blank</asp:ListItem>
                    <asp:ListItem>_parent</asp:ListItem>
                    <asp:ListItem>_top</asp:ListItem>
                    <asp:ListItem>_self</asp:ListItem>
                    </asp:DropDownList></td>
                    <td></td>
            </tr>
            <tr>
                <td class="lefttd" style="height: 30px; text-align: right">
                    <strong>导航类型：</strong></td>
                <td runat="server" class="righttd" colspan="2" style="height: 30px; text-align: left" id="Td5">
                    <asp:DropDownList ID="NavType" runat="server">
                    <asp:ListItem Value="0">文字导航</asp:ListItem>
                    <asp:ListItem Value="1">图片导航</asp:ListItem>
                </asp:DropDownList>
                    <asp:TextBox ID="NavStr"  CssClass="textbox" runat="server" Width="145px">&#183;</asp:TextBox>&nbsp;
                    图片导航，请输入图片地址</td>
            </tr>
            <tr>
                <td class="lefttd" style="height: 30px; text-align: right">
                    <strong>日期格式：</strong><br />
                    <font color="blue">说明：</font>
                    </td>
                <td runat="server" class="righttd" colspan="2" style="height: 30px; text-align: left" id="Td6">
                    <asp:TextBox  CssClass="textbox" ID="DateStyle" runat="server" Width="307px">YY-MM-DD</asp:TextBox>&nbsp;<br />
                    <span style="color: blue">Y4或YY表示四位的年份，Y2两位年份，MM表示月份，DD表示日，hh小时 mm分钟 ss钞</span></td>
            </tr>
      </table>
     <div style="text-align:center">
         <asp:TextBox ID="LabelContent" runat="server"></asp:TextBox>
     <asp:Button ID="Button1" CssClass="button" runat="server" Text="确定创建(O)" AccessKey="O" OnClick="Button1_Click"/>
           <input type="button" class="button" onclick="javascript:parent.box.close();" accesskey="C" value="关闭取消(C)" /><br />
     </div>

</asp:Content>

