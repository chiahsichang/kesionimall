<%@ Page Language="C#" MasterPageFile="~/User/User.master" ValidateRequest="false" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.User_User_EditPass" Title="Untitled Page" Codebehind="EditPass.aspx.cs" %>
<asp:Content ID="Content1" ContentPlaceHolderID="KSContent" Runat="Server">

<script>
    function checkform() {
        if ($("#<%=this.OldPass.ClientID %>").val() == '') {
            KesionJS.Alert('请输入您的旧密码！', "$('#<%=this.OldPass.ClientID %>').focus()");
            return false;
        }
        if ($("#<%=this.PassWord.ClientID %>").val() == '') {
            KesionJS.Alert('请输入您的新密码！', "$('#<%=this.PassWord.ClientID %>').focus()");
            return false;
        }
        if ($("#<%=this.RePassWord.ClientID %>").val() == '') {
            KesionJS.Alert('请输入您的确认密码！', "$('#<%=this.RePassWord.ClientID %>').focus()");
            return false;
        }
        if ($("#<%=this.PassWord.ClientID %>").val() != $("#<%=this.RePassWord.ClientID %>").val()) {
            KesionJS.Alert('两次输入的密码不一致，请重输！', "$('#<%=this.PassWord.ClientID %>').focus()");
            return false;
        }
        if ($("#<%=this.TxtVerifyCode.ClientID %>").val() == '') {
            KesionJS.Alert('请输入验证码！', "$('#<%=this.TxtVerifyCode.ClientID %>').focus()");
            return false;
        }
    }
</script>
<div class="tabs">	
			<ul>
				<li><a href="editinfo.aspx">修改我的资料</a></li>
                <li><a href="userFace.aspx">上传头像</a></li>
				<li class='puton'><a href="editPass.aspx">修改密码</a></li>
				<li><a href="EditQuestion.aspx">修改安全问题</a></li>
			</ul>
</div>
 <table  cellspacing="1" cellpadding="3" class="border" width="98%" align="center" border="0">
	                   <tr class="title">
                            <td colspan="2"> 修 改 密 码 </td>
                          </tr>
                          <%if (__info.IsApi == 1)
                            { %>
                            <tr class="tdbg">
                            <td colspan="2" style="font-size:14px;color:green;height:80px;line-height:30px;padding:10px;">温馨提示：您是通过第三方网站账号登录本站的，您可以设置新密码，下次就可以直接使用用户名 <span style="color:Red"><%=__info.UserName %></span> 和以下设置的密码登录本站了。</td>
                          </tr>
                          <%}
                            else
                            { %>
                          <tr class="tdbg">
                            <td  class="lefttd">旧 密 码：</td>
                            <td><asp:TextBox ID="OldPass" CssClass="textbox"  TextMode="password" runat="server"></asp:TextBox><span class="tips">您的旧登录密码，必须正确填写。</span><span style="color: red">*<asp:RequiredFieldValidator
                                    ID="RequiredFieldValidator1" runat="server" ControlToValidate="OldPass" ErrorMessage="请输入旧密码！"></asp:RequiredFieldValidator></span></td>
                          </tr>
                          <%} %>
                          <tr class="tdbg">
                            <td class="lefttd"> 新 密 码：</td>
                            <td><asp:TextBox ID="PassWord" CssClass="textbox" TextMode="password" runat="server"></asp:TextBox><span class="tips">请输入您的新密码！</span>
                            <span style="color: red">* 
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="PassWord"
                                    ErrorMessage="请输入新密码！"></asp:RequiredFieldValidator></span></td>
                          </tr>
                          <tr class="tdbg">
                            <td class="lefttd">确认密码：</td>
                            <td><asp:TextBox ID="RePassWord" CssClass="textbox" TextMode="password" runat="server"></asp:TextBox><span class="tips">同上。</span>
                              <span style="color: red">* 
                                  <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="RePassWord"
                                      Display="Dynamic" ErrorMessage="请输入确认密码！"></asp:RequiredFieldValidator>
                                  <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="PassWord"
                                      ControlToValidate="RePassWord" Display="Dynamic" ErrorMessage="两次输入的密码不一致！"></asp:CompareValidator></span></td>
                          </tr>
                          <tr class="tdbg">
                            <td class="lefttd">验 证 码：</td>
                            <td>
                                <asp:TextBox ID="TxtVerifyCode" CssClass="textbox" width="50px" runat="server"></asp:TextBox>
                              <span style="color: red">*  </span>
                                <img src="../../plus/ValidateCode.aspx" onclick="this.src=this.src+'?'+Math.random()" />

                            </td>
                          </tr>
                          
						<tr class="tdbg">
                            <td class="lefttd" height="40">&nbsp;</td>
                            <td>
                                &nbsp; &nbsp;&nbsp;<asp:Button OnClientClick="return(checkform());" ID="Button1" CssClass="button" runat="server" OnClick="Button1_Click"
                                    Text="OK!确定修改" />
                                &nbsp; &nbsp; &nbsp;
                              <input type="reset" class="button" value=" 重 置 " /></td>
                        </tr>
            </table>
          <br>
         

</asp:Content>

