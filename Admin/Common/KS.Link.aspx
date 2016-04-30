<%@ Page Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.Admin_FriendLink" Title="�������ӹ���" Codebehind="KS.Link.aspx.cs" %>
<%@ Import Namespace="Kesion.Publics"%>
<asp:Content ID="Content1" ContentPlaceHolderID="KSContent" Runat="Server">
    <asp:Panel ID="ListPanel" runat="server" Width="100%">
    <div id="manage_top" class="menu_top_fixed">
       <ul>
           <li id='p1'><asp:LinkButton ID="addclassbutton" runat="server" OnClick="addclassbutton_Click"><b></b>�������</asp:LinkButton></li>
           <li id='p4'><asp:LinkButton ID="editclassbutton" runat="server" OnClick="editclassbutton_Click"><b></b>�༭����</asp:LinkButton></li>
           <li id='p3'><asp:LinkButton ID="delclassbutton" runat="server" OnClick="delclassbutton_Click"><b></b>ɾ������</asp:LinkButton></li>
           <li id='p5'><asp:LinkButton ID="topverifybutton" runat="server" OnClick="topverifybutton_Click"><b></b>�������</asp:LinkButton></li>
           <div id="go">
           <asp:DropDownList ID="ShowClassID" runat="server">
           </asp:DropDownList>
           </div>
           </ul>
    </div>  
<div class="menu_top_fixed_height"></div>  
<div class="tabs_header">
    <ul class="tabs">
    <li<%=KSCMS.S("showType")==""?" class='active'":string.Empty %>><a href="KS.Link.Aspx"><span>��������</span></a></li>
    <li<%=KSCMS.S("showType")=="1"?" class='active'":string.Empty %>><a href="KS.Link.Aspx?showType=1"><span>δ��˵�����</span></a></li>
    <li<%=KSCMS.S("showType")=="2"?" class='active'":string.Empty %>><a href="KS.Link.Aspx?showType=2"><span>����˵�����</span></a></li>
    <li<%=KSCMS.S("showType")=="3"?" class='active'":string.Empty %>><a href="KS.Link.Aspx?showType=3"><span>�Ƽ�������</span></a></li>
    <li<%=KSCMS.S("showType")=="4"?" class='active'":string.Empty %>><a href="KS.Link.Aspx?showType=4"><span>����������</span></a></li>
    </ul>
</div>
    
    <KS:ksgv id="List" cssclass="CTable" runat="server" AutoGenerateColumns="False" EmptyDataText="û�����/�����κ���������վ��!" PagerType="CustomNumeric" Width="99%"  GridLines="None" OnRowDataBound="List_RowDataBound" OnRowCommand="List_RowCommand" OnRowCreated="List_RowCreated" >
        <Columns>
            <asp:TemplateField HeaderText="ѡ��">
                <itemstyle horizontalalign="Center" width="50px" />
                <itemtemplate>
                <input type="checkbox"  name="ids" id="ids" value="<%#Eval("linkid") %>" />
              </itemtemplate>
            </asp:TemplateField>
            <asp:BoundField HeaderText="վ������" DataField="sitename" >
            </asp:BoundField>
            <asp:BoundField HeaderText="��������" DataField="classname" >
                <itemstyle width="80px" horizontalalign="Center" />
            </asp:BoundField>
            <asp:BoundField HeaderText="վ��/��λ" DataField="webmaster" >
                <itemstyle width="100px" horizontalalign="Center" />
            </asp:BoundField>
            <asp:BoundField HeaderText="��������" DataField="linktype" >
                <itemstyle width="100px" horizontalalign="Center" />
            </asp:BoundField>
            <asp:BoundField HeaderText="�����" DataField="hits" >
                <itemstyle width="60px" horizontalalign="Center" />
            </asp:BoundField>

            <asp:TemplateField HeaderText="�Ƽ�">
              <itemstyle width="30px" horizontalalign="Center"/>
              <itemtemplate>
                   <a href="?action=recommend&linkid=<%#Eval("linkID")%>" <%# Convert.ToString(Eval("recommend"))=="0"?"class='no' title='��'":"class='ok' title='��'" %>></a>
              </itemtemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="����">
              <itemstyle width="30px" horizontalalign="Center"/>
              <itemtemplate>
                   <a href="?action=locked&linkid=<%#Eval("linkID")%>" <%# Convert.ToString(Eval("locked"))=="0"?"class='no' title='��'":"class='ok' title='��'" %>></a>
              </itemtemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="���">
              <itemstyle width="30px" horizontalalign="Center"/>
              <itemtemplate>
                   <a href="?action=verify&linkid=<%#Eval("linkID")%>" <%# Convert.ToString(Eval("verify"))=="0"?"class='no' title='��'":"class='ok' title='��'" %>></a>
              </itemtemplate>
            </asp:TemplateField>

 
            <asp:BoundField HeaderText="���" DataField="orderid" >
                <itemstyle width="50px" horizontalalign="Center" />
            </asp:BoundField>

            <asp:TemplateField HeaderText="�޸�">
              <itemstyle width="30px" horizontalalign="Center"/>
              <itemtemplate>
                    <asp:LinkButton CssClass="edit" ToolTip="�޸�" ID="LinkButton1" runat="server" commandargument=<%#Eval("linkid") %> commandname="modify"></asp:LinkButton>
              </itemtemplate>
            </asp:TemplateField>

            <asp:TemplateField HeaderText="ɾ��">
                <itemstyle width="30px" horizontalalign="Center" />
             <itemtemplate>
             <asp:LinkButton runat="server" CssClass="delete" ToolTip="ɾ��" id="delete" commandargument=<%#Eval("linkid") %> commandname="del"></asp:LinkButton>
             </itemtemplate>
             </asp:TemplateField>
        </Columns>
        <HeaderStyle CssClass="CTitle" />
            <PagerStyle CssClass="Page" HorizontalAlign="Right" />
            <EmptyDataRowStyle CssClass="emptycss" />
    </KS:ksgv>
            <asp:Panel ID="Panel1" runat="server" Height="30px" Width="741px">
              <div style="margin-top:5px;overflow:hidden;"></div>
            &nbsp;&nbsp;<input type="checkbox" name="chkall" id="chkall" onclick="CheckAll(this.form);"/><label for="chkall">ȫ��ѡ��</label>
            
            &nbsp;&nbsp;&nbsp;<input type="button" value="ɾ��ѡ�е�վ��" onmouseover="this.className='button_on';" onmouseout="this.className='button';" class="button" onclick="if (GetIDS('del')){this.form.action='?action=del';this.form.submit()}" />
                    <asp:Button ID="VerifyButton" runat="server" Text="�������" OnClick="VerifyButton_Click" />
           </asp:Panel>
           
           <KS:Page ID="Page1" runat="server" />
           
           
           
