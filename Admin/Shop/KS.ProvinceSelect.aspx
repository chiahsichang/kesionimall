<%@ Page Language="C#" ValidateRequest="false" EnableEventValidation="false" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.Admin_ProvinceSelect" Title="ѡ��ʡ����Ϣ" Codebehind="KS.ProvinceSelect.aspx.cs" %>
<asp:Content ID="Content1" ContentPlaceHolderID="KSContent" Runat="Server">
<script type="text/javascript">
 function returnBack(){
  parent.frames["main"].setProvince("2");
 }
</script>
     <div style="text-align:center">
        
         <asp:ListBox ID="LstProvinceID" Height="300px" Width="240px" SelectionMode="Multiple" runat="server"></asp:ListBox>
    <br />
             С��ʾ����ѡ�ɰ�<span style="color:Red">Shife</span>��<br />
         <asp:Button ID="Button1" runat="server" CssClass="button" Text="ȷ��ѡ��" OnClick="Button1_Click" />
         <asp:Button ID="Button2" runat="server" CssClass="button" Text="�ر�ȡ��" />

     </div>
</asp:Content>