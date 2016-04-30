<%@ Page Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.Admin_Label_FunLabel_Navigation" Title="Untitled Page" Codebehind="KS.Label.Navigation.aspx.cs" %>
<asp:Content ID="Content1" ContentPlaceHolderID="KSContent" Runat="Server">
<script type="text/javascript" language="javascript">
  function checkform()
  {
   if (jQuery("#<%=this.LabelName.ClientID%>").val()=="")
   {
   KesionJS.Alert('请输入标签名称!',"jQuery('#<%=this.LabelName.ClientID%>').focus();");
   return false;
   }
   var str='{KS:Label Type="Navigation"'
          + ' StartNav="'+jQuery("#<%=this.StartNav.ClientID %>").val()+'"'
          + ' NavTag="' + jQuery('#<%=this.NavTag.ClientID %>').val() + '"'
          + ' ShowSiteName="' + (jQuery("#<%=this.ChkShowSiteName.ClientID%>").prop("checked")?1:0)+'"'
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
            <td class="lefttd" style="height: 40px; text-align: right">
                <strong>开始标志：</strong></td>
            <td runat="server" class="righttd" colspan="2" style="height: 30px; text-align: left">
                <asp:TextBox  CssClass="textbox" ID="StartNav" runat="server" Width="138px">您现在位置：</asp:TextBox>
                如：您现在位置，当前位置 等等</td>
        </tr>
            <tr>
                <td class="lefttd" style="height: 40px; text-align: right">
                    <strong>导航分隔符：</strong></td>
                <td id="Td2" runat="server" class="righttd" colspan="2" style="height: 30px; text-align: left">
                    <asp:TextBox ID="NavTag"  CssClass="textbox" runat="server" Width="136px"> &gt;&gt; </asp:TextBox>
                    如 &gt;&gt;&nbsp; -&gt; 等等</td>
            </tr>
            <tr>
                <td class="lefttd" style="height: 40px; text-align: right">
                    <strong>是否显示网站名称：</strong></td>
                <td class="righttd" colspan="2" style="height: 30px; text-align: left">
                  <asp:CheckBox ID="ChkShowSiteName"  runat="server" Text="显示" />
               </td>
            </tr>
      </table>
     <div style="text-align:center">
         <asp:TextBox ID="LabelContent" runat="server"></asp:TextBox>
     <asp:Button ID="Button1" CssClass="button" runat="server" Text="确定创建(O)" AccessKey="O" OnClick="Button1_Click"/>
           <input type="button" class="button" onclick="javascript:parent.box.close();" accesskey="C" value="关闭取消(C)" /><br />
     </div>
      <br /><br />
         <script type="text/javascript">
		 showtips('<span class="state"><strong>说明：</strong><br /></span>本标签全站通用，示例效果：您现在位置：科汛网 >> 新闻中心 >> 正文<br />');
		 </script>

</asp:Content>

