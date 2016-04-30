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
   KesionJS.Alert('�������ǩ����!',"jQuery('#<%=this.LabelName.ClientID%>').focus();");
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
                <strong>��ǩ���ƣ�</strong></td>
            <td runat="server" class="righttd" style="height: 30px; text-align: left">
                <span style="color: #000066">{KS_</span><asp:TextBox CssClass="noborder" ID="LabelName" runat="server" Width="126px"></asp:TextBox><span style="color: #000066"> } * ���ø�ʽ��{KS_��ǩ����}</span><asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="LabelName"
                    Display="Dynamic" ErrorMessage="��ǩ���Ʊ�������"></asp:RequiredFieldValidator></td>
        </tr>
    <tr>
     <td class="lefttd" style="text-align: right; height: 30px;">
         <strong>��ǩĿ¼��</strong></td>
     <td class="righttd" style="text-align: left; height: 30px;"><span  id="classidarea" runat="server"></span><font color=red> ��ѡ���ǩ����Ŀ¼���Ա��պ�����ǩ</font></td>
    </tr>
    </table>
        <table style="margin:6px" width="98%" align="center" cellpadding="1" cellspacing="1" class="CTable">
        <tr>
            <td class="lefttd" style="height: 30px; text-align: right">
                <strong>��������</strong></td>
            <td runat="server" class="righttd" style="height: 30px; text-align: left">
                    <asp:RadioButtonList ID="Direction" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow">
                        <asp:ListItem Value="left" Selected="True">�������</asp:ListItem>
                        <asp:ListItem Value="right">���ҹ���</asp:ListItem>
                        <asp:ListItem Value="up">���Ϲ���</asp:ListItem>
                        <asp:ListItem Value="down">���¹���</asp:ListItem>
                    </asp:RadioButtonList></td>
        </tr>
            <tr>
                <td class="lefttd" style="height: 30px; text-align: right">
                    <strong>����ģ�ͣ�</strong></td>
                <td runat="server" class="righttd" style="height: 30px; text-align: left">

                      <asp:DropDownList ID="ChannelID" runat="server">
                      <asp:ListItem Value="0">--��ָ��ģ��--</asp:ListItem>
                      </asp:DropDownList>
                    &nbsp; <strong>��ѯ������</strong><asp:TextBox  CssClass="textbox" style="text-align:center" ID="Num" runat="server" Width="41px">10</asp:TextBox>��&nbsp;
                </td>
            </tr>
            <tr>
                <td class="lefttd" style="height: 30px; text-align: right">
                    <strong>������Ŀ��</strong></td>
                <td runat="server" class="righttd" style="height: 30px; text-align: left">
                 <table border="0" cellpadding="0" cellspacing="0">
                     <tr>
                      <td><select name="classid1" id="classid1" multiple="multiple" size="3" style="width: 120px">
                      <option value="0">-��ָ����Ŀ-</option><option value="-1" style="color:red">��ǰ��Ŀͨ��</option>
                      </select> 
                     </td>
                      <td>
                      <strong>&nbsp; ����ר�⣺</strong>
                      </td>
                      <td>
                       <select name="specialid1" id="specialid1" style="width: 120px">
                       <option value=''>-��ָ��ר��-</option><option value="-1" style="color:red">��ǰר��ͨ��</option>
                       <%=BaseFun.GetSpecialOption("0") %>
                       </select>
                      </td>
                      <td><asp:CheckBox ID="ChildClass" runat="server" Checked="true" Text="�����г�����Ŀ��Ϣ" />
