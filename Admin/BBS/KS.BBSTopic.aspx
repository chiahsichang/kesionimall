<%@ Page Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.Admin_BBSTopic" Title="��̳�������" Codebehind="KS.BBSTopic.aspx.cs" %>
<%@ Import Namespace="Kesion.Cache" %>
<%@ Import Namespace="Kesion.Publics" %>
<%@ Import Namespace="Kesion.HtmlTags" %>
<asp:Content ID="Content1" ContentPlaceHolderID="KSContent" Runat="Server">
    <asp:Panel ID="ListPanel" runat="server" Width="100%">
      <div id="manage_top" class="menu_top_fixed">
         <ul>
           <span style="float:right;padding-right:10px">
              <select name="board" onchange="location.href='?boardId='+this.value;">
                  <option value="0">==������������==</option>
                  <%=MyCache.GetCacheBoardOption(Utils.StrToInt(KSCMS.S("boardId"))) %>
              </select>
           
          </span>
          <strong>��ǰλ�ã�</strong>
             <asp:Label ID="LabNav" runat="server"></asp:Label>
           </ul>
        </div> 
   <div class="menu_top_fixed_height"></div>   
   

        
       
 <div class="tabs_header">
    <ul class="tabs">
    <li<%=KSCMS.S("showType")==""?" class='active'":string.Empty %>>
        <a href="KS.BBSTopic.Aspx"><span>���л���</span></a></li>
    <li<%=KSCMS.S("showType")=="1"?" class='active'":string.Empty %>>
        <a href="KS.BBSTopic.Aspx?showType=1">
        <span>δ��˵Ļ���</span></a></li>
    <li<%=KSCMS.S("showType")=="2"?" class='active'":string.Empty %>>
        <a href="KS.BBSTopic.Aspx?showType=2">
        <span>����˵Ļ���</span></a></li>
    <li<%=KSCMS.S("showType")=="3"?" class='active'":string.Empty %>>
        <a href="KS.BBSTopic.Aspx?showType=3">
        <span>�ö��Ļ���</span></a></li>
    <li<%=KSCMS.S("showType")=="4"?" class='active'":string.Empty %>>
        <a href="KS.BBSTopic.Aspx?showType=4">
        <span>�����Ļ���</span></a></li>
    <li<%=KSCMS.S("showType")=="5"?" class='active'":string.Empty %>>
        <a href="KS.BBSTopic.Aspx?showType=5">
        <span>��ظ��Ļ���</span></a></li>

    </ul></div><KS:ksgv id="list" cssclass="CTable" runat="server" AutoGenerateColumns="False" 
            EmptyDataText="û���κλ���!" PagerType="CustomNumeric" Width="99%" 
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
                <itemtemplate> [<%# MyCache.GetCacheBBSCategory(Convert.ToInt32(Eval("boardId")), "boardname")%>]
                <a href="<%#BasicField.GetClubShowUrl(Utils.StrToInt(Eval("topicid"))) %>" target="_blank" ><%# Utils.CutStr(Convert.ToString(Eval("content")),80) %></a>
            </itemtemplate></asp:TemplateField>
                
                <asp:TemplateField HeaderText="�ظ�/���">
                <itemstyle horizontalalign="Center" />
                <itemtemplate>
                <%# Eval("PostNum") %>/<%# Eval("Hits") %>
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
                <%#Convert.ToString(Eval("isbest"))=="1"?"<font color=green>��</font>":"" %>
                <%#Convert.ToString(Eval("istop"))=="1"?"<font color=brown>��</font>":"" %></itemtemplate></asp:TemplateField>
               

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
             </asp:TemplateField></Columns><HeaderStyle CssClass="CTitle" />
        <EmptyDataRowStyle CssClass="emptycss" />
    </KS:ksgv>
    
        <asp:Panel ID="Panel2" runat="server" Height="30px">
          <div style="margin-top:8px"></div>
            &nbsp;&nbsp;<input type="checkbox" name="chkall" id="chkall" onclick="CheckAll(this.form);"/><label for="chkall">ȫ��ѡ��</label>
            
           &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="button" value="ɾ����¼" onmouseover="this.className='button_on';" onmouseout="this.className='button';" class="button" onclick="if (GetIDS('del')){this.form.action='?action=del';this.form.submit()}" />
           
            <asp:Button 
                ID="BtnVerify" runat="server" Text="�������" CssClass="button" 
                onclick="BtnVerify_Click"/> <asp:Button ID="BtnUnVerity" runat="server" CssClass="button" 
             Text="ȡ�����" onclick="BtnUnVerity_Click"/>
            
         <asp:Button ID="BtnIsBest" runat="server" Text="��Ϊ����" CssClass="button" 
            onclick="BtnIsBest_Click" />
        <asp:Button ID="BtnIsBest1" runat="server" CssClass="button" 
             Text="ȡ������" onclick="BtnIsBest1_Click" />

         <asp:Button ID="Button1" runat="server" Text="��Ϊ�ö�" CssClass="button" OnClick="Button1_Click"  />
         <asp:Button ID="Button3" runat="server" Text="��Ϊ���ö�" CssClass="button" OnClick="Button3_Click"  />
        <asp:Button ID="Button2" runat="server" CssClass="button"  Text="ȡ���ö�" OnClick="Button2_Click" />


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
    <KS:TopNav ID="TopNav1" runat="server" Text="�޸Ļ���" />
    
    <div class="tab-page" id="bbsPanel">
         <script type="text/javascript">
           var tabPane1 = new WebFXTabPane( document.getElementById( "bbsPanel" ), 1 )
         </script>
             
		 <div class="tab-page" id="tab0">
		  <h2 class="tab">������Ϣ</h2><script type="text/javascript">
						 tabPane1.addTabPage( document.getElementById( "tab0" ) );
			</script><table width="100%" border="0" cellpadding="1" cellspacing="1" class="CTable"> 
         <tr>
            <td align="right" class="lefttd" height="30" style="width: 102px">
                <strong>������棺</strong></td>
             <td class="righttd"><asp:Label ID="LabBoardId" runat="server"></asp:Label>
                <span class="tips">����ѡ�����ռ�����</span> 
              </td>
        </tr>
                    
         <tr>
            <td align="right" class="lefttd" height="30" style="width: 102px">
                <strong>������ܣ�</strong></td><td class="righttd">
                     <asp:TextBox ID="TxtIntro" runat="server" style="width:75%;height:200px;" TextMode="MultiLine"></asp:TextBox>
                 
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
            ��<a href='javascript:;' onclick='GetKeyTags()' style='color:green'>���ݻ��������Զ���ȡTags</a>��&nbsp;&nbsp;<font class='tips'>���tags���ÿո����</font>
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
                if (jQuery('#<%=this.TxtIntro.ClientID %>').val() == '') {
                    KesionJS.Alert('�������Ʊ�������!', "jQuery('#<%=this.TxtIntro.ClientID %>').focus()");
                    return false;
                }

                return true;
            }
        function GetKeyTags() {
            var text = escape(jQuery('#<%=this.TxtIntro.ClientID %>').val());
            if (text != '') {
                jQuery('#<%=this.TxtKeyTags.ClientID %>').val('���Ե�,ϵͳ�����Զ���ȡtags...').attr("disabled", true);
                jQuery.post("../../plus/ajaxs.ashx", { a: "GetTags", text: text },
				  function(data) { jQuery('#<%=this.TxtKeyTags.ClientID %>').val(unescape(data)).attr("disabled", false); });
            } else { KesionJS.Alert('�Բ���,�������뻰������!', "jQuery('#<%=this.TxtIntro.ClientID %>').focus();"); }
        }
    </script>
</asp:Content>
