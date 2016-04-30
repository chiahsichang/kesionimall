<%@ Page Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.Admin_Label_List" Title="ѭ����Ŀ�б��ǩ" Codebehind="KS.Label.List.aspx.cs" %>
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
                <strong>��ǩ�����ʽ��</strong></td>
            <td runat="server" class="righttd"  style="height: 30px; text-align: left">
                    <asp:RadioButtonList ID="PrintStyle" runat="server" RepeatDirection="Horizontal">
                        <asp:ListItem Value="1" Selected="True">Table</asp:ListItem>
                        <asp:ListItem Value="2">��LI���(�Ƽ�)</asp:ListItem>
                    </asp:RadioButtonList></td>
            <td class="righttd">
                <strong>�Ƿ�AJAX�����</strong><asp:CheckBox runat="server" ID="ChkAjax" Text="AJAX���" /></td>
        </tr>
            <tr>
                <td class="lefttd" style="height: 30px; text-align: right">
                    <strong>����ģ�ͣ�</strong></td>
                <td runat="server" class="righttd" colspan="2" style="height: 30px; text-align: left">

                      <asp:DropDownList ID="ChannelID" runat="server">
                       <asp:ListItem Value="0">---��ָ��ģ��---</asp:ListItem>
                      </asp:DropDownList>
                    &nbsp; <strong>��ѯ������</strong><asp:TextBox CssClass="textbox" style="text-align:center" ID="Num" runat="server" Width="41px">10</asp:TextBox>��&nbsp;
                    <strong>����ʽ��</strong><asp:DropDownList ID="Order" runat="server">
                    <asp:ListItem Value="i.infoid desc">��ϢID����</asp:ListItem>
                    <asp:ListItem Value="i.infoid asc">��ϢID����</asp:ListItem>
                    <asp:ListItem Value="i.adddate desc">����ʱ�併��</asp:ListItem>
                    <asp:ListItem Value="i.adddate ast">����ʱ������</asp:ListItem>
                    <asp:ListItem Value="i.commentnum desc">������������</asp:ListItem>
                    <asp:ListItem Value="i.commentnum asc">������������</asp:ListItem>
                    <asp:ListItem Value="i.hits desc">�����������</asp:ListItem>
                    <asp:ListItem Value="i.hits asc">�����������</asp:ListItem>
                    <asp:ListItem Value="i.hitsbymonth desc">�����������</asp:ListItem>
                    <asp:ListItem Value="i.hitsbymonth asc">�����������</asp:ListItem>
                    <asp:ListItem Value="i.hitsbyweek desc">�����������</asp:ListItem>
                    <asp:ListItem Value="i.hitsbyweek asc">�����������</asp:ListItem>
                    <asp:ListItem Value="i.hitsbyday desc">�����������</asp:ListItem>
                    <asp:ListItem Value="i.hitsbyday asc">�����������</asp:ListItem>
                    <asp:ListItem Value="newid()">�����ʾ</asp:ListItem>
                     </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td class="lefttd" style="height: 30px; text-align: right">
                    <strong>������Ŀ��</strong></td>
                <td runat="server" class="righttd" colspan="2" style="height: 30px; text-align: left">
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
                    <strong>���Կ��ƣ�</strong></td>
                <td runat="server" class="righttd" colspan="2" style="height: 30px; text-align: left">
                    <asp:CheckBoxList ID="Attribute" runat="server" RepeatDirection="Horizontal">
                        <asp:ListItem Value="1">�Ƽ�</asp:ListItem>
                        <asp:ListItem Value="2">�ȵ�</asp:ListItem>
                        <asp:ListItem Value="3">����</asp:ListItem>
                        <asp:ListItem Value="4">�õ�</asp:ListItem>
                        <asp:ListItem Value="5">ͷ��</asp:ListItem>
                        <asp:ListItem Value="6">����</asp:ListItem>
                    </asp:CheckBoxList></td>
            </tr>
            <tr>
                <td class="lefttd" style="height: 30px; text-align: right">
                    <strong>����������</strong></td>
                <td runat="server" class="righttd" style=" height: 30px; text-align: left; width: 175px;">
                    <asp:TextBox CssClass="textbox" style="text-align:center" ID="TitleLen" runat="server" Width="40px">30</asp:TextBox>
                    <font color=red>1��������2���ַ�</font></td>
                <td runat="server" class="righttd" style="height: 30px; text-align: left">
                    <strong>����������<asp:TextBox CssClass="textbox" style="text-align:center" ID="Col" runat="server" Width="41px">1</asp:TextBox></strong>��
                    
                    </td>
            </tr>
            <tr>
                <td class="lefttd" style="height: 30px; text-align: right">
                    <strong>������ʽ��</strong></td>
                <td runat="server" class="righttd" style=" height: 30px; text-align: left; ">
                    <asp:TextBox  CssClass="textbox" ID="TitleCss" runat="server" Width="40px"></asp:TextBox>
                    <span style="color: red">��д��CSS�ﶨ�����ʽ����</span></td>
                <td runat="server" class="righttd" style="height: 30px; text-align: left">
                    <strong>����Ŀ�꣺</strong>
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
                    <strong>������ʾ��</strong></td>
                <td runat="server" class="righttd" colspan="2" style="height: 30px; text-align: left">
                    <asp:CheckBoxList ID="ShowFJ" runat="server" RepeatDirection="Horizontal">
                        <asp:ListItem Value="1">��ʾ��Ŀ����</asp:ListItem>
                        <asp:ListItem Value="2">��ʾ���±�־</asp:ListItem>
                        <asp:ListItem Value="3">��ʾ���ű�־</asp:ListItem>
                    </asp:CheckBoxList></td>
            </tr>
            <tr>
                <td class="lefttd" style="height: 30px; text-align: right">
                    <strong>�������ͣ�</strong></td>
                <td runat="server" class="righttd" colspan="2" style="height: 30px; text-align: left">
                    <asp:DropDownList ID="NavType" runat="server">
                    <asp:ListItem Value="0">���ֵ���</asp:ListItem>
                    <asp:ListItem Value="1">ͼƬ����</asp:ListItem>
                </asp:DropDownList>
                    <asp:TextBox CssClass="textbox" ID="NavStr" runat="server" Width="145px">&#183;</asp:TextBox>&nbsp;
                    ͼƬ������������ͼƬ��ַ</td>
            </tr>
            <tr>
                <td class="lefttd" style="height: 30px; text-align: right">
                    <strong>���ڸ�ʽ��</strong><br />
                    <font color="blue">˵����</font>
                    </td>
                <td runat="server" class="righttd" colspan="2" style="height: 30px; text-align: left">
                    <asp:TextBox CssClass="textbox" ID="DateStyle" runat="server" Width="307px">YY-MM-DD</asp:TextBox>&nbsp;<br />
                    <span style="color: blue">Y4��YY��ʾ��λ����ݣ�Y2��λ��ݣ�MM��ʾ�·ݣ�DD��ʾ�գ�hhСʱ mm���� ss��</span></td>
            </tr>
      </table>
     <div style="text-align:center">
         <asp:TextBox ID="LabelContent" runat="server"></asp:TextBox>
     <asp:Button ID="Button1" CssClass="button" runat="server" OnClientClick="return(checkform())" Text="ȷ������(O)" AccessKey="O" OnClick="Button1_Click"/>
           <input type="button" class="button" onclick="javascript:parent.box.close();" accesskey="C" value="�ر�ȡ��(C)" /><br />
     </div>


</asp:Content>

