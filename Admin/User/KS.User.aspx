<%@ Page Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.Admin_User" Title="用户管理" Codebehind="KS.User.aspx.cs" %>
<%@ Import Namespace="Kesion.Cache" %>
<%@ Import Namespace="Kesion.Publics" %>
<%@ Import Namespace="Kesion.BLL" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Xml" %>
<asp:Content ID="Content1" ContentPlaceHolderID="KSContent" Runat="Server">
<div id="manage_top" class="menu_top_fixed">&nbsp;<strong>快速查找用户：</strong>
     <%if (!string.IsNullOrEmpty(KSCMS.S("groupname"))){ %>
    用户组[<%=KSCMS.S("groupname") %>]
    <%}else if (!string.IsNullOrEmpty(KSCMS.S("depart"))){%>
    部门[<%=KSCMS.S("depart") %>]
   
    <%  }else{ %>
<a href="KS.User.aspx">所有用户</a> | <a href="KS.User.aspx?UserType=1">被锁定的用户</a> | <a href="KS.User.aspx?UserType=2">所有管理员</a> | <a href="KS.User.aspx?UserType=3">待认证会员</a> | <a href="KS.User.aspx?UserType=4">待邮件激活会员</a>
        | <a href="KS.User.aspx?UserType=5">24小时内登录</a>
        | <a href="KS.User.aspx?UserType=6">24小时内注册</a>

    <%} %>
   <span style="float:right;padding-right:20px">总会员<span style='color:red'><%=Kesion.BLL.DataFactory.GetOnlyValue("select count(1) From KS_User") %></span>位，24小时内新增<span style='color:red'><%=Kesion.BLL.DataFactory.GetOnlyValue("select count(1) From KS_User Where DateDiff(day,regdate,getdate())<1") %></span>位，24小时内登录<span style='color:red'><%=Kesion.BLL.DataFactory.GetOnlyValue("select count(1) From KS_User Where DateDiff(day,lastlogintime,getdate())<1") %></span>位</span>
</div>
 <div class="menu_top_fixed_height"></div>   

    
    <div class="tabs_header">
        <ul class="tabs">
          <% if (KSCMS.S("action")=="show"){%>
          <strong>查看用户信息[<%=drr["username"].ToString() %>]</strong>
        <%}else{ %>
        <li <%=string.IsNullOrEmpty(KSCMS.S("gid"))?" class='active'":"" %>><a href="KS.User.aspx"><span>所有会员</span></a></li>
        <%
            using (DataTable dt = MyCache.GetUserGroupTable())
            {
                foreach (DataRow dr in dt.Rows)
                {
                    KSCMS.W(string.Format(@"<li{2}><a href=""KS.User.aspx?gid={0}""><span>{1}</span></a></li>", dr["groupid"].ToString(), dr["groupname"].ToString(), KSCMS.S("gid") == dr["groupid"].ToString() ? " class='active'" : string.Empty));
                }
            }    
            } %>
        
        </ul>
   </div>


