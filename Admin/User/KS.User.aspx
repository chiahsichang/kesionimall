<%@ Page Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.Admin_User" Title="�û�����" Codebehind="KS.User.aspx.cs" %>
<%@ Import Namespace="Kesion.Cache" %>
<%@ Import Namespace="Kesion.Publics" %>
<%@ Import Namespace="Kesion.BLL" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Xml" %>
<asp:Content ID="Content1" ContentPlaceHolderID="KSContent" Runat="Server">
<div id="manage_top" class="menu_top_fixed">&nbsp;<strong>���ٲ����û���</strong>
     <%if (!string.IsNullOrEmpty(KSCMS.S("groupname"))){ %>
    �û���[<%=KSCMS.S("groupname") %>]
    <%}else if (!string.IsNullOrEmpty(KSCMS.S("depart"))){%>
    ����[<%=KSCMS.S("depart") %>]
   
    <%  }else{ %>
<a href="KS.User.aspx">�����û�</a> | <a href="KS.User.aspx?UserType=1">���������û�</a> | <a href="KS.User.aspx?UserType=2">���й���Ա</a> | <a href="KS.User.aspx?UserType=3">����֤��Ա</a> | <a href="KS.User.aspx?UserType=4">���ʼ������Ա</a>
        | <a href="KS.User.aspx?UserType=5">24Сʱ�ڵ�¼</a>
        | <a href="KS.User.aspx?UserType=6">24Сʱ��ע��</a>

    <%} %>
   <span style="float:right;padding-right:20px">�ܻ�Ա<span style='color:red'><%=Kesion.BLL.DataFactory.GetOnlyValue("select count(1) From KS_User") %></span>λ��24Сʱ������<span style='color:red'><%=Kesion.BLL.DataFactory.GetOnlyValue("select count(1) From KS_User Where DateDiff(day,regdate,getdate())<1") %></span>λ��24Сʱ�ڵ�¼<span style='color:red'><%=Kesion.BLL.DataFactory.GetOnlyValue("select count(1) From KS_User Where DateDiff(day,lastlogintime,getdate())<1") %></span>λ</span>
