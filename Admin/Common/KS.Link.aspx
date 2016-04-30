<%@ Page Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.Admin_FriendLink" Title="友情链接管理" Codebehind="KS.Link.aspx.cs" %>
<%@ Import Namespace="Kesion.Publics"%>
<asp:Content ID="Content1" ContentPlaceHolderID="KSContent" Runat="Server">
    <asp:Panel ID="ListPanel" runat="server" Width="100%">
    <div id="manage_top" class="menu_top_fixed">
       <ul>
           <li id='p1'><asp:LinkButton ID="addclassbutton" runat="server" OnClick="addclassbutton_Click"><b></b>添加链接</asp:LinkButton></li>
           <li id='p4'><asp:LinkButton ID="editclassbutton" runat="server" OnClick="editclassbutton_Click"><b></b>编辑链接</asp:LinkButton></li>
           <li id='p3'><asp:LinkButton ID="delclassbutton" runat="server" OnClick="delclassbutton_Click"><b></b>删除链接</asp:LinkButton></li>
           <li id='p5'><asp:LinkButton ID="topverifybutton" runat="server" OnClick="topverifybutton_Click"><b></b>审核链接</asp:LinkButton></li>
           <div id="go">
           <asp:DropDownList ID="ShowClassID" runat="server">
           </asp:DropDownList>
           </div>
           </ul>
    </div>  
<div class="menu_top_fixed_height"></div>  
<div class="tabs_header">
    <ul class="tabs">
    <li<%=KSCMS.S("showType")==""?" class='active'":string.Empty %>><a href="KS.Link.Aspx"><span>所有链接</span></a></li>
    <li<%=KSCMS.S("showType")=="1"?" class='active'":string.Empty %>><a href="KS.Link.Aspx?showType=1"><span>未审核的链接</span></a></li>
    <li<%=KSCMS.S("showType")=="2"?" class='active'":string.Empty %>><a href="KS.Link.Aspx?showType=2"><span>已审核的链接</span></a></li>
    <li<%=KSCMS.S("showType")=="3"?" class='active'":string.Empty %>><a href="KS.Link.Aspx?showType=3"><span>推荐的链接</span></a></li>
    <li<%=KSCMS.S("showType")=="4"?" class='active'":string.Empty %>><a href="KS.Link.Aspx?showType=4"><span>锁定的链接</span></a></li>
    </ul>
