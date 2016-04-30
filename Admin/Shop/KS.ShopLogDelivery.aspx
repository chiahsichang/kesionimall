<%@ Page Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.Admin.Shop.Admin_ShopLogDelivery" Title="���˻���ѯ" Codebehind="KS.ShopLogDelivery.aspx.cs" %>
<%@ Import Namespace="Kesion.Cache" %>
<%@ Import Namespace="Kesion.Publics" %>
<asp:Content ID="Content1" ContentPlaceHolderID="KSContent" Runat="Server">
<div id="manage_top" class="menu_top_fixed">&nbsp;<strong>���˻���ѯ����</strong>
 &nbsp;&nbsp;<strong>����=></strong>
    <asp:DropDownList ID="DrpSearchType" runat="server">
     <asp:ListItem Value="1">�ͻ�����</asp:ListItem>
     <asp:ListItem Value="2">�û�����</asp:ListItem>
     <asp:ListItem Value="3">������</asp:ListItem>
     <asp:ListItem Value="4">��ݵ���</asp:ListItem>
     <asp:ListItem Value="5">������</asp:ListItem>
    </asp:DropDownList>
    <asp:TextBox ID="TxtKey"  CssClass="textbox" runat="server" Width="100px"></asp:TextBox> 
<asp:Button ID="Button1"
        runat="server" Text=" �� �� " CssClass="button" OnClick="Button1_Click" />
</div> 
<div class="menu_top_fixed_height"></div>      

<div class="tabs_header">
    <ul class="tabs">
    <li<%=KSCMS.S("logtype")==""?" class='active'":string.Empty %>><a href="KS.ShopLogDelivery.aspx"><span>���м�¼</span></a></li>
    <li<%=KSCMS.S("logtype")=="5"?" class='active'":string.Empty %>><a href="KS.ShopLogDelivery.aspx?logType=5"><span style='color:Red;font-weight:bold'>δ����</span></a></li>
    <li<%=KSCMS.S("logtype")=="1"?" class='active'":string.Empty %>><a href="KS.ShopLogDelivery.aspx?logType=1"><span>������¼</span></a></li>
    <li<%=KSCMS.S("logtype")=="2"?" class='active'":string.Empty %>><a href="KS.ShopLogDelivery.aspx?logType=2"><span>�˻���¼</span></a></li>
    <li<%=KSCMS.S("logtype")=="3"?" class='active'":string.Empty %>><a href="KS.ShopLogDelivery.aspx?logType=3"><span>10�����¼�¼</span></a></li>
    <li<%=KSCMS.S("logtype")=="4"?" class='active'":string.Empty %>><a href="KS.ShopLogDelivery.aspx?logType=4"><span>һ�������¼�¼</span></a></li>
    </ul>
