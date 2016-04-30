<%@ Page Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.Admin_BBSConfig" Title="微社区系统参数设置" Codebehind="KS.BBSConfig.aspx.cs" %>
<asp:Content ID="Content1" ContentPlaceHolderID="KSContent" Runat="Server">
    <KS:topnav id="TopNav1" runat="server" text="微社区系统频道参数设置"></KS:topnav>
    
    
		<div class="tab-page" id="SystemBBSPanel">
         <script type="text/javascript">
           var tabPane1 = new WebFXTabPane( document.getElementById( "SystemBBSPanel" ), 1 )
         </script>
             
		 <div class="tab-page" id="tab0">
		  <h2 class="tab">基本参数</h2>
			<script type="text/javascript">
						 tabPane1.addTabPage( document.getElementById( "tab0" ) );
			</script>
			
    <table id="tbs" width="100%" border="0" cellpadding="1" cellspacing="1" class="CTable"> 
         <tr>
             <td class="lefttd" height="30" align="right" style="width: 198px"><b>微社区频道状态：</b></td>
                <td class="righttd">
                   <asp:RadioButtonList ID="BBSStatus" runat="server" RepeatDirection="horizontal">
                    <asp:ListItem Value="0">关闭</asp:ListItem>
                    <asp:ListItem Value="1" Selected>正常</asp:ListItem>
                    </asp:RadioButtonList>
                </td>
         </tr>
          <tr>
            <td align="right" class="lefttd" height="30" style="width: 198px">
                <strong>微社区频道名称：</strong></td>
            <td class="righttd">
                <asp:TextBox CssClass="textbox" ID="TxtBBSName" runat="server"></asp:TextBox>
                <span class="tips">如微社区频道。</span></td>
        </tr>
        <tr>
            <td align="right" class="lefttd" height="30" style="width: 198px">
                <strong>前台安装目录：</strong></td>
            <td class="righttd">
                <asp:TextBox CssClass="textbox" ID="BBSInstallDir" runat="server"></asp:TextBox>
                <span class="tips">如Club，BBS等</span></td>
        </tr>
        <tr>
            <td align="right" class="lefttd" height="30" style="width: 198px">
                <strong>绑定二级域名：</strong></td>
            <td class="righttd">
                <asp:TextBox CssClass="textbox" ID="TxtBBSDomain" runat="server"></asp:TextBox>
              <span class="tips">如：http://bbs.kesion.com，后面不能加"/"，没有绑定二级域名请留空。</span>
                </td>
        </tr>
        
        <tr>
            <td align="right" class="lefttd" height="30" style="width: 198px">
                <strong>话题/回复审核设置：</strong></td>
            <td class="righttd">
                <asp:CheckBox ID="CkbBBSPubVerifyTF" runat="server" Text=" 发表话题需要审核" />
                <asp:CheckBox ID="CkbBBSReplyVerifyTF" runat="server" Text="回复话题需要审核" />
            </td>
        </tr>

        <tr>
            <td align="right" class="lefttd" height="30" style="width: 198px">
                <strong>话题/回复删除设置：</strong></td>
            <td class="righttd">
                <asp:CheckBox ID="CkbBBSDelTopic" runat="server" Text="可以删除自己的话题" />
                <asp:CheckBox ID="CkbBBSDelReply" runat="server" Text="可以删除自己的回复" />
            </td>
        </tr>

        
        <tr>
            <td align="right" class="lefttd" height="30" style="width: 198px">
                <strong>是否允许游客发表话题：</strong></td>
            <td class="righttd">
                <asp:RadioButtonList ID="BBSVisitorTF" runat="server" RepeatDirection="horizontal">
                <asp:ListItem Value="0">不允许（建议）</asp:ListItem>
                <asp:ListItem Value="1">允许</asp:ListItem>
                </asp:RadioButtonList></td>
        </tr>
        <tr>
            <td align="right" class="lefttd" height="30" style="width: 198px">
                <strong>是否允许游客回复话题：</strong></td>
            <td class="righttd">
                <asp:RadioButtonList ID="BBSReplyVisitorTF" runat="server" RepeatDirection="horizontal">
                <asp:ListItem Value="0">不允许（建议）</asp:ListItem>
                <asp:ListItem Value="1">允许</asp:ListItem>
                </asp:RadioButtonList></td>
        </tr>
       

        <tr>
            <td align="right" class="lefttd" height="30" style="width: 198px">
                <strong>可以回复自己的问题：</strong></td>
            <td class="righttd">
                <asp:RadioButtonList ID="BBSAnswerOwnQuestion" runat="server" RepeatDirection="horizontal">
                <asp:ListItem Value="0">不允许</asp:ListItem>
                <asp:ListItem Value="1">允许（建议）</asp:ListItem>
                </asp:RadioButtonList></td>
        </tr>
        <tr>
            <td align="right" class="lefttd" height="30" style="width: 198px">
                <strong>发表话题字数限制：</strong></td>
            <td class="righttd">
                 
                 <strong>发表话题：</strong>
                最少<asp:TextBox ID="TxtTopicMinLen" style="text-align:center" CssClass="textbox" runat="server" Text="10" Width="50"></asp:TextBox>个字
                最多<asp:TextBox ID="TxtTopicMaxLen" style="text-align:center" CssClass="textbox" runat="server" Text="500" Width="50"></asp:TextBox>个字<span class="tips">(不能超过4000个字符，建议设置500)</span>
                <br />
               <strong>回复话题：</strong>
                最少<asp:TextBox ID="TxtReplyMinLen" style="text-align:center" CssClass="textbox" runat="server" Text="10" Width="50"></asp:TextBox>个字
                最多<asp:TextBox ID="TxtReplyMaxLen" style="text-align:center" CssClass="textbox" runat="server" Text="500" Width="50"></asp:TextBox>个字<span class="tips">(不能超过4000个字符，建议设置500)</span>
           </td>
        </tr>
        <tr style="display:none">
            <td align="right" class="lefttd" height="30" style="width: 198px">
                <strong>发表话题上传设置：</strong></td>
            <td class="righttd">
                <asp:CheckBox ID="CkbUploadPic" runat="server"  Text="允许上传图片" />
                <asp:CheckBox ID="CkbUploadVideo" runat="server"  Text="允许上传视频" />
                <asp:CheckBox ID="CkbUploadAnnex" runat="server"  Text="允许上传附件" /><br />
                允许上传的图片类型：<asp:TextBox ID="TxtAllowUploadPicType" CssClass="textbox" runat="server" Text="gif|jpg" /><span class="tips">多个扩展名允许上传请用英文逗号“,”隔开。</span><br />
                允许上传的图片大小：<asp:TextBox ID="TxtAllowUploadPicSize" CssClass="textbox" runat="server" Text="1024" />KB <span class="tips">建议设置不超过2M。</span><br />
                允许上传的视频类型：<asp:TextBox ID="TxtAllowUpoadVideoType" CssClass="textbox" runat="server" Text="flv|mp4" /><span class="tips">建议设置为flv及mp4。</span><br />
                允许上传的视频大小：<asp:TextBox ID="TxtAllowUploadVideoSize" runat="server" CssClass="textbox" Text="10" />MB <span class="tips">建议设置不超过10MB。</span><br />
                允许上传的附件类型：<asp:TextBox ID="TxtAllowUploadAnnexType" CssClass="textbox" runat="server" Text="doc|rar" /><span class="tips">建议设置通用的格式，如rar及doc等，多个扩展名允许上传请用英文逗号“,”隔开。。</span><br />
                允许上传的附件大小：<asp:TextBox ID="TxtAllowUploadAnnexSize" runat="server" CssClass="textbox" Text="5" />MB <span class="tips">建议设置不超过5MB。</span>

           </td>
        </tr>

      
         </table>
    </div>
         
         
		 <div class="tab-page" id="tab2">
		  <h2 class="tab">模板绑定</h2>
			<script type="text/javascript">
			    tabPane1.addTabPage(document.getElementById("tab2"));
			</script>
             <table width="100%"  border="0" cellpadding="1" cellspacing="1" class="CTable"> 
          
         <tr>
             <td class="lefttd" height="30" align="right" style="width: 198px"><b>微社区首页模板：</b>
             </td>
                <td class="righttd">
                    &nbsp;<asp:TextBox CssClass="textbox" ID="BBSIndexTemplate" runat="server" Width="297px"></asp:TextBox>
                    <input type="button" class="button" onMouseOver="this.className='button_on';" onMouseOut="this.className='button';" value="选择模板..." onClick="SelectTemplate('<%=this.BBSIndexTemplate.ClientID%>');"/>
                </td>
         </tr>
          
         <tr>
             <td class="lefttd" height="30" align="right" style="width: 198px"><b>微社区版面模板：</b>
             </td>
                <td class="righttd">
                    &nbsp;<asp:TextBox CssClass="textbox" ID="BBSListTemplate" runat="server" Width="297px"></asp:TextBox>
                    <input type="button" class="button" onMouseOver="this.className='button_on';" onMouseOut="this.className='button';" value="选择模板..." onClick="SelectTemplate('<%=this.BBSListTemplate.ClientID%>');"/>
                   <!-- <a href="../../<%=this.BBSInstallDir.Text %>/list.aspx" style="color:green" target="_blank">预览</a>-->
                </td>
         </tr>
        <tr>
             <td class="lefttd" height="30" align="right" style="width: 198px"><b>子版面列表模板：</b>
           
             </td>
                <td class="righttd">
                    &nbsp;<asp:TextBox CssClass="textbox" ID="TxtBBSSubBoardTemplate" runat="server" Width="297px"></asp:TextBox>
                    <input type="button" class="button" onMouseOver="this.className='button_on';" onMouseOut="this.className='button';" value="选择模板..." onClick="SelectTemplate('<%=this.TxtBBSSubBoardTemplate.ClientID%>    ');"/>

                </td>
         </tr>
          
         <tr>
             <td class="lefttd" height="30" align="right" style="width: 198px"><b>帖子详细页模板：</b>
             </td>
                <td class="righttd">
                    &nbsp;<asp:TextBox CssClass="textbox" ID="BBSContentTemplate" runat="server" Width="297px"></asp:TextBox>
                    <input type="button" class="button" onMouseOver="this.className='button_on';" onMouseOut="this.className='button';" value="选择模板..." onClick="SelectTemplate('<%=this.BBSContentTemplate.ClientID%>');"/>
                </td>
         </tr>
         
         <tr>
             <td class="lefttd" height="30" align="right" style="width: 198px"><b>发表话题模板：</b>
             </td>
                <td class="righttd">
                    &nbsp;<asp:TextBox CssClass="textbox" ID="TxtBBSTemplate" runat="server" Width="297px"></asp:TextBox>
                    <input type="button" class="button" onMouseOver="this.className='button_on';" onMouseOut="this.className='button';" value="选择模板..." onClick="SelectTemplate('<%=this.TxtBBSTemplate.ClientID%>');"/>
                </td>
         </tr>

       
          
    </table>
    </div>
         
		 <div class="tab-page" id="tab1">
		  <h2 class="tab">SEO选项</h2>
			<script type="text/javascript">
			    tabPane1.addTabPage(document.getElementById("tab1"));
			</script>
             <table width="100%"  border="0" cellpadding="1" cellspacing="1" class="CTable"> 
                              <tr>
                                <td  height="30" align="right" class="lefttd" style="width: 198px">
                                    <b>微社区频道标题：</b></td>
                                <td class="righttd"><asp:TextBox ID="TxtBBSSeoTitle" runat="server" CssClass="textbox" Width="450px"></asp:TextBox>
                               <br /><span class="tips">网页标题通常是搜索引擎关注的重点</span> </td>
                              </tr>

                             <tr>
                                 <td align="right" class="lefttd" height="30" style="width: 198px"><strong>微社区频道META关键词：
                                     </strong>
                                 </td>
                                 <td class="righttd"><asp:TextBox ID="TxtBBSSeoKeywords" runat="server" TextMode="MultiLine" Columns="70" Rows="8" Width="450px"></asp:TextBox>
                                <a class="textarea_min" href="javascript:zoomtextarea(-2,'<%=this.TxtBBSSeoKeywords.ClientID %>');"> </a>
                               <a class="textarea_max" href="javascript:zoomtextarea(2,'<%=this.TxtBBSSeoKeywords.ClientID %>');"></a>  
                                   <br />
                                     <span class="tips">
                                     针对搜索引擎设置的网页关键词,多个关键词请用,号分隔
                                     </span>
                                 </td>
                             </tr>
                             <tr>
                                 <td align="right" class="lefttd" height="30" style="width: 198px">
                                     <div>
                                         <strong>微社区频道META网页描述：</strong></div>
                                     </td>
                                 <td class="righttd"><asp:TextBox ID="TxtBBSSeoDescript" runat="server" TextMode="MultiLine" Columns="70" Rows="8" Width="450px"></asp:TextBox>
                                <a class="textarea_min" href="javascript:zoomtextarea(-2,'<%=this.TxtBBSSeoDescript.ClientID %>');"> </a>
                               <a class="textarea_max" href="javascript:zoomtextarea(2,'<%=this.TxtBBSSeoDescript.ClientID %>');"></a>  
                               <br /><span class="tips">针对搜索引擎设置的网页描述,多个描述请用,号分隔&nbsp;</span></td>
                             </tr>
              </table>

         </div>
         
    <br /><br style="clear:both" />
        <br />
    <KS:Foot runat="server" CancelButtonVisible="false" ID="Foot1" OnSubmit="Foot1_Submit"/>
    <KS:Tips ID="Tips1" runat="server" ImagePath="../../admin/images/tipsico/" />

</asp:Content>

