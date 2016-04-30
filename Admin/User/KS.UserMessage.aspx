<%@ Page Language="C#" ValidateRequest="false" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.Admin_UserMessage" Title="发送邮件" Codebehind="KS.UserMessage.aspx.cs" %>
<%@ Import Namespace="Kesion.BLL" %>
<asp:Content ID="Content1" ContentPlaceHolderID="KSContent" Runat="Server">

 <asp:Panel ID="Panel1" runat="server">
    
     <KS:TopNav ID="TopNav2" runat="server" Text="站内短消息管理" />

  <div>
        <KS:KSGV ID="MessageView" cssclass="CTable" runat="server" AutoGenerateColumns="False" DataKeyNames="FieldID" GridLines="None"
            OnRowDataBound="FieldListView_RowDataBound" OnRowCommand="list_RowCommand" PagerType="CustomNumeric" Width="99%" EnableTheming="True" HorizontalAlign="Center" EmptyDataText="找不到短消息发送记录!">
            <Columns>
                  <asp:TemplateField HeaderText="选择">
                <itemstyle horizontalalign="Center" width="50px" />
                <itemtemplate>
                    <input type="checkbox"  name="ids" id="ids" value='<%#Eval("id") %>' />
                </itemtemplate>
              </asp:TemplateField>
              <asp:TemplateField HeaderText="标题">
                <ItemTemplate>
                <span style="cursor:pointer" onmousedown='parent.openWin("查看短消息详情","user/KS.UserMessageShow.aspx?ID="+<%# Eval("ID") %>,false);return false;'><%# Eval("MsgTitle") %></span>
                </ItemTemplate>
              </asp:TemplateField>
               
                <asp:BoundField DataField="fromusername" HeaderText="发送者">
                  <itemstyle horizontalalign="Center" width="80px" />
                </asp:BoundField>
                <asp:BoundField DataField="tousername" HeaderText="接收者">
                  <itemstyle horizontalalign="Center" width="80px" />
                </asp:BoundField>

                <asp:BoundField DataField="adddate" HeaderText="发送时间">
                <itemstyle horizontalalign="Center" width="120px" />
                </asp:BoundField>
               <asp:TemplateField HeaderText="已读">
                <itemstyle horizontalalign="Center" width="50px" />
                <itemtemplate>
                    <a href="javascript:;" <%# Convert.ToString(Eval("readtf"))=="1"?"class='ok' title='已读'":"class='no' title='未读'" %>></a>

                </itemtemplate>
               </asp:TemplateField>
            
            <asp:TemplateField HeaderText="修改">
              <itemstyle width="30px" horizontalalign="Center"/>
              <itemtemplate>
                      <asp:LinkButton CssClass="edit" ToolTip="修改" ID="LinkButton1" runat="server" commandargument=<%#Eval("id") %> commandname="modify"></asp:LinkButton>
              </itemtemplate>
            </asp:TemplateField>

                <asp:TemplateField HeaderText="删除">
                <itemstyle width="30px" horizontalalign="Center"/>
                <itemtemplate>
                      <asp:LinkButton CssClass="delete" ToolTip="删除" runat="server" id="delete" commandargument=<%#Eval("id") %> commandname="del"></asp:LinkButton>
               </itemtemplate>
                </asp:TemplateField>
            </Columns>
            <HeaderStyle CssClass="CTitle" />
            <EmptyDataRowStyle CssClass="emptycss" />
        </KS:KSGV>
        <asp:Panel ID="Panel3" runat="server" Height="30px">
              <div style="margin-top:5px;overflow:hidden;"></div>
            &nbsp;&nbsp;<input type="checkbox" name="chkall" id="chkall" onclick="CheckAll(this.form);"/><label for="chkall">全部选中</label>
            <input type="button" value="删除选中的消息" onmouseover="this.className='button_on';" onmouseout="this.className='button';" class="button" onclick="if (GetIDS('del')){this.form.action='?action=del';this.form.submit()}" id="Button1" />             <input type="button" value="发送站内消息" onclick="location.href='KS.UserMessage.aspx?action=send';" class="button" />
