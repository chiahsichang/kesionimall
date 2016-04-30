<%@ Page Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.Admin_WorkTableManage" Title="" Codebehind="KS.WorkTableManage.aspx.cs" %>
<%@ Import Namespace="System.Xml" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="Kesion.Publics" %>
<%@ Import Namespace="Kesion.Cache" %>

<asp:Content ID="Content1" ContentPlaceHolderID="KSContent" Runat="Server">
   
   <asp:Panel ID="ListPanel" runat="server" Width="100%">
    <script>
        function addWorkTable() {
            parent.openWin("��ӿ�ݼ����ҵĹ���̨", "System/KS.WorkTableManage.aspx?action=add", true, 820, 450);
        }
        function editWorkTable(id) {
            parent.openWin("�޸��ҵĹ���̨�Ŀ�ݼ�", "System/KS.WorkTableManage.aspx?action=modify&id=" + id, true, 820, 450);
        } 
    </script>
       <div id="manage_top" class="menu_top_fixed">
         <ul>
           <li id='p1'><a href="javascript:addWorkTable();"><b></b>���</a></li>
           <li id='p3'><asp:LinkButton ID="delclassbutton" runat="server" 
                   onclick="delclassbutton_Click"><b></b>ɾ��</asp:LinkButton></li>
          </ul>
        </div> 
        <div class="menu_top_fixed_height"></div>   

          <table width="99%" border="0" cellpadding="1" cellspacing="1" class="CTable">
              <tr class="CTitle">
               <td height="25" width="48" align="center"><input type="checkbox" name="chkall" id="chkall" onclick="CheckAll(this.form);"/></td>
               <td style="text-align:left"><b>��Ŀ����</b></td>
               <td style="text-align:left"><b>����URL</b></td>
               <td style="text-align:left"><b>����</b></td>
               <td style="text-align:center" width="50"><b>ICO</b></td>
              <td  width="68" align="center"><b>���</b></td>
               <td width="30" align="center"><b>�޸�</b></td>
               <td width="30" align="center"><b>ɾ��</b></td>
              </tr>
       
        <asp:Repeater ID="Repeater1" runat="server"  >
          <HeaderTemplate>
          </HeaderTemplate>
         <ItemTemplate>
         
            <tr class="tdbg" onclick="chk(this)"> 
            <td class="Ctd" width="50" nowrap="nowrap" align="center">
             <input type="checkbox"  name="ids" id="ids" value="<%#Eval("id") %>" />
			</td>
            
            <td class="Ctd"><%# Eval("ItemName") %></td>
            <td class="Ctd"><a href='<%# Convert.ToString(Eval("url")).Replace("{$AdminDir}",KSCMS.GetInstallDir()+MyCache.GetCacheConfig(4)+"/") %>' target="_blank"><%# Eval("Url") %></a></td>
            <td class="Ctd"><%# Eval("Intro") %></td>
            <td class="Ctd" style="text-align:center"><img src="<%# Eval("ico") %>" width="36" height="36" /></td>
			<td class="Ctd" nowrap="nowrap" align="center">
			 <%# Eval("orderid")%>
			</td>
            <td  class="Ctd" nowrap align="center">
			<a class="edit" title="�༭" href="javascript:;" onClick="editWorkTable(<%# Eval("id") %>);"></a>
			</td>

            <td  class="Ctd" nowrap align="center">
			<a class="delete" onClick="return(confirm('ȷ��ɾ���ÿ�ݼ���?'))" href="?action=delQuickMenu&ids=<%# Eval("id") %>" title="ɾ��"></a>
			</td>
          </tr>
           
             
         </ItemTemplate>
          <FooterTemplate>
               <tr class="tdbg" style="display:<%# bool.Parse((Repeater1.Items.Count==0).ToString())?"":"none"%>">
                <td class="Ctd" style="height:50px;text-align:center" colspan="7">
                  <a href="javascript:;" onclick="addWorkTable()">��û������κο�ݼ����ҵĹ���̨��������&raquo;</a>
                </td>
               </tr> 
           </table>

          </FooterTemplate>
        </asp:Repeater>
          </table>
       

         <KS:Page ID="Page1" runat="server" />
                <asp:Panel ID="Panel1" runat="server" Height="30px" Width="100%">
                <br />
                <script type="text/javascript">
                    showtips('<span class="state"><strong>����˵����</strong><br /></span>1���ڴ�ҳ�����������ӣ��޸Ļ���ɾ�����������̨��ҳ���ҵĹ���̨��<br/>2�����ӵ�ַ���ñ�ǩ{$AdminDir}�����̨����Ŀ¼����');
		        </script>

            </asp:Panel>
