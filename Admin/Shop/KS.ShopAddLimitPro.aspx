<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.Admin.Shop.ShopAddLimitPro" Codebehind="KS.ShopAddLimitPro.aspx.cs" %>
<asp:Content ID="Content1" ContentPlaceHolderID="KSContent" runat="server">

<br />
<br />
<strong>
请选择要发布到的模型：
</strong>
<asp:DropDownList ID="DrpModelID" runat="server">
</asp:DropDownList>
<input type="button" class="button" value="确认发布" onclick="goAdd();"/>


<script>
    jQuery(document).ready(function () {
        if (jQuery("#<%=this.DrpModelID.ClientID %> option").length == 1) {
            goAdd();
        }
    });
    function goAdd() {
        var modelId = jQuery("#<%=this.DrpModelID.ClientID %>").val();
        top.frames['main'].location.href = 'KS.Shop.aspx?addtype=<%=addType%>&taskType=<%=limitBuyType %>&taskId=<%=taskId %>&Action=Add&Channelid=' + modelId;
        top.box.close();
    }
</script>

</asp:Content>
