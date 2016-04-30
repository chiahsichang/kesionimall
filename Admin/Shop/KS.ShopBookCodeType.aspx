<%@ Page Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.Admin.Shop.Admin_ShopBookCodeType" Title="预约码分类管理" Codebehind="KS.ShopBookCodeType.aspx.cs" %>
<asp:Content ID="Content1" ContentPlaceHolderID="KSContent" Runat="Server">
    <asp:Panel ID="ListPanel" runat="server" Width="100%">
    <div id="manage_top" class="menu_top_fixed">
         <ul>
           <li id='p1'><b></b><asp:LinkButton ID="addclassbutton" runat="server" OnClick="addclassbutton_Click">添加预约码分类</asp:LinkButton></li>
             <li id='p2'><b></b><asp:LinkButton ID="editclassbutton" runat="server" OnClick="editclassbutton_Click">编辑预约码分类</asp:LinkButton></li>
             <li id='p3'><b></b><asp:LinkButton ID="delclassbutton" runat="server" OnClick="delclassbutton_Click">删除预约码分类</asp:LinkButton></li></ul>
        </div>  
        <div class="menu_top_fixed_height"></div>  
        
    <KS:ksgv id="List" runat="server" AutoGenerateColumns="False" CssClass="CTable" EmptyDataText="没有添加任何预约码分类!" PagerType="CustomNumeric" Width="99%" HorizontalAlign="Center" GridLines="None" OnRowDataBound="List_RowDataBound" OnRowCommand="List_RowCommand" OnRowCreated="List_RowCreated">
        <Columns>
         <asp:TemplateField HeaderText="选择">
                <itemstyle horizontalalign="Center" width="50px" />
                <itemtemplate>
                <input type="checkbox"  name="ids" id="ids" value="<%#Eval("typeid") %>" />
                </itemtemplate>
            </asp:TemplateField>
            <asp:BoundField HeaderText="分类ID" DataField="TypeID" >
                <itemstyle width="50px" Height="30px" horizontalalign="Center" />
            </asp:BoundField>
            <asp:BoundField HeaderText="分类名称" DataField="TypeName" HtmlEncode="False" >
                <itemstyle  verticalalign="Middle" />
            </asp:BoundField>
            <asp:TemplateField HeaderText="创建时间">
              <itemstyle horizontalalign="Center"/>
              <itemtemplate>
                  <%# Eval("AddDate") %>
              </itemtemplate>
             </asp:TemplateField>
            <asp:TemplateField HeaderText="开放申请">
              <itemstyle horizontalalign="Center"/>
              <itemtemplate>
                  <%# Convert.ToString(Eval("IsOpenApply"))=="1"?"是":"<span style='color:red'>否</span>" %>
              </itemtemplate>
             </asp:TemplateField>
            <asp:TemplateField HeaderText="短信通知">
              <itemstyle width="70px" horizontalalign="Center"/>
              <itemtemplate>
                  <asp:Button ID="BtnSms" Text="批量发短信" CssClass="button" runat="server" commandargument=<%#Eval("typeid") %> commandname="sms"></asp:Button>

              </itemtemplate>
             </asp:TemplateField>
            <asp:TemplateField HeaderText="编辑">
              <itemstyle width="30px" horizontalalign="Center"/>
              <itemtemplate>
             <asp:LinkButton ID="LinkButton1" CssClass="edit" ToolTip="编辑" runat="server" commandargument=<%#Eval("typeid") %> commandname="modify"></asp:LinkButton>
              </itemtemplate>
             </asp:TemplateField>
            <asp:TemplateField HeaderText="删除">
                <itemstyle width="30px" horizontalalign="Center" />
             <itemtemplate>
             <asp:LinkButton runat="server" CssClass="delete" ToolTip="删除" id="delete" commandargument=<%#Eval("typeid") %> commandname="del"></asp:LinkButton>
            </itemtemplate>
            </asp:TemplateField>
              <asp:TemplateField HeaderText="申请">
                       <itemstyle horizontalalign="Center" width="25"/>
                        <itemtemplate>
                           <a class="apply" href="../../shop/bookCodeApply.aspx?id=<%# Eval("typeid") %>" title="申请预约码地址URL" target="_blank"></a>
                        </itemtemplate>
             </asp:TemplateField>
        </Columns>
        <HeaderStyle CssClass="CTitle" />
        <EmptyDataRowStyle CssClass="emptycss" />
       
    </KS:ksgv>
    
 <KS:Page ID="Page1" runat="server" />
       <asp:Panel ID="Panel1" runat="server" Height="30px" Width="100%">
                <br />
        <script type="text/javascript">
		showtips('<span class="state"><strong>操作说明：</strong><br /></span>预约码分类直接绑定商品名称，建议一旦创建不要删除操作。');
		</script>

            </asp:Panel>
