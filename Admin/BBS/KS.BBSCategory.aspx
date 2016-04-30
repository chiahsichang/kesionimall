<%@ Page Language="C#" ValidateRequest="false" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.Admin_BBSClass" Title="论坛版面管理" Codebehind="KS.BBSCategory.aspx.cs" %>
<%@ Import Namespace="Kesion.Cache" %>
<%@ Import Namespace="Kesion.Publics" %>
<asp:Content ID="Content1" ContentPlaceHolderID="KSContent" Runat="Server">
         
     <asp:Panel ID="ClassList" runat="server" Width="100%">
     <div id="manage_top" class="menu_top_fixed">
       <ul>
         <li id='p1'><asp:LinkButton ID="addbutton" runat="server" OnClick="lbtaddmodel_Click"><b></b>添加论坛版面</asp:LinkButton></li>
         <li id='p3'><asp:LinkButton ID="delbutton" runat="server" OnClientClick="if (GetIDS('del')){return true}else{return false}" onclick="BtnDelete_Click"><b></b>删除版面</asp:LinkButton></li>
         <li id='p5'><asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click"><b></b>一级版面排序</asp:LinkButton></li>
         <li id='p7'><asp:LinkButton ID="LinkButton2" runat="server" OnClick="LinkButton2_Click"><b></b>N级版面排序</asp:LinkButton></li>
      <li id='p6'><asp:LinkButton ID="LinkButton3" runat="server"  onclick="LinkButton3_Click"><b></b>一键重计版面主题数</asp:LinkButton></li> </ul>
     </div>
     <div class="menu_top_fixed_height"></div>   
 <script type="text/javascript">