</td>
                     </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td class="lefttd" style="height: 30px; text-align: right">
                    <strong>����ʽ��</strong></td>
                <td runat="server" class="righttd" style="height: 30px; text-align: left">
                    <asp:DropDownList ID="Order" runat="server">
                    <asp:ListItem Value="I.infoid desc">��ϢID����</asp:ListItem>
                    <asp:ListItem Value="I.infoid asc">��ϢID����</asp:ListItem>
                    <asp:ListItem Value="I.adddate desc">����ʱ�併��</asp:ListItem>
                    <asp:ListItem Value="I.adddate ast">����ʱ������</asp:ListItem>
                    <asp:ListItem Value="i.hits desc">�����������</asp:ListItem>
                    <asp:ListItem Value="i.hits asc">�����������</asp:ListItem>
                    <asp:ListItem Value="i.hitsbymonth desc">�����������</asp:ListItem>
                    <asp:ListItem Value="i.hitsbymonth asc">�����������</asp:ListItem>
                    <asp:ListItem Value="i.hitsbyweek desc">�����������</asp:ListItem>
                    <asp:ListItem Value="i.hitsbyweek asc">�����������</asp:ListItem>
                    <asp:ListItem Value="i.hitsbyday desc">�����������</asp:ListItem>
                    <asp:ListItem Value="i.hitsbyday asc">�����������</asp:ListItem>
                    <asp:ListItem Value="newid()">�����ʾ</asp:ListItem>
                      </asp:DropDownList>&nbsp; <span style="color: #ff0033">�������������ӵ���ʾ����ǰ�棬��ѡ���Զ�ID����</span></td>
            </tr>
            <tr>
                <td class="lefttd" style="height: 30px; text-align: right">
                    <strong>��������</strong></td>
                <td runat="server" class="righttd" style="height: 30px; text-align: left">
                    �������<asp:TextBox  CssClass="textbox" ID="Width" runat="server" Width="69px">450</asp:TextBox>px&nbsp;
                    �����߶�<asp:TextBox  CssClass="textbox" ID="Height" runat="server" Width="69px">120</asp:TextBox>px</td>
            </tr>
            <tr>
                <td class="lefttd" style="height: 30px; text-align: right">
                    <strong>ͼƬ��С��</strong></td>
                <td runat="server" class="righttd" style="height: 30px; text-align: left">
                    ͼƬ���<asp:TextBox  CssClass="textbox" ID="PicWidth" runat="server" Width="69px">130</asp:TextBox>px&nbsp;
                    ͼƬ�߶�<asp:TextBox  CssClass="textbox" ID="PicHeight" runat="server" Width="69px">90</asp:TextBox>px</td>
            </tr>
            <tr>
                <td class="lefttd" style="height: 30px; text-align: right">
                    <strong>��ʾ���⣺</strong></td>
                <td id="Td4" runat="server" class="righttd" style="height: 30px; text-align: left">
                    <asp:RadioButtonList ID="ShowTitle" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow">
                        <asp:ListItem Selected="True" Value="1">��ʾ</asp:ListItem>
                        <asp:ListItem Value="0">����ʾ</asp:ListItem>
                    </asp:RadioButtonList>
                    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; ��������<asp:TextBox  CssClass="textbox" style="text-align:center" ID="TitleLen" runat="server" Width="69px">30</asp:TextBox>
                    <font color=red>1��������2���ַ�</font></td>
            </tr>
            <tr>
                <td class="lefttd" style="height: 30px; text-align: right">
                    <strong>��ʽ���ã�</strong></td>
                <td id="Td2" runat="server" class="righttd" style="height: 30px; text-align: left">
                    ͼƬ��ʽ<asp:TextBox  CssClass="textbox" ID="PicCss" runat="server" Width="85px"></asp:TextBox>
                    &nbsp;&nbsp; ������ʽ<asp:TextBox  CssClass="textbox" ID="TitleCss" runat="server" Width="85px"></asp:TextBox></td>
            </tr>
            <tr>
                <td class="lefttd" style="height: 30px; text-align: right">
                    <strong>����Ŀ�꣺</strong></td>
                <td id="Td3" runat="server" class="righttd" style="height: 30px; text-align: left">
                    <asp:DropDownList ID="LinkTarget" runat="server">
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem>_blank</asp:ListItem>
                    <asp:ListItem>_parent</asp:ListItem>
                    <asp:ListItem>_top</asp:ListItem>
                    <asp:ListItem>_self</asp:ListItem>
                    </asp:DropDownList>
                    &nbsp; &nbsp;&nbsp; �����ٶ�<asp:TextBox  CssClass="textbox" ID="Speed" runat="server" Text="30" Width="85px"></asp:TextBox></td>
            </tr>
      </table>
     <div style="text-align:center">
         <asp:TextBox ID="LabelContent" runat="server"></asp:TextBox>
     <asp:Button ID="Button1" CssClass="button" runat="server" Text="ȷ������(O)" AccessKey="O" OnClick="Button1_Click"/>
           <input type="button" class="button" onclick="javascript:parent.box.close();" accesskey="C" value="�ر�ȡ��(C)" /><br />
     </div>

</asp:Content>