<asp:Panel ID="ListPanel" runat="server" Width="100%">
    <script>
        function GetMyIds() {
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
            return sid;
        }
        function doCZ(){
           var sid = GetMyIds();
           if (sid==null){
                KesionJS.Alert("请先选择要充值的会员！");
           }else{
                parent.openWin("给用户充值","User/KS.AddMoney.aspx?userID="+sid,true,750,350);
            }
        }
    </script>
    <KS:KSGV ID="list" cssclass="CTable" runat='server' AutoGenerateColumns="False" GridLines="None" PagerType="CustomNumeric" Width="99%" OnRowDataBound="list_RowDataBound" OnRowCommand="list_RowCommand" OnRowCreated="list_RowCreated">
        <Columns>
            <asp:TemplateField HeaderText="选择">
                <itemtemplate>
                 <input type="checkbox"  name="ids" id="ids" value="<%#Eval("userid") %>" />
                 </itemtemplate>
                <itemstyle horizontalalign="Center" Height="30px" width="50px" />
            </asp:TemplateField>
            <asp:BoundField DataField="UserID" HeaderText="ID">
                <itemstyle horizontalalign="Center" width="30px" />
            </asp:BoundField>

            <asp:TemplateField HeaderText="用户名">
                <itemtemplate>
                <a href='KS.User.aspx?action=show&userid=<%#Eval("UserID") %>' title="查看会员[<%# Eval("username") %>]资料"><%# Eval("username") %></a>
               </itemtemplate>
             <itemstyle horizontalalign="Center" width="100px" />
            </asp:TemplateField>


            <asp:BoundField HeaderText="用户组" DataField="groupname">
                <itemstyle horizontalalign="Center" />
            </asp:BoundField>
            <asp:BoundField DataField="Chargetype" HeaderText="计费方式">
                <itemstyle horizontalalign="Center" />
            </asp:BoundField>
            <asp:TemplateField HeaderText="预付款/点数/积分">
                <itemtemplate>
                <a href='KS.LogMoney.aspx?username=<%#Eval("UserName") %>'><span style="color:Green"><%# Math.Round(Convert.ToDouble(Eval("money")),2).ToString() %></span> <%=MyCache.GetCurrencyUnit %></a>/
                <a href='KS.Consumer.aspx?username=<%#Eval("UserName") %>'><%#GetPointOrEdays(Convert.ToInt32(Eval("chargetype")),Convert.ToInt32(Eval("point")),Convert.ToInt32(Eval("edays")),Convert.ToDateTime(Eval("begindate"))) %></a>/<a href='KS.LogScore.aspx?username=<%#Eval("UserName") %>' title="总积分<%# Eval("Score") %>分，已消费<%# Eval("ScoreHasUse") %>分，可用积分<%# Convert.ToInt32(Eval("Score"))-Convert.ToInt32(Eval("ScoreHasUse")) %>分"><span style="color:blue"><%# Eval("score") %></span> 分</a>
               </itemtemplate>
             <itemstyle horizontalalign="Center" width="100px" />
            </asp:TemplateField>

            <asp:TemplateField HeaderText="最后登录IP">
              <itemstyle horizontalalign="Center"/>
              <itemtemplate>
              <span class="tips"><%# Eval("lastloginip")%></span>
              </itemtemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="最后登录时间">
              <itemstyle horizontalalign="Center"/>
              <itemtemplate>
              <span class="tips"><%# Eval("lastlogintime") %></span>
              </itemtemplate>
            </asp:TemplateField>

            <asp:BoundField DataField="locked" HeaderText="状态" >
                <itemstyle width="55px" horizontalalign="Center"/>
            </asp:BoundField>
             <asp:TemplateField HeaderText="修改">
              <itemstyle width="30px" horizontalalign="Center"/>
              <itemtemplate>
               <asp:LinkButton CssClass="edit" ToolTip="修改用户" ID="LinkButton1" runat="server" commandargument=<%#Eval("userid") %> commandname="modify"></asp:LinkButton>
              </itemtemplate>
            </asp:TemplateField>
             <asp:TemplateField HeaderText="删除">
              <itemstyle width="30px" horizontalalign="Center"/>
              <itemtemplate>
             <asp:LinkButton runat="server" CssClass="delete" id="delete" commandargument=<%#Eval("userid") %> commandname="del" ToolTip="删除"></asp:LinkButton>
              </itemtemplate>
            </asp:TemplateField>
             <asp:TemplateField HeaderText="充值">
              <itemstyle width="35px" horizontalalign="Center"/>
              <itemtemplate>
               <a href="#" class="money" title="充值" onclick='parent.openWin("给用户充值","User/KS.AddMoney.aspx?userID=<%#Eval("userID") %>",true,750,350);return false'>充</a>
              </itemtemplate>
            </asp:TemplateField>

        </Columns>
        <HeaderStyle CssClass="CTitle" />
        <EmptyDataRowStyle CssClass="emptycss" />
    </KS:KSGV>
    
<asp:Panel ID="Panel1" runat="server" Height="30px" Width="741px">
              <div style="margin-top:2px;overflow:hidden;"></div>
            &nbsp;&nbsp;&nbsp;&nbsp;<input type="checkbox" name="chkall" id="chkall" onclick="CheckAll(this.form);"/><label for="chkall">全部选中</label>
                 &nbsp;&nbsp;&nbsp;<strong>操作:</strong> 
                   <input type="radio" name="optype" value="1" onClick="jQuery('#GroupID').attr('disabled',true)" id="del" checked /><label for="del">删除</label>
                 &nbsp;<input type="radio" name="optype" value="2" onClick="jQuery('#GroupID').attr('disabled',true)" id="lock"/><label for="lock">锁定</label>
                &nbsp;<input type="radio" name="optype" value="3" onClick="jQuery('#GroupID').attr('disabled',true)" id="unlock"/><label for="unlock">解锁</label>
               &nbsp;<input type="radio" name="optype" value="4" onClick="jQuery('#GroupID').attr('disabled',false)" id="moveusergroup"/><label for="moveusergroup">移动到</label>
               &nbsp;<select ID="GroupID" disabled="false" name="GroupID">
                  <%=MyCache.GetUserGroupCache() %>
              </select>
               <asp:Button ID="ExecuteButton" runat="server" Text="开始执行" OnClick="ExecuteButton_Click" />
               <asp:Button ID="SendMailButton" runat="server" Text="发送邮件" />
               <input type="button" value="批量充值" class="button" onclick="doCZ()" />
               <input type="button" value="打印" class="button" onclick="window.print()" />