</asp:Panel>  
        <br />

        </div>
        
          <KS:Page ID="Page1" runat="server" />
         <br />
         
         
    <div style="border:1px dashed #cccccc; background-color:#f0f9fe; margin-top:10px ;padding:10px; text-align: left; font-size: 12px;">
     <strong>特别提醒：</strong> 如果短消息表记录太多，影响了系统性能，可以删除一定时间段前的记录以加快速度。 
     <div>
     <strong>删除范围：</strong><asp:RadioButtonList ID="RdbDelType" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow">
      <asp:ListItem Value="1">10天前</asp:ListItem>
      <asp:ListItem Value="2">1个月前</asp:ListItem>
      <asp:ListItem Value="3">2个月前</asp:ListItem>
      <asp:ListItem Value="4">3个月前</asp:ListItem>
      <asp:ListItem Value="5">6个月前</asp:ListItem>
      <asp:ListItem Value="6" Selected>1年前</asp:ListItem>
         </asp:RadioButtonList>
         
         <asp:CheckBox ID="chkReadTF" runat="server" Text="包括未读的消息" />
         <asp:Button ID="BtnDel" runat="server" Text="执行删除" OnClick="BtnDel_Click" CssClass="button" /></div>
     </div>
         
        <script type="text/javascript">
            showtips('<span class="state"><strong>说明：</strong><br /></span>这里可以查看站内会员的消息发送情况，不建议随便修改或是删除会员的消息内容!');
		</script>
 
 </asp:Panel>
 
 <asp:Panel ID="Panel2" runat="server" Visible="false">

       <div id="manage_top" class="toptitle menu_top_fixed"><ul>
             <li id='p9'><b></b><a href='KS.UserMessage.aspx'>返回</a></li> 发送站内短消息</div>
        <div class="menu_top_fixed_height"></div> 


     <table width="100%" border="0" cellpadding="1" cellspacing="1" class="CTable"> 
          <tr>
            <td class="lefttd" height="30" align="right" style="width: 146px"><b>收件人选择：</b></td>
            <td class="righttd">
                <input type="radio" name="optype" onclick="jQuery('#grouparea').hide();" value="1" checked />所有会员(<span style="color:red"><%=DataFactory.GetOnlyValue("select count(1) From KS_User") %></span>位)<br />
                <input type="radio" name="optype" onclick="jQuery('#grouparea').show();" value="2" />指定会员组
                <br />
                <div id="grouparea" style="display:none">
                <%=BaseFun.GetUserGroup_CheckBox("groupid",4,"0") %>
                </div>
                <input type="radio" name="optype" onclick="jQuery('#grouparea').hide();" value="3" />指定用户名<asp:TextBox ID="ToUserName" runat="server"
                    Width="246px" CssClass="textbox"></asp:TextBox>多个用户名间请用<font color="#0000ff">英文的逗号</font>分隔</td>
          </tr>
         <tr>
             <td align="right" class="lefttd" height="30" style="width: 146px">
                 <strong>消息标题：</strong></td>
             <td class="righttd">
                 <asp:TextBox CssClass="textbox" ID="Subject" runat="server" Width="500px"></asp:TextBox>
                 <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="请输入消息标题" ControlToValidate="Subject"></asp:RequiredFieldValidator></td>
         </tr>
         <tr>
             <td align="right" class="lefttd" height="30" style="width: 146px">
                 <strong>消息内容：</strong>
                 <div class="tips">
                 <strong>可用标签：</strong><br />
                 {$UserName} -用户名<br />
                 {$RealName} -姓名<br />
                 {$Sex} -先生或是女士<br />
                 {$SiteName} -网站名称<br />
                 {$SendTime} -发送时间<br />
                 {$SendDate} -发送日期<br />
                 </div>

             </td>
             <td class="righttd">
                    <asp:TextBox ID="Content" TextMode="multiLine" style="width:95%;height:250px;" runat="server"></asp:TextBox>
                    <% Kesion.APPCode.EditorAPI.EchoEditor("editor", this.Content.ClientID, "Common");%>

             </td>
         </tr>
         <tr>
             <td align="right" class="lefttd" height="30" style="width: 146px">
                 <strong>发件人：</strong></td>
             <td class="righttd">
                 系统消息</td>
         </tr>

        </table>
    <br />
    <KS:Foot ID="Foot1" runat="server" SubmitButtonText="开始发送(0)" OnSubmit="Foot1_Submit" />
  </asp:Panel>
  
  
   <asp:Panel ID="Panel4" runat="server" Visible="false">
    <KS:TopNav ID="TopNav3" runat="server" Text="修改站内短消息" />
     <table width="100%" border="0" cellpadding="1" cellspacing="1" class="CTable"> 
          <tr>
            <td class="lefttd" height="30" align="right" style="width: 146px"><b>收件人：</b></td>
            <td class="righttd">
            <asp:Label ID="LabToUser" runat="server"></asp:Label>
            </td>
          </tr>
          <tr>
            <td class="lefttd" height="30" align="right" style="width: 146px"><b>发件人：</b></td>
            <td class="righttd">
            <asp:Label ID="LabFromUser" runat="server"></asp:Label>
            </td>
          </tr>
          <tr>
            <td class="lefttd" height="30" align="right" style="width: 146px"><b>发件时间：</b></td>
            <td class="righttd">
            <asp:Label ID="LabAddDate" runat="server"></asp:Label>
            </td>
          </tr>
         <tr>
             <td align="right" class="lefttd" height="30" style="width: 146px">
                 <strong>消息标题：</strong></td>
             <td class="righttd">
                 <asp:TextBox ID="TxtMsgTitle" CssClass="textbox" runat="server" Width="308px"></asp:TextBox>
                 <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="请输入消息标题" ControlToValidate="TxtMsgTitle"></asp:RequiredFieldValidator></td>
         </tr>
         <tr>
             <td align="right" class="lefttd" height="30" style="width: 146px">
                 <strong>消息内容：</strong></td>
             <td class="righttd">
                   <asp:TextBox ID="TxtMsgContent" TextMode="multiLine" style="width:95%;height:250px;" runat="server"></asp:TextBox>
                    <% Kesion.APPCode.EditorAPI.EchoEditor("editor", this.TxtMsgContent.ClientID, "Common");%>

             </td>
         </tr>


        </table>
    <br />
    <asp:HiddenField ID="HidField" runat="server" Value="0" />
    <KS:Foot ID="Foot2" runat="server" SubmitButtonText="确定修改(0)" OnSubmit="Foot2_Submit" />
  </asp:Panel>
  
</asp:Content>

