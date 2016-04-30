<%@ Page Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="True" Inherits="Kesion.NET.WebSite.Admin_AdBoard" Title="广告位管理" Codebehind="KS.AdBoard.aspx.cs" %>
<%@ Import Namespace="Kesion.Cache" %>
<%@ Import Namespace="Kesion.Publics" %>
<asp:Content ID="Content1" ContentPlaceHolderID="KSContent" Runat="Server">
<asp:Panel ID="listPanel" runat="server" Width="100%">
    <div id="manage_top" class="menu_top_fixed">
         <ul>
<span style="float:right;padding-right:10px">
        <select name="classid" style="width:150px" OnChange="location.href='KS.ADBoard.Aspx?classid='+this.value;">
                <option value="">按分类查看...</option>
                <option value="-1"<%=KSCMS.S("classid")=="-1"?" selected":"" %>>网站通用</option>
                <option value="0"<%=KSCMS.S("classid")=="0"?" selected":"" %>>网站首页</option>
                <% =getClassOption()%>
               </select>  </span>    


           <li id='p1'><asp:LinkButton ID="addboard" runat="server" OnClick="addboard_Click"><b></b>添加广告位</asp:LinkButton></li>
           <li id='p4'><asp:LinkButton ID="editboard" runat="server"><b></b>编辑广告位</asp:LinkButton></li>
           <li id='p3'><asp:LinkButton ID="delboard" runat="server" OnClick="delboard_Click"><b></b>删除广告位</asp:LinkButton></li></ul>
    </div> 
    <div class="menu_top_fixed_height"></div>  
    
    <KS:KSGV ID="list" cssclass="CTable" runat="server" EmptyDataText="还没有添加任何的广告位!" GridLines="None" Width="99%" AutoGenerateColumns="False" OnRowDataBound="list_RowDataBound" PagerType="CustomNumeric" OnRowEditing="list_RowEditing" OnRowCommand="list_RowCommand" OnRowDeleting="list_RowDeleting" OnRowCreated="list_RowCreated">
       <Columns>
            <asp:TemplateField HeaderText="选择">
                <ItemStyle HorizontalAlign="Center"  Width="40px"/>
                <ItemTemplate>
                <input type="checkbox"  name="ids" id="ids" value="<%#Eval("boardid") %>" />
                </ItemTemplate>
            </asp:TemplateField>

            <asp:TemplateField HeaderText="状态">
              <itemstyle width="30px" horizontalalign="Center"/>
              <itemtemplate>
                   <a href="?action=status&boardid=<%#Eval("boardid")%>" <%# Convert.ToString(Eval("status"))=="0"?"class='no' title='暂停'":"class='ok' title='正常'" %>></a>
              </itemtemplate>
            </asp:TemplateField>
                
            <asp:BoundField DataField="BoardID" HeaderText="广告位ID" ReadOnly="True">
                <itemstyle horizontalalign="Center" width="60px" />
            </asp:BoundField>

           <asp:TemplateField HeaderText="广告位名称">
                <ItemStyle/>
                <ItemTemplate>
                  <a href="KS.Advertise.aspx?boardid=<%# Eval("boardid") %>" title="查看该广告位下的广告条"><%# Eval("boardname") %></a>
                </ItemTemplate>
            </asp:TemplateField>
           <asp:TemplateField HeaderText="分类">
                 <itemstyle horizontalalign="Center" width="120px" />
                <ItemTemplate>
                    <%# GetClassName(Utils.StrToInt(Convert.ToString(Eval("classId"))), Convert.ToString(Eval("className"))) %>
                </ItemTemplate>
            </asp:TemplateField>

            <asp:BoundField DataField="filename" HeaderText="JS文件名" />
            <asp:BoundField DataField="AdRate" DataFormatString="{0} 元/月" HeaderText="广告位价格">
                <itemstyle horizontalalign="Center" width="100px" />
            </asp:BoundField>
            <asp:BoundField DataField="maxads" DataFormatString="{0} 个" HeaderText="广告数">
                <itemstyle horizontalalign="Center" width="50px" />
            </asp:BoundField>

            <asp:TemplateField HeaderText="编辑">
              <itemstyle width="30px" horizontalalign="Center"/>
              <itemtemplate>
                <asp:LinkButton runat="server" CssClass="edit" ToolTip="编辑" CommandName="Edit" CausesValidation="False" id="LinkButton1"></asp:LinkButton>
              </itemtemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="删除">
              <itemstyle width="30px" horizontalalign="Center"/>
              <itemtemplate>
                <asp:LinkButton runat="server"  ToolTip="删除" CssClass="delete" CommandName="Delete" CausesValidation="False" id="LinkButtonDel"></asp:LinkButton>
              </itemtemplate>
            </asp:TemplateField>

           <asp:TemplateField HeaderText="↓生成JS">
               <itemstyle width="50px" horizontalalign="Center" />
               <itemtemplate>
                <asp:LinkButton runat="server" CommandName="createjs" CausesValidation="False" CommandArgument='<%#Eval("boardid") %>' id="LinkButtonFso"><b>生成</b></asp:LinkButton>
                </itemtemplate>
           </asp:TemplateField>
        </Columns>
        <HeaderStyle CssClass="CTitle" />
            <EmptyDataRowStyle CssClass="emptycss" />
    </KS:KSGV>
     <KS:Page ID="Page1" runat="server" />

     <div class="message">
       <strong>搜索广告位：</strong>
        <asp:DropDownList ID="DrpTJ" runat="server">
            <asp:ListItem Value="1" Selected="True">广告位ID</asp:ListItem>
            <asp:ListItem Value="2">广告位名称</asp:ListItem>
        </asp:DropDownList>
         <asp:TextBox ID="TxtKeyWord" runat="server" CssClass="textbox" />
         <asp:Button ID="BtnSearch" runat="server" Text="搜索" CssClass="button" OnClick="BtnSearch_Click" />
   </div>

        <script type="text/javascript">
            showtips('<span class="state"><strong>说明：</strong><br /></span>1、所有广告位必须先生成静态JS后才可以调用<br />        2、广告JS文件的调用方法： &lt;script src="<span style="color: #ff3366"><%=MyCache.GetCacheConfig(5)+MyCache.GetCacheConfig(0)+MyCache.GetCacheConfig(12) %>/{0}</span>"&gt;&lt;/script&gt;<br />        其中<span style="color: #ff3366">{0}</span>表示广告JS生成的文件名，如"banner.js，ad.js"等');
		</script>
