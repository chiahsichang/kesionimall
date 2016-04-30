<%@ Page Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.Admin_System_CleanCache" Title="Untitled Page" Codebehind="KS.CleanCache.aspx.cs" %>
<asp:Content ID="Content1" ContentPlaceHolderID="KSContent" Runat="Server">
  
   <div id="manage_top" style="padding-left:10px;text-align:left" class="toptitle menu_top_fixed">
             <input type="checkbox" name="chkall" id="chkall" onclick="CheckAll(this.form);"/><label for="chkall">ȫ��ѡ��</label>
            <asp:Button ID="DelButton" CssClass="button" runat="server" Text="����ѡ�еĻ���" OnClick="DelButton_Click" />
            <asp:Button ID="Button1" CssClass="button" runat="server" Text="�������л���" OnClick="Button1_Click" />
        </div>
   <div class="menu_top_fixed_height"></div> 

   
   
   
    <asp:Panel ID="ListPanel" runat="server" Width="100%">

        <KS:KSGV ID="List" runat="server" CssClass="CTable" AutoGenerateColumns="False" EmptyDataText="���޻����б�"
            OnRowDataBound="LogListView_RowDataBound" Width="99%" GridLines="None" PagerType="CustomNumeric" PageSize="20" OnRowCommand="List_RowCommand">
            <Columns>
                <asp:TemplateField HeaderText="ѡ��">
                <ItemStyle HorizontalAlign="Center"  Width="60px"/>
                <ItemTemplate>
                <input type="checkbox"  name="ids" value="<%#Eval("path") %>" />
               </ItemTemplate>
                    
                </asp:TemplateField>
                <asp:BoundField DataField="name" HeaderText="��������">
                 <ItemStyle Width="200px" font-bold="True" />
                </asp:BoundField>
                <asp:BoundField DataField="path" HeaderText="����·��">
                 <ItemStyle Width="160px"  forecolor="blue"/>
                </asp:BoundField>
                <asp:BoundField DataField="type" HeaderText="��������">
                 <ItemStyle Width="60px" horizontalalign="Center" />
                </asp:BoundField>
                <asp:TemplateField HeaderText="����">
                 <ItemStyle horizontalalign="Center" />
                <ItemTemplate>
                 <asp:LinkButton runat="server" id="view" CommandArgument=<%#Eval("path")+"#"+Eval("type") %>  CommandName="view">�鿴��������</asp:LinkButton>
                
                 <asp:LinkButton runat="server" id="upcache" CommandArgument=<%#Eval("path") %>  CommandName="modify"><font color=red><b>���»���</b></font></asp:LinkButton>
                 
                </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            <HeaderStyle CssClass="CTitle" />
        </KS:KSGV>
        
        

        
 </asp:Panel>
        
<asp:Panel ID="ShowStrPanel" runat="server" Visible="false" Width="100%">
    <table width="100%" border="0" cellpadding="1" cellspacing="1" class="CTable"> 
          <tr>
            <td class="lefttd" align="right" style="width: 198px; height: 30px;"><b>����·����</b></td>
            <td class="righttd" style="height: 30px">
                &nbsp;<asp:TextBox ID="CacheName" runat="server" Width="268px"></asp:TextBox>
                </td>
          </tr>
        <tr>
            <td align="right" class="lefttd" height="30" style="width: 198px">
                <strong>�������ݣ�</strong></td>
            <td class="righttd">
                &nbsp;<asp:TextBox ID="CacheContent" runat="server" Width="422px" Height="165px" TextMode="MultiLine"></asp:TextBox></td>
        </tr>
        </table>
      <div style="text-align:center">
       <br />
      <input type="button" value="������һ��" name="button1" class="button" onclick="javascript:history.back();" />
      </div>
</asp:Panel>
    
<asp:Panel ID="ShowDataTablePanel" runat="server" Visible="false" Width="100%">
          <KS:KSGV ID="KSGV1" runat="server" Width="100%" EmptyDataText="�������ݲ����ڣ�" GridLines="None" OnRowDataBound="KSGV1_RowDataBound" AllowPaging="True" OnPageIndexChanging="KSGV1_PageIndexChanging" PageSize="20">
                      <HeaderStyle CssClass="CTitle" />
              <EmptyDataRowStyle CssClass="emptycss" />

          </KS:KSGV>

      <div style="text-align:center">
       <br />
      <input type="button" value="������һ��" name="button1" class="button" onclick="history.back();" />
      </div>
    </asp:Panel>

</asp:Content>

