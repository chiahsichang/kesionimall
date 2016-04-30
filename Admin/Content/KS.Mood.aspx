<%@ Page Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.Admin_Mood" Title="Untitled Page" Codebehind="KS.Mood.aspx.cs" %>
<%@ Import Namespace="Kesion.Cache"%>
<%@ Import Namespace="Kesion.Publics"%>
<asp:Content ID="Content1" ContentPlaceHolderID="KSContent" Runat="Server">
    <asp:Panel ID="listPanel" runat="server" Width="100%">
    <div id="manage_top" class="menu_top_fixed">
         <ul>
           <li id='p1'><asp:LinkButton ID="addMoodProjectBtn" runat="server" OnClick="addProject_Click"><b></b>�����Ŀ</asp:LinkButton></li>
           <li id='p4'><asp:LinkButton ID="editMoodProjectBtn" runat="server" OnClick="editMoodProject_Click"><b></b>�༭��Ŀ</asp:LinkButton></li>
           <li id='p3'><asp:LinkButton ID="delMoodProjectBtn" runat="server" OnClick="delMoodProject_Click"><b></b>ɾ����Ŀ</asp:LinkButton></li>
           </ul>
        </div>  
       <div class="menu_top_fixed_height"></div> 
      <KS:KSGV ID="list" cssclass="CTable" runat="server" AutoGenerateColumns="False" Width="99%" EmptyDataText="û������κ�����ָ����Ŀ" GridLines="None" OnRowDataBound="list_RowDataBound" OnRowCommand="list_RowCommand" OnRowCreated="list_RowCreated" AllowPaging="True">
          <Columns>
              <asp:TemplateField HeaderText="&lt;input type='checkbox' name='chkall' id='chkall' onClick='CheckAll(this.form);'/&gt;">
                <ItemStyle HorizontalAlign="Center"  Width="30px"/>
                <ItemTemplate>
                <input type="checkbox"  name="ids" id="ids" value="<%#Eval("projectid") %>" />
                </ItemTemplate>
                </asp:TemplateField>
             <asp:TemplateField HeaderText="��Ŀ����">
             <itemtemplate>
             <%# Eval("projectname") %>  <a href="javascript:void(0)" style="color:green" onclick="parent.openWin('�鿴��Ŀ[<%# Eval("projectname") %> ]ͶƱ����','Content/KS.MoodList.aspx?projectid=<%#Eval("projectid") %>',false,900,500)">�鿴����</a>
             </itemtemplate>
             </asp:TemplateField>

             <asp:TemplateField HeaderText="״̬">
              <itemstyle width="30px" horizontalalign="Center"/>
              <itemtemplate>
                   <a href="?action=status&id=<%#Eval("ProjectID")%>" <%# Convert.ToString(Eval("status"))=="0"?"class='no' title='����'":"class='ok' title='����'" %>></a>
              </itemtemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="�༭">
                    <itemstyle width="30px" horizontalalign="Center"/>
                       <itemtemplate>
                        <asp:LinkButton ID="LinkButton1" CssClass="edit" runat="server" commandargument=<%#Eval("projectid") %> commandname="modify" ToolTip="�޸�"></asp:LinkButton>
                    </itemtemplate>
                </asp:TemplateField>
            <asp:TemplateField HeaderText="ɾ��">
                    <itemstyle width="30px" horizontalalign="Center"/>
                       <itemtemplate>
             <asp:LinkButton runat="server" id="delete" CssClass="delete" commandargument=<%#Eval("projectid") %> commandname="del" ToolTip="ɾ��"></asp:LinkButton>
                    </itemtemplate>
                </asp:TemplateField>

            <asp:TemplateField HeaderText="���ƴ���">
                <itemstyle width="80px" horizontalalign="Center" />
             <itemtemplate>
           <input type="button" class="button" onclick="top.openWin('��������ָ�����ô���','content/KS.Mood.aspx?action=copy&id=<%#Eval("projectid") %>',false,500,200);" value="���ô���"/>
               </itemtemplate>
            </asp:TemplateField>
          </Columns>
            <HeaderStyle CssClass="CTitle" />
            <EmptyDataRowStyle CssClass="emptycss" />
      </KS:KSGV>
	
 
    
    <KS:Page ID="Page1" runat="server" />
           

    </asp:Panel>
    
     <asp:Panel ID="addPanel" runat="server" Width="100%" Visible="false">
     <KS:TopNav ID="TopNav1" runat="server" />
      <script type="text/javascript">
            jQuery(document).ready(function(){
             showTime();
            });
         function showTime() {
             var checkrad = jQuery("#<%=this.RdbTimeLimit.ClientID %> :radio[checked]").val();
             if (checkrad == "1") {
                 jQuery("#Stime").show();
             } else {
             jQuery("#Stime").hide();
             }

             
            }
          function CheckForm(){
           if (jQuery("#<%=this.TxtProjectName.ClientID%>").val()=="")
		      {
		       
               KesionJS.Alert('����������ָ����Ŀ���ƣ�','jQuery("#<%=this.TxtProjectName.ClientID%>").focus();'); 
		       return false;
		      }
		     return true;
          }
     </script>

     <div class="tab-page" id="MoodPanel">
         <script type="text/javascript">
           var tabPane1 = new WebFXTabPane( document.getElementById( "MoodPanel" ), 1 )
         </script>
             
		 <div class="tab-page" id="tab0">
		  <h2 class="tab">������Ϣ</h2>
			<script type="text/javascript">
						 tabPane1.addTabPage( document.getElementById( "tab0" ) );
			</script>

     
        <table width="100%" id="tab0" border="0" cellpadding="1" cellspacing="1" class="CTable"> 
          <tr>
            <td class="lefttd" height="30" align="right"><b>��Ŀ���ƣ�</b></td>
            <td class="righttd">
                &nbsp;<asp:TextBox CssClass="textbox" ID="TxtProjectName" runat="server" Width="450px"></asp:TextBox> <font color=#ff0000>*</font>
               <span class="tips">�磺����Ƶ��ר�õ�����</span></td>
          </tr>
            <tr>
                <td align="right" class="lefttd" height="30">
                    <strong>��Ŀ״̬��</strong></td>
                <td class="righttd">
                    <asp:RadioButtonList ID="RdbStatus" runat="server" RepeatDirection="Horizontal">
                        <asp:ListItem Selected="True" Value="1">����</asp:ListItem>
                        <asp:ListItem Value="0">����</asp:ListItem>
                    </asp:RadioButtonList></td>
            </tr>
            <tr>
                <td align="right" class="lefttd" height="30">
                    <strong>ѡ�</strong></td>
                <td class="righttd">
                
                <%
                    string[] projectArr = Utils.SplitString(projectContent, "@@@");
                    string nameValue = string.Empty;
                    string picValue = string.Empty;
                    for (int i = 1; i <=15; i++)
                    {
                        try
                        {
                            if (i <= projectArr.Length)
                            {
                                nameValue = projectArr[i - 1].Split('|')[0];
                                picValue = projectArr[i - 1].Split('|')[1];
                            }
                            else
                            {
                                nameValue = "";
                                picValue = "";
                            }
                        }
                        catch
                        {
                            nameValue = "";
                            picValue = "";
                        }

                        Response.Write(string.Format(@"{1}{0}������<input class='textbox' type='text' name='name{0}' size='12' value='{2}' /> ͼƬ��ַ<input type='text' class='textbox' name='pic{0}' size='12' value='{3}'/><br/>", i.ToString(), i.ToString().Length == 1 ? "0" : "", nameValue, picValue));
                    }
                 %>    
                </td>
            </tr>
            </table>
           </div>
           
        <div class="tab-page" id="tab1">
		  <h2 class="tab">ѡ������</h2>
			<script type="text/javascript">
						 tabPane1.addTabPage( document.getElementById( "tab1" ) );
			</script>

        <table width="100%" id="tab1" border="0" cellpadding="1" cellspacing="1" class="CTable"> 
            <tr>
                <td align="right" class="lefttd" height="30">
                    <strong>����ʱ�����ƣ�</strong></td>
                <td class="righttd">
                <asp:RadioButtonList ID="RdbTimeLimit" runat="server" RepeatDirection="Horizontal" onclick="showTime()">
                 <asp:ListItem Value="0" Selected="True">������</asp:ListItem>
                 <asp:ListItem Value="1">����</asp:ListItem>
                </asp:RadioButtonList>
                </td>
            </tr>
            <tbody id="Stime" style="display:none">
            <tr>
                <td align="right" class="lefttd" height="30">
                    <strong>��Чʱ�䣺</strong></td>
                <td class="righttd"><asp:TextBox CssClass="textbox" ID="TxtStartDate" runat="server" onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'});"/>
                <div style="color:Red">���ڸ�ʽ��0000-00-00 00:00:00</div>
                </td>
            </tr>
            <tr>
                <td align="right" class="lefttd" height="30">
                    <strong>ʧЧʱ�䣺</strong></td>
                <td class="righttd"><asp:TextBox CssClass="textbox" ID="TxtExpireDate" runat="server" onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'});"/>
                <div style="color:Red">���ڸ�ʽ��0000-00-00 00:00:00</div>
                </td>
            </tr>
            </tbody>
            <tr>
                <td align="right" class="lefttd" height="30">
                    <strong>ֻ�����Ա��̬��</strong></td>
                <td class="righttd">
                    <asp:RadioButtonList ID="RdbOnlyUser" runat="server" RepeatDirection="Horizontal">
                 <asp:ListItem Value="1" Selected="True">��</asp:ListItem>
                 <asp:ListItem Value="0">����</asp:ListItem>
                </asp:RadioButtonList></td>
            </tr>
            <tr>
                <td align="right" class="lefttd" height="30">
                    <strong>ÿ����Աֻ�ܱ�̬һ�Σ�</strong></td>
                <td class="righttd">
                    <asp:RadioButtonList ID="RdbUserOnce" runat="server" RepeatDirection="Horizontal">
                 <asp:ListItem Value="1" Selected="True">��</asp:ListItem>
                 <asp:ListItem Value="0">����</asp:ListItem>
                </asp:RadioButtonList></td>
            </tr>
            <tr>
                <td align="right" class="lefttd" height="30">
                    <strong>�û������ƣ�</strong>
                    <div style="color:Red">������,�벻Ҫ��ѡ</div>
                    </td>
                <td class="righttd">
                    <div id="GroupPanel" runat="server"></div>
                    
                </td>
            </tr>
       
        </table>
        </div>
     </div>
     
      <br />
      <div style="clear:both"></div>
      <br />
      <KS:Foot ID="Foot1" runat="server" OnSubmit="Foot1_Submit" />
    </asp:Panel>
    
    <asp:Panel Visible="false" ID="copyPannel" runat="server">
     <script type="text/javascript">
         function oCopy(obj) {

             obj.select(); js = obj.createTextRange();

             js.execCommand("Copy");

             alert("���븴�Ƴɹ�,��ֱ��ճ����Ҫ���õ�ģ����!");

         } 

     </script>
     <br />
     <table width="98%" align="center">
      <tr>
       <td></td>
       <td>tips:��˫����������򽫴��븴�Ƶ����а塣</td>
      </tr>
      <tr>
       <td width="100" align="right">���ô��룺</td>
       <td><asp:TextBox TextMode="MultiLine" Height="80px" CssClass="textbox" ondblclick="oCopy(this);" ID="TxtCode" runat="server" Width="350px" /></td>
      </tr>
      
     </table>
    </asp:Panel>

</asp:Content>

