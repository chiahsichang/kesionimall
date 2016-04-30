<%@ Page Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.Admin_Form" Title="Untitled Page" Codebehind="KS.Form.aspx.cs" %>
<%@ Import Namespace="Kesion.BLL" %>
<asp:Content ID="Content1" ContentPlaceHolderID="KSContent" Runat="Server">
    <asp:Panel ID="listPanel" runat="server" Width="100%">
       <div id="manage_top" class="menu_top_fixed">
         <ul>
           <li id='p1'><asp:LinkButton ID="addsubject" runat="server" OnClick="addsubject_Click"><b></b>添加表单</asp:LinkButton></li>
           <li id='p5'><asp:LinkButton ID="codesubject" runat="server" OnClick="codesubject_Click"><b></b>代码调用</asp:LinkButton></li>
           <li id='p7'><asp:LinkButton ID="delsubject" runat="server" OnClick="delsubject_Click"><b></b>提交记录</asp:LinkButton></li></ul>
        </div>  
        <div class="menu_top_fixed_height"></div>  
        <KS:KSGV ID="list" cssclass="CTable" runat="server" EmptyDataText="没有添加表单项目" GridLines="None"
            OnRowDataBound="KSGV1_RowDataBound" PagerType="CustomNumeric" Width="99%" AutoGenerateColumns="False" OnRowCommand="list_RowCommand" OnRowCreated="list_RowCreated">
            <EmptyDataRowStyle CssClass="emptycss" />
            <Columns>
                <asp:BoundField DataField="FormID" HeaderText="主题ID">
                    <itemstyle horizontalalign="Center" width="50px" />
                </asp:BoundField>
           <asp:TemplateField HeaderText="状态">
              <itemstyle width="30px" horizontalalign="Center"/>
              <itemtemplate>
                   <a href="?action=status&formid=<%#Eval("formid")%>" <%# Convert.ToString(Eval("status"))=="0"?"class='no' title='禁用'":"class='ok' title='正常'" %>></a>
              </itemtemplate>
            </asp:TemplateField>
                <asp:BoundField DataField="subject" HeaderText="表单主题" />
                <asp:TemplateField HeaderText="开始日期/过期日期">
                    <itemstyle width="160px" horizontalalign="center" />
                    <itemtemplate>
                    <span class="tips">
                     <%# GetTimeStr(Convert.ToString(Eval("begindate")),Convert.ToString(Eval("expiredate")),Convert.ToInt32(Eval("timelimit"))) %>
                    <asp:Label runat="server" id="Label1"></asp:Label>
                    </span>
                    </itemtemplate>
                </asp:TemplateField>

            <asp:TemplateField HeaderText="IP限制">
              <itemstyle width="40px" horizontalalign="Center"/>
              <itemtemplate>
                   <a href="?action=limitip&formid=<%#Eval("formid")%>" <%# Convert.ToString(Eval("limitip"))=="0"?"class='no' title='否'":"class='ok' title='是'" %>></a>
              </itemtemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="会员限制">
              <itemstyle width="50px" horizontalalign="Center"/>
              <itemtemplate>
                   <a href="?action=usertf&formid=<%#Eval("formid")%>" <%# Convert.ToString(Eval("usertf"))=="0"?"class='no' title='否'":"class='ok' title='是'" %>></a>
              </itemtemplate>
            </asp:TemplateField>
            
                <asp:TemplateField HeaderText="↓表单项">
                <itemstyle width="70px" horizontalalign="Center" />
                     <itemtemplate>
                     <asp:LinkButton runat="server" commandargument=<%#Eval("formid") %> commandname="additem"><b>添加</b></asp:LinkButton>
                     <asp:LinkButton runat="server" commandargument=<%#Eval("formid") %> commandname="itemlist"><b>列表</b></asp:LinkButton>
               　</itemtemplate>
            　　</asp:TemplateField>

            <asp:TemplateField HeaderText="↓Html及调用">
                <itemstyle width="90px" horizontalalign="Center" />
                     <itemtemplate>
                     <asp:LinkButton runat="server" commandargument=<%#Eval("formid") %> commandname="create">创建</asp:LinkButton>
                     <asp:LinkButton runat="server" id="code" commandargument=<%#Eval("formid") %> commandname="code">调用</asp:LinkButton>
                     <asp:LinkButton runat="server" id="preview" commandargument=<%#Eval("formid") %> commandname="preview">预览</asp:LinkButton>
              </itemtemplate>
            </asp:TemplateField>
            
             <asp:TemplateField HeaderText="编辑">
              <itemstyle width="30px" horizontalalign="Center"/>
              <itemtemplate>
                     <asp:LinkButton ToolTip="编辑" CssClass="edit" ID="LinkButton1" runat="server" commandargument=<%#Eval("formid") %> commandname="modify"></asp:LinkButton>
              </itemtemplate>
            </asp:TemplateField>

             <asp:TemplateField HeaderText="删除">
              <itemstyle width="30px" horizontalalign="Center"/>
              <itemtemplate>
                     <asp:LinkButton ToolTip="删除" CssClass="delete" runat="server" id="delete" commandargument=<%#Eval("formid") %> commandname="del"></asp:LinkButton>
              </itemtemplate>
            </asp:TemplateField>
             <asp:TemplateField HeaderText="查看">
                <itemstyle width="30px" horizontalalign="Center" />
                     <itemtemplate>
                     <asp:LinkButton runat="server" ToolTip="查看提交记录" CssClass="preview" id="viewrecord" commandargument=<%#Eval("formid") %> commandname="viewrecord"></asp:LinkButton>
              </itemtemplate>
            </asp:TemplateField>
            
            </Columns>
            <HeaderStyle CssClass="CTitle" />
        </KS:KSGV>
        
        
       <KS:Page ID="Page1" runat="server" />

    </asp:Panel>
    
    
    <asp:Panel ID="addPanel" runat="server" Width="100%" Visible="false">
     <KS:TopNav runat="server" ID="top1" Text="添加表单项目" />


     <div class="tab-page" id="FormPanel">
         <script type="text/javascript">
             var tabPane1 = new WebFXTabPane(document.getElementById("FormPanel"), 1)
         </script>
             
		 <div class="tab-page" id="tab0">
		  <h2 class="tab">基本信息</h2>
			<script type="text/javascript">
			    tabPane1.addTabPage(document.getElementById("tab0"));
			</script>

     <table width="100%"  border="0" cellpadding="1" cellspacing="1" class="CTable"> 
          <tr>
            <td class="lefttd" height="30" align="right" style="width: 198px"><b>项目名称：</b></td>
            <td class="righttd">
                &nbsp;<asp:TextBox CssClass="textbox" ID="Subject" runat="server" Width="350px"></asp:TextBox>
                 <span class="tips">如：在线报名表</span><asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="Subject"
                    ErrorMessage="请填写项目名称!" Display="Dynamic"></asp:RequiredFieldValidator></td>
          </tr>
         <tr>
             <td align="right" class="lefttd" height="30" style="width: 198px">
                 <strong>启用时间限制：</strong></td>
             <td class="righttd">
              <input type="radio" id="TimeLimitTrue" name="TimeLimit" onclick="jQuery('#TimeArea').show();" runat="server" value="1" />启用
              <input type="radio" id="TimeLimitFalse" checked name="TimeLimit" onclick="jQuery('#TimeArea').hide();" runat="server" value="0" />不启用
              
             </td>
         </tr>
         <tbody id="TimeArea" style="display:none">
         <tr>
             <td align="right" class="lefttd" height="30" style="width: 198px">
             <strong>生效时间：</strong>
             </td>
             <td class="righttd"><script>isHour=1;</script>
               <asp:TextBox CssClass="textbox Wdate" ID="BeginDate" runat="server" onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'});"></asp:TextBox>
                <div style="color:Red">日期格式：0000-00-00 00:00:00</div>
             </td>
         </tr>
         <tr>
             <td align="right" class="lefttd" height="30" style="width: 198px">
             <strong>失效时间：</strong>
             </td>
             <td class="righttd">
                    <asp:TextBox CssClass="textbox Wdate" ID="ExpireDate" runat="server"  onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'});"></asp:TextBox>
                    <div style="color:Red">日期格式：0000-00-00 00:00:00</div>
             </td>
         </tr>
         </tbody>
          <tr>
             <td align="right" class="lefttd" height="30" style="width: 198px">
                 <strong>调用方式：</strong></td>
             <td class="righttd">
              <input type="radio" name="CodeType" id="CodeJavascript" runat="server" onclick="jQuery('#templatearea').hide();" value="1" checked />JavaScript调用
              <input type="radio" name="CodeType" id="CodePages" runat="server" value="2" onclick="jQuery('#templatearea').show();" />单独页面调用
             </td>
         </tr>
         <tbody id="templatearea" style="display:none">
            <tr>
             <td align="right" class="lefttd" height="30" style="width: 198px">
                 <strong>模板文件：</strong></td>
             <td class="righttd">
              <asp:TextBox CssClass="textbox" ID="FormTemplate" runat="server" Width="297px"></asp:TextBox>
              <input type="button" class="button" onMouseOver="this.className='button_on';" onMouseOut="this.className='button';" value="选择模板..." onClick="SelectTemplate('<%=this.FormTemplate.ClientID %>');"/>
            <br /> <span class="tips">模板里可用标签：{$FormContent}表单内容，{$FormName}表单名称，{$FormBeginDate}开始时间,{$FormExpireDate}结束时间。</span>
             </td>
         </tr>

         </tbody>
         <tr>
             <td align="right" class="lefttd" height="30" style="width: 198px">
                 <strong>生成文件名：</strong><br /><font color=red>一旦设定不可修改</font></td>
             <td class="righttd">
                 <asp:TextBox CssClass="textbox" ID="FileName" runat="server"></asp:TextBox>
                <span class="tips">如:200710102.html,kesion.aspx等。</span></td>
         </tr>
         <tr>
             <td align="right" class="lefttd" height="30" style="width: 198px">
                 <div>
                     <strong>表单备注：</strong></div>
             </td>
             <td class="righttd">
                 <asp:TextBox CssClass="textbox" ID="Descript" runat="server" Height="69px" TextMode="MultiLine" Width="352px"></asp:TextBox></td>
         </tr>
         <tr>
             <td align="right" class="lefttd" height="30" style="width: 198px">
                 <div>
                     <strong>用户提交成功提示消息：</strong></div>
             </td>
             <td class="righttd">
                 <asp:TextBox CssClass="textbox" ID="TxtSuccessTips" runat="server" Width="352px"></asp:TextBox>
                 <span class="tips">如：恭喜，您的数据已提交！</span>
                 </td>
         </tr>
         <tr>
             <td align="right" class="lefttd" height="30" style="width: 198px">
                 <div>
                     <strong>用户提交成功返回URL：</strong></div>
             </td>
             <td class="righttd">
                 <asp:TextBox CssClass="textbox" ID="TxtSuccessUrl" runat="server" Width="352px"></asp:TextBox>
                 <span class="tips">如：可以留空，或是输入要跳转到的URL地址！</span>
                 </td>
         </tr>
         <tr>
             <td align="right" class="lefttd" height="30" style="width: 198px">
                 <strong>表单状态：</strong></td>
             <td class="righttd">
                 <asp:RadioButtonList ID="Status" runat="server" RepeatDirection="Horizontal">
                     <asp:ListItem Selected="True" Value="1">正常</asp:ListItem>
                     <asp:ListItem Value="0">禁用</asp:ListItem>
                 </asp:RadioButtonList></td>
         </tr>
    </table>
     </div>
	    
		 <div class="tab-page" id="tab1">
		  <h2 class="tab">权限选项</h2>
			<script type="text/javascript">
			    tabPane1.addTabPage(document.getElementById("tab1"));
			</script>

      <table width="100%" border="0" cellpadding="1" cellspacing="1" class="CTable"> 
         <tr>
             <td align="right" class="lefttd" height="30" style="width: 198px">
                 <strong>每个IP只能提交一次：</strong></td>
             <td class="righttd">
                 <asp:RadioButtonList ID="LimitIP" runat="server" RepeatDirection="Horizontal">
                     <asp:ListItem Selected="True" Value="1">是</asp:ListItem>
                     <asp:ListItem Value="0">否</asp:ListItem>
                 </asp:RadioButtonList></td>
         </tr>
         <tr>
             <td align="right" class="lefttd" height="30" style="width: 198px">
                 <div>
                     <strong>只允许会员提交：</strong></div>
             </td>
             <td class="righttd">
                 <asp:RadioButtonList ID="UserTF" runat="server" RepeatDirection="Horizontal">
                     <asp:ListItem Selected="True" Value="1">是</asp:ListItem>
                     <asp:ListItem Value="0">否</asp:ListItem>
                 </asp:RadioButtonList></td>
         </tr>
         <tr>
             <td align="right" class="lefttd" height="30" style="width: 198px">
                 <div>
                     <strong>有上传字段时，只允许会员上传：</strong></div>
             </td>
             <td class="righttd">
                 <asp:RadioButtonList ID="RdbUploadUserTF" runat="server" RepeatDirection="Horizontal">
                     <asp:ListItem Selected="True" Value="1">是</asp:ListItem>
                     <asp:ListItem Value="0">否</asp:ListItem>
                 </asp:RadioButtonList></td>
         </tr>
         
         <tr>
             <td align="right" class="lefttd" height="30" style="width: 198px">
                 <div>
                     <strong>用户组限制：</strong></div>
                 <font color="#ff0000">只有启用只允许会员提交,才有效，若不限制，请不要选</font></td>
             <td class="righttd" id="GroupIDArea" runat="server">
               
             </td>
         </tr>
         <tr>
             <td align="right" class="lefttd" height="30" style="width: 198px">
                 <div>
                     <strong>每个会员只允许提交一次：</strong></div>
             </td>
             <td class="righttd">
                 <asp:RadioButtonList ID="UserOnce" runat="server" RepeatDirection="Horizontal">
                     <asp:ListItem Selected="True" Value="1">是</asp:ListItem>
                     <asp:ListItem Value="0">否</asp:ListItem>
                 </asp:RadioButtonList></td>
         </tr>
         <tr>
             <td align="right" class="lefttd" height="30" style="width: 198px">
                 <div>
                     <strong>提交结果发送到邮箱：</strong></div>
             </td>
             <td class="righttd">
                 <asp:RadioButtonList ID="RdbIsSendMail" runat="server" RepeatDirection="Horizontal">
                     <asp:ListItem Selected="True" Value="0">关闭</asp:ListItem>
                     <asp:ListItem Value="1">仅发送到管理员邮箱</asp:ListItem>
                     <asp:ListItem Value="2">仅发送到会员邮箱</asp:ListItem>
                     <asp:ListItem Value="3">同时发送到管理员和会员邮箱</asp:ListItem>
                 </asp:RadioButtonList></td>
         </tr>
        <tr id="mail" style="display:none">
             <td align="right" class="lefttd" height="30" style="width: 198px">
                 <div>
                     <strong>发送的邮件内容模板：</strong></div>
             </td>
             <td class="righttd">
                 <asp:TextBox ID="TxtMailTemplate" runat="server" Text="您好,{$GetUserName}！<br />&nbsp;&nbsp;&nbsp;&nbsp;以下是您在<span style='color:red'>{$GetSiteName}</span>提交[{$GetFormName}]的信息:<br />{$GetFormDetail}" TextMode="MultiLine" style="width:78%;height:230px;"></asp:TextBox>

                  <%
                      Kesion.APPCode.EditorAPI.EchoEditor("editor", TxtMailTemplate.ClientID, "Basic", 0, false, true);    
                  %> 

                 
                 <br /><strong>可用标签：</strong><br />
                 {$GetUserName} 当前登录用户名<br />
                 {$GetFormDetail} 表单提交的详情<br />
                 {$GetFormName} 表单名称<br />
                 {$GetSiteName}  网站名称<br />
                 {$GetSiteUrl} 网址域名</td>
         </tr>
         <tr>
             <td align="right" class="lefttd" height="30" style="width: 198px">
                 <div>
                     <strong>显示验证码：</strong></div>
             </td>
             <td class="righttd">
                 <asp:RadioButtonList ID="VerifyTF" runat="server" RepeatDirection="Horizontal">
                     <asp:ListItem Selected="True" Value="1">是</asp:ListItem>
                     <asp:ListItem Value="0">否</asp:ListItem>
                 </asp:RadioButtonList></td>
         </tr>
        
      </table>
      </div>
    </div>
    <script>
        function showMailTemplate() {
            var checkrad = jQuery("#<%=this.RdbIsSendMail.ClientID %> :radio[checked]").val();
            if (checkrad == "0") {
                jQuery("#mail").hide();
            } else {
                jQuery("#mail").show();
            }

        }
    </script>
      <br />
        <KS:Foot ID="Foot1" runat="server" SubmitButtonText="确定添加(0)" OnSubmit="Foot1_Submit" />
    </asp:Panel>
    
    <asp:Panel ID="viewPanel" runat="server" Width="100%" Visible="false">
        <KS:TopNav ID="TopNav1" runat="server" Text="预览表单" />
        <table width="100%" border="0" cellpadding="1" cellspacing="1" class="CTable"> 
          <tr>
            <td>
            <div id="showform" runat="server"></div>
            </td>
          </tr>
        </table>
        <br />
        <div style="text-align:center"><input class="button" onmouseover="this.className='button_on';" onmouseout="this.className='button';" type="button" onclick="javascript:history.back();" value="取消返回" /></div>
        
        &nbsp;</asp:Panel>


</asp:Content>

