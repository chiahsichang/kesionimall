<%@ Page Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.Admin_KeyTags" Title="�ؼ���Tags����" Codebehind="KS.KeyTags.aspx.cs" %>
<%@ Import Namespace="Kesion.Publics" %>
<asp:Content ID="Content1" ContentPlaceHolderID="KSContent" Runat="Server">
  <asp:Panel runat="server" ID="listPannel" Width="100%">  
      <div id="manage_top" class="menu_top_fixed">
        <ul>
           <li id='p1'><asp:LinkButton ID="addtags" runat="server" OnClick="addtags_Click"><b></b>��ӹؼ���Tags</asp:LinkButton></li>
           <li id='p4'><asp:LinkButton ID="edittags" runat="server" OnClick="edittags_Click"><b></b>�༭�ؼ���Tags</asp:LinkButton></li>
           <li id='p3'><asp:LinkButton ID="deltags" runat="server" OnClick="deltags_Click"><b></b>ɾ���ؼ���Tags</asp:LinkButton></li>
           <li id='p16'><asp:LinkButton ID="LinkButton2" OnClientClick="return(GetIDS());" runat="server" OnClick="Button1_Click"><b></b>��������</asp:LinkButton></li>
           <li id='p17'><asp:LinkButton ID="LinkButton3" OnClientClick="return(GetIDS());" runat="server" OnClick="Button2_Click"><b></b>��������</asp:LinkButton></li>
        </ul>
      </div>  
      <div class="menu_top_fixed_height"></div> 
      <KS:KSGV ID="list" cssclass="CTable" runat="server" AutoGenerateColumns="False" Width="99%" EmptyDataText="û������κιؼ���Tags" GridLines="None" OnRowDataBound="list_RowDataBound" OnRowCommand="list_RowCommand" OnRowCreated="list_RowCreated">
          <Columns>
              <asp:TemplateField HeaderText="&lt;input type='checkbox' name='chkall' id='chkall' onClick='CheckAll(this.form);'/&gt;">
                <ItemStyle HorizontalAlign="Center"  Width="30px"/>
                <ItemTemplate>
                <input type="checkbox"  name="ids" id="ids" value="<%#Eval("tagsid") %>" />
                </ItemTemplate>
                </asp:TemplateField>

              <asp:BoundField DataField="FirstAlphabet" HeaderText="����ĸ" >
               <itemstyle horizontalalign="Center" />
              </asp:BoundField>
              <asp:BoundField DataField="" HeaderText="" />
              
              <asp:TemplateField HeaderText="TAGS����">
                <itemstyle horizontalalign="Center" />
                <itemtemplate>
                    <a href="<%# Kesion.HtmlTags.BasicField.GetTagsUrl(Convert.ToString(Eval("TagsID"))) %>" target="_blank"><%# Eval("KeyText") %></a>
               </itemtemplate>
              </asp:TemplateField>
              
              <asp:BoundField DataField="tagshits" DataFormatString="{0} ��" HeaderText="ʹ��Ƶ�ʣ�������" >
                  <itemstyle horizontalalign="Center" />
              </asp:BoundField>
              <asp:BoundField DataField="todayhits" DataFormatString="{0} ��" HeaderText="���գ�������" >
                  <itemstyle horizontalalign="Center" />
              </asp:BoundField>
              <asp:BoundField DataField="yesterdayhits" DataFormatString="{0} ��" HeaderText="���գ�������" >
                  <itemstyle horizontalalign="Center" />
              </asp:BoundField>
              <asp:BoundField DataField="weekhits" DataFormatString="{0} ��" HeaderText="���ܣ�������" >
                  <itemstyle horizontalalign="Center" />
              </asp:BoundField>
              <asp:BoundField DataField="lastusetime" HeaderText="���ʹ��ʱ��" >
                  <itemstyle horizontalalign="Center" />
              </asp:BoundField>

               <asp:TemplateField HeaderText="״̬">
              <itemstyle width="30px" horizontalalign="Center"/>
              <itemtemplate>
                   <a href="?action=status&id=<%#Eval("tagsid")%>" <%# Convert.ToString(Eval("status"))=="0"?"class='no' title='����'":"class='ok' title='����'" %>></a>
              </itemtemplate>
            </asp:TemplateField>


             <asp:TemplateField HeaderText="�༭">
                    <itemstyle width="30px" horizontalalign="Center"/>
                       <itemtemplate>
             <asp:LinkButton ID="LinkButton1" CssClass="edit" ToolTip="�༭" runat="server" commandargument=<%#Eval("tagsid") %> commandname="modify"><img src="../../admin/images/Edit.gif" border="0" title="�޸�" /></asp:LinkButton>
                    </itemtemplate>
                </asp:TemplateField>
            <asp:TemplateField HeaderText="ɾ��">
                    <itemstyle width="30px" horizontalalign="Center"/>
                       <itemtemplate>
             <asp:LinkButton runat="server" id="delete" ToolTip="ɾ��" CssClass="delete" commandargument=<%#Eval("tagsid") %> commandname="del"><img src="../../admin/images/del.gif" border="0" title="ɾ��"/></asp:LinkButton>
                    </itemtemplate>
                </asp:TemplateField>

          </Columns>
            <HeaderStyle CssClass="CTitle" />
            <EmptyDataRowStyle CssClass="emptycss" />
      </KS:KSGV>
      

      <KS:Page ID="Page1" runat="server" />

  </asp:Panel>
  
  <asp:Panel runat="server" ID="addPannel" Width="100%" Visible="false">
    <KS:TopNav ID="TopNav1" runat="server" Text="��ӹؼ���Tags" />
        <table width="100%" border="0" cellpadding="1" cellspacing="1" class="CTable"> 
          <tr>
            <td class="lefttd" height="30" align="right" style="width: 198px"><b>�ؼ���Tags���ƣ�</b></td>
            <td class="righttd">
                &nbsp;<asp:TextBox ID="KeyText" CssClass="textbox" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="KeyText"
                    ErrorMessage="������ؼ���Tags����!"></asp:RequiredFieldValidator></td>
          </tr>
          <tr>
            <td class="lefttd" height="30" align="right" style="width: 198px"><b>�ؼ�����������ĸ��</b></td>
            <td class="righttd">
               &nbsp;<asp:DropDownList ID="DrpFirstAlphabet" runat="server">
               </asp:DropDownList></td>
          </tr>
            <tr>
                <td align="right" class="lefttd" height="30" style="width: 198px">
                    <strong>Tags״̬��</strong></td>
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

