<%@ Page Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.Admin_Label_LabelClone" Title="Untitled Page" Codebehind="KS.LabelClone.aspx.cs" %>
<asp:Content ID="Content1" ContentPlaceHolderID="KSContent" Runat="Server">
    <br />
<table style="margin:6px" width="98%" align="center" cellpadding="1" cellspacing="1" class="CTable">
        <tr>
            <td class="lefttd" style="height: 30px; text-align: right">
                <strong>新标签名称：</strong></td>
            <td id="Td1" runat="server" class="righttd" style="height: 30px; text-align: left">
                <span style="color: #000066"><%=labelType%></span><asp:TextBox CssClass="noborder" ID="LabelName" runat="server" Width="233px"></asp:TextBox><span style="color: #000066"> } </span><asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="LabelName"
                    Display="Dynamic" ErrorMessage="标签名称必须输入"></asp:RequiredFieldValidator>&nbsp;&nbsp;&nbsp;
               </td>
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
		 showtips('<span class="state"><strong>说明：</strong><br /></span>由于大部分标签的功能参数设置差不多，您可以利用标签克隆功能,有效的提高您的工作效率。<br />');
  </script>

</asp:Content>