</asp:Panel>



 <asp:Panel ID="ModifyPanel" runat="server" Width="100%" Visible="false">
<script type="text/javascript">
    function checkform() {
        if (jQuery("#<%=this.TxtItemName.ClientID%>").val() == "") {
          KesionJS.Alert('��������Ŀ����!', "jQuery('#<%=this.TxtItemName.ClientID%>').focus();");
          return false;
      }

      if (jQuery("#<%=this.TxtIntro.ClientID%>").val() == "") {
          KesionJS.Alert('�������Ҫ����!', "jQuery('#<%=this.TxtIntro.ClientID%>').focus();");
          return false;
      }

      if (jQuery("#<%=this.TxtUrl.ClientID%>").val() == "") {
          KesionJS.Alert('�������������!', "jQuery('#<%=this.TxtUrl.ClientID%>').focus();");
          return false;
      }

      if (jQuery("#<%=this.TxtIco.ClientID%>").val() == "") {
          KesionJS.Alert('������Сͼ��·��!', "jQuery('#<%=this.TxtIco.ClientID%>').focus();");
          return false;
      }
      return true;
  }
  function getIco(v) {
      if (v != '') {
          jQuery("#<%=this.TxtIco.ClientID %>").val(v);
          jQuery("#img").attr("src", v);
      }
  }
    function getUrl() {
        var v = $("#selecturl").val();
        var text = $("#selecturl option:selected").text().replace(/\s+/g,"");  
       if (v != '') {
           jQuery("#<%=this.TxtUrl.ClientID %>").val(v);
           jQuery("#<%=this.TxtItemName.ClientID %>").val(text);
           jQuery("#<%=this.TxtIntro.ClientID %>").val(text);
       }
  }
</script>
    <table style="margin:6px" width="98%" cellpadding="1" cellspacing="1" class="CTable">
