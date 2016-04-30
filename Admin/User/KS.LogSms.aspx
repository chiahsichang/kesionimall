<%@ Page Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.Admin_LogSms"  Title="查看系统日志" Codebehind="KS.LogSms.aspx.cs" %>
<%@ Import Namespace="Kesion.BLL" %>
<asp:Content ID="Content1" ContentPlaceHolderID="KSContent" Runat="Server">

    <asp:Panel ID="Panel1" runat="server">
        <div id="manage_top" class="menu_top_fixed">
          <ul>
            <li id='p3'><asp:LinkButton ID="delall" runat="server" OnClick="LinkButton1_Click" OnClientClick="return(confirm('此操作不可逆，确定删除全部短信发送记录吗?'))"><b></b>删除全部</asp:LinkButton></li>
            <li id='p3'><asp:LinkButton ID="LinkButton2" runat="server" OnClientClick="return(confirm('此操作不可逆，确定删除选中的短信发送记录吗?'))" OnClick="Button2_Click"><b></b>删除选中</asp:LinkButton></li>
            <li id='p7'><asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click1"><b></b>导出到Excel</asp:LinkButton></li>
            <li id='p1'><asp:LinkButton ID="LinkButton3" runat="server" OnClick="LinkButton3_Click"><b></b>发送手机短信</asp:LinkButton></li>
          </ul>
        </div>     
         <div class="menu_top_fixed_height"></div>  
        <KS:KSGV ID="LogListView"  cssclass="CTable" runat="server" AutoGenerateColumns="False" EmptyDataText="暂无手机短消息发送记录！"
            OnRowDataBound="LogListView_RowDataBound" Width="100%" GridLines="None"  DataKeyNames="id">
            <Columns>
                <asp:TemplateField HeaderText="<input type='checkbox' name='chkall' id='chkall' onclick='CheckAll(this.form);'/>">
                <ItemStyle HorizontalAlign="Center"  Width="30"/>
                <ItemTemplate>
                <input type="checkbox"  name="ids" value="<%#Eval("id") %>" />
                </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="用户">
                <itemstyle horizontalalign="Center" />
                <itemtemplate>
                   <%# string.IsNullOrEmpty(Convert.ToString(Eval("username")))?"-":Eval("username") %>
                </itemtemplate>
            </asp:TemplateField>
                <asp:BoundField DataField="UserIP" HeaderText="操作IP">
                 <ItemStyle Width="100px" />
                </asp:BoundField>
                <asp:BoundField DataField="adddate" HeaderText="发送时间">
                <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="mobile" HeaderText="接收手机">
                <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                 <asp:TemplateField HeaderText="状态">
                <itemstyle horizontalalign="center" Height="30px"/>
                <itemtemplate>
                   <%# Eval("IsSuccess").ToString().Equals("1")?"<span style='color:green'>成功</span>":"<span style='color:red'>失败</span>" %>
                </itemtemplate>
            </asp:TemplateField>
             <asp:TemplateField HeaderText="发送内容">
                <itemstyle horizontalalign="Left" Height="30px"/>
                <itemtemplate>
                    <span class="tips"><%# Eval("content") %></span>
                </itemtemplate>
            </asp:TemplateField>
                 <asp:TemplateField HeaderText="返回信息">
                <itemstyle horizontalalign="Left"/>
                <itemtemplate>
                    <span class="tips"><%# Kesion.Publics.Utils.ClearHtml(Convert.ToString(Eval("remark"))) %></span>
                </itemtemplate>
            </asp:TemplateField>
             
            </Columns>
            <HeaderStyle CssClass="CTitle" />
            <EmptyDataRowStyle CssClass="emptycss" />
           
        </KS:KSGV>


     <div style="border:1px dashed #cccccc; background-color:#f0f9fe; margin-top:10px;padding:10px; text-align: left; font-size: 12px;">
     <strong>特别提醒：</strong> 如果短信记录太多，影响了系统性能，可以删除一定时间段前的记录以加快速度。
     <div>
     <strong>删除范围：</strong><asp:RadioButtonList ID="RdbDelType" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow">
      <asp:ListItem Value="1">10天前</asp:ListItem>
      <asp:ListItem Value="2">1个月前</asp:ListItem>
      <asp:ListItem Value="3">2个月前</asp:ListItem>
      <asp:ListItem Value="4">3个月前</asp:ListItem>
      <asp:ListItem Value="5">6个月前</asp:ListItem>
      <asp:ListItem Value="6" Selected="True">1年前</asp:ListItem>
         </asp:RadioButtonList>
         <asp:Button ID="BtnDel" runat="server" Text="执行删除"  CssClass="button" OnClick="BtnDel_Click" /></div>
     </div>

     <KS:Page ID="Page1" runat="server" />
     </asp:Panel>

    <asp:Panel ID="Panel2" runat="server" Visible="false">

         <div id="manage_top" class="toptitle menu_top_fixed"><ul>
             <li id='p9'><b></b><a href='KS.LogSms.aspx'>返回</a></li> 发送手机短消息</div>
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
                <input type="radio" name="optype" onclick="jQuery('#grouparea').hide();" value="3" />指定手机号码<asp:TextBox ID="ToMobile" runat="server"
                    Width="246px" CssClass="textbox"></asp:TextBox>多个用户名间请用<font color="#0000ff">英文的逗号</font>分隔</td>
          </tr>

         <tr>
             <td align="right" class="lefttd" height="30" style="width: 146px">
                 <strong>发送内容：</strong>

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
                 <asp:TextBox ID="Content" TextMode="multiLine" style="width:95%;height:250px;" runat="server">您好{$UserName}!  新年快乐！{$SiteName}贺!
                 </asp:TextBox>
                 <br />
                 <span class="tips">TIPS:建议不超过66个字符,请确保您的短信账号余额充足！！！</span>
                 

             </td>
         </tr>
         
        </table>
    <br />
    <KS:Foot ID="Foot1" runat="server" SubmitButtonText="开始发送(0)" OnSubmit="Foot1_Submit" />
    </asp:Panel>
 


</asp:Content>
