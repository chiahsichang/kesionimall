<%@ Page Language="C#" MasterPageFile="~/User/User.master" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.User_Offer_sentMessage" Title="Untitled Page" Codebehind="Sendmessage.aspx.cs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="KSContent" Runat="Server">
 <div class="tabs">	
			<ul>
				<li><a href="receivedmessage.aspx">我收到的消息</a></li>
				<li><a href="sentmessage.aspx">我发出的消息</a></li>
				<li><a href="Garbagemessage.aspx">垃圾消息</a></li>
				<li class="puton"><a href="Sendmessage.aspx">发送短消息</a></li>
			</ul>
</div>  
    <% Kesion.APPCode.EditorAPI.EchoHead();%>


    <script type="text/javascript">
        CheckForm = function() {
            if ($("#<%=this.TxtToUserName.ClientID %>").val() == "") {
                $.dialog.alert('收件人必须输入!', function() {
                    $("#<%=this.TxtToUserName.ClientID %>").focus();
                });
                return false;
            }
            if ($("#<%=this.TxtSubject.ClientID %>").val() == "") {
                $.dialog.alert('消息标题必须输入!', function() {
                    $("#<%=this.TxtSubject.ClientID %>").focus();
                });
                return false;
            }
            if (editor.hasContents() == false) {
                $.dialog.alert('消息内容必须输入！', function() {
                   editor.focus();
                });
                return false;
            }
            return true;
        }
    </script>


    <table cellspacing=0 cellpadding=4 width="98%" class="border" align="center" border=0>
       <tr class="title">
            <td colspan="2">发送短信息</td>
       </tr>
        <tr class="tdbg">
	        <td class="lefttd">收件人：</td>
	        <td>
                <asp:TextBox CssClass="textbox" ID="TxtToUserName" Width="200px" runat="server"></asp:TextBox><font color=red>*</font> 
                <span class="tips">多个收件人请用英文逗号隔开。</span><asp:RequiredFieldValidator ControlToValidate="TxtToUserName" ID="RequiredFieldValidator1" runat="server" ErrorMessage="收件人必须输入"></asp:RequiredFieldValidator>
                </td>
            
        </tr>
        <tr class="tdbg">
	        <td class="lefttd">标　题：</td>
	        <td>
                <asp:TextBox ID="TxtSubject" CssClass="textbox" Width="300px" runat="server"></asp:TextBox><font color=red>*</font> 
                <asp:RequiredFieldValidator ControlToValidate="TxtSubject" ID="RequiredFieldValidator2" runat="server" ErrorMessage="主题必须输入"></asp:RequiredFieldValidator>
                </td>
        </tr>
        <tr class="tdbg">
	        <td class="lefttd">内　容：</td>
	        <td>

            <textarea name="MsgContent" rows="3" cols="3" id="MsgContent" style="width:96%;height:150px"></textarea>
            <%
                Kesion.APPCode.EditorAPI.EchoEditor("editor", "MsgContent", "Basic", 0, false, true, true, false);    
             %>

            </td>
        </tr>
        <tr class="tdbg">
         <td class="lefttd"></td>
         <td height="50">  <asp:Button ID="BtnSend" CssClass="button" runat="server" Text="发 送" OnClick="button_Click"  /></td>
        </tr>
        </table>   
    
<br /><br />    <div>

    <strong>操作小贴士</strong><br />
    ① 发布信息,请严格遵守法律法规。对于不按要求发布的用户，我们将锁定账户处理。<br />
② 可以用英文状态下的逗号将用户名隔开实现群发，最多<%=MaxSendNum%>个用户<br />
③ 标题最多<%=MaxTitleLen%>个字符，内容最多<%=MaxMsgLen %>个字符
 </div>


</asp:Content>

