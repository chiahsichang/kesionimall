<%@ Page Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.Admin_Dictionary" Title="�����ֵ�" Codebehind="KS.Dictionary.aspx.cs" %>
<asp:Content ID="Content1" ContentPlaceHolderID="KSContent" Runat="Server">
    <KS:TopNav ID="TopNav1" runat="server" Text="�����ֵ�����" />
    <asp:GridView ID="List" cssclass="CTable"  runat="server" AutoGenerateColumns="False" EmptyDataText="û�н����ֵ�!"
        GridLines="None"  OnRowDataBound="List_RowDataBound"
        Width="99%">
        <EmptyDataRowStyle CssClass="emptycss" />
        <Columns>
            <asp:BoundField DataField="KeyID" HeaderText="���">
                <ItemStyle HorizontalAlign="Center" Width="60px" />
            </asp:BoundField>
            <asp:BoundField DataField="KeyText" HeaderText="�ֵ�">
                <ItemStyle Width="100px" HorizontalAlign="Center" />
            </asp:BoundField>
            <asp:TemplateField HeaderText="�ֵ�ֵ">
             <ItemStyle HorizontalAlign="Center" />
             <ItemTemplate>
              <asp:TextBox CssClass="textbox" TextMode="MultiLine" ToolTip="���ֵ������|�߸���" ID="KeyValue" Text='<%# Eval("KeyValue") %>' Columns="38" Rows="2" runat="server"></asp:TextBox>
             </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Ĭ��ѡ����">
            <ItemTemplate>
              <asp:TextBox CssClass="textbox" ID="DefaultValue" ToolTip="Ĭ��ѡ�����ֵ" runat="server" Text='<%# Eval("DefaultValue") %>'></asp:TextBox>
             </ItemTemplate>
            </asp:TemplateField>
        </Columns>
        <HeaderStyle CssClass="CTitle" />
    </asp:GridView>
    
        <br />
        
        <script type="text/javascript">
		showtips('<span class="state"><strong>˵����</strong><br /></span>1������ֵ���ֵ���� ��<span style="color: #ff0033">|</span>������,Ĭ��ѡ��������д�Ѵ��ڶ�Ӧ�ֵ�ֵ����Ŀ��<br /> 2��ÿ���ֵ���ֵ���Ը���ɫֵ����ɫֵ֮���á�:���������� "ͼ��:#ff0000|��ͼ|����:green"��ʾͼƬ����ʾΪ��ɫ��������ʾΪ��ɫ����ͼΪĬ����ɫ��ɫ<br />');
		</script>
		        
    <KS:Foot ID="Foot1" runat="server" CancelButtonVisible="false" SubmitButtonText="��������(0)" OnSubmit="Foot1_Submit" />

����

</asp:Content>