</div>
 <div class="menu_top_fixed_height"></div>   

    
    <div class="tabs_header">
        <ul class="tabs">
          <% if (KSCMS.S("action")=="show"){%>
          <strong>�鿴�û���Ϣ[<%=drr["username"].ToString() %>]</strong>
        <%}else{ %>
        <li <%=string.IsNullOrEmpty(KSCMS.S("gid"))?" class='active'":"" %>><a href="KS.User.aspx"><span>���л�Ա</span></a></li>
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
                KesionJS.Alert("����ѡ��Ҫ��ֵ�Ļ�Ա��");
           }else{
                parent.openWin("���û���ֵ","User/KS.AddMoney.aspx?userID="+sid,true,750,350);
            }
        }
    </script>
    <KS:KSGV ID="list" cssclass="CTable" runat='server' AutoGenerateColumns="False" GridLines="None" PagerType="CustomNumeric" Width="99%" OnRowDataBound="list_RowDataBound" OnRowCommand="list_RowCommand" OnRowCreated="list_RowCreated">
        <Columns>
            <asp:TemplateField HeaderText="ѡ��">
                <itemtemplate>
                 <input type="checkbox"  name="ids" id="ids" value="<%#Eval("userid") %>" />
                 </itemtemplate>
                <itemstyle horizontalalign="Center" Height="30px" width="50px" />
            </asp:TemplateField>
            <asp:BoundField DataField="UserID" HeaderText="ID">
                <itemstyle horizontalalign="Center" width="30px" />
            </asp:BoundField>

            <asp:TemplateField HeaderText="�û���">
                <itemtemplate>
                <a href='KS.User.aspx?action=show&userid=<%#Eval("UserID") %>' title="�鿴��Ա[<%# Eval("username") %>]����"><%# Eval("username") %></a>
               </itemtemplate>
             <itemstyle horizontalalign="Center" width="100px" />
            </asp:TemplateField>


            <asp:BoundField HeaderText="�û���" DataField="groupname">
                <itemstyle horizontalalign="Center" />
            </asp:BoundField>
            <asp:BoundField DataField="Chargetype" HeaderText="�Ʒѷ�ʽ">
                <itemstyle horizontalalign="Center" />
            </asp:BoundField>
            <asp:TemplateField HeaderText="Ԥ����/����/����">
                <itemtemplate>
                <a href='KS.LogMoney.aspx?username=<%#Eval("UserName") %>'><span style="color:Green"><%# Math.Round(Convert.ToDouble(Eval("money")),2).ToString() %></span> <%=MyCache.GetCurrencyUnit %></a>/
                <a href='KS.Consumer.aspx?username=<%#Eval("UserName") %>'><%#GetPointOrEdays(Convert.ToInt32(Eval("chargetype")),Convert.ToInt32(Eval("point")),Convert.ToInt32(Eval("edays")),Convert.ToDateTime(Eval("begindate"))) %></a>/<a href='KS.LogScore.aspx?username=<%#Eval("UserName") %>' title="�ܻ���<%# Eval("Score") %>�֣�������<%# Eval("ScoreHasUse") %>�֣����û���<%# Convert.ToInt32(Eval("Score"))-Convert.ToInt32(Eval("ScoreHasUse")) %>��"><span style="color:blue"><%# Eval("score") %></span> ��</a>
               </itemtemplate>
             <itemstyle horizontalalign="Center" width="100px" />
            </asp:TemplateField>

            <asp:TemplateField HeaderText="����¼IP">
              <itemstyle horizontalalign="Center"/>
              <itemtemplate>
              <span class="tips"><%# Eval("lastloginip")%></span>
              </itemtemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="����¼ʱ��">
              <itemstyle horizontalalign="Center"/>
              <itemtemplate>
              <span class="tips"><%# Eval("lastlogintime") %></span>
              </itemtemplate>
            </asp:TemplateField>

            <asp:BoundField DataField="locked" HeaderText="״̬" >
                <itemstyle width="55px" horizontalalign="Center"/>
            </asp:BoundField>
             <asp:TemplateField HeaderText="�޸�">
              <itemstyle width="30px" horizontalalign="Center"/>
              <itemtemplate>
               <asp:LinkButton CssClass="edit" ToolTip="�޸��û�" ID="LinkButton1" runat="server" commandargument=<%#Eval("userid") %> commandname="modify"></asp:LinkButton>
              </itemtemplate>
            </asp:TemplateField>
             <asp:TemplateField HeaderText="ɾ��">
              <itemstyle width="30px" horizontalalign="Center"/>
              <itemtemplate>
             <asp:LinkButton runat="server" CssClass="delete" id="delete" commandargument=<%#Eval("userid") %> commandname="del" ToolTip="ɾ��"></asp:LinkButton>
              </itemtemplate>
            </asp:TemplateField>
             <asp:TemplateField HeaderText="��ֵ">
              <itemstyle width="35px" horizontalalign="Center"/>
              <itemtemplate>
               <a href="#" class="money" title="��ֵ" onclick='parent.openWin("���û���ֵ","User/KS.AddMoney.aspx?userID=<%#Eval("userID") %>",true,750,350);return false'>��</a>
              </itemtemplate>
            </asp:TemplateField>

        </Columns>
        <HeaderStyle CssClass="CTitle" />
        <EmptyDataRowStyle CssClass="emptycss" />
    </KS:KSGV>
    
<asp:Panel ID="Panel1" runat="server" Height="30px" Width="741px">
              <div style="margin-top:2px;overflow:hidden;"></div>
            &nbsp;&nbsp;&nbsp;&nbsp;<input type="checkbox" name="chkall" id="chkall" onclick="CheckAll(this.form);"/><label for="chkall">ȫ��ѡ��</label>
                 &nbsp;&nbsp;&nbsp;<strong>����:</strong> 
                   <input type="radio" name="optype" value="1" onClick="jQuery('#GroupID').attr('disabled',true)" id="del" checked /><label for="del">ɾ��</label>
                 &nbsp;<input type="radio" name="optype" value="2" onClick="jQuery('#GroupID').attr('disabled',true)" id="lock"/><label for="lock">����</label>
                &nbsp;<input type="radio" name="optype" value="3" onClick="jQuery('#GroupID').attr('disabled',true)" id="unlock"/><label for="unlock">����</label>
               &nbsp;<input type="radio" name="optype" value="4" onClick="jQuery('#GroupID').attr('disabled',false)" id="moveusergroup"/><label for="moveusergroup">�ƶ���</label>
               &nbsp;<select ID="GroupID" disabled="false" name="GroupID">
                  <%=MyCache.GetUserGroupCache() %>
              </select>
               <asp:Button ID="ExecuteButton" runat="server" Text="��ʼִ��" OnClick="ExecuteButton_Click" />
               <asp:Button ID="SendMailButton" runat="server" Text="�����ʼ�" />
               <input type="button" value="������ֵ" class="button" onclick="doCZ()" />
               <input type="button" value="��ӡ" class="button" onclick="window.print()" />