</div>

   <asp:Panel ID="ListPannel" runat="server">
        <KS:KSGV ID="LogDeliveryView" cssclass="CTable" runat="server" AutoGenerateColumns="False" 
            DataKeyNames="FieldID" GridLines="None"
            OnRowDataBound="FieldListView_RowDataBound" Width="99%" 
            EnableTheming="True" EmptyDataText="û���ҵ��κη��˻���¼!" 
            onrowcommand="LogDeliveryView_RowCommand">
            <Columns>
                 <asp:TemplateField HeaderText="������">
                  <itemstyle horizontalalign="Center" width="100px" />
                <ItemTemplate>
                  <a href='KS.ShopOrder.aspx?action=orderdetail&orderid=<%# Eval("OrderId").ToString() %>'><%# Eval("OrderId").ToString() %></a>
                </ItemTemplate>  
                </asp:TemplateField>
                <asp:BoundField DataField="DeliverType" HeaderText="����">
                  <itemstyle horizontalalign="Center" width="50px" />
                </asp:BoundField>
                
                <asp:BoundField DataField="DeliverDate" HeaderText="ʱ��">
                <itemstyle horizontalalign="Center" width="100px" />
                </asp:BoundField>
                <asp:BoundField DataField="UserName" HeaderText="�û���">
                <itemstyle horizontalalign="Center" width="50px" />
                </asp:BoundField>
                <asp:BoundField DataField="ClientName" HeaderText="�ͻ�����">
                <itemstyle width="80px" horizontalalign="Center" />
                </asp:BoundField>
                
                
                <asp:BoundField DataField="CorpName" HeaderText="������˾">
                  <itemstyle horizontalalign="Center" width="80px" />
                </asp:BoundField>
                <asp:BoundField DataField="ExpressNumber" HeaderText="��ݵ���">
                  <itemstyle horizontalalign="Center" width="100px" />
                </asp:BoundField>
                <asp:BoundField DataField="HandlerName" HeaderText="������">
                  <itemstyle horizontalalign="Center" width="70px" />
                </asp:BoundField>
                
                <asp:TemplateField HeaderText="״̬">
                <itemstyle horizontalalign="Center" />
             <itemtemplate>
                <%# Convert.ToString(Eval("status"))=="1"?"<span style='color:green'>�Ѵ���</span>":"<span style='color:red'>δ����</span>" %>
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
         <br />
        <script type="text/javascript">
		showtips('<span class="state"><strong>˵����</strong><br /></span>Ϊ���ڲ鿴���˻���¼,�˼�¼���ṩɾ������!');
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
                 <td align="right" class="lefttd" style="width: 109px; height: 30px"><strong>�ͻ�������</strong></td>
                 <td class="righttd" style="height: 30px;"><%=dr["ClientName"].ToString()%> (<%=dr["UserName"].ToString() %>)
                 </td>
             </tr>
		    <tr>
                 <td align="right" class="lefttd" style="width: 109px; height: 30px"><strong>ʱ�䣺</strong></td>
                 <td class="righttd" style="height: 30px;"><%=dr["DeliverDate"].ToString()%>
                 </td>
             </tr>
		    <tr>
                 <td align="right" class="lefttd" style="width: 109px; height: 30px"><strong>����</strong></td>
                 <td class="righttd" style="height: 30px;">
                 <%
                     if (dr["DeliverType"].ToString() == "1")
                     {
                         Response.Write("<span style='color:Green'>����</span>");
                     }
                     else if (dr["DeliverType"].ToString() == "3")
                     {
                         Response.Write("<span style='color:Purple'>�ͻ������˻��˿�</span>");
                     }
                     else
                     {
                         Response.Write("<span style='color:blue'>�˻��˿�</span>");
                     }
                  %>
                 </td>
             </tr>
              <% if (dr["DeliverType"].ToString() == "1"){ %>
		    <tr>
                 <td align="right" class="lefttd" style="width: 109px; height: 30px"><strong>������˾��</strong></td>
                 <td class="righttd" style="height: 30px;"><%=dr["corpname"].ToString()%>
                 </td>
             </tr>
		    <tr>
                 <td align="right" class="lefttd" style="width: 109px; height: 30px"><strong>��ݵ��ţ�</strong></td>
                 <td class="righttd" style="height: 30px;"><%=dr["ExpressNumber"].ToString()%>
                 </td>
             </tr>
		    <tr>
                 <td align="right" class="lefttd" style="width: 109px; height: 30px"><strong>�����ˣ�</strong></td>
                 <td class="righttd" style="height: 30px;"><%=dr["HandlerName"].ToString()%>
                 </td>
             </tr>
		    <tr>
                 <td align="right" class="lefttd" style="width: 109px; height: 30px"><strong>��ע��</strong></td>
                 <td class="righttd" style="height: 30px;"><%=dr["remark"].ToString()%>
                 </td>
             </tr>
		    <tr>
                 <td align="right" class="lefttd" style="width: 109px; height: 30px"></td>
                 <td class="righttd" style="height: 30px;">
                 <input type="button" class="button" value="����" onclick="history.back()"/>
                 <input type="button" class="button" onclick="window.print()" value="��ӡ" />
                 </td>
             </tr>
             <%} else{ %>
            <tr>
                 <td align="right" class="lefttd" style="width: 109px; height: 30px"><strong>�����˻��˿�ԭ��</strong></td>
                 <td class="righttd" style="height: 30px;"><%=dr["remark"].ToString()%>
                 </td>
             </tr>

		    <tr>
                 <td align="right" class="lefttd" style="width: 109px; height: 30px"><strong>�ʽ��˻ط�ʽ��</strong></td>
                 <td class="righttd" style="height: 30px;">
                 <% if (dr["MoneyReturnType"].ToString() == "1")
                    {
                        Response.Write("�۳��Ľ���˻ػ�ԱԤ������");
                    }
                    else if (dr["MoneyReturnType"].ToString() == "2")
                    {
                        Response.Write("�۳��Ľ���˻ص��ͻ��������ʺ�");
                    }
                    else
                    {
                        Response.Write("δ����");   
                    }
                 %>
                 </td>
             </tr>
             <%if (dr["MoneyReturnType"].ToString() == "2")
               { %>
               <tr>
                 <td align="right" class="lefttd" style="width: 109px; height: 30px"><strong>�������ƣ�</strong></td>
                 <td class="righttd" style="height: 30px;"><%=dr["MoneyReturnBankName"].ToString()%>
                 </td>
             </tr>
               <tr>
                 <td align="right" class="lefttd" style="width: 109px; height: 30px"><strong>���п��ţ�</strong></td>
                 <td class="righttd" style="height: 30px;"><%=dr["MoneyReturnBankCard"].ToString()%>
                 </td>
             </tr>
               <tr>
                 <td align="right" class="lefttd" style="width: 109px; height: 30px"><strong>���л�����</strong></td>
                 <td class="righttd" style="height: 30px;"><%=dr["MoneyReturnCardName"].ToString()%>
                 </td>
             </tr>
             <%} %>
             
             <tr>
                 <td align="right" class="lefttd" style="width: 109px; height: 30px"><strong>�Ƿ���</strong></td>
                 <td class="righttd" style="height: 30px;">
                 <% if (dr["status"].ToString() == "1")
                    {
                        Response.Write("<font color=green>�Ѵ���</font>");
                    }
                    else
                    {
                        Response.Write("<font color=red>δ����</font>");
                    }
                 %>
                 </td>
             </tr>
               <% if (dr["status"].ToString() == "1")
                  {%>
                 <tr>
                     <td align="right" class="lefttd" style="width: 109px; height: 30px"><strong>�����ˣ�</strong></td>
                     <td class="righttd" style="height: 30px;">
                     <%=dr["HandlerName"].ToString() %>
                     </td>
                 </tr>
                 <tr>
                     <td align="right" class="lefttd" style="width: 109px; height: 30px"><strong>����ʱ�䣺</strong></td>
                     <td class="righttd" style="height: 30px;">
                     <%=dr["HandlerDate"].ToString()%>
                     </td>
                 </tr>
             <tr>
                 <td align="right" class="lefttd" style="width: 109px; height: 30px"><strong>��������</strong></td>
                 <td class="righttd" style="height: 30px;">
                 <% if (dr["HandlerStatus"].ToString() == "1")
                    {
                        Response.Write("<font color=green>ͬ���˿��˻�</font>");
                    }
                    else
                    {
                        Response.Write("<font color=blue>��Э����</font>");
                    }
                 %>
                 </td>
             </tr>
                 <tr>
                     <td align="right" class="lefttd" style="width: 109px; height: 30px"></td>
                     <td class="righttd" style="height: 30px;">
                     <input type="button" class="button" value="����" onclick="history.back()"/>
                     <input type="button" class="button" onclick="window.print()" value="��ӡ" />
                     </td>
                 </tr>
               <%}else{
                       %>
                 <tr>
                     <td align="right" class="lefttd" style="width: 109px; height: 30px"></td>
                     <td class="righttd" style="height: 30px;">
                     <script type="text/javascript">
                    function returns() {
                        parent.openWin("�����˻��˿���Ϣ", "Shop/KS.ShopOrder.aspx?action=returns&id=<%=Id %>", true, 800, 490);
                    }       
                    </script>
                     <input type="button" class="button" value="ͬ���˻��˿�" onclick="returns()"/>
		             <input type='button' class='button' name='Submit'  value='�ѺͿͻ���Э�����ָ�����' onclick=KesionJS.Confirm("ȷ�����������ָ�����״̬��","location.href='KS.ShopOrder.aspx?from=delivery&Action=BankRefundOK&ID=<%=Id%>';","")>
                     </td>
                 </tr>
               <%} %>
             <%} %>
		 </table>

            <%if (dr["DeliverType"].ToString() == "1"){ %>
               <div style="margin:10px">
               <strong>��ݲ�ѯ: </strong><br />
              <%
                  string detail = Kesion.APPCode.ExpressAPI.GetLogByOrderID(dr["orderid"].ToString());
                  Response.Write(detail);
                 %>
              </div>
            <%} %>
		</asp:Panel>


  </asp:Content>