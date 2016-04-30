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
   KesionJS.Alert('�������ǩ����',null);
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
                <strong>��ǩ���ƣ�</strong></td>
            <td runat="server" class="righttd" style="height: 30px; text-align: left">
                <span style="color: #000066">{KS_</span><asp:TextBox CssClass="noborder" ID="LabelName" runat="server" Width="126px"></asp:TextBox><span style="color: #000066"> } * ���ø�ʽ��{KS_��ǩ����}</span><asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="LabelName"
                    Display="Dynamic" ErrorMessage="��ǩ���Ʊ�������"></asp:RequiredFieldValidator></td>
        </tr>
    <tr>
     <td class="lefttd" style="text-align: right; height: 30px;">
         <strong>��ǩĿ¼</strong></td>
     <td class="righttd" style="text-align: left; height: 30px;"><span  id="classidarea" runat="server"></span><font color=red> ��ѡ���ǩ����Ŀ¼���Ա��պ�����ǩ</font></td>
    </tr>
    </table>
        <table style="margin:6px" width="98%" align="center" cellpadding="1" cellspacing="1" class="CTable">
        <tr>
            <td class="lefttd" style="height: 30px; text-align: right">
                <strong>��ǩ�����ʽ��</strong></td>
            <td runat="server" class="righttd" style="height: 30px; text-align: left">
                    <asp:RadioButtonList ID="PrintStyle" runat="server" RepeatDirection="Horizontal">
                        <asp:ListItem Value="1" Selected="True">Table</asp:ListItem>
                        <asp:ListItem Value="2">��LI���(�Ƽ�)</asp:ListItem>

                    </asp:RadioButtonList></td>
             <td class="righttd" >
                <strong>�Ƿ�AJAX�����</strong><asp:CheckBox runat="server" ID="ChkAjax" Text="AJAX���" /></td>
        </tr>
            <tr>
                <td class="lefttd" style="height: 30px; text-align: right">
                    <strong>��Ŀ������</strong></td>
                <td runat="server" class="righttd" colspan="2" style="height: 30px; text-align: left">
                    <asp:TextBox ID="Col" CssClass="textbox" runat="server" style="text-align:center" Width="41px">2</asp:TextBox>
                    <strong>��ѯ������</strong><asp:TextBox  CssClass="textbox" style="text-align:center" ID="Num" runat="server" Width="41px">10</asp:TextBox><strong>��&nbsp; <span style="background-color: #f0f9fe">
                            ����ʽ</span>��</strong><asp:DropDownList ID="Order" runat="server">
                    <asp:ListItem Value="s.specialid desc">ר��ID����</asp:ListItem>
                    <asp:ListItem Value="s.specialid asc">ר��ID����</asp:ListItem>
                    <asp:ListItem Value="s.adddate desc">����ʱ�併��</asp:ListItem>
                    <asp:ListItem Value="s.adddate ast">����ʱ������</asp:ListItem>
                      </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td class="lefttd" style="height: 23px; text-align: right">
                    <strong>����ѭ���ķ��ࣺ</strong></td>
                <td runat="server" class="righttd" colspan="2" style="height: 23px; text-align: left">
                    <asp:ListBox ID="LxtClassID" runat="server" Height="45px" SelectionMode="Multiple">
                        <asp:ListItem Value="0">---��ָ������---</asp:ListItem>
                    </asp:ListBox>
                    &nbsp; &nbsp; <font color=green>��Ŀѭ����ģ��:<%=KSCMS.GetInstallDir() %><%=MyCache.GetCacheConfig(13) %>/config/label_loopspeciallist.config</font></td>
            </tr>
            <tr>
                <td class="lefttd" style="height: 30px; text-align: right">
                    <strong>��ʾ��ʽ��</strong></td>
                <td runat="server" class="righttd"  style="height: 30px; text-align: left; width: 251px;">
                   
                    <asp:DropDownList ID="ShowStyle" runat="server" style="width:180px">
                    <asp:ListItem Value="0">����ʽ</asp:ListItem>
                    <asp:ListItem Value="1">����ʾͼƬ</asp:ListItem>
                    <asp:ListItem Value="2">��ͼƬ��������</asp:ListItem>
                    <asp:ListItem Value="3">��ͼƬ+�ҽ���</asp:ListItem>
                    <asp:ListItem Value="4">��ͼƬ���ң������ƣ��¼�飩</asp:ListItem>
                    </asp:DropDownList>
                    </td>
                 <td class="righttd">
                    <asp:CheckBoxList ID="Attribute" runat="server" RepeatDirection="Horizontal">
                        <asp:ListItem Value="1">����ʾ�Ƽ�ר��</asp:ListItem>
                        <asp:ListItem Value="2">����ʾͼƬר��</asp:ListItem>
                    </asp:CheckBoxList></td>
            </tr>
            <tr>
                <td class="lefttd" style="height: 30px; text-align: right">
                    <strong>����������</strong></td>
                <td runat="server" class="righttd" style=" height: 30px; text-align: left; width: 251px;">
                    <asp:TextBox  CssClass="textbox" ID="TitleLen" runat="server" Width="69px">30</asp:TextBox>
                    <font color=red>1��������2���ַ�</font></td>
                <td runat="server" class="righttd" style="height: 30px; text-align: left" id="Td1">
                    <strong>���������</strong><asp:TextBox  CssClass="textbox" ID="IntroLen" runat="server" Width="41px">50</asp:TextBox>
                    
                    </td>
            </tr>
            <tr>
                <td class="lefttd" style="height: 30px; text-align: right">
                    <strong>������ʽ��</strong></td>
                <td runat="server" class="righttd" style=" height: 30px; text-align: left; width: 251px;" id="Td2">
                    <asp:TextBox ID="TitleCss"  CssClass="textbox" runat="server" Width="66px"></asp:TextBox>
                    <span style="color: red">��д��CSS�ﶨ�����ʽ����</span></td>
                <td runat="server" class="righttd" style="height: 30px; text-align: left" id="Td3">
                    <strong>��Ϣ������</strong><asp:TextBox  CssClass="textbox" ID="InfoCol" runat="server" Width="41px">1</asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="lefttd" style="height: 30px; text-align: right">
                    <strong>ͼƬ���ã�</strong></td>
                    <td runat="server" class="righttd" style="height: 30px; text-align: left; width: 251px;" id="Td4">
                    ��ȣ�<asp:TextBox  CssClass="textbox" ID="PicWidth" runat="server" Width="30px" Text="130"></asp:TextBox>px
                     �߶ȣ�<asp:TextBox  CssClass="textbox" ID="PicHeight" runat="server" Width="30px" Text="90"></asp:TextBox>px
                    </td>
                    <td class="righttd">
                        <strong>����Ŀ�꣺</strong>
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
                    <strong>�������ͣ�</strong></td>
                <td runat="server" class="righttd" colspan="2" style="height: 30px; text-align: left" id="Td5">
                    <asp:DropDownList ID="NavType" runat="server">
                    <asp:ListItem Value="0">���ֵ���</asp:ListItem>
                    <asp:ListItem Value="1">ͼƬ����</asp:ListItem>
                </asp:DropDownList>
                    <asp:TextBox ID="NavStr"  CssClass="textbox" runat="server" Width="145px">&#183;</asp:TextBox>&nbsp;
                    ͼƬ������������ͼƬ��ַ</td>
            </tr>
            <tr>
                <td class="lefttd" style="height: 30px; text-align: right">
                    <strong>���ڸ�ʽ��</strong><br />
                    <font color="blue">˵����</font>
                    </td>
                <td runat="server" class="righttd" colspan="2" style="height: 30px; text-align: left" id="Td6">
                    <asp:TextBox  CssClass="textbox" ID="DateStyle" runat="server" Width="307px">YY-MM-DD</asp:TextBox>&nbsp;<br />
                    <span style="color: blue">Y4��YY��ʾ��λ����ݣ�Y2��λ��ݣ�MM��ʾ�·ݣ�DD��ʾ�գ�hhСʱ mm���� ss��</span></td>
            </tr>
      </table>
     <div style="text-align:center">
         <asp:TextBox ID="LabelContent" runat="server"></asp:TextBox>
     <asp:Button ID="Button1" CssClass="button" runat="server" Text="ȷ������(O)" AccessKey="O" OnClick="Button1_Click"/>
           <input type="button" class="button" onclick="javascript:parent.box.close();" accesskey="C" value="�ر�ȡ��(C)" /><br />
     </div>

</asp:Content>

