<%@ Page Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.Admin_Label_LabelClone" Title="Untitled Page" Codebehind="KS.LabelClone.aspx.cs" %>
<asp:Content ID="Content1" ContentPlaceHolderID="KSContent" Runat="Server">
    <br />
<table style="margin:6px" width="98%" align="center" cellpadding="1" cellspacing="1" class="CTable">
        <tr>
            <td class="lefttd" style="height: 30px; text-align: right">
                <strong>�±�ǩ���ƣ�</strong></td>
            <td id="Td1" runat="server" class="righttd" style="height: 30px; text-align: left">
                <span style="color: #000066"><%=labelType%></span><asp:TextBox CssClass="noborder" ID="LabelName" runat="server" Width="233px"></asp:TextBox><span style="color: #000066"> } </span><asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="LabelName"
                    Display="Dynamic" ErrorMessage="��ǩ���Ʊ�������"></asp:RequiredFieldValidator>&nbsp;&nbsp;&nbsp;
               </td>
        </tr>
    <tr>
        <td class="righttd" colspan="2" style="height: 30px; text-align: center">
            <asp:Button ID="Button1" CssClass="button" runat="server" Text="ȷ����¡(O)" AccessKey="O" OnClick="Button1_Click" />
            &nbsp;
            <input type="button" onclick="parent.box.close();" value="�ر�ȡ��(C)" accesskey="C" class="button" /></td>
    </tr>
 </table>
 
 <br />
  <script type="text/javascript">
		 showtips('<span class="state"><strong>˵����</strong><br /></span>���ڴ󲿷ֱ�ǩ�Ĺ��ܲ������ò�࣬���������ñ�ǩ��¡����,��Ч��������Ĺ���Ч�ʡ�<br />');
  </script>

</asp:Content>

