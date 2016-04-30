<%@ Page Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.Admin.Shop.Admin_ShopBookCodeType" Title="ԤԼ��������" Codebehind="KS.ShopBookCodeType.aspx.cs" %>
<asp:Content ID="Content1" ContentPlaceHolderID="KSContent" Runat="Server">
    <asp:Panel ID="ListPanel" runat="server" Width="100%">
    <div id="manage_top" class="menu_top_fixed">
         <ul>
           <li id='p1'><b></b><asp:LinkButton ID="addclassbutton" runat="server" OnClick="addclassbutton_Click">���ԤԼ�����</asp:LinkButton></li>
             <li id='p2'><b></b><asp:LinkButton ID="editclassbutton" runat="server" OnClick="editclassbutton_Click">�༭ԤԼ�����</asp:LinkButton></li>
             <li id='p3'><b></b><asp:LinkButton ID="delclassbutton" runat="server" OnClick="delclassbutton_Click">ɾ��ԤԼ�����</asp:LinkButton></li></ul>
        </div>  
        <div class="menu_top_fixed_height"></div>  
        
    <KS:ksgv id="List" runat="server" AutoGenerateColumns="False" CssClass="CTable" EmptyDataText="û������κ�ԤԼ�����!" PagerType="CustomNumeric" Width="99%" HorizontalAlign="Center" GridLines="None" OnRowDataBound="List_RowDataBound" OnRowCommand="List_RowCommand" OnRowCreated="List_RowCreated">
        <Columns>
         <asp:TemplateField HeaderText="ѡ��">
                <itemstyle horizontalalign="Center" width="50px" />
                <itemtemplate>
                <input type="checkbox"  name="ids" id="ids" value="<%#Eval("typeid") %>" />
                </itemtemplate>
            </asp:TemplateField>
            <asp:BoundField HeaderText="����ID" DataField="TypeID" >
                <itemstyle width="50px" Height="30px" horizontalalign="Center" />
            </asp:BoundField>
            <asp:BoundField HeaderText="��������" DataField="TypeName" HtmlEncode="False" >
                <itemstyle  verticalalign="Middle" />
            </asp:BoundField>
            <asp:TemplateField HeaderText="����ʱ��">
              <itemstyle horizontalalign="Center"/>
              <itemtemplate>
                  <%# Eval("AddDate") %>
              </itemtemplate>
             </asp:TemplateField>
            <asp:TemplateField HeaderText="��������">
              <itemstyle horizontalalign="Center"/>
              <itemtemplate>
                  <%# Convert.ToString(Eval("IsOpenApply"))=="1"?"��":"<span style='color:red'>��</span>" %>
              </itemtemplate>
             </asp:TemplateField>
            <asp:TemplateField HeaderText="����֪ͨ">
              <itemstyle width="70px" horizontalalign="Center"/>
              <itemtemplate>
                  <asp:Button ID="BtnSms" Text="����������" CssClass="button" runat="server" commandargument=<%#Eval("typeid") %> commandname="sms"></asp:Button>

              </itemtemplate>
             </asp:TemplateField>
            <asp:TemplateField HeaderText="�༭">
              <itemstyle width="30px" horizontalalign="Center"/>
              <itemtemplate>
             <asp:LinkButton ID="LinkButton1" CssClass="edit" ToolTip="�༭" runat="server" commandargument=<%#Eval("typeid") %> commandname="modify"></asp:LinkButton>
              </itemtemplate>
             </asp:TemplateField>
            <asp:TemplateField HeaderText="ɾ��">
                <itemstyle width="30px" horizontalalign="Center" />
             <itemtemplate>
             <asp:LinkButton runat="server" CssClass="delete" ToolTip="ɾ��" id="delete" commandargument=<%#Eval("typeid") %> commandname="del"></asp:LinkButton>
            </itemtemplate>
            </asp:TemplateField>
              <asp:TemplateField HeaderText="����">
                       <itemstyle horizontalalign="Center" width="25"/>
                        <itemtemplate>
                           <a class="apply" href="../../shop/bookCodeApply.aspx?id=<%# Eval("typeid") %>" title="����ԤԼ���ַURL" target="_blank"></a>
                        </itemtemplate>
             </asp:TemplateField>
        </Columns>
        <HeaderStyle CssClass="CTitle" />
        <EmptyDataRowStyle CssClass="emptycss" />
       
    </KS:ksgv>
    
 <KS:Page ID="Page1" runat="server" />
       <asp:Panel ID="Panel1" runat="server" Height="30px" Width="100%">
                <br />
        <script type="text/javascript">
		showtips('<span class="state"><strong>����˵����</strong><br /></span>ԤԼ�����ֱ�Ӱ���Ʒ���ƣ�����һ��������Ҫɾ��������');
		</script>

            </asp:Panel>
