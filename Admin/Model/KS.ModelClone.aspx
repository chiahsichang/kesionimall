<%@ Page Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.Admin_ModelClone" Title="��¡ģ�ͽṹ" Codebehind="KS.ModelClone.aspx.cs" %>
<asp:Content ID="Content1" ContentPlaceHolderID="KSContent" Runat="Server">
    <br />
<table style="margin:6px" width="98%" align="center" cellpadding="1" cellspacing="1" class="CTable">
        <tr>
            <td class="lefttd" style="height: 30px; text-align: right">
                <strong>��ģ�����ƣ�</strong></td>
            <td class="righttd" style="height: 30px; text-align: left">
                <span style="color: #000066"></span>&nbsp;<asp:TextBox CssClass="textbox" ID="ModelName" runat="server" Width="233px"></asp:TextBox><span style="color: #000066">&nbsp; </span><asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="ModelName"
                    Display="Dynamic" ErrorMessage="ģ�����Ʊ�������"></asp:RequiredFieldValidator>&nbsp;&nbsp;&nbsp;
               </td>
        </tr>
    <tr>
        <td class="lefttd" style="height: 30px; text-align: right">
            <strong>���ݱ����ƣ�</strong></td>
        <td  class="righttd" style="height: 30px; text-align: left">
            &nbsp;KS_U_<asp:TextBox ID="ModelTable" CssClass="textbox" runat="server" Width="109px"></asp:TextBox><span
                               style="color: #ff0000">*</span><asp:RequiredFieldValidator ID="RequiredFieldValidator2"
                                   runat="server" ControlToValidate="ModelTable" ErrorMessage="���ݱ����Ʊ�������" Display="Dynamic"></asp:RequiredFieldValidator>
                           <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="ModelTable"
                               ErrorMessage="��������ĸ��ͷ����������ֻ���ĸ����ϣ�������3-10���ַ�֮��" ValidationExpression="[a-zA-Z]{1}[\d|(a-zA-Z)]{2,9}" Display="Dynamic"></asp:RegularExpressionValidator>
            <br />
                           ˵�����������ݱ���޷��޸ģ������û����������ݱ���"KS_U_"��ͷ</td>
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
		 showtips('<span class="state"><strong>˵����</strong><br /></span>���ڴ󲿷�ģ�ͽṹ�������ò�࣬����������ģ�ͽṹ��¡����,��Ч��������Ĺ���Ч�ʡ�<br />');
  </script>

</asp:Content>

