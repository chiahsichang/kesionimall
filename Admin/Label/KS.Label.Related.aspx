<%@ Page Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.Admin_Label_FunLabel_Related" Title="Untitled Page" Codebehind="KS.Label.Related.aspx.cs" %>
<asp:Content ID="Content1" ContentPlaceHolderID="KSContent" Runat="Server">
<script type="text/javascript">
  function checkform()
  {
   if (jQuery("#<%=this.LabelName.ClientID%>").val()=="")
   {
   KesionJS.Alert('请输入标签名称!',"jQuery('#<%=this.LabelName.ClientID%>').focus();");
   return false;
   }


   var printstyle = jQuery("#<%=this.PrintStyle.ClientID %> :radio[checked]").val();

   var ajax = 0;
   if (jQuery("#<%=this.ChkAjax.ClientID %>")[0].checked) ajax = 1;
   
   var showclassname=0;
   if (jQuery("#<%=this.ShowFJ.ClientID %>_0")[0].checked)
    showclassname=1;
   var shownewpic=0;
   if (jQuery("#<%=this.ShowFJ.ClientID %>_1")[0].checked)
    shownewpic=1;
   var showhotpic=0;
   if (jQuery("#<%=this.ShowFJ.ClientID %>_2")[0].checked)
    showhotpic=1;
   var channelid = jQuery('#<%=this.DrpChannelID.ClientID %>').val();
  

   var str = '{KS:Label Type="Related"'
          + ' ChannelID="'+channelid+'"'
          + ' PrintStyle="' + printstyle + '"'
          + ' Ajax="'+ajax+'"'
          + ' Num="'+jQuery('#<%=this.Num.ClientID %>').val()+'"'
          + ' Condition="'+jQuery('#<%=this.Condition.ClientID %>').val()+'"'
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
            <td runat="server"  class="righttd" style="height: 30px; text-align: left">
                    <asp:RadioButtonList ID="PrintStyle" runat="server" RepeatDirection="Horizontal">
                        <asp:ListItem Value="1" Selected="True">Table</asp:ListItem>
                        <asp:ListItem Value="2">纯LI输出(推荐)</asp:ListItem>
                    </asp:RadioButtonList></td>
             <td class="righttd">
               <span style="display:none"><strong>是否AJAX输出：</strong><asp:CheckBox runat="server" ID="ChkAjax" Text="AJAX输出" /></span>
                <strong>关联模型：</strong>
                <asp:DropDownList ID="DrpChannelID" runat="server">
                <asp:ListItem Value="0">---不指定模型---</asp:ListItem>
                </asp:DropDownList>
                </td>
        </tr>
            <tr>
                <td class="lefttd" style="height: 30px; text-align: right">
                    <strong>查询条数：</strong></td>
                <td runat="server" class="righttd"  style="height: 30px; text-align: left; width: 251px;">
                    <asp:TextBox  CssClass="textbox" style="text-align:center" ID="Num" runat="server" Width="65px">10</asp:TextBox>条&nbsp;&nbsp;
                   </td>
                <td class="righttd">
                    <strong>关联条件：</strong><asp:DropDownList ID="Condition" runat="server">
                        <asp:ListItem Value="keytags">与关键字Tags关联</asp:ListItem>
                        <asp:ListItem Value="author">与作者关联</asp:ListItem>
                        <asp:ListItem Value="copyfrom">与来源关联</asp:ListItem>
                    </asp:DropDownList></td>
            </tr>
            <tr>
                <td class="lefttd" style="height: 30px; text-align: right">
                    <strong>标题字数：</strong></td>
                <td runat="server" class="righttd" style=" height: 30px; text-align: left; width: 251px;">
                    <asp:TextBox  CssClass="textbox" style="text-align:center" ID="TitleLen" runat="server" Width="65px">30</asp:TextBox>
                    <font color=red>1个汉字算2个字符</font></td>
                <td runat="server" class="righttd" style="height: 30px; text-align: left">
                    <strong>排列列数：<asp:TextBox  CssClass="textbox" ID="Col" runat="server" Width="41px">1</asp:TextBox></strong>
                    
                    </td>
            </tr>
            <tr>
                <td class="lefttd" style="height: 30px; text-align: right">
                    <strong>标题样式：</strong></td>
                <td runat="server" class="righttd" style=" height: 30px; text-align: left; width: 251px;">
                    <asp:TextBox  CssClass="textbox" ID="TitleCss" runat="server" Width="66px"></asp:TextBox>
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
                    <asp:TextBox  CssClass="textbox" ID="NavStr" runat="server" Width="145px">&#183;</asp:TextBox>&nbsp;
                    图片导航，请输入图片地址</td>
            </tr>
            <tr>
                <td class="lefttd" style="height: 30px; text-align: right">
                    <strong>日期格式：</strong>
                    <br />
                    <font color=blue>说明：</font>
                    </td>
                <td runat="server" class="righttd" colspan="2" style="height: 30px; text-align: left">
                    <asp:TextBox  CssClass="textbox" ID="DateStyle" runat="server" Width="307px">YY-MM-DD</asp:TextBox>&nbsp;<br />
                    <span style="color: blue">Y4或YY表示四位的年份，Y2两位年份，MM表示月份，DD表示日，hh小时 mm分钟 ss钞</span></td>
            </tr>
      </table>
     <div style="text-align:center">
         <asp:TextBox ID="LabelContent" runat="server"></asp:TextBox>
     <asp:Button ID="Button1" CssClass="button" runat="server" Text="确定创建(O)" AccessKey="O" OnClick="Button1_Click"/>
           <input type="button" class="button" onclick="javascript:parent.box.close();" accesskey="C" value="关闭取消(C)" /><br />
     </div>
<br />
         <script type="text/javascript">
             showtips('<span  class="state"><strong>说明：</strong><br /></span>本标签只能在内容页调用，可以根据标签设置的关联条件列出相关的信息<br />');
		 </script>
</asp:Content>