</asp:Panel>
  <br />
 <br />
<div class="message">
<strong>������Ա��</strong><asp:TextBox runat="server" ID="TxtKeyWord" CssClass="textbox" /> <strong>������</strong>
<asp:DropDownList ID="DrpSearchType" runat="server">
  <asp:ListItem Value="0" Selected="True">��Ա��</asp:ListItem>
  <asp:ListItem Value="1">����</asp:ListItem>
  <asp:ListItem Value="2">�û�ID</asp:ListItem>
</asp:DropDownList>
    <asp:Button ID="BtnSearch" runat="server" CssClass="button" Text="������Ա" 
        onclick="BtnSearch_Click" />
        </div><br />
 <br /><br />
 <br />
 <KS:Page ID="Page1" runat="server" />
</asp:Panel>

<asp:Panel ID="PanelShow" runat="server" Visible="false">
     <table width="100%" border="0" cellpadding="1" cellspacing="1" class="CTable">

          <tr>
              <td align="right" class="lefttd" height="30" style="width: 84px"> <strong>�û�����</strong></td>
              <td class="righttd">   <%=drr["username"].ToString() %> </td>
          </tr>
          <tr>
              <td align="right" class="lefttd" height="30" style="width: 84px"> <strong>������Ϣ��</strong></td>
              <td class="righttd">  
                  �ʽ�<a href='KS.LogMoney.aspx?username=<%=drr["UserName"].ToString() %>'><%=Kesion.APPCode.Public.ReturnShopPrice(Utils.StrToDecimal(drr["money"].ToString())) %></a></span> Ԫ
                  <%=MyCache.GetCacheConfig(49) %>��<a href='KS.Consumer.aspx?username=<%=drr["username"].ToString() %>'><%=Kesion.APPCode.Public.ReturnShopPrice(Utils.StrToDecimal(drr["point"].ToString())) %></a><%=MyCache.GetCacheConfig(50) %>
                 ���֣� <a href='KS.LogScore.aspx?username=<%=drr["UserName"].ToString() %>' title="�ܻ���<%=drr["Score"].ToString() %>�֣�������<%=drr["ScoreHasUse"].ToString() %>�֣����û���<%=Convert.ToInt32(drr["Score"].ToString())-Convert.ToInt32(drr["ScoreHasUse"].ToString()) %>��"><span style="color:blue"><%=drr["score"].ToString() %></span> ��</a>


              </td>
          </tr>
          <tr>
              <td align="right" class="lefttd" height="30" style="width: 84px"> <strong>��ʵ������</strong></td>
              <td class="righttd">   <%=drr["realname"].ToString() %> </td>
          </tr>
          <tr>
              <td align="right" class="lefttd" height="30" style="width: 84px"> <strong>�����ʼ���</strong></td>
              <td class="righttd">  <%=drr["email"].ToString() %> </td>
          </tr>
          <tr>
              <td align="right" class="lefttd" height="30" style="width: 84px"> <strong>�ֻ����룺</strong></td>
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
                  <td align="right" class="lefttd" height="30" style="width: 84px"> <strong><%=xe.GetElementsByTagName("FieldAlias").Item(0).InnerText %>��</strong></td>
                  <td class="righttd">  <%=drr[FieldID].ToString() %> </td>
              </tr>
             <%
             }
            }
           %>

     </table>



    <div style="text-align:center;margin:40px;">
        <input type="button" class="button" value=" �� �� " onclick="history.back()" />
        <input type="button" class="button" value=" �� ӡ " onclick="window.print()" />
        <input type="button" class="button" value=" �� �� " onclick="location.href='KS.UserAdd.aspx?userid=<%=drr["userid"].ToString()%>';" />

    </div>

</asp:Panel>

</asp:Content>