</asp:Panel>


     
    <asp:Panel ID="AddPanel" runat="server"  Width="100%" Visible="false">
    <KS:TopNav ID="TopNav1" runat="server" Text="添加预约码分类" />
    <table width="99%" align="center" border="0" cellpadding="1" cellspacing="1" class="CTable"> 
          <tr>
            <td class="lefttd" height="30" align="right" style="width: 120px"><b>预约码分类名称：</b></td>
            <td class="righttd">
                &nbsp;<asp:TextBox CssClass="textbox" ID="TypeName" runat="server" Width="203px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TypeName"
                    ErrorMessage="请填写预约码分类名称!" Display="Dynamic"></asp:RequiredFieldValidator> <span class="tips">如第一期，第二期等。</span></td>
        </tr>
            <tr>
                 <td align="right" class="lefttd" style=" height: 30px">
                     <strong>预约码分类生成时间：</strong></td>
                 <td class="righttd"">
                 &nbsp;<asp:TextBox ID="TxtAddDate" Width="203px" runat="server" onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'});" CssClass="textbox Wdate" />
                     <span class="tips">格式：<%=DateTime.Now.ToString() %></span>
                 </td>
             </tr>
           <tr>
                 <td align="right" class="lefttd" style=" height: 30px">
                     <strong>每个城市限制发放：</strong></td>
                 <td class="righttd"">
                 &nbsp;<asp:TextBox ID="TxtCityNum" Width="60px" runat="server" CssClass="textbox" Text="10" />张预约码
                     <span class="tips">不限制请输入"0".</span>
                 </td>
           </tr>
            <tr>
                 <td align="right" class="lefttd" style=" height: 30px">
                     <strong>开放申请时间段：</strong></td>
                 <td class="righttd"">
                 &nbsp;<asp:TextBox ID="TxtBeginDate" Width="203px" runat="server" onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'});" CssClass="textbox Wdate" />
                至<asp:TextBox ID="TxtEndDate" Width="203px" runat="server" onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'});" CssClass="textbox Wdate" />
                     <span class="tips">格式：<%=DateTime.Now.ToString() %></span>
                 </td>
             </tr>
          <tr>
            <td class="lefttd" height="30" align="right"><b>申请成功手机短信息提示信息：</b></td>
            <td class="righttd">
                &nbsp;<asp:TextBox CssClass="textbox" ID="TxtNode" TextMode="MultiLine" Height="50px" runat="server" Width="503px"></asp:TextBox>
                <br /><span class="tips">不超过255个字符，不启用手机短信通知，请留空。 可用标签如下：<br />{$typename} 预约码分类名称<br />
                    {$codeid} 预约码<br />
                    {$username} 会员名称<br />
                    {$city} 使用城市<br />
                    {$realname} 收货人
                </span>
               </td>
        </tr>
          <tr>
            <td class="lefttd" height="30" align="right"><b>是否开放申请：</b></td>
            <td class="righttd">
                 <asp:RadioButtonList ID="RdbIsOpenApply" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow">
                     <asp:ListItem Value="1" Selected="True">是</asp:ListItem>
                     <asp:ListItem Value="0">否</asp:ListItem>
                 </asp:RadioButtonList>
               </td>
        </tr>
          <tr>
            <td class="lefttd" height="30" align="right"><b>只允许会员申请：</b></td>
            <td class="righttd">
                 <asp:RadioButtonList ID="RdbApplyMustLogin" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow">
                     <asp:ListItem Value="1" Selected="True">是</asp:ListItem>
                     <asp:ListItem Value="0">否</asp:ListItem>
                 </asp:RadioButtonList>
               </td>
        </tr>
          <tr>
            <td class="lefttd" height="30" align="right"><b>每个会员仅限申请：</b></td>
            <td class="righttd">
                <asp:TextBox ID="TxtApplyNum" runat="server" Text="1" CssClass="textbox" Width="50"></asp:TextBox>张
                <span class="tips">只有设置为只允许会员申请,这里的设置才有效,不限制请输入"0".</span>
               </td>
        </tr>

        
      </table>
      <br />
        <KS:Foot ID="Foot1" runat="server" OnSubmit="Foot1_Submit" />
      
    </asp:Panel>

    <asp:Panel ID="PanelSMS" runat="server" Visible="false">

         <KS:TopNav ID="TopNav2" runat="server" Text="群发手机短消息，通知开放购买" />
        <table width="99%" align="center" border="0" cellpadding="1" cellspacing="1" class="CTable"> 
          <tr>
            <td class="lefttd" height="30" align="right" style="width: 139px"><strong>预约成功的用户数：</strong></td>
            <td class="righttd">
                &nbsp;<span style="color:red;font-weight:bold"><asp:Label ID="LabNum" runat="server"></asp:Label></span> 位。
            </td>
          </tr>
          <tr>
            <td class="lefttd" height="30" align="right"><strong>短信内容：</strong></td>
            <td class="righttd">
               <asp:TextBox ID="TxtContent" runat="server" Rows="10" Columns="80" height="120px" Width="350px" TextMode="MultiLine" CssClass="textbox  textarea">您好{$username},您申请预约的商品[{$typename}]已开放购买了，请尽快到[{$sitename}]抢购！</asp:TextBox>
                <div class="tips">
                    <strong>可用标签：</strong><br />
                    {$username} 用户名
                    <br />
                    {$realname} 收货人姓名
                    <br />
                    {$typename} 预约码分类名称
                    <br />
                    {$sitename} 网站名称
                </div>

            </td>
          </tr>
         <tr>
            <td class="lefttd" height="30" align="right"><strong>发送选项：</strong></td>
            <td class="righttd">
                &nbsp;
                <asp:CheckBox ID="CkbIsUsed" runat="server"  Checked="true" Text="仅发给预约码未使用的客户"/>
            </td>
          </tr>
        </table>
         <br />
        <asp:HiddenField ID="HidValue" runat="server" Value="0" />
        <KS:Foot ID="Foot2" runat="server" OnSubmit="Foot2_Submit" />
    </asp:Panel>

</asp:Content>