</asp:Panel>


     
    <asp:Panel ID="AddPanel" runat="server" Width="100%" Visible="false">
        <KS:TopNav ID="TopNav1" runat="server" Text="�����������" />
        <script type="text/javascript">
	     function showlogoarea(val)
           {
              if (val=="1")
               jQuery("#logoarea").css('display','');
              else
               jQuery("#logoarea").css('display','none');
           }
       </script>
    <table width="99%" align="center" border="0" cellpadding="1" cellspacing="1" class="CTable"> 
          <tr>
            <td class="lefttd" height="30" align="right" style="width: 150px"><b>վ�����ƣ�</b></td>
            <td class="righttd">
                &nbsp;<asp:TextBox  CssClass="textbox" ID="SiteName" runat="server" Width="268px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="SiteName"
                    ErrorMessage="����дվ������!"></asp:RequiredFieldValidator></td>
          </tr>
        <tr>
            <td align="right" class="lefttd" height="30" style="width: 150px">
                <strong>վ����ࣺ</strong></td>
            <td class="righttd">
                &nbsp;<asp:DropDownList CssClass="select" ID="ClassID" runat="server" Width="158px">
                </asp:DropDownList></td>
        </tr>
        <tr>
            <td align="right" class="lefttd" height="30" style="width: 150px">
                <strong>��վ��ַ��</strong></td>
            <td class="righttd">
                &nbsp;<asp:TextBox  CssClass="textbox" ID="URL" Text="http://" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ControlToValidate="URL" ID="RequiredFieldValidator4" runat="server" ErrorMessage="��������վURL��ַ"></asp:RequiredFieldValidator></td>
        </tr>
        <tr>
            <td align="right" class="lefttd" height="30" style="width: 150px">
                <strong>վ��/���쵥λ��</strong></td>
            <td class="righttd">
                &nbsp;<asp:TextBox  CssClass="textbox" ID="WebMaster" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="WebMaster"
                    ErrorMessage="����дվ��"></asp:RequiredFieldValidator></td>
        </tr>
        <tr>
            <td align="right" class="lefttd" height="30" style="width: 150px">
                <strong>��ϵ���䣺</strong></td>
            <td class="righttd">
                &nbsp;<asp:TextBox  CssClass="textbox" ID="Email" runat="server"></asp:TextBox>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="Email"
                    ErrorMessage="�����ַ����ȷ" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator></td>
        </tr>
        <tr>
            <td align="right" class="lefttd" height="30" style="width: 150px">
                <strong>�������룺</strong></td>
            <td class="righttd">
                &nbsp;<asp:TextBox  CssClass="textbox" ID="PassWord" TextMode="password" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="������ǰ̨��������" ControlToValidate="PassWord" Display="Dynamic"></asp:RequiredFieldValidator>
                <asp:Label ID="Label1" runat="server" Text="���޸�������" Visible="False"></asp:Label></td>
        </tr>
        <tr>
            <td align="right" class="lefttd" height="30" style="width: 150px">
                <strong>ȷ�����룺</strong></td>
            <td class="righttd">
                &nbsp;<asp:TextBox  CssClass="textbox" ID="RePassWord" TextMode="password" runat="server"></asp:TextBox>
                <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="PassWord"
                    ControlToValidate="RePassWord" ErrorMessage="������������벻һ��!" Display="Dynamic"></asp:CompareValidator></td>
        </tr>
        <tr>
            <td align="right" class="lefttd" height="30" style="width: 150px">
                <strong>�������ͣ�</strong></td>
            <td class="righttd">
              <input id="LinkTypeTxt" type="radio" onclick="showlogoarea(0);" name="LinkType" runat="server" checked />��������
              <input id="LinkTypeLogo" type="radio" onclick="showlogoarea(1);" name="LinkType" runat="server" />Logo����
               </td>
        </tr>
        <tr id="logoarea"  style="display:none">
            <td align="right" class="lefttd" height="30" style="width: 150px">
                <strong>վ��Logo��ַ��</strong></td>
            <td class="righttd">
                 <table border="0" cellspacing="0" cellpadding="0">
                     <tr><td><asp:TextBox width="250px" CssClass="textbox" ID="Logo" runat="server"></asp:TextBox>                &nbsp;<input type="button" class="button" onclick="SelectFiles('<%=this.Logo.ClientID%>    ', 1);" value="ѡ��Logo��ַ">
