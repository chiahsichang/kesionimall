<%@ Page Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.Admin_UserField" Title="�ֶι���" Codebehind="KS.UserField.aspx.cs" %>
<asp:Content ID="Content1" ContentPlaceHolderID="KSContent" Runat="Server">
    <asp:Panel ID="listPanel" runat="server" Width="100%">
      <div id="manage_top">
        <li id='p1'><asp:LinkButton ID="addbutton" runat="server" OnClick="addbutton_Click">�����ֶ�</asp:LinkButton></li><li id='p7'><asp:LinkButton ID="LinkButton1" runat="server">������Excel</asp:LinkButton></li><li id='p9'><asp:LinkButton ID="LinkButton2" runat="server" OnClick="LinkButton2_Click">����һ��</asp:LinkButton></li><div id="gos">��ǰ�����ģ�ͣ�<asp:Label ID="LabCurrModel" runat="server" Text="Label"></asp:Label></div>
      </div>     

    <div>
        <KS:OrderJS ID="OrderJS1" runat="server" />
        <KS:KSGV ID="FieldListView" runat="server" AutoGenerateColumns="False" DataKeyNames="FieldID" GridLines="None"
            OnRowDataBound="FieldListView_RowDataBound" PagerType="CustomNumeric" Width="99%" EnableTheming="True" OnRowCommand="FieldListView_RowCommand">
            <Columns>
                <asp:TemplateField HeaderText="����">
                    <itemtemplate>
                  <asp:DropDownList id="orderid" datasource="<%#bindorder() %>" runat="server"></asp:DropDownList>
                    
                    
</itemtemplate>
                    <headerstyle height="18px"/>
                    <itemstyle width="60px" horizontalalign="Center"  />
                </asp:TemplateField>
                  <asp:BoundField DataField="FieldAlias" HeaderText="�ֶα���">
                    <itemstyle width="100px" />
                </asp:BoundField>
                <asp:BoundField DataField="Name" HeaderText="�ֶ�����">
                <itemstyle width="100px" horizontalalign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="FieldLevel" HeaderText="����">
                    <itemstyle width="60px" horizontalalign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="FieldType" HeaderText="�ֶ�����">
                    <itemstyle horizontalalign="Center" width="118px" />
                </asp:BoundField>
                <asp:BoundField DataField="InputItem" HeaderText="¼����">
                    <itemstyle horizontalalign="Center" width="50px" />
                </asp:BoundField>
                <asp:BoundField DataField="ContributionItem" HeaderText="Ͷ����">
                    <itemstyle horizontalalign="Center" width="50px" />
                </asp:BoundField>
                <asp:BoundField DataField="CollectItem" HeaderText="�ɼ���">
                    <itemstyle horizontalalign="Center" width="50px" />
                </asp:BoundField>
                <asp:BoundField DataField="MustFillItem" HeaderText="������">
                    <itemstyle horizontalalign="Center" width="50px" />
                </asp:BoundField>
                 <asp:BoundField DataField="disabled" HeaderText="�Ƿ�����">
                    <itemstyle horizontalalign="Center" width="70px" />
                </asp:BoundField>

                <asp:TemplateField HeaderText="�������">
                <itemtemplate>
                     <asp:LinkButton runat="server" commandargument=<%#Eval("Name") %> commandname="modify">�޸�</asp:LinkButton>
                     <asp:LinkButton runat="server" id="delete" commandargument=<%#Eval("name") %> commandname="del">ɾ��</asp:LinkButton>
                     <asp:LinkButton runat="server" id="preview" commandargument=<%#Eval("name") %> commandname="preview">Ԥ��</asp:LinkButton>
                
