<%@ Page Language="C#" ValidateRequest="false" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.Admin_UserMail" Title="�����ʼ�" Codebehind="KS.UserMail.aspx.cs" %>
<%@ Import Namespace="Kesion.BLL" %>
<asp:Content ID="Content1" ContentPlaceHolderID="KSContent" Runat="Server">
    <KS:TopNav ID="TopNav1" runat="server" Text="�����ʼ�" />
     <table width="100%" border="0" cellpadding="1" cellspacing="1" class="CTable"> 
          <tr>
            <td class="lefttd" height="30" align="right" style="width: 146px"><b>�ռ���ѡ��</b></td>
            <td class="righttd">
                <input type="radio" name="optype" onclick="jQuery('#grouparea').hide();" value="1" checked />���л�Ա(<span style="color:red"><%=DataFactory.GetOnlyValue("select count(1) From KS_User") %></span>λ)<br />
                <input type="radio" name="optype" onclick="jQuery('#grouparea').show();" value="2" />ָ����Ա��
                <br />
                <div id="grouparea" style="display:none">
                <%=BaseFun.GetUserGroup_CheckBox("groupid",4,"0") %>
                </div>
                <input type="radio" name="optype" onclick="jQuery('#grouparea').hide();" value="3" />ָ���û���<asp:TextBox CssClass="textbox" ID="ToUserName" runat="server"
                    Width="246px"></asp:TextBox>����û���������<font color="#0000ff">Ӣ�ĵĶ���</font>�ָ�<br />
                <input type="radio" name="optype" onclick="jQuery('#grouparea').hide();" value="4" />ָ��Email &nbsp;&nbsp;
                <asp:TextBox CssClass="textbox" ID="ToMail" runat="server" Width="246px"></asp:TextBox>���Email������<font
                    color="#0000ff">Ӣ�ĵĶ���</font>�ָ�</td>
          </tr>
         <tr>
             <td align="right" class="lefttd" height="30" style="width: 146px">
                 <strong>�ʼ����⣺</strong></td>
             <td class="righttd">
                 <asp:TextBox CssClass="textbox" ID="Subject" runat="server" Width="500px"></asp:TextBox>
                 <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="�������ʼ�����" ControlToValidate="Subject"></asp:RequiredFieldValidator></td>
         </tr>
         <tr>
             <td align="right" class="lefttd" height="30" style="width: 146px">
                 <strong>�ʼ����ݣ�</strong><div class="tips">
                 <strong>���ñ�ǩ��</strong><br />
                 {$UserName} -�û���<br />
                 {$RealName} -����<br />
                 {$Sex} -��������Ůʿ<br />
                 {$SiteName} -��վ����<br />
                 {$SendTime} -����ʱ��<br />
                 {$SendDate} -��������<br />
                 </div></td>
             <td class="righttd">
            
                    <asp:TextBox ID="Content" TextMode="multiLine" style="width:95%;height:250px;" runat="server"></asp:TextBox>
                    <% Kesion.APPCode.EditorAPI.EchoEditor("editor", this.Content.ClientID, "Common");%>


             </td>
         </tr>
         <tr>
             <td align="right" class="lefttd" height="30" style="width: 146px">
                 <strong>�����ˣ�</strong></td>
             <td class="righttd">
                 <asp:TextBox CssClass="textbox" ID="Sender" runat="server"></asp:TextBox></td>
         </tr>
         <tr>
             <td align="right" class="lefttd" height="30" style="width: 146px">
                 <strong>������Email��</strong></td>
             <td class="righttd">
                 <asp:TextBox CssClass="textbox" ID="SenderMail" runat="server"></asp:TextBox></td>
         </tr>
         <tr>
             <td align="right" class="lefttd" height="30" style="width: 146px">
                 <strong>�ʼ����ȼ���</strong></td>
             <td class="righttd">
                 <asp:RadioButtonList ID="Priority" runat="server" RepeatDirection="Horizontal">
                     <asp:ListItem Selected="True" Value="1">��</asp:ListItem>
                     <asp:ListItem Value="2">��ͨ</asp:ListItem>
                     <asp:ListItem Value="3">��</asp:ListItem>
                 </asp:RadioButtonList></td>
         </tr>
        </table>
    <br />
    <KS:Foot ID="Foot1" runat="server" SubmitButtonText="��ʼ����(0)" OnSubmit="Foot1_Submit" />
</asp:Content>

