<%@ Page Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.Admin_ContentRejection" Title="退稿处理" Codebehind="KS.ContentRejection.aspx.cs" %>
<%@ Import Namespace="Kesion.Cache" %>
<asp:Content ID="Content1" ContentPlaceHolderID="KSContent" Runat="Server">

<asp:Panel ID="addPanel" runat="server" Width="100%">
     <KS:TopNav ID="TopNav1" runat="server" Text="退稿处理" />
        <table width="100%" border="0" cellpadding="1" cellspacing="1" class="CTable"> 
          <tr>
            <td class="lefttd" height="30" align="right" style="width: 162px"><b>退稿原因：</b></td>
            <td class="righttd">
                &nbsp;<asp:TextBox Width="400px" Height="150px" Text="您好{$UserName}，您发布的稿件“{$Title}”不符合本站要求，请修改后再重新提交！" CssClass="textbox" ID="TxtReason" runat="server" TextMode="MultiLine"></asp:TextBox> <font color=#ff0000>*</font>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TxtReason"
                    ErrorMessage="请输入退稿原因!"></asp:RequiredFieldValidator></td>
          </tr>
           
           
            <tr>
                <td align="right" class="lefttd" height="30" style="width: 162px">
                    <strong>通知方式：</strong></td>
                <td class="righttd">
                    <asp:CheckBox ID="SendMessageToUser" runat="server" Checked="true" Text="同时使用站内短信通知会员退稿原因" /><br />
              <asp:CheckBox ID="SendMailToUser" runat="server" Checked="true" Text="同时发送邮件通知会员退稿原因" />
                    <%
               if (MyCache.GetCacheConfig(32) == "1")
                {  
              %>
             <br /> <asp:CheckBox ID="SendMobileToUser" runat="server" Checked="true" Text="同时发送手机短信通知会员退稿原因" /></td>
              <%} %>
      </td>
            </tr>
        </table>
      <br />
      <div style="text-align:center">
            <asp:Button ID="BtnSave" runat="server" Text="确定退稿" CssClass="button" OnClick="BtnSave_Click" />
 &nbsp;
        <Input class=button onclick="top.box.close();" type=button value=取消返回 name=Submit></td>
    </div>
    </asp:Panel>

</asp:Content>

