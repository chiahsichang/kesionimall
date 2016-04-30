<%@ Page Language="C#" ValidateRequest="false" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.Admin_UserMessage" Title="�����ʼ�" Codebehind="KS.UserMessage.aspx.cs" %>
<%@ Import Namespace="Kesion.BLL" %>
<asp:Content ID="Content1" ContentPlaceHolderID="KSContent" Runat="Server">

 <asp:Panel ID="Panel1" runat="server">
    
     <KS:TopNav ID="TopNav2" runat="server" Text="վ�ڶ���Ϣ����" />

  <div>
        <KS:KSGV ID="MessageView" cssclass="CTable" runat="server" AutoGenerateColumns="False" DataKeyNames="FieldID" GridLines="None"
            OnRowDataBound="FieldListView_RowDataBound" OnRowCommand="list_RowCommand" PagerType="CustomNumeric" Width="99%" EnableTheming="True" HorizontalAlign="Center" EmptyDataText="�Ҳ�������Ϣ���ͼ�¼!">
            <Columns>
                  <asp:TemplateField HeaderText="ѡ��">
                <itemstyle horizontalalign="Center" width="50px" />
                <itemtemplate>
                    <input type="checkbox"  name="ids" id="ids" value='<%#Eval("id") %>' />
                </itemtemplate>
              </asp:TemplateField>
              <asp:TemplateField HeaderText="����">
                <ItemTemplate>
                <span style="cursor:pointer" onmousedown='parent.openWin("�鿴����Ϣ����","user/KS.UserMessageShow.aspx?ID="+<%# Eval("ID") %>,false);return false;'><%# Eval("MsgTitle") %></span>
                </ItemTemplate>
              </asp:TemplateField>
               
                <asp:BoundField DataField="fromusername" HeaderText="������">
                  <itemstyle horizontalalign="Center" width="80px" />
                </asp:BoundField>
                <asp:BoundField DataField="tousername" HeaderText="������">
                  <itemstyle horizontalalign="Center" width="80px" />
                </asp:BoundField>

                <asp:BoundField DataField="adddate" HeaderText="����ʱ��">
                <itemstyle horizontalalign="Center" width="120px" />
                </asp:BoundField>
               <asp:TemplateField HeaderText="�Ѷ�">
                <itemstyle horizontalalign="Center" width="50px" />
                <itemtemplate>
                    <a href="javascript:;" <%# Convert.ToString(Eval("readtf"))=="1"?"class='ok' title='�Ѷ�'":"class='no' title='δ��'" %>></a>

                </itemtemplate>
               </asp:TemplateField>
            
            <asp:TemplateField HeaderText="�޸�">
              <itemstyle width="30px" horizontalalign="Center"/>
              <itemtemplate>
                      <asp:LinkButton CssClass="edit" ToolTip="�޸�" ID="LinkButton1" runat="server" commandargument=<%#Eval("id") %> commandname="modify"></asp:LinkButton>
              </itemtemplate>
            </asp:TemplateField>

                <asp:TemplateField HeaderText="ɾ��">
                <itemstyle width="30px" horizontalalign="Center"/>
                <itemtemplate>
                      <asp:LinkButton CssClass="delete" ToolTip="ɾ��" runat="server" id="delete" commandargument=<%#Eval("id") %> commandname="del"></asp:LinkButton>
               </itemtemplate>
                </asp:TemplateField>
            </Columns>
            <HeaderStyle CssClass="CTitle" />
            <EmptyDataRowStyle CssClass="emptycss" />
        </KS:KSGV>
        <asp:Panel ID="Panel3" runat="server" Height="30px">
              <div style="margin-top:5px;overflow:hidden;"></div>
            &nbsp;&nbsp;<input type="checkbox" name="chkall" id="chkall" onclick="CheckAll(this.form);"/><label for="chkall">ȫ��ѡ��</label>
            <input type="button" value="ɾ��ѡ�е���Ϣ" onmouseover="this.className='button_on';" onmouseout="this.className='button';" class="button" onclick="if (GetIDS('del')){this.form.action='?action=del';this.form.submit()}" id="Button1" />             <input type="button" value="����վ����Ϣ" onclick="location.href='KS.UserMessage.aspx?action=send';" class="button" />
