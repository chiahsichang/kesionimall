<%@ Page Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.Admin_UserForm" Title="Untitled Page" Codebehind="KS.UserForm.aspx.cs" %>
<%@ Import Namespace="Kesion.Publics" %>
<asp:Content ID="Content1" ContentPlaceHolderID="KSContent" Runat="Server">
    <asp:Panel ID="ListPanel" runat="server" Height="50px" Width="100%">
        <div id="manage_top" class="menu_top_fixed">
       <ul>
           <li id='p1'><asp:LinkButton ID="addclassbutton" runat="server" OnClick="addclassbutton_Click"><b></b>添加会员表单</asp:LinkButton></li>
           <li id='p4'><asp:LinkButton ID="editclassbutton" runat="server" OnClick="editclassbutton_Click"><b></b>编辑会员表单</asp:LinkButton></li>
           <li id='p3'><asp:LinkButton ID="delclassbutton" runat="server" OnClick="delclassbutton_Click"><b></b>删除会员表单</asp:LinkButton></li></ul>
    </div> 
     <div class="menu_top_fixed_height"></div>  
        <KS:KSGV ID="List" cssclass="CTable" runat="server" GridLines="None" AutoGenerateColumns="False" EmptyDataText="没有添加任何会员表单" PagerType="CustomNumeric" Width="99%" OnRowDataBound="List_RowDataBound" OnRowCreated="List_RowCreated" OnRowCommand="List_RowCommand">
            <HeaderStyle CssClass="CTitle" />
            <Columns>
                       <asp:TemplateField HeaderText="选择">
                
                <itemtemplate>
<input type="checkbox"  name="ids" id="ids" value="<%#Eval("formid") %>" />
           
</itemtemplate>
                <itemstyle horizontalalign="Center" Height="30px" width="50px" />
            </asp:TemplateField>
                <asp:BoundField DataField="formid" HeaderText="ID">
                    <itemstyle horizontalalign="Center" width="60px" />
                </asp:BoundField>
                <asp:BoundField DataField="formname" HeaderText="表单名称">
                    <itemstyle horizontalalign="Center" width="120px" />
                </asp:BoundField>
                <asp:TemplateField HeaderText="简要说明">
                  <itemtemplate>
                   <span class="tips"><%# Eval("note") %></span>
                  </itemtemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="编辑">
                  <itemstyle horizontalalign="Center" width="25px"/>
                  <itemtemplate>
                     <asp:LinkButton CssClass="edit" ToolTip="编辑" ID="LinkButton1" runat="server" commandargument=<%#Eval("formid") %> commandname="modify"><img src="../../admin/images/Edit.gif" border="0" title="修改" /></asp:LinkButton>
                  </itemtemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="删除">
                    <itemtemplate>
                         <asp:LinkButton CssClass="delete" ToolTip="删除" runat="server" id="delete" commandargument=<%#Eval("formid") %> commandname="del"></asp:LinkButton>
                    </itemtemplate>
                    <itemstyle horizontalalign="Center" width="25px" />
                </asp:TemplateField>
            </Columns>
            <EditRowStyle CssClass="emptycss" />
        </KS:KSGV>
    </asp:Panel>
    
    <asp:Panel ID="AddPanel" runat="server" Width="100%" Visible="false">
        <KS:TopNav ID="TopNav1" runat="server" Text="新增用户组" />
      <table width="99%" align='center' border="0" cellpadding="1" cellspacing="1" class="CTable"> 
          <tr>
            <td class="lefttd" height="30" align="right" style="width: 198px"><b>表单名称：</b></td>
            <td class="righttd">
                &nbsp;<asp:TextBox CssClass="textbox" ID="FormName" runat="server" Width="268px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="FormName"
                    ErrorMessage="请填写表单名称!" Display="Dynamic"></asp:RequiredFieldValidator></td>
          </tr>
          <tr>
              <td align="right" class="lefttd" height="30" style="width: 198px">
                  <strong>字段选择：</strong><br />
                      </td>
              <td>
                  <KS:KSGV ID="FieldList" CssClass="CTable" runat="server" AutoGenerateColumns="False" HorizontalAlign="Left" PagerType="CustomNumeric" Width="100%">
                      <Columns>
                          <asp:TemplateField HeaderText="选择">
                          <itemstyle horizontalalign="center" />
                          <itemtemplate>
                           <input type="checkbox" value='<%#Eval("Name") %>' name="id"/>
                          </itemtemplate>
                          </asp:TemplateField>
                          <asp:BoundField DataField="FieldAlias" HeaderText="字段别名" />
                          <asp:BoundField DataField="Name" HeaderText="字段名称" >
                          <itemstyle horizontalalign="center" />
                          </asp:BoundField>
                          <asp:BoundField DataField="orderid" HeaderText="字段序号">
                              <itemstyle horizontalalign="Center" />
                          </asp:BoundField>
                      </Columns>
                  </KS:KSGV>
              </td>
          </tr>
          <tr>
              <td align="right" class="lefttd" style="width: 198px; height: 30px">
                  <strong>表单录入模板：</strong>
                  <br />
                  <asp:CheckBox ID="AutoCreateTemplate" onclick="createTemplate(this)" runat="server" Text="自动生成模板" />
                  <script>
                      function createTemplate(obj) {
                         var fieldid='';
						  jQuery('input[name="id"]:checked').each(function(){
							 if (fieldid==''){
							 fieldid=jQuery(this).val();
							 }else{fieldid+=","+jQuery(this).val();}
				});
                          jQuery.get("KS.UserForm.Aspx", { action: "gettemplate",fieldid: fieldid}, function(v) {
                              jQuery('#<%=this.Template.ClientID %>').val(v);
                          });
                      }
                  </script>
                  </td>
              <td class="righttd" style="height: 30px">
                  &nbsp;<asp:TextBox CssClass="textbox" ID="Template" runat="server" Height="200px" TextMode="MultiLine" Width="80%"></asp:TextBox></td>
          </tr>
          <tr>
              <td align="right" class="lefttd" style="width: 198px; height: 30px">
                  <strong>表单备注说明：</strong></td>
              <td class="righttd" style="height: 30px">
                  &nbsp;<asp:TextBox CssClass="textbox" ID="Note" runat="server" Height="70px" TextMode="MultiLine" Width="80%"></asp:TextBox></td>
          </tr>
       </table>
        <br />
        <KS:Foot ID="Foot1" runat="server" OnSubmit="Foot1_Submit" />
    </asp:Panel>
</asp:Content>

