<%@ Page Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.Admin_Refresh_RefreshSpecial" Title="����ר�����ҳ��" Codebehind="KS.RefreshSpecial.aspx.cs" %>
<%@ Register Src="~/control/refresh/RefreshTopControl.ascx" TagName="RefreshTopNav" TagPrefix="uc1" %>
<%@ Import Namespace="Kesion.Cache" %>
<asp:Content ID="Content1" ContentPlaceHolderID="KSContent" Runat="Server">
<uc1:RefreshTopNav ID="RefreshTopNavS1" runat="server"/>
    <asp:Panel ID="Panel1" runat="server" Width="100%">
     <asp:Label ID="Label1" runat="server"></asp:Label>
    </asp:Panel>
    <asp:Panel ID="Panel2" runat="server" Width="100%">
          <table width="99%" align="center" border="0" cellpadding="1" cellspacing="1" class="CTable"> 
                <tr>
                    <td align="right" colspan="2" height="25" style="text-align: center"><strong>����ר�⾲̬HTML����</strong></td>
                </tr>
              <tr>
                    <td align="right" class="lefttd" rowspan="3"  style="width: 270px; text-align: center">
                        <b>��ѡ��Ҫ������ר����Ŀ</b><br />
                
                <span style="color:mediumblue">
                    ��û��ѡ���κ���Ŀʱ����ʾ��������Ŀ��ɸѡ���������ļ�¼��������HTML����</span>&nbsp;

                        <asp:ListBox ID="ClassID" SelectionMode="multiple" runat="server" Height="264px" Width="200px">
                          <asp:ListItem Value="0">ȫվר��</asp:ListItem>
                        </asp:ListBox>
                
                    <br />
                    <span style="color: #ff0066">��ʾ��</span><span style="color: #ff0000">��ס"CTRL"��"Shift"�����Խ��ж�ѡ<br />
                       </span></td>
                <td class="righttd" valign="top" style="padding-left:10px">
                 <div><strong>����ר����ҳ</strong></div>
                 <div><asp:Button ID="Button5" CssClass="button" runat="server" Text="����ר����ҳ" OnClick="Button5_Click1" /></div>
                    
                </td>
               </tr>
              <tr>
                <td class="righttd" valign="top" style="padding-left:10px;">
                ��<div>
                      <strong>����ר��ҳ</strong></div>
                �� <div>�ٷ���������ӵ�<asp:TextBox ID="NewNum"  CssClass="textbox" style="text-align:center" runat="server" Width="43px">50</asp:TextBox>��ר��
                    &nbsp;
                    <asp:Button ID="Button1" runat="server" Text="����>>" CssClass="button" OnClick="Button1_Click" />
                   </div>
                   <div>
                       <br />
                       �ڷ�����ѡ��Ŀ��ר��<asp:Button ID="Button4" runat="server" Text="����ѡ����Ŀ����Ŀ>>" CssClass="button" OnClick="Button4_Click" />
                        </div>
                        <div>
                            <br />
                        
                          �۲�����Ŀ��������ר��<asp:Button ID="RefreshAllItemButton" CssClass="button" runat="server" Text="��������ר��>>" OnClick="RefreshAllItemButton_Click" />
                          </div>
                </td>
              </tr>
                <tr>
                    <td class="righttd" style="padding-left:10px;">
                     <div><strong>����ר����Ŀ</strong></div>
                     
                    <div>
                        <br />
                        �ٷ�����ѡ��ר����Ŀ<asp:Button ID="Button2" runat="server" Text="����ѡ��>>" CssClass="button" OnClick="Button2_Click" />
                      </div>
                    <div>
                        <br />
                        �ڷ�������ר����Ŀ
                        <asp:Button ID="Button3" runat="server" Text="��������ר����Ŀ>>" CssClass="button" OnClick="Button3_Click" />
                       </div>
                �� 
                    </td>
                </tr>
               
          </table>
        
          </asp:Panel>
 
    
</asp:Content>

