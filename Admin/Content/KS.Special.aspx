<%@ Page Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.Admin_Special" Title="专题管理" Codebehind="KS.Special.aspx.cs" %>
<%@ Import Namespace="Kesion.Cache" %>
<asp:Content ID="Content1" ContentPlaceHolderID="KSContent" Runat="Server">
    <asp:Panel ID="listPanel" runat="server" Width="100%">
    <div id="manage_top" class="menu_top_fixed">
       <span style="float:right">
            <asp:DropDownList ID="DrpSpecialClassID" runat="server">
            </asp:DropDownList> 
       </span>
       <ul>
       <li id='p5'><asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click"><b></b>分类管理</asp:LinkButton></li>
       <li id='p1'><asp:LinkButton ID="addspecial" runat="server" OnClick="addButton_Click"><b></b>添加专题</asp:LinkButton></li>
       <li id='p4'><asp:LinkButton ID="editspecial" runat="server" OnClick="editspecial_Click"><b></b>编辑专题</asp:LinkButton></li>
       <li id='p3'><asp:LinkButton ID="delspecial" runat="server" OnClick="delspecial_Click"><b></b>删除专题</asp:LinkButton></li>
       <li id='p14'><asp:LinkButton ID="recommendBtn" runat="server" OnClick="Button1_Click" OnClientClick="return(GetIDS());"><b></b>批量推荐</asp:LinkButton></li>
       <li id='p13'><asp:LinkButton ID="unRecommendBtn" runat="server" OnClick="Button2_Click" OnClientClick="return(GetIDS());"><b></b>取消推荐</asp:LinkButton></li>
       <%if (MyCache.GetCacheConfig(46)=="1"){ %>
       <li id='p5'><a href="javascript:;" onclick="refreshHtml();" ><b></b>批量生成HTML</a></li>
       <%} %>
       </ul>
       </div>
      <div class="menu_top_fixed_height"></div>
        <KS:KSGV ID="list" cssclass="CTable" runat="server"  AutoGenerateColumns="False" EmptyDataText="没有创建任何专题!"
            GridLines="None" OnRowDataBound="list_RowDataBound" PagerType="CustomNumeric"
            Width="99%"  OnRowCommand="list_RowCommand" OnRowCreated="list_RowCreated">
            <Columns>
                <asp:TemplateField HeaderText="&lt;input type='checkbox' name='chkall' id='chkall' onClick='CheckAll(this.form);'/&gt;">
                <ItemStyle HorizontalAlign="Center"  Width="30px"/>
                <ItemTemplate>
                <input type="checkbox"  name="ids" id="ids" value="<%#Eval("specialid") %>" />
                </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="专题名称">
                    <itemtemplate>
                     <span class="special"></span>
                     <a href="#" onclick="parent.openWin('查看专题下的文章','Content/KS.ContentSpecial.aspx?SpecialID='+<%#Eval("specialid") %>,false, 980, 560);return false;"><%#Eval("SpecialName") %></a>
                    (<span style="color:#ff6600"><%#Eval("Total") %></span>)
                    </itemtemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="classid" HeaderText="所属分类" >
                    <itemstyle horizontalalign="Center" width="120px" />
                </asp:BoundField>
                <asp:BoundField DataField="adddate" HtmlEncode="False" DataFormatString="{0:d}" HeaderText="创建日期" >
                    <itemstyle horizontalalign="Center" width="100px" />
                </asp:BoundField>

            <asp:TemplateField HeaderText="推荐">
              <itemstyle width="30px" horizontalalign="Center"/>
              <itemtemplate>
                   <a href="?action=recommend&id=<%#Eval("SpecialID")%>" <%# Convert.ToString(Eval("recommend"))=="0"?"class='no' title='否'":"class='ok' title='是'" %>></a>
              </itemtemplate>
            </asp:TemplateField>

            <asp:TemplateField HeaderText="修改">
              <itemstyle width="30px" horizontalalign="Center"/>
              <itemtemplate>
                   <asp:LinkButton CssClass="edit" ID="LinkButton1" runat="server" commandargument=<%#Eval("specialid") %> commandname="modify" ToolTip="修改"></asp:LinkButton>
              </itemtemplate>
            </asp:TemplateField>

            <asp:TemplateField HeaderText="删除">
               <itemstyle width="30px" horizontalalign="Center"/>
                    <itemtemplate>
                     <asp:LinkButton runat="server" id="delete" commandargument=<%#Eval("specialid") %> commandname="del" ToolTip="删除" CssClass="delete"></asp:LinkButton>
        </itemtemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="预览">
                <itemstyle width="30px" horizontalalign="Center" />
                      <itemtemplate>
                   <a class="preview" title="预览专题" href='<%# Kesion.HtmlTags.Function.GetSpecialUrl(Convert.ToInt32(Eval("specialId")),Convert.ToInt32(Eval("SpecialPurView")),Convert.ToInt32(Eval("ReadPoint")),Convert.ToString(Eval("FsoName")),Convert.ToString(Eval("classid"))=="0"?"":MyCache.GetSpecialClass(Convert.ToInt32(Eval("classid")),2)) %>' target="_blank"></a>

</itemtemplate>

                </asp:TemplateField>
            </Columns>
            <HeaderStyle CssClass="CTitle" />
            <PagerStyle CssClass="Page" HorizontalAlign="Right" />
            <EmptyDataRowStyle CssClass="emptycss" />
        </KS:KSGV>


    
          <script>
              function refreshHtml() {
                  var sid = null;
                  for (var i = 0; i < document.getElementsByName("ids").length; i++) {
                      var KS = document.getElementsByName("ids")[i];
                      if (KS.checked == true) {
                          if (sid == null)
                              sid = KS.value;
                          else
                              sid += "," + KS.value;
                      }
                  }
                  if (sid != null) {
                      top.openWin("生成静态HTML操作", "refresh/KS.RefreshSpecial.aspx?action=refreshspecial&specialid=" + sid, false, 600, 250);
                  } else {
                      KesionJS.Alert("请选择要发布的专题！");
                  }
              }
        </script>
             <KS:Page ID="Page1" runat="server" />
    <div class="message">
     <strong>搜索专题：</strong> 
        <asp:DropDownList ID="DrpClassID" runat="server">
        </asp:DropDownList> 
        <asp:TextBox ID="TxtKeyWord" runat="server" CssClass="textbox" />
    <asp:Button ID="BtnSearch" runat="server" Text=" 搜 索 " CssClass="button" OnClick="BtnSearch_Click" />
   </div>

</asp:Panel>
    <asp:Panel ID="addPanel" runat="server" Width="100%" Visible="false">
            <script type="text/javascript">
            <!--
	        function setFileFileds(num){    
             for(var i=1,str="";i<=20;i++){jQuery("#define" + i).css("display","none");   }
             for(var i=1,str="";i<=num;i++){	jQuery("#define" + i).css("display","")     }
            }
            function CheckForm()
            {
             if (parseInt(jQuery('#<%=this.ClassID.ClientID %>').val())==0)
             {
             // KesionJS.Alert('请选择专题所属分类！',null);
            //  return false;
             }
             if (jQuery('#<%=this.SpecialName.ClientID %>').val()=='')
             {
              KesionJS.Alert('请输入专题名称！',null);
              jQuery("#<%=this.SpecialName.ClientID %>").focus();
              return false;
             }
             if (jQuery('#<%=this.SpecialEname.ClientID %>').val()=='')
             {
              KesionJS.Alert('请输入专题英文名称！',null);
              jQuery("#<%=this.SpecialEname.ClientID %>").focus();
              return false;
             }
             if (jQuery('#<%=this.TemplateFile.ClientID %>').val()=='')
             {
              KesionJS.Alert('请输入模板！',null);
              jQuery("#<%=this.TemplateFile.ClientID %>").focus();
              return false;
             }
             
            }
            
            function ay(obj)
            {
               if (obj.checked==true)
               {
                   var val=obj.value;
                   if (val!='')
	                {
		                if (jQuery('#<%=this.FsoNameRule.ClientID %>').val().search(val)==-1)
		                {
			                if (jQuery('#<%=this.FsoNameRule.ClientID %>').val()=='') jQuery('#<%=this.FsoNameRule.ClientID %>').val(val);
			                else jQuery('#<%=this.FsoNameRule.ClientID %>').val(jQuery('#<%=this.FsoNameRule.ClientID %>').val()+val);			
		                }
	                }
	            }
              else
               {
                 jQuery('#<%=this.FsoNameRule.ClientID %>').val(jQuery('#<%=this.FsoNameRule.ClientID %>').val().replace(obj.value,""));
               }
            }
            function ConvertPinYin(){
              var className=jQuery('#<%=this.SpecialName.ClientID %>').val();
              jQuery.get("../../plus/ajaxs.ashx",{a:"convertclassname",classname:className},function(v){
                 jQuery('#<%=this.SpecialEname.ClientID %>').val(unescape(v));
              });
            }
            
            //-->
        </script>
        <KS:TopNav ID="TopNav1" runat="server" Text="添加专题" />
        
     	<div class="tab-page" id="SpecialPanel">
         <script type="text/javascript">
           var tabPane1 = new WebFXTabPane( document.getElementById( "SpecialPanel" ), 1 )
         </script>
             
		 <div class="tab-page" id="tab0">
		  <h2 class="tab">基本信息</h2>
			<script type="text/javascript">
						 tabPane1.addTabPage( document.getElementById( "tab0" ) );
			</script>
    <table width="100%" border="0" cellpadding="1" cellspacing="1" class="CTable">
        <tr>
            <td align="right" class="lefttd">
                <strong>所属分类：</strong></td>
            <td class="righttd"><asp:DropDownList ID="ClassID" runat="server">
                <asp:ListItem Value="0">--全站专题--</asp:ListItem>
                </asp:DropDownList></td>
        </tr>
                   <tr>
                       <td align="right" class="lefttd">
                           <strong>专题名称：</strong></td>
                       <td class="righttd"><asp:TextBox CssClass="textbox" ID="SpecialName" runat="server" Width="500px"></asp:TextBox>
                           <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="请输入专题名称" ControlToValidate="SpecialName"></asp:RequiredFieldValidator></td>
                   </tr>
        <tr>
            <td align="right" class="lefttd">
                <strong>专题英文名称：</strong></td>
            <td class="righttd"><asp:TextBox CssClass="textbox" ID="SpecialEname" runat="server" Width="500px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="SpecialEname"
                    ErrorMessage="请输入专题英文名称"></asp:RequiredFieldValidator></td>
        </tr>
        <tr>
            <td align="right" class="lefttd">
                <strong>专题图片：</strong></td>
            <td class="righttd"><asp:TextBox ID="SpecialPic" CssClass="textbox" runat="server" Width="500px"></asp:TextBox>
                &nbsp;<input type="button" class="button" onclick="SelectFiles('<%=this.SpecialPic.ClientID %>',0);" value="选择图片" />
                
                
                </td>
        </tr>
        <tr>
            <td align="right" class="lefttd">
                <strong>添加时间：</strong></td>
            <td class="righttd"><asp:TextBox ID="AddDate" Width="300px" CssClass="textbox" onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'});" runat="server"></asp:TextBox>
                    <a href="#" onClick="WdatePicker({el:'<%=this.AddDate.ClientID %>',dateFmt:'yyyy-MM-dd HH:mm:ss'});return false;"><img src="../../sysimg/default/date.gif" border="0" align="absmiddle" title="选择日期"></a>&nbsp;
                日期格式：YYYY-MM-DD</td>
        </tr>
        <tr>
            <td align="right" class="lefttd">
                <strong>是否推荐专题：</strong></td>
            <td class="righttd"><asp:RadioButtonList ID="Recommend" runat="server" RepeatDirection="Horizontal">
                    <asp:ListItem Value="1">是</asp:ListItem>
                    <asp:ListItem Selected="True" Value="0">否</asp:ListItem>
                </asp:RadioButtonList></td>
        </tr>
        <tr>
            <td align="right" class="lefttd">
                <strong>专题模板：</strong></td>
            <td class="righttd"><asp:TextBox ID="TemplateFile" Text="{$TemplateDir}/专题页/内容页.html" CssClass="textbox" runat="server" Width="500px"></asp:TextBox>
                <input type="button" class="button" onmouseover="this.className='button_on';" onmouseout="this.className='button';" value="选择模板..." onClick="SelectTemplate('<%=this.TemplateFile.ClientID %>');"/>
                </td>
        </tr>
                <tr>
            <td align="right" class="lefttd" style="height: 44px">
                <strong>生成文件名规则：</strong></td>
            <td class="righttd" style="height: 44px"><asp:TextBox ID="FsoNameRule" CssClass="textbox" Text="{$AutoID}" runat="server" Width="256px"></asp:TextBox><span id="rulearea" runat="server">扩展名:<asp:TextBox ID="FsoNameExt"
                    runat="server" CssClass="textbox" Width="42px"  Text=".html"></asp:TextBox>
                    
                 <select name='SelectExt' onchange="if (this.value!=''){jQuery('#<%=this.FsoNameExt.ClientID %>').val(this.value);}">
                            <option value=''>-快速选择-</option>
                            <option value='.html'>.html</option>
                            <option value='.htm'>.htm</option>
                            <option value='.shtml'>.shtml</option>
                            <option value='.shtm'>.shtm</option>
                            <option value='.aspx'>.aspx</option>
                            
                      </select>  
                    <br />
                       
                <input type="checkbox" id="DirData6" name="DirData6" value="{$AutoID}" checked="checked" onclick="jvascript:ay(this);"/>自动编号
				<input type="checkbox" id="DirData0" name="DirData0" value="{$Year02}" onclick="jvascript:ay(this);" />年2位
                <input type="checkbox" id="DirData1" name="DirData1" value="{$Year04}" onclick="jvascript:ay(this);" />年4位
                <input type="checkbox" id="DirData2" name="DirData2" value="{$Month}" onclick="jvascript:ay(this);"/>月
                <input type="checkbox" id="DirData3" name="DirData3" value="{$Day}" onclick="jvascript:ay(this);"/>日
                
                <input type="checkbox" id="DirData4" name="DirData4" value="{$Hour}" onclick="jvascript:ay(this);"/>时
                <input type="checkbox" id="Checkbox1" name="DirData4" value="{$Minute}" onclick="jvascript:ay(this);"/>分
                <input type="checkbox" id="DirData5" name="DirData5" value="{$Second}" onclick="jvascript:ay(this);"/>秒
	            <input type="checkbox" id="DirData8" name="DirData8" value="{$RE}" onclick="jvascript:ay(this);" /> 随机数 
	        </span>
                    </td>
        </tr>

        <tr>
            <td align="right" class="lefttd">
                <strong>专题介绍：</strong></td>
            <td class="righttd">
               <asp:TextBox ID="Content" TextMode="multiLine" style="width:99%;height:300px;" runat="server"></asp:TextBox>
                 <%
                     Kesion.APPCode.EditorAPI.EchoEditor("editor", Content.ClientID, "Common", 0, false, true);    
                  %>  

            </td>
        </tr>
      </table>			
			
	    </div>
	    
		 <div class="tab-page" id="tab1">
		  <h2 class="tab">专题选项</h2>
			<script type="text/javascript">
						 tabPane1.addTabPage( document.getElementById( "tab1" ) );
			</script>
<table width="100%" border="0" cellpadding="1" cellspacing="1" class="CTable">
            <tr>
                       <td align="right" class="lefttd">
                           <strong>专题META关键词</strong></td>
                       <td class="righttd"><asp:TextBox ID="MetaKeyWord" runat="server" Rows="7" TextMode="MultiLine" Width="382px"></asp:TextBox>
                                <a class="textarea_min" href="javascript:zoomtextarea(-2,'<%=this.MetaKeyWord.ClientID %>');"> </a>
                               <a class="textarea_max" href="javascript:zoomtextarea(2,'<%=this.MetaKeyWord.ClientID %>');"></a>  
<br />
                           <span class="tips">针对搜索引擎设置的关键词,调用标签：{KS:Field:MetaKeyWord}</span>

                       </td>
            </tr>
          <tr>
              <td align="right" class="lefttd">
                  <strong>专题META网页描述：
                  </strong></td>
              <td class="righttd"><asp:TextBox ID="MetaDescript" runat="server" Rows="7" TextMode="MultiLine" Width="382px"></asp:TextBox>
                  <a class="textarea_min" href="javascript:zoomtextarea(-2,'<%=this.MetaDescript.ClientID %>');"> </a>
                   <a class="textarea_max" href="javascript:zoomtextarea(2,'<%=this.MetaDescript.ClientID %>');"></a>  
<br />
                  <span class="tips">针对搜索引擎设置的网页描述,调用标签：{KS:Field:MetaDescript}</span>

              </td>
          </tr>
        </table>
        
			
	    </div>
	    
		 <div  class="tab-page" id="tab2">
		  <h2 style="display:none"  class="tab">收费选项</h2>
			<script type="text/javascript">
						 tabPane1.addTabPage( document.getElementById( "tab2" ) );
			</script>
			
			<table width="100%" border="0" cellpadding="1" cellspacing="1" class="CTable">
            <tr>
                       <td align="right" class="lefttd">
                           <strong>专题浏览权限</strong><span style="background-color: #f0f9fe">：</span></td>
                       <td class="righttd">
                           <asp:RadioButtonList ID="Purview" runat="server">
                               <asp:ListItem Selected="True" Value="1">所有会员都可以浏览</asp:ListItem>
                               <asp:ListItem Value="2">只有指定的会员组可以浏览</asp:ListItem>
                           </asp:RadioButtonList>
                            <div ID="GroupPanel" runat="server" Width="100%"></div>
                       </td>
            </tr>
            <tr>
                <td align="right" class="lefttd">
                    <strong>阅读点数：</strong></td>
                <td class="righttd">
                    &nbsp;<asp:TextBox ID="ReadPoint" CssClass="textbox" runat="server" Style="text-align: center" Text="0"
                        Width="55px"></asp:TextBox><span style="color: #ff0000"> 免费阅读请设为 </span>"<font color="red"><span
                            style="color: #666666; background-color: #f0f9fe">0"</span></font>，否则有权限的会员阅读该栏目下的信息时将消耗相应点数，游客将无法阅读。
                </td>
            </tr>
            <tr>
                <td align="right" class="lefttd">
                    <strong>重复收费：</strong></td>
                <td class="righttd">
                    <asp:RadioButtonList ID="ChargeType" runat="server">
                        <asp:ListItem Selected="" Value="1">不重复收费(如果信息需扣点数才能查看，建议使用)</asp:ListItem>
                        <asp:ListItem Value="2">距离上次收费时间&lt;input class=&quot;textbox&quot; type=&quot;text&quot; style=&quot;text-align:center;&quot; value=&quot;12&quot; name=&quot;PitchTime&quot; id=&quot;PitchTime&quot; size=&quot;5&quot;&gt;  小时后重新收费</asp:ListItem>
                        <asp:ListItem Value="3">会员重复阅信息&lt;input class=&quot;textbox&quot; type=&quot;text&quot; style=&quot;text-align:center;&quot; value=&quot;10&quot; name=&quot;ReadTimes&quot; id=&quot;ReadTimes&quot; size=&quot;5&quot;&gt;   页次后重新收费</asp:ListItem>
                        <asp:ListItem Value="4">上述两者都满足时重新收费</asp:ListItem>
                        <asp:ListItem Value="5">上述两者任一个满足时就重新收费</asp:ListItem>
                        <asp:ListItem Value="6">每阅读一页次就重复收费一次（建议不要使用,多页信息将扣多次点数）</asp:ListItem>
                    </asp:RadioButtonList></td>
            </tr>
        </table>	
			
	    </div>
	    
		 <div class="tab-page" id="tab3">
		  <h2 class="tab">自设内容</h2>
			<script type="text/javascript">
						 tabPane1.addTabPage( document.getElementById( "tab3" ) );
			</script>
			
			<table width="100%" border="0" cellpadding="1" cellspacing="1" class="CTable">
         <tr>           
             <td height='30' align='right' width='210' class='lefttd'><strong>自设内容数：</strong></td>
           <td height='28' class="righttd">
              &nbsp;<select name="SpecialDefine_Num" id="SpecialDefine_Num" onChange="setFileFileds(this.value)"><option value="1" selected>1</option><option value="2">2</option><option value="3">3</option><option value="4">4</option><option value="5">5</option><option value="6">6</option><option value="7">7</option><option value="8">8</option><option value="9">9</option><option value="10">10</option><option value="11">11</option><option value="12">12</option><option value="13">13</option><option value="14">14</option><option value="15">15</option><option value="16">16</option><option value="17">17</option><option value="18">18</option><option value="19">19</option><option value="20">20</option> </select>             </td>
         </tr>
         
         <%for (int i = 1; i <= 20; i++)
           {
           %>
           <tbody id="define<%=i %>" style="display:none">
         <tr>           
          <td height='30' align='right' width='210' class='lefttd'><strong>自设内容<%=i %>：</strong><br> <font color=blue>在专题模板页插入{$GetSpecialDefineContent<%=i %>} 调用</font>
             </td>
             <td class="righttd">&nbsp;<textarea ID='SpecialDefineContent<%=i %>' Name='SpecialDefineContent<%=i %>' style='width:500px;height:100px'><% try
                {
                    Response.Write(param[i - 1].ToString());
                }
               catch{}%></textarea> 
                 <a class="textarea_min" href="javascript:zoomtextarea(-2,'SpecialDefineContent<%=i %>');"> </a>
                               <a class="textarea_max" href="javascript:zoomtextarea(2,'SpecialDefineContent<%=i %>');"></a>  
<br />
             </td>
         </tr>
         </tbody>
         <%} %>
         </table>
			
	    </div>
	    
  </div>

         
        
        <br />
        <KS:Foot ID="Foot1" runat="server" SubmitButtonText="确定添加(0)" OnSubmit="Foot1_Submit" />
    </asp:Panel>
</asp:Content>