</itemtemplate>
                <itemstyle horizontalalign="Center" width="100px" />
                </asp:TemplateField>
            </Columns>
            <HeaderStyle CssClass="CTitle" />
        </KS:KSGV>
        <br />
        <asp:Panel ID="Panel1" runat="server" Height="30px" Width="739px">
            <asp:Button ID="Button1" runat="server" Text="���������ֶ�����" OnClick="Button1_Click1" />&nbsp;<asp:Button
                ID="Button2" runat="server" Text="Ԥ��ģ��" /><br />
            </asp:Panel>
        &nbsp;
        </div>
     </asp:Panel>
    
    <asp:Panel ID="addPanel" runat="server" Width="100%" Visible="false">
    <script language="javascript">
       function ShowArea()
       {
         var l;
         l=document.all.ctl00$KSContent$FieldType.length;   
         for(i=0;i<l;i++){
         if(eval('document.all.ctl00_KSContent_FieldType_'   +   i).checked)
         {
           var v=eval('document.all.ctl00_KSContent_FieldType_'   +   i).value;
           if (v=="2"||v=="3"){
           $("HeightArea").style.display="";}
           else{
           $("HeightArea").style.display="none";}
           if (v=="10"|| v=="11"){
           $("FileArea").style.display=""}
           else{
           $("FileArea").style.display="none";}
           if(v=="4"||v=="5"||v=="6"){
           $("ListArea").style.display="";}
           else{
           $("ListArea").style.display="none";}
           if (v=="5"||v=="6"){
           $("WidthArea").style.display="none";}
           else{
           $("WidthArea").style.display="";}
           if(v=="6"){
           $("CheckTips").style.display="";}
           else{
           $("CheckTips").style.display="none";}
           if(v=="3"){
            $("ToolbarArea").style.display="";}
            else{
            $("ToolbarArea").style.display="none";}
         }
        }
       }
    </script>
        <KS:TopNav ID="TopNav1" runat="server" Text="������ֶ�" />
         <table width="100%" border="0" cellpadding="1" cellspacing="1" class="CTable"> 
             <tr>
                 <td align="right" class="lefttd" height="30" style="width: 198px">
                     <strong>����ģ�ͣ�</strong></td>
                 <td class="righttd">
                     <asp:Label ID="Label1" runat="server" ForeColor="Red" Text="Label"></asp:Label></td>
             </tr>
            <tr>
                <td align="right" class="lefttd" height="30" style="width: 198px">
                    <strong>�ֶ����ƣ�</strong></td>
                <td class="righttd">
                    <asp:TextBox ID="FieldName" runat="server"></asp:TextBox>
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
                     <asp:TextBox ID="FieldAlias" runat="server"></asp:TextBox>
                     <span style="color: #ff0066">*<asp:RequiredFieldValidator ID="RequiredFieldValidator2"
                         runat="server" ControlToValidate="FieldAlias" ErrorMessage="�������ֶα���"></asp:RequiredFieldValidator><br />
                     </span>��:�����������ϵ��ʽ�ȵ�</td>
             </tr>
             <tr>
                 <td align="right" class="lefttd" style="width: 198px; height: 30px">
                     <strong>�ֶ�¼����ʾ��</strong></td>
                 <td class="righttd" style="height: 30px">
                     <asp:TextBox ID="Tips" runat="server" Height="37px" TextMode="MultiLine" Width="230px"></asp:TextBox>
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
                         <asp:ListItem Value="8">����</asp:ListItem>
                         <asp:ListItem Value="9">��������</asp:ListItem>
                         <asp:ListItem Value="10">ͼƬ</asp:ListItem>
                         <asp:ListItem Value="11">�ļ�</asp:ListItem>
                     </asp:RadioButtonList></td>
             </tr>
             <tr>
                 <td align="right" class="lefttd" style="width: 198px; height: 30px">
                     <strong>Ĭ �� ֵ��</strong></td>
                 <td class="righttd" style="height: 30px">
                     <asp:TextBox ID="DefaultValue" runat="server"></asp:TextBox> <span id="CheckTips" style="color: #ff0033;display:none;">���Ĭ��ѡ�������Ӣ�Ķ���","����</span></td>
             </tr>
             <tbody id="ToolbarArea" style="display:none">
                 <tr>
                     <td align="right" class="lefttd" style="width: 198px; height: 30px">
                         <strong>�༭�����ͣ�</strong></td>
                     <td class="righttd" style="height: 30px">
                         <asp:DropDownList ID="Toolbar" runat="server">
                             <asp:ListItem Value="Basic" Selected="True">����ͱ༭��</asp:ListItem>
                             <asp:ListItem Value="Content">��׼�ͱ༭��</asp:ListItem>
                             <asp:ListItem Value="Default">��ǿ�ͱ༭��</asp:ListItem>
                         </asp:DropDownList></td>
                 </tr>
               </tbody>
             <tbody id="WidthArea">
             <tr>
                 <td align="right" class="lefttd" style="width: 198px; height: 30px">
                     <strong>��ʾ�Ŀ�ȣ�</strong></td>
                 <td class="righttd" style="height: 30px">
                     <asp:TextBox ID="Width" runat="server" Width="44px">160</asp:TextBox>
                     px&nbsp; <span style="color: #ff0066">���磺200px<asp:RegularExpressionValidator ID="RegularExpressionValidator2"
                         runat="server" ControlToValidate="Width" ErrorMessage="����д����" ValidationExpression="\d*"></asp:RegularExpressionValidator></span></td>
             </tr>
             </tbody>
             <tbody id="HeightArea" style="display:none">
             <tr>
                 <td align="right" class="lefttd" style="width: 198px; height: 30px">
                     <strong>��ʾ�ĸ߶ȣ�</strong></td>
                 <td class="righttd" style="height: 30px">
                     <asp:TextBox ID="Height" runat="server" Width="44px">100</asp:TextBox>
                     px&nbsp; <span style="color: #ff0066">���磺200px<asp:RegularExpressionValidator ID="RegularExpressionValidator3"
                         runat="server" ControlToValidate="Height" ErrorMessage="����д����" ValidationExpression="\d*"></asp:RegularExpressionValidator></span></td>
             </tr>
             </tbody>
             <tbody id="ListArea" style="display:none">
                 <tr>
                     <td align="right" class="lefttd" style="width: 198px; height: 39px">
                         <strong>�б�ѡ�<br />
                         </strong><span style="color: #0000ff">ÿһ��Ϊһ���б�ѡ��,ֵ���ı�֮������á�|����������0|��,1|Ů,��ֵ���ı�һ��ʱ������ʡ�ԡ�|�����籱�����Ϻ���</span></td>
                     <td class="righttd" style="height: 39px">
                         <asp:TextBox ID="Options" runat="server" Height="87px" TextMode="MultiLine" Width="219px"></asp:TextBox></td>
                 </tr>
             </tbody>
             <tbody id="FileArea" style="display:none">
             <tr>
                 <td align="right" class="lefttd" style="width: 198px; height: 39px">
                     <strong>�����ϴ����ļ����ͣ�</strong></td>
                 <td class="righttd" style="height: 39px">
                     <asp:TextBox ID="AllowFileExt" runat="server" Width="212px"></asp:TextBox>
                     �����չ�����ã�|������</td>
             </tr>
             <tr>
                 <td align="right" class="lefttd" style="width: 198px; height: 30px">
                     <strong>�����ϴ����ļ���С��</strong></td>
                 <td class="righttd" style="height: 30px">
                     <asp:TextBox ID="MaxFileSize" runat="server" Width="41px"></asp:TextBox>
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