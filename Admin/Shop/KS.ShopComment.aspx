<%@ Page Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.Admin.Shop.Admin_ShopComment" Title="��Ʒ���۹���" Codebehind="KS.ShopComment.aspx.cs" %>
<%@ Import Namespace="Kesion.Cache" %>
<%@ Import Namespace="Kesion.Publics" %>
<asp:Content ID="Content1" ContentPlaceHolderID="KSContent" Runat="Server">
<div id="manage_top" class="menu_top_fixed">
<span style="float:right;padding-right:5px;"><a href="KS.ShopCommentReply.aspx" style="font-weight:bold">���ۻظ�����</a></span>
&nbsp;<strong>���۲�ѯ��</strong>
 &nbsp;&nbsp;<strong>����=></strong>
    <asp:DropDownList ID="DrpSearchType" runat="server">
     <asp:ListItem Value="1">�û�����</asp:ListItem>
     <asp:ListItem Value="2">������</asp:ListItem>
     <asp:ListItem Value="3">��Ʒ����</asp:ListItem>
    </asp:DropDownList>
    <asp:TextBox ID="TxtKey"  CssClass="textbox" runat="server" Width="100px"></asp:TextBox> 
<asp:Button ID="Button1" runat="server" Text=" �� �� " CssClass="button" OnClick="Button1_Click" />
</div> 
<div class="menu_top_fixed_height"></div>
<div class="tabs_header">
    <ul class="tabs">
    <li<%=KSCMS.S("logtype")==""?" class='active'":string.Empty %>><a href="KS.ShopComment.aspx"><span>���м�¼</span></a></li>
    <li<%=KSCMS.S("logtype")=="2"?" class='active'":string.Empty %>><a href="KS.ShopComment.aspx?logType=2"><span style='color:Red;font-weight:bold'>δ���</span></a></li>
    <li<%=KSCMS.S("logtype")=="1"?" class='active'":string.Empty %>><a href="KS.ShopComment.aspx?logType=1"><span>�����</span></a></li>
    <li<%=KSCMS.S("logtype")=="3"?" class='active'":string.Empty %>><a href="KS.ShopComment.aspx?logType=3"><span>����</span></a></li>
    <li<%=KSCMS.S("logtype")=="4"?" class='active'":string.Empty %>><a href="KS.ShopComment.aspx?logType=4"><span>����</span></a></li>
    <li<%=KSCMS.S("logtype")=="5"?" class='active'":string.Empty %>><a href="KS.ShopComment.aspx?logType=5"><span>����</span></a></li>

    </ul>
