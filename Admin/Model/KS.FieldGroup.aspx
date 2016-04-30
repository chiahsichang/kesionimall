<%@ Page Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.Admin_FieldGroup" Title="字段分组管理" Codebehind="KS.FieldGroup.aspx.cs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="KSContent" Runat="Server">

    <div  id="manage_top" class="toptitle menu_top_fixed">
        <ul><li id='p9'><b></b><a href='javascript:;' onclick="location.href='KS.Field.aspx?Channelid=<%=__ChannelID %>';">返回字段管理</a></li>
             [<asp:Label ID="LabCurrModel" runat="server" Text="Label"></asp:Label>]模型字段分组管理
        </ul>
    </div>
    <div class="menu_top_fixed_height"></div> 

        <KS:KSGV ID="FieldGroupList" cssclass="CTable" runat="server" Width="99%" AutoGenerateColumns="False" EmptyDataText="暂无分组!" GridLines="None" OnRowDataBound="FieldGroupList_RowDataBound" OnRowCreated="FieldGroupList_RowCreated" OnRowCommand="FieldGroupList_RowCommand">
            <Columns>
             <asp:BoundField HeaderText="ID" DataField="ID">
                    <ItemStyle HorizontalAlign="Center" Width="40px" />
                </asp:BoundField>
           
            <asp:TemplateField HeaderText="分组名称">
                <ItemStyle width="350px"/>
                <ItemTemplate>
                   <asp:HiddenField ID="Hidissys" Value='<%# Eval("issys") %>' runat="server" />
                  <asp:TextBox CssClass="textbox" MaxLength="20"  Width="300px" ID="TxtGroupName" Text='<%#Eval("GroupName") %>' runat="server"></asp:TextBox>
                 </ItemTemplate>
            </asp:TemplateField>  
 
            <asp:TemplateField HeaderText="排序">
                <ItemStyle HorizontalAlign="Center" />
                <ItemTemplate>
                  <asp:TextBox CssClass="textbox" MaxLength="3" style="text-align:center" Width="50px" ID="TxtOrderId" Text='<%#Eval("orderId") %>' runat="server"></asp:TextBox>
                 </ItemTemplate>
            </asp:TemplateField>  
            <asp:TemplateField HeaderText="删除">
                <itemstyle horizontalalign="Center" width="25"/>
                <itemtemplate>
                  <asp:LinkButton runat="server"  CssClass="delete" id="deleteBtn" commandargument=<%#Eval("id") %> commandname="del"></asp:LinkButton>
               </itemtemplate>
             </asp:TemplateField>
           
            </Columns>
            <HeaderStyle CssClass="CTitle" />
            <EmptyDataRowStyle CssClass="emptycss" />
      </KS:KSGV>
        <br />
            <asp:Button ID="Button1" runat="server" CssClass="button" Text="批量保存字段分组" OnClick="Button1_Click"/> 
        <br />
        <br />
        </div>


     <table width="99%" cellspacing="1" cellpadding="1" class="CTable">
            <tr class="CTitle">
                <td colspan="4" style="text-align:left;">新增字段分组</td>
            </tr>
            <tr>
                 <td width="70" align="right"><strong>分组名称：</strong></td>
                 <td width="280"><asp:TextBox MaxLength="20" ID="TxtFieldGroupName" runat="server" CssClass="textbox" Width="280px" />
                     <div class="tips">TIPS:分组名称应该尽量简短，建议取四个汉字。</div>

                 </td>
                 
                 <td style="text-align:left;"><asp:Button OnClientClick="return(doCheck())" OnClick="BtnSubmit_Click" ID="BtnSubmit" runat="server" Text="确认添加" CssClass="button" /></td>
            </tr>
        </table>
       <script>
           function doCheck() {
               if ($("#<%=this.TxtFieldGroupName.ClientID%>").val() == '') {
                   KesionJS.Alert("请输入分组名称!", '$("#<%=this.TxtFieldGroupName.ClientID%>").focus();');
                   return false;
               }
               return true;
           }
       </script>



  </asp:Content>