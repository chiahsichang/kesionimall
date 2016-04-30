<%@ Page Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.Admin_CopyFrom" Title="��Դ����" Codebehind="KS.CopyFrom.aspx.cs" %>
<%@ Import Namespace="Kesion.BLL" %>
<asp:Content ID="Content1" ContentPlaceHolderID="KSContent" Runat="Server">
<asp:Panel ID="listPanel" runat="server" Width="100%">
    <div id="manage_top" class="menu_top_fixed">
        <ul>
           <li id='p1'><asp:LinkButton ID="addcopyfrom" runat="server" OnClick="addcopyfrom_Click"><b></b>�����Դ</asp:LinkButton></li>
           <li id='p4'><asp:LinkButton ID="editcopyfrom" runat="server" OnClick="editcopyfrom_Click"><b></b>�༭��Դ</asp:LinkButton></li>
           <li id='p3'><asp:LinkButton ID="delcopyfrom" runat="server" OnClick="delcopyfrom_Click"><b></b>ɾ����Դ</asp:LinkButton></li>
        </ul>
    </div>  
    <div class="menu_top_fixed_height"></div> 

      <KS:KSGV ID="list" cssclass="CTable" runat="server" AutoGenerateColumns="False" Width="99%" EmptyDataText="û������κ���Դ" GridLines="None" OnRowDataBound="list_RowDataBound" OnRowCommand="list_RowCommand" OnRowCreated="list_RowCreated">
          <Columns>
              <asp:TemplateField HeaderText="&lt;input type='checkbox' name='chkall' id='chkall' onClick='CheckAll(this.form);'/&gt;">
                <ItemStyle HorizontalAlign="Center"  Width="30px"/>
                <ItemTemplate>
                <input type="checkbox"  name="ids" id="ids" value="<%#Eval("copyfromid") %>" />
                </ItemTemplate>
                </asp:TemplateField>
              <asp:BoundField DataField="copyfromname" HeaderText="��Դ����" />
              <asp:BoundField DataField="website" HeaderText="��ַ" >
                  <itemstyle horizontalalign="Center" />
              </asp:BoundField>
              <asp:BoundField DataField="contactman" HeaderText="��ϵ��" >
                  <itemstyle horizontalalign="Center" />
              </asp:BoundField>
              <asp:BoundField DataField="telphone" HeaderText="�绰" >
                  <itemstyle horizontalalign="Center" width="80px" />
              </asp:BoundField>
              <asp:BoundField DataField="fax" HeaderText="����" >
                  <itemstyle horizontalalign="Center" width="80px" />
              </asp:BoundField>

               <asp:TemplateField HeaderText="״̬">
              <itemstyle width="30px" horizontalalign="Center"/>
              <itemtemplate>
                   <a href="?action=status&id=<%#Eval("copyfromid")%>" <%# Convert.ToString(Eval("status"))=="0"?"class='no' title='����'":"class='ok' title='����'" %>></a>
              </itemtemplate>
            </asp:TemplateField>


             <asp:TemplateField HeaderText="�༭">
                    <itemstyle width="30px" horizontalalign="Center"/>
                       <itemtemplate>
             <asp:LinkButton ID="LinkButton1" CssClass="edit" ToolTip="�༭" runat="server" commandargument=<%#Eval("copyfromid") %> commandname="modify"></asp:LinkButton>
                    </itemtemplate>
                </asp:TemplateField>
            <asp:TemplateField HeaderText="ɾ��">
                    <itemstyle width="30px" horizontalalign="Center"/>
                       <itemtemplate>
             <asp:LinkButton runat="server" id="delete" CssClass="delete" ToolTip="ɾ��" commandargument=<%#Eval("copyfromid") %> commandname="del"><img src="../../admin/images/del.gif" border="0" title="ɾ��"/>ɾ��</asp:LinkButton>
                    </itemtemplate>
                </asp:TemplateField>

           
          </Columns>
         
            <HeaderStyle CssClass="CTitle" />
            <EmptyDataRowStyle CssClass="emptycss" />
      </KS:KSGV>
      

    
            <KS:Page ID="Page1" runat="server" />
          

    </asp:Panel>


