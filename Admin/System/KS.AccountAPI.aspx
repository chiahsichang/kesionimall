<%@ Page Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.Admin_AccountAPI" Title="Untitled Page" Codebehind="KS.AccountAPI.aspx.cs" %>
<%@ Import Namespace="System.Xml" %>
<%@ Import Namespace="Kesion.BLL" %>
<%@ Import Namespace="Kesion.Publics" %>
<%@ Import Namespace="Kesion.Cache" %>
<%@ Import Namespace="Newtonsoft.Json" %>
<%@ Import Namespace="Newtonsoft.Json.Linq" %>
<asp:Content ID="Content1" ContentPlaceHolderID="KSContent" Runat="Server">
    <asp:Panel ID="listPanel" runat="server" Width="100%">
       <KS:TopNav ID="TopNav2" runat="server" Text="�˺�ͨAPI&�罻Ӫ������" />


       <div class="tab-page" id="AccountPanel">
         <script type="text/javascript">
             var tabPane1 = new WebFXTabPane(document.getElementById("AccountPanel"), 1)
         </script>
             
		 <div class="tab-page" id="tab0">
		  <h2 class="tab">�˺�ͨAPI</h2>
			<script type="text/javascript">
			    tabPane1.addTabPage(document.getElementById("tab0"));
			</script>
       <table width="99%" border="0" cellpadding="1" cellspacing="1" class="CTable" style="border-bottom:none;"> 
            <tr>
               <td class="lefttd" align="right" style="width:98px"><b>�״ε�¼�Զ������˺Ų���¼��</b></td>
               <td class="righttd">
                   <asp:RadioButtonList ID="RdbApiAutoCreateUser" RepeatDirection="Horizontal" runat="server">
                    <asp:ListItem Value="1" Selected>����</asp:ListItem>
                    <asp:ListItem Value="0">������</asp:ListItem>
                   </asp:RadioButtonList>
                  <span class="tips">��������״ε�¼�Զ������˺ţ���ʡȥ���û��󶨵Ļ��ڣ����ᵼ���޷��ͻ�Աԭ�е��˺Ű�ͨ�ã������á�</span>                                      
                  </td>
             </tr>
            <tr>
               <td class="lefttd" align="right" style="width:98px"><b>Ĭ��ע��Ļ�Ա�û��飺</b></td>
               <td class="righttd">
                   <span id="groupidarea" runat="server"></span>                                
                  </td>
             </tr>
        </table>
       
        <KS:KSGV ID="list" cssclass="CTable" runat="server" Width="99%" AutoGenerateColumns="False" EmptyDataText="�����˺�ͨAPI!" GridLines="None" OnRowDataBound="list_RowDataBound" PagerType="CustomNumeric">
            <Columns>
             <asp:BoundField HeaderText="ID" DataField="ID">
                    <ItemStyle HorizontalAlign="Center" Width="40px" />
                </asp:BoundField>
            <asp:TemplateField HeaderText="����">
                <ItemStyle HorizontalAlign="Center" />
                <ItemTemplate>
              <asp:HiddenField ID="Hidenable" Value='<%# Eval("enable") %>' runat="server" />
              <asp:HiddenField ID="HidapplyUrl" Value='<%# Eval("applyurl") %>' runat="server" />

                 <asp:CheckBox ID="CkbEnable" runat="server" />
                 </ItemTemplate>
            </asp:TemplateField>  
                
                
            <asp:TemplateField HeaderText="�ӿ�����">
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
            <asp:TemplateField HeaderText="��¼�ɹ����ص�URL">
                <ItemStyle HorizontalAlign="Center" />
                <ItemTemplate>
                  <asp:TextBox CssClass="textbox" Width="180px" ID="TxtApiReturnUrl" Text='<%#Eval("apireturnurl") %>' runat="server"></asp:TextBox>
                 </ItemTemplate>
            </asp:TemplateField>  

            <asp:TemplateField HeaderText="����">
                       <itemstyle horizontalalign="Center" width="25"/>
                        <itemtemplate>
                           <a class="apply" href="<%# Eval("ApplyUrl") %>" title="����" target="_blank"></a>
                        </itemtemplate>
             </asp:TemplateField>
            
            </Columns>
           
            <PagerStyle CssClass="Page" HorizontalAlign="Right" />
            <HeaderStyle CssClass="CTitle" />
            <EmptyDataRowStyle CssClass="emptycss" />
      </KS:KSGV>
      
     <br />
     <asp:Panel ID="Panel1" runat="server" Height="30px" Width="739px">
            &nbsp;&nbsp;<asp:Button ID="Button1" CssClass="button" runat="server" Text="�����������ù���" 
                onclick="Button1_Click" />&nbsp;
      </asp:Panel>
     
     
        <br />
        <script type="text/javascript">
            showtips('<span class="state"><strong>˵����</strong><br /></span>����ӿڵ�ApiID��ApiKey��Ҫ����������վ��������뷽��ʹ�á�');
		</script>

    
    </div>

    <div class="tab-page" id="tab1">
		  <h2 class="tab">�罻Ӫ������</h2>
			<script type="text/javascript">
			    tabPane1.addTabPage(document.getElementById("tab1"));
			</script>

             <table width="99%" border="0" cellpadding="1" cellspacing="1" class="CTable" style="border-bottom:none;"> 
            <tr>
               <td class="lefttd" align="right" style="width:98px"><b>�����ĵ���ʾ�罻Ӫ��ѡ�</b></td>
               <td class="righttd">
                   <asp:RadioButtonList ID="RdbIsShowMarketing" AutoPostBack="true" RepeatDirection="Horizontal" 
                       runat="server" onselectedindexchanged="RdbIsMarketing_SelectedIndexChanged">
                    <asp:ListItem Value="1" Selected>��ʾ</asp:ListItem>
                    <asp:ListItem Value="0">����ʾ</asp:ListItem>
                   </asp:RadioButtonList>
                  </td>
             </tr>
    
        </table>

       <table id="showMarketing" runat="server" width="99%" border="0" cellpadding="1" cellspacing="1" class="CTable"> 
            <tr>
               <td class="lefttd" align="right" style="width:98px"><b>����΢��Ӫ����</b></td>
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
                             Response.Write("����΢���˺�ͨAPIû�п�����");
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
                                 Response.Write(@"״̬��<font color=red>δ��Ȩ������ȨʧЧ������<input type='button' onclick=""top.openWin('��¼����΢����ȡ��Ȩ��Ϣ','" + BaseFun.GetRewriteUrl("sinalogin") + @"?tokenfrom=admin',true)"" class='button' value='��¼��Ȩ'/>���»�ȡȨ�ޣ�</font>");
                             }
                             else
                             {
                                 Response.Write(@"״̬��<font color=green>�ѻ����Ȩ��</font><input type='button' onclick=""top.openWin('��¼����΢����ȡ��Ȩ��Ϣ','" + BaseFun.GetRewriteUrl("sinalogin") + @"?tokenfrom=admin',true)"" class='button' value='�л���Ȩ�˺�'/>");

                             }
                         }
                        
                     }

                     
                 %>
                 <br />
                  <span class="tips">��Ȩ�ɹ��󷢱���ĵ�(�����£���Ʒ���Ծ��)���Զ�ת��������΢��ƽ̨�ϡ�</span>                                      
                  </td>
             </tr>

              <tr>
               <td class="lefttd" align="right" style="width:98px"><b>��Ѷ΢��Ӫ����</b></td>
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
                             Response.Write("QQ��¼APIû�п�����");
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
                                 Response.Write(@"״̬��<font color=red>δ��Ȩ������ȨʧЧ������<input type='button' onclick=""top.openWin('��¼��Ѷ��ȡ��Ȩ��Ϣ','" + BaseFun.GetRewriteUrl("qqlogin") + @"?tokenfrom=admin',true)"" class='button' value='��¼��Ȩ'/>���»�ȡȨ�ޣ�</font>");
                             }
                             else
                             {
                                 Response.Write(@"״̬��<font color=green>�ѻ����Ȩ��</font><input type='button' onclick=""top.openWin('��¼��Ѷ��ȡ��Ȩ��Ϣ','" + BaseFun.GetRewriteUrl("qqlogin") + @""" class='button' value='�л���Ȩ�˺�'/>");

                             }
                         }
                        
                     }

                     
                 %>
                 <br />
                  <span class="tips">��Ȩ�ɹ��󷢱���ĵ�(�����£���Ʒ���Ծ��)���Զ�ת������Ѷ΢����QQ�ռ���־��QQ˵˵�����ƽ̨�ϡ�</span>                                      
                  </td>
             </tr>

      </table>


</div>
   
     </asp:Panel>

</asp:Content>

