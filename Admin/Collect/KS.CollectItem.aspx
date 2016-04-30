<%@ Page Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="True" Inherits="Kesion.NET.WebSite.Admin_CollectItem" Title="采集项目管理" Codebehind="KS.CollectItem.aspx.cs" %>
<asp:Content ID="Content1" ContentPlaceHolderID="KSContent" Runat="Server">
    <asp:Panel ID="ListPanel" runat="server" Width="100%">
    <div id="manage_top" class="menu_top_fixed">
       <ul>
           <li id='p1'><asp:LinkButton ID="addclassbutton" runat="server" OnClick="addclassbutton_Click"><b></b>添加采集项目</asp:LinkButton></li>
           <li id='p4'><asp:LinkButton ID="editclassbutton" runat="server" OnClick="editclassbutton_Click"><b></b>编辑项目</asp:LinkButton></li>
           <li id='p3'><asp:LinkButton ID="delclassbutton" runat="server" OnClick="delclassbutton_Click"><b></b>删除项目</asp:LinkButton></li>
           <li id='p5'><asp:LinkButton ID="topverifybutton" runat="server" OnClick="topverifybutton_Click"><b></b>开始采集</asp:LinkButton></li><div id="go">
           <asp:DropDownList ID="ShowClassID" runat="server">
           </asp:DropDownList>
           </div>
           </ul>
    </div> 
     <div class="menu_top_fixed_height"></div>   
    <KS:ksgv id="List" cssclass="CTable" runat="server" AutoGenerateColumns="False" EmptyDataText="没有添加任何采集项目!" PagerType="CustomNumeric" Width="99%" HorizontalAlign="center" GridLines="None" OnRowDataBound="List_RowDataBound" OnRowCommand="List_RowCommand" OnRowCreated="List_RowCreated" AllowPaging="False">
        <Columns>
            <asp:TemplateField HeaderText="选择">
                <itemstyle horizontalalign="Center" width="50px" />
                
                <itemtemplate>
<input type="checkbox"  name="ids" id="ids" value="<%#Eval("ItemID") %>" />
            
</itemtemplate>
            </asp:TemplateField>

            <asp:BoundField HeaderText="项目名称" DataField="ItemName" >
             <itemstyle width="180px"/>
            </asp:BoundField>

            <asp:TemplateField HeaderText="目标站点名称">
              <itemstyle />
              <itemtemplate>
              <span class="tips"><%# Eval("SiteName")%></span>
              </itemtemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="上次采集时间">
              <itemstyle width="130px" horizontalalign="Center"/>
              <itemtemplate>
              <span class="tips"><%# Eval("LastCollectTime") %></span>
              </itemtemplate>
            </asp:TemplateField>



            <asp:TemplateField HeaderText="状态">
                <ItemStyle  HorizontalAlign="Center" Width="60px" />
                    <ItemTemplate>
                   <a href="javascript:;" <%# Convert.ToString(Eval("IsCanCollect"))=="0"?"class='no' title='否'":"class='ok' title='是'" %>></a>
                 </ItemTemplate>
                </asp:TemplateField>

 

            <asp:TemplateField HeaderText="编辑">
              <itemstyle width="30px" horizontalalign="Center"/>
              <itemtemplate>
               <asp:LinkButton ToolTip="编辑" CssClass="edit" ID="LinkButton1" runat="server" commandargument=<%#Eval("itemid") %> commandname="modify"></asp:LinkButton>
              </itemtemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="删除">
              <itemstyle width="30px" horizontalalign="Center"/>
              <itemtemplate>
             <asp:LinkButton runat="server" CssClass="delete" ToolTip="删除" id="delete" commandargument=<%#Eval("itemid") %> commandname="del"></asp:LinkButton><br />
              </itemtemplate>
            </asp:TemplateField>

            <asp:TemplateField HeaderText="↓管理操作">
                <itemstyle width="120px" horizontalalign="Center" />
             <itemtemplate>
             <asp:LinkButton runat="server" id="test" commandargument=<%#Eval("itemid") %> commandname="test">测试</asp:LinkButton>
             <asp:LinkButton runat="server" id="collect" commandargument=<%#Eval("itemid") %> commandname="collect">采集</asp:LinkButton>
             <asp:LinkButton runat="server" id="copy" commandargument=<%#Eval("itemid") %> commandname="copy">复制</asp:LinkButton>
            
            
