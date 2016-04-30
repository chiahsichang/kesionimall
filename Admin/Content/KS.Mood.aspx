<%@ Page Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.Admin_Mood" Title="Untitled Page" Codebehind="KS.Mood.aspx.cs" %>
<%@ Import Namespace="Kesion.Cache"%>
<%@ Import Namespace="Kesion.Publics"%>
<asp:Content ID="Content1" ContentPlaceHolderID="KSContent" Runat="Server">
    <asp:Panel ID="listPanel" runat="server" Width="100%">
    <div id="manage_top" class="menu_top_fixed">
         <ul>
           <li id='p1'><asp:LinkButton ID="addMoodProjectBtn" runat="server" OnClick="addProject_Click"><b></b>添加项目</asp:LinkButton></li>
           <li id='p4'><asp:LinkButton ID="editMoodProjectBtn" runat="server" OnClick="editMoodProject_Click"><b></b>编辑项目</asp:LinkButton></li>
           <li id='p3'><asp:LinkButton ID="delMoodProjectBtn" runat="server" OnClick="delMoodProject_Click"><b></b>删除项目</asp:LinkButton></li>
           </ul>
        </div>  
       <div class="menu_top_fixed_height"></div> 
      <KS:KSGV ID="list" cssclass="CTable" runat="server" AutoGenerateColumns="False" Width="99%" EmptyDataText="没有添加任何心情指数项目" GridLines="None" OnRowDataBound="list_RowDataBound" OnRowCommand="list_RowCommand" OnRowCreated="list_RowCreated" AllowPaging="True">
          <Columns>
              <asp:TemplateField HeaderText="&lt;input type='checkbox' name='chkall' id='chkall' onClick='CheckAll(this.form);'/&gt;">
                <ItemStyle HorizontalAlign="Center"  Width="30px"/>
                <ItemTemplate>
                <input type="checkbox"  name="ids" id="ids" value="<%#Eval("projectid") %>" />
                </ItemTemplate>
                </asp:TemplateField>
             <asp:TemplateField HeaderText="项目名称">
             <itemtemplate>
             <%# Eval("projectname") %>  <a href="javascript:void(0)" style="color:green" onclick="parent.openWin('查看项目[<%# Eval("projectname") %> ]投票详情','Content/KS.MoodList.aspx?projectid=<%#Eval("projectid") %>',false,900,500)">查看详情</a>
             </itemtemplate>
             </asp:TemplateField>

             <asp:TemplateField HeaderText="状态">
              <itemstyle width="30px" horizontalalign="Center"/>
              <itemtemplate>
                   <a href="?action=status&id=<%#Eval("ProjectID")%>" <%# Convert.ToString(Eval("status"))=="0"?"class='no' title='锁定'":"class='ok' title='正常'" %>></a>
              </itemtemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="编辑">
                    <itemstyle width="30px" horizontalalign="Center"/>
                       <itemtemplate>
                        <asp:LinkButton ID="LinkButton1" CssClass="edit" runat="server" commandargument=<%#Eval("projectid") %> commandname="modify" ToolTip="修改"></asp:LinkButton>
                    </itemtemplate>
                </asp:TemplateField>
            <asp:TemplateField HeaderText="删除">
                    <itemstyle width="30px" horizontalalign="Center"/>
                       <itemtemplate>
             <asp:LinkButton runat="server" id="delete" CssClass="delete" commandargument=<%#Eval("projectid") %> commandname="del" ToolTip="删除"></asp:LinkButton>
                    </itemtemplate>
                </asp:TemplateField>

            <asp:TemplateField HeaderText="复制代码">
                <itemstyle width="80px" horizontalalign="Center" />
             <itemtemplate>
           <input type="button" class="button" onclick="top.openWin('复制心情指数调用代码','content/KS.Mood.aspx?action=copy&id=<%#Eval("projectid") %>',false,500,200);" value="调用代码"/>
               </itemtemplate>
            </asp:TemplateField>
          </Columns>
            <HeaderStyle CssClass="CTitle" />
            <EmptyDataRowStyle CssClass="emptycss" />
      </KS:KSGV>
	
 
    
    <KS:Page ID="Page1" runat="server" />
           

    </asp:Panel>
    
     <asp:Panel ID="addPanel" runat="server" Width="100%" Visible="false">
     <KS:TopNav ID="TopNav1" runat="server" />
      <script type="text/javascript">
            jQuery(document).ready(function(){
             showTime();
            });
         function showTime() {
             var checkrad = jQuery("#<%=this.RdbTimeLimit.ClientID %> :radio[checked]").val();
             if (checkrad == "1") {
                 jQuery("#Stime").show();
             } else {
             jQuery("#Stime").hide();
             }

             
            }
          function CheckForm(){
           if (jQuery("#<%=this.TxtProjectName.ClientID%>").val()=="")
		      {
		       
               KesionJS.Alert('请输入心情指数项目名称！','jQuery("#<%=this.TxtProjectName.ClientID%>").focus();'); 
		       return false;
		      }
		     return true;
          }
     </script>

     <div class="tab-page" id="MoodPanel">
         <script type="text/javascript">
           var tabPane1 = new WebFXTabPane( document.getElementById( "MoodPanel" ), 1 )
         </script>
             
		 <div class="tab-page" id="tab0">
		  <h2 class="tab">基本信息</h2>
			<script type="text/javascript">
						 tabPane1.addTabPage( document.getElementById( "tab0" ) );
			</script>

     
        <table width="100%" id="tab0" border="0" cellpadding="1" cellspacing="1" class="CTable"> 
          <tr>
            <td class="lefttd" height="30" align="right"><b>项目名称：</b></td>
            <td class="righttd">
                &nbsp;<asp:TextBox CssClass="textbox" ID="TxtProjectName" runat="server" Width="450px"></asp:TextBox> <font color=#ff0000>*</font>
               <span class="tips">如：新闻频道专用点评。</span></td>
          </tr>
            <tr>
                <td align="right" class="lefttd" height="30">
                    <strong>项目状态：</strong></td>
                <td class="righttd">
                    <asp:RadioButtonList ID="RdbStatus" runat="server" RepeatDirection="Horizontal">
                        <asp:ListItem Selected="True" Value="1">正常</asp:ListItem>
                        <asp:ListItem Value="0">锁定</asp:ListItem>
                    </asp:RadioButtonList></td>
            </tr>
            <tr>
                <td align="right" class="lefttd" height="30">
                    <strong>选项：</strong></td>
                <td class="righttd">
                
                <%
                    string[] projectArr = Utils.SplitString(projectContent, "@@@");
                    string nameValue = string.Empty;
                    string picValue = string.Empty;
                    for (int i = 1; i <=15; i++)
                    {
                        try
                        {
                            if (i <= projectArr.Length)
                            {
                                nameValue = projectArr[i - 1].Split('|')[0];
                                picValue = projectArr[i - 1].Split('|')[1];
                            }
                            else
                            {
                                nameValue = "";
                                picValue = "";
                            }
                        }
                        catch
                        {
                            nameValue = "";
                            picValue = "";
                        }

                        Response.Write(string.Format(@"{1}{0}、名称<input class='textbox' type='text' name='name{0}' size='12' value='{2}' /> 图片地址<input type='text' class='textbox' name='pic{0}' size='12' value='{3}'/><br/>", i.ToString(), i.ToString().Length == 1 ? "0" : "", nameValue, picValue));
                    }
                 %>    
                </td>
            </tr>
            </table>
           </div>
           
        <div class="tab-page" id="tab1">
		  <h2 class="tab">选项设置</h2>
			<script type="text/javascript">
						 tabPane1.addTabPage( document.getElementById( "tab1" ) );
			</script>

        <table width="100%" id="tab1" border="0" cellpadding="1" cellspacing="1" class="CTable"> 
            <tr>
                <td align="right" class="lefttd" height="30">
                    <strong>启用时间限制：</strong></td>
                <td class="righttd">
                <asp:RadioButtonList ID="RdbTimeLimit" runat="server" RepeatDirection="Horizontal" onclick="showTime()">
                 <asp:ListItem Value="0" Selected="True">不启用</asp:ListItem>
                 <asp:ListItem Value="1">启用</asp:ListItem>
                </asp:RadioButtonList>
                </td>
            </tr>
            <tbody id="Stime" style="display:none">
            <tr>
                <td align="right" class="lefttd" height="30">
                    <strong>生效时间：</strong></td>
                <td class="righttd"><asp:TextBox CssClass="textbox" ID="TxtStartDate" runat="server" onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'});"/>
                <div style="color:Red">日期格式：0000-00-00 00:00:00</div>
                </td>
            </tr>
            <tr>
                <td align="right" class="lefttd" height="30">
                    <strong>失效时间：</strong></td>
                <td class="righttd"><asp:TextBox CssClass="textbox" ID="TxtExpireDate" runat="server" onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'});"/>
                <div style="color:Red">日期格式：0000-00-00 00:00:00</div>
                </td>
            </tr>
            </tbody>
            <tr>
                <td align="right" class="lefttd" height="30">
                    <strong>只允许会员表态：</strong></td>
                <td class="righttd">
                    <asp:RadioButtonList ID="RdbOnlyUser" runat="server" RepeatDirection="Horizontal">
                 <asp:ListItem Value="1" Selected="True">是</asp:ListItem>
                 <asp:ListItem Value="0">不是</asp:ListItem>
                </asp:RadioButtonList></td>
            </tr>
            <tr>
                <td align="right" class="lefttd" height="30">
                    <strong>每个会员只能表态一次：</strong></td>
                <td class="righttd">
                    <asp:RadioButtonList ID="RdbUserOnce" runat="server" RepeatDirection="Horizontal">
                 <asp:ListItem Value="1" Selected="True">是</asp:ListItem>
                 <asp:ListItem Value="0">不是</asp:ListItem>
                </asp:RadioButtonList></td>
            </tr>
            <tr>
                <td align="right" class="lefttd" height="30">
                    <strong>用户组限制：</strong>
                    <div style="color:Red">不限制,请不要勾选</div>
                    </td>
                <td class="righttd">
                    <div id="GroupPanel" runat="server"></div>
                    
                </td>
            </tr>
       
        </table>
        </div>
     </div>
     
      <br />
      <div style="clear:both"></div>
      <br />
      <KS:Foot ID="Foot1" runat="server" OnSubmit="Foot1_Submit" />
    </asp:Panel>
    
    <asp:Panel Visible="false" ID="copyPannel" runat="server">
     <script type="text/javascript">
         function oCopy(obj) {

             obj.select(); js = obj.createTextRange();

             js.execCommand("Copy");

             alert("代码复制成功,请直接粘贴到要调用的模板上!");

         } 

     </script>
     <br />
     <table width="98%" align="center">
      <tr>
       <td></td>
       <td>tips:请双击以下输入框将代码复制到剪切板。</td>
      </tr>
      <tr>
       <td width="100" align="right">调用代码：</td>
       <td><asp:TextBox TextMode="MultiLine" Height="80px" CssClass="textbox" ondblclick="oCopy(this);" ID="TxtCode" runat="server" Width="350px" /></td>
      </tr>
      
     </table>
    </asp:Panel>

</asp:Content>

