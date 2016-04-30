<%@ Page Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.Admin_Field" Title="�ֶι���" CodeBehind="KS.Field.aspx.cs" %>
<%@ Import Namespace="Kesion.Publics"%>
<%@ Import Namespace="Kesion.Cache"%>
<%@ Import Namespace="Kesion.BLL"%>
<%@ Import Namespace="System.Data"%>
<asp:Content ID="Content1" ContentPlaceHolderID="KSContent" Runat="Server">
    <asp:Panel ID="listPanel" runat="server" Width="100%">
      <div id="manage_top" class="menu_top_fixed">
        <ul>
        <li id='p1'><asp:LinkButton ID="addbutton" runat="server" OnClick="addbutton_Click"><b></b>�����ֶ�</asp:LinkButton></li>
        <li id='p5'><asp:LinkButton ID="LinkButton3" runat="server" OnClick="LinkButton3_Click"><b></b>�ֶη���</asp:LinkButton></li>
        <li id='p9'><asp:LinkButton ID="LinkButton2" runat="server" OnClick="LinkButton2_Click"><b></b>����һ��</asp:LinkButton></li>
        </ul>
        <div id="gos">��ǰ�����ģ�ͣ�<asp:Label ID="LabCurrModel" runat="server" Text="Label"></asp:Label></div>
      </div>     
       <div class="menu_top_fixed_height"></div>    
    <div>


        <div class="tabs_header">
            <ul class="tabs">
               <%=FieldGroupStr%>
            </ul>
       </div>

        <KS:OrderJS ID="OrderJS1" runat="server" />
        <KS:KSGV ID="FieldListView" runat="server" AutoGenerateColumns="False" DataKeyNames="FieldID" GridLines="None"
            OnRowDataBound="FieldListView_RowDataBound" EmptyDataText="û���ֶΣ�" PagerType="CustomNumeric" Width="99%" CssClass="CTable" EnableTheming="True" OnRowCommand="FieldListView_RowCommand">
            <Columns>
                <asp:TemplateField HeaderText="����">
                    <itemstyle width="60px" horizontalalign="Center"  />
                    <headerstyle height="18px"/>
                    <itemtemplate>
                     <asp:DropDownList id="orderid" datasource="<%#bindorder() %>" runat="server"></asp:DropDownList>
                    </itemtemplate>
                </asp:TemplateField>
                  <asp:BoundField DataField="FieldAlias" HeaderText="�ֶα���">
                    <itemstyle width="100px" />
                </asp:BoundField>

                <asp:BoundField DataField="Name" HeaderText="�ֶ�����">
                    <itemstyle width="100px" ForeColor="#999999" horizontalalign="Center" />
                </asp:BoundField>

             
              
                <asp:BoundField DataField="FieldLevel" HeaderText="����">
                    <itemstyle width="60px" horizontalalign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="FieldType" HeaderText="�ֶ�����">
                    <itemstyle horizontalalign="Center" width="118px" />
                </asp:BoundField>


           <asp:TemplateField HeaderText="¼����">
              <itemstyle width="30px" horizontalalign="Center"/>
              <itemtemplate>
                   <a href="?action=InputItem&Channelid=<%=__ChannelID %>&name=<%#Eval("name")%>" <%# Convert.ToString(Eval("InputItem"))=="0"?"class='no' title='��'":"class='ok' title='��'" %>></a>
              </itemtemplate>
            </asp:TemplateField> 

           <asp:TemplateField HeaderText="Ͷ����">
              <itemstyle width="30px" horizontalalign="Center"/>
              <itemtemplate>
                   <a href="?action=ContributionItem&Channelid=<%=__ChannelID %>&name=<%#Eval("name")%>" <%# Convert.ToString(Eval("ContributionItem"))=="0"?"class='no' title='��'":"class='ok' title='��'" %>></a>
              </itemtemplate>
            </asp:TemplateField> 

         <asp:TemplateField HeaderText="�ɼ���">
              <itemstyle width="30px" horizontalalign="Center"/>
              <itemtemplate>
                   <a href="?action=CollectItem&Channelid=<%=__ChannelID %>&name=<%#Eval("name")%>" <%# Convert.ToString(Eval("CollectItem"))=="0"?"class='no' title='��'":"class='ok' title='��'" %>></a>
              </itemtemplate>
            </asp:TemplateField> 

             <asp:TemplateField HeaderText="������">
              <itemstyle width="30px" horizontalalign="Center"/>
              <itemtemplate>
                   <a href="?action=MustFillItem&Channelid=<%=__ChannelID %>&name=<%#Eval("name")%>" <%# Convert.ToString(Eval("MustFillItem"))=="0"?"class='no' title='��'":"class='ok' title='��'" %>></a>
              </itemtemplate>
            </asp:TemplateField>

                           <asp:TemplateField HeaderText="������">
              <itemstyle width="30px" horizontalalign="Center"/>
              <itemtemplate>
                   <a href="?action=ManageItem&Channelid=<%=__ChannelID %>&name=<%#Eval("name")%>" <%# Convert.ToString(Eval("ManageItem"))=="1"?"class='ok' title='��'":"class='no' title='��'" %>></a>
              </itemtemplate>
            </asp:TemplateField> 

             <asp:TemplateField HeaderText="״̬">
              <itemstyle width="30px" horizontalalign="Center"/>
              <itemtemplate>
                   <a href="?action=Disabled&Channelid=<%=__ChannelID %>&name=<%#Eval("name")%>" <%# Convert.ToString(Eval("Disabled"))=="false"?"class='no' title='����'":"class='ok' title='����'" %>></a>
              </itemtemplate>
            </asp:TemplateField>


            <asp:TemplateField HeaderText="�༭">
              <itemstyle width="30px" horizontalalign="Center"/>
              <itemtemplate>
                     <asp:LinkButton ID="LinkButton1" ToolTip="�༭" CssClass="edit" runat="server" commandargument=<%#Eval("Name") %> commandname="modify"></asp:LinkButton>
              </itemtemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="ɾ��">
              <itemstyle width="30px" horizontalalign="Center"/>
              <itemtemplate>
                     <asp:LinkButton runat="server" CssClass="delete" ToolTip="ɾ��" id="delete" commandargument=<%#Eval("name") %> commandname="del"></asp:LinkButton>
              </itemtemplate>
            </asp:TemplateField>

                
            </Columns>
            <HeaderStyle CssClass="CTitle" />
        </KS:KSGV>
        <br />
        <asp:Panel ID="Panel1" runat="server" Height="30px">
            <asp:Button ID="Button1" runat="server" Text="���������ֶ�����" OnClick="Button1_Click1" />&nbsp;<asp:Button
                ID="Button2" runat="server" Text="Ԥ��ģ��" /><br />
            </asp:Panel>
        &nbsp;
        </div>
     </asp:Panel>
    
    <asp:Panel ID="addPanel" runat="server" Width="100%" Visible="false">
    <script>
        function ShowArea() {
           var v = parseInt(jQuery("#<%=this.FieldType.ClientID %> :radio[checked]").val());
           if (v==12){
            jQuery("#ParentIDArea").show();
           }else{
            jQuery("#ParentIDArea").hide();
           }
           if (v==2||v==3){
           jQuery("#HeightArea").show();}
           else{
           jQuery("#HeightArea").hide();}
           if (v==10|| v==11){
           jQuery("#FileArea").show()}
           else{
           jQuery("#FileArea").hide();}
           if(v==4||v==5||v==6||v==12){
           jQuery("#ListArea").show();}
           else{
           jQuery("#ListArea").hide();}
           if (v==5||v==6){
           jQuery("#WidthArea").hide();}
           else{
           jQuery("#WidthArea").show();}
           if(v==6){
           jQuery("#CheckTips").show();}
           else{
               jQuery("#CheckTips").hide();
           }
           if(v==3){
            jQuery("#ToolbarArea").show();}
            else{
            jQuery("#ToolbarArea").hide();}
        }
        function CheckForm() {
            var fileName = $("#<%=FieldName.ClientID%>").val();
            if (fileName == '') {
                KesionJS.Alert('�������ֶ����ƣ�', "jQuery('#<%=this.FieldName.ClientID %>').focus()");
                return false;
            } else {
                var reg = /[a-zA-Z]+\w{2,}/;
                var r = fileName.match(reg);
                if (r == null) {
                    KesionJS.Alert('�ֶ����Ʊ�������ĸ��ͷ,�������ĸ�����ֻ��»��ߵ��������,�ұ�����ڵ���3���ַ���', "jQuery('#<%=this.FieldName.ClientID %>').focus()");
                    return false;
                }
            }    
            if ($("#<%=FieldAlias.ClientID%>").val() == '') {
                KesionJS.Alert('�������ֶα�����', "jQuery('#<%=this.FieldAlias.ClientID %>').focus()");
                return false;
            }
            return true;
        }
    </script>


        <KS:TopNav ID="TopNav1" runat="server" Text="������ֶ�" />
         <table width="99%" align="center" border="0" cellpadding="1" cellspacing="1" class="CTable"> 
             <tr>
                 <td align="right" class="lefttd" height="30" style="width: 198px">
                     <strong>����ģ�ͣ�</strong></td>
                 <td class="righttd"><asp:Label ID="Label1" runat="server" ForeColor="Red" Text="Label"></asp:Label></td>
             </tr>
             <tr>
                 <td align="right" class="lefttd" height="30" style="width: 198px">
                     <strong>�������飺</strong></td>
                 <td class="righttd">
                     <asp:DropDownList ID="DrpFieldGroupID" Width="250px" runat="server"></asp:DropDownList>
                 </td>
             </tr>
            
            <tr>
                <td align="right" class="lefttd" height="30" style="width: 198px">
                    <strong>�ֶ����ƣ�</strong></td>
                <td class="righttd">
                    <asp:TextBox CssClass="textbox" ID="FieldName" runat="server"></asp:TextBox>
                    <span style="color: #ff0066">*</span> 
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="FieldName"
                        ErrorMessage="����������" Display="Dynamic"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="FieldName"
                        Display="Dynamic" ErrorMessage="��������ĸ��ͷ,�������ĸ�����ֻ��»��ߵ��������,�ұ�����ڵ���3���ַ�" ValidationExpression="[a-zA-Z]+\w{2,}"></asp:RegularExpressionValidator><br />
                    �ֶ���������ĸ�����֡����»������,����ֻ������ĸ��ͷ.��ģ��ҳ�ĵ��ø�ʽ��<span style="color: #ff0066">{KS.Field.</span><span id="Fields" style="color: #ff0066">�ֶ�����</span><span style="color: #ff0066">}</span></td>
            </tr>
             <tr>
                 <td align="right" class="lefttd" style="width: 198px; height: 30px;">
                     <strong>�ֶα�����</strong></td>
                 <td class="righttd" style="height: 30px">
                     <asp:TextBox CssClass="textbox" ID="FieldAlias" runat="server"></asp:TextBox>
                     <span style="color: #ff0066">*<asp:RequiredFieldValidator ID="RequiredFieldValidator2"
                         runat="server" ControlToValidate="FieldAlias" ErrorMessage="�������ֶα���"></asp:RequiredFieldValidator><br />
                     </span>��:�����������ϵ��ʽ�ȵ�</td>
             </tr>
             <tr>
                 <td align="right" class="lefttd" style="width: 198px; height: 30px">
                     <strong>�ֶ�¼����ʾ��</strong></td>
                 <td class="righttd" style="height: 30px">
                     <asp:TextBox CssClass="textbox" ID="Tips" runat="server" Height="37px" TextMode="MultiLine" Width="230px"></asp:TextBox>
                     ��ʾ��¼����Աߵ���ʾ��Ϣ</td>
             </tr>
             <tr>
                 <td align="right" class="lefttd" style="width: 198px; height: 30px">
                     <strong>�ֶ����ͣ�</strong></td>
                 <td class="righttd" style="height: 30px">
                     <asp:RadioButtonList ID="FieldLevel" runat="server" Enabled="false" RepeatDirection="Horizontal">
                         <asp:ListItem Value="0">ϵͳ�ֶ�</asp:ListItem>
                         <asp:ListItem Selected="True" Value="1">�Զ���</asp:ListItem>
                     </asp:RadioButtonList></td>
             </tr>
             <tr>
                 <td align="right" class="lefttd" style="width: 198px; height: 30px">
                     <strong>�ֶ����ͣ�</strong></td>
                 <td class="righttd" style="height: 30px">
                     <asp:RadioButtonList ID="FieldType" runat="server" RepeatColumns="4" RepeatDirection="Horizontal">
                         <asp:ListItem Selected="True" Value="1">�����ı�</asp:ListItem>
                         <asp:ListItem Value="2">�����ı�(��֧��HTML)</asp:ListItem>
                         <asp:ListItem Value="3">�����ı�(֧��HTML)</asp:ListItem>
                         <asp:ListItem Value="4">����ѡ��</asp:ListItem>
                         <asp:ListItem Value="5">��ѡ��</asp:ListItem>
                         <asp:ListItem Value="6">��ѡ��</asp:ListItem>
                         <asp:ListItem Value="7">����ʱ��</asp:ListItem>
                         <asp:ListItem Value="8">���֣�Int��</asp:ListItem>
                         <asp:ListItem Value="13">С���֣�Float��</asp:ListItem>
                         <asp:ListItem Value="14">���ң�Money��</asp:ListItem>
                         <asp:ListItem Value="9">��������</asp:ListItem>
                         <asp:ListItem Value="10">ͼƬ</asp:ListItem>
                         <asp:ListItem Value="11">�ļ�</asp:ListItem>
                         <asp:ListItem Value="12" style="color:blue">���������б�</asp:ListItem>
                     </asp:RadioButtonList></td>
             </tr>
             <tr>
                 <td align="right" class="lefttd" style="width: 198px; height: 30px">
                     <strong>Ĭ �� ֵ��</strong></td>
                 <td class="righttd" style="height: 30px">
                     <asp:TextBox CssClass="textbox" ID="DefaultValue" runat="server"></asp:TextBox> <span id="CheckTips" style="color: #ff0033;display:none;">���Ĭ��ѡ�������Ӣ�Ķ���","����</span>
                     <asp:Label ID="LabDefaultValueTips" runat="server"></asp:Label>
                     </td>
             </tr>
             <tbody id="ToolbarArea" style="display:none">
                 <tr>
                     <td align="right" class="lefttd" style="width: 198px; height: 30px">
                         <strong>�༭�����ͣ�</strong></td>
                     <td class="righttd" style="height: 30px">
                         <asp:DropDownList ID="Toolbar" runat="server">
                             <asp:ListItem Value="Basic" Selected="True">����ͱ༭��</asp:ListItem>
                             <asp:ListItem Value="Content">��׼�ͱ༭��</asp:ListItem>
                             <asp:ListItem Value="Full">��ǿ�ͱ༭��</asp:ListItem>
                         </asp:DropDownList></td>
                 </tr>
               </tbody>
             <tbody id="WidthArea">
             <tr>
                 <td align="right" class="lefttd" style="width: 198px; height: 30px">
                     <strong>��ʾ�Ŀ�ȣ�</strong></td>
                 <td class="righttd" style="height: 30px">
                     <asp:TextBox CssClass="textbox" ID="Width" runat="server" Width="44px">160</asp:TextBox>
                     px&nbsp; <span style="color: #ff0066">���磺200px<asp:RegularExpressionValidator ID="RegularExpressionValidator2"
                         runat="server" ControlToValidate="Width" ErrorMessage="����д����" ValidationExpression="\d*"></asp:RegularExpressionValidator></span></td>
             </tr>
             </tbody>
             <tbody id="HeightArea" style="display:none">
             <tr>
                 <td align="right" class="lefttd" style="width: 198px; height: 30px">
                     <strong>��ʾ�ĸ߶ȣ�</strong></td>
                 <td class="righttd" style="height: 30px">
                     <asp:TextBox CssClass="textbox" ID="Height" runat="server" Width="44px">100</asp:TextBox>
                     px&nbsp; <span style="color: #ff0066">���磺200px<asp:RegularExpressionValidator ID="RegularExpressionValidator3"
                         runat="server" ControlToValidate="Height" ErrorMessage="����д����" ValidationExpression="\d*"></asp:RegularExpressionValidator></span></td>
             </tr>
             </tbody>
             <tbody id="ParentIDArea" style="display:none">
              <tr>
                <td align="right" class="lefttd" style="width: 198px; height: 39px">
                         <strong>���������ֶΣ�<br />
                         </strong><span style="color: #0000ff">��ѡ���ʾһ�������ֶ�<br />
 ����ָ��Ϊ�¼������ֶ�</span></td>
                     <td class="righttd" style="height: 39px">
                       <asp:DropDownList ID="DrpParentFieldID" runat="server">
                        <asp:ListItem Value="0">--��Ϊһ������--</asp:ListItem>
             
                       </asp:DropDownList>
                     </td>
                 </tr>
             </tbody>
             <tbody id="ListArea" style="display:none">
                 <tr>
                     <td align="right" class="lefttd" style="width: 198px; height: 39px">
                         <strong>�б�ѡ�<br />
                         </strong><span style="color: #0000ff">ÿһ��Ϊһ���б�ѡ��</span>
                     <br />
                     ���ֵ����ʾ�ͬ������<span style="color:Red">|</span>����
