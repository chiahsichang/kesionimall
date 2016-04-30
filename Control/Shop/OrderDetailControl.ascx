<%@ Control Language="C#" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.Shop.OrderDetailControl" Codebehind="OrderDetailControl.ascx.cs" %>
<%@ Import Namespace="Kesion.Cache"%>
<%@ Import Namespace="Kesion.Publics"%>
<%@ Import Namespace="Kesion.APPCode"%>
<%@ Import Namespace="Kesion.BLL"%>
<KS:TopNav ID="TopNav1" runat="server" Text="�鿴������ϸ��Ϣ" />


<asp:PlaceHolder ID="PlaceHolder1" runat="server">
<style>
 .wait,.wff,.wfk,.wxf{color:red;}
 .yff,.yfq, .yqs, .confirm,.yxf{color:green;}
.wx{color:#999;}
.jq{color:#888;}
.ddff{color:brown;}
.list_link{line-height:22px;border-left:1px solid #efefef;padding:5px;}
.border .img img{border:1px solid #ccc;padding:1px;}
</style>
<div class="message"><strong>

    ������ţ�<asp:Label ID="LabOrderID" runat="server" Text="Label"></asp:Label>
            <%=dr["orderType"].ToString().Equals("1")?" <font color=red>�Ź�</font>":"" %>
           
           
    ����״̬��<%=Kesion.APPCode.OrderProcess.GetOrderStatus(false,Utils.StrToInt(dr["orderType"].ToString()), dr["OrderID"].ToString(), Utils.StrToInt(dr["ConsumptionMode"].ToString()), Utils.StrToInt(dr["IsBusinessConfirm"].ToString()), dr["alipaytradestatus"].ToString(), Utils.StrToInt(dr["status"].ToString()), Utils.StrToInt(dr["DeliverStatus"].ToString()), Utils.StrToDecimal(dr["MoneyReceipt"].ToString()), Utils.StrToDecimal(dr["OrderTotalPrice"].ToString())) %>
    
    
    <br />
<%if (MyCache.GetShopCommonConfig(41).Equals("1")){
  if (!string.IsNullOrEmpty(dr["business"].ToString())){ %>
  �����̼ң�<%=dr["business"].ToString() %>
      <br />�̼�ȷ�ϣ�<%=Utils.StrToInt(dr["IsBusinessConfirm"].ToString())>0?"<span style='color:green'>��ȷ������</span>":"<span style='color:red'>δȷ������</span>" %>
<%}
  }%>


    <%=Utils.StrToInt(dr["OrderType"].ToString())==0?"":Utils.StrToInt(dr["ConsumptionMode"].ToString())==1?" <span style='color:green'>����</span>":" <span style='color:blue'>ƾ��</span>" %>

      </strong>
  </div>


<table border="0" cellpadding="2" cellspacing="1"  width="99%" class="CTable">
   <tr align="center" class="CTitle">
        <td  style="text-align:left;">
            <b>�ͻ���Ϣ</b> (�����ˣ�<font color='red'><asp:Label ID="LabUserName" runat="server" Text="Label"></asp:Label></font> <asp:Label ID="LabIsAnonymous" runat="server" Text="Label"></asp:Label>
           &nbsp; ����ʱ�䣺<asp:Label ID="LabInputTime" runat="server" Text="Label"></asp:Label>)
        </td>
    </tr>

  
    <tr>
     <td height="35">
     
              <div style='padding-left:63px;<%=(dr["orderType"].ToString()=="1" && dr["ConsumptionMode"].ToString()=="1") ?"display:none":"" %>'>
         ��ϵ�ֻ���<%=dr["mobile"].ToString() %>
              <%if (!string.IsNullOrEmpty(dr["verifycode"].ToString())){ %>
              ���ֻ���֤�룺<%=dr["verifycode"].ToString() %>)
              <%} %>
      
        <%if (!string.IsNullOrEmpty(dr["remark"].ToString())){ %>
         <br />�������ԣ�<%=dr["remark"].ToString() %>
      <%} %>
        </div>

     
    
     
   <table cellspacing="1" cellpadding="2" width="100%" align=center border=0 <%=(dr["ConsumptionMode"].ToString()!="0") ?"":" style='display:none'" %>>
    <tr class=tdbg>
      <td align=right width="12%">�ջ���������</td>
      <td width="38%"><asp:Label ID="LabContactMan" runat="server" Text=""></asp:Label></td>
      <td align=right width="12%">��ϵ�绰��</td>
      <td width="38%">
          <asp:Label ID="LabMobile" runat="server" Text=""></asp:Label> <asp:Label ID="LabTel" runat="server" Text=""></asp:Label></td>
    </tr>
    <tr class=tdbg vAlign=top>
      <td align=right width="12%">�ջ��˵�ַ��</td>
      <td width="38%">
          <%=string.Concat(MyCache.GetAreaName(Convert.ToInt16(dr["provinceid"].ToString()), "city"), MyCache.GetAreaName(Convert.ToInt16(dr["cityid"].ToString()), "city"), MyCache.GetAreaName(Convert.ToInt16(dr["countyid"].ToString()), "city"), dr["address"].ToString()) %></td>
      <td align=right width="12%">�������룺</td>
      <td width="38%"><%=dr["zipCode"].ToString()%></td>
    </tr>
    <tr class=tdbg>
      <td align=right width="12%">�ջ������䣺</td>
      <td width="38%"><%=dr["Email"].ToString()%></td>
      <td align=right width="12%">�ͻ���ʽ��</td>
      <td width="38%">
          <asp:Label ID="LabDeliveyType" runat="server" Text=""></asp:Label>
          </td>
    </tr>
    <tr class=tdbg>
      <td align=right width="12%">���ʽ��</td>
      <td width="38%">
          <asp:Label ID="LabPayType" runat="server" Text=""></asp:Label></td>
      <td align=right width="12%">�ͻ�ʱ�䣺</td>
      <td width="38%"><%=dr["DeliveryTime"].ToString()%></td>
    </tr>
    <tr class=tdbg vAlign=top>
      <td align=right width="12%">�ͻ����ڣ�</td>
      <td width="38%"><%=dr["DeliveryDate"].ToString() == "0" ? dr["SpecifiedDate"].ToString() : dr["DeliveryDate"].ToString()%></td>
         <td align=right width="12%">
              �������ԣ�</td>
      <td width="38%"><%=dr["Remark"].ToString()%></td>
    </tr>
         </table>

     </td>
    
    </tr>
     <%if (dr["IsInvoice"].ToString() != "0")
           { %>
     <tr class="CTitle">
        <td style="text-align:left;"><b>��Ʊ��Ϣ</b> (<%=dr["Invoiced"].ToString()=="1"?"<font color=green>�ѿ�</font>":"<font color=red>δ��</font>" %>)</td>
    </tr>
    <tr>
        <td style="text-align:left;height:26px;padding:2px 0px 0px 20px;">
            <asp:Label ID="LabInvoice" runat="server" Text=""></asp:Label>
        </td>
    </tr>
    <%} %>
     <tr class="CTitle">
        <td style="text-align:left;"><b>��Ʒ�嵥</b></td>
    </tr>
    <tr>
    <td>	
    
       <asp:GridView ID="GVGroupBuy" style="border-bottom:none" runat="server" AutoGenerateColumns="False" CssClass="CTable" EmptyDataText="û������!"  Width="99%" CellPadding="1" CellSpacing="1" GridLines="None">
         <Columns>
         
              <asp:TemplateField HeaderText="��ƷͼƬ">
                <itemstyle horizontalalign="Center"/>
                <itemtemplate>
                    <img onerror="this.src='../../sysimg/nopic.gif'" src='<%# string.IsNullOrEmpty(Convert.ToString(Eval("photourl")))?MyCache.GetCacheShopConfig(9):Kesion.BLL.BaseFun.GetFullImageSrc(Convert.ToString(Eval("PhotoUrl")))  %>' width="40" height="40" style="border:1px solid #efefef;padding:1px" />
                </itemtemplate>
              </asp:TemplateField>
              <asp:TemplateField HeaderText="�Ź���Ʒ����">
                <itemstyle horizontalalign="Left" width="350px" />
                <itemtemplate>
                 <a href="<%# Kesion.HtmlTags.BasicField.GetGroupBuyUrl(Convert.ToInt32(Eval("id"))) %>" target="_blank"><%# Eval("subject").ToString() %></a>
                </itemtemplate>
              </asp:TemplateField>

               <asp:TemplateField HeaderText="����">
                <itemstyle horizontalalign="Center" />
                <itemtemplate>
                   <%# Eval("Num") %>
                </itemtemplate>
              </asp:TemplateField>
               <asp:TemplateField HeaderText="��������">
                <itemstyle horizontalalign="Center" />
                <itemtemplate>
                   <%#  string.Format("{0:G2} ����", Utils.StrToFloat(Eval("Weight")))%>
                </itemtemplate>
              </asp:TemplateField>

              <asp:TemplateField HeaderText="ԭ��">
                <itemstyle horizontalalign="Center"/>
                <itemtemplate>
               <%=MyCache.GetCurrencySymbol %><%# Public.ReturnShopPrice(Utils.StrToDecimal(Eval("Price_Market")))%>
                </itemtemplate>
              </asp:TemplateField> 

              <asp:TemplateField HeaderText="�Ź���">
                <itemstyle horizontalalign="Center"/>
                <itemtemplate>
                <%=MyCache.GetCurrencySymbol %><%# Public.ReturnShopPrice(Utils.StrToDecimal(Eval("Price")))%>
                </itemtemplate>
              </asp:TemplateField> 
              <asp:TemplateField HeaderText="С��">
                <itemstyle horizontalalign="Center"/>
                <itemtemplate>
                <%=MyCache.GetCurrencySymbol %><%# Public.ReturnShopPrice(Utils.StrToDecimal(Eval("TotalPrice")))%>
                </itemtemplate>
              </asp:TemplateField> 

                <asp:TemplateField HeaderText="��ע">
                <itemstyle horizontalalign="Center"/>
                <itemtemplate>
                    <%#Eval("remark") %>
                </itemtemplate>
              </asp:TemplateField>
         </Columns>
             <HeaderStyle CssClass="Title" Height="23px" />
             <RowStyle CssClass="tdbg" Height="22px" />
        </asp:GridView>
    	
        
         <asp:GridView ID="OrderItemList" style="border-bottom:none" runat="server" AutoGenerateColumns="False" CssClass="CTable" EmptyDataText="û������!"  Width="99%" CellPadding="1" CellSpacing="1" GridLines="None">
         <Columns>
         
              <asp:TemplateField HeaderText="��ƷͼƬ">
                <itemstyle horizontalalign="Center" />
                <itemtemplate>
                    <img onerror="this.src='../../sysimg/nopic.gif'" src='<%# string.IsNullOrEmpty(Convert.ToString(Eval("DefaultPic")))?MyCache.GetCacheShopConfig(9):Kesion.BLL.BaseFun.GetFullImageSrc(Convert.ToString(Eval("DefaultPic")))  %>' width="60" height="45" style="border:1px solid #efefef;padding:1px" />
                </itemtemplate>
              </asp:TemplateField>
              <asp:TemplateField HeaderText="��Ʒ����">
                <itemstyle horizontalalign="Left" />
                <itemtemplate>
                    <%# getProOrder(Utils.StrToInt((Eval("ClassID"))), Convert.ToString(Eval("FileName") + ""), Convert.ToString(Eval("TurnUrl") + ""), Utils.StrToInt(Eval("ItemID")), Utils.StrToInt(Eval("ChannelID")), Utils.StrToInt(Eval("InfoID")), string.IsNullOrEmpty(Convert.ToString(Eval("ITitle") + "")) ? Convert.ToString(Eval("Title") + "") : Convert.ToString(Eval("ITitle")), Utils.StrToInt(Eval("isBundleSale")), Utils.StrToInt(Eval("isChangeBuy")), Utils.StrToInt(Eval("isLimitBuy")),Convert.ToString(Eval("AttributeCart")),Utils.StrToInt(Eval("attrID")))%>
                </itemtemplate>
              </asp:TemplateField>
              <asp:TemplateField HeaderText="�����Ż�">
                <itemstyle horizontalalign="Center" />
                <itemtemplate>
                   <%# Utils.StrToInt(Eval("IsPromotions"))==1?"��":"��"%>
                </itemtemplate>
              </asp:TemplateField>
              <asp:TemplateField HeaderText="������ʽ">
                <itemstyle horizontalalign="Center" />
                <itemtemplate>
                   <%# Utils.StrToInt(Eval("producttype"))==2?"��������":"��ݷ���"%>
                </itemtemplate>
              </asp:TemplateField>

               <asp:TemplateField HeaderText="����">
                <itemstyle horizontalalign="Center" />
                <itemtemplate>
                   <%# Convert.ToInt16(Eval("isBundleSale"))==1?"--":Convert.ToString(Eval("Num"))+" "+Convert.ToString(Eval("Unit")) %>
                </itemtemplate>
              </asp:TemplateField>
               <asp:TemplateField HeaderText="��������"  Visible="false">
                <itemstyle width="80px" horizontalalign="Center" />
                <itemtemplate>
                   <%# Utils.StrToInt(Convert.ToString(Eval("isBundleSale"))) == 1 ? "--" : string.Format("{0:G2} ����",Utils.StrToFloat(Convert.ToString(Eval("Weight"))))%>
                </itemtemplate>
              </asp:TemplateField>
               <asp:TemplateField HeaderText="��������"  Visible="false">
                <itemstyle width="80px" horizontalalign="Center" />
                <itemtemplate>
                   <%# Utils.StrToInt(Convert.ToString(Eval("isBundleSale"))) == 1 ? "--" : string.Format("{0:G2} ��", Utils.StrToFloat(Convert.ToString(Eval("Score"))))%>
                </itemtemplate>
              </asp:TemplateField>
              <asp:TemplateField HeaderText="�г���" Visible="false">
                <itemstyle horizontalalign="Center" width="50px"/>
                <itemtemplate>
                <%=MyCache.GetCurrencySymbol %><%# Public.ReturnShopPrice(Utils.StrToDecimal(Eval("Price_Market")))%>
                </itemtemplate>
              </asp:TemplateField> 
              <asp:TemplateField HeaderText="ʵ��">
                <itemstyle horizontalalign="Center"/>
                <itemtemplate>
                    <%# Utils.StrToInt(Eval("changescore")) > 0 ? Eval("changescore") + "��" : string.Empty %>
                   <%# Convert.ToDecimal(Eval("price")) > 0 && Utils.StrToInt(Eval("changescore")) > 0 ? "+" : string.Empty%>
                   <%# Convert.ToDecimal(Eval("price")) > 0 ? MyCache.GetCurrencySymbol+Public.ReturnShopPrice(Utils.StrToDecimal(Eval("Price"))) : string.Empty%>

                </itemtemplate>
              </asp:TemplateField> 
              
              <asp:TemplateField HeaderText="С��">
                <itemstyle horizontalalign="Center" width="90px"/>
                <itemtemplate>
                   <%# Utils.StrToInt(Eval("changescore")) > 0 ? Utils.StrToInt(Eval("changescore")) * Utils.StrToInt(Eval("num")) + "��" : string.Empty%>
                   <%# Convert.ToDecimal(Eval("TotalPrice")) > 0 && Utils.StrToInt(Eval("changescore")) > 0 ? "+" : string.Empty%>
                   <%# Convert.ToDecimal(Eval("TotalPrice")) > 0 ? MyCache.GetCurrencySymbol + Public.ReturnShopPrice(Utils.StrToDecimal(Eval("TotalPrice"))) : string.Empty%>

                </itemtemplate>
              </asp:TemplateField> 

            
            
              <asp:TemplateField HeaderText="��ע">
                <itemstyle horizontalalign="Center"/>
                <itemtemplate>
                    <%#Eval("remark") %>
                </itemtemplate>
              </asp:TemplateField>
         </Columns>
             <HeaderStyle CssClass="Title" Height="23px" />
             <RowStyle CssClass="tdbg" Height="22px" />
        </asp:GridView>
        
        <table border="0" cellpadding="0" cellspacing="0" class="CTable" style="border-top:none" width="99%">
        <tr>
         <td height="40" style="padding:3px"class="tdbg">
             ��Ʒ��<%=MyCache.GetCurrencySymbol %><asp:Label ID="LabGoodsMoney" runat="server" Text="Label"></asp:Label> <%=MyCache.GetCurrencyUnit %>&nbsp;�˷ѣ�<%=MyCache.GetCurrencySymbol %><asp:Label ID="LabFreight" runat="server" Text="Label"></asp:Label> <%=MyCache.GetCurrencyUnit %>
         
         ֧����ʽ���Żݣ�<span style="color:green"><%=MyCache.GetCurrencySymbol %><asp:Label ID="LabPayDiscount" runat="server" Text="Label"></asp:Label></span> <%=MyCache.GetCurrencyUnit %><span style="color:green"><asp:Label 
                 ID="LabCouponTips" runat="server"></asp:Label></span>
              <%if (Utils.StrToInt(dr["OrderScore"].ToString())>0){ %>
         �ɵû��֣� <asp:Label ID="LabScore" runat="server" ForeColor="red" Text=""></asp:Label> ��
          <%}
            if (Utils.StrToInt(dr["changescore"].ToString()) > 0)
            {
                Response.Write("&nbsp;&nbsp;<font color=green>����Ϊ���ֶһ���������֧������<font color=brown>" + dr["changescore"].ToString() + "</font>��</font>");
            } %>
         <br />
         ��������Ʒ���-֧����ʽ�Ż�+�˷�+˰��-�Ż�ȯ��<%=MyCache.GetCurrencySymbol %><asp:Label ID="LabNoUseCouponMoney" runat="server" Text="0"></asp:Label> <%=MyCache.GetCurrencyUnit %>         </td>
         <td class="tdbg" width="300">
         ������<span style="color:#555"><%=MyCache.GetCurrencySymbol %><asp:Label ID="LabNoUseCouponMoney1" runat="server" Text="Label"></asp:Label></span> <%=MyCache.GetCurrencyUnit %>
         �Ѹ��<span style="color:Red"><%=MyCache.GetCurrencySymbol %><asp:Label ID="LabMoneyReceive" runat="server" Text="Label"></asp:Label></span> <%=MyCache.GetCurrencyUnit %>
        <%  if (Utils.StrToDecimal(dr["savemoney"].ToString()) > 0)
            {
                Response.Write("<br/><font color=green>�����̳ǻ�Żݣ� <font color=brown>"+MyCache.GetCurrencySymbol + Kesion.APPCode.Public.ReturnShopPrice(dr["savemoney"].ToString()) + MyCache.GetCurrencyUnit+"</font></font>");
            } %>
             
              <br />
         Ӧ����<span style="font-weight:bold;font-size:15px;color:#ff6600"><%=MyCache.GetCurrencySymbol %><asp:Label ID="LabTotalOrderMoney" runat="server" Text="Label"></asp:Label></span> <%=MyCache.GetCurrencyUnit %> ��Ƿ�<span style="color:blue"><%=MyCache.GetCurrencySymbol %><asp:Label ID="LabNoPayMoney" runat="server" Text="Label"></asp:Label></span> <%=MyCache.GetCurrencyUnit %>
        
         </td>
        </tr>
        </table>
        <br />

         &nbsp;&nbsp;ע:<font color=blue>���г��ۡ�</font>ָ�����µ�ʱ���г��ο��۸�,<font color=red>��ʵ�ۡ�</font>ָ����ϵͳ�Զ������������Ʒ�������ۼ۸񡣡�������ָϵͳ�Զ�������ļ۸񣬱����������ռ۸��ԡ�Ӧ����Ϊ׼��

        <br />
   </td>
   </tr>
</table>

<asp:Panel ID="PanelConsumer" runat="server">
    <div style="margin:15px 0px 5px 7px"><B>�������ټ�¼</B>  </div>

    <script>
        var box='';
        function showOrderDetail(statusCode){
            var w=800;
            box=jQuery.dialog.open("content/showbox.aspx?action=order&orderid=<%=dr["orderid"].ToString()%>&statusCode="+statusCode,{ 
                title:'�鿴�����¼',
                width:w,
                height:415,

                cancelVal: 'ȡ��',
                max:false,
                min:false,
                cancel: true /*Ϊtrue�ȼ���function(){}*/ 
            });
        }
    </script>
    <asp:Repeater ID="RepeaterConsumer" runat="server" >
          <HeaderTemplate>
            <table class="CTable" cellSpacing=1 cellPadding=2 width="99%" align="center" border=0>
                <tr align="center" class="CTitle" >
        	   <td style="width:150px;text-align:center">����ʱ��</td>
                <td align="Left">������Ϣ</td>
        	    <td align="center">������</td>
        	    <td align="center">����</td>
              </tr>

          </HeaderTemplate>
           <ItemTemplate>
           <tr class="tdbg">
              <td class="Ctd" align="center"><%# Eval("Adddate") %> </td>
              <td class="Ctd" style="width:180px;word-break:break-all">
              <%# Eval("Remark") %>
              </td>
              <td class="Ctd" align="center"><%# Eval("inputer") %></td>
               <td class="splittd" align="center">
                 <%#  Convert.ToString(Eval("StatusCode"))=="6" ||(Convert.ToString(Eval("StatusCode"))=="4" && dr["OrderType"].ToString()=="1")?"<a href='javascript:;' onclick='showOrderDetail("+ Eval("statusCode") +")'>�鿴����</a>":( Convert.ToString(Eval("StatusCode"))=="3"?"<a href='javascript:;' onclick='showOrderDetail("+ Eval("statusCode") +")'>�鿴����</a>":"-") %> 
              </td>
           </tr>     
           </ItemTemplate>

         <FooterTemplate>
             <tr class="tdbg" style="display:<%# bool.Parse((RepeaterConsumer.Items.Count==0).ToString())?"":"none"%>">
                <td class="splittd" style="text-align:center" colspan="7">
                  ��û�и��ټ�¼!
                </td>
               </tr> 
            </table>
        </FooterTemplate>
    </asp:Repeater>

   
</asp:Panel>


 </asp:PlaceHolder>






<table width="100%" align="center" id="showDelviery" runat="server" visible="false">
<tr>
 <td>
  <script type="text/javascript">
		showtips(' <asp:Label ID="LabDeliveryInfo" runat="server"></asp:Label>');
		</script>
 </td>
</tr>
</table>

<div style="text-align:center" class="footer_page">
   <asp:Panel ID="printPanel" runat="server" HorizontalAlign="center" Visible="false">
        <input type="button" class="button" id="btnPrints" value="��ӡ..." onclick="jQuery('#<%=this.printPanel.ClientID %>').hide();window.print();return false;"/>
        <input type="button" class="button" id="showOrder" value="ȡ������" onclick="history.back();" /><br /><br />
        </asp:Panel>
        <asp:Panel ID="footPanel" runat="server">
        
        <%if (dr["status"].ToString() == "4")
          {
         %>
         <input type='button' class='button' name='Submit' value='ͬ���˿�����嶩��' onClick="returns();">&nbsp;
		 <input type='button' class='button' name='Submit'  value='�ѺͿͻ���Э�����ָ�����' onclick=KesionJS.Confirm("ȷ�����������ָ�����״̬��","location.href='KS.ShopOrder.aspx?Action=BankRefundOK&ID=<%=id%>';","")>
         <%}
          else
          { %>
            <%if (KSSecurity.CheckPurview(2)){ %>
        <input type="button" class="button" id="bankPayBtn" runat="server" value="֧ ��"/>
            <%} %>
            <%if (KSSecurity.CheckPurview(3)){ %>
        <input type="button" class="button" id="deliveryBtn" runat="server" value="�� ��"/>
            <%} %>
            <%if (KSSecurity.CheckPurview(4)){ %>
        <input type="button" class="button" id="signBtn" runat="server" value="�ͻ���ǩ��"/>
        <input type="button" class="button" id="finishBtn" runat="server" value="�� ��"/>
            <%} %>
             <%if (KSSecurity.CheckPurview(3)){ %>
        <input type="button" class="button" id="returnsBtn" runat="server" value=" �˻��˿� "/>
            <%} %>
              <%if (KSSecurity.CheckPurview(7)){ %>
        <input type="button" class="button" id="invoiceBtn" runat="server" value=" �� �� Ʊ "/>
            <%} %>
        <%if (KSSecurity.CheckPurview(1)){ %>
        <input type="button" class="button" id="modifyBtn" runat="server" value="�� ��"/>
        <%} %>
        <!--<input type="button" class="button" id="confirmBtn" runat="server" value="ȷ�϶���"/>-->
            <%if (KSSecurity.CheckPurview(5)){ %>
        <input type="button" class="button" id="canceledBtn" runat="server" value="��������"/>
            <%} %>
            <%if (KSSecurity.CheckPurview(0)){ %>
        <input type="button" class="button" id="delBtn" runat="server" value="ɾ������"/>
            <%} %>
            <%if (KSSecurity.CheckPurview(8)){ %>
        <input type="button" class="button" id="printExpresBtn" runat="server" value="��ӡ��ݵ�"/>
            <%} %>
        <%} %>
        <asp:Button ID="BtnPrint" runat="server" Text="��ӡ����" CssClass="button" OnClick="BtnPrint_Click" />
        <%if (Utils.StrToFloat(dr["MoneyReceipt"].ToString())<=0 && (KSSecurity.CheckPurview(9)))
          {
         %>
        <asp:Button ID="BtnSMS" runat="server" Text="���Ŵ߸���" CssClass="button"  />
        <%} %>
            <%if (KSSecurity.CheckPurview(6)){ %>
        <asp:Button ID="Button1" runat="server" CssClass="button" OnClick="Button1_Click" Text="����Word" />
            <%} %>
        <input type="button" class="button" id="backBtn" value="�� ��" onclick="location.href='KS.ShopOrder.aspx';" />
            <br /><br />
        <script type="text/javascript">
            var id = "<%=id %>";
            function returns() {
                parent.openWin("¼���˻��˿���Ϣ", "Shop/KS.ShopOrder.aspx?action=returns&id=" + id, true, 800, 490);
            }
            jQuery(document).ready(function() {

                jQuery("#<%=this.printExpresBtn.ClientID %>").click(function() {
                    window.open('KS.ShopPrintExpress.aspx?id=' + id);
                });

                jQuery("#<%=this.confirmBtn.ClientID %>").click(function() {
                    top.openWin("ȷ������", "Shop/KS.ShopOrder.aspx?action=confirmorder&id=" + id, true, 500, 200);

                });
                jQuery("#<%=this.canceledBtn.ClientID %>").click(function() {
                    top.openWin("��������", "Shop/KS.ShopOrder.aspx?action=canceledorder&id=" + id, true, 500, 240);
                });
                jQuery("#<%=this.bankPayBtn.ClientID %>").click(function() {
                    parent.openWin("֧������", "Shop/KS.ShopOrder.aspx?action=bankPay&id=" + id, true, 800, 490);
                });
                jQuery("#<%=this.deliveryBtn.ClientID %>").bind("click", function() {
                    parent.openWin("¼�뷢����Ϣ", "Shop/KS.ShopOrder.aspx?action=delivery&id=" + id, true, 800, 490);
                });
                jQuery("#<%=this.BtnSMS.ClientID %>").bind("click", function() {
                parent.openWin("���Ŵߵ�", "Shop/KS.ShopOrder.aspx?action=sendsms&id=" + id, true, 800, 490);
                });
                jQuery("#<%=this.returnsBtn.ClientID %>").bind("click", function() {
                    returns();
                });
                jQuery("#<%=this.invoiceBtn.ClientID %>").bind("click", function() {
                    parent.openWin("¼�뿪��Ʊ��Ϣ", "Shop/KS.ShopOrder.aspx?action=invoice&id=" + id, true, 800, 490);
                });
                jQuery("#<%=this.modifyBtn.ClientID %>").bind("click", function() {
                    location.href = '?action=modify&id=' + id;
                });
                jQuery("#<%=this.signBtn.ClientID %>").bind("click", function() {
                    KesionJS.Confirm("ȷ���û���ǩ������", 'location.href="Shop/KS.ShopOrder.aspx?id=' + id + '&action=signorder";', null);
                });
                jQuery("#<%=this.finishBtn.ClientID %>").bind("click", function() {
                    KesionJS.Confirm("����һ�����壬�Ϳ����ٶԸö��������κβ�����ȷ��������", 'location.href="Shop/KS.ShopOrder.aspx?id=' + id + '&action=finishorder";', null);
                });
                jQuery("#<%=this.delBtn.ClientID %>").bind("click", function() {
                    KesionJS.Confirm("ȷ��ɾ���ö�����", 'location.href="Shop/KS.ShopOrder.aspx?id=' + id + '&action=delorder";', null);
                });
            });
        </script>    
        
        <%
            if (Utils.StrToInt(dr["smsnum"].ToString()) > 0)
            {
                %>
                <div class="message">
                <strong>���ѣ�</strong>�ö����ѷ�����<font color=red><%=dr["SmsNum"].ToString() %></font>�ε����Ѹ�����Ϣ��
                </div>
                <%
            }    
        %>  
         </asp:Panel>
    </asp:Panel>
 </div>



