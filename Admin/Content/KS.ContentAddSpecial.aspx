<%@ Page Language="C#" ValidateRequest="false" EnableEventValidation="false" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.Admin_ContentAddSpecial" Title="���/�༭��Ϣ" Codebehind="KS.ContentAddSpecial.aspx.cs" %>
<asp:Content ID="Content1" ContentPlaceHolderID="KSContent" Runat="Server">
     <div style="text-align:center">
         ID�б�<asp:TextBox ID="ContentIDS" runat="server" ReadOnly="True"></asp:TextBox>
    <div id="SpecialPannel" runat="server">
     </div>
         С��ʾ����ѡ�ɰ�<font color=red>Shift</font>��<br />
      <asp:Button ID="Button1" runat="server" CssClass="button" Text="ȷ������" OnClick="Button1_Click" />
         <asp:Button ID="Button2" runat="server" CssClass="button" Text="�ر�ȡ��" /></div>
    </form>
</asp:Content>
