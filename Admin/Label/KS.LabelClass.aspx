<%@ Page Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.Admin_Label_LabelClass" Title="Untitled Page" Codebehind="KS.LabelClass.aspx.cs" %>
<asp:Content ID="Content1" ContentPlaceHolderID="KSContent" Runat="Server">
<table width="100%" height="100%">
<tr>
 <td height="345" class="righttd" valign="top">
   <br />
    <table width="100%" cellpadding="1" cellspacing="1" class="CTable">
    <tr>
     <td class="lefttd" style="text-align: right; height: 30px;">
         <strong>�������ࣺ</strong></td>
     <td class="righttd" style="text-align: left; height: 30px;" id="parentidarea" runat="server"> </td>
    </tr>
        <tr>
            <td class="lefttd" style="text-align: right">
                <strong>�������ƣ�</strong></td>
            <td class="righttd" style="text-align: left">
                <asp:TextBox CssClass="textbox" ID="ClassName" runat="server" Width="164px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="ClassName"
                    Display="Dynamic" ErrorMessage="��ǩ���Ʊ�������"></asp:RequiredFieldValidator></td>
        </tr>
        <tr>
            <td class="lefttd" style="text-align: right; height: 98px;">
                <strong>��Ҫ���ܣ�</strong></td>
            <td class="righttd" style="text-align: left; height: 98px;">
                <asp:TextBox CssClass="textbox" ID="Description" runat="server" Height="94px" TextMode="MultiLine" Width="412px"></asp:TextBox></td>
        </tr>
    </table>
     <br />
     <div style="text-align:center">
     <asp:Button ID="Button1" CssClass="button" runat="server" Text="ȷ������(O)" AccessKey="O" OnClick="Button1_Click" />
           <input type="button" class="button" onclick="javascript:parent.box.close();" accesskey="C" value="�ر�ȡ��(C)" /><br />
     </div>
     </td>
</tr>
</table>
</asp:Content>

