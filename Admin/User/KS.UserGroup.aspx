<%@ Page Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.Admin_UserGroup" Title="Untitled Page" Codebehind="KS.UserGroup.aspx.cs" %>
<%@ Import Namespace="Kesion.Publics" %>
<%@ Import Namespace="Kesion.Cache" %>
<%@ Import Namespace="System.Xml" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="Kesion.BLL" %>

<asp:Content ID="Content1" ContentPlaceHolderID="KSContent" Runat="Server">

<script>
    function showUser(id, groupname) {
        location.href = 'KS.User.Aspx?type=1&groupname='+groupname+'&gid=' + id;
       // parent.openWin('查看用户组[' + groupname + ']下的用户', 'user/KS.User.Aspx?type=1&groupid=' + id, false, 900, 520);
    }
</script>
    <asp:Panel ID="ListPanel" runat="server" Width="100%">
        <div id="manage_top" class="menu_top_fixed">
       <ul>
           <li id='p1'><asp:LinkButton ID="addclassbutton" runat="server" OnClick="addclassbutton_Click"><b></b>添加用户组</asp:LinkButton></li>
           <li id='p4'><asp:LinkButton ID="editclassbutton" runat="server" OnClick="editclassbutton_Click"><b></b>编辑用户组</asp:LinkButton></li>
           <li id='p3'><asp:LinkButton ID="delclassbutton" runat="server" OnClick="delclassbutton_Click"><b></b>删除用户组</asp:LinkButton></li></ul>
    </div>  
    <div class="menu_top_fixed_height"></div>   
        <KS:KSGV ID="List" cssclass="CTable" runat="server" GridLines="None" AutoGenerateColumns="False" EmptyDataText="没有添加任何用户组" PagerType="CustomNumeric" Width="99%" OnRowDataBound="List_RowDataBound" OnRowCreated="List_RowCreated" OnRowCommand="List_RowCommand">
            <HeaderStyle CssClass="CTitle" />
            <Columns>
                 <asp:TemplateField HeaderText="选择">
                <itemtemplate>
                <input type="checkbox"  name="ids" id="ids" value="<%#Eval("groupid") %>" />
                </itemtemplate>
                <itemstyle horizontalalign="Center" Height="30px" width="50px" />
            </asp:TemplateField>
                <asp:BoundField DataField="groupid" HeaderText="ID">
                    <itemstyle horizontalalign="Center" width="25px" />
                </asp:BoundField>
                <asp:BoundField DataField="groupname" HtmlEncode="false" HeaderText="用户组名称">
                    <itemstyle horizontalalign="Center" width="120px" />
                </asp:BoundField>

                 <asp:TemplateField HeaderText="简要说明">
                    <itemtemplate>
                    <span class="tips"><%# Eval("descript") %></span>
                    </itemtemplate>
                </asp:TemplateField>

                <asp:BoundField DataField="type" HeaderText="类型" >
                    <itemstyle horizontalalign="Center" width="60px" />
                </asp:BoundField>


                 <asp:TemplateField HeaderText="启用注册">
                    <itemtemplate>
                   <a href="?action=isreg&groupid=<%#Eval("groupID")%>" <%# Convert.ToString(Eval("isreg"))=="0"?"class='no' title='不启用'":"class='ok' title='启用'" %>></a>
                    
                    </itemtemplate>
                    <itemstyle horizontalalign="Center" width="60px" />
                </asp:TemplateField>

                
                <asp:TemplateField HeaderText="会员数量">
                    <itemtemplate>
                    <a href="javascript:" title="查看会员" onclick="showUser(<%# Eval("groupId") %>,'<%# Eval("groupName") %>')"> <%# GetUserNum(Convert.ToInt32(Eval("GroupID"))) %> 位</a>
                    
                    </itemtemplate>
                    <itemstyle horizontalalign="Center" width="60px" />
                </asp:TemplateField>

             <asp:TemplateField HeaderText="修改">
              <itemstyle width="30px" horizontalalign="Center"/>
              <itemtemplate>
                     <asp:LinkButton CssClass="edit" ID="LinkButton1" runat="server" commandargument=<%#Eval("groupid") %> commandname="modify" ToolTip="修改"></asp:LinkButton>
              </itemtemplate>
            </asp:TemplateField>

                <asp:TemplateField HeaderText="删除">
                    <itemtemplate>
                      <asp:LinkButton  runat="server" id="delete" commandargument=<%#Eval("groupid") %> commandname="del">删除</asp:LinkButton>
                   </itemtemplate>
                    <itemstyle horizontalalign="Center" width="30px" />
                </asp:TemplateField>
            </Columns>
            <EditRowStyle CssClass="emptycss" />
        </KS:KSGV>
    </asp:Panel>
    
    <asp:Panel ID="AddPanel" runat="server" Width="100%" Visible="false">
        <KS:TopNav ID="TopNav1" runat="server" Text="新增用户组" />
        <script type="text/javascript">
 	function showmailarea()
       {
       var checkrad = jQuery("#<%=this.UserAuthentication.ClientID %> :radio[checked]").val();
       if (checkrad=="1"){
         jQuery("#<%=this.mailarea.ClientID%>").css("display","");
       }else{
        jQuery("#<%=this.mailarea.ClientID%>").css("display","none");
       }
       
       }
       </script>
 <div class="tab-page" id="UserGroupPanel">
         <script type="text/javascript">
             var tabPane1 = new WebFXTabPane(document.getElementById("UserGroupPanel"), 1)
         </script>
             
		 <div class="tab-page" id="tab0">
		  <h2 class="tab">基本参数</h2>
			<script type="text/javascript">
			    tabPane1.addTabPage(document.getElementById("tab0"));
			</script>

      <table width="100%"  border="0" cellpadding="1" cellspacing="1" class="CTable"> 
          <tr>
            <td class="lefttd" height="30" align="right"><b>用户组名称：</b></td>
            <td class="righttd"><asp:TextBox CssClass="textbox" ID="GroupName" runat="server" Width="325px"></asp:TextBox>
               <span class="tips">如：个人会员，企业会员等。</span> <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="GroupName"
                    ErrorMessage="请填写用户组名称!" Display="Dynamic"></asp:RequiredFieldValidator></td>
          </tr>
          <tr>
              <td align="right" class="lefttd" height="30">
                  <strong>简要说明：</strong></td>
              <td class="righttd"><asp:TextBox CssClass="textbox textarea" ID="Descript" runat="server" Height="89px" TextMode="MultiLine" Width="425px"></asp:TextBox>
			  </td>
          </tr>
          <tr style="display:none">
              <td align="right" class="lefttd" height="30">
                  <strong>收费方式：</strong></td>
              <td class="righttd">
               <input type="radio" name="chargetype" id="ChargeType1" runat="server" checked />扣点方式<br />
                  默认点数：<asp:TextBox CssClass="textbox" ID="GroupPoint" Text="0" runat="server" Width="38px"></asp:TextBox>点<br />
               <input type="radio" name="chargetype" id="ChargeType2" runat="server" />有效期方式<br />
                  默认天数：<asp:TextBox CssClass="textbox" ID="ValidDays" Text="0" runat="server" Width="33px"></asp:TextBox>天<br />
               <input type="radio" name="chargetype" id="ChargeType3" runat="server" />
                  无限期（永不过期）</td>
          </tr>
          <tr>
              <td align="right" class="lefttd" height="30">
                  <strong>绑定会员表单：</strong></td>
              <td class="righttd">
                  <asp:DropDownList ID="FormID" runat="server">
                  </asp:DropDownList> <a href="KS.UserForm.aspx">管理会员表单</a></td>
          </tr>

          <tr>
              <td align="right" class="lefttd" height="30">
                  <strong>会员中心首页模板：</strong></td>
              <td class="righttd">
                  <asp:TextBox ID="TxtTempateDir" runat="server" Text="{$TemplateDir}/个人中心/index.html" CssClass="textbox" Width="350px" />
                   <input class="button" onClick="SelectTemplate('<%=this.TxtTempateDir.ClientID %>');"  onmouseout="this.className='button';" onmouseover="this.className='button_on';" type="button" value="选择模板..." />
              </td>
          </tr>


          <tr>
              <td align="right" class="lefttd" height="30">
                  <strong>启用前台注册：</strong></td>
              <td class="righttd">
                  <asp:RadioButtonList ID="IsReg" runat="server" RepeatDirection="Horizontal">
                      <asp:ListItem Selected="True" Value="1">启用</asp:ListItem>
                      <asp:ListItem Value="0">不启用</asp:ListItem>
                  </asp:RadioButtonList></td>
          </tr>

          <tr>
                  <td align="right" class="lefttd" style="width: 198px; height: 30px">
                      <strong>新会员注册认证方式：</strong></td>
                  <td class="righttd" style="height: 30px">
                      <asp:RadioButtonList ID="UserAuthentication" runat="server">
                       <asp:ListItem Value="0" Selected="True">无（直接放入注册会员组）</asp:ListItem>
                       <asp:ListItem Value="1">邮箱认证</asp:ListItem>
                       <asp:ListItem Value="2">人工后台认证</asp:ListItem>
                   </asp:RadioButtonList></td>
              </tr>

               <tr style="display:none" id="mailarea" runat="server">
                   <td align="right" class="lefttd" height="30">
                       <div>
                           <strong>会员注册时发送的验证邮件内容：</strong> &nbsp; &nbsp; &nbsp;
                       </div>
                       <div align="center">
                           标签说明：<br />
                           {$GetSiteName}：网站名称<br />
                           {$CheckNum}：验证码<br />
                           {$CheckUrl}：会员注册验证地址
                           <div>
                           </div>
                       </div>
                   </td>
                   <td class="righttd">
                       <asp:TextBox CssClass="textbox textarea" Height="150px" Width="450px" ID="MailContent" runat="server" Columns="60" Rows="5" TextMode="MultiLine"></asp:TextBox>
                      <a class="textarea_min" href="javascript:zoomtextarea(-5,'<%=this.MailContent.ClientID %>');"></a>
                   <a class="textarea_max" href="javascript:zoomtextarea(5,'<%=this.MailContent.ClientID %>');"></a>
                          
                   </td>
               </tr>

          <tr>
              <td align="right" class="lefttd" height="30">
                  <strong>上传文件设置：</strong></td>
              <td class="righttd">
                  <strong>存放目录：</strong><asp:TextBox CssClass="textbox" ID="UpFilesDir" runat="server" Width="148px"></asp:TextBox>
                  <span style="color: #ff0066">
                  必须以 / 结束</span>
                  <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="UpFilesDir"
                      Display="Dynamic" ErrorMessage="请填写上传目录名称!"></asp:RequiredFieldValidator><br />
                  <span style="color: #006600">上传目录由总上传目录+这里设置的目录生成+用户ID组成</span><br />
                  <strong>可用空间：<asp:TextBox CssClass="textbox" style="text-align:center" ID="SpaceSize" runat="server" Width="58px"></asp:TextBox>
                      KB</strong>&nbsp; <span style="color: #ff0066">提示:1MB=1024KB </span>
              </td>
          </tr>
          
               
               
           <tr>
              <td align="right" class="lefttd" height="30">
                  <strong>短消息设置：</strong></td>
              <td class="righttd">
                 群发限制人数：<asp:TextBox CssClass="textbox" ID="TxtMsgSendNum" style="text-align:center" runat="server" Width="58px" Text="10"></asp:TextBox>
                     人 短信标题字数：<asp:TextBox CssClass="textbox" style="text-align:center" ID="TxtMsgTitleLen" text="50" runat="server" Width="58px"></asp:TextBox>个字符  短信内容最多字符数：<asp:TextBox CssClass="textbox" style="text-align:center" ID="TxtMsgLen" Text="1000" runat="server" Width="58px"></asp:TextBox>个字符
              </td>
          </tr>

         
               
       </table>

