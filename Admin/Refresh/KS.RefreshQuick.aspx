<%@ Page Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.Admin_Refresh_RefreshQuick" Title="���ٷ���HTML" Codebehind="KS.RefreshQuick.aspx.cs" %>
<%@ Register Src="~/control/refresh/RefreshTopControl.ascx" TagName="RefreshTopNav" TagPrefix="uc1" %>
<%@ Import Namespace="Kesion.Cache" %>
<%@ Import Namespace="Kesion.Publics" %>
<asp:Content ID="Content1" ContentPlaceHolderID="KSContent" Runat="Server">
<uc1:RefreshTopNav ID="RefreshTopNavS1" runat="server"/>

        <asp:Panel ID="Panel1" runat="server" Width="100%">
            <div style="text-align:center;margin:60px">
            <asp:Button ID="BtnRefresh" runat="server" CssClass="button" Text="һ�����ٷ���HTML" OnClick="BtnRefresh_Click" />
<br /> <br /> <br /> <br />
                <table class="CTable">
                    <tr><td align="left">
            <strong>���ɲ������ã�</strong>
                    </td>
                        <td align="left"><strong>��Ҫ������ģ��</strong><span class="tips">����ѡ��ʾȫ����Ҫ���ɣ�</span></td>
                    </tr>
                <tr><td align="left" style="width: 415px">ÿ��ģ��ֻ����������ӵ�<asp:TextBox style="width:50px;text-align:center;" Text="100" CssClass="textbox" ID="TxtNum" runat="server"></asp:TextBox>ƪ�ĵ�</td>
                    <td align="left" rowspan="2">
                        <asp:CheckBoxList ID="CblModel" runat="server" RepeatDirection="Horizontal" RepeatColumns="6"></asp:CheckBoxList>

                    </td>
                    </tr>
                <tr><td align="left" style="width: 415px">��Ŀ����������ÿ���б�ҳ��ǰ<asp:TextBox style="width:50px;text-align:center;" Text="3" CssClass="textbox" ID="TxtClassNum" runat="server"></asp:TextBox>ҳ</td>
                    </tr>
                <tr><td align="center" style="height:50px;width: 415px"> <asp:Button ID="BtnSaveSetting" runat="server" CssClass="button" Text="�����������" OnClick="BtnSaveSetting_Click" />
                    </td>
                    <td align="left">&nbsp;</td>
                    </tr> <tr><td align="left" colspan="2"> <br /> <span class="tips">
tips:���������������0,���������վ�������ܴ󣬾ɵ�����һ�㲻��Ҫ�������ɣ����Կ����ڴ˴�����һ��ֵ��</span>
                    </td>
                    </tr> 
                   
                </table>
             </div>
        </asp:Panel>
      
    
</asp:Content>

