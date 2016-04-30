<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="PKAddControl.ascx.cs" Inherits="Kesion.NET.WebSite.PKAddControl" %>

<KS:TopNav ID="TopNav1" runat="server" Text="���PK����" />

<asp:HiddenField ID="HidInfoID" runat="server" Value="0" />
<table  style="width:100%;margin:0px auto;" cellpadding="2" cellspacing="1" class="CTable">
         <tr>
             <td align="right" class="lefttd" style="width: 198px;30px">
             <b>PK���⣺</b>
             </td>
             <td class="righttd">
             &nbsp;<asp:TextBox CssClass="textbox" ID="TxtPkTitle" runat="server" Width="200px"></asp:TextBox>
              <span style="color:Red">*</span> <span class="tips">�� 360��ȫ��ʿ Or QQ���Թܼ�</span>
                 <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="TxtPkTitle" runat="server" ErrorMessage="��������ȷ��PK����" Display="dynamic"></asp:RequiredFieldValidator>
             </td>
         </tr>
          <tr>
            <td class="lefttd" height="30" align="right" style="width: 198px"><b>�����۵㣺</b></td>
            <td class="righttd">
                &nbsp;<asp:TextBox ID="TxtPKZFGD" runat="server" Width="358px" Height="70px" TextMode="multiLine"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TxtPKZFGD"
                    ErrorMessage="����д�����۵�!" Display="Dynamic"></asp:RequiredFieldValidator></td>
          </tr>
          <tr>
            <td class="lefttd" height="30" align="right" style="width: 198px"><b>�����۵㣺</b></td>
            <td class="righttd">
                &nbsp;<asp:TextBox ID="TxtPKFFGD" runat="server" Width="358px" Height="70px" TextMode="multiLine"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="TxtPKFFGD"
                    ErrorMessage="����д�����۵�!" Display="Dynamic"></asp:RequiredFieldValidator></td>
          </tr>
         <tr>
             <td align="right" class="lefttd" height="30" style="width: 198px">
                <b>��Ʊ�����</b></td>
             <td class="righttd">
               ����:<asp:TextBox CssClass="textbox" ID="TxtPKZFVotes" runat="server" Width="50px" style="text-align:center"></asp:TextBox>Ʊ ����:<asp:TextBox CssClass="textbox" ID="TxtPKFFVotes" runat="server" Width="50px" style="text-align:center"></asp:TextBox>Ʊ ����:<asp:TextBox CssClass="textbox" ID="TxtPKSFVotes" runat="server" Width="50px" style="text-align:center"></asp:TextBox>Ʊ
             </td>
         </tr>
          <tr>
            <td class="lefttd" height="30" align="right" style="width: 198px"><b>ֻ�����Ա����PK��</b></td>
            <td class="righttd">
            <asp:RadioButtonList ID="RdbPKUserTF" runat="server" RepeatDirection="Horizontal">
                        <asp:ListItem Selected="True" Value="1">��</asp:ListItem>
                        <asp:ListItem Value="0">��</asp:ListItem>
                    </asp:RadioButtonList>
            </td>
          </tr>
          <tr>
            <td class="lefttd" align="right" style="width: 198px; height: 49px;"><b>ÿ���û�ֻ�ܲ���PKһ�Σ�</b></td>
            <td class="righttd" style="height: 49px">
            <asp:RadioButtonList ID="RdbPKOnceTF" runat="server" RepeatDirection="Horizontal">
                        <asp:ListItem Selected="True" Value="1">��</asp:ListItem>
                        <asp:ListItem Value="0">��</asp:ListItem>
                    </asp:RadioButtonList>
            </td>
          </tr>
          <tr>
            <td class="lefttd" height="30" align="right" style="width: 198px"><b>�û�PK�����Ҫ��ˣ�</b></td>
            <td class="righttd">
            <asp:RadioButtonList ID="RdbPKVerifyTF" runat="server" RepeatDirection="Horizontal">
                        <asp:ListItem Selected="True" Value="1">��</asp:ListItem>
                        <asp:ListItem Value="0">��</asp:ListItem>
                    </asp:RadioButtonList>
            </td>
          </tr>
          <tr>
            <td class="lefttd" height="30" align="right" style="width: 198px"><b>״̬��</b></td>
            <td class="righttd">
            <asp:RadioButtonList ID="RdbPKStatus" runat="server" RepeatDirection="Horizontal">
                        <asp:ListItem Selected="True" Value="1">����</asp:ListItem>
                        <asp:ListItem Value="0">����</asp:ListItem>
                    </asp:RadioButtonList>
            </td>
          </tr>
          <tr>
            <td class="lefttd" height="30" align="right" style="width: 198px"><b>�Ƿ�����ʱ�����ƣ�</b></td>
            <td class="righttd">
            <asp:RadioButtonList ID="RdbPKTimeLimit" runat="server" RepeatDirection="Horizontal">
                        <asp:ListItem  Value="1">����ʱ��</asp:ListItem>
                        <asp:ListItem Value="0" Selected="True">������</asp:ListItem>
                    </asp:RadioButtonList>
                 <div id="sTimeLimit" style="display:none">
                 ��ʼʱ��:
                 <asp:TextBox CssClass="textbox" ID="TxtPKTBeginDate" runat="server" Width="200px" onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'});"></asp:TextBox>
                 ��ʽ:YYYY-MM-DD hh:mm:ss
                 <br />
                 ����ʱ��:
                 <asp:TextBox CssClass="textbox" ID="TxtPKTEndDate" runat="server" Width="200px" onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'});"></asp:TextBox>
                 ��ʽ:YYYY-MM-DD hh:mm:ss
                 </div>
            </td>
          </tr>
      </table>
 <script type="text/javascript">
	   function showPKTimeLimit() {
	       var checkrad = jQuery("#<%=this.RdbPKTimeLimit.ClientID %> :radio[checked]").val();
	       if (checkrad == 1) {
	           jQuery("#sTimeLimit").show();
	       } else {
	       jQuery("#sTimeLimit").hide();
	       }
       }	   
</script>
<br />
<KS:Foot ID="Foot1" runat="server" OnSubmit="Foot1_Submit" />
	 