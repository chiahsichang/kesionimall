<%@ Page Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.Admin.Shop.Admin_ShopLogDelivery" Title="发退货查询" Codebehind="KS.ShopLogDelivery.aspx.cs" %>
<%@ Import Namespace="Kesion.Cache" %>
<%@ Import Namespace="Kesion.Publics" %>
<asp:Content ID="Content1" ContentPlaceHolderID="KSContent" Runat="Server">
<div id="manage_top" class="menu_top_fixed">&nbsp;<strong>发退货查询处理：</strong>
 &nbsp;&nbsp;<strong>搜索=></strong>
    <asp:DropDownList ID="DrpSearchType" runat="server">
     <asp:ListItem Value="1">客户姓名</asp:ListItem>
     <asp:ListItem Value="2">用户名称</asp:ListItem>
     <asp:ListItem Value="3">订单号</asp:ListItem>
     <asp:ListItem Value="4">快递单号</asp:ListItem>
     <asp:ListItem Value="5">经手人</asp:ListItem>
    </asp:DropDownList>
    <asp:TextBox ID="TxtKey"  CssClass="textbox" runat="server" Width="100px"></asp:TextBox> 
<asp:Button ID="Button1"
        runat="server" Text=" 查 找 " CssClass="button" OnClick="Button1_Click" />
</div> 
<div class="menu_top_fixed_height"></div>      

<div class="tabs_header">
    <ul class="tabs">
    <li<%=KSCMS.S("logtype")==""?" class='active'":string.Empty %>><a href="KS.ShopLogDelivery.aspx"><span>所有记录</span></a></li>
    <li<%=KSCMS.S("logtype")=="5"?" class='active'":string.Empty %>><a href="KS.ShopLogDelivery.aspx?logType=5"><span style='color:Red;font-weight:bold'>未处理</span></a></li>
    <li<%=KSCMS.S("logtype")=="1"?" class='active'":string.Empty %>><a href="KS.ShopLogDelivery.aspx?logType=1"><span>发货记录</span></a></li>
    <li<%=KSCMS.S("logtype")=="2"?" class='active'":string.Empty %>><a href="KS.ShopLogDelivery.aspx?logType=2"><span>退货记录</span></a></li>
    <li<%=KSCMS.S("logtype")=="3"?" class='active'":string.Empty %>><a href="KS.ShopLogDelivery.aspx?logType=3"><span>10天内新记录</span></a></li>
    <li<%=KSCMS.S("logtype")=="4"?" class='active'":string.Empty %>><a href="KS.ShopLogDelivery.aspx?logType=4"><span>一个月内新记录</span></a></li>
    </ul>
