<%@ Page Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.Admin_Form" Title="Untitled Page" Codebehind="KS.Form.aspx.cs" %>
<%@ Import Namespace="Kesion.BLL" %>
<asp:Content ID="Content1" ContentPlaceHolderID="KSContent" Runat="Server">
    <asp:Panel ID="listPanel" runat="server" Width="100%">
       <div id="manage_top" class="menu_top_fixed">
         <ul>
           <li id='p1'><asp:LinkButton ID="addsubject" runat="server" OnClick="addsubject_Click"><b></b>��ӱ�</asp:LinkButton></li>
           <li id='p5'><asp:LinkButton ID="codesubject" runat="server" OnClick="codesubject_Click"><b></b>�������</asp:LinkButton></li>
           <li id='p7'><asp:LinkButton ID="delsubject" runat="server" OnClick="delsubject_Click"><b></b>�ύ��¼</asp:LinkButton></li></ul>
        </div>  
        <div class="menu_top_fixed_height"></div>  
        <KS:KSGV ID="list" cssclass="CTable" runat="server" EmptyDataText="û����ӱ���Ŀ" GridLines="None"
            OnRowDataBound="KSGV1_RowDataBound" PagerType="CustomNumeric" Width="99%" AutoGenerateColumns="False" OnRowCommand="list_RowCommand" OnRowCreated="list_RowCreated">
            <EmptyDataRowStyle CssClass="emptycss" />
            <Columns>
                <asp:BoundField DataField="FormID" HeaderText="����ID">
                    <itemstyle horizontalalign="Center" width="50px" />
                </asp:BoundField>
           <asp:TemplateField HeaderText="״̬">
              <itemstyle width="30px" horizontalalign="Center"/>
              <itemtemplate>
                   <a href="?action=status&formid=<%#Eval("formid")%>" <%# Convert.ToString(Eval("status"))=="0"?"class='no' title='����'":"class='ok' title='����'" %>></a>
              </itemtemplate>
            </asp:TemplateField>
                <asp:BoundField DataField="subject" HeaderText="������" />
                <asp:TemplateField HeaderText="��ʼ����/��������">
                    <itemstyle width="160px" horizontalalign="center" />
                    <itemtemplate>
                    <span class="tips">
                     <%# GetTimeStr(Convert.ToString(Eval("begindate")),Convert.ToString(Eval("expiredate")),Convert.ToInt32(Eval("timelimit"))) %>
                    <asp:Label runat="server" id="Label1"></asp:Label>
                    </span>
                    </itemtemplate>
                </asp:TemplateField>

            <asp:TemplateField HeaderText="IP����">
              <itemstyle width="40px" horizontalalign="Center"/>
              <itemtemplate>
                   <a href="?action=limitip&formid=<%#Eval("formid")%>" <%# Convert.ToString(Eval("limitip"))=="0"?"class='no' title='��'":"class='ok' title='��'" %>></a>
              </itemtemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="��Ա����">
              <itemstyle width="50px" horizontalalign="Center"/>
              <itemtemplate>
                   <a href="?action=usertf&formid=<%#Eval("formid")%>" <%# Convert.ToString(Eval("usertf"))=="0"?"class='no' title='��'":"class='ok' title='��'" %>></a>
              </itemtemplate>
            </asp:TemplateField>
            
                <asp:TemplateField HeaderText="������">
                <itemstyle width="70px" horizontalalign="Center" />
                     <itemtemplate>
                     <asp:LinkButton runat="server" commandargument=<%#Eval("formid") %> commandname="additem"><b>���</b></asp:LinkButton>
                     <asp:LinkButton runat="server" commandargument=<%#Eval("formid") %> commandname="itemlist"><b>�б�</b></asp:LinkButton>
               ��</itemtemplate>
            ����</asp:TemplateField>

            <asp:TemplateField HeaderText="��Html������">
                <itemstyle width="90px" horizontalalign="Center" />
                     <itemtemplate>
                     <asp:LinkButton runat="server" commandargument=<%#Eval("formid") %> commandname="create">����</asp:LinkButton>
                     <asp:LinkButton runat="server" id="code" commandargument=<%#Eval("formid") %> commandname="code">����</asp:LinkButton>
                     <asp:LinkButton runat="server" id="preview" commandargument=<%#Eval("formid") %> commandname="preview">Ԥ��</asp:LinkButton>
              </itemtemplate>
            </asp:TemplateField>
            
             <asp:TemplateField HeaderText="�༭">
              <itemstyle width="30px" horizontalalign="Center"/>
              <itemtemplate>
                     <asp:LinkButton ToolTip="�༭" CssClass="edit" ID="LinkButton1" runat="server" commandargument=<%#Eval("formid") %> commandname="modify"></asp:LinkButton>
              </itemtemplate>
            </asp:TemplateField>

             <asp:TemplateField HeaderText="ɾ��">
              <itemstyle width="30px" horizontalalign="Center"/>
              <itemtemplate>
                     <asp:LinkButton ToolTip="ɾ��" CssClass="delete" runat="server" id="delete" commandargument=<%#Eval("formid") %> commandname="del"></asp:LinkButton>
              </itemtemplate>
            </asp:TemplateField>
             <asp:TemplateField HeaderText="�鿴">
                <itemstyle width="30px" horizontalalign="Center" />
                     <itemtemplate>
                     <asp:LinkButton runat="server" ToolTip="�鿴�ύ��¼" CssClass="preview" id="viewrecord" commandargument=<%#Eval("formid") %> commandname="viewrecord"></asp:LinkButton>
              </itemtemplate>
            </asp:TemplateField>
            
            </Columns>
            <HeaderStyle CssClass="CTitle" />
        </KS:KSGV>
        
        
       <KS:Page ID="Page1" runat="server" />

    </asp:Panel>
    
    
    <asp:Panel ID="addPanel" runat="server" Width="100%" Visible="false">
     <KS:TopNav runat="server" ID="top1" Text="��ӱ���Ŀ" />


     <div class="tab-page" id="FormPanel">
         <script type="text/javascript">
             var tabPane1 = new WebFXTabPane(document.getElementById("FormPanel"), 1)
         </script>
             
		 <div class="tab-page" id="tab0">
		  <h2 class="tab">������Ϣ</h2>
			<script type="text/javascript">
			    tabPane1.addTabPage(document.getElementById("tab0"));
			</script>

     <table width="100%"  border="0" cellpadding="1" cellspacing="1" class="CTable"> 
          <tr>
            <td class="lefttd" height="30" align="right" style="width: 198px"><b>��Ŀ���ƣ�</b></td>
            <td class="righttd">
                &nbsp;<asp:TextBox CssClass="textbox" ID="Subject" runat="server" Width="350px"></asp:TextBox>
                 <span class="tips">�磺���߱�����</span><asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="Subject"
                    ErrorMessage="����д��Ŀ����!" Display="Dynamic"></asp:RequiredFieldValidator></td>
          </tr>
         <tr>
             <td align="right" class="lefttd" height="30" style="width: 198px">
                 <strong>����ʱ�����ƣ�</strong></td>
             <td class="righttd">
              <input type="radio" id="TimeLimitTrue" name="TimeLimit" onclick="jQuery('#TimeArea').show();" runat="server" value="1" />����
              <input type="radio" id="TimeLimitFalse" checked name="TimeLimit" onclick="jQuery('#TimeArea').hide();" runat="server" value="0" />������
              
             </td>
         </tr>
         <tbody id="TimeArea" style="display:none">
         <tr>
             <td align="right" class="lefttd" height="30" style="width: 198px">
             <strong>��Чʱ�䣺</strong>
             </td>
             <td class="righttd"><script>isHour=1;</script>
               <asp:TextBox CssClass="textbox Wdate" ID="BeginDate" runat="server" onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'});"></asp:TextBox>
                <div style="color:Red">���ڸ�ʽ��0000-00-00 00:00:00</div>
             </td>
         </tr>
         <tr>
             <td align="right" class="lefttd" height="30" style="width: 198px">
             <strong>ʧЧʱ�䣺</strong>
             </td>
             <td class="righttd">
                    <asp:TextBox CssClass="textbox Wdate" ID="ExpireDate" runat="server"  onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'});"></asp:TextBox>
                    <div style="color:Red">���ڸ�ʽ��0000-00-00 00:00:00</div>
             </td>
         </tr>
         </tbody>
          <tr>
             <td align="right" class="lefttd" height="30" style="width: 198px">
                 <strong>���÷�ʽ��</strong></td>
             <td class="righttd">
              <input type="radio" name="CodeType" id="CodeJavascript" runat="server" onclick="jQuery('#templatearea').hide();" value="1" checked />JavaScript����
              <input type="radio" name="CodeType" id="CodePages" runat="server" value="2" onclick="jQuery('#templatearea').show();" />����ҳ�����
             </td>
         </tr>
         <tbody id="templatearea" style="display:none">
            <tr>
             <td align="right" class="lefttd" height="30" style="width: 198px">
                 <strong>ģ���ļ���</strong></td>
             <td class="righttd">
              <asp:TextBox CssClass="textbox" ID="FormTemplate" runat="server" Width="297px"></asp:TextBox>
              <input type="button" class="button" onMouseOver="this.className='button_on';" onMouseOut="this.className='button';" value="ѡ��ģ��..." onClick="SelectTemplate('<%=this.FormTemplate.ClientID %>');"/>
            <br /> <span class="tips">ģ������ñ�ǩ��{$FormContent}�����ݣ�{$FormName}�����ƣ�{$FormBeginDate}��ʼʱ��,{$FormExpireDate}����ʱ�䡣</span>
             </td>
         </tr>

         </tbody>
         <tr>
             <td align="right" class="lefttd" height="30" style="width: 198px">
                 <strong>�����ļ�����</strong><br /><font color=red>һ���趨�����޸�</font></td>
             <td class="righttd">
                 <asp:TextBox CssClass="textbox" ID="FileName" runat="server"></asp:TextBox>
                <span class="tips">��:200710102.html,kesion.aspx�ȡ�</span></td>
         </tr>
         <tr>
             <td align="right" class="lefttd" height="30" style="width: 198px">
                 <div>
                     <strong>����ע��</strong></div>
             </td>
             <td class="righttd">
                 <asp:TextBox CssClass="textbox" ID="Descript" runat="server" Height="69px" TextMode="MultiLine" Width="352px"></asp:TextBox></td>
         </tr>
         <tr>
             <td align="right" class="lefttd" height="30" style="width: 198px">
                 <div>
                     <strong>�û��ύ�ɹ���ʾ��Ϣ��</strong></div>
             </td>
             <td class="righttd">
                 <asp:TextBox CssClass="textbox" ID="TxtSuccessTips" runat="server" Width="352px"></asp:TextBox>
                 <span class="tips">�磺��ϲ�������������ύ��</span>
                 </td>
         </tr>
         <tr>
             <td align="right" class="lefttd" height="30" style="width: 198px">
                 <div>
                     <strong>�û��ύ�ɹ�����URL��</strong></div>
             </td>
             <td class="righttd">
                 <asp:TextBox CssClass="textbox" ID="TxtSuccessUrl" runat="server" Width="352px"></asp:TextBox>
                 <span class="tips">�磺�������գ���������Ҫ��ת����URL��ַ��</span>
                 </td>
         </tr>
         <tr>
             <td align="right" class="lefttd" height="30" style="width: 198px">
                 <strong>��״̬��</strong></td>
             <td class="righttd">
                 <asp:RadioButtonList ID="Status" runat="server" RepeatDirection="Horizontal">
                     <asp:ListItem Selected="True" Value="1">����</asp:ListItem>
                     <asp:ListItem Value="0">����</asp:ListItem>
                 </asp:RadioButtonList></td>
         </tr>
    </table>
     </div>
	    
		 <div class="tab-page" id="tab1">
		  <h2 class="tab">Ȩ��ѡ��</h2>
			<script type="text/javascript">
			    tabPane1.addTabPage(document.getElementById("tab1"));
			</script>

      <table width="100%" border="0" cellpadding="1" cellspacing="1" class="CTable"> 
         <tr>
             <td align="right" class="lefttd" height="30" style="width: 198px">
                 <strong>ÿ��IPֻ���ύһ�Σ�</strong></td>
             <td class="righttd">
                 <asp:RadioButtonList ID="LimitIP" runat="server" RepeatDirection="Horizontal">
                     <asp:ListItem Selected="True" Value="1">��</asp:ListItem>
                     <asp:ListItem Value="0">��</asp:ListItem>
                 </asp:RadioButtonList></td>
         </tr>
         <tr>
             <td align="right" class="lefttd" height="30" style="width: 198px">
                 <div>
                     <strong>ֻ�����Ա�ύ��</strong></div>
             </td>
             <td class="righttd">
                 <asp:RadioButtonList ID="UserTF" runat="server" RepeatDirection="Horizontal">
                     <asp:ListItem Selected="True" Value="1">��</asp:ListItem>
                     <asp:ListItem Value="0">��</asp:ListItem>
                 </asp:RadioButtonList></td>
         </tr>
         <tr>
             <td align="right" class="lefttd" height="30" style="width: 198px">
                 <div>
                     <strong>���ϴ��ֶ�ʱ��ֻ�����Ա�ϴ���</strong></div>
             </td>
             <td class="righttd">
                 <asp:RadioButtonList ID="RdbUploadUserTF" runat="server" RepeatDirection="Horizontal">
                     <asp:ListItem Selected="True" Value="1">��</asp:ListItem>
                     <asp:ListItem Value="0">��</asp:ListItem>
                 </asp:RadioButtonList></td>
         </tr>
         
         <tr>
             <td align="right" class="lefttd" height="30" style="width: 198px">
                 <div>
                     <strong>�û������ƣ�</strong></div>
                 <font color="#ff0000">ֻ������ֻ�����Ա�ύ,����Ч���������ƣ��벻Ҫѡ</font></td>
             <td class="righttd" id="GroupIDArea" runat="server">
               
             </td>
         </tr>
         <tr>
             <td align="right" class="lefttd" height="30" style="width: 198px">
                 <div>
                     <strong>ÿ����Աֻ�����ύһ�Σ�</strong></div>
             </td>
             <td class="righttd">
                 <asp:RadioButtonList ID="UserOnce" runat="server" RepeatDirection="Horizontal">
                     <asp:ListItem Selected="True" Value="1">��</asp:ListItem>
                     <asp:ListItem Value="0">��</asp:ListItem>
                 </asp:RadioButtonList></td>
         </tr>
         <tr>
             <td align="right" class="lefttd" height="30" style="width: 198px">
                 <div>
                     <strong>�ύ������͵����䣺</strong></div>
             </td>
             <td class="righttd">
                 <asp:RadioButtonList ID="RdbIsSendMail" runat="server" RepeatDirection="Horizontal">
                     <asp:ListItem Selected="True" Value="0">�ر�</asp:ListItem>
                     <asp:ListItem Value="1">�����͵�����Ա����</asp:ListItem>
                     <asp:ListItem Value="2">�����͵���Ա����</asp:ListItem>
                     <asp:ListItem Value="3">ͬʱ���͵�����Ա�ͻ�Ա����</asp:ListItem>
                 </asp:RadioButtonList></td>
         </tr>
        <tr id="mail" style="display:none">
             <td align="right" class="lefttd" height="30" style="width: 198px">
                 <div>
                     <strong>���͵��ʼ�����ģ�壺</strong></div>
             </td>
             <td class="righttd">
                 <asp:TextBox ID="TxtMailTemplate" runat="server" Text="����,{$GetUserName}��<br />&nbsp;&nbsp;&nbsp;&nbsp;����������<span style='color:red'>{$GetSiteName}</span>�ύ[{$GetFormName}]����Ϣ:<br />{$GetFormDetail}" TextMode="MultiLine" style="width:78%;height:230px;"></asp:TextBox>

                  <%
                      Kesion.APPCode.EditorAPI.EchoEditor("editor", TxtMailTemplate.ClientID, "Basic", 0, false, true);    
                  %> 

                 
                 <br /><strong>���ñ�ǩ��</strong><br />
                 {$GetUserName} ��ǰ��¼�û���<br />
                 {$GetFormDetail} ���ύ������<br />
                 {$GetFormName} ������<br />
                 {$GetSiteName}  ��վ����<br />
                 {$GetSiteUrl} ��ַ����</td>
         </tr>
         <tr>
             <td align="right" class="lefttd" height="30" style="width: 198px">
                 <div>
                     <strong>��ʾ��֤�룺</strong></div>
             </td>
             <td class="righttd">
                 <asp:RadioButtonList ID="VerifyTF" runat="server" RepeatDirection="Horizontal">
                     <asp:ListItem Selected="True" Value="1">��</asp:ListItem>
                     <asp:ListItem Value="0">��</asp:ListItem>
                 </asp:RadioButtonList></td>
         </tr>
        
      </table>
      </div>
    </div>
    <script>
        function showMailTemplate() {
            var checkrad = jQuery("#<%=this.RdbIsSendMail.ClientID %> :radio[checked]").val();
            if (checkrad == "0") {
                jQuery("#mail").hide();
            } else {
                jQuery("#mail").show();
            }

        }
    </script>
      <br />
        <KS:Foot ID="Foot1" runat="server" SubmitButtonText="ȷ�����(0)" OnSubmit="Foot1_Submit" />
    </asp:Panel>
    
    <asp:Panel ID="viewPanel" runat="server" Width="100%" Visible="false">
        <KS:TopNav ID="TopNav1" runat="server" Text="Ԥ����" />
        <table width="100%" border="0" cellpadding="1" cellspacing="1" class="CTable"> 
          <tr>
            <td>
            <div id="showform" runat="server"></div>
            </td>
          </tr>
        </table>
        <br />
        <div style="text-align:center"><input class="button" onmouseover="this.className='button_on';" onmouseout="this.className='button';" type="button" onclick="javascript:history.back();" value="ȡ������" /></div>
        
        &nbsp;</asp:Panel>


</asp:Content>

