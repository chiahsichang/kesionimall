<%@ Page Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.Admin_LinkClass" Title="友情链接分类管理" Codebehind="KS.LinkClass.aspx.cs" %>
<asp:Content ID="Content1" ContentPlaceHolderID="KSContent" Runat="Server">
    <asp:Panel ID="ListPanel" runat="server" Width="100%">
    <div id="manage_top" class="menu_top_fixed">
              <ul>
           <li id='p1'><asp:LinkButton ID="addclassbutton" runat="server" OnClick="addclassbutton_Click"><b></b>添加分类</asp:LinkButton></li>
           <li id='p4'><asp:LinkButton ID="editclassbutton" runat="server" OnClick="editclassbutton_Click"><b></b>编辑分类</asp:LinkButton></li>
           <li id='p3'><asp:LinkButton ID="delclassbutton" runat="server" OnClientClick="return(GetIDS('del'));" OnClick="delclassbutton_Click"><b></b>删除分类</asp:LinkButton></li></ul>
        </div>
     <div class="menu_top_fixed_height"></div>      
    <KS:ksgv id="List" cssclass="CTable" runat="server" AutoGenerateColumns="False" EmptyDataText="没有添加任何分类!" PagerType="CustomNumeric" Width="99%" HorizontalAlign="center" GridLines="None" OnRowDataBound="List_RowDataBound" OnRowCommand="List_RowCommand" OnRowCreated="List_RowCreated">
        <Columns>
            <asp:TemplateField HeaderText="选择">
                <itemstyle horizontalalign="Center" width="50px" />
                
             <itemtemplate>
            <input type="checkbox"  name="ids" id="ids" value="<%#Eval("classid") %>" />
            </itemtemplate>
            </asp:TemplateField>
            <asp:BoundField HeaderText="分类ID" DataField="classid" >
                <itemstyle width="50px" horizontalalign="Center" />
            </asp:BoundField>
            <asp:BoundField HeaderText="分类名称" DataField="classname" >
                <itemstyle width="120px" />
            </asp:BoundField>
            <asp:BoundField HeaderText="简要说明" DataField="Description" />

             <asp:TemplateField HeaderText="修改">
              <itemstyle width="30px" horizontalalign="Center"/>
              <itemtemplate>
             <asp:LinkButton ID="LinkButton1" runat="server" commandargument=<%#Eval("classid") %> commandname="modify" ToolTip="修改" CssClass="edit"></asp:LinkButton>
              </itemtemplate>
            </asp:TemplateField>

            <asp:TemplateField HeaderText="删除">
                <itemstyle width="30px" horizontalalign="Center" />
             <itemtemplate>
             <asp:LinkButton runat="server" ToolTip="删除" CssClass="delete" id="delete" commandargument=<%#Eval("classid") %> commandname="del"></asp:LinkButton>
            </itemtemplate>
            </asp:TemplateField>
        </Columns>
        <HeaderStyle CssClass="CTitle" />
        <EmptyDataRowStyle CssClass="emptycss" />
    </KS:ksgv>
                <asp:Panel ID="Panel1" runat="server" Height="30px" Width="741px">
            &nbsp;&nbsp;<input type="checkbox" name="chkall" id="chkall" onclick="CheckAll(this.form);"/><label for="chkall">全部选中</label>
                        <input type="button" value="删除选中的分类" onmouseover="this.className='button_on';" onmouseout="this.className='button';" class="button" onclick="if (GetIDS('del')){this.form.action='?action=del';this.form.submit()}" />

            </asp:Panel>
            
            <KS:Page ID="Page1" runat="server" />
</asp:Panel>


     
    <asp:Panel ID="AddPanel" runat="server"  Width="100%" Visible="false">
        <KS:TopNav ID="TopNav1" runat="server" Text="添加友情链接分类" />
    <table width="99%" align="center" border="0" cellpadding="1" cellspacing="1" class="CTable"> 
          <tr>
            <td class="lefttd" height="30" align="right" style="width: 198px"><b>分类名称：</b></td>
            <td class="righttd">
                &nbsp;<asp:TextBox CssClass="textbox" ID="ClassName" runat="server" Width="268px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="ClassName"
                    ErrorMessage="请填写类别名称!"></asp:RequiredFieldValidator></td>
          </tr>
        <tr>
            <td align="right" class="lefttd" height="30" style="width: 198px">
            <b>分类说明：</b>
            </td>
            <td class="righttd">
                &nbsp;<asp:TextBox CssClass="textbox" ID="Description" TextMode="MultiLine" Width="304px" runat="server" Height="100px"></asp:TextBox></td>
        </tr>
      </table>
      <br />
        <KS:Foot ID="Foot1" runat="server" OnSubmit="Foot1_Submit" />
      
    </asp:Panel>

</asp:Content>
