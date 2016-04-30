<%@ Page Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" Title="空间分类管理" Inherits="Kesion.NET.WebSite.Admin_Space_BlogClassify" Codebehind="KS.BlogClassify.aspx.cs" %>

<%@ Import Namespace="Kesion.Publics"%>
<asp:Content ID="Content1" ContentPlaceHolderID="KSContent" Runat="Server">

    <asp:Panel ID="ListPanel" runat="server" Width="100%">
    <div id="manage_top" class="menu_top_fixed">
       <ul>
           <li id='p1'><b></b><asp:LinkButton ID="addclassbutton" runat="server" OnClick="addclassbutton_Click">添加分类</asp:LinkButton></li>
           <li id='p9'><b></b><a href="javascript:;" onclick="location.href='KS.Blog.aspx';">返回</a></li>
           
           </ul>
    </div>  
    <div class="menu_top_fixed_height"></div>  
    
    
    <KS:ksgv id="List" runat="server" CssClass="CTable" AutoGenerateColumns="False" EmptyDataText="还没有任何空间分类!" PagerType="CustomNumeric" Width="99%"  GridLines="None" OnRowDataBound="List_RowDataBound" OnRowCommand="List_RowCommand" OnRowCreated="List_RowCreated" >
        <Columns>

            <asp:BoundField HeaderText="编号" DataField="classid" >
                <ItemStyle HorizontalAlign=Center Width="50px" />
            </asp:BoundField>
            <asp:BoundField HeaderText="类型名称" DataField="classname" >
                <itemstyle horizontalalign="left" />
            </asp:BoundField>
            <asp:BoundField HeaderText="排序" DataField="orderid" >
                <itemstyle width="200px" horizontalalign="Center" />
            </asp:BoundField>

              <asp:TemplateField HeaderText="编辑">
                       <itemstyle horizontalalign="Center" width="25px"/>
                         <itemtemplate>
                               <asp:LinkButton ID="LinkButton2" CssClass="edit" ToolTip="修改" runat="server" commandargument=<%#Eval("classid") %> commandname="modify"></asp:LinkButton>
                        </itemtemplate>
              </asp:TemplateField>
            
            <asp:TemplateField HeaderText="删除">
                <itemstyle width="25px" Height="30px" horizontalalign="Center" />
             <itemtemplate>
             <asp:LinkButton runat="server" CssClass="delete" ToolTip="删除" id="delete" commandargument=<%#Eval("classid") %> commandname="del"></asp:LinkButton>
            </itemtemplate>
            </asp:TemplateField>
        </Columns>
        <HeaderStyle CssClass="CTitle" />
            <PagerStyle CssClass="Page" HorizontalAlign="Right" />
            <EmptyDataRowStyle CssClass="emptycss" />
    </KS:ksgv>
<asp:Panel ID="Panel1" runat="server" Height="30px" Width="741px">

           </asp:Panel>
           
           <table cellpadding="0" cellspacing="0" style="width: 100%;margin-top:10px">
            <tr>
                <td style="height: 25px">&nbsp; </td>
                <td style="font-size: 9pt; height: 25px; text-align: right">
                        <KS:Page ID="Page1" runat="server" />
                </td>
            </tr>
        </table>
</asp:Panel>


     
    <asp:Panel ID="AddPanel" runat="server" Width="100%" Visible="false">
        <KS:TopNav ID="TopNav1" runat="server" Text="添加分类" />
        <script type="text/javascript">
            function CheckForm1() 
            {
	         if (jQuery("#<%=this.txtBlogClass.ClientID %>").val()==''){
	           KesionJS.Alert('请填写空间分类名称!','jQuery("#<%=this.txtBlogClass.ClientID %>").focus()');
	           return false
	         }
	         if (jQuery("#<%=this.txtOrderID.ClientID %>").val() == '') {
	             KesionJS.Alert('排序不能为空！', 'jQuery("#<%=this.txtOrderID.ClientID %>").focus()');
	             return false;
	         }
	         return true;
	     }
	     
       </script>
    <table width="99%" align="center" border="0" cellpadding="1" cellspacing="1" class="CTable"> 
          <tr>
            <td class="lefttd" height="30" align="right" style="width: 150px"><b>空间分类名称：</b></td>
            <td class="righttd">
                &nbsp;<asp:TextBox  CssClass="textbox" ID="txtBlogClass" runat="server" Width="268px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtBlogClass"
                    ErrorMessage="请填写空间分类!"></asp:RequiredFieldValidator></td>
          </tr>
        <tr>
            <br />
            <td align="right" class="lefttd" height="30" style="width: 150px">
                <strong>排　　序：</strong></td>
            <td class="righttd">
                &nbsp;<asp:TextBox  CssClass="textbox" ID="txtOrderID" runat="server" Width="50px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtOrderID"
                    ErrorMessage="排序不能为空!"></asp:RequiredFieldValidator>
                
                <asp:HiddenField ID="HIDModi" runat="server" Value="0" />
                <asp:HiddenField ID="classid" runat="server" Value="" />
                </td>
        </tr>
  
      </table>
      <br />
        <KS:Foot ID="Foot1" runat="server" OnSubmit="Foot1_Submit" />
      
    </asp:Panel>

</asp:Content>