��ȷ��ʽ�磺<span style="color:Red">��</span> �� <span style="color:Red">0|��</span>    
                     </td>
                     <td class="righttd" style="height: 39px">
                         <asp:TextBox ID="Options" runat="server" Height="87px" TextMode="MultiLine" Width="219px"></asp:TextBox></td>
                 </tr>
             </tbody>
             <tbody id="FileArea" style="display:none">
             <tr>
                 <td align="right" class="lefttd" style="width: 198px; height: 39px">
                     <strong>�����ϴ����ļ����ͣ�</strong></td>
                 <td class="righttd" style="height: 39px">
                     <asp:TextBox CssClass="textbox" ID="AllowFileExt" runat="server" Width="212px"></asp:TextBox>
                     �����չ�����ã�|������</td>
             </tr>
             <tr>
                 <td align="right" class="lefttd" style="width: 198px; height: 30px">
                     <strong>�����ϴ����ļ���С��</strong></td>
                 <td class="righttd" style="height: 30px">
                     <asp:TextBox CssClass="textbox" ID="MaxFileSize" runat="server" Width="41px"></asp:TextBox>
                     KB&nbsp; <span style="color: #ff0000">*</span> <span style="color: blue">��ʾ��1 KB = 1024
                         Byte��1 MB = 1024 KB<span> </span></span>
                 </td>
             </tr>
             </tbody>
             <tr>
                 <td align="right" class="lefttd" style="width: 198px; height: 30px">
                     <strong>�ֶ����ԣ�</strong></td>
                 <td class="righttd" style="height: 30px">
                     <asp:CheckBoxList ID="FieldAtrrib" runat="server" RepeatDirection="Horizontal">
                         <asp:ListItem Selected="True" Value="1">¼����</asp:ListItem>
                         <asp:ListItem Selected="True" Value="2">Ͷ����</asp:ListItem>
                         <asp:ListItem Value="3">�ɼ���</asp:ListItem>
                         <asp:ListItem Value="4">������</asp:ListItem>
                         <asp:ListItem Value="5">������(��ʾ*)</asp:ListItem>
                         <asp:ListItem Value="6">��̨������</asp:ListItem>
                     </asp:CheckBoxList></td>
             </tr>
             <tr>
                 <td align="right" class="lefttd" style="width: 198px; height: 30px">
                     <strong>�ֶ�״̬��<br />
                     </strong><span style="color: #0000ff">ֻ������״̬���ֶβſ���ʹ��</span></td>
                 <td class="righttd" style="height: 30px">
                     <asp:RadioButtonList ID="Enabled" runat="server" RepeatDirection="Horizontal">
                         <asp:ListItem Selected="True" Value="1">����</asp:ListItem>
                         <asp:ListItem Value="0">����</asp:ListItem>
                     </asp:RadioButtonList></td>
             </tr>
        </table>
        <br />
        <KS:Foot ID="Foot1" runat="server" OnSubmit="Foot1_Submit" SubmitButtonText="ȷ�����(0)" />
    
    </asp:Panel>


    

  </asp:Content>