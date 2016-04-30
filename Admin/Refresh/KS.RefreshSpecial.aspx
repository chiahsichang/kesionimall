<%@ Page Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.Admin_Refresh_RefreshSpecial" Title="生成专题管理页面" Codebehind="KS.RefreshSpecial.aspx.cs" %>
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
                    <td align="right" colspan="2" height="25" style="text-align: center"><strong>生成专题静态HTML操作</strong></td>
                </tr>
              <tr>
                    <td align="right" class="lefttd" rowspan="3"  style="width: 270px; text-align: center">
                        <b>请选择要发布的专题栏目</b><br />
                
                <span style="color:mediumblue">
                    当没有选择任何栏目时，表示从所有栏目中筛选符合条件的记录进行生成HTML操作</span>&nbsp;

                        <asp:ListBox ID="ClassID" SelectionMode="multiple" runat="server" Height="264px" Width="200px">
                          <asp:ListItem Value="0">全站专题</asp:ListItem>
                        </asp:ListBox>
                
                    <br />
                    <span style="color: #ff0066">提示：</span><span style="color: #ff0000">按住"CTRL"或"Shift"键可以进行多选<br />
                       </span></td>
                <td class="righttd" valign="top" style="padding-left:10px">
                 <div><strong>发布专题首页</strong></div>
                 <div><asp:Button ID="Button5" CssClass="button" runat="server" Text="发布专题首页" OnClick="Button5_Click1" /></div>
                    
                </td>
               </tr>
              <tr>
                <td class="righttd" valign="top" style="padding-left:10px;">
                　<div>
                      <strong>发布专题页</strong></div>
                　 <div>①发布最新添加的<asp:TextBox ID="NewNum"  CssClass="textbox" style="text-align:center" runat="server" Width="43px">50</asp:TextBox>条专题
                    &nbsp;
                    <asp:Button ID="Button1" runat="server" Text="发布>>" CssClass="button" OnClick="Button1_Click" />
                   </div>
                   <div>
                       <br />
                       ②发布所选栏目的专题<asp:Button ID="Button4" runat="server" Text="发布选中栏目的项目>>" CssClass="button" OnClick="Button4_Click" />
                        </div>
                        <div>
                            <br />
                        
                          ③不限栏目发布所有专题<asp:Button ID="RefreshAllItemButton" CssClass="button" runat="server" Text="发布所有专题>>" OnClick="RefreshAllItemButton_Click" />
                          </div>
                </td>
              </tr>
                <tr>
                    <td class="righttd" style="padding-left:10px;">
                     <div><strong>发布专题栏目</strong></div>
                     
                    <div>
                        <br />
                        ①发布所选的专题栏目<asp:Button ID="Button2" runat="server" Text="发布选择>>" CssClass="button" OnClick="Button2_Click" />
                      </div>
                    <div>
                        <br />
                        ②发布所有专题栏目
                        <asp:Button ID="Button3" runat="server" Text="发布所有专题栏目>>" CssClass="button" OnClick="Button3_Click" />
                       </div>
                　 
                    </td>
                </tr>
               
          </table>
        
          </asp:Panel>
 
    
</asp:Content>

