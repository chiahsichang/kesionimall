<%@ Page Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.Admin.Shop.Admin_LimitBuy" Title="限时限量抢购任务" Codebehind="KS.ShopLimitBuy.aspx.cs" %>
<%@ Import Namespace="Kesion.Publics" %>
<%@ Import Namespace="Kesion.HtmlTags" %>
<%@ Import Namespace="Kesion.Cache" %>
<asp:Content ID="Content1" ContentPlaceHolderID="KSContent" Runat="Server">
     <asp:Panel ID="TaskList" runat="server" Width="100%">
      <div id="manage_top" class="menu_top_fixed">
        <ul>
           <li id='p1'><asp:LinkButton ID="addTask" runat="server" OnClick="addTask_Click"><b></b>添加限时/限量抢购任务</asp:LinkButton></li>
           <li id='p4'><asp:LinkButton ID="editTask" runat="server" OnClick="editTask_Click"><b></b>编辑限时/限量抢购任务</asp:LinkButton></li>
           <li id='p3'><asp:LinkButton ID="delTask" runat="server" OnClick="delTask_Click"><b></b>删除限时/限量抢购任务</asp:LinkButton></li>
           <li id='p5'><a href="KS.ShopLimitBuyPro.Aspx"><b></b>管理所有抢购商品</a></li>
        </ul>
      </div>   
      <div class="menu_top_fixed_height"></div>
       <KS:KSGV ID="list" runat="server" cssclass="CTable" AutoGenerateColumns="False" Width="99%" EmptyDataText="没有添加任何限时/限量抢购任务!" GridLines="None" OnRowDataBound="list_RowDataBound" OnRowCommand="list_RowCommand" OnRowCreated="list_RowCreated" >
          <Columns>
              <asp:TemplateField HeaderText="选择">
                <itemstyle horizontalalign="Center" width="50px" />
                <itemtemplate>
                    <input type="checkbox"  name="ids" id="ids" value='<%#Eval("taskid") %>' />
                </itemtemplate>
              </asp:TemplateField>
               <asp:BoundField DataField="TaskId" HeaderText="任务ID" Visible="false">
                  <itemstyle horizontalalign="Center" />
                </asp:BoundField>

           <asp:TemplateField HeaderText="状态">
              <itemstyle width="30px" horizontalalign="Center"/>
              <itemtemplate>
                   <a href="?action=status&taskid=<%#Eval("taskid")%>" <%# Convert.ToString(Eval("status"))=="0"?"class='no' title='关闭'":"class='ok' title='正常'" %>></a>
              </itemtemplate>
            </asp:TemplateField>

             <asp:TemplateField HeaderText="任务名称">
             <itemtemplate>
             <a href='<%# BasicField.GetLimitBuyUrl(Convert.ToInt32(Eval("taskid"))) %>' target="_blank" title='<%# Eval("taskname") %>'><%# Utils.CutStr(Convert.ToString(Eval("taskname")),40) %></a>
             <a href='KS.ShopLimitBuyPro.Aspx?TaskID=<%#Eval("taskid") %>'>(商品<span style="color:Red"><%# Eval("LimitBuyProNum") %></span>件)</a>
             </itemtemplate>
             </asp:TemplateField> 
             <asp:TemplateField HeaderText="类型">
             <itemstyle horizontalalign="Center" />
             <itemtemplate>
             <%# Convert.ToString(Eval("tasktype")) == "1" ? "<span style='color:blue'>限时</span>" : "<span style='color:green'>限量</span>"%>  
             </itemtemplate>
             </asp:TemplateField>
             
             <asp:TemplateField HeaderText="时间限制">
             <itemstyle horizontalalign="Left" Width="120" />
             <itemtemplate>
             <span class="tips">
             <%# Convert.ToString(Eval("tasktype")) == "1" ? (Convert.ToString(Eval("LimitBuyBeginTime")) + "至" + Convert.ToString(Eval("LimitBuyEndTime"))) : "---"%></span>
             </itemtemplate>
             </asp:TemplateField>
             
             <asp:TemplateField HeaderText="付款时间要求">
             <itemstyle horizontalalign="Center" />
             <itemtemplate>
             <span class="tips">下单后 <%# Eval("LimitBuyPayTime")%> 小时内</span>
             </itemtemplate>
             </asp:TemplateField>
             

             
             <asp:TemplateField HeaderText="编辑">
              <itemstyle width="30px" horizontalalign="Center"/>
              <itemtemplate>
             <asp:LinkButton ID="LinkButton1" ToolTip="编辑" CssClass="edit" runat="server" commandargument=<%#Eval("taskid") %> commandname="modify"></asp:LinkButton>
              </itemtemplate>
            </asp:TemplateField>
             <asp:TemplateField HeaderText="删除">
              <itemstyle width="30px" horizontalalign="Center"/>
              <itemtemplate>
             <asp:LinkButton runat="server" id="delete" CssClass="delete" ToolTip="删除" commandargument=<%#Eval("taskid") %> commandname="del"></asp:LinkButton>
              </itemtemplate>
            </asp:TemplateField>

           
          </Columns>
            <HeaderStyle CssClass="CTitle" />
            <EmptyDataRowStyle CssClass="emptycss" />
      </KS:KSGV>
      <asp:Panel ID="Panel1" runat="server">
              <div style="height:5px;overflow:hidden;"></div>
            &nbsp;&nbsp;<input type="checkbox" name="chkall" id="chkall" onclick="CheckAll(this.form);"/><label for="chkall">全部选中</label>
            &nbsp;&nbsp;&nbsp;<input type="button" value="删除选中的任务" onmouseover="this.className='button_on';" onmouseout="this.className='button';" class="button" onclick="if (GetIDS('del')){this.form.action='?action=del';this.form.submit()}" id="Button1" />
    <input type="button" id="addProBtn" onclick="addPro()" class="button" value="添加抢购商品" />
          <script type="text/javascript">
              function addPro() {
                  top.openWin("添加限时限量抢购商品", "Shop/KS.ShopAddLimitPro.aspx", false, 400, 200);
              }
         
          </script>
    </asp:Panel> 
    
     <KS:Page ID="Page1" runat="server" />
        
    </asp:Panel>
    
    <asp:Panel ID="TaskManage" runat="server" Width="100%" Visible="false">
    
        <KS:TopNav ID="TopNav1" runat="server" />
        <table width="100%" border="0" cellpadding="1" cellspacing="1" class="CTable"> 
          <tr>
            <td class="lefttd" height="30" align="right" style="width: 147px"><strong>限时/限量任务名称：</strong></td>
            <td class="righttd">
                &nbsp;<asp:TextBox  CssClass="textbox" Width="250px" ID="TxtTaskName" runat="server"></asp:TextBox> 如: 1天服装7折限时抢购
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TxtTaskName"
                    ErrorMessage="请输入限时/限量任务名称!"></asp:RequiredFieldValidator>
            </td>
          </tr>
          <tr>
                <td align="right" class="lefttd" height="30" style="width: 147px"><strong>任务类型：</strong></td>
                <td class="righttd">
                    <asp:RadioButtonList ID="RdbTaskType" runat="server" RepeatDirection="Horizontal" AutoPostBack="True" OnSelectedIndexChanged="RdbTaskType_SelectedIndexChanged">
                        <asp:ListItem Value="1" Selected="True">限时抢购</asp:ListItem>
                        <asp:ListItem Value="2">限量抢购</asp:ListItem>
                    </asp:RadioButtonList></td>
            </tr>
            <tr id="ShowTime" runat="server">
                <td align="right" class="lefttd" height="30" style="width: 147px">
                 <strong>抢购时间限制：</strong>
                </td>
                <td class="righttd">
                 <script>isHour = 1;</script>
                 &nbsp;<asp:TextBox  CssClass="textbox Wdate" ID="TxtLimitBuyBeginTime" onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'});" runat="server"></asp:TextBox> 至 <asp:TextBox CssClass="textbox Wdate" onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'});" ID="TxtLimitBuyEndTime" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td align="right" class="lefttd" height="30" style="width: 147px">
                 <strong>最迟付款时间：</strong>
                </td>
                <td class="righttd">
                 下单后<asp:TextBox style="text-align:center" CssClass="textbox" ID="TxtLimitBuyEndPayTime" Text="0" runat="server" Width="50"></asp:TextBox>小时内没有付款,视为抢购无效。如果不限制请录入"0"。 
                </td>
            </tr>
            <tr>
                <td align="right" class="lefttd" height="30" style="width: 147px">
                 <strong>任务介绍：</strong>
                </td>
                <td class="righttd">
                    <asp:TextBox  ID="TxtIntro" TextMode="multiLine" style="width:80%;height:200px;" runat="server"></asp:TextBox>
                    <% Kesion.APPCode.EditorAPI.EchoEditor("editor", this.TxtIntro.ClientID, "Basic");%>
                   
                
                </td>
            </tr>
             <tr>
                 <td align="right" class="lefttd" style="width: 132px; height: 30px">
                     <strong>封面图片：</strong></td>
                 <td class="righttd" style="height: 30px">
                 &nbsp;<asp:TextBox CssClass="textbox" ID="TxtPhotoUrl" runat="server" width="250px"></asp:TextBox>
          &nbsp;<input type="button" class="button" onclick="SelectFiles('<%=this.TxtPhotoUrl.ClientID %>',4);" value="选择图片">
                 </td>
             </tr>
             <tr>
                 <td align="right" class="lefttd" style="width: 132px; height: 30px">
                     <strong>价格范围：</strong></td>
                 <td class="righttd" style="height: 30px">
                 &nbsp;<asp:TextBox CssClass="textbox" ID="TxtJGRange" runat="server" width="150px"></asp:TextBox>
                如 100<%=MyCache.GetCurrencyUnit%>-120<%=MyCache.GetCurrencyUnit%>  </td>
             </tr>
             
            <tr>
                 <td align="right" class="lefttd" style="width: 132px; height: 30px">
                     <strong>是否推荐：</strong></td>
                 <td class="righttd" style="height: 30px">
                 
                  <asp:RadioButtonList ID="RdbRecommend" runat="server" RepeatDirection="Horizontal">
                   <asp:ListItem Value="0" Selected>否</asp:ListItem>
                   <asp:ListItem Value="1">是</asp:ListItem>
                  </asp:RadioButtonList>
                 </td>
             </tr>
             <tr>
                 <td align="right" class="lefttd" style="width: 132px; height: 30px">
                     <strong>绑定模板：</strong></td>
                 <td class="righttd" style="height: 30px">
                 &nbsp;<asp:TextBox CssClass="textbox" Text="{$TemplateDir}/商城系统/抢购内容页.html" ID="TxtTemplateFile" runat="server" width="250px"></asp:TextBox>
                  &nbsp;<input type="button" class="button" onclick="SelectTemplate('<%=this.TxtTemplateFile.ClientID %>');" value="选择模板">
                 </td>
             </tr>

             
            <tr>
                <td align="right" class="lefttd" height="30" style="width: 147px">
                <strong>任务状态：</strong>
                </td>
                <td class="righttd">
                <asp:RadioButtonList ID="RdbStatus" runat="server" RepeatDirection="horizontal">
                 <asp:ListItem Value="1" Selected="true">正常</asp:ListItem>
                 <asp:ListItem Value="0">锁定</asp:ListItem>
                </asp:RadioButtonList>
                </td>
            </tr>
        </table>
      <br />
      <KS:Foot ID="Foot1" runat="server" OnSubmit="Foot1_Submit" />
    </asp:Panel>
    
</asp:Content>