</asp:Panel>


     
    <asp:Panel ID="AddPanel" runat="server"  Width="100%" Visible="false">
    <KS:TopNav ID="TopNav1" runat="server" Text="���ԤԼ�����" />
    <table width="99%" align="center" border="0" cellpadding="1" cellspacing="1" class="CTable"> 
          <tr>
            <td class="lefttd" height="30" align="right" style="width: 120px"><b>ԤԼ��������ƣ�</b></td>
            <td class="righttd">
                &nbsp;<asp:TextBox CssClass="textbox" ID="TypeName" runat="server" Width="203px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TypeName"
                    ErrorMessage="����дԤԼ���������!" Display="Dynamic"></asp:RequiredFieldValidator> <span class="tips">���һ�ڣ��ڶ��ڵȡ�</span></td>
        </tr>
            <tr>
                 <td align="right" class="lefttd" style=" height: 30px">
                     <strong>ԤԼ���������ʱ�䣺</strong></td>
                 <td class="righttd"">
                 &nbsp;<asp:TextBox ID="TxtAddDate" Width="203px" runat="server" onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'});" CssClass="textbox Wdate" />
                     <span class="tips">��ʽ��<%=DateTime.Now.ToString() %></span>
                 </td>
             </tr>
           <tr>
                 <td align="right" class="lefttd" style=" height: 30px">
                     <strong>ÿ���������Ʒ��ţ�</strong></td>
                 <td class="righttd"">
                 &nbsp;<asp:TextBox ID="TxtCityNum" Width="60px" runat="server" CssClass="textbox" Text="10" />��ԤԼ��
                     <span class="tips">������������"0".</span>
                 </td>
           </tr>
            <tr>
                 <td align="right" class="lefttd" style=" height: 30px">
                     <strong>��������ʱ��Σ�</strong></td>
                 <td class="righttd"">
                 &nbsp;<asp:TextBox ID="TxtBeginDate" Width="203px" runat="server" onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'});" CssClass="textbox Wdate" />
                ��<asp:TextBox ID="TxtEndDate" Width="203px" runat="server" onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'});" CssClass="textbox Wdate" />
                     <span class="tips">��ʽ��<%=DateTime.Now.ToString() %></span>
                 </td>
             </tr>
          <tr>
            <td class="lefttd" height="30" align="right"><b>����ɹ��ֻ�����Ϣ��ʾ��Ϣ��</b></td>
            <td class="righttd">
                &nbsp;<asp:TextBox CssClass="textbox" ID="TxtNode" TextMode="MultiLine" Height="50px" runat="server" Width="503px"></asp:TextBox>
                <br /><span class="tips">������255���ַ����������ֻ�����֪ͨ�������ա� ���ñ�ǩ���£�<br />{$typename} ԤԼ���������<br />
                    {$codeid} ԤԼ��<br />
                    {$username} ��Ա����<br />
                    {$city} ʹ�ó���<br />
                    {$realname} �ջ���
                </span>
               </td>
        </tr>
          <tr>
            <td class="lefttd" height="30" align="right"><b>�Ƿ񿪷����룺</b></td>
            <td class="righttd">
                 <asp:RadioButtonList ID="RdbIsOpenApply" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow">
                     <asp:ListItem Value="1" Selected="True">��</asp:ListItem>
                     <asp:ListItem Value="0">��</asp:ListItem>
                 </asp:RadioButtonList>
               </td>
        </tr>
          <tr>
            <td class="lefttd" height="30" align="right"><b>ֻ�����Ա���룺</b></td>
            <td class="righttd">
                 <asp:RadioButtonList ID="RdbApplyMustLogin" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow">
                     <asp:ListItem Value="1" Selected="True">��</asp:ListItem>
                     <asp:ListItem Value="0">��</asp:ListItem>
                 </asp:RadioButtonList>
               </td>
        </tr>
          <tr>
            <td class="lefttd" height="30" align="right"><b>ÿ����Ա�������룺</b></td>
            <td class="righttd">
                <asp:TextBox ID="TxtApplyNum" runat="server" Text="1" CssClass="textbox" Width="50"></asp:TextBox>��
                <span class="tips">ֻ������Ϊֻ�����Ա����,��������ò���Ч,������������"0".</span>
               </td>
        </tr>

        
      </table>
      <br />
        <KS:Foot ID="Foot1" runat="server" OnSubmit="Foot1_Submit" />
      
    </asp:Panel>

    <asp:Panel ID="PanelSMS" runat="server" Visible="false">

         <KS:TopNav ID="TopNav2" runat="server" Text="Ⱥ���ֻ�����Ϣ��֪ͨ���Ź���" />
        <table width="99%" align="center" border="0" cellpadding="1" cellspacing="1" class="CTable"> 
          <tr>
            <td class="lefttd" height="30" align="right" style="width: 139px"><strong>ԤԼ�ɹ����û�����</strong></td>
            <td class="righttd">
                &nbsp;<span style="color:red;font-weight:bold"><asp:Label ID="LabNum" runat="server"></asp:Label></span> λ��
            </td>
          </tr>
          <tr>
            <td class="lefttd" height="30" align="right"><strong>�������ݣ�</strong></td>
            <td class="righttd">
               <asp:TextBox ID="TxtContent" runat="server" Rows="10" Columns="80" height="120px" Width="350px" TextMode="MultiLine" CssClass="textbox  textarea">����{$username},������ԤԼ����Ʒ[{$typename}]�ѿ��Ź����ˣ��뾡�쵽[{$sitename}]������</asp:TextBox>
                <div class="tips">
                    <strong>���ñ�ǩ��</strong><br />
                    {$username} �û���
                    <br />
                    {$realname} �ջ�������
                    <br />
                    {$typename} ԤԼ���������
                    <br />
                    {$sitename} ��վ����
                </div>

            </td>
          </tr>
         <tr>
            <td class="lefttd" height="30" align="right"><strong>����ѡ�</strong></td>
            <td class="righttd">
                &nbsp;
                <asp:CheckBox ID="CkbIsUsed" runat="server"  Checked="true" Text="������ԤԼ��δʹ�õĿͻ�"/>
            </td>
          </tr>
        </table>
         <br />
        <asp:HiddenField ID="HidValue" runat="server" Value="0" />
        <KS:Foot ID="Foot2" runat="server" OnSubmit="Foot2_Submit" />
    </asp:Panel>

</asp:Content>
