<%@ Page Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.Admin_Model" Title="ģ�͹���" Codebehind="KS.Model.aspx.cs" %>
<%@ Import Namespace="Kesion.Cache" %>
<%@ Import Namespace="Kesion.Publics" %>
<asp:Content ID="Content1" ContentPlaceHolderID="KSContent" Runat="Server">
      <asp:Panel ID="ModelListArea" runat="server" Width="100%">
       <div id="manage_top" class="menu_top_fixed">
       <ul>
        <li id='p1'><asp:HyperLink NavigateUrl="ks.model.aspx?action=add"  ID="addbutton" runat="server" Text="���ģ��"><b></b>���ģ��</asp:HyperLink></li>
        <li id='p2'><asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click"><b></b>��Ϣͳ��</asp:LinkButton></li><li id='p9'><asp:HyperLink ID="backbutton" NavigateUrl="KS.MODEL.ASPX"  Text="����һ��" runat="server" Enabled="False"><b></b>����һ��</asp:HyperLink></li>
        </ul>
        </div>     
       <div class="menu_top_fixed_height"></div> 
          <KS:OrderJS ID="OrderJS1" runat="server" />   
           <asp:GridView cssclass="CTable" ID="GridView1" runat="server" ForeColor="Black" GridLines="None" Width="99%" AutoGenerateColumns="False" EmptyDataText="û�н��κ�ģ��" OnRowDataBound="GridView1_RowDataBound" OnRowCreated="GridView1_RowCreated" OnRowCommand="GridView1_RowCommand">
               <Columns>
                 <asp:TemplateField HeaderText="����">
                    <itemstyle width="60px" horizontalalign="Center"  />
                    <headerstyle height="18px"/>
                    <itemtemplate>
                     <asp:DropDownList id="orderid" datasource="<%#bindorder() %>" runat="server"></asp:DropDownList>
                    </itemtemplate>
                </asp:TemplateField>

                <asp:BoundField DataField="channelid" HeaderText="ID" DataFormatString="{0}">
                    <itemstyle width="50px" HorizontalAlign="Center" />
                    <headerstyle width="50px"/>
                </asp:BoundField>
                 <asp:TemplateField HeaderText="״̬">
              <itemstyle width="30px" horizontalalign="Center"/>
              <itemtemplate>
                   <a href="?action=ModelStatus&channelid=<%#Eval("channelid")%>" <%# Convert.ToString(Eval("ModelStatus"))=="0"?"class='no' title='������'":"class='ok' title='����'" %>></a>
              </itemtemplate>
            </asp:TemplateField>

                <asp:BoundField HeaderText="ģ������" DataField="ModelName" FooterText="ModelName">
                    <ItemStyle HorizontalAlign="Center"  />
                </asp:BoundField>
                <asp:TemplateField HeaderText="���ݱ���" ShowHeader="False">
                    <itemstyle/>
                    <itemtemplate>
                    <span class="tips"><%# Eval("ModelTable") %></span>
                   </itemtemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="��Ŀ����" ShowHeader="False">
                    <itemstyle HorizontalAlign="Center"/>
                    <itemtemplate>
                    <span class="tips"><%# Eval("ModelItem")%></span>
                   </itemtemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="��Ŀ��λ" ShowHeader="False">
                    <itemstyle HorizontalAlign="Center"/>
                    <itemtemplate>
                    <span class="tips"><%# Eval("ModelItemUnit")%></span>
                   </itemtemplate>
                </asp:TemplateField>
                
                   <asp:TemplateField HeaderText="����">
                   <ItemStyle HorizontalAlign="Center" Width="50px" />
                   <ItemTemplate>
                    <%#GetModelType(Convert.ToInt16(Eval("ModelType","{0}"))) %>
                   </ItemTemplate>
                   </asp:TemplateField>


           <asp:TemplateField HeaderText="�༭">
              <itemstyle width="30px" horizontalalign="Center"/>
              <itemtemplate>
                        <asp:LinkButton ID="Edit" CssClass="edit" ToolTip="�༭" CommandArgument='<%#Eval("ChannelID","{0}")%>' CommandName='editmodel' runat="server"></asp:LinkButton>
              </itemtemplate>
            </asp:TemplateField>

           <asp:TemplateField HeaderText="ɾ��">
              <itemstyle width="30px" horizontalalign="Center"/>
              <itemtemplate>
                     <%# Convert.ToString(Eval("ModelType")).Equals("1")?"-":@"<a href=""javascript:;"" class=""delete"" onclick=""KesionJS.Confirm('ɾ��ģ�Ͳ����棬ȷ��ɾ����','location.href=\'"+KSCMS.GetInstallDir() + MyCache.GetCacheConfig(4) +@"/Model/KS.Model.aspx?action=del&channelid="+Eval("ChannelID","{0}")+@"\';','')"" title=""ɾ��ģ��""></a>" %>
              </itemtemplate>
            </asp:TemplateField>
           <asp:TemplateField HeaderText="��¡">
              <itemstyle width="30px" horizontalalign="Center"/>
              <itemtemplate>
                        <asp:LinkButton ID="CloneTemplate" CssClass="copy" ToolTip="��¡ģ��" CommandArgument='<%#Eval("ChannelID","{0}")%>' CommandName="clone" runat="server"></asp:LinkButton>
              </itemtemplate>
            </asp:TemplateField>

               
                <asp:TemplateField HeaderText="�ֶι���" ShowHeader="False">
                    <itemstyle width="70px" HorizontalAlign="Center" />
                    <itemtemplate>
                        <asp:LinkButton ID="FieldManage" ToolTip="�ֶι���" Text="�ֶι���" CommandArgument='<%#Eval("ChannelID","{0}")%>' CommandName='fieldmanage' runat="server"></asp:LinkButton>
                        <asp:LinkButton ID="ChangeStatus" Text="" CommandArgument='<%#Eval("ChannelID","{0}")%>' CommandName="status" runat="server"></asp:LinkButton>
                   </itemtemplate>
                </asp:TemplateField>
                   <asp:TemplateField HeaderText="Ԥ��">
                    <ItemStyle Width="30" HorizontalAlign="center" />
                    <ItemTemplate>
                        <asp:LinkButton ID="preview" Text="Ԥ��" CommandArgument='<%#Eval("ChannelID","{0}")%>' CommandName='preview' runat="server"></asp:LinkButton>
                    </ItemTemplate>
                   </asp:TemplateField>
            </Columns>
               <HeaderStyle CssClass="CTitle" />
               <PagerSettings NextPageText="��һҳ" PreviousPageText="��һҳ" />
               <EmptyDataRowStyle CssClass="emptycss" />
           </asp:GridView>
          <br />
          <asp:Button ID="BtnSaveOrder" Text="������������" runat="server" CssClass="button" OnClick="BtnSaveOrder_Click" />
       </asp:Panel>
       
       <asp:Panel ID="ModelAddlist" runat="server" Visible="false" Width="100%">
           <KS:TopNav ID="TopNav1" runat="server" Text="�����ģ��" />
         <br />
  <script type="text/javascript">
	  function ConvertPinYin(){
              var className=jQuery('#<%=this.ModelName.ClientID %>').val();
              jQuery.get("../../plus/ajaxs.ashx",{a:"convertclassname",classname:className},function(v){
                 jQuery('#<%=this.ModelTable.ClientID %>').val(unescape(v));
                  jQuery('#<%=this.ModelFolder.ClientID %>').val(unescape(v));
                  if (v==''){
                      jQuery('#<%=this.ModelFolder.ClientID %>').val("e"+className);
                  }
              });
       }

      function CheckForm(){
          if ($("#<%=this.ModelName.ClientID%>").val()==''){
              KesionJS.Alert('������ģ������!',"$('#<%=this.ModelName.ClientID%>').focus()");
              return false;
          }
          if ($("#<%=this.ModelFolder.ClientID%>").val()==''){
              KesionJS.Alert('������ģ��Ӣ������!',"$('#<%=this.ModelFolder.ClientID%>').focus()");
              return false;
          }
          if ($("#<%=this.ModelTable.ClientID%>").val()==''){
              KesionJS.Alert('������ģ�����ݱ�!',"$('#<%=this.ModelTable.ClientID%>').focus()");
              return false;
          }
          if ($("#<%=this.ModelItem.ClientID%>").val()==''){
              KesionJS.Alert('������ģ����Ŀ����!',"$('#<%=this.ModelItem.ClientID%>').focus()");
              return false;
          }
          if ($("#<%=this.ModelItemUnit.ClientID%>").val()==''){
              KesionJS.Alert('������ģ����Ŀ��λ!',"$('#<%=this.ModelItemUnit.ClientID%>').focus()");
              return false;
          }
          if ($("#<%=this.ModelItem.ClientID%>").val()==''){
              KesionJS.Alert('������ģ����Ŀ����!',"$('#<%=this.ModelItem.ClientID%>').focus()");
              return false;
          }
          if ($("#<%=this.ModelItem.ClientID%>").val()==''){
              KesionJS.Alert('������ģ����Ŀ����!',"$('#<%=this.ModelItem.ClientID%>').focus()");
              return false;
          }
          if ($("#<%=this.ModelItem.ClientID%>").val()==''){
              KesionJS.Alert('������ģ����Ŀ����!',"$('#<%=this.ModelItem.ClientID%>').focus()");
              return false;
          }
          if ($("#<%=this.ModelItem.ClientID%>").val()==''){
              KesionJS.Alert('������ģ����Ŀ����!',"$('#<%=this.ModelItem.ClientID%>').focus()");
              return false;
          }
          if ($("#<%=this.ModelItem.ClientID%>").val()==''){
              KesionJS.Alert('������ģ����Ŀ����!',"$('#<%=this.ModelItem.ClientID%>').focus()");
              return false;
          }
          return true;
      }
	</script>
	
	
	 <div class="tab-page" id="ModelSetPanel">
         <script type="text/javascript">
           var tabPane1 = new WebFXTabPane( document.getElementById( "ModelSetPanel" ), 1 )
         </script>
             
		 <div class="tab-page" id="tab0">
		  <h2 class="tab">��������</h2>
			<script type="text/javascript">
						 tabPane1.addTabPage( document.getElementById( "tab0" ) );
			</script>
			<table width="100%" border="0" cellpadding="1" cellspacing="1" class="CTable">
                   <tr>
                       <td align="right" class="lefttd">
                           <strong>ģ��״̬��</strong></td>
                       <td class="righttd">
                           <asp:RadioButtonList ID="ModelStatus" runat="server" RepeatDirection="Horizontal"
                               Width="125px">
                               <asp:ListItem Selected="True" Value="1">����</asp:ListItem>
                               <asp:ListItem Value="0">�ر�</asp:ListItem>
                           </asp:RadioButtonList>
                           
                           </td>
                   </tr>
                   <tr>
                       <td align="right" class="lefttd" >
                           <strong>ģ�����ƣ�</strong></td>
                       <td class="righttd">
                           <asp:TextBox CssClass="textbox" ID="ModelName" runat="server" Width="228px"></asp:TextBox><font color="#ff0000">*</font><span class="tips">�磺�˲�ϵͳ������ϵͳ�ȡ�</span></td>
                   </tr>
                   <tr id="Tr2" runat="server" style="display:none">
                       <td align="right" class="lefttd">
                           <strong>ģ��Ӣ�����ƣ�</strong></td>
                       <td  class="righttd">
                           <asp:TextBox CssClass="textbox" ID="ModelFolder" runat="server" onblur="CheckEnglishStr(this,'ģ��Ŀ¼����')" Width="101px"></asp:TextBox><span style="color: #ff0000">*</span>Ӣ�����ƣ�ֻ������ĸ�����ֵ����<asp:RequiredFieldValidator
                               ID="RequiredFieldValidator5" runat="server" ControlToValidate="ModelFolder" ErrorMessage="ģ��Ӣ�����Ʊ�������" Display="Dynamic"></asp:RequiredFieldValidator>
                           <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="ModelFolder"
                               Display="Dynamic" ErrorMessage="��������ĸ��ͷ����������ֻ���ĸ����ϣ�������3-10���ַ�֮��" ValidationExpression="[a-zA-Z]{1}[\d|(a-zA-Z)]{1,9}"></asp:RegularExpressionValidator></td>
                   </tr>
                   <tr>
                       <td align="right" class="lefttd">
                           <strong>���ݱ����ƣ�</strong></td>
                       <td class="righttd">
                           KS_U_<asp:TextBox CssClass="textbox" ID="ModelTable" runat="server" Width="109px"></asp:TextBox><span
                               style="color: #ff0000">*</span><asp:RequiredFieldValidator ID="RequiredFieldValidator2"
                                   runat="server" ControlToValidate="ModelTable" ErrorMessage="���ݱ����Ʊ�������" Display="Dynamic"></asp:RequiredFieldValidator>
                           <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="ModelTable"
                               ErrorMessage="��������ĸ��ͷ����������ֻ���ĸ����ϣ�������2-10���ַ�֮��" ValidationExpression="[a-zA-Z]{1}[\d|(a-zA-Z)]{1,9}"></asp:RegularExpressionValidator><br />
                           <span class="tips">˵�����������ݱ���޷��޸ģ������û����������ݱ���"KS_U_"��ͷ��</span></td>
                   </tr>
                   <tr id="LArea" runat="server">
                       <td align="right" class="lefttd">
                           <strong>��Ŀ���ƣ�</strong></td>
                       <td class="righttd">
                           <asp:TextBox CssClass="textbox" ID="ModelItem" Text="����" runat="server" Width="154px"></asp:TextBox><span style="color: #ff0000">*</span><span class="tips">�磺���¡�ͼƬ������ȡ�</span></td>
                   </tr>
                   <tr runat="server" id="Tr1">
                       <td align="right" class="lefttd">
                           <strong>��Ŀ��λ��</strong></td>
                       <td  class="righttd">
                           <asp:TextBox CssClass="textbox" ID="ModelItemUnit" style="text-align:center" runat="server" Text="ƪ" Width="53px"></asp:TextBox><span style="color: #ff0000">*</span><span class="tips">�磺ƪ���������ȡ�</span></td>
                   </tr>
                   
                       <tr>
                           <td align="right" class="lefttd">
                               <strong>�� �� �ͣ�</strong></td>
                           <td class="righttd">
                               <asp:DropDownList ID="BasicType" runat="server">
                                   <asp:ListItem Value="1">������</asp:ListItem>
                                   <asp:ListItem Value="2">ͼƬ��</asp:ListItem>
                                   <asp:ListItem Value="3">������</asp:ListItem>
                                   <asp:ListItem Value="4">�̳���</asp:ListItem>
                               </asp:DropDownList></td>
                       </tr>

            <tr>
                       <td align="right" class="lefttd">
                           <strong>ģ��˵����</strong></td>
                       <td class="righttd">
                           <asp:TextBox CssClass="textbox" ID="Intro" runat="server" Rows="5" width="350px" height="60px" Columns="45" TextMode="MultiLine"></asp:TextBox>
                       <a class="textarea_min" href="javascript:zoomtextarea(-2,'<%=this.Intro.ClientID %>');"> </a>
                       <a class="textarea_max" href="javascript:zoomtextarea(2,'<%=this.Intro.ClientID %>');"></a>  
                           </td>
                   </tr>
                   </table>
			
         </div>
         
         
         <div class="tab-page" id="tab2">
		  <h2 class="tab">ģ��ѡ��</h2>
			<script type="text/javascript">
						 tabPane1.addTabPage( document.getElementById( "tab2" ) );
			</script>
			<table width="100%" border="0" cellpadding="1" cellspacing="1" class="CTable">
                    <tr>
                           <td align="right" class="lefttd">
                               <strong>��ģ�����û���վ���ܣ�</strong></td>
                           <td class="righttd">
                               <asp:RadioButtonList ID="RdbRecycle" runat="server" RepeatDirection="Horizontal"
                               Width="125px">
                                   <asp:ListItem Value="1" Selected="True">����</asp:ListItem>
                                   <asp:ListItem Value="0">������</asp:ListItem>
                               </asp:RadioButtonList>
                             <span class="tips">���û���վ����ɾ���ĵ����������վ������ڻ���վ�л�ԭ��</span>  
                             </td>
                       </tr>
				     <tr>
                           <td align="right" class="lefttd">
                               <strong>�Ƿ�����SEOѡ�</strong></td>
                           <td class="righttd">
                               <asp:RadioButtonList ID="SeoOptions" runat="server" RepeatDirection="Horizontal"
                               Width="125px">
                                   <asp:ListItem Value="1" Selected="True">����</asp:ListItem>
                                   <asp:ListItem Value="0">������</asp:ListItem>
                               </asp:RadioButtonList></td>
                       </tr>
				      <tr>
                           <td align="right" class="lefttd">
                               <strong id="chargesInner" runat="server">�Ƿ������շ�ѡ�</strong></td>
                           <td class="righttd">
                               <asp:RadioButtonList ID="ChargesOptions" runat="server" RepeatDirection="Horizontal"
                               Width="125px">
                                   <asp:ListItem Value="1" Selected="True">����</asp:ListItem>
                                   <asp:ListItem Value="0">������</asp:ListItem>
                               </asp:RadioButtonList></td>
                       </tr>
                       <tbody id="showOptions" runat="server">
                       <tr>
                           <td align="right" class="lefttd">
                               <strong>�Ƿ���������ѡ�</strong></td>
                           <td class="righttd">
                               <asp:RadioButtonList ID="AttributeOptions" runat="server" RepeatDirection="Horizontal"
                               Width="125px">
                                   <asp:ListItem  Selected="True" Value="1">����</asp:ListItem>
                                   <asp:ListItem Value="0">������</asp:ListItem>
                               </asp:RadioButtonList></td>
                       </tr>
                       <tr>
                           <td align="right" class="lefttd">
                               <strong>�Ƿ�����ͶƱѡ�</strong></td>
                           <td class="righttd">
                               <asp:RadioButtonList ID="ReceiptOptions" runat="server" RepeatDirection="Horizontal"
                               Width="125px">
                                   <asp:ListItem Value="1" Selected="True">����</asp:ListItem>
                                   <asp:ListItem  Value="0">������</asp:ListItem>
                               </asp:RadioButtonList></td>
                       </tr>
                       <tr>
                           <td align="right" class="lefttd">
                               <strong>�Ƿ�����PKѡ�</strong></td>
                           <td class="righttd">
                               <asp:RadioButtonList ID="PKOptions" runat="server" RepeatDirection="Horizontal"
                               Width="125px">
                                   <asp:ListItem Value="1" Selected="True">����</asp:ListItem>
                                   <asp:ListItem  Value="0">������</asp:ListItem>
                               </asp:RadioButtonList></td>
                       </tr>
                       
                       </tbody> 
                      <tr>
                            <td align="right" class="lefttd">
                                <strong>¼������ѡ�</strong></td>
                            <td class="righttd">
                                <asp:CheckBoxList ID="CBLShowOption" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow">
                                    <asp:ListItem Value="1">����ǰ׺</asp:ListItem>
                                    <asp:ListItem Value="2">������ɫ</asp:ListItem>
                                    <asp:ListItem Value="3">�������</asp:ListItem>
                                    <asp:ListItem Value="4" Selected="True">��������</asp:ListItem>
                                    <asp:ListItem Value="5" Selected="True">�ϴ�����</asp:ListItem>
                                    <asp:ListItem Value="6" Selected="True">�����շ�</asp:ListItem>
                                    <asp:ListItem Value="7">��ҳ����</asp:ListItem>
                                    <asp:ListItem Value="8" Selected="True">�Զ���ȡ���</asp:ListItem>
                                    <asp:ListItem Value="9" Selected="True">�Զ������������ͼƬ</asp:ListItem>
                                </asp:CheckBoxList>

                            </td>
                        </tr>
                     <tr>
                         <td align="right" class="lefttd">
                             <strong>����(DIGG)ѡ�</strong></td>
                         <td class="righttd">
                           <table border=0 width="85%">
                            <tr>
                             <td style="width: 148px; height: 19px; text-align: right">
                                 �Ƿ������ο�Digg</td>
                             <td style="height: 19px"><asp:RadioButtonList ID="DiggByVisitor" runat="server" RepeatDirection="Horizontal">
                                 <asp:ListItem Value="1">����</asp:ListItem>
                                 <asp:ListItem Selected="True" Value="0">������</asp:ListItem>
                             </asp:RadioButtonList></td>
                            </tr>
                               <tr>
                                   <td style="width: 148px; height: 19px; text-align: right">
                                       �Ƿ������ظ�Digg</td>
                                   <td style="height: 19px">
                                       <asp:RadioButtonList ID="DiggRepeat" runat="server" RepeatDirection="Horizontal">
                                           <asp:ListItem Value="1">����</asp:ListItem>
                                           <asp:ListItem Selected="True" Value="0">������</asp:ListItem>
                                       </asp:RadioButtonList></td>
                               </tr>
                               <tr>
                                   <td style="width: 148px; height: 19px; text-align: right">
                                       �û�ÿdiggһ���Զ�����</td>
                                   <td style="height: 19px">
                                       &nbsp;<asp:TextBox CssClass="textbox" style="text-align:center" ID="DiggPerTimes" runat="server" Width="50px">1</asp:TextBox>��</td>
                               </tr>
                           </table>
                         </td>
                     </tr>
                   
       
				 </table>

         </div>
         <div class="tab-page" id="tab3">
		  <h2 class="tab">�ϴ�ѡ��</h2>
			<script type="text/javascript">
						 tabPane1.addTabPage( document.getElementById( "tab3" ) );
			</script>
			<table width="100%" border="0" cellpadding="1" cellspacing="1" class="CTable">
                    <tr class="ctr">
                       <td align="right" class="lefttd">
                           <strong>�Ƿ��������Ա�ϴ��ļ���</strong></td>
                       <td class="righttd">
                           <asp:RadioButtonList ID="AdminUpfilesTF" runat="server" RepeatDirection="Horizontal">
                               <asp:ListItem Selected="True" Value="1">����</asp:ListItem>
                               <asp:ListItem Value="0">������</asp:ListItem>
                           </asp:RadioButtonList></td>
                       </tr>
                     <tr class="ctr" style="display:none">
                         <td align="right" class="lefttd">
                             <strong>����Ա�ϴ��ļ�Ŀ¼��</strong></td>
                         <td class="righttd">
                             <asp:TextBox CssClass="textbox" ID="AdminUpfilesDir" runat="server">UploadFiles/</asp:TextBox>
                             <span style="color: #ff0033">������ "/"����</span></td>
                     </tr>
                     <tr class="ctr">
                         <td align="right" class="lefttd">
                             <strong>�Ƿ������Ա�ϴ��ļ���</strong></td>
                         <td class="righttd"><asp:RadioButtonList ID="UserUpfilesTF" runat="server" RepeatDirection="Horizontal">
                             <asp:ListItem Selected="True" Value="1">����</asp:ListItem>
                             <asp:ListItem Value="0">������</asp:ListItem>
                         </asp:RadioButtonList></td>
                     </tr>
                     <tr class="ctr">
                         <td align="right" class="lefttd">
                             <strong>ǰ̨��Ա�ϴ��ļ�Ŀ¼��</strong></td>
                         <td class="righttd">
                             <asp:TextBox CssClass="textbox" ID="UserUpFilesDir" runat="server">User/</asp:TextBox>
                             <span style="color: #ff0033">������ "/"����<br />
                                 <strong><span style="color: #000099">˵��:ģ���ڻ�Ա���ĵ�Ŀ¼���ɸ�ʽΪ<br />
                                 </span></strong><span style="color: blue">���ϴ�Ŀ¼+��Ա�����û�����ϴ�Ŀ¼+��Ա����+�������õ�Ŀ¼</span></span></td>
                     </tr>
                     <tr class="ctr">
                         <td align="right" class="lefttd">
                             <strong>�����ϴ�������ļ���</strong></td>
                         <td class="righttd">
                             <asp:TextBox CssClass="textbox" ID="AllowUpfilesSize" runat="server" Width="54px">1024</asp:TextBox>
                             KB&nbsp; <span style="color: #ff0000">��ʾ��1 KB = 1024 Byte��1 MB = 1024 KB
                                 <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="AllowUpfilesSize"
                                     ErrorMessage="����������" ValidationExpression="\d*"></asp:RegularExpressionValidator></span></td>
                     </tr>
                     <tr class="ctr">
                         <td align="right" class="lefttd">
                             <div align="right">
                                 <strong>�����ϴ����ļ����ͣ�</strong><br />
                                 <font color="#ff0000">�����ļ�����֮����"|"�ָ�</font></div>
                         </td>
                         <td class="righttd">
                           <table border="0" cellpadding="0" cellspacing="0" width="90%">
                            <tr>
                             <td align="right" style="width: 107px;height:25px">
                                 ͼƬ����:</td>
                             <td>
                                 <asp:TextBox CssClass="textbox" ID="AllowUpPhotoType" runat="server">jpg|gif|png|bmp</asp:TextBox></td>
                            </tr>
                               <tr>
                                   <td align="right" style="width: 107px;height:25px">
                                       Flash �ļ�:</td>
                                   <td>
                                       <asp:TextBox CssClass="textbox" ID="AllowUpFlashType" runat="server">swf|flv</asp:TextBox></td>
                               </tr>
                               <tr>
                                   <td align="right" style="width: 107px;height:25px">
                                       Windows ý��:</td>
                                   <td>
                                       <asp:TextBox CssClass="textbox" ID="AllowUpMediaType" runat="server">wma|wmv|mp3|mp4</asp:TextBox></td>
                               </tr>
                               <tr>
                                   <td align="right" style="width: 107px;height:25px">
                                       Real ý��:
                                   </td>
                                   <td>
                                       <asp:TextBox CssClass="textbox" ID="AllowUpRealType" runat="server">ram|rm|ra</asp:TextBox></td>
                               </tr>
                               <tr>
                                   <td align="right" style="width: 107px;height:25px">
                                       �����ļ�:</td>
                                   <td>
                                       <asp:TextBox CssClass="textbox" ID="AllowUpOtherType" runat="server">rar|doc|zip</asp:TextBox></td>
                               </tr>
                           </table>
                         </td>
                     </tr>
                    </table>
         </div>
         <div class="tab-page" id="tab4">
		  <h2 class="tab">Ͷ��ѡ��</h2>
			<script type="text/javascript">
						 tabPane1.addTabPage( document.getElementById( "tab4" ) );
			</script>
			<table width="100%" border="0" cellpadding="1" cellspacing="1" class="CTable">
				      <tr>
                           <td align="right" class="lefttd">
                               <strong>ǰ̨�����ܿ��أ�</strong></td>
                           <td class="righttd">
                               <asp:RadioButtonList ID="AllowPublication" runat="server"
                               Width="377px">
                                   <asp:ListItem Value="0">�������������ã�</asp:ListItem>
                                   <asp:ListItem Value="1">��ȫ���ţ������ƣ�</asp:ListItem>
                                   <asp:ListItem Value="2" Selected="True">��������������Ŀ���ö���</asp:ListItem>
                               </asp:RadioButtonList></td>
                       </tr>
                         <tr>
                             <td align="right" class="lefttd">
                                 <strong>ǰ̨�����Ƿ���Ҫ��ˣ�</strong></td>
                             <td class="righttd"><asp:RadioButtonList ID="PublicationVerify" runat="server"
                               Width="217px" RepeatDirection="Horizontal">
                                 <asp:ListItem Selected="True" Value="0">��Ҫ��̨�˹����</asp:ListItem>
                                 <asp:ListItem Value="1">����Ҫ���</asp:ListItem>
                             </asp:RadioButtonList></td>
                         </tr>
                         <tr>
                             <td align="right" class="lefttd">
                                 <strong>Ͷ������ѡ�</strong>
                                
                             </td>
                             <td class="righttd">
                             <asp:CheckBoxList ID="PublicationRefreshHtmlOption" runat="server" RepeatDirection="Horizontal" Width="439px">
                              <asp:ListItem Value="1">������ҳ</asp:ListItem>
                              <asp:ListItem Value="2">����һ����Ŀҳ</asp:ListItem>
                              <asp:ListItem Value="3">����������Ŀҳ</asp:ListItem>
                              <asp:ListItem Value="4">��������ҳ</asp:ListItem>
                              </asp:CheckBoxList>
                                 Tips:
                                 <br /><span class="tips">1����ѡ���ʾ��ԱͶ�岻�Զ�����html����;
                                  <br />2��ֻ��Ͷ�岻��Ҫ���ʱ,�˴����ò���Ч;</span>

                             </td>
                         </tr>
                         <tr>
                             <td align="right" class="lefttd">
                                 <strong>��˹��ĸ���Ƿ������޸ģ�</strong></td>
                             <td class="righttd"><asp:RadioButtonList ID="PublicationModifyVerify" runat="server"
                               Width="217px">
                                 <asp:ListItem Selected="True" Value="0">������</asp:ListItem>
                                 <asp:ListItem Value="1">�������޸ĺ��Զ�תΪδ��</asp:ListItem>
                                 <asp:ListItem Value="2">�������޸ĺ���Ϊ�����</asp:ListItem>
                             </asp:RadioButtonList></td>
                         </tr>
                         </table>
         </div>
         
