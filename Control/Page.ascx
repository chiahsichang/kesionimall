<%@ Control Language="C#" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.Control_Page" Codebehind="Page.ascx.cs" %>
<div class="footer_page">
<table cellpadding="0" cellspacing="0" style="width: 100%;">
            <tr>
                <td> &nbsp;</td>
                <td style="font-size: 9pt; height: 25px; text-align: right"  onclick="jQuery('#aspnetForm').removeAttr('target');">
                    <asp:Label ID="Label7" runat="server" Text="当前页码为："></asp:Label>
                    <asp:TextBox  ID="labPage" runat="server" AutoPostBack="True" OnTextChanged="labPage_TextChanged"
                        Text="1" Width="30px"></asp:TextBox>
                    &nbsp; &nbsp;
                    <asp:Label ID="Label6" runat="server" Text="总页数："></asp:Label><asp:Label ID="labTotalPage"
                        runat="server"></asp:Label>页 每页显示：<asp:Label ID="labperpagenum" runat="server" Text="0"></asp:Label>条
                    
                    总记录：<asp:Label ID="labrecordcount" runat="server" Text="0"></asp:Label>条
                    <asp:LinkButton ID="lnkbtnOne" runat="server" Font-Underline="False" OnClick="lnkbtnOne_Click">首页</asp:LinkButton>
                    <asp:LinkButton ID="lnkbtnUp" runat="server" Font-Underline="False" OnClick="lnkbtnUp_Click">上一页</asp:LinkButton>
                    <asp:PlaceHolder ID="PLH" runat="server"></asp:PlaceHolder>
                    <asp:LinkButton ID="lnkbtnNext" runat="server" Font-Underline="False" OnClick="lnkbtnNext_Click">下一页</asp:LinkButton>
                    <asp:LinkButton ID="lnkbtnBack" runat="server" Font-Underline="False" OnClick="lnkbtnBack_Click">末页</asp:LinkButton>
                    &nbsp;
                </td>
            </tr>
 </table>
</div>