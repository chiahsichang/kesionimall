<%@ Page Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.Admin_AskTopic" Title="问答问题管理" Codebehind="KS.AskTopic.aspx.cs" %>
<%@ Import Namespace="Kesion.Cache" %>
<%@ Import Namespace="Kesion.Publics" %>
<asp:Content ID="Content1" ContentPlaceHolderID="KSContent" Runat="Server">
    <asp:Panel ID="ListPanel" runat="server" Width="100%">
      <div id="manage_top" class="menu_top_fixed">
         <ul>

             
           <span style="float:right;padding-right:10px">
            <asp:DropDownList ID="DrpClassID1" runat="server" onchange="location.href='?classid='+this.value;">
             <asp:ListItem Value="0">--按分类查看--</asp:ListItem>
             </asp:DropDownList>
          </span>
          <strong>当前位置：</strong>
             <asp:Label ID="LabNav" runat="server"></asp:Label>
           </ul>
        </div> 
   <div class="menu_top_fixed_height"></div>   
   

        
       
 <div class="tabs_header">
    <ul class="tabs">
    <li<%=KSCMS.S("showType")==""?" class='active'":string.Empty %>>
        <a href="KS.AskTopic.Aspx"><span>所有问题</span></a></li>
    <li<%=KSCMS.S("showType")=="1"?" class='active'":string.Empty %>>
        <a href="KS.AskTopic.Aspx?showType=1">
        <span>未审核的问题</span></a></li>
    <li<%=KSCMS.S("showType")=="2"?" class='active'":string.Empty %>>
        <a href="KS.AskTopic.Aspx?showType=2">
        <span>已审核的问题</span></a></li>
    <li<%=KSCMS.S("showType")=="3"?" class='active'":string.Empty %>>
        <a href="KS.AskTopic.Aspx?showType=3">
        <span>未解决的问题</span></a></li>
    <li<%=KSCMS.S("showType")=="4"?" class='active'":string.Empty %>>
        <a href="KS.AskTopic.Aspx?showType=4">
        <span>已解决的问题</span></a></li>
    <li<%=KSCMS.S("showType")=="5"?" class='active'":string.Empty %>>
        <a href="KS.AskTopic.Aspx?showType=5">
        <span>有悬赏未解决的问题</span></a></li>
    <li<%=KSCMS.S("showType")=="6"?" class='active'":string.Empty %>>
        <a href="KS.AskTopic.Aspx?showType=6">
        <span>有悬赏已解决的问题</span></a></li>
    </ul></div><KS:ksgv id="list" cssclass="CTable" runat="server" AutoGenerateColumns="False" 
            EmptyDataText="没有任何问题!" PagerType="CustomNumeric" Width="99%" 
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
            
            <asp:TemplateField HeaderText="问题">
                <itemtemplate><a href="../../<%=MyCache.GetAskCacheConfig(1) %>/Question.aspx?id=<%# Eval("topicid") %>" target="_blank"><span class="doc_1"></span></a>
                [<%# MyCache.GetCacheAskCategory(Convert.ToInt32(Eval("classid")), "classname")%>]
                <a href="../../<%=MyCache.GetAskCacheConfig(1) %>/Question.aspx?id=<%# Eval("topicid") %>" target="_blank" title="<%# Utils.RemoveHtml(Convert.ToString(Eval("Title"))) %>"><%# Utils.CutStr(Utils.RemoveHtml(Convert.ToString(Eval("title"))),30) %></a>
                <%# Convert.ToInt16(Eval("reward"))>0?"<img src='../../ask/images/money.gif' align='absmiddle'/><span style='color:red'>"+ Eval("reward")+"</span>分":string.Empty%></itemtemplate></asp:TemplateField>
                
                <asp:TemplateField HeaderText="回答数">
                <itemstyle horizontalalign="Center" />
                <itemtemplate>
                <%# Eval("PostNum") %>
                </itemtemplate>
            </asp:TemplateField>
            <asp:BoundField HeaderText="提问者" DataField="username">
                <itemstyle verticalalign="Middle"  horizontalalign="Center"/>
            </asp:BoundField>
            <asp:BoundField HeaderText="更新时间" DataField="adddate">
                <itemstyle verticalalign="Middle"  horizontalalign="Center"/>
            </asp:BoundField>
            <asp:TemplateField HeaderText="问题属性">
                <itemstyle horizontalalign="Center" />
                <itemtemplate>
                <%#Convert.ToString(Eval("recommend"))=="1"?"<font color=green>荐</font>":"" %>
                <%#Convert.ToString(Eval("istop"))=="1"?"<font color=brown>顶</font>":"" %></itemtemplate></asp:TemplateField>
                <asp:TemplateField HeaderText="是否解决">
               
                <itemstyle horizontalalign="Center" />
                <itemtemplate>
                <%#Convert.ToString(Eval("IsSolve")) == "1" ? "<span style='color:green'>已解决</span>" : Convert.ToInt16(Eval("IsSolve"))==2?"已关闭":"<span style='color:red'>未解决</span>"%></itemtemplate>
                </asp:TemplateField>

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
             </asp:TemplateField>

        </Columns><HeaderStyle CssClass="CTitle" />
        <EmptyDataRowStyle CssClass="emptycss" />
    </KS:ksgv>
    
        <asp:Panel ID="Panel2" runat="server" Height="30px" Width="741px">
          <div style="margin-top:8px"></div>
            &nbsp;&nbsp;<input type="checkbox" name="chkall" id="chkall" onclick="CheckAll(this.form);"/><label for="chkall">全部选中</label>
            
           &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="button" value="删除记录" onmouseover="this.className='button_on';" onmouseout="this.className='button';" class="button" onclick="if (GetIDS('del')){this.form.action='?action=del';this.form.submit()}" />
           
            <asp:Button 
                ID="BtnVerify" runat="server" Text="批量审核" CssClass="button" 
                onclick="BtnVerify_Click"/> <asp:Button ID="BtnUnVerity" runat="server" CssClass="button" 
             Text="取消审核" onclick="BtnUnVerity_Click"/> <asp:Button ID="BtnRecommend" runat="server" Text="设为推荐" CssClass="button" 
            onclick="BtnRecommend_Click" />
        <asp:Button ID="BtnRecommend1" runat="server" CssClass="button" 
             Text="取消推荐" onclick="BtnRecommend1_Click" />
      </asp:Panel>
      
            
    <KS:Page ID="Page1" runat="server" />
    
    
     <div class="message">
<strong>搜索问题：</strong><asp:TextBox runat="server" ID="TxtKeyWord" CssClass="textbox" /> 

    <asp:Button ID="BtnSearch" runat="server" CssClass="button" Text="开始搜索" 
            onclick="BtnSearch_Click"  />
        </div>
    <asp:Panel ID="Panel1" runat="server" Height="30px" Width="100%">
      <br />
        <script type="text/javascript">
            showtips('<span class="state"><strong>问题属性对应说明：</strong></span><font color=green>荐</font>->推荐&nbsp;&nbsp;<font color=brown>顶</font>->固顶&nbsp;');
		</script>

            </asp:Panel>
</asp:Panel>


     
    <asp:Panel ID="AddPanel" runat="server"  Width="100%" Visible="false">
    <KS:TopNav ID="TopNav1" runat="server" Text="修改问题" />
    
    <div class="tab-page" id="sjPanel">
         <script type="text/javascript">
           var tabPane1 = new WebFXTabPane( document.getElementById( "sjPanel" ), 1 )
         </script>
             
		 <div class="tab-page" id="tab0">
		  <h2 class="tab">基本信息</h2><script type="text/javascript">
						 tabPane1.addTabPage( document.getElementById( "tab0" ) );
			</script><table width="100%" align="center" border="0" cellpadding="1" cellspacing="1" class="CTable"> 
          <tr>
            <td class="lefttd" height="30" align="right" style="width: 102px"><b>问题名称：</b></td><td class="righttd">
                &nbsp;<asp:TextBox CssClass="textbox" ID="TxtTitle" runat="server" Width="335px"></asp:TextBox><asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TxtTitle"
                    ErrorMessage="请填写问题名称!" Display="Dynamic"></asp:RequiredFieldValidator><span class="tips">如（2013年仿真高考数学卷）等</span></td></tr><tr>
            <td align="right" class="lefttd" height="30" style="width: 102px">
                <strong>问题分类：</strong></td><td class="righttd">
                &nbsp;
                
                <asp:DropDownList ID="DrpClassID" runat="server">
                    <asp:ListItem Value="0">--选择问题分类--</asp:ListItem></asp:DropDownList><span class="tips">建议选择最终级分类</span> 
              </td>
        </tr>
                    
         <tr>
            <td align="right" class="lefttd" height="30" style="width: 102px">
                <strong>问题介绍：</strong></td><td class="righttd">
                     <asp:TextBox ID="TxtIntro" runat="server" style="width:90%;height:200px;" TextMode="MultiLine"></asp:TextBox>
                  <%
                      Kesion.APPCode.EditorAPI.EchoEditor("editor", TxtIntro.ClientID, "Basic", 0, false, true);    
                  %>  
                </td></tr>
             <tr>
            <td align="right" class="lefttd" height="30" style="width: 102px">
                <strong>问题状态：</strong></td><td class="righttd">
             <asp:RadioButtonList ID="RdbVerify" runat="server" Width="137px" 
                    RepeatDirection="Horizontal" Height="24px">
              <asp:ListItem Value="1" Selected="True">已审核</asp:ListItem><asp:ListItem Value="0">未审核</asp:ListItem></asp:RadioButtonList></td></tr><tr>
            <td align="right" class="lefttd" height="30" style="width: 102px">
                <strong>关键字Tags：</strong></td><td class="righttd">
             <asp:TextBox ID="TxtKeyTags" runat="server" CssClass="textbox" Width="300px" /> 
            【<a href='javascript:;' onclick='GetKeyTags()' style='color:green'>根据问题名称自动获取Tags</a>】&nbsp;&nbsp;<font class='tips'>多个tags请用空格隔开</font>
             </td>
        </tr>
        </table>
      </div>
      

      
      <div class="tab-page" id="tab1">
		  <h2 class="tab">SEO选项</h2><script type="text/javascript">
			    tabPane1.addTabPage(document.getElementById("tab1"));
			</script><table style="width:100%;margin:0 auto;" cellpadding="2" cellspacing="1" class="CTable">
     <tr>
       <td class="lefttd" align="right"><strong>页面标题：</strong></td><td class="righttd">
          <asp:TextBox ID="TxtSeoTitle" runat="server" Width="400px"  CssClass="textbox" />
         <span class='tips'>留空则默认显示问题标题,模板里请用标签{KS:Field:SEOTitle}调用。</span>
        </td>
     </tr>
     <tr>
       <td class="lefttd" align="right"><strong>页面关键字：</strong>(meta_keywords)</td><td class="righttd">
          <asp:TextBox TextMode="MultiLine" Rows="5" ID="TxtSeoKeyWords" runat="server" Width="400px"  CssClass="textbox textarea" Height="100px" />
         <span class='tips'>留空则默认显示问题里设置的KeyWords,模板里请用标签{KS:Field:SEOKeyWords}调用。</span>
        </td>
     </tr>
     <tr>
       <td class="lefttd" align="right"><strong>页面描述：</strong>(meta_description)</td><td class="righttd">
          <asp:TextBox TextMode="MultiLine" Rows="5" ID="TxtSeoDescription" runat="server" Width="400px"  CssClass="textbox textarea" Height="100px" />
         <span class='tips'>留空则默认显示问题简介,模板里请用标签{KS:Field:SEODescription}调用。</span>
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
                if (jQuery('#<%=this.TxtTitle.ClientID %>').val() == '') {
                    KesionJS.Alert('问题名称必须输入!', "jQuery('#<%=this.TxtTitle.ClientID %>').focus()");
                    return false;
                }

                return true;
            }
        function GetKeyTags() {
            var text = escape(jQuery('#<%=this.TxtTitle.ClientID %>').val());
            if (text != '') {
                jQuery('#<%=this.TxtKeyTags.ClientID %>').val('请稍等,系统正在自动获取tags...').attr("disabled", true);
                jQuery.post("../../plus/ajaxs.ashx", { a: "GetTags", text: text },
				  function(data) { jQuery('#<%=this.TxtKeyTags.ClientID %>').val(unescape(data)).attr("disabled", false); });
            } else { KesionJS.Alert('对不起,请先输入问题名称!', "jQuery('#<%=this.TxtTitle.ClientID %>').focus();"); }
        }
    </script>
</asp:Content>