<div class="tab-page" id="tab5">
		  <h2 class="tab">·��SEOѡ��</h2>
			<script type="text/javascript">
			    tabPane1.addTabPage( document.getElementById( "tab5" ) );
			</script>
			<table width="100%" border="0" cellpadding="1" cellspacing="1" class="CTable">
                  <tr>
                         <td align="right" class="lefttd">
                             <strong>���ɾ�̬���ã�</strong></td>
                         <td class="righttd">
                             <table width="100%">
                                 <tr>
                                     <td width="150" align="right">���ɾ�̬HTML��Ŀ¼��</td>
                                     <td><asp:TextBox CssClass="textbox" ID="ModelFsoFolder" runat="server" Width="101px" Text="html/"></asp:TextBox>*
                                      <br /><span class="tips">�������ɾ�̬html��ŵ�Ŀ¼����html/,html/article/��</span></td>
                                 </tr>
                                 <tr>
                                     <td width="150" align="right">�Զ�����HTML�б��ҳ����</td>
                                     <td> <asp:TextBox CssClass="textbox" ID="FsoListNum" runat="server" Width="50px" style="text-align:center">3</asp:TextBox>ҳ
                                     <br /><span class="tips">��������������Ŀ�б��ҳʱ�Զ����ɵķ�ҳ������������վ�������ϴ󣬽�������һ����С�����֣�С����������վ���Բ������ƣ�ֱ������Ϊ0��</span></td>
                                 </tr>
                             </table>
                             </td>
                     </tr>
                     <tr>
                         <td align="right" class="lefttd">
                             <div align="right">
                                 <strong>α��̬���ã�</strong></div>
                         </td>
                         <td class="righttd">
                                <table width="100%">
                                 <tr>
                                     <td width="150" align="right">�б�ҳʹ�ù���</td>
                                     <td>
                                        <asp:DropDownList ID="DrpRewriteListRule" runat="server"></asp:DropDownList>
                                     </td>
                                 </tr>
                                 <tr>
                                     <td width="150" align="right">�б�ҳ��ҳʹ�ù���</td>
                                     <td>
                                        <asp:DropDownList ID="DrpRewriteListPageRule" runat="server"></asp:DropDownList>
                                     </td>
                                 </tr>
                                 <tr>
                                     <td width="150" align="right">����ҳʹ�ù���</td>
                                     <td>
                                        <asp:DropDownList ID="DrpRewriteViewRule" runat="server"></asp:DropDownList>
                                     </td>
                                 </tr>
                                 <tr>
                                     <td width="150" align="right">����ҳ��ҳʹ�ù���</td>
                                     <td>
                                        <asp:DropDownList ID="DrpRewriteViewPageRule" runat="server"></asp:DropDownList>
                                     </td>
                                 </tr>
                                 <tr>
                                     <td width="150" align="right"></td>
                                     <td>
                                       <span class="tips">�������α��̬�����˽⣬��ʹ��Ĭ�ϡ�</span>
                                     </td>
                                 </tr>
                             </table>
                            
                         </td>
                     </tr>
            </table>
    </div>

         
       <div class="tab-page" id="tab6">
		  <h2 class="tab">����ѡ��</h2>
			<script type="text/javascript">
						 tabPane1.addTabPage( document.getElementById( "tab6" ) );
			</script>
			<table width="100%" border="0" cellpadding="1" cellspacing="1" class="CTable">
                         <tr>
                             <td align="right" class="lefttd">
                                 <strong>��ģ���Ƿ��������ۣ�</strong></td>
                             <td class="righttd"><asp:RadioButtonList ID="CommentType" runat="server"
                               Width="377px">
                                 <asp:ListItem Value="0">��ģ�͹ر�����ϵͳ</asp:ListItem>
                                 <asp:ListItem Value="1">��ģ��ֻ�����Ա���ۣ�������������Ҫ��̨�����</asp:ListItem>
                                 <asp:ListItem Value="2">��ģ��ֻ�����Ա���ۣ����������ݲ���Ҫ��̨���</asp:ListItem>
                                 <asp:ListItem Value="3">��ģ�������Ա���ο����ۣ�������������Ҫ��̨���</asp:ListItem>
                                 <asp:ListItem Selected="True" Value="4">��ģ�������Ա���ο����ۣ����������ݲ���Ҫ��̨���</asp:ListItem>
                                 <asp:ListItem Value="5">����ֻ�����ο����ۣ�������������Ҫ��̨�����</asp:ListItem>
                                 <asp:ListItem Value="6">����ֻ�����ο����ۣ����������ݲ���Ҫ��̨�����</asp:ListItem>
                             </asp:RadioButtonList></td>
                         </tr>
                         <tr>
                             <td align="right" class="lefttd" style="height: 30px">
                                 <strong>�������ã�</strong></td>
                             <td class="righttd" style="height: 30px">
                                 ������������<asp:TextBox CssClass="textbox" ID="CommentLen" style="text-align:center" runat="server" Width="71px">0</asp:TextBox><span class="tips">������������"0"��</span>
                                 <br />
                                 ÿҳ������������<asp:TextBox CssClass="textbox" ID="TxtCmtPageSize1" Text="5" style="text-align:center" runat="server" Width="71px">0</asp:TextBox>&nbsp;&nbsp; ��������ҳ��ҳ��ʾ��������<asp:TextBox CssClass="textbox" Text="10" ID="TxtCmtPageSize2" style="text-align:center" runat="server" Width="71px">0</asp:TextBox>������������"0"

                             </td>
                         </tr>
                         <tr>
                             <td align="right" class="lefttd" style="height: 30px">
                                 <strong>������Ϣ���ã�</strong></td>
                             <td class="righttd" style="height: 30px">
                                 <asp:TextBox CssClass="textbox" ID="NewestDay" style="text-align:center" runat="server" Width="71px">3</asp:TextBox>���ڵ���Ϣ��־Ϊ����</td>
                         </tr>
                         <tr>
                             <td align="right" class="lefttd" style="height: 30px">
                                 <strong>����ҳģ�壺</strong></td>
                             <td class="righttd" style="height: 30px">
                                 <asp:TextBox CssClass="textbox" ID="CommentTemplate" runat="server" Width="350px"></asp:TextBox>
                                 <input type="button" class="button" onMouseOver="this.className='button_on';" onMouseOut="this.className='button';" value="ѡ��ģ��..." onClick="SelectTemplate('<%=this.CommentTemplate.ClientID%>');"/>

                                 </td>
                         </tr>
                         <tr>
                             <td align="right" class="lefttd" style="height: 30px">
                                 <strong>��ģ���Ƿ�����������</strong></td>
                             <td class="righttd" style="height: 30px">
                              <asp:RadioButtonList ID="RdbSearchTF" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow">
                                  <asp:ListItem Value="1" Selected="True">����</asp:ListItem>
                                  <asp:ListItem Value="0">������</asp:ListItem>
                              </asp:RadioButtonList>    
                            </td>
                         </tr>
                         <tr>
                             <td align="right" class="lefttd" style="height: 30px">
                                 <strong>����ҳģ�壺</strong></td>
                             <td class="righttd" style="height: 30px">
                                 <asp:TextBox CssClass="textbox" ID="SearchTemplate" runat="server" Width="350px"></asp:TextBox>
                                 <input type="button" class="button" onMouseOver="this.className='button_on';" onMouseOut="this.className='button';" value="ѡ��ģ��..." onClick="SelectTemplate('<%=this.SearchTemplate.ClientID%>');"/>
                                 <span class="tips">�������գ�������ȫվ����ģ�塣</span>
                                 </td>
                         </tr>
                       </table>
         </div>

    </div>
	
                     
                       

        <div style="clear:both;text-align:center">
           <br />
            <KS:Foot ID="Foot1" runat="server" OnSubmit="Foot1_Submit" />
            &nbsp; &nbsp;
        </div>
        
       </asp:Panel>

   </asp:Content>