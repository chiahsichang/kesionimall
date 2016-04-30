<%@ Page Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.Admin_Label_Clear" Title="Untitled Page" Codebehind="KS.Label.Clear.aspx.cs" %>
<%@ Import Namespace="Kesion.Publics" %>
<%@ Import Namespace="Kesion.Cache" %>
<asp:Content ID="Content1" ContentPlaceHolderID="KSContent" Runat="Server">
  
            <KS:TopNav ID="TopNav1" runat="server" Text="���±�ǩû�б�ģ����ÿ���ɾ��" />


    <KS:KSGV ID="List" cssclass="CTable" runat='server' AllowPaging="true" PageSize="20" 
        PagerType="CustomNumeric" Width="99%" HorizontalAlign="center" 
        EmptyDataText="û���ҵ������õı�ǩ��¼��" AutoGenerateColumns="False" GridLines="None" 
        OnRowDataBound="List_RowDataBound" OnRowCommand="List_RowCommand" 
        OnRowCreated="List_RowCreated" 
        onpageindexchanging="List_PageIndexChanging" CellSpacing="1">
                <Columns>
                    <asp:BoundField HeaderText="��ǩID" DataField="labelid" >
                        <itemstyle horizontalalign="Center" />
                    </asp:BoundField>

                    <asp:TemplateField HeaderText="ѡ��">
                        <ItemStyle HorizontalAlign="Center"  Width="35px"/>
                        <ItemTemplate>
                             <input type="checkbox"  name="ids" value="<%#Eval("labelid") %>" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="��ǩ����">
                        <itemtemplate>
                     <%#Eval("labelname") %>
                        </itemtemplate>
                    </asp:TemplateField>


                    <asp:TemplateField HeaderText="��ǩ����">
                        <ItemStyle HorizontalAlign="Center"/>
                        <ItemTemplate>
                            <%# Kesion.NET.WebSite.Admin_Label_Label.getLabelType(Utils.StrToInt(Eval("LabelFlag")))%>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="����ʱ��">
                        <itemstyle horizontalalign="Center" />
                        <itemtemplate>
                         <span class="tips"><%# Utils.FormatHumanizedTime(Convert.ToDateTime(Eval("AddDate"))) %></span>
                        </itemtemplate>
                    </asp:TemplateField>



                    <asp:TemplateField HeaderText="ɾ��">
                       <itemstyle horizontalalign="Center" width="25"/>
                        <itemtemplate>
                         <a class="delete" href='?Action=del&ids=<%#Eval("labelid") %>' title="ɾ��" onclick="return(confirm('�˲��������棬ȷ��ɾ��������?'))"></a>
                        </itemtemplate>
                    </asp:TemplateField>

             
                </Columns>
                <PagerSettings FirstPageText="��ҳ" LastPageText="ĩҳ" Mode="NumericFirstLast" 
                    NextPageText="��һҳ" PreviousPageText="��һҳ" />
                <EmptyDataRowStyle CssClass="emptycss" />
                <PagerStyle BorderStyle="None" BorderWidth="1px" Height="40px" Wrap="True" />
                <HeaderStyle CssClass="CTitle" />
            </KS:KSGV>

           
           <table cellpadding="0" cellspacing="0" style="width: 100%;margin-top:10px">
            <tr>
                <td style="height: 25px">
                   &nbsp;&nbsp;&nbsp;&nbsp;<input type="checkbox" name="chkall" id="chkall" onclick="CheckAll(this.form);"/><label for="chkall">ȫ��ѡ��</label>
            <input type="button" value="ɾ��ѡ�еı�ǩ" onmouseover="this.className='button_on';" onmouseout="this.className='button';" class="button" onclick="if (GetIDS('del')) { this.form.action = '?action=del'; this.form.submit() }" />
                  
                    <asp:Button ID="BtnDelAll" Text="һ������������ޱ�ǩ" OnClientClick="return(confirm('�˲��������棬ȷ��������ñ�ǩ��'));" CssClass="button" runat="server" OnClick="BtnDelAll_Click" />
                      </td>
                <td style="font-size: 9pt; height: 25px; text-align: right">
                       
                </td>
            </tr>
        </table>

        <br />
        <script type="text/javascript">
            showtips('<span class="state"><strong>˵����</strong><br /></span>1��������Դ˲��˽⣬������ִ�д˲�����<br/>2��ɾ��ϵͳ��⵽�����ñ�ǩǰ�����ǽ��������������ݿⱸ�ݹ����������ɴ���ɵı�ǩ��ɾ��ʱ�����л�ԭ������<br/>3��������ñ�ǩ��ԭ����ϵͳ���ģ��Ŀ¼��ģ���Ƿ��е��øñ�ǩ��û�б�ģ�������Ϊ���ñ�ǩ��');
		</script>


</asp:Content>

