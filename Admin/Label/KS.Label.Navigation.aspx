<%@ Page Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.Admin_Label_FunLabel_Navigation" Title="Untitled Page" Codebehind="KS.Label.Navigation.aspx.cs" %>
<asp:Content ID="Content1" ContentPlaceHolderID="KSContent" Runat="Server">
<script type="text/javascript" language="javascript">
  function checkform()
  {
   if (jQuery("#<%=this.LabelName.ClientID%>").val()=="")
   {
   KesionJS.Alert('�������ǩ����!',"jQuery('#<%=this.LabelName.ClientID%>').focus();");
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
            <td class="lefttd" style="height: 40px; text-align: right">
                <strong>��ʼ��־��</strong></td>
            <td runat="server" class="righttd" colspan="2" style="height: 30px; text-align: left">
                <asp:TextBox  CssClass="textbox" ID="StartNav" runat="server" Width="138px">������λ�ã�</asp:TextBox>
                �磺������λ�ã���ǰλ�� �ȵ�</td>
        </tr>
            <tr>
                <td class="lefttd" style="height: 40px; text-align: right">
                    <strong>�����ָ�����</strong></td>
                <td id="Td2" runat="server" class="righttd" colspan="2" style="height: 30px; text-align: left">
                    <asp:TextBox ID="NavTag"  CssClass="textbox" runat="server" Width="136px"> &gt;&gt; </asp:TextBox>
                    �� &gt;&gt;&nbsp; -&gt; �ȵ�</td>
            </tr>
            <tr>
                <td class="lefttd" style="height: 40px; text-align: right">
                    <strong>�Ƿ���ʾ��վ���ƣ�</strong></td>
                <td class="righttd" colspan="2" style="height: 30px; text-align: left">
                  <asp:CheckBox ID="ChkShowSiteName"  runat="server" Text="��ʾ" />
               </td>
            </tr>
      </table>
     <div style="text-align:center">
         <asp:TextBox ID="LabelContent" runat="server"></asp:TextBox>
     <asp:Button ID="Button1" CssClass="button" runat="server" Text="ȷ������(O)" AccessKey="O" OnClick="Button1_Click"/>
           <input type="button" class="button" onclick="javascript:parent.box.close();" accesskey="C" value="�ر�ȡ��(C)" /><br />
     </div>
      <br /><br />
         <script type="text/javascript">
		 showtips('<span class="state"><strong>˵����</strong><br /></span>����ǩȫվͨ�ã�ʾ��Ч����������λ�ã���Ѵ�� >> �������� >> ����<br />');
		 </script>

</asp:Content>