<asp:Panel ID="addPanel" runat="server" Width="100%" Visible="false">
     <KS:TopNav ID="TopNav1" runat="server" Text="�����Դ" />
        <table width="100%" border="0" cellpadding="1" cellspacing="1" class="CTable"> 
          <tr>
            <td class="lefttd" height="30" align="right"><b>��Դ���ƣ�</b></td>
            <td class="righttd">
                &nbsp;<asp:TextBox CssClass="textbox" ID="CopyFromName" runat="server"></asp:TextBox> <font color=#ff0000>*</font>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="CopyFromName"
                    ErrorMessage="��������Դ����!"></asp:RequiredFieldValidator></td>
          </tr>
            <tr>
                <td align="right" class="lefttd" height="30">
                    <strong>��λ��ַ��</strong></td>
                <td class="righttd">
                    &nbsp;<asp:TextBox CssClass="textbox" ID="WebSite" runat="server">http://</asp:TextBox>
                    <span class="tips">���������������ӵ�URL</span></td>
            </tr>
            <tr>
                <td align="right" class="lefttd" height="30">
                    <strong>�� ϵ �ˣ�</strong></td>
                <td class="righttd">
                    &nbsp;<asp:TextBox CssClass="textbox" ID="ContactMan" runat="server"></asp:TextBox>&nbsp;
                    </td>
            </tr>
            <tr>
                <td align="right" class="lefttd" height="30">
                    <strong>��ϵ��ַ��</strong></td>
                <td class="righttd">
                    &nbsp;<asp:TextBox CssClass="textbox" ID="Address" runat="server" Width="350px"></asp:TextBox>
                    </td>
            </tr>
            <tr>
                <td align="right" class="lefttd" height="30">
                    <strong>��ϵ�绰��</strong></td>
                <td class="righttd">
                    &nbsp;<asp:TextBox CssClass="textbox" ID="TelPhone" runat="server" Width="350px"></asp:TextBox>
                    </td>
            </tr>
            <tr>
                <td align="right" class="lefttd" height="30">
                    <strong>������룺</strong></td>
                <td class="righttd">
                    &nbsp;<asp:TextBox CssClass="textbox" ID="Fax" runat="server" Width="350px"></asp:TextBox>
                    <span class="tips">��ʽ��XXX-XXXXXXX</span></td>
            </tr>
            <tr>
                <td align="right" class="lefttd" height="30">
                    <strong>�������룺</strong></td>
                <td class="righttd">
                    &nbsp;<asp:TextBox CssClass="textbox" ID="ZipCode" runat="server" Width="66px"></asp:TextBox>
                    <span class="tips">6λ���ʱ�</span><asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server"
                        ControlToValidate="ZipCode" ErrorMessage="RegularExpressionValidator" ValidationExpression="\d{6}">�������벻��ȷ</asp:RegularExpressionValidator></td>
            </tr>
            <tr>
                <td align="right" class="lefttd" style="width: 198px; height: 50px;">
                    <strong>�������䣺</strong></td>
                <td class="righttd" style="height: 50px">
                    &nbsp;<asp:TextBox CssClass="textbox" ID="Email" runat="server"></asp:TextBox>
                    <span class="tips">���õĵ�������</span><asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server"
                        ControlToValidate="Email" ErrorMessage="�������䲻��ȷ!" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator></td>
            </tr>
            <tr>
                <td align="right" class="lefttd" height="30">
                    <strong>��Դ���ࣺ</strong></td>
                <td class="righttd">
                    &nbsp;<asp:TextBox CssClass="textbox" ID="Class" runat="server" Width="149px"></asp:TextBox>&nbsp;
                    <select name="classlist" onchange="$('<%=Class.ClientID %>').value=this.value;">
                    <option></option>
                    <%=BaseFun.GetSQLOption("select Distinct class,class from ks_copyfrom", "")%>
                    </select>
                    </td>
            </tr>
            <tr>
                <td align="right" class="lefttd" height="30">
                    <strong>��Դ��飺</strong></td>
                <td class="righttd">
                    &nbsp;<asp:TextBox CssClass="textbox textarea" ID="Intro" runat="server" Height="76px" TextMode="MultiLine" Width="350px"></asp:TextBox></td>
            </tr>
            <tr>
                <td align="right" class="lefttd" height="30">
                    <strong>�Ƿ����ã�</strong></td>
                <td class="righttd">
                    <asp:RadioButtonList ID="Status" runat="server" RepeatDirection="Horizontal">
                        <asp:ListItem Selected="True" Value="1">����</asp:ListItem>
                        <asp:ListItem Value="0">����</asp:ListItem>
                    </asp:RadioButtonList></td>
            </tr>
        </table>
      <br />
      <KS:Foot ID="Foot1" runat="server" OnSubmit="Foot1_Submit" />
    </asp:Panel>

</asp:Content>