</div>

   <asp:Panel ID="ListPannel" runat="server">
        <KS:KSGV ID="LogDeliveryView" cssclass="CTable" runat="server" AutoGenerateColumns="False" 
            DataKeyNames="FieldID" GridLines="None"
            OnRowDataBound="FieldListView_RowDataBound" Width="99%" 
            EnableTheming="True" EmptyDataText="没有找到任何发退货记录!" 
            onrowcommand="LogDeliveryView_RowCommand">
            <Columns>
                 <asp:TemplateField HeaderText="订单号">
                  <itemstyle horizontalalign="Center" width="100px" />
                <ItemTemplate>
                  <a href='KS.ShopOrder.aspx?action=orderdetail&orderid=<%# Eval("OrderId").ToString() %>'><%# Eval("OrderId").ToString() %></a>
                </ItemTemplate>  
                </asp:TemplateField>
                <asp:BoundField DataField="DeliverType" HeaderText="方向">
                  <itemstyle horizontalalign="Center" width="50px" />
                </asp:BoundField>
                
                <asp:BoundField DataField="DeliverDate" HeaderText="时间">
                <itemstyle horizontalalign="Center" width="100px" />
                </asp:BoundField>
                <asp:BoundField DataField="UserName" HeaderText="用户名">
                <itemstyle horizontalalign="Center" width="50px" />
                </asp:BoundField>
                <asp:BoundField DataField="ClientName" HeaderText="客户名称">
                <itemstyle width="80px" horizontalalign="Center" />
                </asp:BoundField>
                
                
                <asp:BoundField DataField="CorpName" HeaderText="物流公司">
                  <itemstyle horizontalalign="Center" width="80px" />
                </asp:BoundField>
                <asp:BoundField DataField="ExpressNumber" HeaderText="快递单号">
                  <itemstyle horizontalalign="Center" width="100px" />
                </asp:BoundField>
                <asp:BoundField DataField="HandlerName" HeaderText="经手人">
                  <itemstyle horizontalalign="Center" width="70px" />
                </asp:BoundField>
                
                <asp:TemplateField HeaderText="状态">
                <itemstyle horizontalalign="Center" />
             <itemtemplate>
                <%# Convert.ToString(Eval("status"))=="1"?"<span style='color:green'>已处理</span>":"<span style='color:red'>未处理</span>" %>
               </itemtemplate>
            </asp:TemplateField>

                
                <asp:TemplateField HeaderText="↓操作">
                <itemstyle horizontalalign="Center" />
             <itemtemplate>
             <asp:LinkButton runat="server" id="showBtn" CssClass="showBtn" title="查看处理" commandargument=<%#Eval("id") %> commandname="show"></asp:LinkButton>
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
		showtips('<span class="state"><strong>说明：</strong><br /></span>为便于查看发退货记录,此记录不提供删除功能!');
		</script>
		</asp:Panel>
		
		<asp:Panel runat="server" ID="showPannel" Visible="false">
		
		 <table width="99%" align="center" border="0" cellpadding="1" cellspacing="1" class="CTable"> 
		    <tr>
                 <td align="right" class="lefttd" style="width: 109px; height: 30px"><strong>订单号：</strong></td>
                 <td class="righttd" style="height: 30px;"><%=dr["orderid"].ToString() %>
                 </td>
             </tr>
		    <tr>
                 <td align="right" class="lefttd" style="width: 109px; height: 30px"><strong>客户姓名：</strong></td>
                 <td class="righttd" style="height: 30px;"><%=dr["ClientName"].ToString()%> (<%=dr["UserName"].ToString() %>)
                 </td>
             </tr>
		    <tr>
                 <td align="right" class="lefttd" style="width: 109px; height: 30px"><strong>时间：</strong></td>
                 <td class="righttd" style="height: 30px;"><%=dr["DeliverDate"].ToString()%>
                 </td>
             </tr>
		    <tr>
                 <td align="right" class="lefttd" style="width: 109px; height: 30px"><strong>方向：</strong></td>
                 <td class="righttd" style="height: 30px;">
                 <%
                     if (dr["DeliverType"].ToString() == "1")
                     {
                         Response.Write("<span style='color:Green'>发货</span>");
                     }
                     else if (dr["DeliverType"].ToString() == "3")
                     {
                         Response.Write("<span style='color:Purple'>客户申请退货退款</span>");
                     }
                     else
                     {
                         Response.Write("<span style='color:blue'>退货退款</span>");
                     }
                  %>
                 </td>
             </tr>
              <% if (dr["DeliverType"].ToString() == "1"){ %>
		    <tr>
                 <td align="right" class="lefttd" style="width: 109px; height: 30px"><strong>物流公司：</strong></td>
                 <td class="righttd" style="height: 30px;"><%=dr["corpname"].ToString()%>
                 </td>
             </tr>
		    <tr>
                 <td align="right" class="lefttd" style="width: 109px; height: 30px"><strong>快递单号：</strong></td>
                 <td class="righttd" style="height: 30px;"><%=dr["ExpressNumber"].ToString()%>
                 </td>
             </tr>
		    <tr>
                 <td align="right" class="lefttd" style="width: 109px; height: 30px"><strong>经手人：</strong></td>
                 <td class="righttd" style="height: 30px;"><%=dr["HandlerName"].ToString()%>
                 </td>
             </tr>
		    <tr>
                 <td align="right" class="lefttd" style="width: 109px; height: 30px"><strong>备注：</strong></td>
                 <td class="righttd" style="height: 30px;"><%=dr["remark"].ToString()%>
                 </td>
             </tr>
		    <tr>
                 <td align="right" class="lefttd" style="width: 109px; height: 30px"></td>
                 <td class="righttd" style="height: 30px;">
                 <input type="button" class="button" value="返回" onclick="history.back()"/>
                 <input type="button" class="button" onclick="window.print()" value="打印" />
                 </td>
             </tr>
             <%} else{ %>
            <tr>
                 <td align="right" class="lefttd" style="width: 109px; height: 30px"><strong>申请退货退款原因：</strong></td>
                 <td class="righttd" style="height: 30px;"><%=dr["remark"].ToString()%>
                 </td>
             </tr>

		    <tr>
                 <td align="right" class="lefttd" style="width: 109px; height: 30px"><strong>资金退回方式：</strong></td>
                 <td class="righttd" style="height: 30px;">
                 <% if (dr["MoneyReturnType"].ToString() == "1")
                    {
                        Response.Write("扣除的金额退回会员预付款中");
                    }
                    else if (dr["MoneyReturnType"].ToString() == "2")
                    {
                        Response.Write("扣除的金额退回到客户的银行帐号");
                    }
                    else
                    {
                        Response.Write("未付款");   
                    }
                 %>
                 </td>
             </tr>
             <%if (dr["MoneyReturnType"].ToString() == "2")
               { %>
               <tr>
                 <td align="right" class="lefttd" style="width: 109px; height: 30px"><strong>银行名称：</strong></td>
                 <td class="righttd" style="height: 30px;"><%=dr["MoneyReturnBankName"].ToString()%>
                 </td>
             </tr>
               <tr>
                 <td align="right" class="lefttd" style="width: 109px; height: 30px"><strong>银行卡号：</strong></td>
                 <td class="righttd" style="height: 30px;"><%=dr["MoneyReturnBankCard"].ToString()%>
                 </td>
             </tr>
               <tr>
                 <td align="right" class="lefttd" style="width: 109px; height: 30px"><strong>银行户名：</strong></td>
                 <td class="righttd" style="height: 30px;"><%=dr["MoneyReturnCardName"].ToString()%>
                 </td>
             </tr>
             <%} %>
             
             <tr>
                 <td align="right" class="lefttd" style="width: 109px; height: 30px"><strong>是否处理：</strong></td>
                 <td class="righttd" style="height: 30px;">
                 <% if (dr["status"].ToString() == "1")
                    {
                        Response.Write("<font color=green>已处理</font>");
                    }
                    else
                    {
                        Response.Write("<font color=red>未处理</font>");
                    }
                 %>
                 </td>
             </tr>
               <% if (dr["status"].ToString() == "1")
                  {%>
                 <tr>
                     <td align="right" class="lefttd" style="width: 109px; height: 30px"><strong>处理人：</strong></td>
                     <td class="righttd" style="height: 30px;">
                     <%=dr["HandlerName"].ToString() %>
                     </td>
                 </tr>
                 <tr>
                     <td align="right" class="lefttd" style="width: 109px; height: 30px"><strong>处理时间：</strong></td>
                     <td class="righttd" style="height: 30px;">
                     <%=dr["HandlerDate"].ToString()%>
                     </td>
                 </tr>
             <tr>
                 <td align="right" class="lefttd" style="width: 109px; height: 30px"><strong>处理结果：</strong></td>
                 <td class="righttd" style="height: 30px;">
                 <% if (dr["HandlerStatus"].ToString() == "1")
                    {
                        Response.Write("<font color=green>同意退款退货</font>");
                    }
                    else
                    {
                        Response.Write("<font color=blue>妥协交易</font>");
                    }
                 %>
                 </td>
             </tr>
                 <tr>
                     <td align="right" class="lefttd" style="width: 109px; height: 30px"></td>
                     <td class="righttd" style="height: 30px;">
                     <input type="button" class="button" value="返回" onclick="history.back()"/>
                     <input type="button" class="button" onclick="window.print()" value="打印" />
                     </td>
                 </tr>
               <%}else{
                       %>
                 <tr>
                     <td align="right" class="lefttd" style="width: 109px; height: 30px"></td>
                     <td class="righttd" style="height: 30px;">
                     <script type="text/javascript">
                    function returns() {
                        parent.openWin("处理退货退款信息", "Shop/KS.ShopOrder.aspx?action=returns&id=<%=Id %>", true, 800, 490);
                    }       
                    </script>
                     <input type="button" class="button" value="同意退货退款" onclick="returns()"/>
		             <input type='button' class='button' name='Submit'  value='已和客户妥协订单恢复正常' onclick=KesionJS.Confirm("确定将本订单恢复正常状态吗？","location.href='KS.ShopOrder.aspx?from=delivery&Action=BankRefundOK&ID=<%=Id%>';","")>
                     </td>
                 </tr>
               <%} %>
             <%} %>
		 </table>

            <%if (dr["DeliverType"].ToString() == "1"){ %>
               <div style="margin:10px">
               <strong>快递查询: </strong><br />
              <%
                  string detail = Kesion.APPCode.ExpressAPI.GetLogByOrderID(dr["orderid"].ToString());
                  Response.Write(detail);
                 %>
              </div>
            <%} %>
		</asp:Panel>


  </asp:Content>