<%@ Page Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.Admin_Label_PageStyle" Title="��ҳ��ʽ����" Codebehind="KS.Label.PageStyle.aspx.cs" %>
<asp:Content ID="Content1" ContentPlaceHolderID="KSContent" Runat="Server">

<asp:Panel ID="ListPannel" runat="server" Width="100%">
 <div id="manage_top" class="toptitle menu_top_fixed" style="text-align:left">��ҳ��ʽ����  <a href="?action=Add">�������ʽ</a></div>
  <div class="menu_top_fixed_height"></div>   
        <asp:GridView ID="list" cssclass="CTable"  runat="server" AutoGenerateColumns="False" EmptyDataText="��û����ӷ�ҳ��ʽ!"
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
            
            <asp:TemplateField HeaderText="��ʽ����">
            <ItemStyle HorizontalAlign="Center" />
            <ItemTemplate>
              <asp:TextBox CssClass="textbox" Width="130" ID="TxtTitle" Text='<%#Eval("title") %>' runat="server"></asp:TextBox>
              <div class="tips" style="text-align:left;padding-left:5px">��ǩ��[KS:PageStr<%#Eval("name") %>]</div>
             </ItemTemplate>
            </asp:TemplateField>           

            <asp:TemplateField HeaderText="��ʽģ��">
            <ItemStyle HorizontalAlign="Center" />
            <ItemTemplate>
              <asp:TextBox CssClass="textbox" TextMode="MultiLine" ID="TxtTp" Width="470" Height="100" Text='<%#Eval("tp") %>' runat="server"></asp:TextBox>
             </ItemTemplate> 
            </asp:TemplateField>

   
            <asp:TemplateField HeaderText="�������">
            <ItemStyle HorizontalAlign="Center" Width="100px" />
            <ItemTemplate>
                <asp:LinkButton ID="lkbDelete" CommandName="dodel" CommandArgument='<%#Eval("name") %>' runat="server">[ɾ��]</asp:LinkButton>
             </ItemTemplate>
            </asp:TemplateField>

        </Columns>
        <HeaderStyle CssClass="CTitle" />
    </asp:GridView>
    
    <div style="display:none">

     <KS:Page ID="Page1" runat="server" /></div>
    <br />
    <KS:Foot ID="Foot1" runat="server" OnSubmit="Foot1_Submit" SubmitButtonText="��������(0)" />
    <br />
     <script type="text/javascript">
               showtips('<span class="state"><strong>˵����</strong><br /></span>1����ҳ��ʽ�����ڴ�ҳ���Զ�����޸ģ������ڽ���ҳ��ǩʱ�Ϳ���ѡ�����ж���ķ�ҳ��ʽ��<br/>2��������Դ��벻�˽⣬���鲻Ҫ�޸��Դ��ķ�ҳ��ʽ��');
	 </script>

</asp:Panel>

<asp:Panel ID="PanAdd" runat="server" Visible="false">
<KS:TopNav ID="TopNav1" runat="server" Text="��ӷ�ҳ��ʽ" />
        <table width="99%" style="margin:0 auto;" border="0" cellpadding="1" cellspacing="1" class="CTable"> 
          <tr>
            <td class="lefttd" height="30" align="right" style="width: 138px"><b>��ʽ���ƣ�</b></td>
            <td class="righttd">
                &nbsp;<asp:TextBox CssClass="textbox" Width="200" ID="TxtTitle" runat="server"></asp:TextBox> <font color=#ff0000>*</font>
              </td>
          </tr>

          <tr>
            <td class="lefttd" height="30" align="right" style="width: 138px"><b>��ʽģ�壺</b></td>
            <td class="righttd">
                &nbsp;<asp:TextBox CssClass="textbox" ID="TxtTp" Width="500" Height="150" TextMode="MultiLine" runat="server"></asp:TextBox> 
                <br /><span class="tips">֧��HTML���룬���ñ�ǩ���ܼ�¼����{$totalput}����ǰҳ�룺{$currentpage}����ҳ����{$totalpage}��ÿҳ������{$maxperpage}����Ŀ��λ��{$itemunit}����ҳURL��{$homeurl}
                ��ĩҳURL��{$endurl}����һҳURL��{$prevurl}����һҳURL��{$nexturl}����ת��{$turnpage}�����ַ�ҳ(1-10)��{$pagenumlist},���ַ�ҳ��{$pagenumlist(n)} ����n��ʾһ����ʾ������ҳ����</span>
              </td>
          </tr>


       </table>
 <br />
    <KS:Foot ID="Foot2" runat="server" OnSubmit="Foot2_Submit" SubmitButtonText="ȷ������(0)" />
</asp:Panel>



</asp:Content>