</itemtemplate>
           
            </asp:TemplateField>
        </Columns>
        <HeaderStyle CssClass="CTitle" />
            <EmptyDataRowStyle CssClass="emptycss" />
    </KS:ksgv>
            <asp:Panel ID="Panel1" runat="server" Height="30px" Width="741px">
              <div style="margin-top:5px;overflow:hidden;"></div>
            &nbsp;&nbsp;<input type="checkbox" name="chkall" id="chkall" onclick="CheckAll(this.form);"/><label for="chkall">全部选中</label>
            
            <input type="button" value="删除选中的项目" onmouseover="this.className='button_on';" onmouseout="this.className='button';" class="button" onclick="if (GetIDS('del')){this.form.action='?action=del';this.form.submit()}" />
                    <asp:Button ID="CollectButton" runat="server" Text="批量采集" OnClick="CollectButton_Click" />
<KS:Page ID="Page1" runat="server" />
           </asp:Panel>
</asp:Panel>


     
    <asp:Panel ID="PannelStep1" runat="server" Width="100%" Visible="false">
        <KS:TopNav ID="TopNav1" runat="server" Text="添加采集项目第一步" />
    <table width="99%" align="center" border="0" cellpadding="1" cellspacing="1" class="CTable"> 
          <tr>
            <td class="lefttd" align="right" style="height:30px;width: 198px"><b>采集项目名称：</b></td>
            <td class="righttd">
                &nbsp;<asp:TextBox CssClass="textbox" ID="ItemName" runat="server" Width="268px"></asp:TextBox>
                <span style="color: #009900">如：新闻栏目采集等</span><asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="ItemName"
                    ErrorMessage="请填写采集项目名称!"></asp:RequiredFieldValidator></td>
          </tr>
        <tr>
            <td align="right" class="lefttd" style="height:30px;width: 198px">
                <strong>模型设置：</strong></td>
            <td class="righttd">
                &nbsp;<asp:DropDownList ID="ModelID" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ModelID_SelectedIndexChanged">
                </asp:DropDownList></td>
        </tr>
        <tr>
            <td align="right" class="lefttd" style="height:30px;width: 198px">
                <strong>信息入库栏目：</strong></td>
            <td class="righttd">
             <span id="ClassArea" runat="server"></span>
                </td>
        </tr>
        <tr>
            <td align="right" class="lefttd" style="height:30px;width: 198px">
                <strong>目标站点名称：</strong></td>
            <td class="righttd">
                &nbsp;<asp:TextBox CssClass="textbox" ID="SiteName" runat="server"></asp:TextBox>
                如：网易163等<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="SiteName"
                    ErrorMessage="请填写目标站点名称!"></asp:RequiredFieldValidator></td>
        </tr>
        <tr>
            <td align="right" class="lefttd" style="height:30px;width: 198px">
                <strong>采集目标URL：</strong></td>
            <td class="righttd">
                &nbsp;<asp:TextBox CssClass="textbox" ID="SiteURL" Width="350px" Text="http://" runat="server"></asp:TextBox>
                如：http://www.kesion.com/news/index.html<asp:RequiredFieldValidator ControlToValidate="SiteURL" ID="RequiredFieldValidator4" runat="server" ErrorMessage="请输入目标网站URL地址"></asp:RequiredFieldValidator></td>
        </tr>
        <tr>
            <td align="right" class="lefttd" style="height:30px;width: 198px">
                <strong>编码方式：</strong></td>
            <td class="righttd">
                &nbsp;<asp:DropDownList ID="Encoding" runat="server">
                    <asp:ListItem Value="0">自动检测</asp:ListItem>
                    <asp:ListItem>UTF-8</asp:ListItem>
                    <asp:ListItem>GB2312</asp:ListItem>
                    <asp:ListItem>BIG5</asp:ListItem>
                </asp:DropDownList></td>
        </tr>
        <tr>
            <td align="right" class="lefttd" style="height:30px;width: 198px">
                <strong>设置属性：</strong></td>
            <td class="righttd">
                <asp:CheckBoxList ID="Attribute" runat="server" RepeatDirection="Horizontal">
                    <asp:ListItem Value="1">推荐</asp:ListItem>
                    <asp:ListItem Value="2">热点</asp:ListItem>
                    <asp:ListItem Value="3">精彩</asp:ListItem>
                    <asp:ListItem Value="4">头条</asp:ListItem>
                    <asp:ListItem Value="5">滚动</asp:ListItem>
                    <asp:ListItem Value="6">幻灯</asp:ListItem>
                    <asp:ListItem Value="7" Selected="True">允许评论</asp:ListItem>
                    <asp:ListItem Selected="True" Value="8">审核通过</asp:ListItem>
                    <asp:ListItem Value="9" Selected="True">显示在手机版</asp:ListItem>
                </asp:CheckBoxList></td>
        </tr>
        <tr>
            <td align="right" class="lefttd" style="height:30px;width: 198px">
                <strong>采集选项：</strong></td>
            <td class="righttd">
                <asp:CheckBoxList ID="CollectionOption" runat="server" RepeatDirection="Horizontal">
                    <asp:ListItem Value="1">保存图片到本地</asp:ListItem>
                    <asp:ListItem Selected="True" Value="2">立即生成HMTL</asp:ListItem>
                    <asp:ListItem Value="3" Selected>已存在主表的同名记录跳过</asp:ListItem>
                    <asp:ListItem Value="4">倒序采集</asp:ListItem>
                    <asp:ListItem Value="5">自动设置首页图片</asp:ListItem>
                </asp:CheckBoxList>
               <strong>暂停设置：</strong>
                
               每采集<asp:TextBox CssClass="textbox" ID="PausePerNum" Text="100" Width="40px" runat="server"></asp:TextBox>条记录暂停<asp:TextBox  CssClass="textbox" ID="PauseTime" Width="40px" Text="2" runat="server"></asp:TextBox>秒
                
                </td>
        </tr>
        <tr>
            <td align="right" class="lefttd" style="height:30px;width: 198px">
            <b>列表深度：</b>
            </td>
            <td class="righttd">
                &nbsp;<asp:TextBox CssClass="textbox" Text="0" ID="CollectListNum"  Width="40px" runat="server"></asp:TextBox> <font color=green>“0”或空表示采集所有列表</font></td>
        </tr>
        <tr>
            <td align="right" class="lefttd" style="height:30px;width: 198px">
            <b>采集信息数量：</b>
            </td>
            <td class="righttd">
                &nbsp;<asp:TextBox CssClass="textbox" Text="0" ID="CollectInfoNum"  Width="40px" runat="server"></asp:TextBox> <font color=green>“0”或空表示采集所有信息，否则表示成功采集这里设定的记录后将停止。</font></td>
        </tr>
        <tr>
            <td align="right" class="lefttd" style="height:30px;width: 198px">
            <b>项目介绍：</b>
            </td>
            <td class="righttd">
                &nbsp;<asp:TextBox CssClass="textbox" ID="ItemRemark" TextMode="MultiLine" Width="420px" runat="server" Height="69px"></asp:TextBox></td>
        </tr>
      </table>
      <br />
        <KS:Foot ID="Foot1" runat="server" OnSubmit="Foot1_Submit" SubmitButtonText="下一步(0)" />
      
    </asp:Panel>
    

    

</asp:Content>