</asp:Panel>

    <asp:Panel ID="addPanel" runat="server" Width="100%" Visible="false">
        <KS:TopNav ID="TopNav2" runat="server" Text="添加广告位" />
    <table width="99%" align="center" border="0" cellpadding="1" cellspacing="1" class="CTable"> 
        <tr>
            <td class="lefttd" height="30" align="right" style="width: 198px"><b>广告位分类：</b></td>
            <td class="righttd">
                &nbsp;<asp:DropDownList ID="DrpClassID" runat="server"></asp:DropDownList>
               </td>
          </tr>
          <tr>
            <td class="lefttd" height="30" align="right" style="width: 198px"><b>广告位名称：</b></td>
            <td class="righttd">
                &nbsp;<asp:TextBox CssClass="textbox" ID="BoardName" runat="server" Width="268px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="BoardName"
                    ErrorMessage="请填写广告位名称!" Display="Dynamic"></asp:RequiredFieldValidator></td>
          </tr>
        <tr>
            <td align="right" class="lefttd" height="30" style="width: 198px">
                <strong>广告位JS文件：</strong></td>
            <td class="righttd">
                &nbsp;<asp:TextBox CssClass="textbox" ID="FileName" runat="server" Width="87px"></asp:TextBox>&nbsp; 如 banner.js
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="FileName"
                    ErrorMessage="请填写广告位JS文件名!" Display="Dynamic"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="FileName"
                    ErrorMessage="RegularExpressionValidator" ValidationExpression="[\W\w-]+\.([jJ][sS])">扩展名必须是.js</asp:RegularExpressionValidator></td>
        </tr>
        <tr>
            <td align="right" class="lefttd" height="30" style="width: 198px">
                <strong>广告位价格：</strong></td>
            <td class="righttd">
                &nbsp;<asp:TextBox CssClass="textbox" ID="AdRate" runat="server" Text="200" Width="60px"></asp:TextBox>
                元/月<asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server"
                    ControlToValidate="AdRate" ErrorMessage="请输入正确的广告位价格" ValidationExpression="\d{1,4}"></asp:RegularExpressionValidator></td>
        </tr>
        <tr>
            <td align="right" class="lefttd" height="30" style="width: 198px">
                <strong>最多广告数：</strong></td>
            <td class="righttd">
                &nbsp;<asp:TextBox CssClass="textbox" ID="Maxads" runat="server" Text="5" Width="60px"></asp:TextBox>
                个
                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="Maxads"
                    ErrorMessage="请输入正确的广告位个数" ValidationExpression="\d{1,2}"></asp:RegularExpressionValidator></td>
        </tr>
        <tr>
            <td align="right" class="lefttd" height="30" style="width: 198px">
                <strong>备注说明：</strong></td>
            <td class="righttd">
                &nbsp;<asp:TextBox CssClass="textbox" ID="Note" runat="server" Height="67px" TextMode="MultiLine" Width="303px"></asp:TextBox></td>
        </tr>
        <tr>
            <td align="right" class="lefttd" height="30" style="width: 198px">
                <strong>广告位状态：</strong></td>
            <td class="righttd">
                <asp:RadioButtonList ID="Status" runat="server" RepeatDirection="Horizontal">
                    <asp:ListItem Selected="True" Value="1">活动</asp:ListItem>
                    <asp:ListItem Value="0">暂停</asp:ListItem>
                </asp:RadioButtonList></td>
        </tr>
    </table>
        <br />
        <KS:Foot ID="Foot1" runat="server" OnSubmit="Foot1_Submit" />
    </asp:Panel>
</asp:Content>

