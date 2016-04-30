<%@ Page Title="" Language="C#" MasterPageFile="~/User/CssFrame.master" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.User_ShowBox" Codebehind="ShowBox.aspx.cs" %>
<%@ Import Namespace="Kesion.Publics" %>
<%@ Import Namespace="Kesion.BLL" %>
<%@ Import Namespace="System.Data" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    <%
     string action = KSCMS.S("action");
     switch (action)
     {
         case "collectbox":  
 %>


<div style='padding:3px'>带http://开头的远程图片地址,每行一张图片地址:<br/>
<textarea id='collecthttp' style='width:95%;height:150px' class='textbox'></textarea>
</div>
 <%
     break;
         case "selecttp":
            %>
            <br />
            <div style='padding:3px'><strong>小图地址:</strong><input type='text' size='30' class='textbox' name='x1' id='x1'> <input type='button' onclick="OpenThenSetValue('Include/SelectFile.aspx?ChannelID=<%=Utils.StrToInt(KSCMS.S("channelID"),0) %>',550,290,window,jQuery('#x1')[0]);" value='选择小图' class='button'/>
            <br/><strong>大图地址:</strong><input type='text' class='textbox'  size='30' name='x2' id='x2'> <input type='button' onclick="OpenThenSetValue('Include/SelectFile.aspx?ChannelID=<%=Utils.StrToInt(KSCMS.S("channelID"),0) %>',550,290,window,jQuery('#x2')[0]);" value='选择大图' class='button'/>
            <br/><strong>简要介绍:</strong><input type='text' class='textbox'  size='30' name='x3' id='x3'></div>
            <%break;
              case "order":
             %>
                 <div style="padding:2px;font-size:14px;line-height:25px;">
               <%
               
                        int statusCode = Utils.StrToInt(KSCMS.S("statuscode"));
                        StringBuilder dsb = new StringBuilder();

                        switch (statusCode)
                        {
                            case 3: //发货信息
                                if (dr["DeliverStatus"].ToString().Equals("1"))
                                {
                                    dsb.Append(@"<br/><img src=""../../admin/images/dot.gif"" /><strong><font color=""#ff6600"">该订单已发货，发货信息如下：</font></strong><br/>");
                                    using (DataTable ddt = DataFactory.GetDataTable("Select Top 1 a.HandlerName,a.DeliverDate,ExpressNumber,b.CorpName From KS_ProLogDeliver A inner Join KS_ProDeliveryCorp b ON A.ExpressCorpId=B.CorpId Where a.DeliverType=1 And A.OrderID='" + dr["OrderID"].ToString() + "'"))
                                    {
                                        if (ddt.Rows.Count > 0)
                                        {
                                            DataRow dddr = ddt.Rows[0];
                                            dsb.Append(@"发货日期：" + dddr["DeliverDate"].ToString() + "，物流公司：" + dddr["CorpName"].ToString() + @"，物流单号：<span style=""color:red"">" + dddr["ExpressNumber"].ToString() + "</span>，经手人：" + dddr["HandlerName"].ToString());
                                        }

                                    }
                                   
                                    KSCMS.W(dsb.ToString());
                                    
                                     %>
                                   <style>
                                       .last {
                                           font-weight:bold;
                                       }
                                   </style>
                                   <div>
                                   <strong>快递查询: </strong><br />
                                  <%
                                      string detail = Kesion.APPCode.ExpressAPI.GetLogByOrderID(dr["orderid"].ToString());
                                      Response.Write(detail);
                                     %>
                                  </div>
                                    <%
                                    
                                }
                                break;
                            case 4: //团购凭单消费记录
                                
                                if (Utils.StrToInt(dr["OrderType"].ToString())==1 && dr["ConsumptionMode"].ToString().Equals("0") )
                                {
                                   %> <asp:Repeater ID="Repeater1" runat="server" >
                                          <HeaderTemplate>
                                            <table class="border" cellSpacing=1 cellPadding=2 width="99%" align="center" border=0>
                                                <tr align="center" class="title">
        	                                    <td align="center">消费时间</td>
                                               <td  align="center">订单号</td>
        	                                    <td  align="center">手机号</td>
        	                                    <td align="center">录入</td>
                                                <td align="center" width="110">消费次数</td>
	                                            <td align="center">备注</td>
                                              </tr>

                                          </HeaderTemplate>
                                           <ItemTemplate>
                                           <tr class="tdbg">
                                              <td class="splittd" align="center"><%# Eval("Adddate") %> </td>
                                              <td class="splittd" align="center"><%# Eval("orderid") %></td>
                                              <td class="splittd">
                                              <%# Eval("mobile") %>
                                              </td>
                                              <td class="splittd" align="center"><%# Eval("username") %></td>
                                              <td class="splittd" align="center"><%# Eval("times") %>次
                                              </td>
             
                                              <td class="splittd" style="width:180px;word-break:break-all">
                                              <%# Eval("Remark") %>
                                              </td>
                                           </tr>     
                                           </ItemTemplate>

                                         <FooterTemplate>
                                             <tr class="tdbg" style="display:<%# bool.Parse((Repeater1.Items.Count==0).ToString())?"":"none"%>">
                                                <td class="splittd" style="text-align:center" colspan="7">
                                                  还没有消费明细记录!
                                                </td>
                                               </tr> 
                                            </table>
                                        </FooterTemplate>
                                    </asp:Repeater>
                     <%
                                    
                                }
                                break;
                            case 6:  //发票信息
                                if (dr["Invoiced"].ToString().Equals("1"))
                                {
                                    dsb.Append(@"<br/><div style=""margin:30px""><img src=""../../admin/images/dot.gif"" /><strong><font color=""#ff6600"">该订单发票已开出，发票信息如下：</font></strong><br/>");
                                    using (DataTable ddt = DataFactory.GetDataTable("Select Top 1 HandlerName,InvoiceType,InvoiceNum,InvoiceTitle,InvoiceContent,InvoiceDate,MoneyTotal From KS_ProLogInvoice Where OrderID='" + dr["OrderID"].ToString() + "'"))
                                    {
                                        if (ddt.Rows.Count > 0)
                                        {
                                            DataRow dddr = ddt.Rows[0];
                                            dsb.Append(@"开票日期：" + dddr["InvoiceDate"].ToString() + "，发票类型：" + dddr["InvoiceType"].ToString() + "，发票抬头：" + dddr["InvoiceTitle"].ToString() + @"，发票内容：" + dddr["InvoiceContent"].ToString() + ",开票金额：" + Utils.StrToFloat(dddr["MoneyTotal"].ToString()).ToString("F2") + @" 元，发票号码：<span style=""color:red"">" + dddr["InvoiceNum"].ToString() + "</span>，经手人：" + dddr["HandlerName"].ToString());
                                        }

                                    }
                                    dsb.AppendLine("</div>");
                                    KSCMS.W(dsb.ToString());
                                }
                   
                                break;
                        }
                  
              break;
            %></div>
<%
     } %>
</asp:Content>
