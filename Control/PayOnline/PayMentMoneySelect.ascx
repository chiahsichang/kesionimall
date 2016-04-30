<%@ Control Language="C#" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.PayOnline.PayMentMoneySelect" Codebehind="PayMentMoneySelect.ascx.cs" %>
<%@ Import Namespace="Kesion.Cache" %>
<%@ Import Namespace="Kesion.BLL" %>
<%@ Import Namespace="System.Data" %>
<table cellspacing="1" cellpadding="3" class="border" width="98%" align="center" border="0">
	 <tr class="title">
          <td colspan="2"> 确认及选择支付接口</td>
     </tr>

     <tr class="tdbg">
         <td class="splittd lefttd" style="height: 25px">用 户 名： </td>
         <td class="splittd">
          <asp:Label ID="LabUserName2" runat="server" Text=""></asp:Label>
         </td>
     </tr>
     <tr class="tdbg">
         <td class="splittd lefttd" style="height: 25px">充值编号： </td>
         <td class="splittd">
          <asp:Label ID="LabOrderID" runat="server" Text="0"></asp:Label>
         </td>
     </tr>
     <tr class="tdbg">
         <td class="splittd lefttd" style="height: 25px">充值金额：</td>
         <td class="splittd">
        <%=MyCache.GetCurrencySymbol %>
          <asp:Label ID="LabPoint2" runat="server" Text="0"></asp:Label>
          <%=MyCache.GetCurrencyUnit %>
         </td>
     </tr>
     <tr class="tdbg">
         <td class="splittd lefttd">选择支付平台：</td>
         <td  class="splittd">
            
             <div class="paylist">
                 <ul>
             <%
                 string payId = "0";
                 StringBuilder sb = new StringBuilder();
                 using (DataTable dt = CommonData.GetDataTable(4))
                 {
                     if (dt.Rows.Count > 0)
                     {
                         foreach (DataRow dr in dt.Rows)
                         {
                             if (dr["isdefault"].ToString() == "1")
                             {
                                 payId = dr["id"].ToString();
                             }
                             sb.AppendLine(string.Format(@"<li{2} payid=""{3}""><img src=""{0}"" title=""{1}"" alt=""{1}""/></li>",dr["logo"].ToString(),dr["platname"].ToString(),dr["isdefault"].ToString()=="1"?@" style=""border:1px solid red""":string.Empty,dr["id"].ToString()));
                         }
                     }
                 }
                 Response.Write(sb.ToString());
              %>
                 </ul>
             </div>
         </td>
     </tr>
     
     <tr class="tdbg">
         <td colspan="2" style="height:60px;padding-left:120px;">
               <script>
                   var pid=<%=payId%>;
                   $(document).ready(function(){
                       $(".paylist").find("li").click(function(){
                           pid=$(this).attr("payid");
                           $(".paylist").find("li").attr("style","");
                           $(this).attr("style","border:1px solid red");
                       });
                   });

                   function doPay() {
                       window.open('../user/PayConfirm.aspx?OrderID=<%=this.LabOrderID.Text%>&PlatID=' + pid + '&Money=<%=this.LabPoint2.Text%>');
                   }
               </script>
             <input type="button" class="button" value="下 一 步" onclick="doPay()" />
             <input type="button" class="button" value="上 一 步" onclick="javascript:history.back(-1);" />
             </td>
     </tr>
    </table>