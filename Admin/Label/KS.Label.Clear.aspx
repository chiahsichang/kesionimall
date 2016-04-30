<%@ Page Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.Admin_Label_Clear" Title="Untitled Page" Codebehind="KS.Label.Clear.aspx.cs" %>
<%@ Import Namespace="Kesion.Publics" %>
<%@ Import Namespace="Kesion.Cache" %>
<asp:Content ID="Content1" ContentPlaceHolderID="KSContent" Runat="Server">
  
            <KS:TopNav ID="TopNav1" runat="server" Text="以下标签没有被模板调用可以删除" />


    <KS:KSGV ID="List" cssclass="CTable" runat='server' AllowPaging="true" PageSize="20" 
        PagerType="CustomNumeric" Width="99%" HorizontalAlign="center" 
        EmptyDataText="没有找到不可用的标签记录！" AutoGenerateColumns="False" GridLines="None" 
        OnRowDataBound="List_RowDataBound" OnRowCommand="List_RowCommand" 
        OnRowCreated="List_RowCreated" 
        onpageindexchanging="List_PageIndexChanging" CellSpacing="1">
                <Columns>
                    <asp:BoundField HeaderText="标签ID" DataField="labelid" >
                        <itemstyle horizontalalign="Center" />
                    </asp:BoundField>

                    <asp:TemplateField HeaderText="选择">
                        <ItemStyle HorizontalAlign="Center"  Width="35px"/>
                        <ItemTemplate>
                             <input type="checkbox"  name="ids" value="<%#Eval("labelid") %>" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="标签名称">
                        <itemtemplate>
                     <%#Eval("labelname") %>
                        </itemtemplate>
                    </asp:TemplateField>


                    <asp:TemplateField HeaderText="标签类型">
                        <ItemStyle HorizontalAlign="Center"/>
                        <ItemTemplate>
                            <%# Kesion.NET.WebSite.Admin_Label_Label.getLabelType(Utils.StrToInt(Eval("LabelFlag")))%>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="更新时间">
                        <itemstyle horizontalalign="Center" />
                        <itemtemplate>
                         <span class="tips"><%# Utils.FormatHumanizedTime(Convert.ToDateTime(Eval("AddDate"))) %></span>
                        </itemtemplate>
                    </asp:TemplateField>



                    <asp:TemplateField HeaderText="删除">
                       <itemstyle horizontalalign="Center" width="25"/>
                        <itemtemplate>
                         <a class="delete" href='?Action=del&ids=<%#Eval("labelid") %>' title="删除" onclick="return(confirm('此操作不可逆，确定删除操作吗?'))"></a>
                        </itemtemplate>
                    </asp:TemplateField>

             
                </Columns>
                <PagerSettings FirstPageText="首页" LastPageText="末页" Mode="NumericFirstLast" 
                    NextPageText="下一页" PreviousPageText="上一页" />
                <EmptyDataRowStyle CssClass="emptycss" />
                <PagerStyle BorderStyle="None" BorderWidth="1px" Height="40px" Wrap="True" />
                <HeaderStyle CssClass="CTitle" />
            </KS:KSGV>

           
           <table cellpadding="0" cellspacing="0" style="width: 100%;margin-top:10px">
            <tr>
                <td style="height: 25px">
                   &nbsp;&nbsp;&nbsp;&nbsp;<input type="checkbox" name="chkall" id="chkall" onclick="CheckAll(this.form);"/><label for="chkall">全部选中</label>
            <input type="button" value="删除选中的标签" onmouseover="this.className='button_on';" onmouseout="this.className='button';" class="button" onclick="if (GetIDS('del')) { this.form.action = '?action=del'; this.form.submit() }" />
                  
                    <asp:Button ID="BtnDelAll" Text="一键清空所有用无标签" OnClientClick="return(confirm('此操作不可逆，确认清空无用标签吗？'));" CssClass="button" runat="server" OnClick="BtnDelAll_Click" />
                      </td>
                <td style="font-size: 9pt; height: 25px; text-align: right">
                       
                </td>
            </tr>
        </table>

        <br />
        <script type="text/javascript">
            showtips('<span class="state"><strong>说明：</strong><br /></span>1、如果您对此不了解，建议误执行此操作；<br/>2、删除系统检测到的无用标签前，我们建议您先做好数据库备份工作，以勉由此造成的标签误删除时，进行还原操作；<br/>3、清除无用标签的原理是系统检测模板目录的模板是否有调用该标签，没有被模板调用视为无用标签；');
		</script>


</asp:Content>