</div>
      <div class="tab-page" id="tab1">
		  <h2 class="tab"<%if (Kesion.BLL.KSSecurity.CheckPower("mall","mall1")==false){ %> style="display:none"<%} %>>商城权限</h2>
			<script type="text/javascript">
			    tabPane1.addTabPage(document.getElementById("tab1"));
			</script>
          <table width="100%"  border="0" cellpadding="1" cellspacing="1" class="CTable"> 
              <tr>
              <td align="right" class="lefttd" height="30">
                  <strong>商城优惠措施：</strong></td>
              <td class="righttd">
                 享受正价产品<asp:TextBox CssClass="textbox" ID="TxtShopPriceDiscount" style="text-align:center" runat="server" Width="58px" Text="0"></asp:TextBox>折优惠 
                 <span class="tips">该用户组没有任何优惠请输入“0”</span>
                 <br />
                  享受正价产品<asp:TextBox CssClass="textbox" ID="TxtShopScoreDiscount" style="text-align:center" runat="server" Width="58px" Text="0"></asp:TextBox>倍积分
                 <span class="tips">该用户组购物不奖积分请输入“0”</span>
                  <span class="tips">TIPS:建议只有加盟商家用户组才允许发布团购商品。</span>
              </td>
          </tr>
          <tr>
              <td align="right" class="lefttd" height="30">
                  <strong>是否允许发布团购商品：</strong></td>
              <td class="righttd">
                  <asp:RadioButtonList ID="RdbPubProduct" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow">
                      <asp:ListItem Value="1">允许</asp:ListItem>
                      <asp:ListItem Value="0" Selected="True">不允许</asp:ListItem>
                  </asp:RadioButtonList>
                  <span class="tips">TIPS:建议只有加盟商家用户组才允许发布团购商品。</span>
              </td>
          </tr>
               <tr>
              <td align="right" class="lefttd" height="30">
                  <strong>是否允许处理团购订单：</strong></td>
              <td class="righttd">
                  <asp:RadioButtonList ID="RdbProcessOrder" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow">
                      <asp:ListItem Value="1">允许</asp:ListItem>
                      <asp:ListItem Value="0" Selected="True">不允许</asp:ListItem>
                  </asp:RadioButtonList>
                  <span class="tips">TIPS:建议只有加盟商家用户组才允许处理团购订单。</span>
              </td>
          </tr>
          </table>

    </div>

      <div class="tab-page" id="tab3">
		  <h2 class="tab">会员菜单</h2>
			<script type="text/javascript">
			    tabPane1.addTabPage(document.getElementById("tab3"));
			</script>

           <div class="message">
            提示：不需要控制会员中心左栏菜单的显示，以下请直接留空不要设置。
              <input type="button" value="全选" class="button" onclick="checkALL(true)" />
              <input type="button" value="取消全选" class="button" onclick="checkALL(false)" />
         </div>

            <style>
                .poweritem {
                    padding-left:25px;
                }
               .poweritem li {
                        width:20%;
                        float:left;
                        height:40px;
                    }
            </style>
            <script>
                function TopToggle(obj,i) {
                    if (obj.checked) { $('#top'+i).show(); } else { $('#top'+i).hide(); }
                }
                function LeftToggle(obj,i,li) {
                    if (obj.checked) { $('#left-'+i+'-'+li).show(); } else { $('#left-'+i+'-'+li).hide(); }
                }
                function ItemToggle(obj,i,li,itemno) {
                    if (obj.checked) { $('#item-'+i+'-'+li+'-'+itemno).show(); } else { $('#item-'+i+'-'+li+'-'+itemno).hide(); }
                }
                function checkALL(flag){
                    $(".CTable").find("tr").show();
                    $(".CTable").find("input[type=checkbox]").attr("checked",flag);
                }

            </script>

     
            <%
            XmlDocument doc = new XmlDocument();
            doc.Load(Server.MapPath("~/config/usermenu.xml"));
            XmlNode nodes = doc.SelectSingleNode("usermenu");
            int i = 0;
            foreach (XmlNode topnode in nodes.ChildNodes) //顶级菜单
            {
                bool isShow = true;
                if (topnode.SelectSingleNode("@type") != null)
                {
                    if (topnode.SelectSingleNode("@type").InnerText == "shop" && Utils.GetSysInfo("//sysinfo/model/mall").ToString().ToLower() != "true")
                    {
                        isShow = false;
                    }
                    else if (topnode.SelectSingleNode("@type").InnerText == "exam" && Utils.GetSysInfo("//sysinfo/model/exam").ToString().ToLower() != "true")
                    {
                        isShow = false;
                    }
                }
                if (isShow){
                %>
                <table width="99%"  border="0" cellpadding="1" cellspacing="1" class="CTable" style="margin-bottom:5px;"> 
                  <tr>
                    <td class="righttd" style="font-size:14px;font-family:黑体;font-weight:bold"><label><%=UtilsAutoID.CapitalFigures(i) %>、<input onclick="TopToggle(this,<%=i %>);" type="checkbox" name="powerlist" value="<%=topnode.SelectSingleNode("@role").InnerText %>"<%if (Utils.InArray(topnode.SelectSingleNode("@role").InnerText, powerList, ",")) Response.Write(" checked"); %> />【<%=topnode.SelectSingleNode("@name").InnerText %>】</label></td>
                  </tr>
                   <tr  id="top<%=i %>"<%=(Utils.InArray(topnode.SelectSingleNode("@role").InnerText, powerList, ","))?string.Empty:" style='display:none';"%>>
                       <td style="padding-left:50px;">
                          
                           <%
                int li = 0;

                          foreach (XmlNode leftnode in topnode.SelectNodes("leftitem")) //左边一级菜单
                          {
                            %>
                            <table width="100%" border="0" cellpadding="1" cellspacing="1"> 
                              <tr>
                                <td style="height:28px"><label><%=UtilsAutoID.ToNum1(li) %>、<input onclick="LeftToggle(this,<%=i%>,<%=li %>);" type="checkbox" name="powerlist" value="<%=leftnode.SelectSingleNode("@role").InnerText %>"<%if (Utils.InArray(leftnode.SelectSingleNode("@role").InnerText, powerList, ",")) Response.Write(" checked"); %> />【<%=leftnode.SelectSingleNode("@name").InnerText %>】</label></td>
                              </tr>
                              <tr  id="left-<%=i %>-<%=li %>"<%=(Utils.InArray(leftnode.SelectSingleNode("@role").InnerText, powerList, ","))?string.Empty:" style='display:none';"%>>
                                  <td>
                                      <ul class="poweritem">
                                    <%
                                   int itemnum = 0;
                                   foreach (XmlNode item in leftnode.SelectNodes("itemlist/item")) //左边二级菜单
                                    {
                                       string power = Kesion.BLL.KSSecurity.RemovePowerBadChar(item.SelectSingleNode("url").InnerText);
                               
                                           Response.Write("<li>");
                                           Response.Write(string.Format(@"<label><input type='checkbox' name='powerlist' onclick=""ItemToggle(this,{3},{4},{5})"" value='{1}'{2}> {0}</label>", item.SelectSingleNode("name").InnerText.Replace("{=GetCacheConfig(49)}",MyCache.GetCacheConfig(49)), power, Utils.InArray(power, powerList, ",") ? " checked" : string.Empty, i, li, itemnum));
                                           Response.Write("</li>");
                                  
                                       itemnum++;
                                    }     
                                    %>
                                      </ul>
                                  </td>
                              </tr>
                           </table>
                           <%   
                              li++;
                          }     
                           %>
                             
                       </td>
                   </tr>
                </table>
                <%
                i++;
                }
            }
           %>





    </div>



     </div>


        <br />
        <KS:Foot ID="Foot1" runat="server" OnSubmit="Foot1_Submit" />
    </asp:Panel>
</asp:Content>