<tr>
            <td class="lefttd" style="height: 30px; text-align: right">
                <strong>�������ӣ�</strong></td>
            <td id="Td3" runat="server" class="righttd" style="height: 30px; text-align: left">
               <select name="selecturl" id="selecturl" style="width:350px" onchange="getUrl()">
                  <option value=''>--����ѡ��--</option>

                    <%
            XmlDocument doc = new XmlDocument();
            doc.Load(Server.MapPath("~/config/managemenu.xml"));
            XmlNode nodes = doc.SelectSingleNode("managemenu");
            int i = 0;
            foreach (XmlNode topnode in nodes.ChildNodes) //�����˵�
            {
                Response.Write(string.Format(@" <OPTGROUP label=""{0}""/> ", UtilsAutoID.CapitalFigures(i)+"��"+topnode.SelectSingleNode("@name").InnerText));

                if (topnode.SelectSingleNode("@type") != null)
                {
                    if (topnode.SelectSingleNode("@type").InnerText == "content")
                    {
                        using (DataTable dt = MyCache.GetCacheModelTable())
                        {
                            if (dt.Rows.Count > 0)
                            {
                                foreach (DataRow dr in dt.Rows)
                                {
                                    if (dr["basictype"].ToString() != "4")
                                    {
                                        Response.Write(string.Format(@" <OPTGROUP label=""&nbsp;&nbsp;&nbsp;&nbsp;{0}""/> ", dr["modelname"].ToString()));
                                        Response.Write(string.Format(@"<option value='{{$AdminDir}}Content/KS.ContentManage.aspx?channelid={0}'>&nbsp;&nbsp;&nbsp;&nbsp;����{1}</option>", dr["channelid"].ToString(), dr["modelitem"].ToString()));
                                         Response.Write(string.Format(@"<option value='{{$AdminDir}}Content/KS.Content.aspx?action=Add&ChannelID={0}'>&nbsp;&nbsp;&nbsp;&nbsp;����{1}</option>", dr["channelid"].ToString(), dr["modelitem"].ToString()));
                                          Response.Write(string.Format(@"<option value='{{$AdminDir}}Content/KS.ContentManage.aspx?showType=1&channelid={0}'>&nbsp;&nbsp;&nbsp;&nbsp;���{1}</option>", dr["channelid"].ToString(), dr["modelitem"].ToString()));
                                    }
                                }
                            }
                        }
                    }
                    else
                    {

                        using (DataTable dt = MyCache.GetCacheModelTable())
                        {
                            if (dt.Rows.Count > 0)
                            {
                                foreach (DataRow dr in dt.Rows)
                                {
                                    if (dr["basictype"].ToString() == "4")
                                    {
                                        Response.Write(string.Format(@" <OPTGROUP label=""&nbsp;&nbsp;&nbsp;&nbsp;{0}""/> ", dr["modelname"].ToString()));
                                        Response.Write(string.Format(@"<option value='{{$AdminDir}}Shop/KS.ShopManage.aspx?channelid={0}'>&nbsp;&nbsp;&nbsp;&nbsp;����{1}</option>", dr["channelid"].ToString(), dr["modelitem"].ToString()));
                                        Response.Write(string.Format(@"<option value='{{$AdminDir}}Shop/KS.Shop.aspx?action=Add&ChannelID={0}'>&nbsp;&nbsp;&nbsp;&nbsp;����{1}</option>", dr["channelid"].ToString(), dr["modelitem"].ToString()));
                                        Response.Write(string.Format(@"<option value='{{$AdminDir}}Shop/KS.ShopManage.aspx?channelid={0}'>&nbsp;&nbsp;&nbsp;&nbsp;���{1}</option>", dr["channelid"].ToString(), dr["modelitem"].ToString()));
                                    }
                                }
                            }
                        }
                        
                        
                        
                    }
                   
                }
                
                foreach (XmlNode leftnode in topnode.SelectNodes("leftitem")) //���һ���˵�
                {
                    Response.Write(string.Format(@" <OPTGROUP label=""&nbsp;&nbsp;&nbsp;&nbsp;{0}""/> ", leftnode.SelectSingleNode("@name").InnerText));
                    foreach (XmlNode item in leftnode.SelectNodes("itemlist/item")) //��߶����˵�
                    {
                        Response.Write(string.Format(@"<option value='{{$AdminDir}}{0}'>&nbsp;&nbsp;&nbsp;&nbsp;{1}</option>", item.SelectSingleNode("url").InnerText, item.SelectSingleNode("name").InnerText));
                    }
                }
                i++;
            } %>

                  
                </select>
                 <br /><span class="tips">�磺{$AdminDir}System/KS.Config.aspx</span>
                 <br />
                 <asp:TextBox  CssClass="textbox" ID="TxtUrl" runat="server" Width="350px"></asp:TextBox>
              
           </td>
        </tr>
             <tr>
            <td class="lefttd" style="height: 30px; text-align: right">
                <strong>��Ŀ���ƣ�</strong></td>
            <td id="Td1" runat="server" class="righttd" style="height: 30px; text-align: left">
               <asp:TextBox CssClass="textbox"  ID="TxtItemName" runat="server" Width="350px"></asp:TextBox> 
               <span class="tips">���鲻����10����</span>
               </td>
        </tr>
        <tr>
            <td class="lefttd" style="height: 30px; text-align: right">
                <strong>��Ҫ���ܣ�</strong></td>
            <td id="Td2" runat="server" class="righttd" style="height: 30px; text-align: left">
               <asp:TextBox  CssClass="textbox"  ID="TxtIntro" runat="server" Width="350px"></asp:TextBox>
                 <span class="tips">���鲻����30����</span>
           </td>
        </tr>
        
        <tr>
            <td class="lefttd" style="height: 30px; text-align: right">
                <strong>ICOСͼ�꣺</strong></td>
            <td id="Td4" runat="server" class="righttd" style="height: 30px; text-align: left">
               <asp:TextBox  CssClass="textbox" ID="TxtIco" runat="server" Width="126px"></asp:TextBox>
                 
                 <select name="selectIco" onchange="getIco(this.value)">
                  <option value=''>--����ѡ��--</option>
                  <%
                      for (int i = 1; i <= 12; i++)
                      {
                          Response.Write(string.Format("<option value='/sysimg/default/{0}.png'>{0}.png</optin>", i.ToString()));
                      }     
                  %>
                 </select>
                 <img src="../../sysimg/default/1.png" width="36" height="36" id="img" />
                 <br />
                 <span class="tips">ͼƬ��С��36*36</span>
           </td>
        </tr>
        <tr>
            <td class="lefttd" style="height: 30px; text-align: right">
                <strong>��ţ�</strong></td>
            <td id="Td5" runat="server" class="righttd" style="height: 30px; text-align: left">
               <asp:TextBox  CssClass="textbox" style="text-align:center" ID="TxtOrderID" runat="server" Width="50px"></asp:TextBox>
                 <span class="tips">ֵ��С����Խǰ�档</span>
           </td>
        </tr>
    
    </table>
       
     <div style="text-align:center;">
     <asp:HiddenField ID="HidID" runat="server" Value="0" />
     <asp:Button ID="Button1" CssClass="button" runat="server" OnClientClick="return(checkform())" Text="ȷ������(O)" AccessKey="O" OnClick="Button1_Click"/>
           <input type="button" class="button" onclick="javascript: parent.box.close();" accesskey="C" value="�ر�ȡ��(C)" /><br />
     </div>

     </asp:Panel>



</asp:Content>
