<%@ Page Language="C#" MasterPageFile="~/User/User.master" ValidateRequest="false" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.User_EditQuestion" Title="Untitled Page" Codebehind="EditQuestion.aspx.cs" %>
<asp:Content ID="Content1" ContentPlaceHolderID="KSContent" Runat="Server">
<div class="tabs">	
			<ul>
				<li><a href="editinfo.aspx">�޸��ҵ�����</a></li>
                <li><a href="userFace.aspx">�ϴ�ͷ��</a></li>
				<li><a href="editPass.aspx">�޸�����</a></li>
				<li class='puton'><a href="EditQuestion.aspx">�޸İ�ȫ����</a></li>
			</ul>
</div>

 <table  cellspacing="1" cellpadding="3" class="border" width="98%" align="center" border="0">
	                   <tr class="title">
                            <td colspan="2"> �� �� �� �� �� �� ��</td>
                          </tr>
                          <tr class="tdbg">
                            <td class="lefttd">��¼���룺</td>
                            <td><asp:TextBox ID="PassWord" CssClass="textbox" TextMode="password" runat="server"></asp:TextBox><span class="tips">
                                ���ĵ�¼��¼���룬������ȷ��д��</span><span style="color: red">*<asp:RequiredFieldValidator
                                    ID="RequiredFieldValidator1" runat="server" ControlToValidate="PassWord" ErrorMessage="�������¼���룡"></asp:RequiredFieldValidator></span></td>
                          </tr>
                          <tr class="tdbg">
                            <td class="lefttd">��ʾ���⣺</td>
                            <td><asp:TextBox ID="Question" CssClass="textbox" runat="server"></asp:TextBox><span class="tips">
                                ����������ʱ��ȡ���������ʾ���⡣</span>
                            <span style="color: red">* 
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="Question"
                                    ErrorMessage="��������ʾ���⣡"></asp:RequiredFieldValidator></span></td>
                          </tr>
                          <tr class="tdbg">
                            <td class="lefttd">����𰸣�</td>
                            <td><asp:TextBox ID="Answer" CssClass="textbox" runat="server"></asp:TextBox><span class="tips"> ����������ʱ��ȡ��������ʾ����Ĵ𰸡�</span>
                              <span style="color: red">* 
                                  <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="Answer"
                                      Display="Dynamic" ErrorMessage="����������𰸣�"></asp:RequiredFieldValidator>
                                  </span></td>
                          </tr>
                          <tr class="tdbg">
                            <td class="lefttd">�� ֤ �룺</td>
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
                                    Text="OK!ȷ���޸�" />
                                &nbsp; &nbsp; &nbsp;
                              <input type="reset" value=" �� �� " class="button"/></td>
                        </tr>
            </table>
          <br>
         

</asp:Content>

