<%@ Page Language="C#" ValidateRequest="false" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.Admin_UserMail" Title="发送邮件" Codebehind="KS.UserMail.aspx.cs" %>
<%@ Import Namespace="Kesion.BLL" %>
<asp:Content ID="Content1" ContentPlaceHolderID="KSContent" Runat="Server">
    <KS:TopNav ID="TopNav1" runat="server" Text="发送邮件" />
     <table width="100%" border="0" cellpadding="1" cellspacing="1" class="CTable"> 
          <tr>
            <td class="lefttd" height="30" align="right" style="width: 146px"><b>收件人选择：</b></td>
            <td class="righttd">
                <input type="radio" name="optype" onclick="jQuery('#grouparea').hide();" value="1" checked />所有会员(<span style="color:red"><%=DataFactory.GetOnlyValue("select count(1) From KS_User") %></span>位)<br />
                <input type="radio" name="optype" onclick="jQuery('#grouparea').show();" value="2" />指定会员组
                <br />
                <div id="grouparea" style="display:none">
                <%=BaseFun.GetUserGroup_CheckBox("groupid",4,"0") %>
                </div>
                <input type="radio" name="optype" onclick="jQuery('#grouparea').hide();" value="3" />指定用户名<asp:TextBox CssClass="textbox" ID="ToUserName" runat="server"
                    Width="246px"></asp:TextBox>多个用户名间请用<font color="#0000ff">英文的逗号</font>分隔<br />
                <input type="radio" name="optype" onclick="jQuery('#grouparea').hide();" value="4" />指定Email &nbsp;&nbsp;
                <asp:TextBox CssClass="textbox" ID="ToMail" runat="server" Width="246px"></asp:TextBox>多个Email间请用<font
                    color="#0000ff">英文的逗号</font>分隔</td>
          </tr>
         <tr>
             <td align="right" class="lefttd" height="30" style="width: 146px">
                 <strong>邮件主题：</strong></td>
             <td class="righttd">
                 <asp:TextBox CssClass="textbox" ID="Subject" runat="server" Width="500px"></asp:TextBox>
                 <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="请输入邮件主题" ControlToValidate="Subject"></asp:RequiredFieldValidator></td>
         </tr>
         <tr>
             <td align="right" class="lefttd" height="30" style="width: 146px">
                 <strong>邮件内容：</strong><div class="tips">
                 <strong>可用标签：</strong><br />
                 {$UserName} -用户名<br />
                 {$RealName} -姓名<br />
                 {$Sex} -先生或是女士<br />
                 {$SiteName} -网站名称<br />
                 {$SendTime} -发送时间<br />
                 {$SendDate} -发送日期<br />
                 </div></td>
             <td class="righttd">
            
                    <asp:TextBox ID="Content" TextMode="multiLine" style="width:95%;height:250px;" runat="server"></asp:TextBox>
                    <% Kesion.APPCode.EditorAPI.EchoEditor("editor", this.Content.ClientID, "Common");%>


             </td>
         </tr>
         <tr>
             <td align="right" class="lefttd" height="30" style="width: 146px">
                 <strong>发件人：</strong></td>
             <td class="righttd">
                 <asp:TextBox CssClass="textbox" ID="Sender" runat="server"></asp:TextBox></td>
         </tr>
         <tr>
             <td align="right" class="lefttd" height="30" style="width: 146px">
                 <strong>发件人Email：</strong></td>
             <td class="righttd">
                 <asp:TextBox CssClass="textbox" ID="SenderMail" runat="server"></asp:TextBox></td>
         </tr>
         <tr>
             <td align="right" class="lefttd" height="30" style="width: 146px">
                 <strong>邮件优先级：</strong></td>
             <td class="righttd">
                 <asp:RadioButtonList ID="Priority" runat="server" RepeatDirection="Horizontal">
                     <asp:ListItem Selected="True" Value="1">高</asp:ListItem>
                     <asp:ListItem Value="2">普通</asp:ListItem>
                     <asp:ListItem Value="3">低</asp:ListItem>
                 </asp:RadioButtonList></td>
         </tr>
        </table>
    <br />
    <KS:Foot ID="Foot1" runat="server" SubmitButtonText="开始发送(0)" OnSubmit="Foot1_Submit" />
</asp:Content>

