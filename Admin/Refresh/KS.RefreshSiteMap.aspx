<%@ Page Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.Admin_Refresh_RefreshSiteMap" Title="Untitled Page" Codebehind="KS.RefreshSiteMap.aspx.cs" %>
<%@ Register Src="~/control/refresh/RefreshTopControl.ascx" TagName="RefreshTopNav" TagPrefix="uc1" %>
<%@ Import Namespace="Kesion.Cache" %>
<asp:Content ID="Content1" ContentPlaceHolderID="KSContent" Runat="Server">
<uc1:RefreshTopNav ID="RefreshTopNavS1" runat="server"/>
           
     <span style="display:none">
          <table width="99%"  border="0" cellpadding="1" cellspacing="1" class="CTable"> 
                <tr>
                    <td height="25" style="text-align: left;">
                        <strong>Google地图生成操作</strong><span class="tips">(生成符合GOOGLE规范的XML格式地图页面)</span></td>
                </tr>

                <tr class="lefttd">
                    <td align="right" style="text-align: left; height: 30px;padding:10px;line-height:30px; width: 751px;">
                     更新频率：<asp:DropDownList ID="DrpChangeFreq" runat="server">
                             <asp:ListItem Value="always">频繁的更新</asp:ListItem>
                             <asp:ListItem Value="hourly">每小时更新</asp:ListItem>
                             <asp:ListItem Value="daily" Selected="true">每日更新</asp:ListItem>
                             <asp:ListItem Value="weekly">每周更新</asp:ListItem>
                             <asp:ListItem Value="monthly">每月更新</asp:ListItem>
                             <asp:ListItem Value="yearly">每年更新</asp:ListItem>
                             <asp:ListItem Value="never">从不更新</asp:ListItem>
                        </asp:DropDownList>
                        <br />
                        调用信息条数：<asp:TextBox  CssClass="textbox" ID="TxtNum" runat="server" Width="50px">100</asp:TextBox>条<br />
                        注 意 度：<asp:TextBox  CssClass="textbox" ID="TxtBig" runat="server" Width="50px">0.5</asp:TextBox>0-1.0之间,推荐使用默认值</td>
                </tr>
          </table>
              <asp:PlaceHolder ID="PlaceHolder1" runat="server"><asp:Button ID="Button1" runat="server" CssClass="button" Text="开始生成Google地图" OnClick="Button1_Click" /></asp:PlaceHolder>     
     </span>   
    
                <div style="text-align:center;margin:5px">
      
        <br />
        <table width="99%"  border="0" cellpadding="1" cellspacing="1" class="CTable"> 
                <tr>
                    <td  colspan="2" height="25" style="text-align: left; ">
                        <strong>360搜索/百度搜索Sitemap生成操作</strong><span class="tips">(生成符合<a href="http://zhanzhang.baidu.com/wiki/93" target="_blank">百度Sitemap</a>及<a href="http://www.so.com/help/help_3_3.html#sitemapdata" target="_blank">360搜索Sitemap</a>格式的网站地图)</span></td>
                </tr>

                <tr>
                    <td align="right"  class="lefttd">生成文档数：</td>
                    <td align="left">
                         <asp:TextBox  CssClass="textbox" ID="TxtNum2" runat="server" Width="80px" style="text-align:center">10000</asp:TextBox>条 <span class="tips">(不超过50000条)</span>
                    </td>
                </tr>
                <tr>
                    <td align="right" class="lefttd">生成格式：</td>
                    <td align="left">
                        <asp:RadioButtonList ID="RdbFsoType2" runat="server" RepeatDirection="Horizontal">
                               <asp:ListItem Value="0" Selected="True">Txt格式</asp:ListItem>
                            <asp:ListItem Value="1">Xml格式</asp:ListItem>
                             </asp:RadioButtonList>
                    </td>
                </tr>
               <tr>
                    <td align="right"  class="lefttd">生成文件名：</td>
                    <td align="left">
                         <asp:TextBox  CssClass="textbox" ID="TxtFileName2" runat="server" Width="250px">Sitemap</asp:TextBox> <span class="tips">如：sitemap,news等。</span>
                    </td>
                </tr>
                       
          </table>
        </div>
          <div style="padding-left:140px;margin:35px">
          <asp:PlaceHolder ID="PlaceHolder2" runat="server">
            <asp:Button ID="Button2" runat="server" CssClass="button" Text="开始生成360搜索/百度搜索Sitemap" OnClick="Button2_Click" />
            </asp:PlaceHolder>
        </div>
        <br />
        <br />
        <br />
               
    
</asp:Content>

