<%@ Page Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.Admin_Refresh_RefreshQuick" Title="快速发布HTML" Codebehind="KS.RefreshQuick.aspx.cs" %>
<%@ Register Src="~/control/refresh/RefreshTopControl.ascx" TagName="RefreshTopNav" TagPrefix="uc1" %>
<%@ Import Namespace="Kesion.Cache" %>
<%@ Import Namespace="Kesion.Publics" %>
<asp:Content ID="Content1" ContentPlaceHolderID="KSContent" Runat="Server">
<uc1:RefreshTopNav ID="RefreshTopNavS1" runat="server"/>

        <asp:Panel ID="Panel1" runat="server" Width="100%">
            <div style="text-align:center;margin:60px">
            <asp:Button ID="BtnRefresh" runat="server" CssClass="button" Text="一键快速发布HTML" OnClick="BtnRefresh_Click" />
<br /> <br /> <br /> <br />
                <table class="CTable">
                    <tr><td align="left">
            <strong>生成参数配置：</strong>
                    </td>
                        <td align="left"><strong>需要发布的模块</strong><span class="tips">（不选表示全部需要生成）</span></td>
                    </tr>
                <tr><td align="left" style="width: 415px">每个模型只发布最新添加的<asp:TextBox style="width:50px;text-align:center;" Text="100" CssClass="textbox" ID="TxtNum" runat="server"></asp:TextBox>篇文档</td>
                    <td align="left" rowspan="2">
                        <asp:CheckBoxList ID="CblModel" runat="server" RepeatDirection="Horizontal" RepeatColumns="6"></asp:CheckBoxList>

                    </td>
                    </tr>
                <tr><td align="left" style="width: 415px">栏目仅发布更新每个列表页的前<asp:TextBox style="width:50px;text-align:center;" Text="3" CssClass="textbox" ID="TxtClassNum" runat="server"></asp:TextBox>页</td>
                    </tr>
                <tr><td align="center" style="height:50px;width: 415px"> <asp:Button ID="BtnSaveSetting" runat="server" CssClass="button" Text="保存参数设置" OnClick="BtnSaveSetting_Click" />
                    </td>
                    <td align="left">&nbsp;</td>
                    </tr> <tr><td align="left" colspan="2"> <br /> <span class="tips">
tips:如果不限制请输入0,如果您的网站数据量很大，旧的数据一般不需要重新生成，所以可以在此处设置一个值。</span>
                    </td>
                    </tr> 
                   
                </table>
             </div>
        </asp:Panel>
      
    
</asp:Content>

