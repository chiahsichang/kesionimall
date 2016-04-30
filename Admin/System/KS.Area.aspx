<%@ Page Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.Admin_System_Area" Title="地区管理" Codebehind="KS.Area.aspx.cs" %>
<asp:Content ID="Content1" ContentPlaceHolderID="KSContent" Runat="Server">

<asp:Panel ID="ListPannel" runat="server" Width="100%">
       <KS:TopNav ID="TopNav1" runat="server" Text="一级地区设置" />
        <asp:GridView ID="AreaList" CssClass="CTable"  runat="server" AutoGenerateColumns="False" EmptyDataText="还没有添加地区!"
        GridLines="None" OnRowDataBound="List_RowDataBound"
        Width="99%" OnRowCommand="AreaList_RowCommand" OnRowCreated="AreaList_RowCreated">
        <EmptyDataRowStyle CssClass="emptycss" />
        <Columns>
            <asp:BoundField DataField="ID" HeaderText="序号">
                <ItemStyle HorizontalAlign="Center" Width="50px" />
            </asp:BoundField>
            <asp:TemplateField HeaderText="地区名称">
            <ItemStyle HorizontalAlign="Left" Width="460" />
            <ItemTemplate>
              <div onmouseover="jQuery('#sub<%# Eval("ID") %>').show();" onmouseout="jQuery('#sub<%# Eval("ID") %>').hide();">
              <asp:TextBox CssClass="textbox" ID="TxtCity" Text='<%#Eval("City") %>' runat="server"></asp:TextBox>
              <asp:HiddenField ID="hdFDepth" Value='<%#Eval("Depth") %>' runat="server" />
                <span id="sub<%# Eval("ID") %>" style="padding-left:10px;display:none">
                <asp:LinkButton ForeColor="Gray" ID="lkbGo" CommandName="Go" CommandArgument='<%#Eval("ID") %>' runat="server">进入子地区</asp:LinkButton>
               <asp:LinkButton  ForeColor="Gray" ID="lkbAdd" CommandName="Add" CommandArgument='<%#Eval("ID") %>' runat="server">添加子地区</asp:LinkButton>
                  </span>
               </div>
             </ItemTemplate>
            </asp:TemplateField>

            <asp:TemplateField HeaderText="首字母">
            <ItemStyle HorizontalAlign="Center" />
            <ItemTemplate>
              <asp:TextBox CssClass="textbox" ID="TxtLetter" Width="50px" style="text-align:center" Text='<%#Eval("Letter") %>' runat="server"></asp:TextBox>
             </ItemTemplate>
            </asp:TemplateField>

            <asp:TemplateField HeaderText="显示顺序">
            <ItemStyle HorizontalAlign="Center"  />
            <ItemTemplate>
              <asp:TextBox CssClass="textbox" ID="TxtOrderID" Width="50px" style="text-align:center" Text='<%#Eval("OrderID") %>' runat="server"></asp:TextBox>
             </ItemTemplate>
            </asp:TemplateField>

            <asp:TemplateField HeaderText="删除">
                <itemstyle horizontalalign="Center" width="25"/>
                        <itemtemplate>
                         <asp:LinkButton ID="lkbDel" CssClass="delete" CommandName="Del" CommandArgument='<%#Eval("ID") %>' runat="server"></asp:LinkButton>
                 </itemtemplate>
            </asp:TemplateField>

          
        </Columns>
        <HeaderStyle CssClass="CTitle"  />
    </asp:GridView>
    

     <KS:Page ID="Page1" runat="server" />
    <br />
    <KS:Foot ID="Foot1" runat="server" CancelButtonVisible="false" OnSubmit="Foot1_Submit" SubmitButtonText="批量保存(0)" />
</asp:Panel>


<asp:Panel ID="AddPannel" runat="server" Width="100%" Visible="false">
 <KS:TopNav ID="TopNav2" runat="server" Text="添加地区" />
        <table width="99%" style="margin:0 auto;" border="0" cellpadding="1" cellspacing="1" class="CTable"> 
        <tr>
                <td align="right" class="lefttd" height="30" style="width: 198px">
                    <strong>所属地区：</strong></td>
                <td class="righttd">
                    &nbsp;<asp:DropDownList CssClass="select" ID="DrpParentID" runat="server" Width="200px" OnSelectedIndexChanged="DrpParentID_SelectedIndexChanged" AutoPostBack="True">
                    <asp:ListItem Value="0">--作为一级地区分类--</asp:ListItem>
                   
                   </asp:DropDownList>
                    </td>
            </tr>
        
          <tr>
            <td class="lefttd" height="30" align="right" style="width: 198px"><b>地区名称：</b></td>
            <td class="righttd">
                &nbsp;<asp:TextBox CssClass="textbox" ID="TxtCity" runat="server"></asp:TextBox> <span style="color:#ff0000">*</span>如上海，北京等
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TxtCity"
                    ErrorMessage="请输入地区名称!"></asp:RequiredFieldValidator></td>
          </tr>
          
          <tr>
                <td align="right" class="lefttd" height="30" style="width: 198px">
                    <strong>首字母：</strong></td>
                <td class="righttd">
                    &nbsp;<asp:DropDownList ID="DrpLetter" runat="server">
                   </asp:DropDownList>
                    </td>
            </tr>
        
            <tr>
                <td align="right" class="lefttd" height="30" style="width: 198px">
                    <strong>排列序号：</strong></td>
                <td class="righttd">
                &nbsp;<asp:TextBox CssClass="textbox" ID="TxtOrderID" runat="server"></asp:TextBox> <span style="color:#ff0000">*</span>数字越小排在越前面
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TxtOrderID"
                    ErrorMessage="请输入排序号!"></asp:RequiredFieldValidator>
                </td>
            </tr>
    
        </table>
      <br />
      <KS:Foot ID="Foot2" runat="server"  OnSubmit="Foot2_Submit"  />
</asp:Panel>
</asp:Content>

