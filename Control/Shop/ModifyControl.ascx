<%@ Control Language="C#" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.Shop.OrderModifyControl" Codebehind="ModifyControl.ascx.cs" %>
<%@ Import Namespace="Kesion.Cache"%>
<%@ Import Namespace="Kesion.Publics"%>
<%@ Import Namespace="Kesion.APPCode"%>

 <KS:TopNav ID="TopNav1" runat="server" Text="修改订单信息" />
    <script type="text/javascript">

	 function loadCity(){
	   var pid=jQuery("#provinceid >option:selected").val();
	   if (pid!=''){
	     jQuery.get("../../plus/ajaxs.ashx", { a: "loadcityoption", pid:pid},
			 function(data){
					if (data!=null&&data!=''){
					  jQuery("#showcity").show();
					  jQuery("#cityid").empty();
					  jQuery("#cityid").append("<option value=''>请选择...</option>");
					  jQuery("#cityid").append(data);
					}else{
					  jQuery("#showcity").hide();
					  jQuery("#cityid").empty();
					  jQuery("#cityid").append("<option value=''>请选择...</option>");
					}
					jQuery("#showcounty").hide();
					jQuery("#countyid").empty();
					jQuery("#countyid").append("<option value=''>请选择...</option>");
			  });
	  }
	  jQuery("#showselectarea").html(jQuery("#provinceid option:selected").get(0).text);
	 }
	 function loadCounty(){
	   var cid=jQuery("#cityid  option:selected").val();
	   if (cid!=''){
	     jQuery.get("../../plus/ajaxs.ashx", { a: "loadcountyoption", cid:cid},
			 function(data){
					if (data!=null&&data!=''){
					jQuery("#showcounty").show();
					jQuery("#countyid").empty();
					jQuery("#countyid").append("<option value=''>请选择...</option>");
					jQuery("#countyid").append(data);
					}else{
					jQuery("#showcounty").hide();
					jQuery("#countyid").empty();
					jQuery("#countyid").append("<option value=''>请选择...</option>");
					}
			  });
		}
	  	var str=jQuery("#provinceid option:selected").get(0).text;
	   try{
	   if (jQuery("#cityid option:selected").val()!='') str+=jQuery("#cityid>option:selected").get(0).text;
	   }catch(e){
	   }
	   jQuery("#showselectarea").html(str);

	 }
	 function loadSelect(){
	   var str=jQuery("#provinceid option:selected").get(0).text;
	   try{
	   if (jQuery("#cityid option:selected").val()!='') str+=jQuery("#cityid option:selected").get(0).text;
	   if (jQuery("#countyid option:selected").val()!='') str+=jQuery("#countyid option:selected").get(0).text;
	   }catch(e){
	   }
	   jQuery("#showselectarea").html(str);
	 }
   jQuery(document).ready(function(){
     showSpecified();
     showInvoice();
     jQuery("#<%=this.DrpDeliveryDate.ClientID %>").bind("change",function(){
     showSpecified();
     });
   });
   function showSpecified(){
     if (jQuery("#<%=this.DrpDeliveryDate.ClientID %> option:selected").val()=='0'){
      jQuery("#showSpecifiedDate").show();
     }else{
      jQuery("#showSpecifiedDate").hide();
     }
   }
   function showInvoice() {
       var checkrad = jQuery("#<%=this.RdbIsInvoice.ClientID %> :radio[checked]").val();
       if (parseInt(checkrad) == 1) {
      jQuery("#showInvoice").show();
     }else{
      jQuery("#showInvoice").hide();
     }
   }
    </script>
    <style>
