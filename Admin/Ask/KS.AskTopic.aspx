<%@ Page Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.Admin_AskTopic" Title="�ʴ��������" Codebehind="KS.AskTopic.aspx.cs" %>
<%@ Import Namespace="Kesion.Cache" %>
<%@ Import Namespace="Kesion.Publics" %>
<asp:Content ID="Content1" ContentPlaceHolderID="KSContent" Runat="Server">
    <asp:Panel ID="ListPanel" runat="server" Width="100%">
      <div id="manage_top" class="menu_top_fixed">
         <ul>

             
           <span style="float:right;padding-right:10px">
            <asp:DropDownList ID="DrpClassID1" runat="server" onchange="location.href='?classid='+this.value;">
             <asp:ListItem Value="0">--������鿴--</asp:ListItem>
             </asp:DropDownList>
          </span>
          <strong>��ǰλ�ã�</strong>
             <asp:Label ID="LabNav" runat="server"></asp:Label>
           </ul>
        </div> 
   <div class="menu_top_fixed_height"></div>   
   

        
       
 <div class="tabs_header">
    <ul class="tabs">
    <li<%=KSCMS.S("showType")==""?" class='active'":string.Empty %>>
        <a href="KS.AskTopic.Aspx"><span>��������</span></a></li>
    <li<%=KSCMS.S("showType")=="1"?" class='active'":string.Empty %>>
        <a href="KS.AskTopic.Aspx?showType=1">
        <span>δ��˵�����</span></a></li>
    <li<%=KSCMS.S("showType")=="2"?" class='active'":string.Empty %>>
        <a href="KS.AskTopic.Aspx?showType=2">
        <span>����˵�����</span></a></li>
    <li<%=KSCMS.S("showType")=="3"?" class='active'":string.Empty %>>
        <a href="KS.AskTopic.Aspx?showType=3">
        <span>δ���������</span></a></li>
    <li<%=KSCMS.S("showType")=="4"?" class='active'":string.Empty %>>
        <a href="KS.AskTopic.Aspx?showType=4">
        <span>�ѽ��������</span></a></li>
    <li<%=KSCMS.S("showType")=="5"?" class='active'":string.Empty %>>
        <a href="KS.AskTopic.Aspx?showType=5">
        <span>������δ���������</span></a></li>
    <li<%=KSCMS.S("showType")=="6"?" class='active'":string.Empty %>>
        <a href="KS.AskTopic.Aspx?showType=6">
        <span>�������ѽ��������</span></a></li>
    </ul></div><KS:ksgv id="list" cssclass="CTable" runat="server" AutoGenerateColumns="False" 
            EmptyDataText="û���κ�����!" PagerType="CustomNumeric" Width="99%" 
            GridLines="None" OnRowCommand="List_RowCommand" 
            OnRowCreated="List_RowCreated" onrowdatabound="list_RowDataBound">
        <Columns>
         <asp:TemplateField HeaderText="ѡ��">
                <itemstyle horizontalalign="Center" Height="30px" width="30px" />
                <itemtemplate>
                <input type="checkbox"  name="ids" id="ids" value="<%#Eval("topicid") %>" /></itemtemplate></asp:TemplateField>
             <asp:BoundField HeaderText="ID��" DataField="TopicID" Visible="false">
                <itemstyle horizontalalign="Center" />
            </asp:BoundField>

             <asp:TemplateField HeaderText="״̬">
              <itemstyle width="30px" horizontalalign="Center"/>
              <itemtemplate>
                   <a href="?action=verify&ids=<%#Eval("topicID")%>" <%# Convert.ToString(Eval("verify"))=="0"?"class='no' title='δ���'":"class='ok' title='�����'" %>></a>
              </itemtemplate>
            </asp:TemplateField>
            
            <asp:TemplateField HeaderText="����">
                <itemtemplate><a href="../../<%=MyCache.GetAskCacheConfig(1) %>/Question.aspx?id=<%# Eval("topicid") %>" target="_blank"><span class="doc_1"></span></a>
                [<%# MyCache.GetCacheAskCategory(Convert.ToInt32(Eval("classid")), "classname")%>]
                <a href="../../<%=MyCache.GetAskCacheConfig(1) %>/Question.aspx?id=<%# Eval("topicid") %>" target="_blank" title="<%# Utils.RemoveHtml(Convert.ToString(Eval("Title"))) %>"><%# Utils.CutStr(Utils.RemoveHtml(Convert.ToString(Eval("title"))),30) %></a>
                <%# Convert.ToInt16(Eval("reward"))>0?"<img src='../../ask/images/money.gif' align='absmiddle'/><span style='color:red'>"+ Eval("reward")+"</span>��":string.Empty%></itemtemplate></asp:TemplateField>
                
                <asp:TemplateField HeaderText="�ش���">
                <itemstyle horizontalalign="Center" />
                <itemtemplate>
                <%# Eval("PostNum") %>
                </itemtemplate>
            </asp:TemplateField>
            <asp:BoundField HeaderText="������" DataField="username">
                <itemstyle verticalalign="Middle"  horizontalalign="Center"/>
            </asp:BoundField>
            <asp:BoundField HeaderText="����ʱ��" DataField="adddate">
                <itemstyle verticalalign="Middle"  horizontalalign="Center"/>
            </asp:BoundField>
            <asp:TemplateField HeaderText="��������">
                <itemstyle horizontalalign="Center" />
                <itemtemplate>
                <%#Convert.ToString(Eval("recommend"))=="1"?"<font color=green>��</font>":"" %>
                <%#Convert.ToString(Eval("istop"))=="1"?"<font color=brown>��</font>":"" %></itemtemplate></asp:TemplateField>
                <asp:TemplateField HeaderText="�Ƿ���">
               
                <itemstyle horizontalalign="Center" />
                <itemtemplate>
                <%#Convert.ToString(Eval("IsSolve")) == "1" ? "<span style='color:green'>�ѽ��</span>" : Convert.ToInt16(Eval("IsSolve"))==2?"�ѹر�":"<span style='color:red'>δ���</span>"%></itemtemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="�༭">
                       <itemstyle horizontalalign="Center" width="25px"/>
                        <itemtemplate>
                          <asp:LinkButton CssClass="edit" ToolTip="�༭" ID="LinkButton1" runat="server" commandargument=<%#Eval("topicid") %> commandname="modify"></asp:LinkButton>
                        </itemtemplate>
               </asp:TemplateField>
               <asp:TemplateField HeaderText="ɾ��">
                <itemstyle horizontalalign="Center" width="25px"/>
                 <itemtemplate>
                 <asp:LinkButton CssClass="delete" ToolTip="ɾ��" runat="server" id="delete" commandargument=<%#Eval("topicid") %> commandname="del"></asp:LinkButton></itemtemplate>
             </asp:TemplateField>

        </Columns><HeaderStyle CssClass="CTitle" />
        <EmptyDataRowStyle CssClass="emptycss" />
    </KS:ksgv>
    
        <asp:Panel ID="Panel2" runat="server" Height="30px" Width="741px">
          <div style="margin-top:8px"></div>
            &nbsp;&nbsp;<input type="checkbox" name="chkall" id="chkall" onclick="CheckAll(this.form);"/><label for="chkall">ȫ��ѡ��</label>
            
           &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="button" value="ɾ����¼" onmouseover="this.className='button_on';" onmouseout="this.className='button';" class="button" onclick="if (GetIDS('del')){this.form.action='?action=del';this.form.submit()}" />
           
            <asp:Button 
                ID="BtnVerify" runat="server" Text="�������" CssClass="button" 
                onclick="BtnVerify_Click"/> <asp:Button ID="BtnUnVerity" runat="server" CssClass="button" 
             Text="ȡ�����" onclick="BtnUnVerity_Click"/> <asp:Button ID="BtnRecommend" runat="server" Text="��Ϊ�Ƽ�" CssClass="button" 
            onclick="BtnRecommend_Click" />
        <asp:Button ID="BtnRecommend1" runat="server" CssClass="button" 
             Text="ȡ���Ƽ�" onclick="BtnRecommend1_Click" />
      </asp:Panel>
      
            
    <KS:Page ID="Page1" runat="server" />
    
    
     <div class="message">
<strong>�������⣺</strong><asp:TextBox runat="server" ID="TxtKeyWord" CssClass="textbox" /> 

    <asp:Button ID="BtnSearch" runat="server" CssClass="button" Text="��ʼ����" 
            onclick="BtnSearch_Click"  />
        </div>
    <asp:Panel ID="Panel1" runat="server" Height="30px" Width="100%">
      <br />
        <script type="text/javascript">
            showtips('<span class="state"><strong>�������Զ�Ӧ˵����</strong></span><font color=green>��</font>->�Ƽ�&nbsp;&nbsp;<font color=brown>��</font>->�̶�&nbsp;');
		</script>

            </asp:Panel>
</asp:Panel>


     
    <asp:Panel ID="AddPanel" runat="server"  Width="100%" Visible="false">
    <KS:TopNav ID="TopNav1" runat="server" Text="�޸�����" />
    
    <div class="tab-page" id="sjPanel">
         <script type="text/javascript">
           var tabPane1 = new WebFXTabPane( document.getElementById( "sjPanel" ), 1 )
         </script>
             
		 <div class="tab-page" id="tab0">
		  <h2 class="tab">������Ϣ</h2><script type="text/javascript">
						 tabPane1.addTabPage( document.getElementById( "tab0" ) );
			</script><table width="100%" align="center" border="0" cellpadding="1" cellspacing="1" class="CTable"> 
          <tr>
            <td class="lefttd" height="30" align="right" style="width: 102px"><b>�������ƣ�</b></td><td class="righttd">
                &nbsp;<asp:TextBox CssClass="textbox" ID="TxtTitle" runat="server" Width="335px"></asp:TextBox><asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TxtTitle"
                    ErrorMessage="����д��������!" Display="Dynamic"></asp:RequiredFieldValidator><span class="tips">�磨2013�����߿���ѧ����</span></td></tr><tr>
            <td align="right" class="lefttd" height="30" style="width: 102px">
                <strong>������ࣺ</strong></td><td class="righttd">
                &nbsp;
                
                <asp:DropDownList ID="DrpClassID" runat="server">
                    <asp:ListItem Value="0">--ѡ���������--</asp:ListItem></asp:DropDownList><span class="tips">����ѡ�����ռ�����</span> 
              </td>
        </tr>
                    
         <tr>
            <td align="right" class="lefttd" height="30" style="width: 102px">
                <strong>������ܣ�</strong></td><td class="righttd">
                     <asp:TextBox ID="TxtIntro" runat="server" style="width:90%;height:200px;" TextMode="MultiLine"></asp:TextBox>
                  <%
                      Kesion.APPCode.EditorAPI.EchoEditor("editor", TxtIntro.ClientID, "Basic", 0, false, true);    
                  %>  
                </td></tr>
             <tr>
            <td align="right" class="lefttd" height="30" style="width: 102px">
                <strong>����״̬��</strong></td><td class="righttd">
             <asp:RadioButtonList ID="RdbVerify" runat="server" Width="137px" 
                    RepeatDirection="Horizontal" Height="24px">
              <asp:ListItem Value="1" Selected="True">�����</asp:ListItem><asp:ListItem Value="0">δ���</asp:ListItem></asp:RadioButtonList></td></tr><tr>
            <td align="right" class="lefttd" height="30" style="width: 102px">
                <strong>�ؼ���Tags��</strong></td><td class="righttd">
             <asp:TextBox ID="TxtKeyTags" runat="server" CssClass="textbox" Width="300px" /> 
            ��<a href='javascript:;' onclick='GetKeyTags()' style='color:green'>�������������Զ���ȡTags</a>��&nbsp;&nbsp;<font class='tips'>���tags���ÿո����</font>
             </td>
        </tr>
        </table>
      </div>
      

      
      <div class="tab-page" id="tab1">
		  <h2 class="tab">SEOѡ��</h2><script type="text/javascript">
			    tabPane1.addTabPage(document.getElementById("tab1"));
			</script><table style="width:100%;margin:0 auto;" cellpadding="2" cellspacing="1" class="CTable">
     <tr>
       <td class="lefttd" align="right"><strong>ҳ����⣺</strong></td><td class="righttd">
          <asp:TextBox ID="TxtSeoTitle" runat="server" Width="400px"  CssClass="textbox" />
         <span class='tips'>������Ĭ����ʾ�������,ģ�������ñ�ǩ{KS:Field:SEOTitle}���á�</span>
        </td>
     </tr>
     <tr>
       <td class="lefttd" align="right"><strong>ҳ��ؼ��֣�</strong>(meta_keywords)</td><td class="righttd">
          <asp:TextBox TextMode="MultiLine" Rows="5" ID="TxtSeoKeyWords" runat="server" Width="400px"  CssClass="textbox textarea" Height="100px" />
         <span class='tips'>������Ĭ����ʾ���������õ�KeyWords,ģ�������ñ�ǩ{KS:Field:SEOKeyWords}���á�</span>
        </td>
     </tr>
     <tr>
       <td class="lefttd" align="right"><strong>ҳ��������</strong>(meta_description)</td><td class="righttd">
          <asp:TextBox TextMode="MultiLine" Rows="5" ID="TxtSeoDescription" runat="server" Width="400px"  CssClass="textbox textarea" Height="100px" />
         <span class='tips'>������Ĭ����ʾ������,ģ�������ñ�ǩ{KS:Field:SEODescription}���á�</span>
        </td>
     </tr>
    </table>
     </div>
      
      
   </div>
      <asp:Label ID="labsjinfo" runat="server"></asp:Label><div style="clear:both;text-align:center">
      <br />
        <KS:Foot ID="Foot1" runat="server" OnSubmit="Foot1_Submit" />
      
    </asp:Panel>
        <script>
            function CheckForm() {
                if (jQuery('#<%=this.TxtTitle.ClientID %>').val() == '') {
                    KesionJS.Alert('�������Ʊ�������!', "jQuery('#<%=this.TxtTitle.ClientID %>').focus()");
                    return false;
                }

                return true;
            }
        function GetKeyTags() {
            var text = escape(jQuery('#<%=this.TxtTitle.ClientID %>').val());
            if (text != '') {
                jQuery('#<%=this.TxtKeyTags.ClientID %>').val('���Ե�,ϵͳ�����Զ���ȡtags...').attr("disabled", true);
                jQuery.post("../../plus/ajaxs.ashx", { a: "GetTags", text: text },
				  function(data) { jQuery('#<%=this.TxtKeyTags.ClientID %>').val(unescape(data)).attr("disabled", false); });
            } else { KesionJS.Alert('�Բ���,����������������!', "jQuery('#<%=this.TxtTitle.ClientID %>').focus();"); }
        }
    </script>
</asp:Content>
