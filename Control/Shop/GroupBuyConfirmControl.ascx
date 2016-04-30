<%@ Control Language="C#" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.Shop.GroupBuyConfirmControl" Codebehind="GroupBuyConfirmControl.ascx.cs" %>
<%@ Import Namespace="Kesion.Cache"%>

<asp:Panel ID="Panel1" runat="server">
<table class="border" cellSpacing=1 cellPadding=2 width="99%" align="center" border=0>
    <tr class="Title" align=middle>
      <td colSpan=2 height=25><B>团购单消费确认</B></td>
    </tr>
    <tr class=tdbg>
      <td align=right width="15%"  height="30" class="lefttd">团购商品名称：</td>
      <td><asp:Label ID="LabTitle" runat="server"></asp:Label>
         <asp:HiddenField ID="HidInfo" Value="0" runat="server" />

      </td>
        
    </tr>
    <tr class=tdbg>
      <td align=right width="15%"  height="30" class="lefttd">订单号：</td>
      <td><%=dr["orderid"].ToString() %></td>
        
    </tr>
    <tr class=tdbg>
      <td align=right width="15%" height="30" class="lefttd">手机号码：</td>
      <td><%=dr["mobile"].ToString() %></td>
        
    </tr>
    <tr class=tdbg>
      <td align=right width="15%"  class="lefttd">验证码：</td>
      <td>
          <asp:TextBox ID="TxtVerifyCode" runat="server" CssClass="textbox" />
          <span class="tips">请输入消费者提供的验证码。</span>
      </td>
    </tr>
    <tr class=tdbg>
      <td align=right width="15%"  class="lefttd" height="30">消费：</td>
      <td>
         可用次数<span style="color:red"><asp:Label ID="LabTimes" runat="server">0</asp:Label></span>次
          
          本次消费
          <asp:DropDownList ID="DrpTimes" runat="server">
          </asp:DropDownList>
          次

      </td>
    </tr>
    <tr class=tdbg>
      <td align=right width="15%"  class="lefttd">备注：</td>
      <td>
          <asp:TextBox ID="TxtRemark" TextMode="MultiLine" Width="200px" Height="50px" Text="消费" runat="server" CssClass="textbox" />
      </td>
    </tr>

    <tr class=tdbg align=middle>
      <td colSpan=2 height=30>
      <asp:Button ID="BtnSave" runat="server" Text="确定消费" CssClass="button" OnClick="BtnSave_Click" />
 &nbsp;
        <Input class=button onclick="history.back();" type=button value=取消返回 name=Submit></td>
    </tr>
  </table>
</asp:Panel>


<asp:Panel ID="Panel2" runat="server">
    <div style="margin:15px"><B>订单[<span style="color:Red"><%=dr["orderid"].ToString() %></span>]的消费明细表</B>
        购买<span style="color:Red"><%=times %></span>次，已消费<span style="color:green"><%=hasTimes %></span>次。

    </div>
    <asp:Repeater ID="Repeater1" runat="server" >
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

    <div style="text-align:center;margin:20px;">
        <input type="button" class="button" value=" 返回 " onclick="location.href = 'MyGroupBuyOrder.aspx';" />

    </div>
</asp:Panel>