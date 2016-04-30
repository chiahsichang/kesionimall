<%@ Page Language="C#" validateRequest="false" enableEventValidation="false" viewStateEncryptionMode ="Never" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.Admin_Config"  Title="基本信息设置" Codebehind="KS.Config.aspx.cs" %>
<%@ Import Namespace="Kesion.Cache"%>
<asp:Content ID="Content1" ContentPlaceHolderID="KSContent" Runat="Server">
<script>
 <!--
    function showwatermarkarea(){
       var checkrad=jQuery("#<%=this.WaterMarkType.ClientID %> :radio[checked]").val();
       if (checkrad=="1"){
           jQuery("#<%=this.watermarktxtarea.ClientID %>").css("display","none");
           jQuery("#<%=this.watermarkpicarea.ClientID %>").css("display","");
       }else{
           jQuery("#<%=this.watermarktxtarea.ClientID %>").css("display","");
           jQuery("#<%=this.watermarkpicarea.ClientID %>").css("display","none");
       }
   }
   function showFtp() {
       if (jQuery("#<%=this.RdbRemoteAnnexTF.ClientID %> :radio[checked]").val() == "1") {
           jQuery("#<%=this.ftp.ClientID %>").show();
       } else {
           jQuery("#<%=this.ftp.ClientID %>").hide();
       }
   }
   function show3G() {
       if (jQuery("#<%=this.Rdb3GEnable.ClientID %> :radio[checked]").val() == "1") {
           jQuery("#<%=this.G3.ClientID %>").show();
       } else {
           jQuery("#<%=this.G3.ClientID %>").hide();
       }

   }
   function showDomain() {
       if (jQuery("#<%=this.RdbAllowSubDomain.ClientID %> :radio[checked]").val() == "true") {
           jQuery("#rootDomain").show();
       } else {
           jQuery("#rootDomain").hide();
       }

   }
   function showfsotime() {
       if (jQuery("#<%=this.FsoIndexExt.ClientID %> option:selected").val() != ".aspx") {
           jQuery("#fsoIndexTime").show();
       } else {
           jQuery("#fsoIndexTime").hide();
       }
   }
   jQuery(document).ready(function () {
       showFtp();
       showDomain();
       show3G();
   });
 //-->