</div>
    
    <KS:ksgv id="List" cssclass="CTable" runat="server" AutoGenerateColumns="False" EmptyDataText="没有添加/申请任何友情链接站点!" PagerType="CustomNumeric" Width="99%"  GridLines="None" OnRowDataBound="List_RowDataBound" OnRowCommand="List_RowCommand" OnRowCreated="List_RowCreated" >
        <Columns>
            <asp:TemplateField HeaderText="选择">
                <itemstyle horizontalalign="Center" width="50px" />
                <itemtemplate>
                <input type="checkbox"  name="ids" id="ids" value="<%#Eval("linkid") %>" />
              </itemtemplate>
            </asp:TemplateField>
            <asp:BoundField HeaderText="站点名称" DataField="sitename" >
            </asp:BoundField>
            <asp:BoundField HeaderText="所属分类" DataField="classname" >
                <itemstyle width="80px" horizontalalign="Center" />
            </asp:BoundField>
            <asp:BoundField HeaderText="站长/单位" DataField="webmaster" >
                <itemstyle width="100px" horizontalalign="Center" />
            </asp:BoundField>
            <asp:BoundField HeaderText="链接类型" DataField="linktype" >
                <itemstyle width="100px" horizontalalign="Center" />
            </asp:BoundField>
            <asp:BoundField HeaderText="点击数" DataField="hits" >
                <itemstyle width="60px" horizontalalign="Center" />
            </asp:BoundField>

            <asp:TemplateField HeaderText="推荐">
              <itemstyle width="30px" horizontalalign="Center"/>
              <itemtemplate>
                   <a href="?action=recommend&linkid=<%#Eval("linkID")%>" <%# Convert.ToString(Eval("recommend"))=="0"?"class='no' title='否'":"class='ok' title='是'" %>></a>
              </itemtemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="锁定">
              <itemstyle width="30px" horizontalalign="Center"/>
              <itemtemplate>
                   <a href="?action=locked&linkid=<%#Eval("linkID")%>" <%# Convert.ToString(Eval("locked"))=="0"?"class='no' title='否'":"class='ok' title='是'" %>></a>
              </itemtemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="审核">
              <itemstyle width="30px" horizontalalign="Center"/>
              <itemtemplate>
                   <a href="?action=verify&linkid=<%#Eval("linkID")%>" <%# Convert.ToString(Eval("verify"))=="0"?"class='no' title='否'":"class='ok' title='是'" %>></a>
              </itemtemplate>
            </asp:TemplateField>

 
            <asp:BoundField HeaderText="序号" DataField="orderid" >
                <itemstyle width="50px" horizontalalign="Center" />
            </asp:BoundField>

            <asp:TemplateField HeaderText="修改">
              <itemstyle width="30px" horizontalalign="Center"/>
              <itemtemplate>
                    <asp:LinkButton CssClass="edit" ToolTip="修改" ID="LinkButton1" runat="server" commandargument=<%#Eval("linkid") %> commandname="modify"></asp:LinkButton>
              </itemtemplate>
            </asp:TemplateField>

            <asp:TemplateField HeaderText="删除">
                <itemstyle width="30px" horizontalalign="Center" />
             <itemtemplate>
             <asp:LinkButton runat="server" CssClass="delete" ToolTip="删除" id="delete" commandargument=<%#Eval("linkid") %> commandname="del"></asp:LinkButton>
             </itemtemplate>
             </asp:TemplateField>
        </Columns>
        <HeaderStyle CssClass="CTitle" />
            <PagerStyle CssClass="Page" HorizontalAlign="Right" />
            <EmptyDataRowStyle CssClass="emptycss" />
    </KS:ksgv>
            <asp:Panel ID="Panel1" runat="server" Height="30px" Width="741px">
              <div style="margin-top:5px;overflow:hidden;"></div>
            &nbsp;&nbsp;<input type="checkbox" name="chkall" id="chkall" onclick="CheckAll(this.form);"/><label for="chkall">全部选中</label>
            
            &nbsp;&nbsp;&nbsp;<input type="button" value="删除选中的站点" onmouseover="this.className='button_on';" onmouseout="this.className='button';" class="button" onclick="if (GetIDS('del')){this.form.action='?action=del';this.form.submit()}" />
                    <asp:Button ID="VerifyButton" runat="server" Text="批量审核" OnClick="VerifyButton_Click" />
           </asp:Panel>
           
           <KS:Page ID="Page1" runat="server" />
           
           
           
</asp:Panel>


     
    <asp:Panel ID="AddPanel" runat="server" Width="100%" Visible="false">
        <KS:TopNav ID="TopNav1" runat="server" Text="添加友情链接" />
        <script type="text/javascript">
	     function showlogoarea(val)
           {
              if (val=="1")
               jQuery("#logoarea").css('display','');
              else
               jQuery("#logoarea").css('display','none');
           }
       </script>
    <table width="99%" align="center" border="0" cellpadding="1" cellspacing="1" class="CTable"> 
          <tr>
            <td class="lefttd" height="30" align="right" style="width: 150px"><b>站点名称：</b></td>
            <td class="righttd">
                &nbsp;<asp:TextBox  CssClass="textbox" ID="SiteName" runat="server" Width="268px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="SiteName"
                    ErrorMessage="请填写站点名称!"></asp:RequiredFieldValidator></td>
          </tr>
        <tr>
            <td align="right" class="lefttd" height="30" style="width: 150px">
                <strong>站点分类：</strong></td>
            <td class="righttd">
                &nbsp;<asp:DropDownList CssClass="select" ID="ClassID" runat="server" Width="158px">
                </asp:DropDownList></td>
        </tr>
        <tr>
            <td align="right" class="lefttd" height="30" style="width: 150px">
                <strong>网站地址：</strong></td>
            <td class="righttd">
                &nbsp;<asp:TextBox  CssClass="textbox" ID="URL" Text="http://" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ControlToValidate="URL" ID="RequiredFieldValidator4" runat="server" ErrorMessage="请输入网站URL地址"></asp:RequiredFieldValidator></td>
        </tr>
        <tr>
            <td align="right" class="lefttd" height="30" style="width: 150px">
                <strong>站长/主办单位：</strong></td>
            <td class="righttd">
                &nbsp;<asp:TextBox  CssClass="textbox" ID="WebMaster" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="WebMaster"
                    ErrorMessage="请填写站长"></asp:RequiredFieldValidator></td>
        </tr>
        <tr>
            <td align="right" class="lefttd" height="30" style="width: 150px">
                <strong>联系邮箱：</strong></td>
            <td class="righttd">
                &nbsp;<asp:TextBox  CssClass="textbox" ID="Email" runat="server"></asp:TextBox>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="Email"
                    ErrorMessage="邮箱地址不正确" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator></td>
        </tr>
        <tr>
            <td align="right" class="lefttd" height="30" style="width: 150px">
                <strong>管理密码：</strong></td>
            <td class="righttd">
                &nbsp;<asp:TextBox  CssClass="textbox" ID="PassWord" TextMode="password" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="请输入前台管理密码" ControlToValidate="PassWord" Display="Dynamic"></asp:RequiredFieldValidator>
                <asp:Label ID="Label1" runat="server" Text="不修改请留空" Visible="False"></asp:Label></td>
        </tr>
        <tr>
            <td align="right" class="lefttd" height="30" style="width: 150px">
                <strong>确认密码：</strong></td>
            <td class="righttd">
                &nbsp;<asp:TextBox  CssClass="textbox" ID="RePassWord" TextMode="password" runat="server"></asp:TextBox>
                <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="PassWord"
                    ControlToValidate="RePassWord" ErrorMessage="两次输入的密码不一致!" Display="Dynamic"></asp:CompareValidator></td>
        </tr>
        <tr>
            <td align="right" class="lefttd" height="30" style="width: 150px">
                <strong>链接类型：</strong></td>
            <td class="righttd">
              <input id="LinkTypeTxt" type="radio" onclick="showlogoarea(0);" name="LinkType" runat="server" checked />文字链接
              <input id="LinkTypeLogo" type="radio" onclick="showlogoarea(1);" name="LinkType" runat="server" />Logo链接
               </td>
        </tr>
        <tr id="logoarea"  style="display:none">
            <td align="right" class="lefttd" height="30" style="width: 150px">
                <strong>站点Logo地址：</strong></td>
            <td class="righttd">
                 <table border="0" cellspacing="0" cellpadding="0">
                     <tr><td><asp:TextBox width="250px" CssClass="textbox" ID="Logo" runat="server"></asp:TextBox>                &nbsp;<input type="button" class="button" onclick="SelectFiles('<%=this.Logo.ClientID%>    ', 1);" value="选择Logo地址">
