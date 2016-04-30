<%@ Page Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.Admin_BBS_Rank" Title="��̳�ȼ�����" Codebehind="KS.BBSRank.aspx.cs" %>
<asp:Content ID="Content1" ContentPlaceHolderID="KSContent" Runat="Server">

<asp:Panel ID="ListPannel" runat="server" Width="100%">
 <div id="manage_top" class="toptitle menu_top_fixed" style="text-align:left">��̳�ȼ�����  <a href="?action=Add">����µȼ�</a></div>
 <div class="menu_top_fixed_height"></div> 
        <asp:GridView ID="RankList" cssclass="CTable"  runat="server" AutoGenerateColumns="False" EmptyDataText="��û�������̳�ȼ�!"
        GridLines="None"  OnRowDataBound="List_RowDataBound"
        Width="99%" OnRowCommand="RankList_RowCommand" OnRowCreated="RankList_RowCreated">
        <EmptyDataRowStyle CssClass="emptycss" />
        <Columns>
            
            
             <asp:TemplateField HeaderText="�ȼ�ID" InsertVisible="False">   
            <ItemStyle HorizontalAlign="Center" Width="60px" />                    
                <ItemTemplate>    
                    <%# Eval("RankID") %> 
                    <asp:HiddenField ID="HidIsSys" runat="server" Value='<%# Eval("IsSys") %>' />      
                </ItemTemplate>             
            </asp:TemplateField> 
            
            <asp:TemplateField HeaderText="�ȼ�����">
            <ItemStyle HorizontalAlign="Center" />
            <ItemTemplate>
              <asp:TextBox CssClass="textbox" Width="100" ID="TxtRankName" Text='<%#Eval("RankName") %>' runat="server"></asp:TextBox>
             </ItemTemplate>
            </asp:TemplateField>           
            <asp:TemplateField HeaderText="�ȼ�ͼ��">
            <ItemStyle HorizontalAlign="Center" Width="200px" />
            <ItemTemplate>
              <asp:TextBox CssClass="textbox" ID="TxtIco"  Width="100" Text='<%#Eval("Ico") %>' runat="server"></asp:TextBox>
              <img src="../../sysimg/rank/<%# Eval("ico") %>" />
             </ItemTemplate> 
            </asp:TemplateField>
            <asp:TemplateField HeaderText="��ɫֵ">
            <ItemStyle HorizontalAlign="Center" Width="200px" />
            <ItemTemplate>
              <asp:TextBox CssClass="textbox" ID="TxtColor"  Width="60" Text='<%#Eval("Color") %>' runat="server"></asp:TextBox>
             </ItemTemplate> 
            </asp:TemplateField>
            <asp:TemplateField HeaderText="�������">
            <ItemStyle HorizontalAlign="Center" />
            <ItemTemplate>
              <asp:TextBox CssClass="textbox" ID="TxtScore" Width="40" Text='<%#Eval("Score") %>' runat="server"></asp:TextBox>
             </ItemTemplate> 
            </asp:TemplateField>
            <asp:TemplateField HeaderText="������">
            <ItemStyle HorizontalAlign="Center" />
            <ItemTemplate>
              <asp:TextBox CssClass="textbox" ID="TxtTopicNum"  Width="40" Text='<%#Eval("TopicNum") %>' runat="server"></asp:TextBox>
             </ItemTemplate> 
            </asp:TemplateField>
            <asp:TemplateField HeaderText="�ظ���">
            <ItemStyle HorizontalAlign="Center" />
            <ItemTemplate>
              <asp:TextBox CssClass="textbox" ID="TxtPostNum"   Width="40" Text='<%#Eval("PostNum") %>' runat="server"></asp:TextBox>
             </ItemTemplate> 
            </asp:TemplateField>

            <asp:TemplateField HeaderText="ɾ��">
                       <itemstyle horizontalalign="Center" width="25"/>
                        <itemtemplate>
                         <asp:LinkButton CssClass="delete" ToolTip="ɾ��" ID="lkbDelete" CommandName="dodel" CommandArgument='<%#Eval("RankID") %>' runat="server"></asp:LinkButton>
                        </itemtemplate>
               </asp:TemplateField>
        </Columns>
        <HeaderStyle CssClass="CTitle" />
    </asp:GridView>
    
    <div style="display:none">

     <KS:Page ID="Page1" runat="server" /></div>
    <br />
    <KS:Foot ID="Foot1" runat="server" OnSubmit="Foot1_Submit" CancelButtonVisible="false" SubmitButtonText="��������(0)" />
    <br />
     <script type="text/javascript">
               showtips('<span class="state"><strong>˵����</strong><br /></span>1���ȼ�ͼ����ŵ�/sysimg/rank/Ŀ¼�£�<br/>2��Ӧ�þ�����Ҫɾ������ӵĵȼ�;<br/>3���ȼ��ߵ��������󣬼����ȼ�ID�ŴӵͶ��ߡ�');
	 </script>

</asp:Panel>

<asp:Panel ID="PanAdd" runat="server" Visible="false">
<KS:TopNav ID="TopNav1" runat="server" Text="����ʴ�ȼ�" />
        <table width="99%" style="margin:0 auto;" border="0" cellpadding="1" cellspacing="1" class="CTable"> 
          <tr>
            <td class="lefttd" height="30" align="right" style="width: 198px"><b>�ȼ����ƣ�</b></td>
            <td class="righttd">
                &nbsp;<asp:TextBox CssClass="textbox" ID="TxtRankName" runat="server"></asp:TextBox> <font color=#ff0000>*</font>
              </td>
          </tr>
          <tr>
            <td class="lefttd" height="30" align="right" style="width: 198px"><b>�ȼ�ͼ�꣺</b></td>
            <td class="righttd">
                &nbsp;<asp:TextBox CssClass="textbox" ID="TxtIco" Text="rank0.gif" runat="server"></asp:TextBox> 
              </td>
          </tr>
          <tr>
            <td class="lefttd" height="30" align="right" style="width: 198px"><b>�ȼ���ɫ��</b></td>
            <td class="righttd">
                &nbsp;<asp:TextBox CssClass="textbox" ID="TxtColor"  runat="server"></asp:TextBox> <span class="tips">����д��ɫֵ����#666666,�������ղ��</span>
              </td>
          </tr>
          <tr>
            <td class="lefttd" height="30" align="right" style="width: 198px"><b>�������õȼ���������</b></td>
            <td class="righttd">
                &nbsp;���֣�<asp:TextBox CssClass="textbox" Width="50px" style="text-align:center" ID="TxtScore" Text="0" runat="server"></asp:TextBox> 
                &nbsp;��������<asp:TextBox CssClass="textbox" Width="50px" style="text-align:center" ID="TxtTopicNum" Text="0" runat="server"></asp:TextBox> 
                &nbsp;�ش�����<asp:TextBox CssClass="textbox" Width="50px" style="text-align:center" ID="TxtPostNum" Text="0" runat="server"></asp:TextBox> 
              </td>
          </tr>

       </table>
 <br />
    <KS:Foot ID="Foot2" runat="server" OnSubmit="Foot2_Submit" SubmitButtonText="ȷ������(0)" />
</asp:Panel>



</asp:Content>

