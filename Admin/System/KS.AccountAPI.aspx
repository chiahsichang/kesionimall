<%@ Page Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.Admin_AccountAPI" Title="Untitled Page" Codebehind="KS.AccountAPI.aspx.cs" %>
<%@ Import Namespace="System.Xml" %>
<%@ Import Namespace="Kesion.BLL" %>
<%@ Import Namespace="Kesion.Publics" %>
<%@ Import Namespace="Kesion.Cache" %>
<%@ Import Namespace="Newtonsoft.Json" %>
<%@ Import Namespace="Newtonsoft.Json.Linq" %>
<asp:Content ID="Content1" ContentPlaceHolderID="KSContent" Runat="Server">
    <asp:Panel ID="listPanel" runat="server" Width="100%">
       <KS:TopNav ID="TopNav2" runat="server" Text="账号通API&社交营销配置" />


       <div class="tab-page" id="AccountPanel">
         <script type="text/javascript">
             var tabPane1 = new WebFXTabPane(document.getElementById("AccountPanel"), 1)
         </script>
             
		 <div class="tab-page" id="tab0">
		  <h2 class="tab">账号通API</h2>
			<script type="text/javascript">
			    tabPane1.addTabPage(document.getElementById("tab0"));
			</script>
       <table width="99%" border="0" cellpadding="1" cellspacing="1" class="CTable" style="border-bottom:none;"> 
            <tr>
               <td class="lefttd" align="right" style="width:98px"><b>首次登录自动创建账号并登录：</b></td>
               <td class="righttd">
                   <asp:RadioButtonList ID="RdbApiAutoCreateUser" RepeatDirection="Horizontal" runat="server">
                    <asp:ListItem Value="1" Selected>启用</asp:ListItem>
                    <asp:ListItem Value="0">不启用</asp:ListItem>
                   </asp:RadioButtonList>
                  <span class="tips">如果启用首次登录自动创建账号，将省去让用户绑定的环节，但会导致无法和会员原有的账号绑定通用，请慎用。</span>                                      
                  </td>
             </tr>
            <tr>
               <td class="lefttd" align="right" style="width:98px"><b>默认注册的会员用户组：</b></td>
               <td class="righttd">
                   <span id="groupidarea" runat="server"></span>                                
                  </td>
             </tr>
        </table>
       
        <KS:KSGV ID="list" cssclass="CTable" runat="server" Width="99%" AutoGenerateColumns="False" EmptyDataText="暂无账号通API!" GridLines="None" OnRowDataBound="list_RowDataBound" PagerType="CustomNumeric">
            <Columns>
             <asp:BoundField HeaderText="ID" DataField="ID">
                    <ItemStyle HorizontalAlign="Center" Width="40px" />
                </asp:BoundField>
            <asp:TemplateField HeaderText="启用">
                <ItemStyle HorizontalAlign="Center" />
                <ItemTemplate>
              <asp:HiddenField ID="Hidenable" Value='<%# Eval("enable") %>' runat="server" />
              <asp:HiddenField ID="HidapplyUrl" Value='<%# Eval("applyurl") %>' runat="server" />

                 <asp:CheckBox ID="CkbEnable" runat="server" />
                 </ItemTemplate>
            </asp:TemplateField>  
                
                
            <asp:TemplateField HeaderText="接口名称">
                <ItemStyle HorizontalAlign="Center" />
                <ItemTemplate>
                  <asp:TextBox CssClass="textbox"  Width="80px" ID="TxtName" Text='<%#Eval("name") %>' runat="server"></asp:TextBox>
                 </ItemTemplate>
            </asp:TemplateField>  
            <asp:TemplateField HeaderText="ApiID">
                <ItemStyle HorizontalAlign="Center" />
                <ItemTemplate>
                  <asp:TextBox CssClass="textbox" Width="180px" ID="TxtApiID" Text='<%#Eval("ApiID") %>' runat="server"></asp:TextBox>
                 </ItemTemplate>
            </asp:TemplateField>  
            <asp:TemplateField HeaderText="ApiKey">
                <ItemStyle HorizontalAlign="Center" />
                <ItemTemplate>
                  <asp:TextBox CssClass="textbox" Width="200px" ID="TxtApiKey" TextMode="PassWord" value='<%#Eval("ApiKey") %>' runat="server"></asp:TextBox>
                 </ItemTemplate>
            </asp:TemplateField>  
            <asp:TemplateField HeaderText="登录成功返回的URL">
                <ItemStyle HorizontalAlign="Center" />
                <ItemTemplate>
                  <asp:TextBox CssClass="textbox" Width="180px" ID="TxtApiReturnUrl" Text='<%#Eval("apireturnurl") %>' runat="server"></asp:TextBox>
                 </ItemTemplate>
            </asp:TemplateField>  

            <asp:TemplateField HeaderText="申请">
                       <itemstyle horizontalalign="Center" width="25"/>
                        <itemtemplate>
                           <a class="apply" href="<%# Eval("ApplyUrl") %>" title="申请" target="_blank"></a>
                        </itemtemplate>
             </asp:TemplateField>
            
            </Columns>
           
            <PagerStyle CssClass="Page" HorizontalAlign="Right" />
            <HeaderStyle CssClass="CTitle" />
            <EmptyDataRowStyle CssClass="emptycss" />
      </KS:KSGV>
      
     <br />
     <asp:Panel ID="Panel1" runat="server" Height="30px" Width="739px">
            &nbsp;&nbsp;<asp:Button ID="Button1" CssClass="button" runat="server" Text="批量保存配置规则" 
                onclick="Button1_Click" />&nbsp;
      </asp:Panel>
     
     
        <br />
        <script type="text/javascript">
            showtips('<span class="state"><strong>说明：</strong><br /></span>上面接口的ApiID及ApiKey需要到第三方网站申请后填入方可使用。');
		</script>

    
    </div>

    <div class="tab-page" id="tab1">
		  <h2 class="tab">社交营销设置</h2>
			<script type="text/javascript">
			    tabPane1.addTabPage(document.getElementById("tab1"));
			</script>

             <table width="99%" border="0" cellpadding="1" cellspacing="1" class="CTable" style="border-bottom:none;"> 
            <tr>
               <td class="lefttd" align="right" style="width:98px"><b>发表文档显示社交营销选项：</b></td>
               <td class="righttd">
                   <asp:RadioButtonList ID="RdbIsShowMarketing" AutoPostBack="true" RepeatDirection="Horizontal" 
                       runat="server" onselectedindexchanged="RdbIsMarketing_SelectedIndexChanged">
                    <asp:ListItem Value="1" Selected>显示</asp:ListItem>
                    <asp:ListItem Value="0">不显示</asp:ListItem>
                   </asp:RadioButtonList>
                  </td>
             </tr>
    
        </table>

       <table id="showMarketing" runat="server" width="99%" border="0" cellpadding="1" cellspacing="1" class="CTable"> 
            <tr>
               <td class="lefttd" align="right" style="width:98px"><b>新浪微博营销：</b></td>
               <td class="righttd">
                 <%
                     XmlDocument xmlDoc = new XmlDocument();
                     xmlDoc.Load(Server.MapPath("~/config/AccountAPI.config"));
                    
                     bool isToken = false;
                     XmlNode xn = xmlDoc.DocumentElement.SelectSingleNode("item[@id='sina']");
                     if (xn!= null)
                     {
                         if (xn.SelectSingleNode("@enable").InnerText != "true")
                         {
                             Response.Write("新浪微博账号通API没有开启！");
                         }
                         else
                         {
                             string token = string.Empty;
                             string uid = string.Empty;
                             if (xn.SelectSingleNode("@token") != null)
                             {
                                 token = xn.SelectSingleNode("@token").InnerText;
                             }
                             else
                             {
                                 XmlAttribute xe = xmlDoc.CreateAttribute("token");
                                 xe.InnerText = "";
                                 xn.Attributes.Append(xe);
                                 xmlDoc.Save(Server.MapPath("~/config/AccountAPI.config"));
                             }
                             if (xn.SelectSingleNode("@uid") != null)
                             {
                                 uid = xn.SelectSingleNode("@uid").InnerText;
                             }
                             else
                             {
                                 XmlAttribute xe = xmlDoc.CreateAttribute("uid");
                                 xe.InnerText = "";
                                 xn.Attributes.Append(xe);
                                 xmlDoc.Save(Server.MapPath("~/config/AccountAPI.config"));
                             }
                             if (!string.IsNullOrEmpty(token) && !string.IsNullOrEmpty(uid))
                             {
                                 string graph_url = "https://api.weibo.com/2/users/show.json";
                                 graph_url += "?access_token=" + token + "&uid=" + uid;
                                 Uri url = new Uri(graph_url);
                                 string result = Kesion.Collection.CollectionCommon.GetHttpPage(url, "utf-8");
                                 if (result.IndexOf("error") == -1)
                                 {
                                     isToken = true;
                                 }

                             }

                             if (isToken == false)
                             {
                                 Response.Write(@"状态：<font color=red>未授权或是授权失效，请点击<input type='button' onclick=""top.openWin('登录新浪微博获取授权信息','" + BaseFun.GetRewriteUrl("sinalogin") + @"?tokenfrom=admin',true)"" class='button' value='登录授权'/>重新获取权限！</font>");
                             }
                             else
                             {
                                 Response.Write(@"状态：<font color=green>已获得授权！</font><input type='button' onclick=""top.openWin('登录新浪微博获取授权信息','" + BaseFun.GetRewriteUrl("sinalogin") + @"?tokenfrom=admin',true)"" class='button' value='切换授权账号'/>");

                             }
                         }
                        
                     }

                     
                 %>
                 <br />
                  <span class="tips">授权成功后发表的文档(如文章，商品，试卷等)将自动转发到新浪微博平台上。</span>                                      
                  </td>
             </tr>

              <tr>
               <td class="lefttd" align="right" style="width:98px"><b>腾讯微博营销：</b></td>
               <td class="righttd">
                 <%
                     XmlDocument xmlDoc = new XmlDocument();
                     xmlDoc.Load(Server.MapPath("~/config/AccountAPI.config"));
                    
                     bool isToken = false;
                     XmlNode xn = xmlDoc.DocumentElement.SelectSingleNode("item[@id='qq']");
                     if (xn!= null)
                     {
                         if (xn.SelectSingleNode("@enable").InnerText != "true")
                         {
                             Response.Write("QQ登录API没有开启！");
                         }
                         else
                         {
                             string token = string.Empty;
                             string uid = string.Empty;
                             if (xn.SelectSingleNode("@token") != null)
                             {
                                 token = xn.SelectSingleNode("@token").InnerText;
                             }
                             else
                             {
                                 XmlAttribute xe = xmlDoc.CreateAttribute("token");
                                 xe.InnerText = "";
                                 xn.Attributes.Append(xe);
                                 xmlDoc.Save(Server.MapPath("~/config/AccountAPI.config"));
                             }
                             if (xn.SelectSingleNode("@uid") != null)
                             {
                                 uid = xn.SelectSingleNode("@uid").InnerText;
                             }
                             else
                             {
                                 XmlAttribute xe = xmlDoc.CreateAttribute("uid");
                                 xe.InnerText = "";
                                 xn.Attributes.Append(xe);
                                 xmlDoc.Save(Server.MapPath("~/config/AccountAPI.config"));
                             }
                             
                             if (!string.IsNullOrEmpty(token) && !string.IsNullOrEmpty(uid))
                             {
                                 string graph_url = "https://graph.qq.com/user/get_user_info";
                                 graph_url += "?access_token=" + token + "&oauth_consumer_key="+xn.SelectSingleNode("@apiid").InnerText+"&openid=" + uid;
                                 Uri url = new Uri(graph_url);
                                 string result = Kesion.Collection.CollectionCommon.GetHttpPage(url, "utf-8");
                                 JObject jsonObj = JObject.Parse(result);
                                 if (jsonObj["ret"].ToString()=="0")
                                 {
                                     isToken = true;
                                 }

                             }

                             if (isToken == false)
                             {
                                 Response.Write(@"状态：<font color=red>未授权或是授权失效，请点击<input type='button' onclick=""top.openWin('登录腾讯获取授权信息','" + BaseFun.GetRewriteUrl("qqlogin") + @"?tokenfrom=admin',true)"" class='button' value='登录授权'/>重新获取权限！</font>");
                             }
                             else
                             {
                                 Response.Write(@"状态：<font color=green>已获得授权！</font><input type='button' onclick=""top.openWin('登录腾讯获取授权信息','" + BaseFun.GetRewriteUrl("qqlogin") + @""" class='button' value='切换授权账号'/>");

                             }
                         }
                        
                     }

                     
                 %>
                 <br />
                  <span class="tips">授权成功后发表的文档(如文章，商品，试卷等)将自动转发到腾讯微博、QQ空间日志及QQ说说分享等平台上。</span>                                      
                  </td>
             </tr>

      </table>


</div>
   
     </asp:Panel>

</asp:Content>

