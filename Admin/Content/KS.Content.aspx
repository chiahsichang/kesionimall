<%@ Page Language="C#" ValidateRequest="false"  MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.Admin_Content" Title="添加/编辑信息" Codebehind="KS.Content.aspx.cs" %>
<%@ Import Namespace="Kesion.Cache" %>
<asp:Content ID="Content1" ContentPlaceHolderID="KSContent" Runat="Server">
    <script src="../../ks_inc/weiboApi.js"></script>
    <script>
        function GetKeyTags() {
            var text = escape(jQuery('#Title').val());
            if (text != '') {
                jQuery('#KeyTags').val('请稍等,系统正在自动获取tags...').attr("disabled", true);
                jQuery.get("../../plus/ajaxs.ashx", { a: "GetTags", text: text },
				  function(data) { jQuery('#KeyTags').val(unescape(data)).attr("disabled", false); });
            } else { KesionJS.Alert('对不起,请先输入标题!',"jQuery('#Title').focus();"); }
        }
    </script>

    <KS:TopNav ID="TopNav1" runat="server" />
	
		<div class="tab-page" id="ContentPanel<%=ChannelID %>">
         <script type="text/javascript">
           var tabPane1 = new WebFXTabPane( document.getElementById( "ContentPanel<%=ChannelID %>" ), 1 )
         </script>
            
             <%if (__modelinfo.BasicType==2){%>
             <script>
                 var post_params={"AdminLoginCode":"<%=Kesion.Publics.KSCMS.GetCookie("Admin","AdminLoginCode") %>", "adminuser":"<%=Kesion.Publics.KSCMS.GetCookie("Admin","AdminUser") %>","adminpass":"<%=Kesion.Publics.KSCMS.GetCookie("Admin","AdminPass") %>","PowerList":"<%=Kesion.Publics.KSCMS.GetCookie("Admin","PowerList") %>","usertype":"<%=Kesion.Publics.KSCMS.GetCookie("Admin","UserType") %>","CreateThumbs":1,"ChannelID":2,"AutoRename":4,"addwatermark":"1","fieldid":"-1","upbyswf":1};
             </script>
             <%}%>
			<%=JSStr %> 
            <KS:ModelJS ID="ModelJS1" runat="server" />

            <asp:Repeater ID="RepeatFieldGroup" runat="server" OnItemDataBound="RepeatFieldGroup_ItemDataBound">
               <ItemTemplate>
                     <div class="tab-page" id="tab<%# Eval("ID") %>">
		              <h2 class="tab"><%# Eval("GroupName") %></h2>
			            <script type="text/javascript">
			                tabPane1.addTabPage( document.getElementById( "tab<%# Eval("ID") %>" ) );
			            </script>
                               <table style="width:100%;" cellpadding="2" cellspacing="1" class="CTable">
                                <asp:Repeater ID="Repeater1" runat="server">
                                 <ItemTemplate>
                                     <KS:Fields ID="Fields1" ModelID='<%# ChannelID%>' FieldID='<%# Eval("Name")%>' ParentFieldID='<%# Eval("ParentFieldID")%>' FieldAlias='<%# Eval("FieldAlias")%>' FieldType='<%# Eval("FieldType")%>'
                                     Disabled='<%# Eval("Disabled")%>' FieldWidth='<%# Eval("FieldWidth")%>' FieldHeight='<%# Eval("FieldHeight")%>' Options='<%# Eval("options")%>'
                                     Tips='<%# Eval("Tips")%>' DefaultValue='<%# Eval("DefaultValue")%>' ToolBar='<%# Eval("ToolBar")%>' InputItem='<%# Eval("InputItem") %>' MustFillItem='<%# Eval("MustFillItem")%>'  runat="server">
                                     </KS:Fields>
                                 </ItemTemplate>
                                </asp:Repeater>
                                </table>
                         </div>
               </ItemTemplate>
            </asp:Repeater>


		
		 <div class="tab-page" id="tab1">
		  <h2 class="tab"<%=__modelinfo.AttributeOption==1?"":" style='display:none'" %>>属性选项</h2>
			<script type="text/javascript">
						 tabPane1.addTabPage( document.getElementById( "tab1" ) );
			</script>
			
    <table style="width:100%;margin:0 auto;" cellpadding="2" cellspacing="1" class="CTable">
     <tr>
      <td class="lefttd" align="right"><strong>所属专题：</strong></td>
      <td class="righttd">
          <KS:SpecialControl ID="SpecialControl1" Runat="Server"></KS:SpecialControl>
        <span style="color:blue">提示：按住"CTRL"或"Shift"键可以进行多选</span>
      
      </td>
     </tr>
        <tr id="downNatureArea" runat="server">
            <td align="right" class="lefttd">
                <strong>下载性质：</strong></td>
            <td class="righttd">
               <span id="downNature" runat="server"></span>
               文件大小：<asp:TextBox CssClass="textbox" style="text-align:center" ID="FileSize" runat="server" Width="57px"></asp:TextBox>
                <br />
                运行平台：<asp:TextBox ID="PlatForm" CssClass="textbox" runat="server" Width="480px"></asp:TextBox>
                <br />
                平台选择：<span id="platformarea" runat="server"></span>
                
                <script>
                function SetDownPT(addTitle){
			        var str=jQuery('#<%=this.PlatForm.ClientID %>').val();
			        if (jQuery('#<%=this.PlatForm.ClientID %>').val()=="") {
				        jQuery('#<%=this.PlatForm.ClientID %>').val(jQuery('#<%=this.PlatForm.ClientID %>').val()+addTitle);
			        }else{
				        if (str.substr(str.length-1,1)=="/"){
					        jQuery('#<%=this.PlatForm.ClientID %>').val(jQuery('#<%=this.PlatForm.ClientID %>').val()+addTitle);
				        }else{
				            jQuery('#<%=this.PlatForm.ClientID %>').val(jQuery('#<%=this.PlatForm.ClientID %>').val()+"/"+addTitle);
				        }
			        }
			        jQuery('#<%=this.PlatForm.ClientID %>').focus();
		        }	
                </script>
                
                </td>
        </tr>
        <tr>
            <td align="right" class="lefttd">
                <strong>审核状态：</strong></td>
            <td class="righttd">
                <asp:RadioButtonList ID="Verify" runat="server" RepeatDirection="Horizontal">
                    <asp:ListItem Value="2">草稿</asp:ListItem>
                    <asp:ListItem Value="0">待审核</asp:ListItem>
                    <asp:ListItem Selected="True" Value="1">已审核</asp:ListItem>
                </asp:RadioButtonList>
                
                <asp:HiddenField ID="HidInputer" runat="server" />
                
                </td>
        </tr>
        <tr>
            <td align="right" class="lefttd">
                <strong>绑定模板：</strong></td>
            <td class="righttd">
             <div id="templateselect" runat="server">
            <input type='radio' name='templateflag' onclick='KesionJS.GetTemplateArea(this.value);' value='2' checked="checked" />继承栏目设定
            <input type='radio' onclick='KesionJS.GetTemplateArea(this.value);' name='templateflag' value='1'/>自定义
            </div>
            <div id='templatearea' style='display:none'>
             WEB模板：<asp:TextBox CssClass="textbox" Width="300px" ID="TemplateFile" runat="server"></asp:TextBox>
                <input class="button" onclick="SelectTemplate('<%=this.TemplateFile.ClientID %>');"
                    onmouseout="this.className='button';" onmouseover="this.className='button_on';"
                    type="button" value="选择模板..." />
            <div<%=MyCache.GetCacheConfig(72)=="0"?" style='display:none'":"" %>>3G 模板：<asp:TextBox CssClass="textbox" Width="300px" ID="Template3GFile" runat="server"></asp:TextBox>
                <input class="button" onclick="SelectTemplate('<%=this.Template3GFile.ClientID %>');"
                    onmouseout="this.className='button';" onmouseover="this.className='button_on';"
                    type="button" value="选择模板..." />
                    </div>
              </div> 
            </td>
        </tr>
        <tr>
            <td align="right" class="lefttd">
                <strong>文 件 名：</strong>
            </td>
            <td class="righttd">
             <div id="filenameselect" runat="server">
            <input type='radio' value='0' name='filetype' onclick='KesionJS.GetFileNameArea(this.value);' checked="checked"/>自动生成 
            <input type='radio' value='1' name='filetype' onclick='KesionJS.GetFileNameArea(this.value);' />自定义
             </div>
            <div id='filearea' style='display:none'>
                <asp:TextBox CssClass="textbox" ID="FileName" runat="server"></asp:TextBox>
                <asp:HiddenField ID="HidFileName" runat="server" />
                <span style="color:Red">可带路径,如 help.html,news/news_1.shtml等</span>
            </div>   
            </td>
        </tr>
    </table>
			
			
  </div>