</script>

       <KS:TopNav ID="TopNav1" runat="server" />


		<div class="tab-page" id="SystemPanel">
         <script type="text/javascript">
           var tabPane1 = new WebFXTabPane( document.getElementById( "SystemPanel" ), 1 )
         </script>
             
		 <div class="tab-page" id="tab0">
		  <h2 class="tab">基本参数</h2>
			<script type="text/javascript">
						 tabPane1.addTabPage( document.getElementById( "tab0" ) );
			</script>

                 <table width="100%" border="0" cellpadding="1" cellspacing="1" class="CTable"> 
                           <tr>
                              <td class="lefttd" align="right" style="width: 198px"><b>站点名称：</b></td>
                              <td class="righttd"><asp:TextBox CssClass="textbox" Width="350" ID="SiteName" runat="server"></asp:TextBox>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="SiteName"
                                                        ErrorMessage="请填写站点名称" Display="Dynamic"></asp:RequiredFieldValidator><span class="tips">将显示在站点位置导航等</span>
                                                        </td>
                            </tr>
                            <tr>
                              <td  height="30" align="right" class="lefttd" style="width: 198px"><b>网站域名：</b></td>
                                                <td class="righttd"><asp:TextBox CssClass="textbox" Width="350" ID="Domain" runat="server"></asp:TextBox> <span class="tips">*必须以http://开头，且后面不要带"/"。如：http://www.kesion.com</span>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="Domain"
                                                        ErrorMessage="RequiredFieldValidator">*请填写网站域名</asp:RequiredFieldValidator></td>
                                              </tr>
                                                 <tr>
                                                     <td align="right" class="lefttd" style="height: 30px; width: 198px;"><strong>安装目录：</strong></td>
                                                     <td style="height: 30px" class="righttd"><asp:TextBox CssClass="textbox" Width="350" ID="InstallDir" runat="server" ReadOnly="True"></asp:TextBox>
                                                          <span class="tips">*系统安装的虚拟目录,系统会自动获取，无需填写。</span></td>
                                                 </tr>
                                              <tr>
                                                <td  height="30" align="right" class="lefttd" style="width: 198px"><strong>网站Logo地址：</strong></td>
                                                <td class="righttd"><asp:TextBox CssClass="textbox" Width="350" ID="WebLogo" runat="server"></asp:TextBox>&nbsp;<input type="button" class="button" onclick="SelectFiles('<%=this.WebLogo.ClientID %>',0);" value="选择Logo..."></td>
                                              </tr>
                                              <tr>
                                                <td  height="30" align="right" class="lefttd" style="width: 198px"><strong>生成的首页：</strong></td>
                                                <td class="righttd">
                                                    <table border="0" cellpadding="0" cellspacing="0">
                                                       <tr>
                                                        <td><asp:RadioButtonList ID="IndexFile" runat="server" RepeatDirection="Horizontal"
                                                            Width="120px" BorderStyle="None" RepeatLayout="Flow">
                                                            <asp:ListItem>index</asp:ListItem>
                                                            <asp:ListItem>default</asp:ListItem>
                                                        </asp:RadioButtonList>
                                                        </td>
                                                        <td>
                                                        <asp:DropDownList ID="FsoIndexExt" runat="server">
                                                            <asp:ListItem>.aspx</asp:ListItem>
                                                            <asp:ListItem>.asp</asp:ListItem>
                                                            <asp:ListItem>.htm</asp:ListItem>
                                                            <asp:ListItem>.html</asp:ListItem>
                                                            <asp:ListItem>.shtm</asp:ListItem>
                                                            <asp:ListItem>.shtml</asp:ListItem>
                                                        </asp:DropDownList>
                                                        <span class="tips">网站正式运营后，建议设置为“index.html”。 </span>
                                                        </td>
                                                      </tr>
                                                  </table>

                                                  <div id="fsoIndexTime"<%=this.FsoIndexExt.SelectedValue==".aspx"?" style='display:none'":"" %>>
                                                  间隔<asp:TextBox ID="TxtAutoCreateIndexTime" runat="server" style="text-align:center" CssClass="textbox" Width="42px" />分钟自动生成首页                                                         
                                                     <span class="tips">当设置首页启用生成静态HTML功能时，这里可以设置首页每隔一段时间自动生成，不启用自动生成请输入“0”。</span>
                                                  </div>
                                                </td>
                                              </tr>
                                                <tr>
                                                     <td align="right" class="lefttd" height="30" style="width: 198px">
                                                         <strong>专题是否启用生成：</strong></td>
                                                     <td class="righttd"><asp:RadioButtonList ID="SpecialFsoTF" runat="server" RepeatDirection="Horizontal"
                                                            Width="120px" BorderStyle="None" RepeatLayout="Flow">
                                                            <asp:ListItem Value="1">启用</asp:ListItem>
                                                            <asp:ListItem Value="0">不启用</asp:ListItem>
                                                        </asp:RadioButtonList>
                                                     </td>
                                                 </tr>

                                               
                                     

                                                <tr>
                                                     <td align="right" class="lefttd" height="30" style="width: 198px">
                                                         <strong>动态页面缓存时间：</strong></td>
                                                     <td class="righttd"><asp:TextBox ID="TxtCacheTime" runat="server" style="text-align:center" CssClass="textbox" Width="42px" />分钟                                                          
                                                          <span class="tips">
                                                         网站调试阶段请将此值设置为“0”，以便更好的调试前台的模板。网站正式运行后，建议设置一个数值，如10分钟，您将会发现网站的性能提高相当明显。</span>
                                                     </td>
                                                 </tr>
                                     
                                     
                                                 <tr>
                                                     <td align="right" class="lefttd" height="30" style="width: 198px">
                                                         <strong>默认允许上传的文件大小：</strong></td>
                                                     <td class="righttd"><asp:TextBox CssClass="textbox" ID="DefaultUpFileSize" runat="server" Width="42px"></asp:TextBox>KB &nbsp;
                                                         &nbsp; &nbsp; &nbsp;<span class="tips">提示：1 KB=1024 Byte, 1 MB=1024 KB</span>
                                                     </td>
                                                 </tr>
                                                     <tr>
                                                         <td align="right" class="lefttd" height="30" style="width: 198px">
                                                             <div><strong>默认允许上传文件类型：</strong></div>
                                                         </td>
                                                         <td class="righttd"><asp:TextBox CssClass="textbox" ID="DefaultUpFileType" runat="server" Width="350"></asp:TextBox>
                                                             <span class="tips">多个扩展名用"|"格开</span></td>
                                                     </tr>
                                                     <tr>
                                                         <td align="right" class="lefttd" height="30" style="width: 198px">
                                                             <div>
                                                                 <strong>站长姓名：</strong></div>
                                                         </td>
                                                         <td class="righttd"><asp:TextBox Width="350" CssClass="textbox" ID="WebMaster" runat="server"></asp:TextBox></td>
                                                     </tr>
                                                     <tr>
                                                         <td align="right" class="lefttd" height="30" style="width: 198px">
                                                             <div>
                                                                 <strong>登录后台主界面官方信息显示：</strong></div>
                                                         </td>
                                                         <td class="righttd">
                                                             <asp:CheckBoxList ID="OfficialInfo" runat="server" RepeatDirection="Horizontal">
                                                                 <asp:ListItem Value="1">显示官方版本号</asp:ListItem>
                                                                 <asp:ListItem Value="2">显示官方新闻公告</asp:ListItem>
                                                                 <asp:ListItem Value="3">显示右下角消息提示</asp:ListItem>
                                                                 <asp:ListItem Value="4">开启自动检测新版本</asp:ListItem>
                                                             </asp:CheckBoxList></td>
                                                     </tr>
                                                     <tr>
                                                         <td align="right" class="lefttd" height="30" style="width: 198px">
                                                             <div>
                                                                 <strong>官方授权的唯一系列号：</strong></div>
                                                         </td>
                                                         <td class="righttd"><asp:TextBox CssClass="textbox" ID="SiteKey" runat="server" Width="350"></asp:TextBox>
                                                             <span class="tips">25位的产品授权系列号，免费版本无需填写。</span></td>
                                                     </tr>
                                                     <tr>
                                                         <td align="right" class="lefttd" height="30" style="width: 198px">
                                                             <div>
                                                                 <strong>网站的版权信息：</strong></div>
                                                           </td>
                                                         <td class="righttd"><asp:TextBox CssClass="textbox textarea" Width="350"  Height="100" ID="CopyRight" runat="server" TextMode="MultiLine" Columns="50" Rows="4"></asp:TextBox>
                                                               <a class="textarea_min" href="javascript:zoomtextarea(-5,'<%=this.CopyRight.ClientID %>');"></a>
                                                               <a class="textarea_max" href="javascript:zoomtextarea(5,'<%=this.CopyRight.ClientID %>');">
                                                                     </a>
                                                              <br /><span class="tips">用于显示网站版权、联系方式等，支持html语法。</span>
                                                         </td>
                                                     </tr>
                                      </table>

         </div>



          <div class="tab-page" id="3gtab">
		  <h2 class="tab">手机版设置</h2>
			<script type="text/javascript">
			    tabPane1.addTabPage(document.getElementById("3gtab"));
			</script>
             <table width="100%"  border="0" cellpadding="1" cellspacing="1" class="CTable"> 
                 <tr>
                     <td  height="30" align="right" class="lefttd" style="width: 198px"> <b>开启手机版功能：</b></td>
                     <td class="righttd">
                       &nbsp;<asp:RadioButtonList ID="Rdb3GEnable" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow">
                       <asp:ListItem Value="0">不启用</asp:ListItem>
                       <asp:ListItem Value="1" Selected>启用</asp:ListItem>
                       </asp:RadioButtonList>
                     </td>
                 </tr>
                 <tbody id="G3" runat="server">
                  <tr>
                     <td  height="30" align="right" class="lefttd" style="width: 198px"> <b>手机版安装目录：</b></td>
                     <td class="righttd">
                       &nbsp;<asp:TextBox CssClass="textbox" Width="350" ID="Txt3GInstallDir" runat="server" ></asp:TextBox>
                       <span class="tips">如：3G,WAP等</span>
                     </td>
                 </tr>
                 <tr>
                     <td  height="30" align="right" class="lefttd" style="width: 198px"> <b>手机版站点名称：</b></td>
                     <td class="righttd">
                       &nbsp;<asp:TextBox CssClass="textbox" Width="350" ID="Txt3GSiteName" runat="server" ></asp:TextBox>
                     </td>
                 </tr>
                
                 <tr>
                     <td  height="30" align="right" class="lefttd" style="width: 198px"> <b>手机版站点Logo：</b></td>
                     <td class="righttd">
                       &nbsp;<asp:TextBox CssClass="textbox" Width="350" ID="Txt3GLogo" runat="server" ></asp:TextBox>&nbsp;<input type="button" class="button" onclick="SelectFiles('<%=this.Txt3GLogo.ClientID %>',0);" value="选择Logo...">
                     </td>
                 </tr>

                 <tr>
                     <td  height="30" align="right" class="lefttd" style="width: 198px"> <b>手机版底部版权：</b></td>
                     <td class="righttd">
                       &nbsp;<asp:TextBox CssClass="textbox textarea"  Height="100" Width="350" ID="Txt3GCopyRight" runat="server" TextMode="MultiLine" Columns="40" Rows="4" ></asp:TextBox> <a class="textarea_min" href="javascript:zoomtextarea(-5,'<%=this.Txt3GCopyRight.ClientID %>');"></a>
                                                               <a class="textarea_max" href="javascript:zoomtextarea(5,'<%=this.Txt3GCopyRight.ClientID %>');">
                                                                     </a>
                     </td>
                 </tr>
                 <tr>
                     <td  height="30" align="right" class="lefttd" style="width: 198px"> <b>手机版允许会员注册：</b></td>
                     <td class="righttd">
                       &nbsp;<asp:RadioButtonList ID="Rdb3GUserRegEnable" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow">
                       <asp:ListItem Value="1" Selected="True">允许</asp:ListItem>
                       <asp:ListItem Value="0">不允许</asp:ListItem>
                       </asp:RadioButtonList>
                     </td>
                 </tr>
                 </tbody>
            </table>
         </div>

         
		 <div class="tab-page" id="tab1">
		  <h2 class="tab">SEO选项</h2>
			<script type="text/javascript">
				 tabPane1.addTabPage( document.getElementById( "tab1" ) );
			</script>
             <table width="100%"  border="0" cellpadding="1" cellspacing="1" class="CTable"> 
                              <tr>
                                <td  height="30" align="right" class="lefttd" style="width: 198px">
                                    <b>站点标题：</b></td>
                                <td class="righttd"><asp:TextBox Width="450"  Height="50" CssClass="textbox textarea" ID="SiteTitle" runat="server" Columns="50" Rows="3" TextMode="MultiLine"></asp:TextBox><asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="SiteTitle"
                                        ErrorMessage="RequiredFieldValidator" Display="Dynamic">请填写站点标题</asp:RequiredFieldValidator>
                                        <a class="textarea_min" href="javascript:zoomtextarea(-5,'<%=this.SiteTitle.ClientID %>');"></a>
                                        <a class="textarea_max" href="javascript:zoomtextarea(5,'<%=this.SiteTitle.ClientID %>');"></a>
                                    <br /><span class="tips">网页标题通常是搜索引擎关注的重点,</span>
                                </td>
                              </tr>

                             <tr>
                                 <td align="right" class="lefttd" height="30" style="width: 198px"><strong>网站META关键词： </strong>
                                 </td>
                                 <td class="righttd"><asp:TextBox Width="450"  Height="100" CssClass="textbox textarea" ID="MetaKeywords" runat="server" TextMode="MultiLine" Columns="50" Rows="5"></asp:TextBox>
                                     <a class="textarea_min" href="javascript:zoomtextarea(-5,'<%=this.MetaKeywords.ClientID %>');"></a>
                                     <a class="textarea_max" href="javascript:zoomtextarea(5,'<%=this.MetaKeywords.ClientID %>');"></a>
                                     <br />
                                    <span class="tips">
                                     针对搜索引擎设置的网页关键词,多个关键词请用,号分隔
                                    </span>
                                 </td>
                             </tr>
                             <tr>
                                 <td align="right" class="lefttd" height="30" style="width: 198px">
                                     <div>
                                         <strong>网站META网页描述：</strong></div>
                                     </td>
                                 <td class="righttd"><asp:TextBox Width="450" Height="100" CssClass="textbox textarea" ID="MetaDescript" runat="server" TextMode="MultiLine" Columns="50" Rows="5"></asp:TextBox>
                                      <a class="textarea_min" href="javascript:zoomtextarea(-5,'<%=this.MetaDescript.ClientID %>');"></a>
                                      <a class="textarea_max" href="javascript:zoomtextarea(5,'<%=this.MetaDescript.ClientID %>');"></a>
                                     <br />
                                     <span class="tips">针对搜索引擎设置的网页描述,多个描述请用,号分隔&nbsp;</span>
                               </td>
                             </tr>
              </table>

         </div>
         
		 <div class="tab-page" id="tab2">
		  <h2 class="tab">模板绑定</h2>
			<script type="text/javascript">
				 tabPane1.addTabPage( document.getElementById( "tab2" ) );
			</script>
        <table width="100%"  border="0" cellpadding="1" cellspacing="1" class="CTable"> 
                      <tr>
                        <td class="lefttd" height="30" align="right" style="width: 198px"><b>网站首页模板：</b></td>
                        <td class="righttd">
                            &nbsp;<asp:TextBox CssClass="textbox" ID="IndexTemplate" runat="server" Width="350"></asp:TextBox>
                            <input type="button" class="button" onMouseOver="this.className='button_on';" onMouseOut="this.className='button';" value="选择模板..." onClick="SelectTemplate('<%=this.IndexTemplate.ClientID%>');"/>
                        </td>
                      </tr>
                      <tr>
                        <td class="lefttd" height="30" align="right" style="width: 198px"><b>专题首页模板：</b></td>
                        <td class="righttd">
                            &nbsp;<asp:TextBox CssClass="textbox" ID="SpecialIndexTemplate" runat="server" Width="350"></asp:TextBox>
                            <input type="button" class="button" onMouseOver="this.className='button_on';" onMouseOut="this.className='button';" value="选择模板..." onClick="SelectTemplate('<%=this.SpecialIndexTemplate.ClientID%>');"/>
                       <a href="../../special/index.aspx" target="_blank"><font color=green>(special/index.aspx)</font></a> </td>
                      </tr>               
                      
                      
                        <tr>
                          <td align="right" class="lefttd" style="width: 198px; height: 30px">
                              <strong>全站搜索模板：</strong></td>
                          <td class="righttd" style="height: 30px">
                                &nbsp;<asp:TextBox CssClass="textbox" ID="SearchTemplate" runat="server" Width="350"></asp:TextBox>
                                <input type="button" class="button" onMouseOver="this.className='button_on';" onMouseOut="this.className='button';" value="选择模板..." onClick="SelectTemplate('<%=this.SearchTemplate.ClientID%>');"/>
                            <a href="../../plus/search.aspx?key=kesion" target="_blank"><font color=green>(plus/Search.aspx)</font></a></td>
                      </tr>

                         <tr>
                            <td align="right" class="lefttd" height="30" style="width: 198px">
                                <strong>会员相关模板：</strong></td>
                            <td class="righttd">
                              <span style="display:none">
                                &nbsp;<asp:TextBox CssClass="textbox" ID="UserIndexTemplate" runat="server" Width="350"></asp:TextBox>
                                <input type="button" class="button" onMouseOver="this.className='button_on';" onMouseOut="this.className='button';" value="选择模板..." onClick="SelectTemplate('<%=this.UserIndexTemplate.ClientID%>');"/>
                              </span>
                              <span class="tips">如需修改会员中心首页模板，请直接用编辑工具打开“/User/User.master”进行修改。</span>
                            
                                 <div class="tips">注册页面模板：“/<%=MyCache.GetCacheConfig(13) %>/Common/reg.html”。
                                 <a href="../../user/userreg.aspx" target="_blank"><font color=green>(user/UserReg.aspx)</font></a>
                                </div>
                               <!-- <div class="tips">注册成功模板：“/<%=MyCache.GetCacheConfig(13) %>/Common/regsuccess.html”。
                                 <a href="../../user/userregok.aspx" target="_blank"><font color=green>(user/userregok.aspx)</font></a>
                                </div>-->
                            </td>
                        </tr>
                        <tr>
                            <td align="right" class="lefttd" height="30" style="width: 198px">
                                <strong>公告相关模板：</strong>
                               </td>
                            <td class="righttd">
                               <div class="tips">公告列表模板：“/<%=MyCache.GetCacheConfig(13) %>/Common/announcelist.html”。
                                <a href="../../plus/announce.aspx" target="_blank"><font color=green>(/plus/announce.aspx)</font></a>
                                </div>
                                <div class="tips">显示公告模板(普通）：“/<%=MyCache.GetCacheConfig(13) %>/Common/announce.html”。
                                <a href="../../plus/announce.aspx?newest=1" target="_blank"><font color=green>(/plus/announce.aspx?newest=1)</font></a>
                                </div>   
                                <div class="tips">显示公告模板(弹窗）：“/<%=MyCache.GetCacheConfig(13) %>/Common/openannounce.html”。
                                <a href="../../plus/announce.aspx?showtype=1&newest=1" target="_blank"><font color=green>(/plus/announce.aspx?showtype=1&newest=1)</font></a>
                                </div>   
                            
                            </td>
                        </tr>
                        
                        <tr>
                            <td align="right" class="lefttd" height="30" style="width: 198px">
                                <strong>友情链接相关模板：</strong>
                               </td>
                            <td class="righttd">
                               <div class="tips">友情链接首页模板：“/<%=MyCache.GetCacheConfig(13) %>/Common/linkindex.html”。
                                <a href="../../plus/link/index.aspx" target="_blank"><font color=green>(/plus/link/index.aspx)</font></a>
                                </div>
                                <div class="tips">友情链接申请模板：“/<%=MyCache.GetCacheConfig(13) %>/Common/linkapply.html”。
                                <a href="../../plus/link/apply.aspx" target="_blank"><font color=green>(/plus/link/apply.aspx)</font></a>
                                </div>   
                            
                            </td>
                        </tr>
                        
                         <tr>
                            <td align="right" class="lefttd" height="30" style="width: 198px">
                                <strong>关键字Tags模板：</strong>
                                </td>
                            <td class="righttd">
                                <div class="tips">Tags首页模板：“/<%=MyCache.GetCacheConfig(13) %>/Common/tags.html”。
                                <a href="../../plus/tags.aspx" target="_blank"><font color=green>(/Plus/Tags.aspx)</font></a>
                                </div>
                                <div class="tips">Tags列表模板：“/<%=MyCache.GetCacheConfig(13) %>/Common/tagslist.html”。
                                <a href="../../plus/tags.aspx?key=kesion" target="_blank"><font color=green>(/Plus/Tags.aspx)</font></a>
                                </div>
                                <div class="tips">网站地图模板：“/<%=MyCache.GetCacheConfig(13) %>/Common/map.html”。
                                <a href="../../plus/map.aspx" target="_blank"><font color=green>(/plus/map.aspx)</font></a>
                                </div>
                                <div class="tips">Dig排行列表模板：“/<%=MyCache.GetCacheConfig(13) %>/Common/dig.html”。
                                <a href="../../plus/dig.aspx" target="_blank"><font color=green>(/plus/dig.aspx)</font></a>
                                </div>
                            </td>
                        </tr>

                         <tr>
                            <td align="right" class="lefttd" height="30" style="width: 198px">
                                <strong>PK模板：</strong>
                                </td>
                            <td class="righttd">
                                PK首页模板
                                &nbsp;<asp:TextBox CssClass="textbox" ID="PKIndexTemplate" runat="server" Width="350"></asp:TextBox>
                                <input type="button" class="button" onMouseOver="this.className='button_on';" onMouseOut="this.className='button';" value="选择模板..." onClick="SelectTemplate('<%=this.PKIndexTemplate.ClientID%>');"/>
                                <a href="../../Plus/PK/Index.aspx" target="_blank"><font color=green>(/Plus/PK/Index.aspx)</font></a>
                                <br />
                                PK内容页模板
                                &nbsp;<asp:TextBox CssClass="textbox" ID="PKContentTemplate" runat="server" Width="350"></asp:TextBox>
                                <input type="button" class="button" onMouseOver="this.className='button_on';" onMouseOut="this.className='button';" value="选择模板..." onClick="SelectTemplate('<%=this.PKContentTemplate.ClientID%>');"/>
                                <a href="../../Plus/PK/Pk.aspx" target="_blank"><font color=green>(/Plus/PK/PK.aspx)</font></a>
                                <br />
                                PK更多页模板
                                &nbsp;<asp:TextBox CssClass="textbox" ID="PKMoreTemplate" runat="server" Width="350"></asp:TextBox>
                                <input type="button" class="button" onMouseOver="this.className='button_on';" onMouseOut="this.className='button';" value="选择模板..." onClick="SelectTemplate('<%=this.PKMoreTemplate.ClientID%>');"/>
                                <a href="../../Plus/PK/More.aspx" target="_blank"><font color=green>(/Plus/PK/More.aspx)</font></a>
                                <br />
                                
                            </td>
                        </tr>
          </table>			

         </div>
		 <div class="tab-page" id="tab3">
		  <h2 class="tab">会员选项</h2>
			<script type="text/javascript">
				 tabPane1.addTabPage( document.getElementById( "tab3" ) );
			</script>

<table  width="100%" border="0" cellpadding="1" cellspacing="1" class="CTable"> 
               <tr>
                   <td align="right" class="lefttd" height="30" style="width: 198px">
                       <strong>本站是否开启会员系统：</strong></td>
                   <td class="righttd">
                       <asp:RadioButtonList ID="UserSystemTF" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow">
                           <asp:ListItem Value="1" Selected="True">开启</asp:ListItem>
                           <asp:ListItem Value="0">关闭</asp:ListItem>
                       </asp:RadioButtonList></td>
               </tr>
               <tr>
                   <td align="right" class="lefttd" height="30" style="width: 198px">
                       <strong>会员系统绑定二级域名：</strong></td>
                   <td class="righttd">
                       <asp:TextBox ID="TxtUserBindDomain" runat="server" Width="350" CssClass="textbox" />
                       <span class="tips">如：http://user.kesion.com，后面不能加"/"，不绑定请留空。</span>
                       </td>
               </tr>
               
              <tr>
                <td class="lefttd" height="30" align="right" style="width: 198px"><b>是否允许新会员注册：</b></td>
                <td class="righttd">
                    &nbsp;
                    <asp:RadioButtonList ID="UserAllowRegTF" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow">
                        <asp:ListItem Value="1" Selected="True">是</asp:ListItem>
                        <asp:ListItem Value="0">否</asp:ListItem>
                    </asp:RadioButtonList></td>
              </tr>
               <tr>
                   <td align="right" class="lefttd" height="30" style="width: 198px">
                       <div>
                           <strong>新会员注册服务条款和声明：</strong>
                           <div class="tips" >
                               <div align="center">
                                   &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 标签说明：</div>
                               {$GetSiteName}：网站名称<br />
                               {$GetSiteUrl}：网站URL<br />
                               {$GetWebmaster}：站长<br />
                               {$GetWebmasterEmail}：站长信箱</div>
                       </div>
                   </td>
                   <td class="righttd">
                       <asp:TextBox CssClass="textbox textarea" Height="100" Width="450" ID="UserLience" runat="server" Columns="60" Rows="6" TextMode="MultiLine"></asp:TextBox>
                       <a class="textarea_min" href="javascript:zoomtextarea(-5,'<%=this.UserLience.ClientID %>');"></a> 
                       <a class="textarea_max" href="javascript:zoomtextarea(5,'<%=this.UserLience.ClientID %>');"></a>
                   </td>
               </tr>
               <tr>
                  <td align="right" class="lefttd" style="width: 198px; height: 30px">
                      <strong>注册启用选项：</strong></td>
                  <td class="righttd" style="height: 30px">
                  
                      <asp:CheckBoxList ID="CkbEnabledRegField" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow" RepeatColumns="4">
                       <asp:ListItem Value="group">启用用户组注册</asp:ListItem>
                       <asp:ListItem Value="detail">开启详细注册选项</asp:ListItem>
                       <asp:ListItem Value="email">启用邮箱字段</asp:ListItem>
                       <asp:ListItem Value="mobile">启用手机字段</asp:ListItem>
                       <asp:ListItem Value="question">启用取回密码问题选项</asp:ListItem>
                       <asp:ListItem Value="repassword">启用确认密码</asp:ListItem>
                       <asp:ListItem Value="area">启用选择地区</asp:ListItem>
                      </asp:CheckBoxList>
                  
                      
    
                   
                   </td>
              </tr>


              
               <tr>
                   <td align="right" class="lefttd" height="30" style="width: 198px">
                       <strong>每个Email是否允许注册多次：</strong></td>
                   <td class="righttd"><asp:RadioButtonList ID="UserEmailMutiRegTF" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow">
                       <asp:ListItem Value="1" Selected="True">是</asp:ListItem>
                       <asp:ListItem Value="0">否</asp:ListItem>
                   </asp:RadioButtonList></td>
               </tr>
               <tr>
                   <td align="right" class="lefttd" height="30" style="width: 198px">
                       <strong>用户名限制：</strong></td>
                   <td class="righttd">
                       用户名最少<asp:TextBox CssClass="textbox" ID="UserMinChar" runat="server" Width="46px"></asp:TextBox>个字符
                       最多<asp:TextBox CssClass="textbox" ID="UserMaxChar" runat="server" Width="45px"></asp:TextBox>个字符</td>
               </tr>
               <tr>
                   <td align="right" class="lefttd" height="30" style="width: 198px">
                       <strong>禁止注册的用户名列表：</strong></td>
                   <td class="righttd">
                       <asp:TextBox CssClass="textbox textarea" ID="NoAllowRegUserName" style="width:500px;height:80px;" runat="server" Columns="60" Rows="2" TextMode="MultiLine"></asp:TextBox>
                       <a class="textarea_min" href="javascript:zoomtextarea(-3,'<%=this.NoAllowRegUserName.ClientID %>');"></a> 
                       <a class="textarea_max" href="javascript:zoomtextarea(3,'<%=this.NoAllowRegUserName.ClientID %>');"></a>

                 </td>
               </tr>
               <tr>
                   <td align="right" class="lefttd" height="30" style="width: 198px">
                       <strong>是否允许多人同时使用同一会员帐号登录：</strong></td>
                   <td class="righttd">
                       &nbsp;<asp:RadioButtonList ID="UserMutiLoginTF" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow">
                           <asp:ListItem Value="1" Selected="True">是</asp:ListItem>
                           <asp:ListItem Value="0">否</asp:ListItem>
                       </asp:RadioButtonList></td>
               </tr>
               <tr>
                   <td align="right" class="lefttd" style="width: 198px; height: 30px;">
                       <strong>会员登录奖励的设置：</strong></td>
                   <td class="righttd" style="height: 30px">
                       会员每隔<asp:TextBox CssClass="textbox" ID="UserPerMinLogin" runat="server" Width="43px"></asp:TextBox>分钟后 重新登录奖励<asp:TextBox CssClass="textbox"  
                           ID="UserPerMinAddScore" runat="server" Width="36px"></asp:TextBox>分积分</td>
               </tr>
               <tr style="display:none">
                   <td align="right" class="lefttd" height="30" style="width: 198px">
                       <strong>新会员注册成功赠送的资金：</strong></td>
                   <td class="righttd">
                       <asp:TextBox CssClass="textbox" ID="UserRegAddMoney" runat="server" Width="55px"></asp:TextBox>元人民币（为0时不赠送）,此资金可用于商城中心购物.</td>
               </tr>
               <tr>
                   <td align="right" class="lefttd" height="30" style="width: 198px">
                       <strong>新会员注册成功赠送的积分：</strong></td>
                   <td class="righttd">
                       <asp:TextBox CssClass="textbox" ID="UserRegAddScore" runat="server" Width="55px"></asp:TextBox>分积分<span class="tips">（设置为0时不赠送）</span></td>
               </tr>
               <tr>
                   <td align="right" class="lefttd" style="width: 198px; height: 30px;">
                       <strong>新会员注册成功赠送的点券：</strong></td>
                   <td class="righttd" style="height: 30px">
                       <asp:TextBox CssClass="textbox" ID="UserRegAddPoint" runat="server" Width="55px"></asp:TextBox>点点券<span class="tips">（设置为0时不赠送）</span></td>
               </tr>
               <tr>
                   <td align="right" class="lefttd" height="30" style="width: 198px">
                       <strong>会员积分与点券的兑换比率：</strong></td>
                   <td class="righttd">
                       <asp:TextBox CssClass="textbox" ID="ScoreToPointRate" runat="server" Width="55px"></asp:TextBox>分积分可兑换 <font
                           color="red">1</font> 点点券 <span class="tips">（设置为0则不允许积分兑换点券）</span></td>
               </tr>
               <tr style="display:none">
                   <td align="right" class="lefttd" height="30" style="width: 198px">
                       <strong>会员积分与有效期的兑换比率：</strong></td>
                   <td class="righttd">
                       <asp:TextBox CssClass="textbox" ID="ScoreToEdaysRate" runat="server" Width="55px"></asp:TextBox>分积分可兑换 <font
                           color="red">1</font> 天有效期</td>
               </tr>
               <tr style="display:none">
                   <td align="right" class="lefttd" height="30" style="width: 198px">
                       <strong>会员资金与点券的兑换比率：</strong></td>
                   <td class="righttd">
                       <asp:TextBox CssClass="textbox" ID="MoneyToPointRate" runat="server" Width="55px"></asp:TextBox>元人民币可兑换 <font
                           color="red">1</font> 点点券</td>
               </tr>
               <tr style="display:none">
                   <td align="right" class="lefttd" height="30" style="width: 198px">
                       <strong>会员资金与有效期的兑换比率：</strong></td>
                   <td class="righttd">
                       <asp:TextBox CssClass="textbox" ID="MoneyToEdaysRate" runat="server" Width="55px"></asp:TextBox>元人民币可兑换 <font
                           color="red">1</font> 天有效期</td>
               </tr>
               <tr>
                   <td align="right" class="lefttd" height="30" style="width: 198px">
                       <strong>点券的名称：</strong></td>
                   <td class="righttd">
                       <asp:TextBox CssClass="textbox" ID="PointName" runat="server" Width="55px"></asp:TextBox>
                     <span class="tips">例如：科汛币、点券、金币。tips：一个点券相当于一元人民币,点券可以用于查看收费文档及考试等。 </span>  
                    </td>
               </tr>
               <tr>
                   <td align="right" class="lefttd"  style="width: 198px;height:30px">
                       <strong>点券的单位：</strong></td>
                   <td class="righttd">
                       <asp:TextBox CssClass="textbox" ID="PointUnit" runat="server" Width="55px"></asp:TextBox>
                      <span class="tips">例如：点、个。</span>
                       </td>
               </tr>
  </table>
  
         </div>
         
		 <div class="tab-page" id="tab4">
		  <h2 class="tab">缩略图水印</h2>
			<script type="text/javascript">
				 tabPane1.addTabPage( document.getElementById( "tab4" ) );
			</script>
<table width="100%" border="0" cellpadding="1" cellspacing="1" class="CTable"> 
               <tr>
                   <td align="right" class="lefttd" height="30" style="width: 198px">
                       <strong>生成的缩略图宽度：</strong></td>
                   <td class="righttd">
                       <asp:TextBox CssClass="textbox" ID="ThumbsWidth" runat="server" Width="54px"></asp:TextBox>像素 &nbsp;设为0时，将以高度为准按比例缩小。</td>
               </tr>
               <tr>
                   <td align="right" class="lefttd" height="30" style="width: 198px">
                       <strong>生成的缩略图高度：</strong></td>
                   <td class="righttd">
                       <asp:TextBox CssClass="textbox" ID="ThumbsHeight" runat="server" Width="53px"></asp:TextBox>像素 &nbsp;设为0时，将以宽度为准按比例缩小。</td>
               </tr>
               <tr>
                   <td align="right" class="lefttd" height="30" style="width: 198px">
                       <strong>水印类型：</strong></td>
                   <td class="righttd">
                       <asp:RadioButtonList ID="WaterMarkType" runat="server" RepeatDirection="Horizontal">
                           <asp:ListItem Value="0" Selected="True">文字</asp:ListItem>
                           <asp:ListItem Value="1">图片</asp:ListItem>
                       </asp:RadioButtonList></td>
               </tr>
               <tbody id="watermarktxtarea" runat="server">
               <tr>
                   <td align="right" class="lefttd" height="30" style="width: 198px">
                       <strong>添加水印的文字内容：</strong></td>
                   <td class="righttd">
                       <asp:TextBox CssClass="textbox" ID="WaterMarkTxt" runat="server" Columns="5" Width="350"></asp:TextBox></td>
               </tr>
               <tr>
                   <td align="right" class="lefttd" height="30" style="width: 198px">
                       <strong>添加水印的文字字体：</strong></td>
                   <td class="righttd">
                       <asp:DropDownList ID="WaterMarkFontName" runat="server">
                       </asp:DropDownList></td>
               </tr>
               <tr>
                   <td align="right" class="lefttd" style="width: 198px; height: 30px;">
                       <strong>添加水印的文字大小：</strong></td>
                   <td class="righttd" style="height: 30px">
                       <asp:TextBox CssClass="textbox" ID="WaterMarkFontSize" runat="server" Width="30px"></asp:TextBox>像素</td>
               </tr>
               <tr>
                   <td align="right" class="lefttd" height="30" style="width: 198px">
                       <strong>添加水印的文字颜色：</strong></td>
                   <td class="righttd">
                       <asp:TextBox CssClass="textbox" ID="WaterMarkFontColor" runat="server" Width="73px"></asp:TextBox>
                       <img border=0 id="MarkTranspColorShow" src="../../admin/images/<%=string.IsNullOrEmpty(WaterMarkFontColor.Text)?"RectNoColor.gif":"rect.gif" %>" style="cursor:pointer;background-Color:<%=WaterMarkFontColor.Text %>;" onClick="Getcolor('MarkTranspColorShow','MarkTranspColorShow|<%=WaterMarkFontColor.ClientID %>');" title="选取颜色">
                 </td>
               </tr>
               <tr>
                   <td align="right" class="lefttd" height="30" style="width: 198px">
                       <strong>文字是否样式：</strong></td>
                   <td class="righttd">
                       <asp:DropDownList ID="WaterMarkFontStyle" runat="server">
                        <asp:ListItem Value="Bold">加粗</asp:ListItem>
                        <asp:ListItem Value="Italic">倾斜</asp:ListItem>
                        <asp:ListItem Value="Regular" Selected="True">常规</asp:ListItem>
                        <asp:ListItem Value="Strikeout">中间有直线通过</asp:ListItem>
                        <asp:ListItem Value="Underline">带下划线</asp:ListItem>
                       </asp:DropDownList></td>
               </tr>
                   <tr>
                       <td align="right" class="lefttd" height="30" style="width: 198px">
                           <strong>文字的阴影颜色：</strong></td>
                       <td class="righttd">
                        <asp:TextBox CssClass="textbox" ID="WaterMarkFontBgColor" runat="server" Width="73px"></asp:TextBox>
                       <img border=0 id="Img1" src="../../admin/images/<%=string.IsNullOrEmpty(WaterMarkFontBgColor.Text)?"RectNoColor.gif":"rect.gif" %>" style="cursor:pointer;background-Color:<%=WaterMarkFontBgColor.Text %>;" onClick="Getcolor('Img1','Img1|<%=WaterMarkFontBgColor.ClientID %>');" title="选取颜色">

                       </td>
                   </tr>

               </tbody>
               <tbody id="watermarkpicarea" style="display:none" runat="server">
                    <tr>
                   <td align="right" class="lefttd" height="30" style="width: 198px">
                   <strong>水印图片文件名：</strong><br />这里填写图片地址的相对路径
                   </td>
                   <td class="righttd">
                       <asp:TextBox CssClass="textbox" ID="WaterMarkPic" Width="350" runat="server"></asp:TextBox>
                   &nbsp;<input type="button" class="button" onclick="SelectFiles('<%=this.WaterMarkPic.ClientID %>',0);" value="选择图片"></td>
               </tr>                    
               <tr>
                   <td align="right" class="lefttd" height="30" style="width: 198px">
                   <strong>图片水印透明度：</strong><br />取值范围1--10 (10为不透明)
                   </td>
                   <td class="righttd">
                       <asp:TextBox CssClass="textbox" ID="WaterMarkTransParency" runat="server" Width="52px"></asp:TextBox>
                   </td>
               </tr>
               </tbody>
               <tr>
                   <td align="right" class="lefttd" height="30" style="width: 198px">
                       <strong>水印坐标位置：</strong></td>
                   <td class="righttd">
                       <style>
                           .waterback {
                               background:#f1f1f1;
                               border:1px solid #ccc;
                           }
                       </style>
                       <asp:literal id="position" runat="server"></asp:literal>
                   </td>
               </tr>
  </table>


         </div>

		 <div class="tab-page" id="tab5">
		  <h2 class="tab">邮件选项</h2>
			<script type="text/javascript">
				 tabPane1.addTabPage( document.getElementById( "tab5" ) );
			</script>
			
			<table width="100%"  border="0" cellpadding="1" cellspacing="1" class="CTable"> 
               <tr>
                   <td align="right" class="lefttd" height="30" style="width: 198px">
                       <strong>SMTP服务器：</strong>
                 </td>
                   <td class="righttd">
                       <asp:TextBox CssClass="textbox" ID="SmtpServer" Width="350" runat="server"></asp:TextBox>
                       <span class="tips">必须正确填写，如:smtp.163.com。</span>

                   </td>
               </tr>
               <tr>
                   <td align="right" class="lefttd" height="30" style="width: 198px">
                       <strong>SMTP端口号：</strong></td>
                   <td class="righttd">
                       <asp:TextBox CssClass="textbox" ID="SmtpPort" runat="server" Width="50px"></asp:TextBox>
                       <span class="tips">端口号，默认为25。</span>
                   </td>
               </tr>
               <tr>
                   <td align="right" class="lefttd" height="30" style="width: 198px">
                       <strong>发件人邮箱：</strong>
                 </td>
                   <td class="righttd">
                       <asp:TextBox CssClass="textbox" ID="MailFrom" Width="350" runat="server"></asp:TextBox>
                       <span class="tips">此邮件将显示为对方的发件人邮件。</span>
                   </td>
               </tr>
               <tr>
                   <td align="right" class="lefttd" height="30" style="width: 198px">
                       <strong>发件用户名：</strong></td>
                   <td class="righttd">
                       <asp:TextBox CssClass="textbox" ID="MailUserName" Width="350" runat="server"></asp:TextBox></td>
               </tr>
               <tr>
                   <td align="right" class="lefttd" height="30" style="width: 198px">
                       <strong>登录密码：</strong></td>
                   <td class="righttd">
                       <asp:TextBox CssClass="textbox" ID="MailPassword" Width="350" TextMode="Password" runat="server"></asp:TextBox>
                       <span class="tips">如不修改请留空。</span></td>
               </tr>
  </table>

         </div>


		 <div class="tab-page" id="tab6">
		  <h2 class="tab">其它选项</h2>
			<script type="text/javascript">
				 tabPane1.addTabPage( document.getElementById( "tab6" ) );
			</script>


            <table width="100%" border="0" cellpadding="1" cellspacing="1" class="CTable"> 
               <tr>
                   <td align="right" class="lefttd" height="30" style="width: 198px">
                       <strong>模板目录：</strong>
                 </td>
                   <td class="righttd">
                       <asp:TextBox CssClass="textbox" ID="TemplateDir" runat="server" Width="350"></asp:TextBox>
                       <span class="tips">后面不要带"/"。</span>
                   </td>
               </tr>
               <tr>
                   <td align="right" class="lefttd" height="30" style="width: 198px">
                       <strong>上传总目录：</strong>
                 </td>
                   <td class="righttd"> <asp:TextBox CssClass="textbox" ID="UpFileDir" runat="server" Width="350"></asp:TextBox>
                        <span class="tips">后面不要带"/",不建议经常更改。</span>
                   </td>
               </tr>
              <tr>
                  <td align="right" class="lefttd" height="30" style="width: 198px">
                      <strong>自定义表单生成目录：</strong></td>
                  <td class="righttd">
                      <asp:TextBox CssClass="textbox" ID="FormFsoDir" runat="server" Width="350"></asp:TextBox>
                       <span class="tips">支持多级，但后面不能带"/" 如 form,form/<%=DateTime.Now.Year.ToString() %> 等</span></td>
              </tr>
              <tr>
                  <td align="right" class="lefttd" height="30" style="width: 198px">
                      <strong>广告JS生成目录：</strong></td>
                  <td class="righttd">
                      <asp:TextBox CssClass="textbox" ID="ADFsoDir" runat="server" Width="350"></asp:TextBox>
                       <span class="tips">支持多级，但后面不能带"/" 如 AD,AD/<%=DateTime.Now.Year.ToString() %> 等</span></td>
              </tr>
              <tr>
                  <td align="right" class="lefttd" height="30" style="width: 198px">
                      <strong>生成JS目录：</strong></td>
                  <td class="righttd">
                  <asp:TextBox CssClass="textbox" ID="JSFsoDir" runat="server" Width="350"></asp:TextBox>
                       <span class="tips">支持多级，但后面不能带"/" 如 JS,JS/<%=DateTime.Now.Year.ToString() %> 等</span>
                  </td>
              </tr>
                 <tr>
                  <td align="right" class="lefttd" height="30" style="width: 198px">
                      <strong>生成专题目录：</strong></td>
                  <td class="righttd">
                  <asp:TextBox CssClass="textbox" ID="SpecialFsoDir" runat="server" Width="350"></asp:TextBox>
                       <span class="tips">支持多级，但后面不能带"/" 如 Special,Html/Special 等</span>
                  </td>
              </tr>
            <tr>
             <td class="lefttd" height="30" align="right" style="width: 198px"><b>货币设置：</b></td>
                <td class="righttd">
                   保留小数位数 <asp:TextBox style="text-align:center" CssClass="textbox" ID="TxtShopPriceBit" runat="server" Width="50px"></asp:TextBox> 位
                   
                    <span class="tips">建议设置为“2”，即保留两位小数位。前台标签调用时，则以标签里设置的位数为准。</span>
                    <br />
                   货币符号 <asp:TextBox style="text-align:center" CssClass="textbox" ID="TxtCurrencySymbol" runat="server" Width="50px"></asp:TextBox> 如：¥,$等。
                    货币单位名称 <asp:TextBox style="text-align:center" CssClass="textbox" ID="TxtCurrencyUnit" runat="server" Width="50px"></asp:TextBox> 如：元，美元，日元等。
                </td>
         </tr>
             
              <tr>
                  <td align="right" class="lefttd" height="30" style="width: 198px">
                      <strong>地区选项设置：</strong></td>
                  <td class="righttd">
                      <asp:RadioButtonList ID="ShowAreaLeval" runat="server" RepeatDirection="Horizontal"
                          RepeatLayout="Flow">
                          <asp:ListItem Value="1">一级</asp:ListItem>
                          <asp:ListItem Selected="True" Value="2">二级</asp:ListItem>
                          <asp:ListItem Value="3">三级</asp:ListItem>
                      </asp:RadioButtonList></td>
              </tr>
           <tr>
            <td align="right" class="lefttd" height="30" style="width: 198px">
                <strong>启用分地区：</strong></td>
            <td class="righttd">
                 <asp:RadioButtonList ID="RdbChangeCityTF" runat="server" RepeatDirection="Horizontal">
                    <asp:ListItem Value="1">启用</asp:ListItem>
                    <asp:ListItem Value="0">不启用</asp:ListItem>
                </asp:RadioButtonList>
                <div class="tips">启用分地区后，网站前台可以按地区筛选。</div>
                </td>
           </tr>
              <tr>
                  <td align="right" class="lefttd" height="30" style="width: 198px">
                      <strong>网站是否启用二级域名：</strong></td>
                  <td class="righttd">
                      <asp:RadioButtonList ID="RdbAllowSubDomain" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow">
                       <asp:ListItem Value="true">启用</asp:ListItem>
                       <asp:ListItem Value="false" Selected="True">不启用</asp:ListItem>
                      </asp:RadioButtonList>
                      <div class="tips">当您的网站会员中心、考试系统、商城系统、问吧系统或是频道绑定二级域名时必须设置启用二级域名。</div>
                      <div id="rootDomain"><strong>根域名：</strong><asp:TextBox ID="TxtRootDomain" runat="server" CssClass="textbox" /> <span class="tips">如：kesion.com，不能带“www”。</span></div>
                      </td>
              </tr>
              <tr>
                  <td align="right" class="lefttd" height="30" style="width: 198px">
                      <strong>生成静态设置：</strong></td>
                  <td class="righttd">
                    每生成<asp:TextBox CssClass="textbox" ID="TxtRefreshPauseNum" Width="50px" style="text-align:center" runat="server"></asp:TextBox>篇文档 暂停<asp:TextBox ID="TxtRefreshPauseTime" runat="server" CssClass="textbox" style="text-align:center" Width="50px" />秒后重新生成
                    <div class="tips">为减轻生成操作导致的服务器承受压力，建议设置暂停时间不低于2秒，不想限制请设置为“0”。</div>
                  </td>
              </tr>


               <tr>
                  <td align="right" class="lefttd" height="30" style="width: 198px">
                      <strong>标签生成中文占用两个字符：</strong></td>
                  <td class="righttd">
                     <asp:RadioButtonList ID="RdbLabelChineseLenTF" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow">
                       <asp:ListItem Value="1" Selected="True">是</asp:ListItem>
                       <asp:ListItem Value="0">否</asp:ListItem>
                      </asp:RadioButtonList>
                      <div class="tips">指前台模板里标签调用数据时，一个中文是否启用占两个字符。</div>
                      </div>
                  </td>
              </tr>

              <tr>
                  <td align="right" class="lefttd" height="30" style="width: 198px">
                      <strong>是否每天整点初始化当天数据：</strong></td>
                  <td class="righttd">
                     <asp:RadioButtonList ID="RdbInitialDataPerDay" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow">
                       <asp:ListItem Value="1">启用</asp:ListItem>
                       <asp:ListItem Value="0" Selected="True">不启用</asp:ListItem>
                      </asp:RadioButtonList>
                      <div class="tips">如将文档的当天的点击数,软件当天的下载数清零。开启后对性能有稍影响,对统计数要求不高的，不建议开启。</div>
                      </div>
                  </td>
              </tr>
              <tr>
                  <td align="right" class="lefttd" height="30" style="width: 198px">
                      <strong>智能JS自动生成间隔：</strong></td>
                  <td class="righttd">
                     每
                     <asp:TextBox ID="TxtAutoCreateJSTime" runat="server" CssClass="textbox" style="text-align:center" width="50"></asp:TextBox>
                     分钟后自动生成智能JS
                      <div class="tips">不想自动生成JS或是没有使用JS标签，请设置为“0”。</div>
                      </div>
                  </td>
              </tr>
  </table>
         
         
       </div>


		 <div class="tab-page" id="tab7">
		  <h2 class="tab">远程附件</h2>
			<script type="text/javascript">
			    tabPane1.addTabPage(document.getElementById("tab7"));
			</script>


            <table width="100%" border="0" cellpadding="1" cellspacing="1" class="CTable"> 
               <tr>
                   <td align="right" class="lefttd" height="30" style="width: 198px">
                       <strong>是否启用远程附件：</strong>
                 </td>
                   <td class="righttd">
                       <asp:RadioButtonList ID="RdbRemoteAnnexTF" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow">
                        <asp:ListItem Value="0" Selected>不启用</asp:ListItem>
                        <asp:ListItem Value="1">启用</asp:ListItem>
                       </asp:RadioButtonList>

                   </td>
               </tr>
               <tbody id="ftp" runat="server">
               <tr>
                   <td align="right" class="lefttd" height="30" style="width: 198px">
                       <strong>FTP服务器地址：</strong>
                 </td>
                   <td class="righttd">
                      <asp:TextBox ID="TxtFtpServerIP" runat="server" CssClass="textbox" Width="350" />
                      <span class="tips">填写 FTP 服务器的 IP 地址或域名</span>

                   </td>
               </tr>
                <tr>
                   <td align="right" class="lefttd" height="30" style="width: 198px">
                       <strong>FTP服务器端口号：</strong>
                 </td>
                   <td class="righttd">
                      <asp:TextBox ID="TxtFtpServerPort" runat="server" Width="50" style="text-align:center" CssClass="textbox" />
                      <span class="tips">默认21</span>

                   </td>
               </tr>

               <tr>
                   <td align="right" class="lefttd" height="30" style="width: 198px">
                       <strong>FTP服务器用户名：</strong>
                 </td>
                   <td class="righttd">
                      <asp:TextBox ID="TxtFtpUserName" runat="server" CssClass="textbox"  Width="350"/>
                      <span class="tips">该帐号必需具有以下权限：读取文件、写入文件、删除文件、创建目录、子目录继承</span>

                   </td>
               </tr>
               <tr>
                   <td align="right" class="lefttd" height="30" style="width: 198px">
                       <strong>FTP服务器密码：</strong>
                 </td>
                   <td class="righttd">
                      <asp:TextBox ID="TxtFtpUserPassWord" TextMode="Password" runat="server" CssClass="textbox"  Width="350"/>
                      <span class="tips">登录FTP的密码</span>

                   </td>
               </tr>
               <tr>
                   <td align="right" class="lefttd" height="30" style="width: 198px">
                       <strong>远程附件目录：</strong>
                 </td>
                   <td class="righttd">
                      <asp:TextBox ID="TxtFtpRemoteAnnexDir" runat="server" CssClass="textbox"  Width="350"/>
                      <span class="tips">远程附件目录的绝对路径或相对于 FTP 主目录的相对路径，结尾必须加斜杠“/”,如果直接上传到主目录直接填：“/”。</span>

                   </td>
               </tr>
               <tr>
                   <td align="right" class="lefttd" height="30" style="width: 198px">
                       <strong>远程附件访问 URL：</strong>
                 </td>
                   <td class="righttd">
                      <asp:TextBox ID="TxtFtpRemoteAnnexUrl" runat="server" CssClass="textbox"  Width="350"/>
                      <span class="tips">如：http://img.kesion.com,结尾不要加斜杠“/”</span>

                   </td>
               </tr>
               <tr>
                   <td align="right" class="lefttd" height="30" style="width: 198px">
                       <strong>附件尺寸限制：</strong>
                 </td>
                   <td class="righttd">
                      <asp:TextBox ID="TxtFtpRemoteAnnexSize" runat="server" CssClass="textbox" width="40" style="text-align:center"/>KB
                      <span class="tips">为防止大文件上传延迟，只有尺寸小于当前设置的附件才使用远程附件功能，0 或留空为不限制。</span>

                   </td>
               </tr>
               <tr>
                   <td align="right" class="lefttd" height="30" style="width: 198px">
                       <strong>是否删除本地附件：</strong>
                 </td>
                   <td class="righttd">
                       <asp:RadioButtonList ID="RdbFtpDeleteLocalFile" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow">
                        <asp:ListItem Value="0" Selected>不删除</asp:ListItem>
                        <asp:ListItem Value="1">删除</asp:ListItem>
                       </asp:RadioButtonList>
                      <span class="tips">指文件上传成功后是否删除本网站下的附件，启用删除可以减少服务器空间占用。</span>
                   </td>
               </tr>
                <tr>
                   <td align="right" class="lefttd" height="30" style="width: 198px">
                       <strong>测试FTP连接是否正常：</strong>
                 </td>
                   <td class="righttd">
                      <input onclick="testFtp()" type="button" class="button" value="测试FTP连接" />
                      <script>
                          function testFtp() {
                              var ftpIP = jQuery("#<%=TxtFtpServerIP.ClientID %>").val();
                              var ftpPort = jQuery("#<%=TxtFtpServerPort.ClientID %>").val();
                              var ftpUser = jQuery("#<%=TxtFtpUserName.ClientID %>").val();
                              var ftpPass = jQuery("#<%=TxtFtpUserPassWord.ClientID %>").val();
                              var ftpDir = jQuery("#<%=TxtFtpRemoteAnnexDir.ClientID %>").val();
                              if (ftpIP == '') {
                                  KesionJS.Alert("请输入FTP服务器IP地址!", 'jQuery("#<%=TxtFtpServerIP.ClientID %>").focus()');
                                  return;
                              }
                              if (ftpPort == '') {
                                  KesionJS.Alert("请输入FTP服务器端口!", 'jQuery("#<%=TxtFtpServerPort.ClientID %>").focus()');
                                  return;
                              }
                              if (ftpUser == '') {
                                  KesionJS.Alert("请输入FTP登录用户名!", 'jQuery("#<%=TxtFtpUserName.ClientID %>").focus()');
                                  return;
                              }
                              if (ftpPass == '') {
                                  KesionJS.Alert("请输入FTP登录密码!", 'jQuery("#<%=TxtFtpUserPassWord.ClientID %>").focus()');
                                  return;
                              }
                              if (ftpDir == '') {
                                  KesionJS.Alert("请输入远程附件目录!", 'jQuery("#<%=TxtFtpRemoteAnnexDir.ClientID %>").focus()');
                                  return;
                              }
                              jQuery('#ajaxmsg', window.parent.document).toggle();
                              jQuery.get("../../plus/ajaxs.ashx", { a: "testftp", ftpIP: ftpIP, ftpPort: ftpPort, ftpUser: ftpUser, ftpPass: ftpPass, ftpDir: ftpDir }, function(val) {
                                  jQuery('#ajaxmsg', window.parent.document).toggle();
                                  if (val == "success") {
                                      KesionJS.Alert("恭喜，FTP测试连接正常！", '');
                                  } else {
                                  KesionJS.Alert(val, '');
                                  }
                              });
                          }
                      </script>
                   </td>
               </tr>
             </tbody>  
           </table>
       </div>


</div>



         


       <KS:Tips ID="Tips1" runat="server" />
         
        <br style="clear:both" />
        <br />
       <KS:Foot ID="CopyRight1" CancelButtonVisible="false" OnSubmit="SaveButton_Click"  runat="server" />
</asp:Content>
