<%@ Page Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.Admin.Shop.Admin_ShopAsk" Title="��Ʒ��ѯ�ظ�����" Codebehind="KS.ShopAsk.aspx.cs" %>
<%@ Import Namespace="Kesion.Cache" %>
<%@ Import Namespace="Kesion.Publics" %>
<asp:Content ID="Content1" ContentPlaceHolderID="KSContent" Runat="Server">
<div id="manage_top" class="menu_top_fixed">
 &nbsp;&nbsp;<strong>����=></strong>
    <asp:DropDownList ID="DrpSearchType" runat="server">
     <asp:ListItem Value="3">��Ʒ����</asp:ListItem>
     <asp:ListItem Value="1">�û�����</asp:ListItem>
     <asp:ListItem Value="2">��ѯ����</asp:ListItem>
    </asp:DropDownList>
    <asp:TextBox ID="TxtKey"  CssClass="textbox" runat="server" Width="100px"></asp:TextBox> 
<asp:Button ID="Button1"
        runat="server" Text=" �� �� " CssClass="button" OnClick="Button1_Click" />
</div> 
<div class="menu_top_fixed_height"></div>
<div class="tabs_header">
    <ul class="tabs">
        <li<%=KSCMS.S("logtype")==""?" class='active'":string.Empty %>><a href="KS.ShopAsk.aspx"><span>���м�¼</span></a></li>
        <li<%=KSCMS.S("logtype")=="2"?" class='active'":string.Empty %>><a href="KS.ShopAsk.aspx?logType=2"><span style='color:Red;font-weight:bold'>δ���</span></a></li>
        <li<%=KSCMS.S("logtype")=="1"?" class='active'":string.Empty %>><a href="KS.ShopAsk.aspx?logType=1"><span>�����</span></a></li>
        <li<%=KSCMS.S("logtype")=="3"?" class='active'":string.Empty %>><a href="KS.ShopAsk.aspx?logType=3"><span>δ�ظ�</span></a></li>
        <li<%=KSCMS.S("logtype")=="4"?" class='active'":string.Empty %>><a href="KS.ShopAsk.aspx?logType=4"><span>�ѻظ�</span></a></li>
    </ul>
