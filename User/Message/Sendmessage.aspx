<%@ Page Language="C#" MasterPageFile="~/User/User.master" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.User_Offer_sentMessage" Title="Untitled Page" Codebehind="Sendmessage.aspx.cs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="KSContent" Runat="Server">
 <div class="tabs">	
			<ul>
				<li><a href="receivedmessage.aspx">���յ�����Ϣ</a></li>
				<li><a href="sentmessage.aspx">�ҷ�������Ϣ</a></li>
				<li><a href="Garbagemessage.aspx">������Ϣ</a></li>
				<li class="puton"><a href="Sendmessage.aspx">���Ͷ���Ϣ</a></li>
			</ul>
</div>  
    <% Kesion.APPCode.EditorAPI.EchoHead();%>


    <script type="text/javascript">
        CheckForm = function() {
            if ($("#<%=this.TxtToUserName.ClientID %>").val() == "") {
                $.dialog.alert('�ռ��˱�������!', function() {
                    $("#<%=this.TxtToUserName.ClientID %>").focus();
                });
                return false;
            }
            if ($("#<%=this.TxtSubject.ClientID %>").val() == "") {
                $.dialog.alert('��Ϣ�����������!', function() {
                    $("#<%=this.TxtSubject.ClientID %>").focus();
                });
                return false;
            }
            if (editor.hasContents() == false) {
                $.dialog.alert('��Ϣ���ݱ������룡', function() {
                   editor.focus();
                });
                return false;
            }
            return true;
        }
    </script>


    <table cellspacing=0 cellpadding=4 width="98%" class="border" align="center" border=0>
       <tr class="title">
            <td colspan="2">���Ͷ���Ϣ</td>
       </tr>
        <tr class="tdbg">
	        <td class="lefttd">�ռ��ˣ�</td>
	        <td>
                <asp:TextBox CssClass="textbox" ID="TxtToUserName" Width="200px" runat="server"></asp:TextBox><font color=red>*</font> 
                <span class="tips">����ռ�������Ӣ�Ķ��Ÿ�����</span><asp:RequiredFieldValidator ControlToValidate="TxtToUserName" ID="RequiredFieldValidator1" runat="server" ErrorMessage="�ռ��˱�������"></asp:RequiredFieldValidator>
                </td>
            
        </tr>
        <tr class="tdbg">
	        <td class="lefttd">�ꡡ�⣺</td>
	        <td>
                <asp:TextBox ID="TxtSubject" CssClass="textbox" Width="300px" runat="server"></asp:TextBox><font color=red>*</font> 
                <asp:RequiredFieldValidator ControlToValidate="TxtSubject" ID="RequiredFieldValidator2" runat="server" ErrorMessage="�����������"></asp:RequiredFieldValidator>
                </td>
        </tr>
        <tr class="tdbg">
	        <td class="lefttd">�ڡ��ݣ�</td>
	        <td>

            <textarea name="MsgContent" rows="3" cols="3" id="MsgContent" style="width:96%;height:150px"></textarea>
            <%
                Kesion.APPCode.EditorAPI.EchoEditor("editor", "MsgContent", "Basic", 0, false, true, true, false);    
             %>

            </td>
        </tr>
        <tr class="tdbg">
         <td class="lefttd"></td>
         <td height="50">  <asp:Button ID="BtnSend" CssClass="button" runat="server" Text="�� ��" OnClick="button_Click"  /></td>
        </tr>
        </table>   
    
<br /><br />    <div>

    <strong>����С��ʿ</strong><br />
    �� ������Ϣ,���ϸ����ط��ɷ��档���ڲ���Ҫ�󷢲����û������ǽ������˻�����<br />
�� ������Ӣ��״̬�µĶ��Ž��û�������ʵ��Ⱥ�������<%=MaxSendNum%>���û�<br />
�� �������<%=MaxTitleLen%>���ַ����������<%=MaxMsgLen %>���ַ�
 </div>


</asp:Content>

