<%@ Page Language="C#" ValidateRequest="false" enableEventValidation="false" viewStateEncryptionMode ="Never" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.Admin_AdminEditPass" Title="�޸Ĺ���Ա��¼����" Codebehind="KS.AdminPassEdit.aspx.cs" %>
<asp:Content ID="Content1" ContentPlaceHolderID="KSContent" Runat="Server">
<script language="JavaScript" src="../../ks_Inc/CheckPassWord.js"></script>
<STYLE type=text/css>
li{list-style-type:none}
/*����ǿ��*/
.rank { border:none; background:url(../../sysimg/rank.gif) no-repeat; width:125px; height:22px; vertical-align:middle; cursor:default; }
.r0 { background-position:0 0; }
.r1 { background-position:0 -22px; }
.r2 { background-position:0 -44px; }
.r3 { background-position:0 -66px; }
.r4 { background-position:0 -88px; }
.r5 { background-position:0 -110px; }
.r6 { background-position:0 -132px; }
.r7 { background-position:0 -154px; }

</STYLE>
<script>
    function check() {
        if (jQuery("#<%=this.TxtOldPassWord.ClientID %>").val() == '') {
            KesionJS.Alert("ԭʼ�����������!", "jQuery('#<%=this.TxtOldPassWord.ClientID %>').focus()");
            return false;
        }
        if (jQuery("#<%=this.TxtNewPassWord.ClientID %>").val() == '') {
            KesionJS.Alert("�������������!", "jQuery('#<%=this.TxtNewPassWord.ClientID %>').focus()");
            return false;
        }
        if (jQuery("#<%=this.TxtReNewPassWord.ClientID %>").val() == '') {
            KesionJS.Alert("ȷ���������������!", "jQuery('#<%=this.TxtReNewPassWord.ClientID %>').focus()");
            return false;
        }
        if (jQuery("#<%=this.TxtNewPassWord.ClientID %>").val()!=jQuery("#<%=this.TxtReNewPassWord.ClientID %>").val()) {
            KesionJS.Alert("�������ȷ�����벻һ�£�������!", "jQuery('#<%=this.TxtNewPassWord.ClientID %>').focus()");
            return false;
        }
        return true;
    }
</script>
     <table width="100%" border="0" cellpadding="1" cellspacing="1" class="CTable"> 
          <tr>
              <td align="right" class="lefttd" style="width: 150px">
                  <strong>�� �� ����</strong></td>
              <td class="righttd"><asp:Label ID="LabUserName" runat="server" Text="Label"></asp:Label></td>
          </tr>
         <tr>
             <td align="right" class="lefttd" style="text-align: right; width: 150px;">
                 <strong>ԭʼ���룺</strong></td>
             <td class="righttd"><asp:TextBox CssClass="textbox" ID="TxtOldPassWord" runat="server" TextMode="Password"></asp:TextBox></td>
         </tr>
         <tr>
             <td align="right" class="lefttd" style="text-align: right; width: 150px;">
                 <strong>�� �� �룺</strong></td>
             <td class="righttd"><asp:TextBox CssClass="textbox" ID="TxtNewPassWord" runat="server" TextMode="Password" onBlur="setPasswordLevel(this, document.getElementById('passwordLevel'));"  onKeyUp="setPasswordLevel(this, document.getElementById('passwordLevel'));"></asp:TextBox></td>
         </tr>
         <tr>
		       <td align="right" class="lefttd" style="text-align: right; width: 150px;"><strong>����ǿ�ȣ�</strong></td>
		       <td class="righttd"><input name="Input" disabled="disabled" class="rank r0" id="passwordLevel" /></td>
	          </tr>
           <tr>
              <td align="right" class="lefttd" style="text-align: right; width: 150px;">
                  <strong>ȷ�������룺</strong></td>
              <td class="righttd"><asp:TextBox CssClass="textbox" ID="TxtReNewPassWord" runat="server" TextMode="Password"></asp:TextBox></td>
          </tr>
      </table>
      <div style="text-align:center;margin-top:15px">
      <asp:Button ID="Button1" OnClientClick="return(check());" runat="server" CssClass="button" Text="ȷ���޸�" OnClick="Button1_Click" />
         <asp:Button ID="Button2" runat="server" CssClass="button" Text="�ر�ȡ��" /></div>

</asp:Content>
