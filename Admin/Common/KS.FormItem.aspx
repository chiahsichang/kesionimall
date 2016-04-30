<%@ Page Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.Admin_FormItem" Title="�Զ������" Codebehind="KS.FormItem.aspx.cs" %>
<asp:Content ID="Content1" ContentPlaceHolderID="KSContent" Runat="Server">
    <asp:Panel ID="listPanel" runat="server" Width="100%">
        <KS:OrderJS ID="OrderJS1" runat="server" />
         <div id="manage_top" class="menu_top_fixed">
              <ul>
           <li id='p1'><b></b><asp:LinkButton ID="addsubject" runat="server" OnClick="addsubject_Click">��������</asp:LinkButton></li>
          <li id='p4'><b></b><asp:LinkButton ID="editsubject" runat="server" OnClick="editsubject_Click">�༭����</asp:LinkButton></li>
          <li id='p3'><b></b><asp:LinkButton ID="delsubject" runat="server" OnClick="delsubject_Click">ɾ������</asp:LinkButton></li>
          <li id='p9'><b></b><asp:LinkButton ID="backbutton" runat="server" OnClick="backbutton_Click">����һ��</asp:LinkButton></li><div id="go"><asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
                  </div>
           </ul>
        </div>  

        <div class="menu_top_fixed_height"></div>  

        <KS:KSGV ID="list" CssClass="CTable" runat="server" AutoGenerateColumns="False" GridLines="None" OnRowDataBound="list_RowDataBound" PagerType="CustomNumeric" Width="99%" EmptyDataText="��û����ӱ���" OnRowCommand="list_RowCommand">
            <EmptyDataRowStyle CssClass="emptycss" />
            <Columns>
            <asp:TemplateField HeaderText="ѡ��">
                <itemstyle horizontalalign="Center" width="50px" />
                <itemtemplate>
                <input type="checkbox"  name="ids" id="ids" value="<%#Eval("name") %>" />
                </itemtemplate>
            </asp:TemplateField>
                <asp:BoundField DataField="name" HeaderText="����ID">
                <itemstyle horizontalalign="Center" width="80px" />
                </asp:BoundField>
                <asp:BoundField DataField="fieldname" HeaderText="��������" />
                <asp:BoundField DataField="fieldtype" HeaderText="�ֶ�����">
                    <itemstyle horizontalalign="Center" width="120px" />
                </asp:BoundField>


                <asp:TemplateField HeaderText="�Ƿ�����">
                <ItemStyle  HorizontalAlign="Center" Width="60px" />
                    <ItemTemplate>
                   <a href="javascript:;" <%# Convert.ToString(Eval("enabled"))=="0"?"class='no' title='��'":"class='ok' title='��'" %>></a>
                 </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="�Ƿ����">
                <ItemStyle  HorizontalAlign="Center" Width="60px" />
                    <ItemTemplate>
                   <a href="javascript:;" <%# Convert.ToString(Eval("mustfill"))=="0"?"class='no' title='��'":"class='ok' title='��'" %>></a>
                 </ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="����">
                <itemstyle horizontalalign="Center" width="80px" />
                 <itemtemplate>
                  <asp:DropDownList id="orderid" datasource="<%#bindorder() %>" runat="server"></asp:DropDownList>
                </itemtemplate>
                </asp:TemplateField>

             <asp:TemplateField HeaderText="�༭">
              <itemstyle width="30px" horizontalalign="Center"/>
              <itemtemplate>
                     <asp:LinkButton ToolTip="�༭" CssClass="edit" ID="LinkButton1"  runat="server" commandargument=<%#Eval("name") %> commandname="modify"></asp:LinkButton>
              </itemtemplate>
            </asp:TemplateField>

             <asp:TemplateField HeaderText="ɾ��">
              <itemstyle width="30px" horizontalalign="Center"/>
              <itemtemplate>
                     <asp:LinkButton runat="server" CssClass="delete" ToolTip="ɾ��" id="delete" commandargument=<%#Eval("name") %> commandname="del"></asp:LinkButton>
              </itemtemplate>
            </asp:TemplateField>

                 <asp:TemplateField HeaderText="Ԥ��">
                <itemstyle width="30px" horizontalalign="Center" />
                     <itemtemplate>
                     <asp:LinkButton runat="server" ToolTip="Ԥ��" CssClass="preview" id="preview" commandargument=<%#Eval("name") %> commandname="preview"></asp:LinkButton>
              </itemtemplate>
           
            </asp:TemplateField>
            </Columns>
            <HeaderStyle CssClass="CTitle" />
        </KS:KSGV>
        <asp:Panel ID="Panel1" runat="server" Width="741px">
          <div style="margin-top:5px;overflow:hidden;"></div>
            &nbsp;&nbsp;<input type="checkbox" name="chkall" id="chkall" onclick="CheckAll(this.form);"/><label for="chkall">ȫ��ѡ��</label>
            &nbsp;&nbsp;&nbsp;<asp:Button ID="DelButton" runat="server" Text="ɾ��ѡ�еı���" OnClick="DelButton_Click"/>
              <asp:Button ID="Button1" runat="server" Text="��������" OnClick="Button1_Click" />
           </asp:Panel>
    </asp:Panel>
    
    <asp:Panel ID="addPanel" runat="server" Width="100%" Visible="false">
       <script language="javascript">
       function Setdisplay(s){
       if (s==3||s==4||s==5){ 
       jQuery("#OptionsArea").show();} 
       else 
       jQuery("#OptionsArea").hide();
       if (s==5){
       jQuery("#mutiltips").show();}
       else
           jQuery("#mutiltips").hide();
       if (s == 9)
           jQuery("#UploadSetting").show();
       else
           jQuery("#UploadSetting").hide();
       }
       </script>
        <KS:TopNav ID="TopNav1" runat="server" Text="��ӱ���" />
        <table width="100%" border="0" cellpadding="1" cellspacing="1" class="CTable"> 
            <tr>
                <td align="right" class="lefttd" height="30" style="width: 146px">
                    <strong>����Ŀ��</strong></td>
                <td class="righttd">
                    <asp:Label ID="LabSubject" runat="server" Text="Label" ForeColor="Red"></asp:Label></td>
            </tr>
          <tr>
            <td class="lefttd" height="30" align="right" style="width: 146px"><b>�������ƣ�</b></td>
            <td class="righttd">
                &nbsp;<asp:TextBox CssClass="textbox" ID="FieldName" runat="server" Width="210px"></asp:TextBox>
                �磬���������<asp:RequiredFieldValidator ID="RequiredFieldValidator1" Display="Dynamic" runat="server" ControlToValidate="FieldName"
                    ErrorMessage="����д��������!"></asp:RequiredFieldValidator></td>
          </tr>
        <tr>
            <td align="right" class="lefttd" height="30" style="width: 146px">
                <strong>�����ͣ�</strong></td>
            <td class="righttd">
                &nbsp;<asp:DropDownList CssClass="select" ID="FieldType" runat="server" Width="158px">
                 <asp:ListItem Value="1">�����ı�(text)</asp:ListItem>
                 <asp:ListItem Value="2">�����ı�(textarea)</asp:ListItem>
                 <asp:ListItem Value="3">�����б�(select)</asp:ListItem>
                 <asp:ListItem Value="4">��ѡ��(radio)</asp:ListItem>
                 <asp:ListItem Value="5">��ѡ��(checkbox)</asp:ListItem>
                 <asp:ListItem Value="6">����(text)</asp:ListItem>
                 <asp:ListItem Value="7">���ں�ʱ��(text)</asp:ListItem>
                 <asp:ListItem Value="8">��������(text)</asp:ListItem>
                 <asp:ListItem Value="9">�ϴ��ļ�(text)</asp:ListItem>
                </asp:DropDownList>
                <asp:label id="labfiledtips" text="* һ���趨�Ͳ����޸�" runat="server" ForeColor="Red"></asp:label></td>
        </tr>

        <tbody id="UploadSetting" style="display:none">
          <tr>
                <td align="right" class="lefttd" height="30" style="width: 146px">
                    <strong>�ϴ����ã�</strong></td>
                <td class="righttd">
                       <strong>������ϴ����ļ����ͣ�</strong>
                    &nbsp;<asp:TextBox CssClass="textbox" ID="TxtUploadType" runat="server" Text="jpg|gif|png" Width="210px"></asp:TextBox>
                    <span class="tips">�����չ���á�|����������jpg|gif|png�ȡ�</span>
                    <br />
                    <strong>������ϴ����ļ���С��</strong>
                    &nbsp;<asp:TextBox CssClass="textbox" ID="TxtFileMaxSize" Text="1024" runat="server" Width="50px"></asp:TextBox> KB
                    <span class="tips">�����ļ������ϴ��Ĵ�С��</span>
                    </td>
            </tr>
        </tbody>

            <tr>
                <td align="right" class="lefttd" height="30" style="width: 146px">
                    <strong>Ĭ �� ֵ��</strong></td>
                <td class="righttd">
                    &nbsp;<asp:TextBox CssClass="textbox" ID="DefaultValue" runat="server" Width="210px"></asp:TextBox>
                    <span id="mutiltips" style="color:Red;display:none">���Ĭ��ѡ�����Ӣ�Ķ��š�,������</span>
                    </td>
            </tr>
            <tbody id="OptionsArea" style="display:none">
            <tr>
                <td align="right" class="lefttd" height="30" style="width: 146px">
                    <strong>�б�ѡ�<br />
                    </strong><span style="color: blue">ע��ÿһ��ѡ��Ϊһ��</span></td>
                <td class="righttd">
                    &nbsp;<asp:TextBox ID="Options" CssClass="textbox" runat="server" Height="74px" TextMode="MultiLine" Width="217px"></asp:TextBox></td>
            </tr>
            </tbody>
            <tr>
                <td align="right" class="lefttd" height="30" style="width: 146px">
                    <strong>�Ƿ���</strong></td>
                <td class="righttd">
                    <asp:RadioButtonList ID="MustFill" runat="server" RepeatDirection="Horizontal">
                        <asp:ListItem Selected="True" Value="1">��</asp:ListItem>
                        <asp:ListItem Value="0">��</asp:ListItem>
                    </asp:RadioButtonList></td>
            </tr>
            <tr>
                <td align="right" class="lefttd" height="30" style="width: 146px">
                    <strong>�Ƿ����ã�</strong></td>
                <td class="righttd"><asp:RadioButtonList ID="Enabeld" runat="server" RepeatDirection="Horizontal">
                    <asp:ListItem Selected="True" Value="1">����</asp:ListItem>
                    <asp:ListItem Value="0">����</asp:ListItem>
                </asp:RadioButtonList></td>
            </tr>
       </table>
        <br />
        <KS:Foot ID="Foot1" runat="server" SubmitButtonText="ȷ�����(0)" OnSubmit="Foot1_Submit" />
    </asp:Panel>
    
    <asp:Panel ID="previewPanel" runat="server" Width="100%" Visible="false">
        <KS:TopNav ID="TopNav2" runat="server" Text="Ԥ������" />
        <table width="100%" border="0" cellpadding="1" cellspacing="1" class="CTable"> 
            <tr>
                <td align="right" class="lefttd" height="30" style="width: 198px">
                    <strong>
                        <asp:Label ID="LabFieldName" runat="server" Text="Label" Font-Bold="True"></asp:Label></strong></td>
                <td class="righttd">
                    <asp:Label ID="LabFieldType" runat="server" Text="Label"></asp:Label></td>
            </tr>
        </table>
        <br />
        <KS:Foot ID="Foot2" runat="server" SubmitButtonText="��Ҫ�޸�(0)" OnSubmit="Foot2_Submit" />
    </asp:Panel>
    
</asp:Content>