<div class="tab-page" id="seooption">
		  <h2 class="tab" <%=__modelinfo.SeoOption==1?"":" style='display:none'" %>>SEO选项</h2>
			<script type="text/javascript">
			    tabPane1.addTabPage(document.getElementById("seooption"));
			</script>
    <table style="width:100%;margin:0 auto;" cellpadding="2" cellspacing="1" class="CTable">
     <tr>
       <td class="lefttd" align="right"><strong>页面标题：</strong></td>
       <td class="righttd">
          <asp:TextBox ID="TxtSeoTitle" runat="server" Width="450px"  CssClass="textbox" />
           <br />
         <span class='tips'>留空则默认显示文章名称,模板里请用标签{KS:Field:SEOTitle}调用。</span>
        </td>
     </tr>
     <tr>
       <td class="lefttd" align="right"><strong>页面关键字：</strong>(meta_keywords)</td>
       <td class="righttd">
          <asp:TextBox TextMode="MultiLine" Rows="5" ID="TxtSeoKeyWords" runat="server" Width="450px" Height="100px"  CssClass="textbox textarea" />
           <a class="textarea_max" href="javascript:zoomtextarea(5,'<%=this.TxtSeoKeyWords.ClientID %>');"></a>
           <a class="textarea_min" href="javascript:zoomtextarea(-5,'<%=this.TxtSeoKeyWords.ClientID %>');"></a> 
           <br />
         <span class='tips'>留空则默认显示文章里设置的KeyWords,模板里请用标签{KS:Field:SEOKeyWords}调用。</span>
        </td>
     </tr>
     <tr>
       <td class="lefttd" align="right"><strong>页面描述：</strong>(meta_description)</td>
       <td class="righttd">
          <asp:TextBox TextMode="MultiLine" Rows="5" ID="TxtSeoDescription" runat="server" Width="450px" Height="100px" CssClass="textbox textarea" />
           <a class="textarea_max" href="javascript:zoomtextarea(5,'<%=this.TxtSeoDescription.ClientID %>');"></a>
            <a class="textarea_min" href="javascript:zoomtextarea(-5,'<%=this.TxtSeoDescription.ClientID %>');"></a> 
           <br />
         <span class='tips'>留空则默认显示文章简介,模板里请用标签{KS:Field:SEODescription}调用。</span>
        </td>
     </tr>
    </table>
