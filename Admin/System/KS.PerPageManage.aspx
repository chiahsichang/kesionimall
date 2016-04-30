<%@ Page Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.Admin_ManagePerPage" Title="Untitled Page" Codebehind="KS.PerPageManage.aspx.cs" %>
<asp:Content ID="Content1" ContentPlaceHolderID="KSContent" Runat="Server">
    <asp:Panel ID="listPanel" runat="server" Width="100%">
       <KS:TopNav ID="TopNav2" runat="server" Text="后台管理每页显示条数设置" />
        <KS:KSGV ID="list" cssclass="CTable" runat="server" Width="99%" AutoGenerateColumns="False" EmptyDataText="暂无管理项!" GridLines="None" OnRowDataBound="list_RowDataBound" PagerType="CustomNumeric" OnRowCommand="list_RowCommand" OnRowCreated="list_RowCreated">
            <Columns>
             <asp:BoundField HeaderText="ID" DataField="ID">
                    <ItemStyle HorizontalAlign="Center" Width="40px" />
                </asp:BoundField>
           
            <asp:TemplateField HeaderText="页面名称">
                <ItemStyle width="350px"/>
                <ItemTemplate>
                   <asp:HiddenField ID="Hidissys" Value='<%# Eval("issys") %>' runat="server" />
                  <asp:TextBox CssClass="textbox"  Width="300px" ID="Txtname" Text='<%#Eval("name") %>' runat="server"></asp:TextBox>
                 </ItemTemplate>
            </asp:TemplateField>  
            <asp:TemplateField HeaderText="页面文件名">
                <ItemStyle HorizontalAlign="Center" />
                <ItemTemplate>
                  <asp:TextBox CssClass="textbox" Width="200px" ID="Txtpage" Text='<%#Eval("page") %>' runat="server"></asp:TextBox>
                 </ItemTemplate>
            </asp:TemplateField>  
            <asp:TemplateField HeaderText=" 每页显示条数">
                <ItemStyle HorizontalAlign="Center" />
                <ItemTemplate>
                  <asp:TextBox CssClass="textbox" style="text-align:center" Width="50px" ID="Txtnum" Text='<%#Eval("num") %>' runat="server"></asp:TextBox>条
                 </ItemTemplate>
            </asp:TemplateField>  
            <asp:TemplateField HeaderText="删除">
                <itemstyle horizontalalign="Center" width="25"/>
                <itemtemplate>
                  <asp:LinkButton runat="server" CssClass="delete" id="delete" commandargument=<%#Eval("id") %> commandname="del"><img src="../../admin/images/del.gif" border="0" title="删除"/></asp:LinkButton>
               </itemtemplate>
             </asp:TemplateField>
           
            </Columns>
           
            <PagerStyle CssClass="Page" HorizontalAlign="Right" />
            <HeaderStyle CssClass="CTitle" />
            <EmptyDataRowStyle CssClass="emptycss" />
      </KS:KSGV>
      
     <br />
     <asp:Panel ID="Panel1" runat="server" Height="30px" Width="739px">
            &nbsp;&nbsp;<asp:Button ID="Button1" CssClass="button" runat="server" Text="批量保存设置" 
                onclick="Button1_Click" />&nbsp;
            <asp:Button ID="Button2" CssClass="button" runat="server" Text="添加新项" 
                onclick="Button2_Click"/>&nbsp;<br />
      </asp:Panel>
     
     
     

    </asp:Panel>
    
    <asp:Panel ID="addPanel" runat="server" Width="100%" Visible="false">
        <KS:TopNav ID="TopNav1" runat="server" Text="添加每页显示条数设置" />
        <table width="100%" border="0" cellpadding="1" cellspacing="1" class="CTable"> 
          <tr>
            <td class="lefttd" height="30" align="right" style="width: 198px"><b>页面名称：</b></td>
            <td class="righttd">
                &nbsp;<asp:TextBox CssClass="textbox" ID="Txtname" runat="server"></asp:TextBox> <font color=#ff0000>*</font>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" Display="Dynamic" runat="server" ControlToValidate="Txtname"
                    ErrorMessage="请输入页面名称!"></asp:RequiredFieldValidator></td>
          </tr>    
            <tr>
                <td align="right" class="lefttd" height="30" style="width: 198px">
                    <strong>页面文件名：</strong></td>
                <td class="righttd">
                     &nbsp;<asp:TextBox CssClass="textbox" ID="Txtpage" runat="server"></asp:TextBox> <font color=#ff0000>*</font>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" Display="Dynamic" runat="server" ControlToValidate="Txtpage"
                    ErrorMessage="页面文件名!"></asp:RequiredFieldValidator>
                    
                    如：KS.User.Aspx
                    </td>
            </tr>
            <tr>
                <td align="right" class="lefttd" height="30" style="width: 198px">
                    <strong>每页显示条数：</strong></td>
                <td class="righttd">
                     &nbsp;<asp:TextBox CssClass="textbox" ID="Txtnum" runat="server"></asp:TextBox> <font color=#ff0000>*</font>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" Display="Dynamic" runat="server" ControlToValidate="Txtnum"
                    ErrorMessage="每页显示条数!"></asp:RequiredFieldValidator>
                    如：50
                    </td>
            </tr>

            
        </table>
        <br />
        <KS:Foot ID="Foot1" runat="server" OnSubmit="Foot1_Submit" />
    </asp:Panel>
 
 
</asp:Content>

