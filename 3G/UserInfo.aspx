<%@ Page Title="" Language="C#" MasterPageFile="~/3G/User.master" AutoEventWireup="true" CodeBehind="UserInfo.aspx.cs" Inherits="Kesion.NET.WebSite._3G.UserZL" %>
<asp:Content ID="Content1" ContentPlaceHolderID="KSContent" runat="server">
    <% Kesion.APPCode.EditorAPI.EchoHead(); %>
             <input type="hidden" name="action" value="modifysave"/>
				 
						
							<%=__info.UserName %>
							<div class="clear blank10"></div>
							<label>姓&nbsp;&nbsp;&nbsp;&nbsp;名：</label>
							<input type="text" class="ipt_tx"  name="realname" value="<%=__info.RealName %>"/>
							<div class="clear blank10"></div>
							<label>性&nbsp;&nbsp;&nbsp;&nbsp;别：</label>
							 

							<input type="radio" name="sex" value="男"/>男
							<input type="radio" name="sex" value="女"/>女
							<script>
							    $(document).ready(function () {
							        $("input[name='sex'][value='<%=__info.Sex %>']").attr("checked", true);
							    });
							</script>
						<div class="clear blank10"></div>
							<label>电子邮件：</label>
							<input type="text" class="ipt_tx"  name="Email" value="<%=__info.Email %>"/>
						<div class="clear blank10"></div>
						<asp:Label ID="DiyPannel" runat="server"></asp:Label>
						
                        <asp:Button ID="BtnSave" runat="server" 
    style="padding:3px" text="保存修改" onclick="BtnSave_Click" />
</asp:Content>
