<%@ Control Language="C#" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.Shop.UserOrderExpressLogControl" Codebehind="UserOrderExpressLogControl.ascx.cs" %>
<%@ Import Namespace="Kesion.Cache"%>
<%@ Import Namespace="Kesion.Publics"%>
<%@ Import Namespace="Kesion.APPCode"%>


<table border="0" cellpadding="2" cellspacing="1" class="border" width="98%" align="center">
    <tr class="title1">
        <td>
          跟踪物流 订单号：<%=dr["orderid"].ToString() %>
           
        </td>
    </tr>
    
   
    <tr>
     <td class="splittd" style="padding-top:6px;">
       <%=Kesion.APPCode.ExpressAPI.GetLogByOrderID(dr["orderid"].ToString()) %>

     </td>
    
    </tr>
    

</table>

<div style="text-align:center;margin:20px;">
    <input type="button" class="button" id="backBtn" value="返回订单管理" onclick="history.back(-1);" />
</div>



