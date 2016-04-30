<%@ Page Language="C#" ValidateRequest="false" EnableEventValidation="false" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.Admin_ProvinceSelect" Title="选择省份信息" Codebehind="KS.ProvinceSelect.aspx.cs" %>
<asp:Content ID="Content1" ContentPlaceHolderID="KSContent" Runat="Server">
<script type="text/javascript">
 function returnBack(){
  parent.frames["main"].setProvince("2");
 }
</script>
     <div style="text-align:center">
        
         <asp:ListBox ID="LstProvinceID" Height="300px" Width="240px" SelectionMode="Multiple" runat="server"></asp:ListBox>
    <br />
             小提示：多选可按<span style="color:Red">Shife</span>键<br />
         <asp:Button ID="Button1" runat="server" CssClass="button" Text="确定选择" OnClick="Button1_Click" />
         <asp:Button ID="Button2" runat="server" CssClass="button" Text="关闭取消" />

     </div>
</asp:Content>