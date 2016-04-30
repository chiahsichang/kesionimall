<%@ Page Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.Admin_Label_LabelClass" Title="Untitled Page" Codebehind="KS.LabelClass.aspx.cs" %>
<asp:Content ID="Content1" ContentPlaceHolderID="KSContent" Runat="Server">
<table width="100%" height="100%">
<tr>
 <td height="345" class="righttd" valign="top">
   <br />
    <table width="100%" cellpadding="1" cellspacing="1" class="CTable">
    <tr>
     <td class="lefttd" style="text-align: right; height: 30px;">
         <strong>所属分类：</strong></td>
     <td class="righttd" style="text-align: left; height: 30px;" id="parentidarea" runat="server"> </td>
    </tr>
        <tr>
            <td class="lefttd" style="text-align: right">
                <strong>类型名称：</strong></td>
            <td class="righttd" style="text-align: left">
                <asp:TextBox CssClass="textbox" ID="ClassName" runat="server" Width="164px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="ClassName"
                    Display="Dynamic" ErrorMessage="标签名称必须输入"></asp:RequiredFieldValidator></td>
        </tr>
        <tr>
            <td class="lefttd" style="text-align: right; height: 98px;">
                <strong>简要介绍：</strong></td>
            <td class="righttd" style="text-align: left; height: 98px;">
                <asp:TextBox CssClass="textbox" ID="Description" runat="server" Height="94px" TextMode="MultiLine" Width="412px"></asp:TextBox></td>
        </tr>
    </table>
     <br />
     <div style="text-align:center">
     <asp:Button ID="Button1" CssClass="button" runat="server" Text="确定创建(O)" AccessKey="O" OnClick="Button1_Click" />
           <input type="button" class="button" onclick="javascript:parent.box.close();" accesskey="C" value="关闭取消(C)" /><br />
     </div>
     </td>
</tr>
</table>
</asp:Content>