</td><td style="padding-top:12px;padding-left:4px;width:500px"> <%=Kesion.APPCode.UploadAPI.EchoUpload("common",this.Logo.ClientID) %></td></tr>
                 </table>
            </td>
        </tr>
        <tr>
            <td align="right" class="lefttd" style="width: 150px; height: 23px;">
                <strong>�Ƿ�������</strong></td>
            <td class="righttd" style="height: 23px">
                <asp:RadioButtonList ID="Locked" runat="server" RepeatDirection="Horizontal">
                    <asp:ListItem Value="1">��</asp:ListItem>
                    <asp:ListItem Selected="True" Value="0">��</asp:ListItem>
                </asp:RadioButtonList></td>
        </tr>
        <tr>
            <td align="right" class="lefttd" height="30" style="width: 150px">
                <strong>&nbsp;վ��״̬��</strong></td>
            <td class="righttd">
                <asp:RadioButtonList ID="Verify" runat="server" RepeatDirection="Horizontal">
                    <asp:ListItem Selected="True" Value="1">�����</asp:ListItem>
                    <asp:ListItem Value="0">δ���</asp:ListItem>
                </asp:RadioButtonList></td>
        </tr>
        <tr>
            <td align="right" class="lefttd" height="30" style="width: 150px">
                <strong>�Ƿ��Ƽ���</strong></td>
            <td class="righttd">
                <asp:RadioButtonList ID="Recommend" runat="server" RepeatDirection="Horizontal">
                    <asp:ListItem Value="1">��</asp:ListItem>
                    <asp:ListItem Selected="True" Value="0">��</asp:ListItem>
                </asp:RadioButtonList></td>
        </tr>
        <tr>
            <td align="right" class="lefttd" height="30" style="width: 150px">
            <b>վ����ܣ�</b>
            </td>
            <td class="righttd">
                <asp:TextBox  CssClass="textbox" ID="Description" TextMode="MultiLine" Width="420px" runat="server" Height="69px"></asp:TextBox></td>
        </tr>
        <tr>
            <td align="right" class="lefttd" height="30" style="width: 150px">
            <b>������ţ�</b>
            </td>
            <td class="righttd">
                <asp:TextBox  CssClass="textbox" ID="TxtOrderID" Width="50px" style="text-align:center" runat="server"></asp:TextBox> <span class="tips">Tips:���ԽС����Խǰ�档</span></td>
        </tr>
      </table>
      <br />
        <KS:Foot ID="Foot1" runat="server" OnSubmit="Foot1_Submit" />
      
    </asp:Panel>

</asp:Content>
