<%@ Page Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.Admin_Author" Title="Untitled Page" Codebehind="KS.Author.aspx.cs" %>
<asp:Content ID="Content1" ContentPlaceHolderID="KSContent" Runat="Server">
    <asp:Panel ID="listPanel" runat="server" Width="100%">
    <div id="manage_top" class="menu_top_fixed">
         <ul>
           <li id='p1'><asp:LinkButton ID="addauthor" runat="server" OnClick="addauthor_Click"><b></b>�������</asp:LinkButton></li><li id='p4'><asp:LinkButton ID="editauthor" runat="server" OnClick="editauthor_Click"><b></b>�༭����</asp:LinkButton></li><li id='p3'><asp:LinkButton ID="delauthor" runat="server" OnClick="delauthor_Click"><b></b>ɾ������</asp:LinkButton></li>
           </ul>
   </div>  
<div class="menu_top_fixed_height"></div> 
      <KS:KSGV ID="list" cssclass="CTable" runat="server" AutoGenerateColumns="False"  Width="99%" EmptyDataText="û������κ�����" GridLines="None" OnRowDataBound="list_RowDataBound" OnRowCommand="list_RowCommand" OnRowCreated="list_RowCreated" AllowPaging="False">
          <Columns>
               <asp:TemplateField HeaderText="&lt;input type='checkbox' name='chkall' id='chkall' onClick='CheckAll(this.form);'/&gt;">
                <ItemStyle HorizontalAlign="Center"  Width="30px"/>
                <ItemTemplate>
                <input type="checkbox"  name="ids" id="ids" value="<%#Eval("authorid") %>" />
                </ItemTemplate>
                </asp:TemplateField>
              <asp:BoundField DataField="authorname" HeaderText="��������" />
              <asp:BoundField DataField="sex" HeaderText="�Ա�" >
                  <itemstyle horizontalalign="Center" width="50px" />
              </asp:BoundField>
              <asp:BoundField DataField="workunits" HeaderText="������λ" >
                  <itemstyle horizontalalign="Center" />
              </asp:BoundField>
              <asp:BoundField DataField="address" HeaderText="��ϵ��ַ" >
                  <itemstyle horizontalalign="Center" />
              </asp:BoundField>
              <asp:BoundField DataField="telphone" HeaderText="�绰" >
                  <itemstyle horizontalalign="Center" width="80px" />
              </asp:BoundField>
              <asp:BoundField DataField="QQ" HeaderText="QQ" >
                  <itemstyle horizontalalign="Center" width="60px" />
              </asp:BoundField>

               <asp:TemplateField HeaderText="�༭">
                    <itemstyle width="30px" horizontalalign="Center"/>
                       <itemtemplate>
             <asp:LinkButton ID="LinkButton1" CssClass="edit" ToolTip="�༭" runat="server" commandargument=<%#Eval("authorid") %> commandname="modify"></asp:LinkButton>
                    </itemtemplate>
                </asp:TemplateField>
            <asp:TemplateField HeaderText="ɾ��">
                    <itemstyle width="30px" horizontalalign="Center"/>
                       <itemtemplate>
             <asp:LinkButton runat="server" CssClass="delete" ToolTip="ɾ��" id="delete" commandargument=<%#Eval("authorid") %> commandname="del"></asp:LinkButton>
                    </itemtemplate>
                </asp:TemplateField>


          </Columns>
            <HeaderStyle CssClass="CTitle" />
            <EmptyDataRowStyle CssClass="emptycss" />
      </KS:KSGV>
      

    
        <KS:Page ID="Page1" runat="server" />
            

    </asp:Panel>
    
     <asp:Panel ID="addPanel" runat="server" Width="100%" Visible="false">
     <KS:TopNav ID="TopNav1" runat="server" Text="�������" />
        <table width="99%" style="margin:0 auto;" border="0" cellpadding="1" cellspacing="1" class="CTable"> 
          <tr>
            <td class="lefttd" height="30" align="right"><b>����������</b></td>
            <td class="righttd">
                &nbsp;<asp:TextBox CssClass="textbox" ID="AutherName" runat="server"></asp:TextBox> <font color=#ff0000>*</font>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="AutherName"
                    ErrorMessage="��������������!"></asp:RequiredFieldValidator></td>
          </tr>
            <tr>
                <td align="right" class="lefttd" height="30">
                    <strong>�����Ա�</strong></td>
                <td class="righttd">
                    <asp:RadioButtonList ID="Sex" runat="server" RepeatDirection="Horizontal">
                        <asp:ListItem Selected="True" Value="��">��</asp:ListItem>
                        <asp:ListItem Value="Ů">Ů</asp:ListItem>
                    </asp:RadioButtonList></td>
            </tr>
            <tr>
                <td align="right" class="lefttd" height="30">
                    <strong>�������ڣ�</strong></td>
                <td class="righttd">
                    &nbsp;<asp:TextBox CssClass="textbox Wdate" ID="Birthday" onClick="WdatePicker()" runat="server"></asp:TextBox>
                     
                    </td>
            </tr>
            <tr>
                <td align="right" class="lefttd" height="30">
                    <strong>������λ��</strong></td>
                <td class="righttd">
                    &nbsp;<asp:TextBox CssClass="textbox" ID="WorkUnits" runat="server" Width="350px"></asp:TextBox>
                    <span class="tips">��վ��Լ�������ڵĹ�����λ</span></td>
            </tr>
            <tr>
                <td align="right" class="lefttd" height="30">
                    <strong>��ϵ��ַ��</strong></td>
                <td class="righttd">
                    &nbsp;<asp:TextBox CssClass="textbox" ID="Address" runat="server" Width="350px"></asp:TextBox>
                    <span class="tips">��վ��Լ���ߵ���ϵ��ַ</span></td>
            </tr>
            <tr>
                <td align="right" class="lefttd" height="30">
                    <strong>��ϵ�绰��</strong></td>
                <td class="righttd">
                    &nbsp;<asp:TextBox CssClass="textbox" ID="Telphone" runat="server" Width="350px"></asp:TextBox>
                    <span class="tips">��ʽ��XXX-XXXXXXX</span></td>
            </tr>
            <tr>
                <td align="right" class="lefttd" height="30">
                    <strong>�������룺</strong></td>
                <td class="righttd">
                   &nbsp;<asp:TextBox CssClass="textbox" ID="ZipCode" runat="server" Width="66px"></asp:TextBox>
                    6λ���ʱ�<asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server"
                        ControlToValidate="ZipCode" ErrorMessage="RegularExpressionValidator" ValidationExpression="\d{6}">�������벻��ȷ</asp:RegularExpressionValidator></td>
            </tr>
            <tr>
                <td align="right" class="lefttd" height="30">
                    <strong>�������䣺</strong></td>
                <td class="righttd">
                    &nbsp;<asp:TextBox CssClass="textbox" ID="Email" runat="server"></asp:TextBox>
                    <span class="tips">���õĵ�������</span><asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server"
                        ControlToValidate="Email" ErrorMessage="�������䲻��ȷ!" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator></td>
            </tr>
            <tr>
                <td align="right" class="lefttd" height="30">
                    <strong>��ϵ�ѣѣ�</strong></td>
                <td class="righttd">
                    &nbsp;<asp:TextBox CssClass="textbox" ID="QQ" runat="server" Width="149px"></asp:TextBox>&nbsp;</td>
            </tr>
            <tr>
                <td align="right" class="lefttd" height="30">
                    <strong>������ҳ��</strong></td>
                <td class="righttd">
                   &nbsp;<asp:TextBox CssClass="textbox" ID="HomePage" runat="server" Width="350px">http://</asp:TextBox></td>
            </tr>
            <tr>
                <td align="right" class="lefttd" height="30">
                    <strong>���˼�����</strong></td>
                <td class="righttd">
                   &nbsp;<asp:TextBox CssClass="textbox textarea" ID="Resume" runat="server" Height="76px" TextMode="MultiLine" Width="350px"></asp:TextBox></td>
            </tr>
        </table>
      <br />
      <KS:Foot ID="Foot1" runat="server" OnSubmit="Foot1_Submit" />
    </asp:Panel>

</asp:Content>

