<%@ Page Language="C#" MasterPageFile="~/User/User.master" ValidateRequest="false" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.User_EditQuestion" Title="Untitled Page" Codebehind="EditQuestion.aspx.cs" %>
<asp:Content ID="Content1" ContentPlaceHolderID="KSContent" Runat="Server">
<div class="tabs">	
			<ul>
				<li><a href="editinfo.aspx">修改我的资料</a></li>
                <li><a href="userFace.aspx">上传头像</a></li>
				<li><a href="editPass.aspx">修改密码</a></li>
				<li class='puton'><a href="EditQuestion.aspx">修改安全问题</a></li>
			</ul>
</div>

 <table  cellspacing="1" cellpadding="3" class="border" width="98%" align="center" border="0">
	                   <tr class="title">
                            <td colspan="2"> 改 找 回 密 码 设 置</td>
                          </tr>
                          <tr class="tdbg">
                            <td class="lefttd">登录密码：</td>
                            <td><asp:TextBox ID="PassWord" CssClass="textbox" TextMode="password" runat="server"></asp:TextBox><span class="tips">
                                您的登录登录密码，必须正确填写。</span><span style="color: red">*<asp:RequiredFieldValidator
                                    ID="RequiredFieldValidator1" runat="server" ControlToValidate="PassWord" ErrorMessage="请输入登录密码！"></asp:RequiredFieldValidator></span></td>
                          </tr>
                          <tr class="tdbg">
                            <td class="lefttd">提示问题：</td>
                            <td><asp:TextBox ID="Question" CssClass="textbox" runat="server"></asp:TextBox><span class="tips">
                                当密码忘记时，取回密码的提示问题。</span>
                            <span style="color: red">* 
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="Question"
                                    ErrorMessage="请输入提示问题！"></asp:RequiredFieldValidator></span></td>
                          </tr>
                          <tr class="tdbg">
                            <td class="lefttd">问题答案：</td>
                            <td><asp:TextBox ID="Answer" CssClass="textbox" runat="server"></asp:TextBox><span class="tips"> 当密码忘记时，取回密码提示问题的答案。</span>
                              <span style="color: red">* 
                                  <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="Answer"
                                      Display="Dynamic" ErrorMessage="请输入问题答案！"></asp:RequiredFieldValidator>
                                  </span></td>
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
                            <td height="40">&nbsp;</td>
                            <td>
                                &nbsp; &nbsp;&nbsp;<asp:Button ID="Button1" CssClass="button" runat="server" OnClick="Button1_Click"
                                    Text="OK!确定修改" />
                                &nbsp; &nbsp; &nbsp;
                              <input type="reset" value=" 重 置 " class="button"/></td>
                        </tr>
            </table>
          <br>
         

</asp:Content>