</div>

   <asp:Panel ID="ListPannel" runat="server">
        <KS:KSGV ID="LogDeliveryView" cssclass="CTable" runat="server" AutoGenerateColumns="False" 
            DataKeyNames="FieldID" GridLines="None"
            OnRowDataBound="FieldListView_RowDataBound" Width="99%" 
            EnableTheming="True"  EmptyDataText="û���ҵ��κ���Ʒ��ѯ�ظ���¼!" 
            onrowcommand="LogDeliveryView_RowCommand">
            <Columns>
               <asp:TemplateField HeaderText="ѡ��">
                <itemstyle horizontalalign="Center" width="40px" />
                <itemtemplate>
                    <input type="checkbox"  name="ids" id="ids" value="<%#Eval("id") %>" />
               </itemtemplate>
              </asp:TemplateField>
                
                 <asp:TemplateField HeaderText="��Ʒ����">
                  <itemstyle horizontalalign="Left"  />
                 <ItemTemplate>
                <a href="../../model/view.aspx?m_id=<%# Eval("channelid") %>&id=<%# Eval("infoid") %>" target="_blank" title="<%# Eval("title") %>"><%# Utils.CutStr(Convert.ToString(Eval("title")),50) %></a>
                 </ItemTemplate>  
                </asp:TemplateField>
                
                 <asp:TemplateField HeaderText="��ѯ����">
                  <itemstyle horizontalalign="Left"  />
                 <ItemTemplate>
                 <%# Utils.CutStr(Convert.ToString(Eval("Content")),60) %>
                 </ItemTemplate>  
                </asp:TemplateField>


                <asp:BoundField DataField="UserName" HeaderText="��ѯ��">
                  <itemstyle horizontalalign="Center" width="50px" />
                </asp:BoundField>
                
                <asp:BoundField DataField="AddDate" HeaderText="ʱ��">
                <itemstyle horizontalalign="Center" width="100px" />
                </asp:BoundField>
              
             
                
                <asp:TemplateField HeaderText="״̬">
                <itemstyle horizontalalign="Center" />
             <itemtemplate>
                <%# Convert.ToString(Eval("status"))=="1"?"<span style='color:green'>�����</span>":"<span style='color:red'>δ���</span>" %>
                <%# Convert.ToString(Eval("isreply"))=="1"?"<span style='color:green'>�ѻظ�</span>":"<span style='color:red'>δ�ظ�</span>" %>
               </itemtemplate>
            </asp:TemplateField>
 
                <asp:TemplateField HeaderText="������">
                <itemstyle horizontalalign="Center" />
             <itemtemplate>
             <asp:LinkButton runat="server" id="showBtn" CssClass="showBtn" title="�鿴/�ظ�" commandargument=<%#Eval("id") %> commandname="show"></asp:LinkButton>
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
             <input type="button" value="ɾ��ѡ�е���ѯ�ظ�" onmouseover="this.className='button_on';" onmouseout="this.className='button';" class="button" onclick="if (GetIDS('del')){this.form.action='?action=del';this.form.submit()}" />
            &nbsp;&nbsp;<asp:Button
                ID="Button2" runat="server" CssClass="button" Text="���������ѯ�ظ�" onclick="Button2_Click"  />
          <asp:Button ID="Button3" runat="server" CssClass="button" Text="����ȡ�����" onclick="Button3_Click" /></asp:Panel>   

         <br />
        <script type="text/javascript">
		showtips('<span class="state"><strong>˵����</strong><br /></span>����Ʒ����ѯ���ݽ�����ˣ�ɾ�����ظ��Ȳ���!');
		</script>
		</asp:Panel>
		
		<asp:Panel runat="server" ID="showPannel" Visible="false">
		
		 <table width="99%" align="center" border="0" cellpadding="1" cellspacing="1" class="CTable"> 
		   
          
		    <tr>
                 <td align="right" class="lefttd" style="width: 109px; height: 30px"><strong>��ѯ����Ʒ��</strong></td>
                 <td class="righttd" style="height: 30px;"><%=dr["title"].ToString() %>
                 </td>
             </tr>
		    <tr>
                 <td align="right" class="lefttd" style="width: 109px; height: 30px"><strong>��ѯ�ˣ�</strong></td>
                 <td class="righttd" style="height: 30px;"><%=dr["UserName"].ToString() %>
                 </td>
             </tr>
		    <tr>
                 <td align="right" class="lefttd" style="width: 109px; height: 30px"><strong>��ѯʱ�䣺</strong></td>
                 <td class="righttd" style="height: 30px;"><%=dr["AddDate"].ToString()%>
                 </td>
             </tr>
		    <tr>
                 <td align="right" class="lefttd" style="width: 109px; height: 30px"><strong>��ѯ���ݣ�</strong></td>
                 <td class="righttd" style="height: 30px;"><%=dr["Content"].ToString().Replace("\n","<br/>")%>
                 </td>
             </tr>
             <tr>
                 <td align="right" class="lefttd" style="width: 109px; height: 30px"><strong>�Ƿ�ظ���</strong></td>
                 <td class="righttd" style="height: 30px;">
                 <%if (dr["isReply"].ToString() == "1")
                   {
                       Response.Write("<span style='color:green'>�Ѵ�</span>");
                   }
                   else
                   {
                       Response.Write("<span style='color:red'>δ��</span>");
                   }     
                  %>
                 </td>
             </tr>
		    <tr>
                 <td align="right" class="lefttd" style="width: 109px; height: 30px"><strong>�ظ����ݣ�</strong></td>
                 <td class="righttd" style="height: 30px;">

                 <asp:TextBox ID="TxtReplyContent" Width="90%" Height="100" TextMode="MultiLine" runat="server"></asp:TextBox>
                 </td>
             </tr>
		    <tr>
                 <td align="right" class="lefttd" style="width: 109px; height: 30px"><strong>�ظ��ˣ�</strong></td>
                 <td class="righttd" style="height: 30px;">

                 <asp:TextBox ID="TxtReplyUser" CssClass="textbox" runat="server"></asp:TextBox>
                 </td>
             </tr>
		    <tr>
                 <td align="right" class="lefttd" style="width: 109px; height: 30px"><strong>�ظ�ʱ�䣺</strong></td>
                 <td class="righttd" style="height: 30px;">

                 <asp:TextBox ID="TxtReplyDate" CssClass="textbox" runat="server"  onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'});"></asp:TextBox>
                 <span class="tips">���ڸ�ʽ����-��-�� ʱ:��:�� </span>
                 </td>
             </tr>
		   
		    <tr>
                 <td align="right" class="lefttd" style="width: 109px; height: 30px"><strong>״̬��</strong></td>
                 <td class="righttd" style="height: 30px;">
                  <asp:RadioButtonList ID="RdbStatus" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow">
                   <asp:ListItem Value="0">δ���</asp:ListItem>
                   <asp:ListItem Value="1">�����</asp:ListItem>
                  </asp:RadioButtonList>
                 </td>
             </tr>
            
		 </table>

         <div style="margin-top:20px;text-align:center">
          <asp:HiddenField ID="HidAskId" runat="server" />
          <asp:Button Text="�ύ�ظ�" runat="server" ID="BtnSubmit" CssClass="button" 
                 onclick="BtnSubmit_Click" />
          <input type="button" name="backBtn" class="button" value=" �� �� " onclick="history.back()" />
         </div>

		</asp:Panel>


  </asp:Content>