.border .wait,.border .wff,.border .wfk{color:red;}
.border .yff,.border .yfq,.border .yqs,.border .confirm,.border .yxf{color:green;}
.border .wx{color:#999;}
.border .jq{color:#888;}
.border .ddff{color:brown;}
.border .list_link{line-height:22px;border-left:1px solid #efefef;padding:5px;}
.border .img img{border:1px solid #ccc;padding:1px;}
</style>

<table border="0" cellpadding="2" cellspacing="1" class="CTable" width="99%">
   <tr align="center" class="CTitle">
        <td  style="text-align:left;">
            <b>送货信息</b>（订单编号：<asp:Label ID="LabOrderID" runat="server" Text="Label"></asp:Label>
            &nbsp;&nbsp;用 户 名：<font color='red'><asp:Label ID="LabUserName" runat="server" Text="Label"></asp:Label></font> (游客：<asp:Label ID="LabIsAnonymous" runat="server" Text="Label"></asp:Label>
            ) &nbsp; 下单时间：<asp:Label ID="LabInputTime" runat="server" Text="Label"></asp:Label>
            &nbsp;&nbsp;订单状态：<%=Kesion.APPCode.OrderProcess.GetOrderStatus(false,Utils.StrToInt(dr["orderType"].ToString()), dr["OrderID"].ToString(), Utils.StrToInt(dr["ConsumptionMode"].ToString()), Utils.StrToInt(dr["IsBusinessConfirm"].ToString()), dr["alipaytradestatus"].ToString(), Utils.StrToInt(dr["status"].ToString()), Utils.StrToInt(dr["DeliverStatus"].ToString()), Utils.StrToDecimal(dr["MoneyReceipt"].ToString()), Utils.StrToDecimal(dr["OrderTotalPrice"].ToString())) %>
    
            ）
        </td>
    </tr>
   
    <tr>
     <td>
   <asp:Panel ID="Address1" runat="server">
     <table cellSpacing=1 cellPadding=2 width="100%" align=center border=0>
    <tr class=tdbg>
      <td align=right width="12%">联系电话：</td>
      <td width="38%" style="text-align: left">
          &nbsp;<asp:TextBox  CssClass="textbox" ID="TxtMobile1" runat="server"></asp:TextBox></td>
      <td align=right width="12%">订单附言：</td>
      <td width="38%" style="text-align: left">
          &nbsp;<asp:TextBox  CssClass="textbox" ID="TxtRemark1" runat="server"></asp:TextBox></td>
    </tr>
         </table>
   </asp:Panel>
     
 <asp:Panel ID="Address2" runat="server">
     <table cellSpacing=1 cellPadding=2 width="100%" align=center border=0>
    <tr class=tdbg>
      <td align=right width="12%">收货人姓名：</td>
      <td width="38%" style="text-align: left">
          &nbsp;<asp:TextBox  CssClass="textbox" ID="TxtContactMan" runat="server"></asp:TextBox></td>
      <td align=right width="12%">联系电话：</td>
      <td width="38%" style="text-align: left">
          &nbsp;<asp:TextBox  CssClass="textbox" ID="TxtTel" runat="server"></asp:TextBox></td>
    </tr>
    <tr class=tdbg vAlign=top>
      <td align=right width="12%" rowspan="2">收货人地址：</td>
      <td width="38%" style="text-align: left" rowspan="2">
          &nbsp;<asp:Label ID="LabProvince" runat="server"></asp:Label>
          <asp:Label ID="LabCity" runat="server"></asp:Label>
           <asp:Label ID="LabCounty" runat="server"></asp:Label>
           <br />
          <span id="showselectarea"><%=addStr %></span>
          <asp:TextBox ID="TxtAddress"  CssClass="textbox" runat="server"></asp:TextBox></td>
      <td align=right width="12%">邮政编码：</td>
      <td width="38%" style="text-align: left">
          &nbsp;<asp:TextBox ID="TxtZipCode"  CssClass="textbox" runat="server"></asp:TextBox></td>
    </tr>
         <tr class="tdbg" valign="top">
             <td align="right" width="12%">
                 收货人邮箱：</td>
             <td style="text-align: left" width="38%">
                 &nbsp;<asp:TextBox  CssClass="textbox" ID="TxtEmail" runat="server"></asp:TextBox></td>
         </tr>
    <tr class=tdbg>
      <td align=right width="12%">收货人手机：</td>
      <td width="38%" style="text-align: left">
          &nbsp;<asp:TextBox  CssClass="textbox" ID="TxtMobile" runat="server"></asp:TextBox></td>
      <td align=right width="12%"></td>
      <td width="38%" style="text-align: left">
          &nbsp;</td>
    </tr>
    <tr class=tdbg>
      <td align=right width="12%">付款方式：</td>
      <td width="38%" style="text-align: left">
          &nbsp;<asp:DropDownList ID="DrpPaymentType" runat="server">
          </asp:DropDownList></td>
      <td align=right width="12%">送货方式：</td>
      <td width="38%" style="text-align: left">
          &nbsp;<asp:DropDownList ID="DrpDeliveryType" runat="server">
          </asp:DropDownList></td>
    </tr>
    <tr class=tdbg vAlign=top>
      <td align=right width="12%" style="height: 56px">发票信息：</td>
      <td width="38%" style="height: 56px; text-align: left;">
          <asp:RadioButtonList ID="RdbIsInvoice" runat="server" onclick="showInvoice()" RepeatDirection="Horizontal">
              <asp:ListItem Value="1">需要</asp:ListItem>
              <asp:ListItem Value="0">不需要</asp:ListItem>
          </asp:RadioButtonList>
          <div id="showInvoice">
          <asp:TextBox  CssClass="textbox" ID="TxtInvoiceTitle" TextMode="MultiLine" Height="50" Width="300" runat="server"></asp:TextBox>
          </div>
      </td>
          <td align=right width="12%" style="height: 56px">
              订单附言：</td>
      <td width="38%" style="height: 56px; text-align: left">
          &nbsp;<asp:TextBox  CssClass="textbox" ID="TxtRemark" runat="server" Height="52px" TextMode="MultiLine"
              Width="257px"></asp:TextBox></td>
    </tr>
         <tr class="tdbg" valign="top">
             <td align="right" width="12%">
                 送货日期：</td>
             <td width="38%" style="text-align: left"><asp:DropDownList ID="DrpDeliveryDate" runat="server">
             <asp:ListItem Value="不限日期">不限日期</asp:ListItem>
             <asp:ListItem Value="仅周六">仅周六</asp:ListItem>
             <asp:ListItem Value="仅周日">仅周日</asp:ListItem>
             <asp:ListItem Value="0">指定具体时间</asp:ListItem>
             </asp:DropDownList>
             <div id="showSpecifiedDate">
               <asp:TextBox  CssClass="textbox" ID="TxtSpecifiedDate" runat="server"></asp:TextBox>
             </div></td>
             <td align="right" width="12%">
                 送货时间：</td>
             <td width="38%" style="text-align: left">
                 &nbsp;<asp:TextBox  CssClass="textbox" ID="TxtDeliveryTime" runat="server"></asp:TextBox></td>
         </tr>
  </table>
</asp:Panel>


    </td>
    
    </tr>
    
    <tr>
    <td>	
    
    
       <asp:GridView ID="GVGroupBuy" style="border-bottom:none" runat="server" AutoGenerateColumns="False" CssClass="CTable" EmptyDataText="没有数据!"  Width="99%" CellPadding="1" CellSpacing="1" GridLines="None" HorizontalAlign="Center">
         <Columns>
         
              <asp:TemplateField HeaderText="商品图片">
                <itemstyle horizontalalign="Center" />
                <itemtemplate>
                    <img src='<%# string.IsNullOrEmpty(Convert.ToString(Eval("photourl")))?MyCache.GetCacheShopConfig(9):Eval("PhotoUrl")  %>' width="60" height="45" style="border:1px solid #efefef;padding:1px" />
                </itemtemplate>
              </asp:TemplateField>
              <asp:TemplateField HeaderText="团购商品名称">
                <itemstyle horizontalalign="Left" />
                <itemtemplate>
                <asp:HiddenField ID="hidItemId" runat="server" Value='<%# Eval("ItemID") %>' />
                 <a href="../../shop/groupbuyshow.aspx?Id=<%# Eval("id") %>" target="_blank"><%# Eval("subject").ToString() %></a>
                </itemtemplate>
              </asp:TemplateField>

              <asp:TemplateField HeaderText="数量">
                <itemstyle horizontalalign="Center" width="50px"/>
                <itemtemplate>
                   <asp:TextBox  CssClass="textbox" ID="TxtNum" runat="server" Text='<%# Convert.ToString(Eval("Num")) %>' Width="30px" style="text-align:center"></asp:TextBox>
                </itemtemplate>
              </asp:TemplateField>
               <asp:TemplateField HeaderText="单件重量" Visible="false">
                <itemstyle width="55px" horizontalalign="Center" />
                <itemtemplate>
                   <%#  string.Format("{0:G2} 公斤", Convert.ToString(Eval("Weight")))%>
                </itemtemplate>
              </asp:TemplateField>
               <asp:TemplateField HeaderText="原价">
                <itemstyle horizontalalign="Center" width="50px"/>
                <itemtemplate>
               <%=MyCache.GetCurrencySymbol %><%# Public.ReturnShopPrice(Utils.StrToDecimal(Eval("Price_Market")))%>
                </itemtemplate>
              </asp:TemplateField> 
               <asp:TemplateField HeaderText="团购价">
                <itemstyle horizontalalign="Center" width="50px"/>
                <itemtemplate>
              <asp:TextBox  CssClass="textbox" ID="TxtRealPrice" runat="server" Text='<%# Public.ReturnShopPrice(Utils.StrToDecimal(Eval("Price"))) %>' style="text-align:center" Width="40px"></asp:TextBox>
                </itemtemplate>
              </asp:TemplateField> 
               <asp:TemplateField HeaderText="小计">
                <itemstyle horizontalalign="Center" width="60px"/>
                <itemtemplate>
              <%=MyCache.GetCurrencySymbol %><%# Public.ReturnShopPrice(Utils.StrToDecimal(Eval("TotalPrice")))%>
                </itemtemplate>
              </asp:TemplateField> 

              <asp:TemplateField HeaderText="备注">
                <itemstyle horizontalalign="Center" width="200px"/>
                <itemtemplate>
                   <asp:TextBox  CssClass="textbox" TextMode="MultiLine" Text='<%# Eval("Remark") %>' ID="TxtRemark" runat="server"></asp:TextBox>
                </itemtemplate>
              </asp:TemplateField>
         </Columns>
             <HeaderStyle CssClass="Title" Height="23px" />
             <RowStyle CssClass="tdbg" Height="22px" />
        </asp:GridView>
        
        
        	
        
         <asp:GridView ID="OrderItemList" OnRowCommand="OrderItemList_RowCommand" OnRowDataBound="OrderItemList_RowDataBound" style="border-bottom:none" runat="server" AutoGenerateColumns="False" CssClass="CTable" EmptyDataText="该订单中没有商品!"  Width="99%" CellPadding="1" CellSpacing="1" GridLines="None" HorizontalAlign="Center">
         <Columns>
         
              <asp:TemplateField HeaderText="商品图片">
                <itemstyle horizontalalign="Center" />
                <itemtemplate>
                    <img src='<%# string.IsNullOrEmpty(Convert.ToString(Eval("DefaultPic")))?MyCache.GetCacheShopConfig(9):Eval("DefaultPic")  %>' width="60" height="45" style="border:1px solid #efefef;padding:1px" />
                </itemtemplate>
              </asp:TemplateField>
              <asp:TemplateField HeaderText="商品名称">
                <itemstyle horizontalalign="Left" />
                <itemtemplate>
                   <asp:HiddenField ID="hidItemId" runat="server" Value='<%# Eval("ItemID") %>' />
                   <asp:HiddenField ID="hidScore" runat="server" Value='<%# Eval("Score") %>' />
                    <%# getProOrder(Utils.StrToInt(Convert.ToString(Eval("ClassID"))), Convert.ToString(Eval("FileName")), Convert.ToString(Eval("TurnUrl")), Convert.ToInt16(Eval("ItemID")), Utils.StrToInt(Convert.ToString(Eval("ChannelID"))), Utils.StrToInt(Convert.ToString(Eval("InfoID"))), string.IsNullOrEmpty(Convert.ToString(Eval("ITitle"))) ? Convert.ToString(Eval("Title")) : Convert.ToString(Eval("ITitle")), Convert.ToInt16(Eval("isBundleSale")), Convert.ToInt16(Eval("isChangeBuy")), Convert.ToInt16(Eval("isLimitBuy")),Convert.ToString(Eval("AttributeCart")), Utils.StrToInt(Convert.ToString(Eval("Attrid"))))%>
                </itemtemplate>
              </asp:TemplateField>
         

              <asp:TemplateField HeaderText="单位">
                <itemstyle width="40px" horizontalalign="Center" />
                <itemtemplate>
                   <%# Convert.ToInt16(Eval("isBundleSale"))==1?"--":Eval("Unit") %>
                </itemtemplate>
              </asp:TemplateField>

 
              <asp:TemplateField HeaderText="数量">
                <itemstyle horizontalalign="Center" width="50px"/>
                <itemtemplate>
                   <asp:TextBox  CssClass="textbox" ID="TxtNum" runat="server" Text='<%# Convert.ToString(Eval("Num")) %>' Width="30px" style="text-align:center"></asp:TextBox>
                </itemtemplate>
              </asp:TemplateField>
              
              
              <asp:TemplateField HeaderText="单件重量"  Visible="false">
                <itemstyle width="55px" horizontalalign="Center" />
                <itemtemplate>
                   <%# Convert.ToInt16(Eval("isBundleSale")) == 1 ? "--" : string.Format("{0:G2} 公斤", Convert.ToString(Eval("Weight")))%>
                </itemtemplate>
              </asp:TemplateField>
              <asp:TemplateField HeaderText="单件积分"  Visible="false">
                <itemstyle width="55px" horizontalalign="Center" />
                <itemtemplate>
                   <%# Convert.ToInt16(Eval("isBundleSale")) == 1 ? "--" : string.Format("{0:G2} 分", Convert.ToString(Eval("Weight")))%>
                </itemtemplate>
              </asp:TemplateField>
             
              <asp:TemplateField HeaderText="市场价">
                <itemstyle horizontalalign="Center" width="50px"/>
                <itemtemplate>
               <%=MyCache.GetCurrencySymbol %><%# Public.ReturnShopPrice(Utils.StrToDecimal(Eval("Price_Market")))%>
                </itemtemplate>
              </asp:TemplateField> 
              
              <asp:TemplateField HeaderText="实价">
                <itemstyle horizontalalign="Center" width="50px"/>
                <itemtemplate>
                   <asp:TextBox  CssClass="textbox" ID="TxtRealPrice" runat="server" Text='<%# Public.ReturnShopPrice(Utils.StrToDecimal(Eval("Price"))) %>' style="text-align:center" Width="40px"></asp:TextBox>
                </itemtemplate>
              </asp:TemplateField>
              
              <asp:TemplateField HeaderText="小计">
                <itemstyle horizontalalign="Center" width="70px"/>
                <itemtemplate>
              <%=MyCache.GetCurrencySymbol %><%# Public.ReturnShopPrice(Utils.StrToDecimal(Eval("TotalPrice")))%>
                </itemtemplate>
              </asp:TemplateField> 

              
              <asp:TemplateField HeaderText="备注">
                <itemstyle horizontalalign="Center" width="200px"/>
                <itemtemplate>
                   <asp:TextBox  CssClass="textbox" TextMode="MultiLine" Text='<%# Eval("Remark") %>' ID="TxtRemark" runat="server"></asp:TextBox>
                </itemtemplate>
              </asp:TemplateField>
              <asp:TemplateField HeaderText="操作">
                <itemstyle horizontalalign="Center" width="40px"/>
                <itemtemplate>
                    <asp:LinkButton ID="delBtn" runat="server" CommandName="del" CommandArgument='<%# Eval("ItemID") %>' Text="删除"></asp:LinkButton>
                </itemtemplate>
              </asp:TemplateField>
         </Columns>
             <HeaderStyle CssClass="Title" Height="23px" />
             <RowStyle CssClass="tdbg" Height="22px" />
        </asp:GridView>
        
        <table border="0" cellpadding="0" cellspacing="0" class="border" style="border-top:none" width="99%" align="center">
        <tr>
         <td height="40" style="padding:3px"class="tdbg">
         商品金额：<%=MyCache.GetCurrencySymbol %><asp:Label ID="LabGoodsMoney" runat="server" Text="Label"></asp:Label> <%=MyCache.GetCurrencyUnit %>
         支付方式可优惠：<span style="color:green"><%=MyCache.GetCurrencySymbol %><asp:TextBox  CssClass="textbox" ID="TxtPayDiscount" runat="server" Width="40px" style="text-align:center"></asp:TextBox></span> <%=MyCache.GetCurrencyUnit %> 
         运费：<%=MyCache.GetCurrencySymbol %><asp:TextBox   CssClass="textbox" ID="TxtFreight" runat="server" Width="40px" style="text-align:center"></asp:TextBox> <%=MyCache.GetCurrencyUnit %>
         可得积分： <asp:Label ID="LabScore" runat="server" ForeColor="red" Text=""></asp:Label> 分
         
         <br />
         订单金额：商品金额-支付方式优惠+运费+税金-优惠券金额＝<%=MyCache.GetCurrencySymbol %><asp:Label ID="LabNoUseCouponMoney" runat="server" Text="0"></asp:Label> <%=MyCache.GetCurrencyUnit %>
         </td>
         <td class="tdbg" width="300">
         订单金额：<span style="color:#555"><%=MyCache.GetCurrencySymbol %><asp:Label ID="LabNoUseCouponMoney1" runat="server" Text="Label"></asp:Label></span> <%=MyCache.GetCurrencyUnit %>
         已付款：<span style="color:Red"><%=MyCache.GetCurrencySymbol %><asp:Label ID="LabMoneyReceive" runat="server" Text="Label"></asp:Label></span> <%=MyCache.GetCurrencyUnit %>
         <br />
         应付金额：<%=MyCache.GetCurrencySymbol %><asp:TextBox  CssClass="textbox" ID="TxtTotalOrderMoney" runat="server" Width="40px" style="text-align:center"></asp:TextBox> <%=MyCache.GetCurrencyUnit %> 尚欠款：<span style="color:blue"><%=MyCache.GetCurrencySymbol %><asp:Label ID="LabNoPayMoney" runat="server" Text="Label"></asp:Label></span> <%=MyCache.GetCurrencyUnit %>
         </td>
        </tr>
        </table>
        <br />

         &nbsp;&nbsp;注:<font color=blue>“市场价”</font>指的是下单时的市场参考价格,<font color=red>“实价”</font>指的是系统自动计算出来的商品最终价格。“订单金额”指系统自动算出来的价格，本订单的最终价格以“应付金额”为准。
        <br />
   </td>
   </tr>
</table>
    <div style="margin:5px;text-align:center">
      <br />
         <asp:Button ID="Button1" runat="server" Text="确定修改" CssClass="button" OnClick="Button1_Click" />
        <%if (orderType != 1)
          { %>
         <input type="button" class="button" value="添加商品" class="button" onclick='parent.openWin("添加商品至订单","Shop/KS.ShopAddToOrder.aspx?action=addtoorder&id=<%=id %>",true,800,420);' />
         <%} %>
        <asp:Button ID="Button2" runat="server" Text="取消返回" CssClass="button" OnClick="Button2_Click"/>
        <br />
        <div style="text-align:left" class="message"> <span style="color:Red">Tips:管理员手工修改送货方式不改变订单运费,如需改变运费,请直接录入。</span></div>

      </div>     



<table width="100%" align="center" id="showDelviery" runat="server" visible="false">
<tr>
 <td>
  <script type="text/javascript">
		showtips(' <asp:Label ID="LabDeliveryInfo" runat="server"></asp:Label>');
		</script>
 </td>
</tr>
</table>