<%@ Control Language="C#" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.Shop.ExportExcelControl" Codebehind="ExportExcelControl.ascx.cs" %>
<%@ Import Namespace="Kesion.Cache"%>

<KS:TopNav ID="TopNav1" runat="server" Text="订单导出Excel" />
<table class="Border" cellSpacing=1 cellPadding=2 width="99%" align="center" border=0>
    <tr class="Title" align=middle>
      <td height=25><B>需要导出的字段</B></td>
      <td height=25><B>导出条件</B></td>
    </tr>
    <tr class=tdbg>
      <td style="text-align:center;width:350px;">
              <script>
                  function SelectAll(f) {
                      jQuery("#"+f+" option").each(function () {
                          jQuery(this).attr("selected", true);
                      });
                  }
                  function UnSelectAll(f) {
                      jQuery("#" + f + " option").each(function () {
                          jQuery(this).attr("selected", false);
                      });
                  }
    </script>
        <asp:ListBox ID="LstField" runat="server" SelectionMode="Multiple" Width="250px" Height="280px">
            <asp:ListItem Value="OrderID" Selected="True">订单编号</asp:ListItem>
            <asp:ListItem Value="UserName"  Selected="True">用户名</asp:ListItem>
            <asp:ListItem Value="OrderTotalPrice" Selected="True">订单总金额</asp:ListItem>
            <asp:ListItem Value="RealName" Selected="True">联系人</asp:ListItem>
            <asp:ListItem Value="Tel"  Selected="True">联系电话</asp:ListItem>
            <asp:ListItem Value="Mobile"  Selected="True">手机</asp:ListItem>
            <asp:ListItem Value="Address" Selected="True">送货地址</asp:ListItem>
            <asp:ListItem Value="ZipCode" Selected="True">邮政编码</asp:ListItem>
            <asp:ListItem Value="InputTime" Selected="True">订购时间</asp:ListItem>
            <asp:ListItem Value="ProductList" Selected="True" style="color:Red">商品名称及购买数量</asp:ListItem>
            <asp:ListItem Value="OrderStatus" Selected="True">订单状态</asp:ListItem>
            <asp:ListItem Value="MoneyReceipt">已付款金额</asp:ListItem>
            <asp:ListItem Value="SpecifiedDate">客户指定发货日期</asp:ListItem>
            <asp:ListItem Value="deliveryTime">客户指定的送货时间</asp:ListItem>
            <asp:ListItem Value="Email">Email</asp:ListItem>
            <asp:ListItem Value="Invoiced">发票信息</asp:ListItem>
            <asp:ListItem Value="Freight">运费</asp:ListItem>
            <asp:ListItem Value="Taxes">税金</asp:ListItem>
            <asp:ListItem Value="PayDiscountMoney">付款方式优惠</asp:ListItem>
            <asp:ListItem Value="deliveryDate">发货时间</asp:ListItem>
            <asp:ListItem Value="ChangeScore">兑换积分</asp:ListItem>
            <asp:ListItem Value="Remark">订单备注</asp:ListItem>
            <asp:ListItem Value="OrderType">订单类型</asp:ListItem>
            <asp:ListItem Value="ConsumptionMode">消费方式</asp:ListItem>
            <asp:ListItem Value="VerifyCode">消费验证码</asp:ListItem>
         </asp:ListBox>
          <br />
           <input onclick="SelectAll('<%=this.LstField.ClientID %>    ')" type="button" class="button" value="选定所有字段" name="Submit" /><br />
   <input onclick="UnSelectAll('<%=this.LstField.ClientID %>    ')" type="button" value="取消选定字段" class="button" name="Submit" />
          <div class="tips">TIPS：按Ctrl或是Shift可以多选。</div>
      </td>
      <td valign="top" style="line-height:26px;">
          <strong>订单类型：</strong>
          <asp:RadioButtonList ID="RdbOrderType" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow">
             <asp:ListItem Value="-1" Selected="True">不限</asp:ListItem>
             <asp:ListItem Value="1">团购订单</asp:ListItem>
             <asp:ListItem Value="2">商城订单</asp:ListItem>
              </asp:RadioButtonList>
          <br />
          <strong>消费模式：</strong>
          <asp:RadioButtonList ID="RdbConsumptionMode" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow">
             <asp:ListItem Value="-1" Selected="True">不限</asp:ListItem>
             <asp:ListItem Value="1">凭单消费</asp:ListItem>
             <asp:ListItem Value="2">需要邮寄</asp:ListItem>
              </asp:RadioButtonList>
          <br />
          <strong>日期范围：</strong>
        <input type="radio" name="limitDate" value="1" onclick="jQuery('#showdate').show();" checked="checked"/>限制
        <input type="radio" name="limitDate" value="0" onclick="jQuery('#showdate').hide();" />不限制

       <div id="showdate">
       <strong>定购日期：</strong>从<asp:TextBox onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'});" ID="TxtBeginDate" CssClass="textbox" runat="server"></asp:TextBox>至
       <asp:TextBox onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'});" ID="TxtEndDate" CssClass="textbox" runat="server" />
      </div>
         <strong>付款状态：</strong><asp:RadioButtonList ID="RdbPayFlag" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow">
             <asp:ListItem Value="0" Selected="True">不限</asp:ListItem>
             <asp:ListItem Value="1">仅导出已付款</asp:ListItem>
             <asp:ListItem Value="2">仅导出未付款</asp:ListItem>
              </asp:RadioButtonList>
          <br />
          <strong>限定条件：</strong>
     <asp:DropDownList ID="DrpExportTJ" runat="server">
                      <asp:ListItem Value="1">订单号</asp:ListItem>
                      <asp:ListItem Value="2">用户名</asp:ListItem>
                      <asp:ListItem Value="3">联系人</asp:ListItem>
                      <asp:ListItem Value="3">手机号</asp:ListItem>
                   </asp:DropDownList>
    <asp:TextBox  style="color:#ccc" Text="" CssClass="textbox" ID="TxtExportKey" runat="server"></asp:TextBox>
      
     <br />

      </td>
        
    </tr>


    <tr class=tdbg align=middle>
      <td colSpan=2 height=30>
      <asp:Button ID="BtnSave" runat="server" Text="确定导出" CssClass="button" OnClick="BtnSave_Click" />
 &nbsp;
        <Input class=button onclick="history.back();" type=button value=取消返回 name=Submit></td>
    </tr>
  </table>