</td><td style="padding-top:12px;padding-left:4px;width:500px"> <%=Kesion.APPCode.UploadAPI.EchoUpload("common",this.Logo.ClientID) %></td></tr>
                 </table>
            </td>
        </tr>
        <tr>
            <td align="right" class="lefttd" style="width: 150px; height: 23px;">
                <strong>是否锁定：</strong></td>
            <td class="righttd" style="height: 23px">
                <asp:RadioButtonList ID="Locked" runat="server" RepeatDirection="Horizontal">
                    <asp:ListItem Value="1">是</asp:ListItem>
                    <asp:ListItem Selected="True" Value="0">否</asp:ListItem>
                </asp:RadioButtonList></td>
        </tr>
        <tr>
            <td align="right" class="lefttd" height="30" style="width: 150px">
                <strong>&nbsp;站点状态：</strong></td>
            <td class="righttd">
                <asp:RadioButtonList ID="Verify" runat="server" RepeatDirection="Horizontal">
                    <asp:ListItem Selected="True" Value="1">已审核</asp:ListItem>
                    <asp:ListItem Value="0">未审核</asp:ListItem>
                </asp:RadioButtonList></td>
        </tr>
        <tr>
            <td align="right" class="lefttd" height="30" style="width: 150px">
                <strong>是否推荐：</strong></td>
            <td class="righttd">
                <asp:RadioButtonList ID="Recommend" runat="server" RepeatDirection="Horizontal">
                    <asp:ListItem Value="1">是</asp:ListItem>
                    <asp:ListItem Selected="True" Value="0">否</asp:ListItem>
                </asp:RadioButtonList></td>
        </tr>
        <tr>
            <td align="right" class="lefttd" height="30" style="width: 150px">
            <b>站点介绍：</b>
            </td>
            <td class="righttd">
                <asp:TextBox  CssClass="textbox" ID="Description" TextMode="MultiLine" Width="420px" runat="server" Height="69px"></asp:TextBox></td>
        </tr>
        <tr>
            <td align="right" class="lefttd" height="30" style="width: 150px">
            <b>排列序号：</b>
            </td>
            <td class="righttd">
                <asp:TextBox  CssClass="textbox" ID="TxtOrderID" Width="50px" style="text-align:center" runat="server"></asp:TextBox> <span class="tips">Tips:序号越小排在越前面。</span></td>
        </tr>
      </table>
      <br />
        <KS:Foot ID="Foot1" runat="server" OnSubmit="Foot1_Submit" />
      
    </asp:Panel>

</asp:Content>
