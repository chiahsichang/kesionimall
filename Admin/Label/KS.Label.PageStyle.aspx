<%@ Page Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.Admin_Label_PageStyle" Title="分页样式管理" Codebehind="KS.Label.PageStyle.aspx.cs" %>
<asp:Content ID="Content1" ContentPlaceHolderID="KSContent" Runat="Server">

<asp:Panel ID="ListPannel" runat="server" Width="100%">
 <div id="manage_top" class="toptitle menu_top_fixed" style="text-align:left">分页样式管理  <a href="?action=Add">添加新样式</a></div>
  <div class="menu_top_fixed_height"></div>   
        <asp:GridView ID="list" cssclass="CTable"  runat="server" AutoGenerateColumns="False" EmptyDataText="还没有添加分页样式!"
        GridLines="None" OnRowDataBound="List_RowDataBound"
        Width="99%" OnRowCommand="list_RowCommand" OnRowCreated="list_RowCreated">
        <EmptyDataRowStyle CssClass="emptycss" />
        <Columns>
           <asp:TemplateField HeaderText="ID" InsertVisible="False">   
            <ItemStyle HorizontalAlign="Center" Width="60px" />                    
                <ItemTemplate>    
                    <%# Eval("name") %> 
                    <asp:HiddenField ID="HidIsSys" runat="server" Value='<%# Eval("issys") %>' />    
                    <asp:HiddenField ID="HidName" runat="server" Value='<%# Eval("name") %>' />  
                </ItemTemplate>             
            </asp:TemplateField> 
            
            <asp:TemplateField HeaderText="样式名称">
            <ItemStyle HorizontalAlign="Center" />
            <ItemTemplate>
              <asp:TextBox CssClass="textbox" Width="130" ID="TxtTitle" Text='<%#Eval("title") %>' runat="server"></asp:TextBox>
              <div class="tips" style="text-align:left;padding-left:5px">标签：[KS:PageStr<%#Eval("name") %>]</div>
             </ItemTemplate>
            </asp:TemplateField>           

            <asp:TemplateField HeaderText="样式模板">
            <ItemStyle HorizontalAlign="Center" />
            <ItemTemplate>
              <asp:TextBox CssClass="textbox" TextMode="MultiLine" ID="TxtTp" Width="470" Height="100" Text='<%#Eval("tp") %>' runat="server"></asp:TextBox>
             </ItemTemplate> 
            </asp:TemplateField>

   
            <asp:TemplateField HeaderText="管理操作">
            <ItemStyle HorizontalAlign="Center" Width="100px" />
            <ItemTemplate>
                <asp:LinkButton ID="lkbDelete" CommandName="dodel" CommandArgument='<%#Eval("name") %>' runat="server">[删除]</asp:LinkButton>
             </ItemTemplate>
            </asp:TemplateField>

        </Columns>
        <HeaderStyle CssClass="CTitle" />
    </asp:GridView>
    
    <div style="display:none">

     <KS:Page ID="Page1" runat="server" /></div>
    <br />
    <KS:Foot ID="Foot1" runat="server" OnSubmit="Foot1_Submit" SubmitButtonText="批量保存(0)" />
    <br />
     <script type="text/javascript">
               showtips('<span class="state"><strong>说明：</strong><br /></span>1、分页样式可以在此页面自定义或修改，这样在建分页标签时就可以选择自行定义的分页样式。<br/>2、如果您对代码不了解，建议不要修改自带的分页样式。');
	 </script>

</asp:Panel>

<asp:Panel ID="PanAdd" runat="server" Visible="false">
<KS:TopNav ID="TopNav1" runat="server" Text="添加分页样式" />
        <table width="99%" style="margin:0 auto;" border="0" cellpadding="1" cellspacing="1" class="CTable"> 
          <tr>
            <td class="lefttd" height="30" align="right" style="width: 138px"><b>样式名称：</b></td>
            <td class="righttd">
                &nbsp;<asp:TextBox CssClass="textbox" Width="200" ID="TxtTitle" runat="server"></asp:TextBox> <font color=#ff0000>*</font>
              </td>
          </tr>

          <tr>
            <td class="lefttd" height="30" align="right" style="width: 138px"><b>样式模板：</b></td>
            <td class="righttd">
                &nbsp;<asp:TextBox CssClass="textbox" ID="TxtTp" Width="500" Height="150" TextMode="MultiLine" runat="server"></asp:TextBox> 
                <br /><span class="tips">支持HTML代码，可用标签：总记录数：{$totalput}，当前页码：{$currentpage}，总页数：{$totalpage}，每页条数：{$maxperpage}，项目单位：{$itemunit}，首页URL：{$homeurl}
                ，末页URL：{$endurl}，上一页URL：{$prevurl}，下一页URL：{$nexturl}，跳转：{$turnpage}，数字分页(1-10)：{$pagenumlist},数字分页：{$pagenumlist(n)} 其中n表示一次显示的数字页数。</span>
              </td>
          </tr>


       </table>
 <br />
    <KS:Foot ID="Foot2" runat="server" OnSubmit="Foot2_Submit" SubmitButtonText="确定保存(0)" />
</asp:Panel>



</asp:Content>

