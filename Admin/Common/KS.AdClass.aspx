<%@ Page Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.Admin_ADClass" Title="广告分类管理" Codebehind="KS.AdClass.aspx.cs" %>
<asp:Content ID="Content1" ContentPlaceHolderID="KSContent" Runat="Server">
    <asp:Panel ID="ListPanel" runat="server" Width="100%">
    <div id="manage_top" class="menu_top_fixed">
              <ul>
           <li id='p1'><asp:LinkButton ID="addclassbutton" runat="server" OnClick="addclassbutton_Click"><b></b>添加分类</asp:LinkButton></li>
           <li id='p4'><asp:LinkButton ID="editclassbutton" runat="server" OnClick="editclassbutton_Click"><b></b>编辑分类</asp:LinkButton></li>
           <li id='p3'><asp:LinkButton ID="delclassbutton" OnClientClick="return(GetIDS('del'));" runat="server" OnClick="delclassbutton_Click"><b></b>删除分类</asp:LinkButton></li></ul>
        </div>
     <div class="menu_top_fixed_height"></div>      
    <KS:ksgv id="List" cssclass="CTable" runat="server" AutoGenerateColumns="False" EmptyDataText="没有添加任何广告位分类!" PagerType="CustomNumeric" Width="99%" GridLines="None" OnRowDataBound="List_RowDataBound" OnRowCommand="List_RowCommand" OnRowCreated="List_RowCreated">
        <Columns>
            <asp:TemplateField HeaderText="&lt;input type='checkbox' name='chkall' id='chkall' onClick='CheckAll(this.form);'/&gt;">
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
           <asp:TemplateField HeaderText="广告位个数">
              <itemstyle width="30px" horizontalalign="Center"/>
              <itemtemplate>
                  <a href="KS.ADBoard.Aspx?classid=<%# Eval("classid") %>" style="color:red;"><%# GetAdBoardNum(Convert.ToInt32(Eval("classid"))) %></a> 个
              </itemtemplate>
            </asp:TemplateField>
            <asp:BoundField HeaderText="简要说明" DataField="Descript" />

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
             <KS:Page ID="Page1" runat="server" />
</asp:Panel>


     
    <asp:Panel ID="AddPanel" runat="server"  Width="100%" Visible="false">
        <KS:TopNav ID="TopNav1" runat="server" Text="添加广告位分类" />
    <table width="99%" align="center" border="0" cellpadding="1" cellspacing="1" class="CTable"> 
          <tr>
            <td class="lefttd" height="30" align="right" style="width: 198px"><b>分类名称：</b></td>
            <td class="righttd">
                &nbsp;<asp:TextBox CssClass="textbox" ID="TxtClassName" runat="server" Width="268px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TxtClassName"
                    ErrorMessage="请填写广告位分类名称!"></asp:RequiredFieldValidator></td>
          </tr>
         <tr>
            <td align="right" class="lefttd" height="30" style="width: 198px">
            <b>分类说明：</b>
            </td>
            <td class="righttd">
                &nbsp;<asp:TextBox CssClass="textbox" ID="TxtDescript" TextMode="MultiLine" Width="304px" runat="server" Height="100px"></asp:TextBox></td>
        </tr>
         <tr>
            <td align="right" class="lefttd" height="30" style="width: 198px">
            <b>排 序 号：</b>
            </td>
            <td class="righttd">
                &nbsp;<asp:TextBox CssClass="textbox" ID="TxtOrderId" Width="50px" Text="1" runat="server"></asp:TextBox>
                <span class="tips">序号越小排在越前面。</span>

            </td>
        </tr>
      </table>
      <br />
        <KS:Foot ID="Foot1" runat="server" OnSubmit="Foot1_Submit" />
      
    </asp:Panel>

</asp:Content>
