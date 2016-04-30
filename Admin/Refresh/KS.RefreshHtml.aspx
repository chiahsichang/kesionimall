<%@ Page Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.Admin_Refresh_RefreshHtml" Title="Untitled Page" Codebehind="KS.RefreshHtml.aspx.cs" %>
<%@ Register Src="~/control/refresh/RefreshTopControl.ascx" TagName="RefreshTopNav" TagPrefix="uc1" %>
<%@ Import Namespace="Kesion.Cache" %>
<%@ Import Namespace="Kesion.Publics" %>
<asp:Content ID="Content1" ContentPlaceHolderID="KSContent" Runat="Server">
<uc1:RefreshTopNav ID="RefreshTopNavS1" runat="server"/>

 <!--    <KS:TopNav ID="TopNav1" runat="server" Text="生成静态页管理" />-->
        <asp:Panel ID="Panel1" runat="server" Width="100%">
           
           <div style="padding-left:5px"><asp:DropDownList ID="S_ChannelID" runat="server" style="width:200px">
          <asp:ListItem Value="0">---选择要发布的模型---</asp:ListItem>
          </asp:DropDownList> <font color=red>Tips:尽量按模型发布，可以取得更好的生成速度</font>
          </div>
          <table width="99%" align="center" border="0" cellpadding="1" cellspacing="1" class="CTable"> 
                <tr>
                    <td align="right" colspan="2" height="25" style="text-align: center">
                        <strong>
                     生成内容页静态HTML操作</strong></td>
                </tr>
                <tr>
                    <td align="right" class="lefttd" rowspan="6" style="width: 270px; text-align: center">
                        <b>请选择要发布的栏目<br />
                </b>
                <span style="color:mediumblue">
                    当没有选择任何栏目时，表示从所有栏目中筛选符合条件的记录进行生成HTML操作</span>&nbsp;

                    <Select style="WIDTH: 200px; HEIGHT: 218px;" multiple name="ClassID">
                    <%if (MyCache.GetCacheModel(ChannelID, 4) == "4")
                      {
                          Response.Write(MyCache.GetShopClassOptionList(ChannelID));
                      }
                      else
                      {
                          Response.Write(MyCache.GetClassOptionList(ChannelID));
                      }
                        %>
                </select>
                
                    <br />
                    <span style="color: #ff0066">提示：</span><span style="color: #ff0000">按住"CTRL"或"Shift"键可以进行多选<br />
                       </span></td>
                    <td class="righttd" valign="top" height="45" >
                        <strong>生成选项<br />
                        </strong><asp:RadioButtonList ID="RefreshTF" runat="server" RepeatDirection="Horizontal">
                                <asp:ListItem Value="0" Selected="True">发布所有项目</asp:ListItem>
                                <asp:ListItem Value="1">仅发布未生成过HTML的项目</asp:ListItem>
                            </asp:RadioButtonList><span style="color: #0000cd"></span></td>
                </tr>
              <tr>
                <td class="righttd" height="45">
                    &nbsp;①发布最新添加的<asp:TextBox CssClass="textbox" ID="NewNum" runat="server" Width="43px">50</asp:TextBox>
                    <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>&nbsp;
                    <asp:Button ID="Button1" runat="server" Text="发布>>" CssClass="button" OnClick="Button1_Click" /></td>
              </tr>
                <tr>
                    <td class="righttd" style="height: 84px">
                        &nbsp;②按ID号发布，从<asp:TextBox CssClass="textbox" ID="StartID" runat="server" Width="120px">1</asp:TextBox>到<asp:TextBox
                             CssClass="textbox" ID="EndID" runat="server" Width="120px">100</asp:TextBox>
                        <asp:Button ID="Button2" runat="server" Text="发布>>" CssClass="button" OnClick="Button2_Click" /></td>
                </tr>
                <tr>
                    <td class="righttd" height="45">
					    <table width="100%">
						 <tr><td width="80">&nbsp;③按日期发布</td>
						 <td width="220" style="line-height:32px;">开始日期：<asp:TextBox  CssClass="textbox Wdate" ID="StartDate" runat="server" onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'});" Width="150px"></asp:TextBox>
                           <br/>
                        结束日期：<asp:TextBox  CssClass="textbox Wdate" ID="EndDate" runat="server" onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'});" Width="150px"></asp:TextBox>
						 </td>
						 <td align="left"><asp:Button ID="Button3" runat="server" Text="发布>>" CssClass="button" OnClick="Button3_Click" /></td>
						 </tr>
						 </table>
						 </td>
                </tr>
                <tr>
                    <td class="righttd" height="45">
                        &nbsp;④发布所选栏目的<asp:Label ID="Label2" runat="server" Text="Label"></asp:Label>
                        <asp:Button ID="Button4" runat="server" Text="发布选中栏目的项目>>" CssClass="button" OnClick="Button4_Click" /></td>
                </tr>
            <tr>
                <td class="righttd" height="45">
                    &nbsp;⑤不限栏目发布所有<asp:Label ID="Label3" runat="server" Text="Label"></asp:Label>
                    <asp:Button ID="RefreshAllItemButton" CssClass="button" runat="server" Text="生成所有>>" OnClick="RefreshAllItemButton_Click" /></td>
            </tr>
            <%if (MyCache.GetCacheModel(ChannelID, 4) == "4"){
                  Response.Write("<tbody style='display:none'>");
              }else{
                  Response.Write("<tbody>");
              }%>
                <tr>
                    <td align="right"  colspan="2" height="25" style="text-align: center">
                        <strong>生成栏目页静态HTML操作</strong></td>
                </tr>
                <tr>
                    <td align="right" class="lefttd" style="width: 270px; text-align: center;" rowspan="2">
                        <strong>请选择要发布的栏目<br />
                        </strong><span style="color: #0000cd">当没有选择任何栏目时，将发布所有栏目<br />
                        </span>
                        <Select style="WIDTH: 200px; HEIGHT: 180px" multiple size=2 name="ClassID">
                            <%=MyCache.GetClassOptionList(ChannelID) %>
                        </select>
                        <br />
                        <span style="color: #ff0000">提示：</span><span style="color: #ff0000">按住"CTRL"或"Shift"键可以进行多选</span></td>
                    <td class="righttd" rowspan="2">
                       <input type="radio" name="fsotype" value="1" id="fsotype1" /><label for="fsotype1">生成每个栏目的列表分页<font color=red>（较占用资源）</font></label><br />
                       
                       <input type="radio" name="fsotype" value="2" checked="CHECKED" id="fsotype2"/><label for="fsotype2">仅发布更新每个列表页的前<asp:TextBox ID="FsoListNum"
                          CssClass="textbox" style="text-align:center"  runat="server" Width="35px">3</asp:TextBox>页</label>
                        &nbsp;<br />
                        <br />
                        &nbsp;<asp:Button ID="Button5" runat="server" Text="发布栏目操作>>" CssClass="button" OnClick="Button5_Click" />
                        <br />
                        <br />
                        </td>
                </tr>
                </tbody>
          </table>
        </asp:Panel>
        
       
    
</asp:Content>

