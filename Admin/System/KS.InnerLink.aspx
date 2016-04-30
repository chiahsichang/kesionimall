<%@ Page Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.Admin_InnerLink" Title="Untitled Page" Codebehind="KS.InnerLink.aspx.cs" %>
<asp:Content ID="Content1" ContentPlaceHolderID="KSContent" Runat="Server">
    <asp:Panel ID="listPanel" runat="server" Width="100%">
       <div id="manage_top" class="menu_top_fixed">
         <ul>
           <li id='p1'><asp:LinkButton ID="addlink" runat="server" OnClick="addlink_Click"><b></b>添加</asp:LinkButton></li>
           <li id='p4'><asp:LinkButton ID="editlink" runat="server" OnClick="editlink_Click"><b></b>编辑</asp:LinkButton></li>
           <li id='p3'><asp:LinkButton ID="dellink" runat="server" OnClick="dellink_Click"><b></b>删除</asp:LinkButton></li>
           <li id='p16'><asp:LinkButton ID="lockLink" runat="server" OnClientClick="return(GetIDS());" OnClick="LockButton_Click"><b></b>锁定</asp:LinkButton></li>
           <li id='p17'><asp:LinkButton ID="unlockLink" runat="server" OnClientClick="return(GetIDS());" OnClick="UnlockButton_Click"><b></b>解锁</asp:LinkButton></li>

         </ul>
        </div> 
         <div class="menu_top_fixed_height"></div>   
        <KS:KSGV ID="list" cssclass="CTable" runat="server" Width="99%" AutoGenerateColumns="False" EmptyDataText="暂无内部链接!" GridLines="None" OnRowDataBound="list_RowDataBound"  OnRowCommand="list_RowCommand" OnRowCreated="list_RowCreated">
            <Columns>
               <asp:TemplateField HeaderText="&lt;input type='checkbox' name='chkall' id='chkall' onclick='CheckAll(this.form);'/&gt;">
                <itemstyle horizontalalign="Center" width="50px" />
                <itemtemplate>
                    <input type="checkbox"  name="ids" id="ids" value="<%#Eval("linkid") %>" />
                </itemtemplate>
              </asp:TemplateField>
                <asp:BoundField DataField="LinkText" HeaderText="链接名称">
                    <itemstyle width="200px" />
                </asp:BoundField>
                <asp:TemplateField HeaderText="链接地址">
                <itemstyle horizontalalign="Left" />
                <itemtemplate>
                <a href='<%#Eval("LinkUrl") %>' target="_blank"><%#Eval("LinkUrl") %></a>
                </itemtemplate>
              </asp:TemplateField>

                <asp:BoundField DataField="OpenType" HeaderText="目标窗口">
                    <itemstyle width="100px" />
                </asp:BoundField>
                <asp:BoundField DataField="status" HeaderText="状态">
                    <itemstyle width="60px" horizontalalign="Center" />
                </asp:BoundField>

              <asp:TemplateField HeaderText="编辑">
                <itemstyle horizontalalign="Center" width="25"/>
                <itemtemplate>
                <asp:LinkButton CssClass="edit" ToolTip="编辑" ID="LinkButton1" runat="server" commandargument=<%#Eval("linkid") %> commandname="modify"><img src="../../admin/images/Edit.gif" border="0"  /></asp:LinkButton>
               </itemtemplate>
             </asp:TemplateField>
              <asp:TemplateField HeaderText="删除">
                <itemstyle horizontalalign="Center" width="25"/>
                <itemtemplate>
                <asp:LinkButton CssClass="delete" ToolTip="删除" runat="server" id="delete" commandargument=<%#Eval("linkid") %> commandname="del"><img src="../../admin/images/del.gif" border="0" /></asp:LinkButton>
               </itemtemplate>
             </asp:TemplateField>

                
                <asp:TemplateField HeaderText="状态">
                <itemstyle width="25px" horizontalalign="Center" />
             <itemtemplate>
             <asp:LinkButton runat="server" id="lock" commandargument=<%#Eval("linkid") %> commandname="status"></asp:LinkButton>
            </itemtemplate>
            </asp:TemplateField>
            
            </Columns>
           
            <HeaderStyle CssClass="CTitle" />
            <EmptyDataRowStyle CssClass="emptycss" />
      </KS:KSGV>
         <KS:Page ID="Page1" runat="server" />

        <script type="text/javascript">
		showtips(' <span class="state"><strong>说明：</strong><br /></span>1、站内链接用于给新闻内容的相关联文字添加链接;<br />2、添加或修改内部链接需要重新生成所有页面才能生效，否则仅对新添加的信息有效;<br/>3、每个关键字建议设置只替换一次。<br />');
		</script>

    </asp:Panel>
    
    <asp:Panel ID="addPanel" runat="server" Width="100%" Visible="false">
        <KS:TopNav ID="TopNav1" runat="server" Text="添加内部链接" />
        <table width="100%" border="0" cellpadding="1" cellspacing="1" class="CTable"> 
          <tr>
            <td class="lefttd" height="30" align="right" style="width: 198px"><b>链接名称：</b></td>
            <td class="righttd">
                &nbsp;<asp:TextBox CssClass="textbox" Width="350" ID="LinkText" runat="server"></asp:TextBox> <font color=#ff0000>*</font>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="LinkText"
                    ErrorMessage="请输入链接名称!"></asp:RequiredFieldValidator></td>
          </tr>    
            <tr>
                <td align="right" class="lefttd" height="30" style="width: 198px">
                    <strong>链接地址：</strong></td>
                <td class="righttd">
                     &nbsp;<asp:TextBox CssClass="textbox" Width="350" ID="LinkUrl" runat="server">http://</asp:TextBox></td>
            </tr>
            <tr>
                <td align="right" class="lefttd" height="30" style="width: 198px">
                    <strong>链接目标：</strong></td>
                <td class="righttd">
                     &nbsp;<asp:DropDownList CssClass="textbox" ID="OpenType" runat="server">
                        <asp:ListItem>_blank</asp:ListItem>
                        <asp:ListItem>_parent</asp:ListItem>
                        <asp:ListItem>_self</asp:ListItem>
                        <asp:ListItem>_top</asp:ListItem>
                    </asp:DropDownList></td>
            </tr>
            <tr>
                <td align="right" class="lefttd" height="30" style="width: 198px">
                    <strong>链接颜色：</strong></td>
                <td class="righttd">
                        &nbsp;<asp:TextBox CssClass="textbox" ID="LinkColor" runat="server" Width="73px"></asp:TextBox>
                       <img border=0 id="Img1" src="../../admin/images/<%=string.IsNullOrEmpty(LinkColor.Text)?"RectNoColor.gif":"rect.gif" %>" style="cursor:pointer;background-Color:<%=LinkColor.Text %>;" onClick="Getcolor('Img1','Img1|<%=LinkColor.ClientID %>');" title="选取颜色">&nbsp;
                    不设颜色请留空。</td>
            </tr>
            <tr>
                <td align="right" class="lefttd" height="30" style="width: 198px">
                    <strong>链接状态：</strong></td>
                <td class="righttd">
                   <asp:RadioButtonList ID="Status" runat="server" RepeatDirection="Horizontal">
                        <asp:ListItem Selected="True" Value="1">正常</asp:ListItem>
                        <asp:ListItem Value="0">锁定</asp:ListItem>
                    </asp:RadioButtonList></td>
            </tr>
             <tr style="display:none">
                <td align="right" class="lefttd" height="30" style="width: 198px">
                    <strong>替换次数：</strong></td>
                <td class="righttd">
                   <asp:RadioButtonList ID="RdbTimes" runat="server" RepeatDirection="Horizontal">
                        <asp:ListItem Selected="True" Value="1">仅替换一次</asp:ListItem>
                        <asp:ListItem Value="0">不限次数</asp:ListItem>
                    </asp:RadioButtonList></td>
            </tr>
        </table>
        <br />
        <KS:Foot ID="Foot1" runat="server" OnSubmit="Foot1_Submit" />
    </asp:Panel>
 
 
</asp:Content>

