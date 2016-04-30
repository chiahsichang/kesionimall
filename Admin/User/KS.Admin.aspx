<%@ Page Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.Admin_Administrator" Title="Untitled Page" Codebehind="KS.Admin.aspx.cs" %>
<%@ Import Namespace="Kesion.Publics" %>
<%@ Import Namespace="Kesion.Cache" %>
<%@ Import Namespace="System.Xml" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="Kesion.BLL" %>
<asp:Content ID="Content1" ContentPlaceHolderID="KSContent" Runat="Server">
    <asp:Panel ID="ListPanel" runat="server" Height="50px" Width="100%">
        <div id="manage_top" class="menu_top_fixed">
       <ul>
           <li id='p1'><asp:LinkButton ID="addclassbutton" runat="server" OnClick="addclassbutton_Click"><b></b>��ӹ���Ա</asp:LinkButton></li>
           <li id='p4'><asp:LinkButton ID="editclassbutton" runat="server" OnClick="editclassbutton_Click"><b></b>�༭����Ա</asp:LinkButton></li>
           <li id='p3'><asp:LinkButton ID="delclassbutton" runat="server" OnClick="delclassbutton_Click"><b></b>ɾ������Ա</asp:LinkButton></li></ul>
    </div>
    <div class="menu_top_fixed_height"></div>     
        <KS:KSGV ID="List" cssclass="CTable" runat="server" GridLines="None" AutoGenerateColumns="False" EmptyDataText="û������κι���Ա" Width="99%" OnRowDataBound="List_RowDataBound" OnRowCreated="List_RowCreated" OnRowCommand="List_RowCommand">
            <HeaderStyle CssClass="CTitle" />
            <Columns>
               <asp:TemplateField HeaderText="ѡ��">
                <itemtemplate>
                <input type="checkbox"  name="ids" id="ids" value="<%#Eval("id") %>" />
                </itemtemplate>
                <itemstyle horizontalalign="Center" Height="30px" width="50px" />
              </asp:TemplateField>
               <asp:TemplateField HeaderText="״̬">
              <itemstyle width="30px" horizontalalign="Center"/>
              <itemtemplate>
                   <a href="?action=locked&id=<%#Eval("ID")%>" <%# Convert.ToString(Eval("locked"))=="1"?"class='no' title='����״̬'":"class='ok' title='����״̬'" %>></a>
              </itemtemplate>
            </asp:TemplateField>
                <asp:BoundField DataField="id" HeaderText="ID" Visible="false">
                    <itemstyle horizontalalign="Center" width="25px" />
                </asp:BoundField>
                <asp:BoundField DataField="username" HeaderText="����Ա����">
                    <itemstyle horizontalalign="Left"/>
                </asp:BoundField>
                <asp:BoundField DataField="realname" HeaderText="��ʵ����">
                <itemstyle width="80px" horizontalalign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="usertype" HeaderText="����" >
                    <itemstyle horizontalalign="Center" />
                </asp:BoundField>

                <asp:TemplateField HeaderText="����¼ʱ��">
              <itemstyle  horizontalalign="Center"/>
              <itemtemplate>
                <span class="tips"><%# Eval("lastlogintime") %></span>
              </itemtemplate>
            </asp:TemplateField>

                
                <asp:BoundField DataField="logintimes" HeaderText="��¼����" >
                    <itemstyle horizontalalign="Center"/>
                </asp:BoundField>
               

            <asp:TemplateField HeaderText="�޸�">
              <itemstyle width="30px" horizontalalign="Center"/>
              <itemtemplate>
                     <asp:LinkButton CssClass="edit" ID="LinkButton1" runat="server" commandargument=<%#Eval("id") %> commandname="modify" ToolTip="�޸�"></asp:LinkButton>
              </itemtemplate>
            </asp:TemplateField>
             <asp:TemplateField HeaderText="ɾ��">
               <itemstyle width="30px" horizontalalign="Center"/>
                    <itemtemplate>
                     <asp:HiddenField runat="server" Value='<%#Eval("sysadmin") %>' ID="HidSysAdmin"></asp:HiddenField>
                     <asp:LinkButton runat="server" id="delete" commandargument=<%#Eval("id") %> commandname="del" ToolTip="ɾ��" CssClass="delete"></asp:LinkButton>
                       </itemtemplate>
                </asp:TemplateField>
            </Columns>
            <EditRowStyle CssClass="emptycss" />
        </KS:KSGV>
         <KS:Page ID="Page1" runat="server" />
    </asp:Panel>
    
    <asp:Panel ID="AddPanel" runat="server" Width="100%" Visible="false">
      <KS:TopNav ID="TopNav1" runat="server"  />
      <asp:HiddenField ID="HidFSysAdmin" runat="server" />
      <table width="99%"  border="0" cellpadding="1" cellspacing="1" class="CTable"> 
          <tr>
            <td class="lefttd" height="30" align="right" style="width: 198px"><b>����Ա���ƣ�</b></td>
            <td class="righttd">
                &nbsp;<asp:TextBox CssClass="textbox" ID="UserName" runat="server" Width="144px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="UserName"
                    ErrorMessage="����д����Ա����!" Display="Dynamic"></asp:RequiredFieldValidator>
                <asp:Label ID="UserMessage" runat="server"></asp:Label></td>
          </tr>
          <tr>
              <td align="right" class="lefttd" height="30" style="width: 198px">
                  <strong>��¼���룺</strong></td>
              <td class="righttd">
                  &nbsp;<asp:TextBox CssClass="textbox" ID="PassWord" runat="server" Width="143px"></asp:TextBox>
                  <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="PassWord"
                      Display="Dynamic" ErrorMessage="����������!"></asp:RequiredFieldValidator>
                  <asp:Label ID="PassMessage" runat="server"></asp:Label></td>
          </tr>
          <tr>
              <td align="right" class="lefttd" height="30" style="width: 198px">
                  <strong>��ʵ������</strong></td>
              <td class="righttd">
                  &nbsp;<asp:TextBox CssClass="textbox" ID="RealName" runat="server"></asp:TextBox></td>
          </tr>
          <tr>
              <td align="right" class="lefttd" height="30" style="width: 198px">
                  <strong>��ϵ�绰��</strong></td>
              <td class="righttd">
                  &nbsp;<asp:TextBox CssClass="textbox" ID="Tel" runat="server"></asp:TextBox></td>
          </tr>
          <tr>
              <td align="right" class="lefttd" height="30" style="width: 198px">
                  <strong>����Ա���ͣ�</strong></td>
              <td class="righttd">
                  <asp:RadioButtonList ID="UserType" runat="server" RepeatDirection="Horizontal" AutoPostBack="True" OnSelectedIndexChanged="UserType_SelectedIndexChanged">
                      <asp:ListItem Value="1">��������Ա</asp:ListItem>
                      <asp:ListItem Selected="True" Value="0">��ͨ����Ա</asp:ListItem>
                  </asp:RadioButtonList></td>
          </tr>
          <tr id="docPowerPanel" runat="server">
              <td align="right" class="lefttd" height="30" style="width: 198px">
                  <strong>��ͨ����Ա���ݹ���Ȩ�ޣ�</strong></td>
              <td class="righttd">
                  <asp:RadioButtonList ID="RdbDocPower" runat="server" RepeatDirection="Vertical">
                      <asp:ListItem Value="1">ֻ�ܹ�����Ȩ����Ŀ�Լ���ӵ��ĵ�</asp:ListItem>
                      <asp:ListItem Selected="True" Value="0">��Ȩ����Ŀ���ĵ������Թ���(<span style="color:Red">�������Լ���ӵ��ĵ�,һ�����Ա��Ҫӵ�д�Ȩ��</span>)</asp:ListItem>
                  </asp:RadioButtonList></td>
          </tr>
          
          <tr>
              <td align="right" class="lefttd" height="30" style="width: 198px">
                  <strong>״ ̬��</strong></td>
              <td class="righttd">
                  <asp:RadioButtonList ID="Locked" runat="server" RepeatDirection="Horizontal">
                      <asp:ListItem Selected="True" Value="0">����</asp:ListItem>
                      <asp:ListItem Value="1">����</asp:ListItem>
                  </asp:RadioButtonList></td>
          </tr>
          <tr>
              <td align="right" class="lefttd" height="30" style="width: 198px">
                  <strong>��Ҫ˵����</strong></td>
              <td class="righttd">
                  &nbsp;<asp:TextBox CssClass="textbox" ID="Descript" runat="server" Height="89px" TextMode="MultiLine" Width="325px"></asp:TextBox></td>
          </tr>
       </table>
        <br />
        
        <asp:Panel ID="PowerPanel" runat="server" Width="100%">
      <table width="99%" border="0" cellpadding="1" cellspacing="1" class="CTable"> 
          <tr>
            <td class="righttd" style="text-align:center;height:28px"><b>����ԱȨ�޷�������</b></td>
          </tr>
      </table>
      <br />


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

           
                 //ajax������ĿȨ��
                 function classpurview(obj, username) {
                     jQuery.get("KS.Admin.Aspx", { action: "classpurview", check:obj.checked,username:username,classid:obj.value }, function(v) {
                        // alert(v);
                         //jQuery('#showresult').html(unescape(v));
                     });
                 }

                 function setAll(i,ii,flag){
                     $('#left-'+i+'-'+ii).find('input[name=classid]').attr('checked', flag);
                     var classid='';
                     $('#left-'+i+'-'+ii).find('input[name=classid]').each(function(){
                         classid+=","+$(this).val();
                     });
                     
                     jQuery.get("KS.Admin.Aspx", { action: "classpurview", check:flag,username:"<%=this.UserName.Text%>",classid:classid }, function(v) {
                         //jQuery('#showresult').html(unescape(v));
                     });

                 }
            </script>

            <%
            XmlDocument doc = new XmlDocument();
            doc.Load(Server.MapPath("~/config/managemenu.xml"));
            XmlNode nodes = doc.SelectSingleNode("managemenu");
            int i = 0;
            foreach (XmlNode topnode in nodes.ChildNodes) //�����˵�
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
                    <td class="righttd" style="font-size:14px;font-family:����;font-weight:bold"><label><%=UtilsAutoID.CapitalFigures(i) %>��<input onclick="TopToggle(this,<%=i %>);" type="checkbox" name="powerlist" value="<%=topnode.SelectSingleNode("@role").InnerText %>"<%if (Utils.InArray(topnode.SelectSingleNode("@role").InnerText, powerList, ",")) Response.Write(" checked"); %> />�˹���Ա�ڡ�<%=topnode.SelectSingleNode("@name").InnerText %>��ģ��Ȩ��</label></td>
                  </tr>
                   <tr  id="top<%=i %>"<%=(Utils.InArray(topnode.SelectSingleNode("@role").InnerText, powerList, ","))?string.Empty:" style='display:none';"%>>
                       <td style="padding-left:50px;">
                          
                           <%
                               
                int li = 0;

               #region ���ݼ�����ѡ��
                if (topnode.SelectSingleNode("@type") != null) 
                {
                    if (topnode.SelectSingleNode("@type").InnerText == "content")
                    {
                        #region ���£�ͼƬ������ģ��
                        using (DataTable dt=MyCache.GetCacheModelTable()){
                          if (dt.Rows.Count > 0)
                          {
                              foreach (DataRow dr in dt.Rows)
                              {
                                  if (dr["basictype"].ToString()!="4")
                                  {
                                 %>
                               <table width="100%" border="0" cellpadding="1" cellspacing="1"> 
                                  <tr>
                                    <td style="height:28px"><label><%=UtilsAutoID.ToNum1(li) %>��<input onclick="LeftToggle(this,<%=i%>,<%=li %>);" type="checkbox" name="powerlist" value="<%=dr["modelfolder"].ToString().ToLower() %>" <%if (Utils.InArray(dr["modelfolder"].ToString().ToLower(), powerList, ",")) Response.Write(" checked"); %>/>��<%=dr["modelname"].ToString() %>��</label></td>
                                  </tr>
                                  <tr  id="left-<%=i %>-<%=li %>"<%=(Utils.InArray(dr["modelfolder"].ToString().ToLower(), powerList, ","))?string.Empty:" style='display:none';"%>>
                                      <td>
                                          <ul class="poweritem">
                                              <label><input type="checkbox" name="powerlist" value="<%=dr["modelfolder"].ToString().ToLower() %>0" <%if (Utils.InArray(dr["modelfolder"].ToString().ToLower()+"0", powerList, ",")) Response.Write(" checked"); %>/>���</label>
                                              <label><input type="checkbox" name="powerlist" value="<%=dr["modelfolder"].ToString().ToLower() %>1" <%if (Utils.InArray(dr["modelfolder"].ToString().ToLower()+"1", powerList, ",")) Response.Write(" checked"); %>/>�༭</label>
                                              <label><input type="checkbox" name="powerlist" value="<%=dr["modelfolder"].ToString().ToLower() %>2" <%if (Utils.InArray(dr["modelfolder"].ToString().ToLower()+"2", powerList, ",")) Response.Write(" checked"); %>/>ɾ��</label>
                                              <label><input type="checkbox" name="powerlist" value="<%=dr["modelfolder"].ToString().ToLower() %>3" <%if (Utils.InArray(dr["modelfolder"].ToString().ToLower()+"3", powerList, ",")) Response.Write(" checked"); %>/>���</label>
                                              <label><input type="checkbox" name="powerlist" value="<%=dr["modelfolder"].ToString().ToLower() %>4" <%if (Utils.InArray(dr["modelfolder"].ToString().ToLower()+"4", powerList, ",")) Response.Write(" checked"); %>/>��¡</label>
                                              <label><input type="checkbox" name="powerlist" value="<%=dr["modelfolder"].ToString().ToLower() %>5" <%if (Utils.InArray(dr["modelfolder"].ToString().ToLower()+"5", powerList, ",")) Response.Write(" checked"); %>/>����ר��</label>
                                              <label><input type="checkbox" name="powerlist" value="<%=dr["modelfolder"].ToString().ToLower() %>6" <%if (Utils.InArray(dr["modelfolder"].ToString().ToLower()+"6", powerList, ",")) Response.Write(" checked"); %>/>�����ϴ�</label>
                                              <br />

                                              <strong>��ϸָ����ĿȨ��</strong>
                                                <input type="button" value="ȫѡ" class="button" onclick="setAll(<%=i %>,<%=li%>,true)"/>
                                                <input type="button" value="��ѡ" class="button" onclick="setAll(<%=i %>,<%=li%>,false)"/>

                                                  <div style="border: 5px solid #E7E7E7;height:250px; overflow: auto; width:90%;"> 
                                                        <%= GetClassList(Utils.StrToInt(dr["channelid"].ToString())) %>
                                                 </div>
                                          </ul>
                                      </td>
                                  </tr>
                               </table>

                                 <% 
                                  li++;
                                  }
                              }
                          }
                        }
                        #endregion
                    }
                    else if (topnode.SelectSingleNode("@type").InnerText == "shop")
                    {
                       #region �̳�ģ��
                        using (DataTable dt=MyCache.GetCacheModelTable()){
                          if (dt.Rows.Count > 0)
                          {
                              foreach (DataRow dr in dt.Rows)
                              {
                                  if (dr["basictype"].ToString()=="4")
                                  {
                                 %>
                                <table width="100%" border="0" cellpadding="1" cellspacing="1"> 
                                  <tr>
                                    <td style="height:28px"><label><%=UtilsAutoID.ToNum1(li) %>��<input onclick="LeftToggle(this,<%=i%>,<%=li %>);" type="checkbox" name="powerlist" value="<%=dr["modelfolder"].ToString().ToLower() %>" <%if (Utils.InArray(dr["modelfolder"].ToString().ToLower(), powerList, ",")) Response.Write(" checked"); %>/>��<%=dr["modelname"].ToString() %>��</label></td>
                                  </tr>
                                  <tr  id="left-<%=i %>-<%=li %>"<%=(Utils.InArray(dr["modelfolder"].ToString().ToLower(), powerList, ","))?string.Empty:" style='display:none';"%>>
                                      <td>
                                          <ul class="poweritem">
                                              <label><input type="checkbox" name="powerlist" value="<%=dr["modelfolder"].ToString().ToLower() %>0" <%if (Utils.InArray(dr["modelfolder"].ToString().ToLower()+"0", powerList, ",")) Response.Write(" checked"); %>/>���</label>
                                              <label><input type="checkbox" name="powerlist" value="<%=dr["modelfolder"].ToString().ToLower() %>1" <%if (Utils.InArray(dr["modelfolder"].ToString().ToLower()+"1", powerList, ",")) Response.Write(" checked"); %>/>�༭</label>
                                              <label><input type="checkbox" name="powerlist" value="<%=dr["modelfolder"].ToString().ToLower() %>2" <%if (Utils.InArray(dr["modelfolder"].ToString().ToLower()+"2", powerList, ",")) Response.Write(" checked"); %>/>ɾ��</label>
                                              <label><input type="checkbox" name="powerlist" value="<%=dr["modelfolder"].ToString().ToLower() %>3" <%if (Utils.InArray(dr["modelfolder"].ToString().ToLower()+"3", powerList, ",")) Response.Write(" checked"); %>/>���</label>
                                              <label><input type="checkbox" name="powerlist" value="<%=dr["modelfolder"].ToString().ToLower() %>4" <%if (Utils.InArray(dr["modelfolder"].ToString().ToLower()+"4", powerList, ",")) Response.Write(" checked"); %>/>��¡</label>
                                              <label><input type="checkbox" name="powerlist" value="<%=dr["modelfolder"].ToString().ToLower() %>5" <%if (Utils.InArray(dr["modelfolder"].ToString().ToLower()+"5", powerList, ",")) Response.Write(" checked"); %>/>����Excel</label>
                                              <label><input type="checkbox" name="powerlist" value="<%=dr["modelfolder"].ToString().ToLower() %>6" <%if (Utils.InArray(dr["modelfolder"].ToString().ToLower()+"6", powerList, ",")) Response.Write(" checked"); %>/>�����ϴ�</label>

                                               <br />

                                              <strong>��ϸָ����ĿȨ��</strong>
                                                <input type="button" value="ȫѡ" class="button" onclick="setAll(<%=i %>,<%=li%>,true)"/>
                                                <input type="button" value="��ѡ" class="button" onclick="setAll(<%=i %>,<%=li%>,false)"/>

                                                  <div style="border: 5px solid #E7E7E7;height:250px; overflow: auto; width:90%;"> 
                                                        <%= GetClassList(Utils.StrToInt(dr["channelid"].ToString())) %>
                                                  </div>
                                          </ul>
                                      </td>
                                  </tr>
                               </table>

                                 <% 
                                      li++;
                                  }
                              }
                          }
                        }
                        #endregion

                        
                    }
                }
                #endregion     
                               
                               
                          foreach (XmlNode leftnode in topnode.SelectNodes("leftitem")) //���һ���˵�
                          {
                            %>
                            <table width="100%" border="0" cellpadding="1" cellspacing="1"> 
                              <tr>
                                <td style="height:28px"><label><%=UtilsAutoID.ToNum1(li) %>��<input onclick="LeftToggle(this,<%=i%>,<%=li %>);" type="checkbox" name="powerlist" value="<%=leftnode.SelectSingleNode("@role").InnerText %>"<%if (Utils.InArray(leftnode.SelectSingleNode("@role").InnerText, powerList, ",")) Response.Write(" checked"); %> />��<%=leftnode.SelectSingleNode("@name").InnerText %>��</label></td>
                              </tr>
                              <tr id="left-<%=i %>-<%=li %>"<%=(Utils.InArray(leftnode.SelectSingleNode("@role").InnerText, powerList, ","))?string.Empty:" style='display:none';"%>>
                                  <td>
                                      <ul class="poweritem">
                                    <%
                                   int itemnum = 0;
                                   foreach (XmlNode item in leftnode.SelectNodes("itemlist/item")) //��߶����˵�
                                    {
                                       string power = Kesion.BLL.KSSecurity.RemovePowerBadChar(item.SelectSingleNode("url").InnerText);
                                        if (item.SelectSingleNode("url").InnerText.ToLower().IndexOf("ks.shoporder.aspx") == -1)
                                       {
                                           Response.Write("<li>");
                                       }
                                       else
                                       {
                                           Response.Write("<div>");
                                       }
                                       Response.Write(string.Format(@"<label><input type='checkbox' name='powerlist' onclick=""ItemToggle(this,{3},{4},{5})"" value='{1}'{2}> {0}</label>", item.SelectSingleNode("name").InnerText, power, Utils.InArray(power, powerList, ",",true) ? " checked" : string.Empty, i, li, itemnum));
                                       if (item.SelectSingleNode("role") != null)
                                       {
                                           int itemno = 0;
                                           string role = item.SelectSingleNode("role").InnerText;
                                           Response.Write("<div class='tips' id='item-"+i+"-"+li+"-"+itemnum+"'"+(Utils.InArray(power, powerList, ",")?string.Empty:" style='display:none'")+">");
                                           foreach(string s in role.Split('|'))
                                           {
                                               Response.Write(string.Format(@"<label><input type='checkbox' name='powerlist' value='{1}'{2}/>{0}</label>", s, string.Concat(power, itemno), Utils.InArray(string.Concat(power, itemno), powerList, ",",true) ? " checked" : string.Empty));
                                               itemno++;
                                           }
                                           Response.Write("</div>");
                                       }
                                       if (item.SelectSingleNode("url").InnerText.ToLower().IndexOf("ks.shoporder.aspx") == -1)
                                       {
                                           Response.Write("</li>");
                                       }
                                       else
                                       {
                                           Response.Write("</div><div style='clear:both'></div>");
                                       }
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











      </asp:Panel>
      <br />        
        
        
        
        <KS:Foot ID="Foot1" runat="server" OnSubmit="Foot1_Submit" />
    </asp:Panel>
</asp:Content>

