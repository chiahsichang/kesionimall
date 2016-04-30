<%@ Page Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.Admin_CollectFilter" Title="�ɼ����˹���" Codebehind="KS.CollectFilter.aspx.cs" %>
<asp:Content ID="Content1" ContentPlaceHolderID="KSContent" Runat="Server">
    <asp:Panel ID="ListPanel" runat="server" Width="100%">
    <div id="manage_top" class="menu_top_fixed">
       <ul>
           <li id='p1'><asp:LinkButton ID="addclassbutton" runat="server" OnClick="addclassbutton_Click"><b></b>��ӹ��˹���</asp:LinkButton></li>
           <li id='p4'><asp:LinkButton ID="editclassbutton" runat="server" OnClick="editclassbutton_Click"><b></b>�༭���˹���</asp:LinkButton></li>
           <li id='p3'><asp:LinkButton ID="delclassbutton" runat="server" OnClick="delclassbutton_Click"><b></b>ɾ�����˹���</asp:LinkButton></li>
           
           </ul>
    </div>  
     <div class="menu_top_fixed_height"></div>  
    <KS:ksgv id="List" cssclass="CTable" runat="server" AutoGenerateColumns="False" EmptyDataText="û������κβɼ����˹���!" PagerType="CustomNumeric" Width="99%" HorizontalAlign="center" GridLines="None" OnRowDataBound="List_RowDataBound" OnRowCommand="List_RowCommand" OnRowCreated="List_RowCreated" AllowPaging="False">
        <Columns>
            <asp:TemplateField HeaderText="ѡ��">
                <itemstyle horizontalalign="Center" width="50px" />
                
                <itemtemplate>
<input type="checkbox"  name="ids" id="ids" value="<%#Eval("FilterID") %>" />
            
</itemtemplate>
            </asp:TemplateField>
             <asp:TemplateField HeaderText="״̬">
              <itemstyle width="30px" horizontalalign="Center"/>
              <itemtemplate>
                   <a href="?action=status&FilterID=<%#Eval("FilterID")%>" <%# Convert.ToString(Eval("status"))=="0"?"class='no' title='������'":"class='ok' title='����'" %>></a>
              </itemtemplate>
            </asp:TemplateField>


            <asp:BoundField HeaderText="��������" DataField="FilterName" >
             
            </asp:BoundField>

            <asp:BoundField HeaderText="���ʱ��" DataField="AddDate" >
                <itemstyle width="250px" horizontalalign="Center" />
            </asp:BoundField>

            <asp:TemplateField HeaderText="�༭">
              <itemstyle width="30px" horizontalalign="Center"/>
              <itemtemplate>
             <asp:LinkButton ID="LinkButton1" ToolTip="�༭" CssClass="edit" runat="server" commandargument=<%#Eval("FilterID") %> commandname="modify"></asp:LinkButton>
              </itemtemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="ɾ��">
                <itemstyle width="30px" horizontalalign="Center" />
             <itemtemplate>
             <asp:LinkButton runat="server" ToolTip="ɾ��" CssClass="delete"  id="delete" commandargument=<%#Eval("FilterID") %> commandname="del"></asp:LinkButton>
            </itemtemplate>
            </asp:TemplateField>
        </Columns>
        <HeaderStyle CssClass="CTitle" />
            <EmptyDataRowStyle CssClass="emptycss" />
    </KS:ksgv>
            <asp:Panel ID="Panel1" runat="server" Height="30px">
              <div style="margin-top:5px;overflow:hidden;"></div>
            &nbsp;&nbsp;<input type="checkbox" name="chkall" id="chkall" onclick="CheckAll(this.form);"/><label for="chkall">ȫ��ѡ��</label>
                        <input type="button" value="ɾ��ѡ�еļ�¼" onmouseover="this.className='button_on';" onmouseout="this.className='button';" class="button" onclick="if (GetIDS('del')){this.form.action='?action=del';this.form.submit()}" />
                    <br />
<KS:Page ID="Page1" runat="server" />
           </asp:Panel>
</asp:Panel>


     
    <asp:Panel ID="PannelStep1" runat="server" Width="100%" Visible="false">
        <KS:TopNav ID="TopNav1" runat="server" Text="��Ӳɼ����˹���" />
    <table width="99%" align="center" border="0" cellpadding="1" cellspacing="1" class="CTable"> 
          <tr>
            <td class="lefttd" align="right" style="height:30px;width: 198px"><b>�������ƣ�</b></td>
            <td class="righttd">
                &nbsp;<asp:TextBox CssClass="textbox" ID="TxtFilterName" runat="server" Width="268px"></asp:TextBox>
                <span style="color: #009900">�磺������Ŀ���˵�</span><asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TxtFilterName"
                    ErrorMessage="����д��������!"></asp:RequiredFieldValidator></td>
          </tr>
        <tr>
            <td align="right" class="lefttd" style="height:30px;width: 198px">
                <strong>�滻��ʽ��</strong></td>
            <td class="righttd">&nbsp;<asp:DropDownList ID="DrpFilterType" runat="server" AutoPostBack="True" OnSelectedIndexChanged="FilterType_SelectedIndexChanged">
                    <asp:ListItem Value="1">�򵥹滻</asp:ListItem>
                    <asp:ListItem Value="2">�߼��滻</asp:ListItem>
                </asp:DropDownList></td>
        </tr>
        <tr>
            <td align="right" class="lefttd" style="height:30px;width: 198px">
                <strong>
                <asp:Label ID="LabBeginTagText" runat="server" Text="�������ݣ�"></asp:Label></strong></td>
            <td class="righttd">
                &nbsp;<asp:TextBox ID="TxtBeginTag" TextMode="multiLine" runat="server" Width="420px" Height="69px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TxtBeginTag"
                    ErrorMessage="����д��������!"></asp:RequiredFieldValidator></td>
        </tr>
        <tr id="endTag" runat="server" visible="false">
            <td align="right" class="lefttd" style="height:30px;width: 198px">
                <strong>������ǣ�</strong></td>
            <td class="righttd">
                &nbsp;<asp:TextBox ID="TxtEndTag" TextMode="multiLine" runat="server" Width="420px" Height="69px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="TxtEndTag"
                    ErrorMessage="����д�������!" Enabled="false"></asp:RequiredFieldValidator></td>
        </tr>

        <tr>
            <td align="right" class="lefttd" style="height:30px;width: 198px">
            <b>�滻���ݣ�</b>
            </td>
            <td class="righttd">
                &nbsp;<asp:TextBox ID="TxtReplaceBody" TextMode="MultiLine" Width="420px" runat="server" Height="69px"></asp:TextBox></td>
        </tr>
        <tr>
            <td align="right" class="lefttd" style="width: 198px; height: 30px">
                <strong>�Ƿ����ã�</strong></td>
            <td class="righttd">
                <asp:RadioButtonList ID="RdlStatus" runat="server" RepeatDirection="Horizontal"
                    RepeatLayout="Flow">
                    <asp:ListItem Selected="True" Value="1">����</asp:ListItem>
                    <asp:ListItem Value="0">������</asp:ListItem>
                </asp:RadioButtonList></td>
        </tr>
      </table>
      <br />
        <KS:Foot ID="Foot1" runat="server" OnSubmit="Foot1_Submit" SubmitButtonText="ȷ������(0)" />
      
    </asp:Panel>
    

    

</asp:Content>