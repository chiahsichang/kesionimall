<%@ Page Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.Admin_SpecialClass" Title="Untitled Page" Codebehind="KS.SpecialClass.aspx.cs" %>
<asp:Content ID="Content1" ContentPlaceHolderID="KSContent" Runat="Server">
       <asp:Panel ID="ShowPannel" runat="server" Width="100%">
       <div id="manage_top">
           <ul>
           <li id='p1'><b></b><asp:LinkButton ID="addbutton" runat="server" OnClick="addspecial_Click">添加专题分类</asp:LinkButton></li><li id='p4'><b></b><asp:LinkButton ID="editbutton" runat="server" OnClick="editbutton_Click">编辑专题分类</asp:LinkButton></li>
           <li id='p3'><b></b><asp:LinkButton ID="delbutton" runat="server" OnClick="delbutton_Click">删除专题分类</asp:LinkButton></li>
           <li id='p5'><b></b><a href="KS.Special.aspx">返回专题管理</a></li>
           </ul>
       </div>
  <div class="menu_top_fixed_height"></div>

        <KS:KSGV ID="list" CssClass="CTable" runat='server' AutoGenerateColumns="False" GridLines="None" 
               PagerType="CustomNumeric" Width="99%" OnRowDataBound="list_RowDataBound" 
               OnRowCommand="list_RowCommand" OnRowCreated="list_RowCreated" 
               EmptyDataText="还没有添加任何专题分类！">
        <Columns>
                             <asp:TemplateField HeaderText="选择">
                             <itemstyle horizontalalign="Center" width="50px" />
                            <itemtemplate>
                            <input type="checkbox"  name="ids" id="ids" value="<%#Eval("classid") %>" />
                           </itemtemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="ClassID" HeaderText="ID">
                                <itemstyle horizontalalign="Center" width="50px" />
                            </asp:BoundField>
                            
                            <asp:TemplateField HeaderText="分类名称">
                             <itemstyle horizontalalign="left" />
                            <itemtemplate>
                           <span class="folder"></span>
                            <a href='../../model/topiclist.aspx?id=<%#Eval("classid") %>' target="_blank"><%#Eval("ClassName") %></a>
                           </itemtemplate>
                            </asp:TemplateField>
                            
                            <asp:TemplateField HeaderText="专题数">
                             <itemstyle horizontalalign="center" width="100px" />
                            <itemtemplate>
                           <span style="font-weight:bold;font-size:13px;color:green"><%# GetSpecialNum(Convert.ToInt32(Eval("classid"))) %></span> 个
                           </itemtemplate>
                            </asp:TemplateField>
                            

                            <asp:BoundField DataField="ClassEname" HeaderText="英文名称">
                                <itemstyle width="70px" horizontalalign="Center"/>
                            </asp:BoundField>
                           
                            <asp:BoundField HeaderText="序号" DataField="OrderID">
                                <itemstyle horizontalalign="Center" width="60px" />
                            </asp:BoundField>

                            <asp:TemplateField HeaderText="修改">
                              <itemstyle width="30px" horizontalalign="Center"/>
                              <itemtemplate>
                             <asp:LinkButton ID="LinkButton1" CssClass="edit" runat="server" commandargument=<%#Eval("classid") %> commandname="modify" ToolTip="修改"></asp:LinkButton>
                              </itemtemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="删除">
                              <itemstyle width="30px" horizontalalign="Center"/>
                              <itemtemplate>
                            <asp:LinkButton runat="server" id="delete" CssClass="delete" ToolTip="删除" commandargument=<%#Eval("classid") %> commandname="del"></asp:LinkButton>
                              </itemtemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="预览">
                             <itemstyle Width="30px" horizontalalign="Center"/>
                                <itemtemplate>
                             <a class="preview"  title="预览" href='../../model/topiclist.aspx?id=<%#Eval("classid") %>' target="_blank"></a>
                            </itemtemplate>
                            </asp:TemplateField>
                        </Columns>
                        <HeaderStyle CssClass="CTitle" />
                        <EmptyDataRowStyle CssClass="emptycss" />
                    </KS:KSGV>
                    
                    <KS:Page ID="Page1" runat="server" />

       </asp:Panel>
       
       <asp:Panel ID="AddPannel" runat="server" Visible="false" Width="100%">
       <KS:TopNav ID="TopNav1" runat="server" Text="添加专题分类" />
    <table width="99%" align="center" border="0" cellpadding="1" cellspacing="1" class="CTable"> 
          <tr>
            <td class="lefttd" height="30" align="right" style="width: 139px"><b>专题分类名称：</b></td>
            <td class="righttd">
                &nbsp;<asp:TextBox ID="ClassName" CssClass="textbox" runat="server" Width="268px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="ClassName"
                    ErrorMessage="请填写类别名称!" Display="Dynamic"></asp:RequiredFieldValidator></td>
          </tr>
        <tr>
            <td align="right" class="lefttd" height="30" style="width: 139px">
                <strong>分类英文名称：</strong></td>
            <td class="righttd">
                &nbsp;<asp:TextBox ID="ClassEname" CssClass="textbox" runat="server" Width="268px"></asp:TextBox>
                <asp:RequiredFieldValidator
                    ID="RequiredFieldValidator2" ControlToValidate="ClassEname" runat="server" ErrorMessage="输入分类英文名称" Display="Dynamic"></asp:RequiredFieldValidator></td>
        </tr>
        <tr>
            <td align="right" class="lefttd" height="30" style="width: 139px">
                <strong>生成分类扩展名：</strong></td>
            <td class="righttd">
                &nbsp;<asp:DropDownList CssClas="select" ID="FsoIndex" runat="server">
                <asp:ListItem Value="index.html">index.html</asp:ListItem>
                <asp:ListItem Value="index.htm">index.htm</asp:ListItem>
                <asp:ListItem Value="index.shtml">index.shtml</asp:ListItem>
                <asp:ListItem Value="index.shtm">index.shtm</asp:ListItem>
                <asp:ListItem Value="default.html">default.html</asp:ListItem>
                <asp:ListItem Value="default.htm">default.htm</asp:ListItem>
                <asp:ListItem Value="default.shtml">default.shtml</asp:ListItem>
                <asp:ListItem Value="default.shtm">default.shtm</asp:ListItem>
                </asp:DropDownList></td>
        </tr>
        <tr>
            <td align="right" class="lefttd" height="30" style="width: 139px">
                <strong>分类图片：</strong></td>
            <td class="righttd">
                &nbsp;<asp:TextBox CssClass="textbox" ID="TxtPhotoUrl" runat="server" Width="268px"></asp:TextBox>
                <input type="button" class="button" onclick="SelectFiles('<%=this.TxtPhotoUrl.ClientID %>',0);" value="选择图片...">
                 </td>
        </tr>

        <tr>
            <td align="right" class="lefttd" height="30" style="width: 139px">
                <strong>专题列表页模板：</strong></td>
            <td class="righttd">
                &nbsp;<asp:TextBox CssClass="textbox" ID="TemplateFile" runat="server" Width="268px"></asp:TextBox>
                <input type="button" class="button" onmouseover="this.className='button_on';" onmouseout="this.className='button';" value="选择模板..." onClick="SelectTemplate('<%=this.TemplateFile.ClientID %>');"/>
                 <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="TemplateFile"
                    Display="Dynamic" ErrorMessage="请选择模板"></asp:RequiredFieldValidator></td>
        </tr>
        <tr>
            <td align="right" class="lefttd" height="30" style="width: 139px">
            <b>分类描述：</b>
            </td>
            <td class="righttd">
               &nbsp;<asp:TextBox CssClass="textbox" ID="Description" TextMode="MultiLine" Width="504px" runat="server" Height="100px"></asp:TextBox>

                <a class="textarea_min" href="javascript:zoomtextarea(-5,'<%=this.Description.ClientID %>');"> </a>
                <a class="textarea_max" href="javascript:zoomtextarea(5,'<%=this.Description.ClientID %>');"> </a>
            </td>
        </tr>
        <tr>
            <td align="right" class="lefttd" height="30" style="width: 139px">
                <strong>排列序号：</strong></td>
            <td class="righttd">&nbsp;<asp:TextBox CssClass="textbox" ID="OrderID" runat="server" Width="58px"></asp:TextBox>序号超小，排在超前面<asp:RegularExpressionValidator
                        ID="RegularExpressionValidator1" runat="server" ErrorMessage="只能输入数字" ControlToValidate="OrderID" Display="Dynamic" ValidationExpression="\d{1,4}"></asp:RegularExpressionValidator>
                <asp:RequiredFieldValidator
                    ID="RequiredFieldValidator3" ControlToValidate="OrderID" runat="server" ErrorMessage="请输入序号" Display="Dynamic"></asp:RequiredFieldValidator></td>
        </tr>
      </table>
      <br />
        <KS:Foot ID="Foot1" runat="server" OnSubmit="Foot1_Submit" />
       </asp:Panel>
</asp:Content>

