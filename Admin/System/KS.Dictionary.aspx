<%@ Page Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.Admin_Dictionary" Title="数据字典" Codebehind="KS.Dictionary.aspx.cs" %>
<asp:Content ID="Content1" ContentPlaceHolderID="KSContent" Runat="Server">
    <KS:TopNav ID="TopNav1" runat="server" Text="数据字典设置" />
    <asp:GridView ID="List" cssclass="CTable"  runat="server" AutoGenerateColumns="False" EmptyDataText="没有建立字典!"
        GridLines="None"  OnRowDataBound="List_RowDataBound"
        Width="99%">
        <EmptyDataRowStyle CssClass="emptycss" />
        <Columns>
            <asp:BoundField DataField="KeyID" HeaderText="序号">
                <ItemStyle HorizontalAlign="Center" Width="60px" />
            </asp:BoundField>
            <asp:BoundField DataField="KeyText" HeaderText="字典">
                <ItemStyle Width="100px" HorizontalAlign="Center" />
            </asp:BoundField>
            <asp:TemplateField HeaderText="字典值">
             <ItemStyle HorizontalAlign="Center" />
             <ItemTemplate>
              <asp:TextBox CssClass="textbox" TextMode="MultiLine" ToolTip="多个值，请用|线隔开" ID="KeyValue" Text='<%# Eval("KeyValue") %>' Columns="38" Rows="2" runat="server"></asp:TextBox>
             </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="默认选中项">
            <ItemTemplate>
              <asp:TextBox CssClass="textbox" ID="DefaultValue" ToolTip="默认选中项的值" runat="server" Text='<%# Eval("DefaultValue") %>'></asp:TextBox>
             </ItemTemplate>
            </asp:TemplateField>
        </Columns>
        <HeaderStyle CssClass="CTitle" />
    </asp:GridView>
    
        <br />
        
        <script type="text/javascript">
		showtips('<span class="state"><strong>说明：</strong><br /></span>1、多个字典项值请用 “<span style="color: #ff0033">|</span>”隔开,默认选中项请填写已存在对应字典值的项目．<br /> 2、每个字典项值可以跟颜色值，颜色值之间用“:”隔开，如 "图文:#ff0000|组图|公告:green"表示图片将显示为红色、公告显示为绿色，组图为默认颜色黑色<br />');
		</script>
		        
    <KS:Foot ID="Foot1" runat="server" CancelButtonVisible="false" SubmitButtonText="批量保存(0)" OnSubmit="Foot1_Submit" />

　　

</asp:Content>