</asp:Panel>  
        <br />

        </div>
        
          <KS:Page ID="Page1" runat="server" />
         <br />
         
         
    <div style="border:1px dashed #cccccc; background-color:#f0f9fe; margin-top:10px ;padding:10px; text-align: left; font-size: 12px;">
     <strong>�ر����ѣ�</strong> �������Ϣ���¼̫�࣬Ӱ����ϵͳ���ܣ�����ɾ��һ��ʱ���ǰ�ļ�¼�Լӿ��ٶȡ� 
     <div>
     <strong>ɾ����Χ��</strong><asp:RadioButtonList ID="RdbDelType" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow">
      <asp:ListItem Value="1">10��ǰ</asp:ListItem>
      <asp:ListItem Value="2">1����ǰ</asp:ListItem>
      <asp:ListItem Value="3">2����ǰ</asp:ListItem>
      <asp:ListItem Value="4">3����ǰ</asp:ListItem>
      <asp:ListItem Value="5">6����ǰ</asp:ListItem>
      <asp:ListItem Value="6" Selected>1��ǰ</asp:ListItem>
         </asp:RadioButtonList>
         
         <asp:CheckBox ID="chkReadTF" runat="server" Text="����δ������Ϣ" />
         <asp:Button ID="BtnDel" runat="server" Text="ִ��ɾ��" OnClick="BtnDel_Click" CssClass="button" /></div>
     </div>
         
        <script type="text/javascript">
            showtips('<span class="state"><strong>˵����</strong><br /></span>������Բ鿴վ�ڻ�Ա����Ϣ�������������������޸Ļ���ɾ����Ա����Ϣ����!');
		</script>
 
 </asp:Panel>
 
 <asp:Panel ID="Panel2" runat="server" Visible="false">

       <div id="manage_top" class="toptitle menu_top_fixed"><ul>
             <li id='p9'><b></b><a href='KS.UserMessage.aspx'>����</a></li> ����վ�ڶ���Ϣ</div>
        <div class="menu_top_fixed_height"></div> 


     <table width="100%" border="0" cellpadding="1" cellspacing="1" class="CTable"> 
          <tr>
            <td class="lefttd" height="30" align="right" style="width: 146px"><b>�ռ���ѡ��</b></td>
            <td class="righttd">
                <input type="radio" name="optype" onclick="jQuery('#grouparea').hide();" value="1" checked />���л�Ա(<span style="color:red"><%=DataFactory.GetOnlyValue("select count(1) From KS_User") %></span>λ)<br />
                <input type="radio" name="optype" onclick="jQuery('#grouparea').show();" value="2" />ָ����Ա��
                <br />
                <div id="grouparea" style="display:none">
                <%=BaseFun.GetUserGroup_CheckBox("groupid",4,"0") %>
                </div>
                <input type="radio" name="optype" onclick="jQuery('#grouparea').hide();" value="3" />ָ���û���<asp:TextBox ID="ToUserName" runat="server"
                    Width="246px" CssClass="textbox"></asp:TextBox>����û���������<font color="#0000ff">Ӣ�ĵĶ���</font>�ָ�</td>
          </tr>
         <tr>
             <td align="right" class="lefttd" height="30" style="width: 146px">
                 <strong>��Ϣ���⣺</strong></td>
             <td class="righttd">
                 <asp:TextBox CssClass="textbox" ID="Subject" runat="server" Width="500px"></asp:TextBox>
                 <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="��������Ϣ����" ControlToValidate="Subject"></asp:RequiredFieldValidator></td>
         </tr>
         <tr>
             <td align="right" class="lefttd" height="30" style="width: 146px">
                 <strong>��Ϣ���ݣ�</strong>
                 <div class="tips">
                 <strong>���ñ�ǩ��</strong><br />
                 {$UserName} -�û���<br />
                 {$RealName} -����<br />
                 {$Sex} -��������Ůʿ<br />
                 {$SiteName} -��վ����<br />
                 {$SendTime} -����ʱ��<br />
                 {$SendDate} -��������<br />
                 </div>

             </td>
             <td class="righttd">
                    <asp:TextBox ID="Content" TextMode="multiLine" style="width:95%;height:250px;" runat="server"></asp:TextBox>
                    <% Kesion.APPCode.EditorAPI.EchoEditor("editor", this.Content.ClientID, "Common");%>

             </td>
         </tr>
         <tr>
             <td align="right" class="lefttd" height="30" style="width: 146px">
                 <strong>�����ˣ�</strong></td>
             <td class="righttd">
                 ϵͳ��Ϣ</td>
         </tr>

        </table>
    <br />
    <KS:Foot ID="Foot1" runat="server" SubmitButtonText="��ʼ����(0)" OnSubmit="Foot1_Submit" />
  </asp:Panel>
  
  
   <asp:Panel ID="Panel4" runat="server" Visible="false">
    <KS:TopNav ID="TopNav3" runat="server" Text="�޸�վ�ڶ���Ϣ" />
     <table width="100%" border="0" cellpadding="1" cellspacing="1" class="CTable"> 
          <tr>
            <td class="lefttd" height="30" align="right" style="width: 146px"><b>�ռ��ˣ�</b></td>
            <td class="righttd">
            <asp:Label ID="LabToUser" runat="server"></asp:Label>
            </td>
          </tr>
          <tr>
            <td class="lefttd" height="30" align="right" style="width: 146px"><b>�����ˣ�</b></td>
            <td class="righttd">
            <asp:Label ID="LabFromUser" runat="server"></asp:Label>
            </td>
          </tr>
          <tr>
            <td class="lefttd" height="30" align="right" style="width: 146px"><b>����ʱ�䣺</b></td>
            <td class="righttd">
            <asp:Label ID="LabAddDate" runat="server"></asp:Label>
            </td>
          </tr>
         <tr>
             <td align="right" class="lefttd" height="30" style="width: 146px">
                 <strong>��Ϣ���⣺</strong></td>
             <td class="righttd">
                 <asp:TextBox ID="TxtMsgTitle" CssClass="textbox" runat="server" Width="308px"></asp:TextBox>
                 <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="��������Ϣ����" ControlToValidate="TxtMsgTitle"></asp:RequiredFieldValidator></td>
         </tr>
         <tr>
             <td align="right" class="lefttd" height="30" style="width: 146px">
                 <strong>��Ϣ���ݣ�</strong></td>
             <td class="righttd">
                   <asp:TextBox ID="TxtMsgContent" TextMode="multiLine" style="width:95%;height:250px;" runat="server"></asp:TextBox>
                    <% Kesion.APPCode.EditorAPI.EchoEditor("editor", this.TxtMsgContent.ClientID, "Common");%>

             </td>
         </tr>


        </table>
    <br />
    <asp:HiddenField ID="HidField" runat="server" Value="0" />
    <KS:Foot ID="Foot2" runat="server" SubmitButtonText="ȷ���޸�(0)" OnSubmit="Foot2_Submit" />
  </asp:Panel>
  
</asp:Content>