</asp:Panel>
  <br />
 <br />
<div class="message">
<strong>搜索会员：</strong><asp:TextBox runat="server" ID="TxtKeyWord" CssClass="textbox" /> <strong>条件：</strong>
<asp:DropDownList ID="DrpSearchType" runat="server">
  <asp:ListItem Value="0" Selected="True">会员名</asp:ListItem>
  <asp:ListItem Value="1">姓名</asp:ListItem>
  <asp:ListItem Value="2">用户ID</asp:ListItem>
</asp:DropDownList>
    <asp:Button ID="BtnSearch" runat="server" CssClass="button" Text="搜索会员" 
        onclick="BtnSearch_Click" />
        </div><br />
 <br /><br />
 <br />
 <KS:Page ID="Page1" runat="server" />
</asp:Panel>

<asp:Panel ID="PanelShow" runat="server" Visible="false">
     <table width="100%" border="0" cellpadding="1" cellspacing="1" class="CTable">

          <tr>
              <td align="right" class="lefttd" height="30" style="width: 84px"> <strong>用户名：</strong></td>
              <td class="righttd">   <%=drr["username"].ToString() %> </td>
          </tr>
          <tr>
              <td align="right" class="lefttd" height="30" style="width: 84px"> <strong>财务信息：</strong></td>
              <td class="righttd">  
                  资金：<a href='KS.LogMoney.aspx?username=<%=drr["UserName"].ToString() %>'><%=Kesion.APPCode.Public.ReturnShopPrice(Utils.StrToDecimal(drr["money"].ToString())) %></a></span> 元
                  <%=MyCache.GetCacheConfig(49) %>：<a href='KS.Consumer.aspx?username=<%=drr["username"].ToString() %>'><%=Kesion.APPCode.Public.ReturnShopPrice(Utils.StrToDecimal(drr["point"].ToString())) %></a><%=MyCache.GetCacheConfig(50) %>
                 积分： <a href='KS.LogScore.aspx?username=<%=drr["UserName"].ToString() %>' title="总积分<%=drr["Score"].ToString() %>分，已消费<%=drr["ScoreHasUse"].ToString() %>分，可用积分<%=Convert.ToInt32(drr["Score"].ToString())-Convert.ToInt32(drr["ScoreHasUse"].ToString()) %>分"><span style="color:blue"><%=drr["score"].ToString() %></span> 分</a>


              </td>
          </tr>
          <tr>
              <td align="right" class="lefttd" height="30" style="width: 84px"> <strong>真实姓名：</strong></td>
              <td class="righttd">   <%=drr["realname"].ToString() %> </td>
          </tr>
          <tr>
              <td align="right" class="lefttd" height="30" style="width: 84px"> <strong>电子邮件：</strong></td>
              <td class="righttd">  <%=drr["email"].ToString() %> </td>
          </tr>
          <tr>
              <td align="right" class="lefttd" height="30" style="width: 84px"> <strong>手机号码：</strong></td>
              <td class="righttd">  <%=drr["mobile"].ToString() %> </td>
          </tr>
         <%
             XmlDocument xmldoc = new XmlDocument();
             xmldoc.Load(Server.MapPath("../../config/userfield.config"));
             XmlNode xn = xmldoc.SelectSingleNode("UserField");
             string template = UserFormManage.GetFormTemplateByGroupID(Utils.StrToInt(drr["groupid"].ToString()));
          foreach (XmlNode xnf in xn.ChildNodes)
            {
                XmlElement xe = (XmlElement)xnf;
                string FieldID = xe.GetAttribute("Name");
                if (template.IndexOf("[@"+FieldID+"]") != -1)
                { %>
             <tr>
                  <td align="right" class="lefttd" height="30" style="width: 84px"> <strong><%=xe.GetElementsByTagName("FieldAlias").Item(0).InnerText %>：</strong></td>
                  <td class="righttd">  <%=drr[FieldID].ToString() %> </td>
              </tr>
             <%
             }
            }
           %>

     </table>



    <div style="text-align:center;margin:40px;">
        <input type="button" class="button" value=" 返 回 " onclick="history.back()" />
        <input type="button" class="button" value=" 打 印 " onclick="window.print()" />
        <input type="button" class="button" value=" 修 改 " onclick="location.href='KS.UserAdd.aspx?userid=<%=drr["userid"].ToString()%>';" />

    </div>

</asp:Panel>

</asp:Content>

