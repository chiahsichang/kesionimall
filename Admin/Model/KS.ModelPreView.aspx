<%@ Page Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.Admin_ModelPreView" Title="Untitled Page" Codebehind="KS.ModelPreView.aspx.cs" %>
<asp:Content ID="Content1" ContentPlaceHolderID="KSContent" Runat="Server">

    <div id="manage_top" class="toptitle menu_top_fixed"><ul><li id='p9'><b></b><a href='javascript:history.back();'>返回</a></li> 预览模型</div>
    <div class="menu_top_fixed_height"></div> 


        <KS:ModelJS ID="ModelJS1" runat="server" />
    <div class="tab-page" id="ContentPanel<%=channelid %>">
         <script type="text/javascript">
             var tabPane1 = new WebFXTabPane(document.getElementById("ContentPanel<%=channelid %>"), 1)
         </script>


         <asp:Repeater ID="RepeatFieldGroup" runat="server" OnItemDataBound="RepeatFieldGroup_ItemDataBound">
               <ItemTemplate>
                     <div class="tab-page" id='tab<%# Eval("ID") %>'>
		              <h2 class="tab"><%# Eval("GroupName") %></h2>
			            <script type="text/javascript">
			                tabPane1.addTabPage(document.getElementById("tab<%# Eval("ID") %>"));
			            </script>
                               <table style="width:100%;" cellpadding="2" cellspacing="1" class="CTable">
                                <asp:Repeater ID="Repeater1" runat="server">
                                 <ItemTemplate>
                                     <KS:Fields ID="Fields1" ModelID='<%# channelid%>' FieldID='<%# Eval("Name")%>' ParentFieldID='<%# Eval("ParentFieldID")%>' FieldAlias='<%# Eval("FieldAlias")%>' FieldType='<%# Eval("FieldType")%>'
                                     Disabled='<%# Eval("Disabled")%>' FieldWidth='<%# Eval("FieldWidth")%>' FieldHeight='<%# Eval("FieldHeight")%>' Options='<%# Eval("options")%>'
                                     Tips='<%# Eval("Tips")%>' DefaultValue='<%# Eval("DefaultValue")%>' ToolBar='<%# Eval("ToolBar")%>' InputItem='<%# Eval("InputItem") %>' MustFillItem='<%# Eval("MustFillItem")%>'  runat="server">
                                     </KS:Fields>
                                 </ItemTemplate>
                                </asp:Repeater>
                                </table>
                         </div>
               </ItemTemplate>
            </asp:Repeater>


    
    </div>

        <div style="margin:30px;text-align:center">
            <input type='button' class="button" value='返回上一步' onclick='history.back(-1)' />
        </div>
</asp:Content>