</div>

   <asp:Panel ID="ListPannel" runat="server">
        <KS:KSGV ID="LogDeliveryView" cssclass="CTable" runat="server" AutoGenerateColumns="False" 
            DataKeyNames="FieldID" GridLines="None"
            OnRowDataBound="FieldListView_RowDataBound" Width="99%" 
            EnableTheming="True"  EmptyDataText="û���ҵ��κ���Ʒ���ۼ�¼!" 
            onrowcommand="LogDeliveryView_RowCommand">
            <Columns>
               <asp:TemplateField HeaderText="ѡ��">
                <itemstyle horizontalalign="Center" width="40px" />
                <itemtemplate>
                    <input type="checkbox"  name="ids" id="ids" value="<%#Eval("id") %>" />
               </itemtemplate>
              </asp:TemplateField>
                 <asp:TemplateField HeaderText="������Ʒ">
                  <itemstyle horizontalalign="Left" width="200px" />
                 <ItemTemplate>
                  <a href='<%# Kesion.HtmlTags.BasicField.GetItemUrl(Utils.StrToInt(Eval("ChannelID")),Utils.StrToInt(Eval("ProID"))) %>' title="<%# Eval("title") %>" target="_blank"><%# Utils.CutStr(Convert.ToString(Eval("Title")),30) %></a>
                 </ItemTemplate>  
                </asp:TemplateField>
                 <asp:TemplateField HeaderText="��������">
                  <itemstyle horizontalalign="Left"  />
                 <ItemTemplate>
                 <%# Utils.CutStr(Convert.ToString(Eval("Content")),60) %>
                 </ItemTemplate>  
                </asp:TemplateField>


                <asp:BoundField DataField="UserName" HeaderText="������">
                  <itemstyle horizontalalign="Center" width="50px" />
                </asp:BoundField>
                
                <asp:BoundField DataField="AddDate" HeaderText="ʱ��">
                <itemstyle horizontalalign="Center" width="100px" />
                </asp:BoundField>
                <asp:BoundField DataField="CmtType" HeaderText="����">
                <itemstyle horizontalalign="Center" width="40px" />
                </asp:BoundField>
              
               <asp:TemplateField HeaderText="����">
                  <itemstyle horizontalalign="Center"  />
                 <ItemTemplate>
                 <img src="../../SysImg/star/star-<%# Eval("StarNum") %>.jpg" title="<%# Eval("StarNum") %>����"/>
                 </ItemTemplate>  
                </asp:TemplateField>
                
                <asp:TemplateField HeaderText="״̬">
                <itemstyle horizontalalign="Center" />
             <itemtemplate>
                <%# Convert.ToString(Eval("status"))=="1"?"<span style='color:green'>�����</span>":"<span style='color:red'>δ���</span>" %>
               </itemtemplate>
            </asp:TemplateField>
 
                <asp:TemplateField HeaderText="������">
                <itemstyle horizontalalign="Center" />
             <itemtemplate>
             <asp:LinkButton runat="server" id="showBtn" CssClass="showBtn" title="�鿴����" commandargument=<%#Eval("id") %> commandname="show"></asp:LinkButton>
               </itemtemplate>
            </asp:TemplateField>
            </Columns>
            <HeaderStyle CssClass="CTitle" />
            <EmptyDataRowStyle CssClass="emptycss" />
        </KS:KSGV>
        <br />

        
          <KS:Page ID="Page1" runat="server" />
         <asp:Panel ID="Panel1" runat="server" Height="30px">
              <div style="margin-top:5px;overflow:hidden;"></div>
            &nbsp;&nbsp;<input type="checkbox" name="chkall" id="chkall" onclick="CheckAll(this.form);"/><label for="chkall">ȫ��ѡ��</label>
             <input type="button" value="ɾ��ѡ�е�����" onmouseover="this.className='button_on';" onmouseout="this.className='button';" class="button" onclick="if (GetIDS('del')){this.form.action='?action=del';this.form.submit()}" />
            &nbsp;&nbsp;<asp:Button
                ID="Button2" runat="server" CssClass="button" Text="�����������" onclick="Button2_Click"  />
          <asp:Button ID="Button3" runat="server" CssClass="button" Text="����ȡ�����" onclick="Button3_Click" /></asp:Panel>   

         <br />
        <script type="text/javascript">
		showtips('<span class="state"><strong>˵����</strong><br /></span>����Ʒ���������ݽ�����ˣ�ɾ���Ȳ���!');
		</script>
		</asp:Panel>
		
		<asp:Panel runat="server" ID="showPannel" Visible="false">
		
		 <table width="99%" align="center" border="0" cellpadding="1" cellspacing="1" class="CTable"> 
		    <tr>
                 <td align="right" class="lefttd" style="width: 109px; height: 30px"><strong>�����ţ�</strong></td>
                 <td class="righttd" style="height: 30px;"><%=dr["orderid"].ToString() %>
                 </td>
             </tr>
             <tr>
                 <td align="right" class="lefttd" style="width: 109px; height: 30px"><strong>������Ʒ��</strong></td>
                 <td class="righttd" style="height: 30px;"><%=dr["Title"].ToString() %>
                 </td>
             </tr>
             <tr>
                 <td align="right" class="lefttd" style="width: 109px; height: 30px"><strong>����ʱ�䣺</strong></td>
                 <td class="righttd" style="height: 30px;"><%=dr["BuyDate"].ToString() %>
                 </td>
             </tr>
		    <tr>
                 <td align="right" class="lefttd" style="width: 109px; height: 30px"><strong>�����ˣ�</strong></td>
                 <td class="righttd" style="height: 30px;"><%=dr["UserName"].ToString() %>
                 </td>
             </tr>
		    <tr>
                 <td align="right" class="lefttd" style="width: 109px; height: 30px"><strong>����ʱ�䣺</strong></td>
                 <td class="righttd" style="height: 30px;"><%=dr["AddDate"].ToString()%>
                 </td>
             </tr>
		    <tr>
                 <td align="right" class="lefttd" style="width: 109px; height: 30px"><strong>�������ݣ�</strong></td>
                 <td class="righttd" style="height: 30px;"><%=dr["Content"].ToString().Replace("\n","<br/>")%>
                 </td>
             </tr>
		    <tr>
                 <td align="right" class="lefttd" style="width: 109px; height: 30px"><strong>�������ǣ�</strong></td>
                 <td class="righttd" style="height: 30px;"><img src="../../SysImg/star/star-<%=dr["StarNum"].ToString()%>.jpg" title="<%=dr["StarNum"].ToString() %>����"/> </td>
             </tr>
		    <tr>
                 <td align="right" class="lefttd" style="width: 109px; height: 30px"><strong>���۵ȼ���</strong></td>
                 <td class="righttd" style="height: 30px;">
                 <%
                     if (dr["CmtType"].ToString() == "0")
                     {
                         Response.Write("<span style='color:Green'>����</span>");
                     }
                     else if (dr["CmtType"].ToString() == "1")
                     {
                         Response.Write("<span style='color:Purple'>����</span>");
                     }
                     else
                     {
                         Response.Write("<span style='color:blue'>����</span>");
                     }
                  %>
                 </td>
             </tr>
		    <tr>
                 <td align="right" class="lefttd" style="width: 109px; height: 30px"><strong>״̬��</strong></td>
                 <td class="righttd" style="height: 30px;">
                 <%
                     if (dr["Status"].ToString() == "0")
                     {
                         Response.Write("<span style='color:red'>δ���</span>");
                     }
                     else
                     {
                         Response.Write("<span style='color:blue'>�����</span>");
                     }
                  %>
                 </td>
             </tr>
            
		 </table>

         <div style="margin-top:20px;text-align:center">
          <input type="button" name="backBtn" class="button" value=" �� �� " onclick="history.back()" />
         </div>

		</asp:Panel>


  </asp:Content>