function ExtSub(ID,event) {//阻止冒泡调用parent
    var e = (event) ? event : window.event;
    if (window.event) {//IE
        e.cancelBubble = true;
    } else { //FF
        e.stopPropagation();
    }
    if (jQuery('#C'+ID).attr('class')=="tree_Close")
    {       
        jQuery('#C'+ID).attr('class','tree_Open');
        if ($(".CTable").find("tr[attr*=',"+ID+",']").length>0){
            $(".CTable").find("tr[attr*=',"+ID+",']").show();
        }else{
            jQuery('#ajaxmsg',window.parent.document).toggle();
            jQuery.ajax({
                type: "POST",
                url: "KS.BBSCategory.aspx",
                data: "parentid="+ID+"&action=ExtSub",
                success: function (data) {
                    jQuery('#ajaxmsg',window.parent.document).toggle();
                    jQuery("#sub"+ID).after(data);
                    //jQuery("#sub"+ID).html(data);
                }
            });
        }
    }
    else{
        $(".CTable").find("tr[attr*=',"+ID+",']").hide();
        jQuery('#C'+ID).attr('class','tree_Close');
    }
}
</script>
 

      <asp:Repeater ID="list" runat="server">
          <HeaderTemplate>
           <table width="99%" align="center" cellpadding="0" cellspacing="0" class="CTable">
           <tr class="CTitle">
				<th scope="col"><input type="checkbox" name="chkall" onclick="CheckBox(this.checked);" for="chkall"/></th>
				<th scope="col">版面ID</th>
                <th scope="col" style="text-align:left">版面名称(<a class="tips" style="font-weight:normal" href="KS.BBSCategory.aspx?action=showall">展开</a>)</th>
				<th>问题数</th>
				<th scope="col">序号</th>
                <th scope="col">管理操作</th>
			</tr>
          </HeaderTemplate>
          <ItemTemplate>
            <tr id='sub<%#Eval("BoardID") %>'  onmouseover="jQuery('#a<%# Eval("BoardID") %>').show();this.className='CtrMouseOver'" onmouseout="jQuery('#a<%# Eval("BoardID") %>').hide();this.className='CtrMouseOut'" onclick="chk(this)">
             <td class="Ctd" style="text-align:center;width:30px;"><input type="checkbox" name="ids" value='<%#Eval("BoardID")%>' /></td>
             <td class="Ctd" style="text-align:center;width:50px;"><%# Eval("BoardID") %></td>
             <td class="Ctd" style="height:30px;width:450px;">
                <%if (KSCMS.S("Action") != "showall")
               { %>
             <a href="javascript:void(0)" onclick='ExtSub("<%# Eval("BoardID") %>",event);' style='text-decoration:none'><%# getClassName(Convert.ToInt32(Eval("BoardID")),Eval("BoardName", "{0}"), Convert.ToInt16(Eval("child")), Convert.ToInt16(Eval("NextID")), Convert.ToInt16(Eval("depth", "{0}")), 1)%></a><%}
               else
               { %><%# getClassName(Convert.ToInt32(Eval("BoardID")),Eval("BoardName", "{0}"), Convert.ToInt16(Eval("child")), Convert.ToInt16(Eval("NextID")), Convert.ToInt16(Eval("depth", "{0}")), 1)%><%} %>
                   <span id="a<%# Eval("BoardID") %>" style="display:none;padding-left:20px">
                <a style="color:#999" href="KS.BBSCategory.Aspx?action=add&parentid=<%# Eval("BoardID") %>">添加子版面</a>
               </span>
               </td>
             <td class="Ctd" align="center" >
              主题：<%# Eval("TopicNum") %>帖子：<%#Eval("postNum") %></td>
             <td class="Ctd" align="center" style="width:50px;"><%# Container.ItemIndex + 1 + (CurrPage - 1) * PageSize%></td>
             <td class="Ctd" align="center">
              <a href="KS.BBSCategory.Aspx?action=edit&BoardID=<%# Eval("BoardID") %>">编辑</a>
              <a href="KS.BBSCategory.Aspx?Action=del&Ids=<%# Eval("BoardID") %>" onclick="return(confirm('删除版面，同时删除该版面下的问答，此操作不可逆，确定删除版面吗?'));">删除</a>
              <a href='<%# GetClassUrl(Convert.ToInt16(Eval("BoardID"))) %>'target="_blank">预览</a>
             </td>
            </tr>
            <tr>
             <td colspan="5"></td>
            </tr>
          </ItemTemplate>
          <FooterTemplate>
               <tr style="display:<%# bool.Parse((list.Items.Count==0).ToString())?"":"none"%>">
                <td class="Ctd" style="text-align:center" colspan="5">
                 <asp:LinkButton ID="addbutton" runat="server" OnClick="lbtaddmodel_Click"> 还没有添加任何版面，点此添加版面&raquo;</asp:LinkButton>
                </td>
               </tr> 
          </table>
          </FooterTemplate>
         </asp:Repeater>
         
          <KS:Page ID="Page1" runat="server" />
         <!--
          <br />
        <script type="text/javascript">
            showtips('<span class="state"><strong>操作说明：</strong><br /></span>可使用标签{$GetBBSCategory}在前台模板调用出论坛版面。');
		</script>
         -->
        </asp:Panel> 
        
        <asp:Panel ID="ClassAdd" runat="server" Width="100%">
        <script>
	        function setFileFileds(num){    
             for(var i=1,str="";i<=20;i++){
	            jQuery("#define" + i).css("display","none");
              }
             for(var i=1,str="";i<=num;i++){	jQuery("#define" + i).css("display","");
                 }
            }

            function CheckAddMode() {
                if (jQuery("#AddType")[0].checked == true) {
                    jQuery("#AddOne").hide();
                    jQuery("#AddMore").show();
                } else {
                    jQuery("#AddOne").show();
                    jQuery("#AddMore").hide();
                }
            }

            function CheckForm() {
                if (jQuery('#<%=this.BoardName.ClientID %>').val() == '' && jQuery("#AddType")[0].checked == false) {
                    KesionJS.Alert('请输入论坛版面名称！', "jQuery('#<%=this.BoardName.ClientID %>').focus()");
                    return false;
                } else if (jQuery("#AddType")[0].checked == true && jQuery('#<%=this.TxtMoreBoardName.ClientID %>').val() == '') {
                    KesionJS.Alert('请按格式输入论坛版面名称,一行表示一个版面！', "jQuery('#<%=this.TxtMoreBoardName.ClientID %>').focus()");
                    return false;
                }
            }
            function showPurview(){
                var checkrad=jQuery("#<%=this.RdbVisitorView.ClientID%> :radio[checked]").val();
                if (checkrad=="1"){
                    jQuery("#showpurview").hide();
                }else{
                    jQuery("#showpurview").show();
                }
            }
            $(document).ready(function(){
                showPurview();
            });
	    </script>
	    

        <KS:TopNav ID="TopNav1" runat="server" Text="添加新论坛版面" />
        <br />
        
        
       	<div class="tab-page" id="BBSClassPanel">
         <script type="text/javascript">
             var tabPane1 = new WebFXTabPane(document.getElementById("BBSClassPanel"), 1)
         </script>
             
		 <div class="tab-page" id="tab0">
		  <h2 class="tab">基本信息</h2>
			<script type="text/javascript">
						 tabPane1.addTabPage( document.getElementById( "tab0" ) );
			</script>
			
             <table width="100%" border="0" cellpadding="1" cellspacing="1" class="CTable">
				   <tr>
                       <td align="right" class="lefttd" style=" height: 37px;"><strong>
                           所属版面：</strong><br>
                         </td>
                         <td class="righttd" style="height: 37px">
                             <asp:DropDownList ID="ParentID" runat="server">
                             <asp:ListItem Value="0">-无（作为一级版面）-</asp:ListItem>
                             </asp:DropDownList>&nbsp;
                             <span id="ParentIDMessage" runat="server"></span>
                       </td>
                     </tr>
                     
                     
                     
                    <tr>
                    <td class="lefttd" height="30" align="right" style="width: 145px">
                        <strong> 版面名称：</strong></td>
                    <td class="righttd">
                       <span id="AddOne">
                        <asp:TextBox CssClass="textbox" ID="BoardName" runat="server"></asp:TextBox>
                        <span class="tips">*请输入版面名称，如：情感交流、家居生活等</span>
                       </span>
                        <label style="<%=KSCMS.S("action")=="edit"?"display:none;":"" %>font-weight:bold;color:Green"><input onclick="CheckAddMode()" type="checkbox" name="AddType" id="AddType" value="1" />切换到批量添加模式</label>
                       <div id="AddMore" style="display:none">
                          <font color=red>一行代表一个版面</font><br />
                          <asp:TextBox Text="版面名称1" ID="TxtMoreBoardName" runat="server" CssClass="textbox" TextMode="MultiLine" Width="250px" Height="150px"></asp:TextBox>
                         </div>
                         </td>
                  </tr>



                <tr id="IntroArea">
                    <td align="right"  class="lefttd" style=" height: 50px;">
                        <strong>版面介绍：</strong><br />
                        </td>
                    <td  class="righttd" style="height: 50px">
                        <asp:TextBox CssClass="textbox textarea" ID="TxtIntro" runat="server" rows="6" TextMode="MultiLine" Width="383px" Height="80px"></asp:TextBox>
                         <a class="textarea_min" href="javascript:zoomtextarea(-5,'<%=this.TxtIntro.ClientID %>');"></a>
                         <a class="textarea_max" href="javascript:zoomtextarea(5,'<%=this.TxtIntro.ClientID %>');"></a>
                          <br />
                          <font class='tips'>简要介绍版面信息，不超过255个字符。</font> 
                        </td>
                  </tr>
                  <tr>
                    <td  height="30" class="lefttd" align="right">
                        <strong>版面图标：</strong></td>
                    <td class="righttd">
                        <asp:TextBox CssClass="textbox" ID="TxtICO" runat="server" Width="380px"></asp:TextBox>&nbsp;<input type="button" class="button" onclick="SelectFiles('<%=this.TxtICO.ClientID %>',101);" value="选择图片">
                        <br />
                        <font class='tips'>用于在版面页显示指定的图片</font>
                        </td>
                 </tr>
              
               <tr>
                    <td  height="30" class="lefttd" align="right" style="width: 155px">
                        <strong>版主：</strong></td>
                    <td class="righttd">
                        <asp:TextBox CssClass="textbox" ID="TxtBoardMaster" runat="server" Width="380px"></asp:TextBox>&nbsp;
                        <font class='tips'>多个版主请用英文逗号隔开。</font>
                        </td>
                 </tr>
              
                <tr>
                    <td  height="30" class="lefttd" align="right" style="width: 155px">
                        <strong>本版面列表启用缓存：</strong></td>
                    <td class="righttd">
                        列表页前<asp:TextBox Text="0" CssClass="textbox" ID="TxtCacheNum" runat="server" style="text-align:center" Width="50px"></asp:TextBox>页启用缓存 
                        <span class="tips">tips:建议设置不超过100页，设置“0”不启用缓存。</span>
                        </td>
                 </tr>
                 <tr>
                    <td  height="30" class="lefttd" align="right" style="width: 155px">
                        <strong>本版面分页方式：</strong></td>
                    <td class="righttd">
                      <asp:RadioButtonList ID="RdbPageType" runat="server" RepeatLayout="Flow" RepeatDirection="Horizontal">
                          <asp:ListItem Value="0">普通分页</asp:ListItem>
                          <asp:ListItem Value="1" Selected="True">滚动条加载</asp:ListItem>
                      </asp:RadioButtonList>    
                    </td>
                 </tr>
                <tr>
                    <td  height="30" class="lefttd" align="right" style="width: 155px">
                        <strong>分页设置：</strong></td>
                    <td class="righttd">
                        每页加载<asp:TextBox Text="0" CssClass="textbox" ID="TxtRollTopicPageNum" runat="server" style="text-align:center" Width="50px"></asp:TextBox>条话题
                        话题详细页每页加载<asp:TextBox Text="0" CssClass="textbox" ID="TxtRollReplyPageNum" runat="server" style="text-align:center" Width="50px"></asp:TextBox>条回复
                        </td>
                 </tr>
                <tr>
                    <td  height="30" class="lefttd" align="right" style="width: 155px">
                        <strong>热帖设置：</strong></td>
                    <td class="righttd">
                        浏览数大于<asp:TextBox Text="0" CssClass="textbox" ID="TxtHotTopicHits" runat="server" style="text-align:center" Width="50px"></asp:TextBox>次且回复数大于<asp:TextBox Text="0" CssClass="textbox" ID="TxtHotReplyHits" runat="server" style="text-align:center" Width="50px"></asp:TextBox>楼时自动转为热帖
                        </td>
                 </tr>
                  
              
          </table>	

        </div>

      <div class="tab-page" id="post">
		  <h2 class="tab">发帖权限</h2>
			<script type="text/javascript">
			    tabPane1.addTabPage(document.getElementById("post"));
			</script>
			
           <table width="100%" border="0" cellpadding="1" cellspacing="1" class="CTable">
                   <tr>
                    <td  height="30" align="right"  class="lefttd" style="width: 145px">
                        <strong>新用户注册</strong>：<br />
                      </td>
                    <td class="righttd">
                        <asp:TextBox  ID="Txt1" style="text-align:center" Text="20" CssClass="textbox" runat="server"  Width="50px"></asp:TextBox>分钟后才可以在本版面发帖
                        </td>
                   </tr>
                 <tr>
                    <td  height="30" align="right"  class="lefttd" style="width: 145px">
                        <strong>是否允许游客浏览</strong>：<br />
                      </td>
                    <td class="righttd">
                         <asp:RadioButtonList ID="RdbVisitorView" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow">
                             <asp:ListItem Value="1" Selected="True">允许</asp:ListItem>
                             <asp:ListItem Value="0">不允许</asp:ListItem>
                         </asp:RadioButtonList>
                    </td>
                   </tr>
               <tbody id="showpurview">
                 <tr>
                    <td  height="30" align="right"  class="lefttd" style="width: 145px">
                        <strong>浏览权限授权</strong>：<br />
                      </td>
                    <td class="righttd">
                        <strong>1、限制会员组:(不限制请不要勾选) </strong><br />
                        <asp:Label ID="LabGroupID" runat="server" Text=""></asp:Label>
                        <strong>2、认证会员</strong><br />
                        <asp:TextBox ID="TxtUserNames" runat="server" CssClass="textbox" Width="600" Height="100" TextMode="MultiLine"></asp:TextBox>
                        <br /> <span class="tips">多个会员允许查看，请用英文逗号隔开。</span>
                        <!--<br />
                        <strong>3、有效期限制</strong><br />
                        <asp:RadioButtonList ID="RdbLimitValidDays" runat="Server">
                            <asp:ListItem Value="0" Selected="True">不启用有效期限制</asp:ListItem>
                            <asp:ListItem Value="1">有效期用户都可以浏览</asp:ListItem>
                            <asp:ListItem Value="2">有效期用户还需要最高满足以上任一条件才能浏览</asp:ListItem>
                        </asp:RadioButtonList>    -->
                    </td>
                   </tr>
               </tbody>
                 <tr>
                    <td  height="30" align="right"  class="lefttd" style="width: 145px">
                        <strong>是否允许上传附件</strong>：<br />
                      </td>
                    <td class="righttd">
                         <asp:RadioButtonList ID="RdbUpload" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow">
                             <asp:ListItem Value="1" Selected="True">允许</asp:ListItem>
                             <asp:ListItem Value="0">不允许</asp:ListItem>
                         </asp:RadioButtonList>
                    </td>
                   </tr>

                 <tr>
                     <td  height="30" align="right"  class="lefttd" style="width: 145px">
                        <strong>发表话题限制</strong>：<br />
                      </td>
                    <td class="righttd">
                        一天内每个会员最多只能发表
                        <asp:TextBox ID="Txt2" Text="0" style="text-align:center" runat="server" CssClass="textbox" Width="50px"></asp:TextBox>
                        个话题 发帖字数不少于
                        <asp:TextBox ID="Txt3" Text="0" style="text-align:center" runat="server" CssClass="textbox" Width="50px"></asp:TextBox>
                        个字 发帖间隔时间
                        <asp:TextBox ID="Txt4" Text="0" style="text-align:center" runat="server" CssClass="textbox" Width="50px"></asp:TextBox>
                        秒 
                        <span class="tips">不限制请输入“0”。</span> 
                        <br />
                        发帖时间从
                        <asp:TextBox ID="Txt5" Text="0" style="text-align:center" runat="server" CssClass="textbox" Width="50px"></asp:TextBox>
                         -
                       <asp:TextBox ID="Txt6" Text="0" style="text-align:center" runat="server" CssClass="textbox" Width="50px"></asp:TextBox>
                         点不能发帖 <span class="tips">不限制请输入“0”。</span> 
                    </td>

                 </tr>

                   </table>
             </div>
        
        <div class="tab-page" id="score">
		  <h2 class="tab">积分规则</h2>
			<script type="text/javascript">
			    tabPane1.addTabPage(document.getElementById("score"));
			</script>
			
             <table width="100%" border="0"  cellpadding="1" cellspacing="1" class="CTable">
            <tr>
                    <td  height="30" align="right"  class="lefttd" style="width: 145px">
                        <strong>发表话题</strong>：<br />
                      </td>
                    <td class="righttd">
                         增加 <asp:TextBox ID="TxtScore1" style="text-align:center" Text="0" runat="server" CssClass="textbox" Width="50px"></asp:TextBox>分 
                        <span class="tips">不送积分请设置“0”</span>
                    </td>
                   </tr>
            <tr>
                    <td  height="30" align="right" class="lefttd" style="width: 145px">
                        <strong>发表回复</strong>：<br />
                      </td>
                    <td class="righttd">
                        增加
                          <asp:TextBox ID="TxtScore2"  style="text-align:center" Text="0" runat="server" CssClass="textbox" Width="50px"></asp:TextBox>分 
                         <span class="tips">不送积分请设置“0”，自问自答的话题回复不加积分。</span>
                    </td>
                   </tr>
            <tr>
                    <td  height="30" align="right"  class="lefttd" style="width: 145px">
                        <strong>设置精华</strong>：<br />
                      </td>
                    <td class="righttd">
                        增加
                          <asp:TextBox ID="TxtScore3" style="text-align:center" Text="0" runat="server" CssClass="textbox" Width="50px"></asp:TextBox>分 
                         <span class="tips">不送积分请设置“0”</span>
                    </td>
                   </tr>
             <tr>
                    <td  height="30" align="right"  class="lefttd" style="width: 145px">
                        <strong>设置版面置顶</strong>：<br />
                      </td>
                    <td class="righttd">
                        增加
                          <asp:TextBox ID="TxtScore4" style="text-align:center" Text="0" runat="server" CssClass="textbox" Width="50px"></asp:TextBox>分 
                         <span class="tips">不送积分请设置“0”</span>
                    </td>
                   </tr>
             <tr>
                    <td  height="30" align="right"  class="lefttd" style="width: 145px">
                        <strong>设置总置顶</strong>：<br />
                      </td>
                    <td class="righttd">
                        增加
                          <asp:TextBox ID="TxtScore5" style="text-align:center" Text="0" runat="server" CssClass="textbox" Width="50px"></asp:TextBox>分 
                         <span class="tips">不送积分请设置“0”</span>
                    </td>
                   </tr>
            <tr>
                    <td  height="30" align="right"  class="lefttd" style="width: 145px">
                        <strong>话题被删除</strong>：<br />
                      </td>
                    <td class="righttd">
                          扣除
                          <asp:TextBox ID="TxtScore6"  style="text-align:center" Text="0" runat="server" CssClass="textbox" Width="50px"></asp:TextBox>分 
                         <span class="tips">不扣除积分请设置“0”</span>
                    </td>
                   </tr>
            <tr>
                    <td  height="30" align="right"  class="lefttd" style="width: 145px">
                        <strong>回复被删除</strong>：<br />
                      </td>
                    <td class="righttd">
                          扣除
                          <asp:TextBox ID="TxtScore7" style="text-align:center" Text="0" runat="server" CssClass="textbox" Width="50px"></asp:TextBox>分 
                         <span class="tips">不扣除积分请设置“0”</span>
                    </td>
                   </tr>
            
           </table>
        </div>
            

       <div class="tab-page" id="rules">
		  <h2 class="tab">本版版规</h2>
			<script type="text/javascript">
			    tabPane1.addTabPage(document.getElementById("rules"));
			</script>
			
             <table width="100%" border="0"  cellpadding="1" cellspacing="1" class="CTable">
            <tr>
                    <td  height="30" align="right"  class="lefttd" style="width: 145px">
                        <strong>版规</strong>：<br />
                      </td>
                    <td class="righttd">
                        <asp:TextBox  ID="TxtBoardRules" runat="server" Rows="3" TextMode="MultiLine" Height="350" Width="800px"></asp:TextBox>
                       <%Kesion.APPCode.EditorAPI.EchoEditor("editor", this.TxtBoardRules.ClientID, "Basic", 0, false, true); %>
                        </td>
                  </tr>
                 
                   </table>
             </div>
		
        <div class="tab-page" id="seooption">
		  <h2 class="tab">SEO选项</h2>
			<script type="text/javascript">
			    tabPane1.addTabPage(document.getElementById("seooption"));
			</script>
			
             <table width="100%" border="0"  cellpadding="1" cellspacing="1" class="CTable">
            <tr>
                    <td  height="30" align="right"  class="lefttd" style="width: 145px">
                        <strong>版面META关键词</strong>：<br />
                        <span style="color: #0000ff">针对搜索引擎设置的关键词</span>
                        

                    </td>
                    <td class="righttd">
                        <asp:TextBox CssClass="textbox textarea" ID="MetaKeyWord" runat="server" Rows="3" TextMode="MultiLine" Width="378px" Height="100px"></asp:TextBox>
                         <a class="textarea_min" href="javascript:zoomtextarea(-5,'<%=this.MetaKeyWord.ClientID %>');"></a>
                         <a class="textarea_max" href="javascript:zoomtextarea(5,'<%=this.MetaKeyWord.ClientID %>');"></a>
						 <br/>
						 <span class="tips">版面页调用标签：{$GetBBSBoardMetaKeyWords}</span>
                        </td>
                  </tr>
                  <tr>
                         <td align="right"  class="lefttd" style="height: 76px; width: 145px;">
                             <strong>版面META网页描述：<br />
                             </strong><span style="color: #0000ff">针对搜索引擎设置的网页描述</span> </td>
                         <td  class="righttd" style="height: 76px">
                             <asp:TextBox CssClass="textbox textarea" ID="MetaDescript" runat="server" rows="3" TextMode="MultiLine" Width="376px" Height="100px"></asp:TextBox>
                                <a class="textarea_min" href="javascript:zoomtextarea(-5,'<%=this.MetaDescript.ClientID %>');"></a>
                         <a class="textarea_max" href="javascript:zoomtextarea(5,'<%=this.MetaDescript.ClientID %>');"></a>
						  <br/><span class="tips">版面页调用标签：{$GetBBSBoardDescript}</span>
                        </td>
                  </tr>
                   </table>
             </div>
		
		

      
      <div style="clear:both;text-align:center"><br />
          <KS:Foot ID="Foot1" runat="server" OnSubmit="SaveButton_Click" />
      </div>
        </asp:Panel>
   </asp:Content>