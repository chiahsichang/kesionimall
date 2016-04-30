<%@ Page Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.Admin_BBSTopic" Title="论坛话题管理" Codebehind="KS.BBSTopic.aspx.cs" %>
<%@ Import Namespace="Kesion.Cache" %>
<%@ Import Namespace="Kesion.Publics" %>
<%@ Import Namespace="Kesion.HtmlTags" %>
<asp:Content ID="Content1" ContentPlaceHolderID="KSContent" Runat="Server">
    <asp:Panel ID="ListPanel" runat="server" Width="100%">
      <div id="manage_top" class="menu_top_fixed">
         <ul>
           <span style="float:right;padding-right:10px">
              <select name="board" onchange="location.href='?boardId='+this.value;">
                  <option value="0">==按版块浏览话题==</option>
                  <%=MyCache.GetCacheBoardOption(Utils.StrToInt(KSCMS.S("boardId"))) %>
              </select>
           
          </span>
          <strong>当前位置：</strong>
             <asp:Label ID="LabNav" runat="server"></asp:Label>
           </ul>
        </div> 
   <div class="menu_top_fixed_height"></div>   
   

        
       
 <div class="tabs_header">
    <ul class="tabs">
    <li<%=KSCMS.S("showType")==""?" class='active'":string.Empty %>>
        <a href="KS.BBSTopic.Aspx"><span>所有话题</span></a></li>
    <li<%=KSCMS.S("showType")=="1"?" class='active'":string.Empty %>>
        <a href="KS.BBSTopic.Aspx?showType=1">
        <span>未审核的话题</span></a></li>
    <li<%=KSCMS.S("showType")=="2"?" class='active'":string.Empty %>>
        <a href="KS.BBSTopic.Aspx?showType=2">
        <span>已审核的话题</span></a></li>
    <li<%=KSCMS.S("showType")=="3"?" class='active'":string.Empty %>>
        <a href="KS.BBSTopic.Aspx?showType=3">
        <span>置顶的话题</span></a></li>
    <li<%=KSCMS.S("showType")=="4"?" class='active'":string.Empty %>>
        <a href="KS.BBSTopic.Aspx?showType=4">
        <span>精华的话题</span></a></li>
    <li<%=KSCMS.S("showType")=="5"?" class='active'":string.Empty %>>
        <a href="KS.BBSTopic.Aspx?showType=5">
        <span>零回复的话题</span></a></li>

    </ul></div><KS:ksgv id="list" cssclass="CTable" runat="server" AutoGenerateColumns="False" 
            EmptyDataText="没有任何话题!" PagerType="CustomNumeric" Width="99%" 
           GridLines="None" OnRowCommand="List_RowCommand" 
            OnRowCreated="List_RowCreated" onrowdatabound="list_RowDataBound">
        <Columns>
         <asp:TemplateField HeaderText="选择">
                <itemstyle horizontalalign="Center" Height="30px" width="30px" />
                <itemtemplate>
                <input type="checkbox"  name="ids" id="ids" value="<%#Eval("topicid") %>" /></itemtemplate></asp:TemplateField>
             <asp:BoundField HeaderText="ID号" DataField="TopicID" Visible="false">
                <itemstyle horizontalalign="Center" />
            </asp:BoundField>

             <asp:TemplateField HeaderText="状态">
              <itemstyle width="30px" horizontalalign="Center"/>
              <itemtemplate>
                   <a href="?action=verify&ids=<%#Eval("topicID")%>" <%# Convert.ToString(Eval("verify"))=="0"?"class='no' title='未审核'":"class='ok' title='已审核'" %>></a>
              </itemtemplate>
            </asp:TemplateField>
            
            <asp:TemplateField HeaderText="话题">
                <itemtemplate> [<%# MyCache.GetCacheBBSCategory(Convert.ToInt32(Eval("boardId")), "boardname")%>]
                <a href="<%#BasicField.GetClubShowUrl(Utils.StrToInt(Eval("topicid"))) %>" target="_blank" ><%# Utils.CutStr(Convert.ToString(Eval("content")),80) %></a>
            </itemtemplate></asp:TemplateField>
                
                <asp:TemplateField HeaderText="回复/浏览">
                <itemstyle horizontalalign="Center" />
                <itemtemplate>
                <%# Eval("PostNum") %>/<%# Eval("Hits") %>
                </itemtemplate>
            </asp:TemplateField>
            <asp:BoundField HeaderText="提问者" DataField="username">
                <itemstyle verticalalign="Middle"  horizontalalign="Center"/>
            </asp:BoundField>
            <asp:BoundField HeaderText="更新时间" DataField="adddate">
                <itemstyle verticalalign="Middle"  horizontalalign="Center"/>
            </asp:BoundField>
            <asp:TemplateField HeaderText="话题属性">
                <itemstyle horizontalalign="Center" />
                <itemtemplate>
                <%#Convert.ToString(Eval("isbest"))=="1"?"<font color=green>精</font>":"" %>
                <%#Convert.ToString(Eval("istop"))=="1"?"<font color=brown>顶</font>":"" %></itemtemplate></asp:TemplateField>
               

                <asp:TemplateField HeaderText="编辑">
                       <itemstyle horizontalalign="Center" width="25px"/>
                        <itemtemplate>
                          <asp:LinkButton CssClass="edit" ToolTip="编辑" ID="LinkButton1" runat="server" commandargument=<%#Eval("topicid") %> commandname="modify"></asp:LinkButton>
                        </itemtemplate>
                    </asp:TemplateField>

               <asp:TemplateField HeaderText="删除">
                <itemstyle horizontalalign="Center" width="25px"/>
             <itemtemplate>
             <asp:LinkButton CssClass="delete" ToolTip="删除" runat="server" id="delete" commandargument=<%#Eval("topicid") %> commandname="del"></asp:LinkButton></itemtemplate>
             </asp:TemplateField></Columns><HeaderStyle CssClass="CTitle" />
        <EmptyDataRowStyle CssClass="emptycss" />
    </KS:ksgv>
    
        <asp:Panel ID="Panel2" runat="server" Height="30px">
          <div style="margin-top:8px"></div>
            &nbsp;&nbsp;<input type="checkbox" name="chkall" id="chkall" onclick="CheckAll(this.form);"/><label for="chkall">全部选中</label>
            
           &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="button" value="删除记录" onmouseover="this.className='button_on';" onmouseout="this.className='button';" class="button" onclick="if (GetIDS('del')){this.form.action='?action=del';this.form.submit()}" />
           
            <asp:Button 
                ID="BtnVerify" runat="server" Text="批量审核" CssClass="button" 
                onclick="BtnVerify_Click"/> <asp:Button ID="BtnUnVerity" runat="server" CssClass="button" 
             Text="取消审核" onclick="BtnUnVerity_Click"/>
            
         <asp:Button ID="BtnIsBest" runat="server" Text="设为精华" CssClass="button" 
            onclick="BtnIsBest_Click" />
        <asp:Button ID="BtnIsBest1" runat="server" CssClass="button" 
             Text="取消精华" onclick="BtnIsBest1_Click" />

         <asp:Button ID="Button1" runat="server" Text="设为置顶" CssClass="button" OnClick="Button1_Click"  />
         <asp:Button ID="Button3" runat="server" Text="设为总置顶" CssClass="button" OnClick="Button3_Click"  />
        <asp:Button ID="Button2" runat="server" CssClass="button"  Text="取消置顶" OnClick="Button2_Click" />


      </asp:Panel>
      
            
    <KS:Page ID="Page1" runat="server" />
    
    
     <div class="message">
<strong>搜索话题：</strong><asp:TextBox runat="server" ID="TxtKeyWord" CssClass="textbox" /> 

    <asp:Button ID="BtnSearch" runat="server" CssClass="button" Text="开始搜索" 
            onclick="BtnSearch_Click"  />
        </div>
    <asp:Panel ID="Panel1" runat="server" Height="30px" Width="100%">
      <br />
        <script type="text/javascript">
            showtips('<span class="state"><strong>话题属性对应说明：</strong></span><font color=green>荐</font>->推荐&nbsp;&nbsp;<font color=brown>顶</font>->固顶&nbsp;');
		</script>

            </asp:Panel>
</asp:Panel>


     
    <asp:Panel ID="AddPanel" runat="server"  Width="100%" Visible="false">
    <KS:TopNav ID="TopNav1" runat="server" Text="修改话题" />
    
    <div class="tab-page" id="bbsPanel">
         <script type="text/javascript">
           var tabPane1 = new WebFXTabPane( document.getElementById( "bbsPanel" ), 1 )
         </script>
             
		 <div class="tab-page" id="tab0">
		  <h2 class="tab">基本信息</h2><script type="text/javascript">
						 tabPane1.addTabPage( document.getElementById( "tab0" ) );
			</script><table width="100%" border="0" cellpadding="1" cellspacing="1" class="CTable"> 
         <tr>
            <td align="right" class="lefttd" height="30" style="width: 102px">
                <strong>话题版面：</strong></td>
             <td class="righttd"><asp:Label ID="LabBoardId" runat="server"></asp:Label>
                <span class="tips">建议选择最终级版面</span> 
              </td>
        </tr>
                    
         <tr>
            <td align="right" class="lefttd" height="30" style="width: 102px">
                <strong>话题介绍：</strong></td><td class="righttd">
                     <asp:TextBox ID="TxtIntro" runat="server" style="width:75%;height:200px;" TextMode="MultiLine"></asp:TextBox>
                 
                </td></tr>
             <tr>
            <td align="right" class="lefttd" height="30" style="width: 102px">
                <strong>话题状态：</strong></td><td class="righttd">
             <asp:RadioButtonList ID="RdbVerify" runat="server" Width="137px" 
                    RepeatDirection="Horizontal" Height="24px">
              <asp:ListItem Value="1" Selected="True">已审核</asp:ListItem><asp:ListItem Value="0">未审核</asp:ListItem></asp:RadioButtonList></td></tr><tr>
            <td align="right" class="lefttd" height="30" style="width: 102px">
                <strong>关键字Tags：</strong></td><td class="righttd">
             <asp:TextBox ID="TxtKeyTags" runat="server" CssClass="textbox" Width="300px" /> 
            【<a href='javascript:;' onclick='GetKeyTags()' style='color:green'>根据话题名称自动获取Tags</a>】&nbsp;&nbsp;<font class='tips'>多个tags请用空格隔开</font>
             </td>
        </tr>
        </table>
      </div>
      


      
   </div>
      <asp:Label ID="labsjinfo" runat="server"></asp:Label><div style="clear:both;text-align:center">
      <br />
        <KS:Foot ID="Foot1" runat="server" OnSubmit="Foot1_Submit" />
      
    </asp:Panel>
        <script>
            function CheckForm() {
                if (jQuery('#<%=this.TxtIntro.ClientID %>').val() == '') {
                    KesionJS.Alert('话题名称必须输入!', "jQuery('#<%=this.TxtIntro.ClientID %>').focus()");
                    return false;
                }

                return true;
            }
        function GetKeyTags() {
            var text = escape(jQuery('#<%=this.TxtIntro.ClientID %>').val());
            if (text != '') {
                jQuery('#<%=this.TxtKeyTags.ClientID %>').val('请稍等,系统正在自动获取tags...').attr("disabled", true);
                jQuery.post("../../plus/ajaxs.ashx", { a: "GetTags", text: text },
				  function(data) { jQuery('#<%=this.TxtKeyTags.ClientID %>').val(unescape(data)).attr("disabled", false); });
            } else { KesionJS.Alert('对不起,请先输入话题名称!', "jQuery('#<%=this.TxtIntro.ClientID %>').focus();"); }
        }
    </script>
</asp:Content>