</div>
		
		
		<div class="tab-page" id="tab2">
		  <h2 class="tab" <%=__modelinfo.ChargesOption==1?"":" style='display:none'" %>>收费选项</h2>
			<script type="text/javascript">
						 tabPane1.addTabPage( document.getElementById( "tab2" ) );
			</script>
    <table style="width:100%;margin:0 auto;" cellpadding="2" cellspacing="1" class="CTable">
     <tr>
      <td class="lefttd" align="right"><strong>阅读权限：</strong></td>
      <td class="righttd">
          <asp:RadioButtonList ID="InfoPurview" runat="server">
              <asp:ListItem Selected="True" Value="0">继承栏目权限（当所属栏目为认证栏目时，建议选择此项）</asp:ListItem>
              <asp:ListItem Value="1">所有会员（当所属栏目为开放栏目，想单独对某些内容进行阅读权限设置，可以选择此项）</asp:ListItem>
              <asp:ListItem Value="2">指定会员组（当所属栏目为开放栏目，想单独对某些内容进行阅读权限设置，可以选择此项）</asp:ListItem>
          </asp:RadioButtonList>
          <div id="GroupPanel" runat="server"></div>
         
         </td>
     </tr>
        <tr>
            <td align="right" class="lefttd">
                <strong>阅读<%=MyCache.GetCacheConfig(49) %>：</strong></td>
            <td class="righttd">
                      &nbsp;<asp:TextBox CssClass="textbox" ID="ReadPoint" Text="0" style="text-align:center" runat="server" Width="55px"></asp:TextBox>
                      <%=MyCache.GetCacheConfig(50) %> <span class="tips">免费阅读请设为 "<span style="color:red">0</span>"，否则有权限的会员阅读该栏目下的信息时将消耗相应<%=MyCache.GetCacheConfig(49) %>，游客将无法阅读。</span>
            </td>
        </tr>
        <tr>
            <td align="right" class="lefttd" style="height: 30px">
                <strong>重复收费：</strong></td>
            <td class="righttd" style="height: 30px">
            <asp:RadioButtonList ID="ChargeType" runat="server">
                          <asp:ListItem Value="0" Selected="True">不重复收费(如果信息需扣费才能查看，建议使用)</asp:ListItem>
                          <asp:ListItem Value="1">距离上次收费时间&lt;input class=textbox type=&quot;text&quot; style=&quot;width:50px;text-align:center;&quot; value=&quot;12&quot; name=&quot;PitchTime&quot; id=&quot;PitchTime&quot; size=&quot;5&quot;&gt;  小时后重新收费</asp:ListItem>
                          <asp:ListItem Value="2">会员重复阅信息&lt;input class=textbox type=&quot;text&quot; style=&quot;width:50px;text-align:center;&quot; value=&quot;10&quot; name=&quot;ReadTimes&quot; id=&quot;ReadTimes&quot; size=&quot;5&quot;&gt;   页次后重新收费</asp:ListItem>
                          <asp:ListItem Value="3">上述两者都满足时重新收费</asp:ListItem>
                          <asp:ListItem Value="4">上述两者任一个满足时就重新收费</asp:ListItem>
                          <asp:ListItem Value="5">每阅读一页次就重复收费一次（建议不要使用,多页信息将扣多次费用）</asp:ListItem>
                      </asp:RadioButtonList>
            </td>
        </tr>
        <tr style="display:none">
            <td align="right" class="lefttd" style="height: 30px">
                <strong>投稿者分成比例：</strong></td>
            <td class="righttd" style="height: 30px">
                <asp:TextBox ID="DividePercent" CssClass="textbox" runat="server" Style="text-align: center" Text="0"
                    Width="55px"></asp:TextBox>%&nbsp; 网站与投稿者的分成比例</td>
        </tr>
     </table>			
			
		</div>
		
		
	 <%if (__modelinfo.ReceiptOption==1)
      { %>

		<div class="tab-page" id="tab3">
		  <h2 class="tab">投票选项</h2>
			<script type="text/javascript">
						 tabPane1.addTabPage( document.getElementById( "tab3" ) );
			</script>
			
     
     <table  style="width:100%;margin:0px auto;" cellpadding="2" cellspacing="1" class="CTable">

     <tr>
            <td class="lefttd" height="30" align="right"><b>投票主题：</b></td>
            <td class="righttd">
                &nbsp;<asp:TextBox CssClass="textbox" ID="Subject" runat="server" Width="350px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="Subject"
                    ErrorMessage="请填写投票主题!" Display="Dynamic"></asp:RequiredFieldValidator>
                <span class="tips">如：你对本站的哪些频道比较感谢兴趣?</span></td>
          </tr>
            <tr>
                <td align="right" class="lefttd" height="30">
                    <strong>选项类型：</strong></td>
                <td class="righttd">
                    <asp:RadioButtonList ID="VoteType" runat="server" RepeatDirection="Horizontal">
                        <asp:ListItem Selected="True" Value="1">单选</asp:ListItem>
                        <asp:ListItem Value="2">多选</asp:ListItem>
                    </asp:RadioButtonList></td>
            </tr>
            <tr>
                <td align="right" class="lefttd" height="30">
                    <strong>投票项目：</strong></td>
                <td class="righttd">
                  &nbsp;投票扩展数量: 
              <input name="vote_num" class="textbox" type="text" id="votenum" value="1" size="5" style="width:50px;text-align:center" /> 
              <input type="button" name="Submit52" value="增加选项" class="button" onmouseover="this.className='button_on';" onmouseout="this.className='button';" onclick="javascript:doadd(jQuery('#votenum').val());" /> 
              <input name="editnum" type="hidden" id="editnum" value="0" /> 


                <table border="0" cellpadding="0" cellspacing="0" class="CTable" style="margin-left:5px;" width="80%"  id="addvote">

                 <tr class="CTitle">
                 <td width='50' height='20'> <div align='center'>编号</div></td>
                 <td> <div align='center'>项目名称</div></td>
                 <td style='width: 100px'> <div align='center'>投票数</div></td>
                 </tr>

                </table>
                
                
                </td>
            </tr>
            <tr>
                <td align="right" class="lefttd" height="30">
                    <strong>开始日期：</strong></td>
                <td class="righttd">
                    <asp:TextBox CssClass="textbox Wdate" ID="BeginDate" runat="server" onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'});"></asp:TextBox></td>
            </tr>
            <tr>
                <td align="right" class="lefttd" height="30">
                    <strong>过期日期：</strong></td>
                <td class="righttd">
                    <asp:TextBox CssClass="textbox Wdate" ID="ExpireDate" runat="server"  onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'});"></asp:TextBox>
                    <span class="tips">(超过此期限,将不能投票,设置为2000-01-01表示不限制)</span>

                </td>
            </tr>
            <tr>
                <td align="right" class="lefttd" height="30">
                    <strong>只允许会员投票：</strong></td>
                <td class="righttd">
                    <asp:RadioButtonList ID="UserTF" runat="server" RepeatDirection="Horizontal">
                        <asp:ListItem Selected="True" Value="1">是</asp:ListItem>
                        <asp:ListItem Value="0">否</asp:ListItem>
                    </asp:RadioButtonList></td>
            </tr>
            <tr>
                <td align="right" class="lefttd" height="30">
                    <strong>启用IP限制：</strong></td>
                <td class="righttd">
                <asp:RadioButtonList ID="LimitIP" runat="server" RepeatDirection="Horizontal">
                    <asp:ListItem Selected="True" Value="1">是</asp:ListItem>
                    <asp:ListItem Value="0">否</asp:ListItem>
                </asp:RadioButtonList></td>
            </tr>
          </table>
          <asp:HiddenField ID="hidVoteID" Value="0" runat="server" />
          <br />
              <script type="text/javascript">
                function doadd(num)
                {var i;
                 var str="";
                 var oldi=0;
                 var j=0;
                oldi=parseInt(jQuery('#editnum').val());
                for(i=1;i<=num;i++)
                {
                j=i+oldi;
                str=str+"<tr><td height=20> <div align=center><input type=hidden name=itemid value=0>"+j+"</div></td><td> <input class='textbox'  style='width:500px' type=text name=item size=40></td><td> <div align=center><input class=textbox type=text name=votenum style='text-align:center;width:50px' value=0 size=6></div></td></tr>";
                }
                jQuery("#addvote").append(str);

                    jQuery('#editnum').val(j);
                }
                </script>
			
		</div>
		
	   <%}
      if (__modelinfo.PKOption == 1)
      {  
	   %>
	   
	   <div class="tab-page" id="tab4">
		  <h2 class="tab">PK选项</h2>
			<script type="text/javascript">
					 tabPane1.addTabPage( document.getElementById( "tab4" ) );
			</script>
			
     <asp:HiddenField ID="hidPKID" Value="0" runat="server" />
     <table  style="width:100%;margin:0px auto;" cellpadding="2" cellspacing="1" class="CTable">
         <tr>
             <td align="right" class="lefttd" height="30">
             <b>PK主题：</b>
             </td>
             <td class="righttd">
             &nbsp;<asp:TextBox  CssClass="textbox" ID="TxtPkTitle" runat="server" Width="450px"></asp:TextBox>
              <span style="color:Red">*</span> <span class="tips">如 宝马 PK 奥迪车的性价比。</span>
             </td>
         </tr>
          <tr>
            <td class="lefttd" height="30" align="right"><b>正方观点：</b></td>
            <td class="righttd">
                &nbsp;<asp:TextBox CssClass="textbox" ID="TxtPKZFGD" runat="server" Width="450px" Height="70px" TextMode="multiLine"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TxtPKZFGD"
                    ErrorMessage="请填写正方观点!" Display="Dynamic"></asp:RequiredFieldValidator>      
                <a class="textarea_max" href="javascript:zoomtextarea(5,'<%=this.TxtPKZFGD.ClientID %>');">
                 <a class="textarea_min" href="javascript:zoomtextarea(-5,'<%=this.TxtPKZFGD.ClientID %>');"></a>
</td>
          </tr>
          <tr>
            <td class="lefttd" height="30" align="right"><b>反方观点：</b></td>
            <td class="righttd">
                &nbsp;<asp:TextBox CssClass="textbox" ID="TxtPKFFGD" runat="server" Width="450px" Height="70px" TextMode="multiLine"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="TxtPKFFGD"
                    ErrorMessage="请填写反方观点!" Display="Dynamic"></asp:RequiredFieldValidator>
                <a class="textarea_max" href="javascript:zoomtextarea(5,'<%=this.TxtPKFFGD.ClientID %>');">
                <a class="textarea_min" href="javascript:zoomtextarea(-5,'<%=this.TxtPKFFGD.ClientID %>');"></a>

            </td>
          </tr>
         <tr>
             <td align="right" class="lefttd" height="30">
                <b>得票情况：</b></td>
             <td class="righttd">
               正方:<asp:TextBox CssClass="textbox" ID="TxtPKZFVotes" runat="server" Width="50px" style="text-align:center"></asp:TextBox>票 反方:<asp:TextBox CssClass="textbox" ID="TxtPKFFVotes" runat="server" Width="50px" style="text-align:center"></asp:TextBox>票 三方:<asp:TextBox CssClass="textbox" ID="TxtPKSFVotes" runat="server" Width="50px" style="text-align:center"></asp:TextBox>票
             </td>
         </tr>
          <tr>
            <td class="lefttd" height="30" align="right"><b>只允许会员参与PK：</b></td>
            <td class="righttd">
            <asp:RadioButtonList ID="RdbPKUserTF" runat="server" RepeatDirection="Horizontal">
                        <asp:ListItem Selected="True" Value="1">是</asp:ListItem>
                        <asp:ListItem Value="0">否</asp:ListItem>
                    </asp:RadioButtonList>
            </td>
          </tr>
          <tr>
            <td class="lefttd" height="30" align="right"><b>每个用户只能参与PK一次：</b></td>
            <td class="righttd">
            <asp:RadioButtonList ID="RdbPKOnceTF" runat="server" RepeatDirection="Horizontal">
                        <asp:ListItem Value="1">是</asp:ListItem>
                        <asp:ListItem Selected="True" Value="0">否</asp:ListItem>
                    </asp:RadioButtonList>
            </td>
          </tr>
          <tr>
            <td class="lefttd" height="30" align="right"><b>用户PK意见需要审核：</b></td>
            <td class="righttd">
            <asp:RadioButtonList ID="RdbPKVerifyTF" runat="server" RepeatDirection="Horizontal">
                        <asp:ListItem Value="1">是</asp:ListItem>
                        <asp:ListItem Selected="True" Value="0">否</asp:ListItem>
                    </asp:RadioButtonList>
            </td>
          </tr>
          <tr>
            <td class="lefttd" height="30" align="right"><b>状态：</b></td>
            <td class="righttd">
            <asp:RadioButtonList ID="RdbPKStatus" runat="server" RepeatDirection="Horizontal">
                        <asp:ListItem Selected="True" Value="1">正常</asp:ListItem>
                        <asp:ListItem Value="0">锁定</asp:ListItem>
                    </asp:RadioButtonList>
            </td>
          </tr>
          <tr>
            <td class="lefttd" height="30" align="right"><b>是否启用时间限制：</b></td>
            <td class="righttd">
            <asp:RadioButtonList ID="RdbPKTimeLimit" runat="server" RepeatDirection="Horizontal">
                        <asp:ListItem  Value="1">限制时间</asp:ListItem>
                        <asp:ListItem Value="0" Selected="True">不限制</asp:ListItem>
                    </asp:RadioButtonList>
                 <div id="sTimeLimit" style="display:none">
                 开始时间:
                 <asp:TextBox CssClass="textbox Wdate" ID="TxtPKTBeginDate" runat="server" Width="200px" onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'});"></asp:TextBox>
                 <span class="tips">格式:YYYY-MM-DD hh:mm:ss</span>
                 <br />
                 结束时间:
                 <asp:TextBox CssClass="textbox Wdate" ID="TxtPKTEndDate" runat="server" Width="200px" onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'});"></asp:TextBox>
                <span class="tips">格式:YYYY-MM-DD hh:mm:ss</span>
                 </div>
            </td>
          </tr>
      </table>
     </div>
	   <script>
	   function showPKTimeLimit() {
	      var checkrad = jQuery("#<%=this.RdbPKTimeLimit.ClientID %> :radio[checked]").val();
          if (checkrad=="1"){
           jQuery("#sTimeLimit").css("display","");
          }
          else{
           jQuery("#sTimeLimit").css("display","none");
           }
       }
	   </script>
	   
	   
	   <%
           }%>

	  </div>


    <div style="clear:both;text-align:center">
    <br />
    <KS:Foot ID="Foot1" runat="server" OnSubmit="Foot1_Submit" />
    </div>
</asp:Content>

