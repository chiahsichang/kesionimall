<%@ Page Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.Admin_Label_FunLabel_Related" Title="Untitled Page" Codebehind="KS.Label.Related.aspx.cs" %>
<asp:Content ID="Content1" ContentPlaceHolderID="KSContent" Runat="Server">
<script type="text/javascript">
  function checkform()
  {
   if (jQuery("#<%=this.LabelName.ClientID%>").val()=="")
   {
   KesionJS.Alert('�������ǩ����!',"jQuery('#<%=this.LabelName.ClientID%>').focus();");
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
            <td runat="server"  class="righttd" style="height: 30px; text-align: left">
                    <asp:RadioButtonList ID="PrintStyle" runat="server" RepeatDirection="Horizontal">
                        <asp:ListItem Value="1" Selected="True">Table</asp:ListItem>
                        <asp:ListItem Value="2">��LI���(�Ƽ�)</asp:ListItem>
                    </asp:RadioButtonList></td>
             <td class="righttd">
               <span style="display:none"><strong>�Ƿ�AJAX�����</strong><asp:CheckBox runat="server" ID="ChkAjax" Text="AJAX���" /></span>
                <strong>����ģ�ͣ�</strong>
                <asp:DropDownList ID="DrpChannelID" runat="server">
                <asp:ListItem Value="0">---��ָ��ģ��---</asp:ListItem>
                </asp:DropDownList>
                </td>
        </tr>
            <tr>
                <td class="lefttd" style="height: 30px; text-align: right">
                    <strong>��ѯ������</strong></td>
                <td runat="server" class="righttd"  style="height: 30px; text-align: left; width: 251px;">
                    <asp:TextBox  CssClass="textbox" style="text-align:center" ID="Num" runat="server" Width="65px">10</asp:TextBox>��&nbsp;&nbsp;
                   </td>
                <td class="righttd">
                    <strong>����������</strong><asp:DropDownList ID="Condition" runat="server">
                        <asp:ListItem Value="keytags">��ؼ���Tags����</asp:ListItem>
                        <asp:ListItem Value="author">�����߹���</asp:ListItem>
                        <asp:ListItem Value="copyfrom">����Դ����</asp:ListItem>
                    </asp:DropDownList></td>
            </tr>
            <tr>
                <td class="lefttd" style="height: 30px; text-align: right">
                    <strong>����������</strong></td>
                <td runat="server" class="righttd" style=" height: 30px; text-align: left; width: 251px;">
                    <asp:TextBox  CssClass="textbox" style="text-align:center" ID="TitleLen" runat="server" Width="65px">30</asp:TextBox>
                    <font color=red>1��������2���ַ�</font></td>
                <td runat="server" class="righttd" style="height: 30px; text-align: left">
                    <strong>����������<asp:TextBox  CssClass="textbox" ID="Col" runat="server" Width="41px">1</asp:TextBox></strong>
                    
                    </td>
            </tr>
            <tr>
                <td class="lefttd" style="height: 30px; text-align: right">
                    <strong>������ʽ��</strong></td>
                <td runat="server" class="righttd" style=" height: 30px; text-align: left; width: 251px;">
                    <asp:TextBox  CssClass="textbox" ID="TitleCss" runat="server" Width="66px"></asp:TextBox>
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
                    <asp:TextBox  CssClass="textbox" ID="NavStr" runat="server" Width="145px">&#183;</asp:TextBox>&nbsp;
                    ͼƬ������������ͼƬ��ַ</td>
            </tr>
            <tr>
                <td class="lefttd" style="height: 30px; text-align: right">
                    <strong>���ڸ�ʽ��</strong>
                    <br />
                    <font color=blue>˵����</font>
                    </td>
                <td runat="server" class="righttd" colspan="2" style="height: 30px; text-align: left">
                    <asp:TextBox  CssClass="textbox" ID="DateStyle" runat="server" Width="307px">YY-MM-DD</asp:TextBox>&nbsp;<br />
                    <span style="color: blue">Y4��YY��ʾ��λ����ݣ�Y2��λ��ݣ�MM��ʾ�·ݣ�DD��ʾ�գ�hhСʱ mm���� ss��</span></td>
            </tr>
      </table>
     <div style="text-align:center">
         <asp:TextBox ID="LabelContent" runat="server"></asp:TextBox>
     <asp:Button ID="Button1" CssClass="button" runat="server" Text="ȷ������(O)" AccessKey="O" OnClick="Button1_Click"/>
           <input type="button" class="button" onclick="javascript:parent.box.close();" accesskey="C" value="�ر�ȡ��(C)" /><br />
     </div>
<br />
         <script type="text/javascript">
             showtips('<span  class="state"><strong>˵����</strong><br /></span>����ǩֻ��������ҳ���ã����Ը��ݱ�ǩ���õĹ��������г���ص���Ϣ<br />');
		 </script>
</asp:Content>

