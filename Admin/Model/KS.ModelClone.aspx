<%@ Page Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.Admin_ModelClone" Title="克隆模型结构" Codebehind="KS.ModelClone.aspx.cs" %>
<asp:Content ID="Content1" ContentPlaceHolderID="KSContent" Runat="Server">
    <br />
<table style="margin:6px" width="98%" align="center" cellpadding="1" cellspacing="1" class="CTable">
        <tr>
            <td class="lefttd" style="height: 30px; text-align: right">
                <strong>新模型名称：</strong></td>
            <td class="righttd" style="height: 30px; text-align: left">
                <span style="color: #000066"></span>&nbsp;<asp:TextBox CssClass="textbox" ID="ModelName" runat="server" Width="233px"></asp:TextBox><span style="color: #000066">&nbsp; </span><asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="ModelName"
                    Display="Dynamic" ErrorMessage="模型名称必须输入"></asp:RequiredFieldValidator>&nbsp;&nbsp;&nbsp;
               </td>
        </tr>
    <tr>
        <td class="lefttd" style="height: 30px; text-align: right">
            <strong>数据表名称：</strong></td>
        <td  class="righttd" style="height: 30px; text-align: left">
            &nbsp;KS_U_<asp:TextBox ID="ModelTable" CssClass="textbox" runat="server" Width="109px"></asp:TextBox><span
                               style="color: #ff0000">*</span><asp:RequiredFieldValidator ID="RequiredFieldValidator2"
                                   runat="server" ControlToValidate="ModelTable" ErrorMessage="数据表名称必须输入" Display="Dynamic"></asp:RequiredFieldValidator>
                           <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="ModelTable"
                               ErrorMessage="必须以字母开头，后面跟数字或字母的组合，长度在3-10个字符之间" ValidationExpression="[a-zA-Z]{1}[\d|(a-zA-Z)]{2,9}" Display="Dynamic"></asp:RegularExpressionValidator>
            <br />
                           说明：创建数据表后无法修改，并且用户创建的数据表以"KS_U_"开头</td>
    </tr>
    <tr>
        <td class="righttd" colspan="2" style="height: 30px; text-align: center">
            <asp:Button ID="Button1" CssClass="button" runat="server" Text="确定克隆(O)" AccessKey="O" OnClick="Button1_Click" />
            &nbsp;
            <input type="button" onclick="parent.box.close();" value="关闭取消(C)" accesskey="C" class="button" /></td>
    </tr>
 </table>
 
 <br />
  <script type="text/javascript">
		 showtips('<span class="state"><strong>说明：</strong><br /></span>由于大部分模型结构参数设置差不多，您可以利用模型结构克隆功能,有效的提高您的工作效率。<br />');
  </script>

</asp:Content>

