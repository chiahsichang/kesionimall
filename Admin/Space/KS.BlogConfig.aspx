<%@ Page Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="True" Inherits="Kesion.NET.WebSite.Admin_BlogConfig" Title="空间博客参数设置" Codebehind="KS.BlogConfig.aspx.cs" %>
<asp:Content ID="Content1" ContentPlaceHolderID="KSContent" Runat="Server">
    <KS:topnav id="TopNav1" runat="server" text="空间博客参数设置"></KS:topnav>
    
    
		<div class="tab-page" id="SystemSpacePanel">
         <script type="text/javascript">
             var tabPane1 = new WebFXTabPane(document.getElementById("SystemSpacePanel"), 1)
         </script>
             
		 <div class="tab-page" id="tab0">
		  <h2 class="tab">基本参数</h2>
			<script type="text/javascript">
						 tabPane1.addTabPage( document.getElementById( "tab0" ) );
			</script>
			
    <table id="tbs" width="100%" border="0" cellpadding="1" cellspacing="1" class="CTable"> 
         <tr>
             <td class="lefttd" height="30" align="right" style="width: 198px"><b>空间状态：</b></td>
                <td class="righttd">
                   <asp:RadioButtonList ID="BlogStatus" runat="server" RepeatDirection="horizontal">
                    <asp:ListItem Value="0">关闭</asp:ListItem>
                    <asp:ListItem Value="1" Selected>正常</asp:ListItem>
                    </asp:RadioButtonList>
                </td>
         </tr>
        <tr>
             <td class="lefttd" height="30" align="right" style="width: 198px"><b>运营模式：</b></td>
                <td class="righttd">
                   <asp:RadioButtonList ID="BlogPattern" runat="server" RepeatDirection="horizontal">
                    <asp:ListItem Value="0" Selected>动态模式</asp:ListItem>
                    <asp:ListItem Value="1" >伪静态(.html)</asp:ListItem>
                    </asp:RadioButtonList>
                </td>
         </tr>
        <tbody style="display:none">
         <tr>
             <td class="lefttd" height="30" align="right" style="width: 198px" ><b>是否启用二级域名：</b></td>
                <td class="righttd">
                    <asp:RadioButtonList ID="BlogEnDomain" runat="server" Enabled="false" >
                    <asp:ListItem Value="0" Selected>绑定本站二级域名</asp:ListItem>
                    <asp:ListItem Value="1">允许绑定本站二级域名和独立域名(独立域名需解释到我的服务器)</asp:ListItem>
                    </asp:RadioButtonList>
                </td>
         </tr>

        
          <tr>
            <td align="right" class="lefttd" height="30" style="width: 198px">
                <strong>空间首页域名：</strong></td>
            <td class="righttd">
                <asp:TextBox CssClass="textbox" Text="space.kesion.com" ID="BlogIndexDomain" runat="server"></asp:TextBox>
                <span class="tips">如: space.kesion.com，后面不能加"/"，没有绑定二级域名请留空。 。</span></td>
        </tr>
        <tr>
            <td align="right" class="lefttd" height="30" style="width: 198px">
                <strong>空间站点二级域名：</strong></td>
            <td class="righttd">
                <asp:TextBox CssClass="textbox" Text="space.kesion.com" ID="BlogSubDomain" runat="server"></asp:TextBox>
                <span class="tips">如:三级域名:space.kesion.com或二级域名kesion.com </span></td>
        </tr>
        </tbody>
        
        <tr>
            <td align="right" class="lefttd" height="30" style="width: 198px">
                <strong>是否自动注册个人空间：</strong></td>
            <td class="righttd">
                <asp:RadioButtonList ID="BlogAutoSpace" runat="server" RepeatDirection="horizontal">
                <asp:ListItem Value="1" Selected>是</asp:ListItem>
                <asp:ListItem Value="0">否</asp:ListItem>
                </asp:RadioButtonList></td>
        </tr>
        <tr>
            <td align="right" class="lefttd" height="30" style="width: 198px">
                <strong>申请空间是否需要审核：</strong></td>
            <td class="righttd">
                <asp:RadioButtonList ID="BlogEnCheck" runat="server" RepeatLayout="Flow" RepeatDirection="Vertical">
                <asp:ListItem Value="1">不需要</asp:ListItem>
                <asp:ListItem Value="0">需要</asp:ListItem>
                </asp:RadioButtonList></td>
        </tr>
        

        

        <tr>
            <td align="right" class="lefttd" height="30" style="width: 198px">
                <strong>允许自定义页面的用户组：</strong></td>
            <td class="righttd">
                <div  runat="server" id="chkUserlevel">
                </div></td>
        </tr>

        <tr>
            <td align="right" class="lefttd" height="30" style="width: 198px">
                <strong>空间模板选项：</strong></td>
            <td class="righttd">
                博文列表显示<asp:TextBox CssClass="textbox" Text="8" ID="BlogArticleList" runat="server" Width="50" Style="border:none;border-bottom:1px solid solid; text-align:center;"></asp:TextBox>；
                相册列表显示<asp:TextBox CssClass="textbox" Text="8" ID="BlogAlbumList" runat="server" Width="50" Style="border:none;border-bottom:1px solid solid; text-align:center;"></asp:TextBox>；
                文集列表显示<asp:TextBox CssClass="textbox" Text="8" ID="BlogCorpusList" runat="server" Width="50" Style="border:none;border-bottom:1px solid solid; text-align:center;"></asp:TextBox>；
                问答列表显示<asp:TextBox CssClass="textbox" Text="8" ID="BlogAskList" runat="server" Width="50" Style="border:none;border-bottom:1px solid solid; text-align:center;"></asp:TextBox>
        </tr>
        <tr>
            <td align="right" class="lefttd" height="30" style="width: 198px">
                <strong>空间Logo图片属性：</strong></td>
            <td class="righttd">
                限制上传大小<asp:TextBox CssClass="textbox" Text="1000" ID="BlogLogoSize" runat="server" Width="50" Style="border:none;border-bottom:1px solid solid; text-align:center;"></asp:TextBox>kb；
                限制图片扩展名<asp:TextBox CssClass="textbox" Text="jpg|png|gif" ID="BlogLogoExt" runat="server" Width="150" Style="border:none;border-bottom:1px solid solid; text-align:center;"></asp:TextBox>；
        </tr>
      
         </table>
    </div>
         
         
          
         
		 <div class="tab-page" id="tab3">
		  <h2 class="tab">发表设置</h2>
			<script type="text/javascript">
			    tabPane1.addTabPage(document.getElementById("tab3"));
			</script>
             <table width="100%"  border="0" cellpadding="1" cellspacing="1" class="CTable"> 

        <tr>
            <td align="right" class="lefttd" height="30" style="width: 198px">
                <strong>积分限制：</strong></td>
            <td class="righttd">
                发表日志要求达到<asp:TextBox CssClass="textbox" Text="0" ID="BlogArticleCredits" runat="server" Width="50" Style="border:none;border-bottom:1px solid solid; text-align:center;"></asp:TextBox>分积分；
                上传照片要求达到<asp:TextBox CssClass="textbox" Text="0" ID="BlogAlbumCredits" runat="server" Width="50" Style="border:none;border-bottom:1px solid solid; text-align:center;"></asp:TextBox>分积分。
        </tr>

          
         <tr>
             <td class="lefttd" height="30" align="right" style="width: 198px"><b>发表日志是否需要审核：</b>
             <div style="color:green"></div>
             </td>
                <td class="righttd">
                <asp:RadioButtonList ID="BlogArticleEnCheck" runat="server" RepeatDirection="horizontal">
                <asp:ListItem Value="0" Selected>是</asp:ListItem>
                <asp:ListItem Value="1">否</asp:ListItem>
                </asp:RadioButtonList></td>
         </tr>
        <tr>
             <td class="lefttd" height="30" align="right" style="width: 198px"><b>发表日志是否允许上传附件：</b>
             <div style="color:green"></div>
             </td>
                <td class="righttd">
                <asp:RadioButtonList ID="BlogArticleUploadFileSwitch" runat="server" RepeatDirection="horizontal">
                <asp:ListItem Value="1" Selected>是</asp:ListItem>
                <asp:ListItem Value="0">否</asp:ListItem>
                </asp:RadioButtonList></td>
         </tr>
        <tr>
            <td align="right" class="lefttd" height="30" style="width: 198px">
                <strong>允许上传附件选项：</strong></td>
            <td class="righttd">
                允许上传的附件扩展名<asp:TextBox CssClass="textbox" Text="gif | jpg | rar" ID="BlogArticleFileExt" runat="server" Width="100" Style="border:none;border-bottom:1px solid solid;text-align:center;"></asp:TextBox>多个扩展名用 |隔开,如gif|jpg|rar等<br />
                允许上传的文件大小<asp:TextBox CssClass="textbox" Text="1000" ID="BlogArticleFileSize" runat="server" Width="50" Style="border:none;border-bottom:1px solid solid;"></asp:TextBox>KB<br />

        </tr>

        <tr>
             <td class="lefttd" height="30" align="right" style="width: 198px"><b>允许上传附件的用户组：</b>
             <div style="color:green"></div>
             </td>
                <td class="righttd">
               <div id="GroupPanel" runat="server"></div>
                </td>
         </tr>

        <tr>
             <td class="lefttd" height="30" align="right" style="width: 198px"><b>创建相册是否需要审核：</b>
             <div style="color:green"></div>
             </td>
                <td class="righttd">
                <asp:RadioButtonList ID="BlogAlbumEnCheck" runat="server" RepeatDirection="horizontal">
                <asp:ListItem Value="0" Selected>是</asp:ListItem>
                <asp:ListItem Value="1">否</asp:ListItem>
                </asp:RadioButtonList></td>
         </tr>

         <tr>
            <td align="right" class="lefttd" height="30" style="width: 198px">
                <strong>最大允许上传的单张照片：</strong></td>
            <td class="righttd">
                允许上传的文件大小<asp:TextBox CssClass="textbox" ID="BlogAlbumFileSize" Text="1000" runat="server" Width="50" Style="border:none;border-bottom:1px solid solid;"></asp:TextBox>KB<br />
        </tr>


        <tr>
             <td class="lefttd" height="30" align="right" style="width: 198px"><b>用户留言是否需要审核：</b>
             <div style="color:green"></div>
             </td>
                <td class="righttd">
                <asp:RadioButtonList ID="BlogMessageEnCheck" runat="server" RepeatDirection="horizontal">
                <asp:ListItem Value="0" Selected>是</asp:ListItem>
                <asp:ListItem Value="1">否</asp:ListItem>
                </asp:RadioButtonList></td>
         </tr>

        <tr>
             <td class="lefttd" height="30" align="right" style="width: 198px"><b>允许游客在空间里评论/留言：</b>
             <div style="color:green"></div>
             </td>
                <td class="righttd">
                <asp:RadioButtonList ID="BlogMessageEnComment" runat="server" RepeatDirection="horizontal">
                <asp:ListItem Value="1" Selected>允许</asp:ListItem>
                <asp:ListItem Value="0">不允许</asp:ListItem>
                </asp:RadioButtonList></td>
         </tr>
         
        </table>
      </div>
         
         
         
		 <div class="tab-page" id="tab2">
		  <h2 class="tab"  style="display:none;">模板绑定</h2>
			<script type="text/javascript">
			    tabPane1.addTabPage(document.getElementById("tab2"));
			</script>
             <table width="100%"  border="0" cellpadding="1" cellspacing="1" class="CTable"> 
          
         <tr>
             <td class="lefttd" height="30" align="right" style="width: 198px"><b>频道首页模板：</b>
             <div style="color:green">对应动态页面Index.aspx</div>
             </td>
                <td class="righttd">
                    &nbsp;<asp:TextBox CssClass="textbox" ID="ExamIndexTemplate" runat="server" Width="297px"></asp:TextBox>
                    <input type="button" class="button" onMouseOver="this.className='button_on';" onMouseOut="this.className='button';" value="选择模板..." onClick="SelectTemplate('<%=this.ExamIndexTemplate.ClientID%>');"/>
                </td>
         </tr>
          
         <tr>
             <td class="lefttd" height="30" align="right" style="width: 198px"><b>分类列表页模板：</b>
             <div style="color:green">对应动态页面List.aspx</div>
             </td>
                <td class="righttd">
                    &nbsp;<asp:TextBox CssClass="textbox" ID="ExamListTemplate" runat="server" Width="297px"></asp:TextBox>
                    <input type="button" class="button" onMouseOver="this.className='button_on';" onMouseOut="this.className='button';" value="选择模板..." onClick="SelectTemplate('<%=this.ExamListTemplate.ClientID%>');"/>
                </td>
         </tr>

          
         <tr>
             <td class="lefttd" height="30" align="right" style="width: 198px"><b>内容详细页模板：</b>
             <div style="color:green">对应动态页面View.aspx</div>
             </td>
                <td class="righttd">
                    &nbsp;<asp:TextBox CssClass="textbox" ID="ExamContentTemplate" runat="server" Width="297px"></asp:TextBox>
                    <input type="button" class="button" onMouseOver="this.className='button_on';" onMouseOut="this.className='button';" value="选择模板..." onClick="SelectTemplate('<%=this.ExamContentTemplate.ClientID%>');"/>
                </td>
         </tr>

       
          
    </table>
    </div>
         
		 <div class="tab-page" id="tab1">
		  <h2 class="tab"  style="display:none;">SEO选项</h2>
			<script type="text/javascript">
			    tabPane1.addTabPage(document.getElementById("tab1"));
			</script>
             <table width="100%"  border="0" cellpadding="1" cellspacing="1" class="CTable"> 
                              <tr>
                                <td  height="30" align="right" class="lefttd" style="width: 198px">
                                    <b>考试频道标题：</b><br /><font color="#ff0000">网页标题通常是搜索引擎关注的重点,</font></td>
                                <td class="righttd">
                                    &nbsp;<asp:TextBox ID="TxtExamSeoTitle" runat="server" Columns="50" Rows="3" TextMode="MultiLine"></asp:TextBox>
                                        
                                </td>
                              </tr>

                             <tr>
                                 <td align="right" class="lefttd" height="30" style="width: 198px"><strong>考试频道META关键词：
                                     </strong><br />
                                     <font color="#ff0000">
                                     针对搜索引擎设置的网页关键词,多个关键词请用,号分隔
                                     </font>
                                 </td>
                                 <td class="righttd">
                                     &nbsp;<asp:TextBox ID="TxtExamSeoKeywords" runat="server" TextMode="MultiLine" Columns="50" Rows="5"></asp:TextBox>
                                 </td>
                             </tr>
                             <tr>
                                 <td align="right" class="lefttd" height="30" style="width: 198px">
                                     <div>
                                         <strong>考试频道META网页描述：</strong></div>
                                     <font color="#ff0000">针对搜索引擎设置的网页描述,多个描述请用,号分隔&nbsp;</font></td>
                                 <td class="righttd">
                                     &nbsp;<asp:TextBox ID="TxtExamSeoDescript" runat="server" TextMode="MultiLine" Columns="50" Rows="5"></asp:TextBox>
                               </td>
                             </tr>
              </table>

         </div>
         
    <br /><br style="clear:both" />
        <br />
    <KS:Foot runat="server" CancelButtonEnabled="false" ID="Foot1" OnSubmit="Foot1_Submit"/>
    <KS:Tips ID="Tips1" runat="server" ImagePath="../../admin/images/" />

</asp:Content>

