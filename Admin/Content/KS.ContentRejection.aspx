<%@ Page Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.Admin_ContentRejection" Title="�˸崦��" Codebehind="KS.ContentRejection.aspx.cs" %>
<%@ Import Namespace="Kesion.Cache" %>
<asp:Content ID="Content1" ContentPlaceHolderID="KSContent" Runat="Server">

<asp:Panel ID="addPanel" runat="server" Width="100%">
     <KS:TopNav ID="TopNav1" runat="server" Text="�˸崦��" />
        <table width="100%" border="0" cellpadding="1" cellspacing="1" class="CTable"> 
          <tr>
            <td class="lefttd" height="30" align="right" style="width: 162px"><b>�˸�ԭ��</b></td>
            <td class="righttd">
                &nbsp;<asp:TextBox Width="400px" Height="150px" Text="����{$UserName}���������ĸ����{$Title}�������ϱ�վҪ�����޸ĺ��������ύ��" CssClass="textbox" ID="TxtReason" runat="server" TextMode="MultiLine"></asp:TextBox> <font color=#ff0000>*</font>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TxtReason"
                    ErrorMessage="�������˸�ԭ��!"></asp:RequiredFieldValidator></td>
          </tr>
           
           
            <tr>
                <td align="right" class="lefttd" height="30" style="width: 162px">
                    <strong>֪ͨ��ʽ��</strong></td>
                <td class="righttd">
                    <asp:CheckBox ID="SendMessageToUser" runat="server" Checked="true" Text="ͬʱʹ��վ�ڶ���֪ͨ��Ա�˸�ԭ��" /><br />
              <asp:CheckBox ID="SendMailToUser" runat="server" Checked="true" Text="ͬʱ�����ʼ�֪ͨ��Ա�˸�ԭ��" />
                    <%
               if (MyCache.GetCacheConfig(32) == "1")
                {  
              %>
             <br /> <asp:CheckBox ID="SendMobileToUser" runat="server" Checked="true" Text="ͬʱ�����ֻ�����֪ͨ��Ա�˸�ԭ��" /></td>
              <%} %>
      </td>
            </tr>
        </table>
      <br />
      <div style="text-align:center">
            <asp:Button ID="BtnSave" runat="server" Text="ȷ���˸�" CssClass="button" OnClick="BtnSave_Click" />
 &nbsp;
        <Input class=button onclick="top.box.close();" type=button value=ȡ������ name=Submit></td>
    </div>
    </asp:Panel>

</asp:Content>

