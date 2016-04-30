<%@ Page Language="C#" MasterPageFile="~/User/UserNoLogin.master" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.User_PayConfirm" Title="在线支付" Codebehind="PayConfirm.aspx.cs" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="Kesion.Cache" %>
<%@ Import Namespace="Kesion.Publics" %>
<%@ Import Namespace="Kesion.BLL" %>
<asp:Content ID="Content1" ContentPlaceHolderID="KSContent" Runat="Server">

<asp:Panel ID="PnlStep3" runat="server" Width="100%">

 <table  cellspacing="1" cellpadding="3" class="border" width="98%" align="center" border="0">
	 <tr class="title">
             <td colspan="2"> 确认支付</td>
     </tr>
     <%if (!string.IsNullOrEmpty((new TemporaryVar()).UserName)){ %>
     <tr class="tdbg">
         <td class="lefttd splittd">用 户 名：</td>
         <td class="splittd">
          <asp:Label ID="LabUserName" runat="server" Text=""></asp:Label>
         </td>
     </tr>
     <%} %>
     <tr class="tdbg">
         <td class="lefttd splittd">支付编号：</td>
         <td class="splittd">
          <asp:Label ID="LabOrderID" runat="server" Text="0"></asp:Label>
          <asp:Label ID="LabShopInfo" runat="server" Text=""></asp:Label>
         </td>
     </tr>
     <tbody id="showrate" runat="server">
     <tr class="tdbg">
         <td class="lefttd splittd">金额：</td>
         <td class="splittd">
           <%=MyCache.GetCurrencySymbol %><asp:Label ID="LabMoney" runat="server" Text="0"></asp:Label>
          <%=MyCache.GetCurrencyUnit %>
         </td>
     </tr>
      
      <tr class="tdbg">
         <td class="lefttd splittd">手 续 费：</td>
         <td class="splittd">
          <asp:Label ID="LabRate" runat="server" Text="0"></asp:Label>
         </td>
     </tr>
     </tbody>
     <tr class="tdbg">
         <td class="lefttd splittd">实际支付： </td>
         <td class="splittd">
          <%=MyCache.GetCurrencySymbol %><span style="font-size:16px;font-weight:bold;color:#ff6600"><asp:Label ID="LabRealMoney" runat="server" Text="0"></asp:Label>
         </span><%=MyCache.GetCurrencyUnit %>
         </td>
     </tr>
      <tr class="tdbg">
         <td class="splittd" style="height:52px">&nbsp;
          
         </td>
         <td class="splittd">
           <asp:Label ID="LabHiddenField" runat="server"></asp:Label>
         </td>
     </tr>


    </table>

</asp:Panel>

<script runat="server" type="text/C#">
        protected void Page_Load(object sender, EventArgs e)
        {
            InitialPage();

            string subject = "";    //标题
            string v_oid = "";                 //订单编号
            string v_amount = "";              //实际支付金额       
            string v_mid = "";                 //商户编号
            string v_url = "";                 //支付动作完成后返回到该url，支付结果以POST方式发送
            string payOnlineKey = "";        //MD5私钥

            decimal vmoney = 0;           //支付金额   
            int payPlatformId = 0;           //支付平台ID
            string md5string;             //订单MD5校验码
            string orderId;              //订单ID
            string userName = "";          //登录用户名
            string paymentNum = "";       //支付序号

            string m_PayOnlineProviderUrl = "";
            string m_HiddenValue = string.Empty;
            string partner = string.Empty;


            orderId = Utils.RemoveXss(Utils.ChkSQL(KSCMS.S("OrderId")));
            payPlatformId = Utils.StrToInt(KSCMS.S("platid")); 
            
            userName = (new TemporaryVar()).UserName;
            vmoney = Convert.ToDecimal(Utils.StrToFloat(Request.QueryString["Money"],0));

            #region 商城订单
            string from = KSCMS.S("from");
            string itemstr = string.Empty;
            if (from == "shop")
            {
                
                using (DataTable dt = DataFactory.GetDataTable("select top 1 * from ks_proorder where orderid='" + orderId + "'"))
                {
                    if (dt.Rows.Count <= 0)
                    {
                        Utils.ShowError("找不到该订单，无法支付!", 1);
                    }
                    else
                    {
                       
                        DataRow dr = dt.Rows[0];
                        if (Utils.StrToFloat(dr["MoneyReceipt"].ToString()) >= Utils.StrToFloat(dr["OrderTotalPrice"].ToString()))
                        {
                            Utils.ShowError("该订单已支付过了，不需要再支付!", 1);
                        }
                        else if (dr["status"].ToString() == "2")
                        {
                            Utils.ShowError("该订单已结清，不能再支付了!", 1);
                        }
                        else if (dr["status"].ToString() == "3")
                        {
                            Utils.ShowError("该订单已失效，不能再支付了!", 1);
                        }

                        string strSQL = string.Empty;
                        if (dr["orderType"].ToString() == "1")
                        {
                            strSQL = "select top 100 i.subject as title from KS_ProOrderItem o left join KS_ProGroupBuy I on i.id=o.infoid where o.Orderid='" + orderId + "' order by o.itemid";
                        }
                        else
                        {
                            strSQL = "select top 100 i.title from KS_ProOrderItem o left join KS_ProductList I on i.infoid=o.infoid where o.Orderid='" + orderId + "' order by o.itemid";
                        }

                        using (DataTable dtt = DataFactory.GetDataTable(strSQL))
                        {
                            if (dtt.Rows.Count > 0)
                            {
                                foreach (DataRow drr in dtt.Rows)
                                {
                                    itemstr += drr["title"].ToString() + "<br/>";
                                }
                            }
                        }
                        this.LabShopInfo.Text = "<br/><strong>购买商品：</strong><span class='tips'><br/>"+itemstr+"</span>";

                        if (Utils.StrToInt(dr["IsFrontPay"].ToString()) == 0)
                        {
                            vmoney = Convert.ToDecimal(Convert.ToDecimal(dr["OrderTotalPrice"].ToString()) - Convert.ToDecimal(dr["MoneyReceipt"].ToString()));
                        }
                        else if (Utils.StrToInt(dr["IsFrontPay"].ToString()) == 1) //只允许支付定金
                        {
                            vmoney = Utils.StrToDecimal(dr["FrontMoney"].ToString());
                        }
                        else //最少支付订金
                        {
                            vmoney = Utils.StrToDecimal(KSCMS.S("money"));
                            if (vmoney < Utils.StrToDecimal(dr["FrontMoney"].ToString()))
                            {
                                Utils.ShowError("对不起，本订单最少需要支付￥" + Kesion.APPCode.Public.ReturnShopPrice(Utils.StrToDecimal(dr["FrontMoney"].ToString())) + "元订金!",6);
                            }
                            else if (vmoney > Convert.ToDecimal(Convert.ToDecimal(dr["OrderTotalPrice"].ToString()) - Convert.ToDecimal(dr["MoneyReceipt"].ToString())))
                            {
                                Utils.ShowError("对不起，本订单只需要支付￥" + Kesion.APPCode.Public.ReturnShopPrice(Convert.ToDecimal(Convert.ToDecimal(dr["OrderTotalPrice"].ToString()) - Convert.ToDecimal(dr["MoneyReceipt"].ToString()))) + "元!", 6);
  
                            }
                        }

                        #region 选择收款账号
                        int payToId = Utils.StrToInt(dr["payid"].ToString());
                        if (payToId > 0)
                        {
                            using (DataTable dtp = DataFactory.GetDataTable("select top 1 * From KS_PaymentPlatItem WHERE id=" + payToId))
                            {
                                if (dtp.Rows.Count > 0)
                                {
                                    DataRow drr = dtp.Rows[0];
                                    AccountID = drr["AccountID"].ToString();
                                    Md5Key = drr["md5key"].ToString();
                                }
                            }
                        }
                        #endregion

                    }
                }
            }
            else if (from == "recharge")   //继续完成在线充值。
            {
                
                using (DataTable dt = DataFactory.GetDataTable("Select top 1 * From KS_RechargeRecords Where OrderID='" + orderId + "'"))
                {
                    if (dt.Rows.Count <= 0)
                    {
                        Utils.ShowError("找不到该订单，无法支付!", 1);
                    }
                    else
                    {
                        DataRow dr = dt.Rows[0];
                        if (dr["status"].ToString() != "0")
                        {
                            Utils.ShowError("该订单已支付过，不能再支付了!", 1);
                        }
                        vmoney = Convert.ToDecimal(dr["paymoney"].ToString());
                        payPlatformId = Utils.StrToInt(dr["platid"].ToString());

                    }
                }
            }
            #endregion


            v_oid = orderId;
            v_mid = AccountID;
            
            payOnlineKey = Md5Key;

            double realmoney = Convert.ToDouble(vmoney);  //实际入账金额,不含手续费
            if (RateByUser == 1)
            {
                v_amount = decimal.Round(vmoney + vmoney * rate / 100, 2).ToString();
            }
            else
            {
                showrate.Visible = false;
                v_amount = decimal.Round(vmoney, 2).ToString();
            }
            vmoney = decimal.Round(vmoney, 2);

            if (vmoney < 0.01M)
            {
                Utils.ShowError("支付金额太小!",6);
                return;
            }

            paymentNum = v_oid;


            DateTime datatime = DateTime.Now;
            string v_hms = datatime.ToString("HHmmss", System.Globalization.DateTimeFormatInfo.InvariantInfo);
            string v_ymd = datatime.ToString("yyyyMMdd", System.Globalization.DateTimeFormatInfo.InvariantInfo);

            StringBuilder strHiddenField = new StringBuilder();
            StringBuilder md5Builder = new StringBuilder();
            StringBuilder v_urlBuilder = new StringBuilder();    //构造返回URL

            string applicationName = KSCMS.GetInstallDir();
            bool isFabrication = false;

            v_urlBuilder.Append(MyCache.GetCacheConfig(5));
            v_urlBuilder.Append(applicationName);

            string v_ShowResultUrl = v_urlBuilder.ToString() + "User/PayOnline/PayRecive.aspx?paymentplat="+payPlatformId+"&userid="+(new TemporaryVar()).UserID;

            if (!string.IsNullOrEmpty(from))
            {
                 v_ShowResultUrl += "&from="+from;
            }
            
            if (from == "shop")
            {
                subject = "购买商品：" + Utils.CutStr(itemstr.Replace("<br/>", " "),200);
            }
            else
            {
                subject = "【" + MyCache.GetCacheConfig(1) + "】在线充值，订单号：" + v_oid;

                if (from != "recharge")
                {
                    addToRechargeRecords(orderId, Convert.ToDouble(v_amount),realmoney, "预付款在线充值！", payPlatformId);
                }
                
            }
            switch (payPlatformId)
            {
                case 1:    //网银在线
                    m_PayOnlineProviderUrl = "https://pay3.chinabank.com.cn/PayGate";
                    //生成MD5校验数据字符串
                    md5Builder.Append(v_amount);
                    md5Builder.Append("0");
                    md5Builder.Append(v_oid);
                    md5Builder.Append(v_mid);
                    md5Builder.Append(v_ShowResultUrl);
                    md5Builder.Append(payOnlineKey);
                    md5string = Utils.MD5(md5Builder.ToString()).ToUpper();

                    strHiddenField.Append("<input type='hidden' name='v_md5info' value='" + md5string + "'>");
                    strHiddenField.Append("<input type='hidden' name='v_mid' value='" + v_mid + "'>");
                    strHiddenField.Append("<input type='hidden' name='v_oid' value='" + v_oid + "'>");
                    strHiddenField.Append("<input type='hidden' name='v_amount' value='" + v_amount + "'>");
                    strHiddenField.Append("<input type='hidden' name='v_moneytype'  value='0'>");
                    strHiddenField.Append("<input type='hidden' name='v_url' value='" + v_ShowResultUrl + "'>");
                    break; 
                    
                case 2://'中国在线支付网
                    m_PayOnlineProviderUrl = "http://www.ipay.cn/4.0/bank.shtml";
                    v_urlBuilder.Append("PayOnline/PayResultIpay.aspx");
                    v_url = v_urlBuilder.ToString();

                    md5Builder.Append(v_mid);
                    md5Builder.Append(v_oid);
                    md5Builder.Append(v_amount);
                    md5Builder.Append("test@Ipay.com.cn13800138000");
                    md5Builder.Append(payOnlineKey);
                    md5string = Utils.MD5(md5Builder.ToString());

                    strHiddenField.Append("<input type='hidden' name='v_mid' value='" + v_mid + "'>");
                    strHiddenField.Append("<input type='hidden' name='v_oid' value='" + v_oid + "'>");
                    strHiddenField.Append("<input type='hidden' name='v_amount' value='" + v_amount + "'>");
                    strHiddenField.Append("<input type='hidden' name='v_email' value='test@Ipay.com.cn'>");
                    strHiddenField.Append("<input type='hidden' name='v_mobile' value='13800138000'>");
                    strHiddenField.Append("<input type='hidden' name='v_md5' value='" + md5string + "'>");
                    strHiddenField.Append("<input type='hidden' name='v_url' value='" + v_url + "'>");
                    break;

                case 3://上海环迅
                    m_PayOnlineProviderUrl = "http://pay.ips.com.cn/ipayment.aspx";
                    //m_PayOnlineProviderUrl = "http://pay.ips.net.cn/ipayment.aspx";  //测试接口，配合测试帐号测试
                    v_urlBuilder.Append("User/PayOnline/PayResultIps.aspx");
                    v_url = v_urlBuilder.ToString();

                    md5Builder.Append(v_oid);
                    md5Builder.Append(v_amount);
                    md5Builder.Append(v_ymd);
                    md5Builder.Append("RMB");
                    md5Builder.Append(payOnlineKey);
                    md5string = Utils.MD5(md5Builder.ToString()).ToLower();

                    strHiddenField.Append("<input type='hidden' name='mer_code' value='" + v_mid + "'>");
                    strHiddenField.Append("<input type='hidden' name='billNo' value='" + v_oid + "'>");
                    strHiddenField.Append("<input type='hidden' name='amount' value='" + v_amount + "'>");
                    strHiddenField.Append("<input type='hidden' name='date' value='" + v_ymd + "'>");
                    strHiddenField.Append("<input type='hidden' name='lang' value='GB'>");
                    strHiddenField.Append("<input type='hidden' name='Gateway_type' value='01'>");
                    strHiddenField.Append("<input type='hidden' name='Currency_Type' value='RMB'>");
                    strHiddenField.Append("<input type='hidden' name='Merchanturl' value='" + v_url + "'>");
                    strHiddenField.Append("<input type='hidden' name='OrderEncodeType' value='2'>");
                    strHiddenField.Append("<input type='hidden' name='RetEncodeType' value='12'>");
                    strHiddenField.Append("<input type='hidden' name='RetType' value='0'>");
                    strHiddenField.Append("<input type='hidden' name='SignMD5' value='" + md5string + "'>");
                    strHiddenField.Append("<input type='hidden' name='ServerUrl' value=''>");
                    break;
                case 4://西部支付
                    m_PayOnlineProviderUrl = "http://www.yeepay.com/Pay/WestPayReceiveOrderFromMerchant.asp";
                    v_urlBuilder.Append("User/PayOnline/PayResultYeepay.aspx");
                    v_url = v_urlBuilder.ToString();

                    strHiddenField.Append("<input type='hidden' name='MerchantID' value='" + v_mid + "'>");
                    strHiddenField.Append("<input type='hidden' name='OrderNumber' value='" + v_oid + "'>");
                    strHiddenField.Append("<input type='hidden' name='OrderAmount' value='" + v_amount + "'>");
                    strHiddenField.Append("<input type='hidden' name='PostBackURL' value='" + v_url + "'>");
                    break;

                case 5://易付通
                    m_PayOnlineProviderUrl = "http://pay.xpay.cn/Pay.aspx";
                    v_urlBuilder.Append("User/PayOnline/PayResultXpay.aspx");
                    v_url = v_urlBuilder.ToString();

                    md5Builder.Append(payOnlineKey);
                    md5Builder.Append(":");
                    md5Builder.Append(v_amount);
                    md5Builder.Append(",");
                    md5Builder.Append(v_oid);
                    md5Builder.Append(",");
                    md5Builder.Append(v_mid);
                    md5Builder.Append(",bank,,sell,,2.0");
                    md5string = Utils.MD5(md5Builder.ToString()).ToLower();

                    strHiddenField.Append("<input type='hidden' name='Tid' value='" + v_mid + "'>");
                    strHiddenField.Append("<input type='hidden' name='Bid' value='" + v_oid + "'>");
                    strHiddenField.Append("<input type='hidden' name='Prc' value='" + v_amount + "'>");
                    strHiddenField.Append("<input type='hidden' name='url' value='" + v_url + "'>");
                    strHiddenField.Append("<input type='hidden' name='Card' value='bank'>");
                    strHiddenField.Append("<input type='hidden' name='Scard' value=''>");
                    strHiddenField.Append("<input type='hidden' name='ActionCode' value='sell'>");
                    strHiddenField.Append("<input type='hidden' name='ActionParameter' value=''>");
                    strHiddenField.Append("<input type='hidden' name='Ver' value='2.0'>");
                    strHiddenField.Append("<input type='hidden' name='Pdt' value='" + applicationName + "'>");
                    strHiddenField.Append("<input type='hidden' name='type' value=''>");
                    strHiddenField.Append("<input type='hidden' name='lang' value='gb2312'>");
                    strHiddenField.Append("<input type='hidden' name='md' value='" + md5string + "'>");
                    break;

                case 6://云网支付
                    m_PayOnlineProviderUrl = "https://www.cncard.net/purchase/getorder.asp";
                    v_urlBuilder.Append("User/PayOnline/PayResultCncard.aspx");
                    v_url = v_urlBuilder.ToString();

                    md5Builder.Append(v_mid);
                    md5Builder.Append(v_oid);
                    md5Builder.Append(v_amount);
                    md5Builder.Append(v_ymd);
                    md5Builder.Append("01");
                    md5Builder.Append(v_url);
                    md5Builder.Append("00");
                    md5Builder.Append(payOnlineKey);
                    md5string = Utils.MD5(md5Builder.ToString()).ToLower();

                    strHiddenField.Append("<input type='hidden' name='c_mid' value='" + v_mid + "'>");
                    strHiddenField.Append("<input type='hidden' name='c_order' value='" + v_oid + "'>");
                    strHiddenField.Append("<input type='hidden' name='c_orderamount' value='" + v_amount + "'>");
                    strHiddenField.Append("<input type='hidden' name='c_ymd' value='" + v_ymd + "'>");
                    strHiddenField.Append("<input type='hidden' name='c_moneytype' value='0'>");
                    strHiddenField.Append("<input type='hidden' name='c_retflag' value='1'>");
                    strHiddenField.Append("<input type='hidden' name='c_paygate' value=''>");
                    strHiddenField.Append("<input type='hidden' name='c_returl' value='" + v_url + "'>");
                    strHiddenField.Append("<input type='hidden' name='c_memo1' value=''>");
                    strHiddenField.Append("<input type='hidden' name='c_memo2' value=''>");
                    strHiddenField.Append("<input type='hidden' name='c_language' value='0'>");
                    strHiddenField.Append("<input type='hidden' name='notifytype' value='0'>");
                    strHiddenField.Append("<input type='hidden' name='c_signstr' value='" + md5string + "'>");
                    break;
                case 8:   //支付宝即时到帐
                    m_PayOnlineProviderUrl = "https://www.alipay.com/cooperate/gateway.do?_input_charset=utf-8";
                    v_urlBuilder.Append("User/PayOnline/AlipayNotify.aspx?from=" + from + "&paymentplat=" + payPlatformId + "&userid=" + (new TemporaryVar()).UserID);
                    v_url = v_urlBuilder.ToString();
                    if (payOnlineKey.IndexOf("|") > 0)
                    {
                        string[] ArrMD5Key = payOnlineKey.Split(new char[] { '|' });
                        payOnlineKey = ArrMD5Key[0];
                        partner = ArrMD5Key[1];
                    }
                    md5Builder.Append("_input_charset=utf-8");
                    md5Builder.Append("&discount=0");
                    md5Builder.Append("&extend_param=isv^1827506kx");
                    md5Builder.Append("&notify_url=" + v_url);
                    md5Builder.Append("&out_trade_no=" + v_oid);
                    md5Builder.Append("&partner=" + partner);
                    md5Builder.Append("&payment_type=1");
                    md5Builder.Append("&price=" + v_amount);
                    md5Builder.Append("&quantity=1");
                    md5Builder.Append("&return_url=" + v_ShowResultUrl);
                    md5Builder.Append("&seller_email=" + v_mid);
                    md5Builder.Append("&service=create_direct_pay_by_user");
                    md5Builder.Append("&subject=" + subject);
                    md5Builder.Append(payOnlineKey);
                    md5string = AlipayCore.Sign(md5Builder.ToString(), "MD5", "utf-8").ToLower();

                    strHiddenField.Append("<input type='hidden' name='_input_charset' value='utf-8'>");
                    strHiddenField.Append("<input type='hidden' name='extend_param' value='isv^1827506kx'>");
                    strHiddenField.Append("<input type='hidden' name='discount' value='0'>\n");
                    strHiddenField.Append("<input type='hidden' name='notify_url' value='" + v_url + "'>\n");
                    strHiddenField.Append("<input type='hidden' name='out_trade_no' value='" + v_oid + "'>\n");
                    strHiddenField.Append("<input type='hidden' name='payment_type' value='1'>\n");
                    strHiddenField.Append("<input type='hidden' name='partner' value='" + partner + "'>\n");
                    strHiddenField.Append("<input type='hidden' name='price' value='" + v_amount + "'>\n");
                    strHiddenField.Append("<input type='hidden' name='quantity' value='1'>\n");
                    strHiddenField.Append("<input type='hidden' name='seller_email' value='" + v_mid + "'>\n");
                    strHiddenField.Append("<input type='hidden' name='service' value='create_direct_pay_by_user'>\n");
                    strHiddenField.Append("<input type='hidden' name='subject' value='" + subject + "'>\n");
                    strHiddenField.Append("<input type='hidden' name='sign' value='" + md5string + "'>\n");
                    strHiddenField.Append("<input type='hidden' name='sign_type' value='MD5'>\n");
                    strHiddenField.Append("<input type='hidden' name='return_url' value='" + v_ShowResultUrl + "'>\n");
                    break;
                case 12:  //支付宝担保交易

                    m_PayOnlineProviderUrl = "https://mapi.alipay.com/gateway.do?_input_charset=utf-8";
                    v_urlBuilder.Append("User/PayOnline/AlipayNotify1.aspx?from=" + from + "&paymentplat=" + payPlatformId + "&userid=" + (new TemporaryVar()).UserID);
                    v_url = v_urlBuilder.ToString();
                    if (payOnlineKey.IndexOf("|") > 0)
                    {
                        string[] ArrMD5Key = payOnlineKey.Split(new char[] { '|' });
                        payOnlineKey = ArrMD5Key[0];
                        partner = ArrMD5Key[1];
                    }
                    md5Builder.Append("_input_charset=utf-8");
                    md5Builder.Append("&discount=0");
                    md5Builder.Append("&extend_param=isv^1827506kx");
                    md5Builder.Append("&logistics_fee=0");
                    md5Builder.Append("&logistics_payment=SELLER_PAY");
                    md5Builder.Append("&logistics_type=EXPRESS");
                    md5Builder.Append("&notify_url=" + v_url);
                    md5Builder.Append("&out_trade_no=" + v_oid);
                    md5Builder.Append("&partner=" + partner);
                    md5Builder.Append("&payment_type=1");
                    md5Builder.Append("&price=" + v_amount);
                    md5Builder.Append("&quantity=1");
                    md5Builder.Append("&return_url=" + v_ShowResultUrl);
                    md5Builder.Append("&seller_email=" + v_mid);
                    md5Builder.Append("&service=create_partner_trade_by_buyer");
                    md5Builder.Append("&subject=" + subject);
                    md5Builder.Append(payOnlineKey);
                 
                    md5string = AlipayCore.Sign(md5Builder.ToString(), "MD5", "utf-8").ToLower();

                    strHiddenField.Append("<input type='hidden' name='_input_charset' value='utf-8'>");
                    strHiddenField.Append("<input type='hidden' name='discount' value='0'>");
                    strHiddenField.Append("<input type='hidden' name='extend_param' value='isv^1827506kx'>");
                    strHiddenField.Append("<input type='hidden' name='notify_url' value='" + v_url + "'>");
                    strHiddenField.Append("<input type='hidden' name='logistics_fee' value='0'>");
                    strHiddenField.Append("<input type='hidden' name='logistics_payment' value='SELLER_PAY'>");
                    strHiddenField.Append("<input type='hidden' name='logistics_type' value='EXPRESS'>");
                    strHiddenField.Append("<input type='hidden' name='out_trade_no' value='" + v_oid + "'>");
                    strHiddenField.Append("<input type='hidden' name='partner' value='" + partner + "'>");
                    strHiddenField.Append("<input type='hidden' name='payment_type' value='1'>");
                    strHiddenField.Append("<input type='hidden' name='price' value='" + v_amount + "'>");
                    strHiddenField.Append("<input type='hidden' name='quantity' value='1'>");
                    strHiddenField.Append("<input type='hidden' name='seller_email' value='" + v_mid + "'>");
                    strHiddenField.Append("<input type='hidden' name='service' value='create_partner_trade_by_buyer'>");
                    strHiddenField.Append("<input type='hidden' name='return_url' value='" + v_ShowResultUrl + "'>\n");
                    strHiddenField.Append("<input type='hidden' name='subject' value='" + subject + "'>");
                    strHiddenField.Append("<input type='hidden' name='sign' value='" + md5string + "'>");
                    strHiddenField.Append("<input type='hidden' name='sign_type' value='MD5'>");
                                        
                    break;      
                case 9:    //支付宝双接口
                    m_PayOnlineProviderUrl = "https://mapi.alipay.com/gateway.do?_input_charset=utf-8";
                    v_urlBuilder.Append("User/PayOnline/AlipayNotify1.aspx?from=" + from + "&paymentplat=" + payPlatformId + "&userid=" + (new TemporaryVar()).UserID);
                    v_url = v_urlBuilder.ToString();


                    //订单含有虚拟商品的情况
                    if (orderId.Substring(1,2) == "0P")
                    {
                        isFabrication = true;   //会员充值，视为虚拟物品
                    }
                    else
                    {
                        isFabrication = false;   //检测订单中的物品是否含有虚拟物品
                    }

                    
                    if (payOnlineKey.IndexOf("|") > 0)
                    {
                        string[] ArrMD5Key = payOnlineKey.Split(new char[] { '|' });
                        payOnlineKey = ArrMD5Key[0];
                        partner = ArrMD5Key[1];
                    }

                    if (isFabrication)
                    {
                        md5Builder.Append("_input_charset=utf-8");
                        md5Builder.Append("&extend_param=isv^1827506kx");
                        md5Builder.Append("&notify_url=" + v_url);
                        md5Builder.Append("&out_trade_no=" + v_oid);
                        md5Builder.Append("&partner=" + partner);
                        md5Builder.Append("&price=" + v_amount);
                        md5Builder.Append("&quantity=1");
                        md5Builder.Append("&return_url=" + v_ShowResultUrl);
                        md5Builder.Append("&seller_email=" + v_mid);
                        md5Builder.Append("&service=create_digital_goods_trade_p");
                        md5Builder.Append("&subject=" + subject);
                        md5Builder.Append("");
                        md5Builder.Append(payOnlineKey);
                        strHiddenField.Append("<input type='hidden' name='service' value='create_digital_goods_trade_p'>");
                    }
                    else
                    {
                        md5Builder.Append("_input_charset=utf-8");
                        md5Builder.Append("&extend_param=isv^1827506kx");
                        md5Builder.Append("&logistics_fee=0");
                        md5Builder.Append("&logistics_payment=SELLER_PAY");
                        md5Builder.Append("&logistics_type=EXPRESS");
                        md5Builder.Append("&notify_url=" + v_url);
                        md5Builder.Append("&out_trade_no=" + v_oid);
                        md5Builder.Append("&partner=" + partner);
                        md5Builder.Append("&payment_type=1");
                        md5Builder.Append("&price=" + v_amount);
                        md5Builder.Append("&quantity=1");
                        md5Builder.Append("&return_url=" + v_ShowResultUrl);
                        md5Builder.Append("&seller_email=" + v_mid);
                        md5Builder.Append("&service=trade_create_by_buyer");
                        md5Builder.Append("&subject=" + subject);
                        md5Builder.Append(payOnlineKey);
                        strHiddenField.Append("<input type='hidden' name='service' value='trade_create_by_buyer'>");
                        strHiddenField.Append("<input type='hidden' name='logistics_type' value='EXPRESS'>");
                        strHiddenField.Append("<input type='hidden' name='logistics_fee' value='0'>");
                        strHiddenField.Append("<input type='hidden' name='logistics_payment' value='SELLER_PAY'>");
                        strHiddenField.Append("<input type='hidden' name='payment_type' value='1'>");
                    }
                    md5string = AlipayCore.Sign(md5Builder.ToString(), "MD5", "utf-8").ToLower();
                    strHiddenField.Append("<input type='hidden' name='extend_param' value='isv^1827506kx'>");
                    strHiddenField.Append("<input type='hidden' name='_input_charset' value='utf-8'>");
                    strHiddenField.Append("<input type='hidden' name='seller_email' value='" + v_mid + "'>");
                    strHiddenField.Append("<input type='hidden' name='subject' value='" + subject + "'>");
                    strHiddenField.Append("<input type='hidden' name='out_trade_no' value='" + v_oid + "'>");
                    strHiddenField.Append("<input type='hidden' name='price' value='" + v_amount + "'>");
                    strHiddenField.Append("<input type='hidden' name='partner' value='" + partner + "'>");
                    strHiddenField.Append("<input type='hidden' name='quantity' value='1'>");
                    strHiddenField.Append("<input type='hidden' name='notify_url' value='" + v_url + "'>");
                    strHiddenField.Append("<input type='hidden' name='sign' value='" + md5string + "'>");
                    strHiddenField.Append("<input type='hidden' name='sign_type' value='MD5'>");
                    strHiddenField.Append("<input type='hidden' name='return_url' value='" + v_ShowResultUrl + "'>\n");
                    break;
                case 7:      //快钱支付
                    m_PayOnlineProviderUrl = "https://www.99bill.com/gateway/recvMerchantInfoAction.htm";
                    //生成返回URL
                    v_urlBuilder.Append("User/PayOnline/PayResult99bill.aspx");
                    v_url = v_urlBuilder.ToString();

                    string merchantAcctId = v_mid;   //网关账户号
                    string key = payOnlineKey; //网关密钥
                    string inputCharset = "3"; //1代表UTF-8; 2代表GBK; 3代表gb2312
                    string pageUrl = v_url; //接受支付结果的页面地址
                    string bgUrl = ""; //服务器接受支付结果的后台地址
                    string version = "v2.0"; //网关版本.固定值
                    string language = "1"; //1代表中文；2代表英文
                    string signType = "1"; //1代表MD5签名
                    string payerName = ""; //支付人姓名
                    string payerContactType = ""; //支付人联系方式类型 1代表Email；2代表手机号
                    string payerContact = ""; //支付人联系方式,只能选择Email或手机号
                    string orderAmount = Convert.ToString(decimal.Ceiling(Convert.ToDecimal(v_amount) * 100)); //订单金额,以分为单位
                    string orderTime = v_ymd + v_hms; //订单提交时间,14位数字
                    string productName = ""; //商品名称
                    string productNum = ""; //商品数量
                    string productId = ""; //商品代码
                    string productDesc = ""; //商品描述
                    string ext1 = ""; //扩展字段1,在支付结束后原样返回给商户
                    string ext2 = ""; //扩展字段2
                    string payType = "00"; //支付方式,00：组合支付,显示快钱支持的各种支付方式,11：电话银行支付,12：快钱账户支付,13：线下支付,14：B2B支付
                    string bankId = ""; //银行代码,实现直接跳转到银行页面去支付,具体代码参见 接口文档银行代码列表,只在payType=10时才需设置参数
                    string redoFlag = "1"; //同一订单禁止重复提交标志:1代表同一订单号只允许提交1次,0表示同一订单号在没有支付成功的前提下可重复提交多次
                    string pid = ""; //快钱的合作伙伴的账户号

                    string signMsgVal = "";
                    signMsgVal = AppendParam(signMsgVal, "inputCharset", inputCharset);
                    signMsgVal = AppendParam(signMsgVal, "pageUrl", pageUrl);
                    signMsgVal = AppendParam(signMsgVal, "bgUrl", bgUrl);
                    signMsgVal = AppendParam(signMsgVal, "version", version);
                    signMsgVal = AppendParam(signMsgVal, "language", language);
                    signMsgVal = AppendParam(signMsgVal, "signType", signType);
                    signMsgVal = AppendParam(signMsgVal, "merchantAcctId", merchantAcctId);
                    signMsgVal = AppendParam(signMsgVal, "payerName", payerName);
                    signMsgVal = AppendParam(signMsgVal, "payerContactType", payerContactType);
                    signMsgVal = AppendParam(signMsgVal, "payerContact", payerContact);
                    signMsgVal = AppendParam(signMsgVal, "orderId", v_oid);  //商户订单号
                    signMsgVal = AppendParam(signMsgVal, "orderAmount", orderAmount);
                    signMsgVal = AppendParam(signMsgVal, "orderTime", orderTime);
                    signMsgVal = AppendParam(signMsgVal, "productName", productName);
                    signMsgVal = AppendParam(signMsgVal, "productNum", productNum);
                    signMsgVal = AppendParam(signMsgVal, "productId", productId);
                    signMsgVal = AppendParam(signMsgVal, "productDesc", productDesc);
                    signMsgVal = AppendParam(signMsgVal, "ext1", ext1);
                    signMsgVal = AppendParam(signMsgVal, "ext2", ext2);
                    signMsgVal = AppendParam(signMsgVal, "payType", payType);
                    signMsgVal = AppendParam(signMsgVal, "bankId", bankId);
                    signMsgVal = AppendParam(signMsgVal, "redoFlag", redoFlag);
                    signMsgVal = AppendParam(signMsgVal, "pid", pid);
                    signMsgVal = AppendParam(signMsgVal, "key", key);

                    md5string = Utils.MD5(signMsgVal).ToUpper();

                    strHiddenField.Append("<input type='hidden' name='inputCharset' value='" + inputCharset + "'>\n");
                    strHiddenField.Append("<input type='hidden' name='bgUrl' value='" + bgUrl + "'>\n");
                    strHiddenField.Append("<input type='hidden' name='pageUrl' value='" + pageUrl + "'>\n");
                    strHiddenField.Append("<input type='hidden' name='version' value='" + version + "'>\n");
                    strHiddenField.Append("<input type='hidden' name='language' value='" + language + "'>\n");
                    strHiddenField.Append("<input type='hidden' name='signType' value='" + signType + "'>\n");
                    strHiddenField.Append("<input type='hidden' name='signMsg' value='" + md5string + "'>\n");
                    strHiddenField.Append("<input type='hidden' name='merchantAcctId' value='" + merchantAcctId + "'>\n");
                    strHiddenField.Append("<input type='hidden' name='payerName' value='" + payerName + "'>\n");
                    strHiddenField.Append("<input type='hidden' name='payerContactType' value='" + payerContactType + "'>\n");
                    strHiddenField.Append("<input type='hidden' name='payerContact' value='" + payerContact + "'>\n");
                    strHiddenField.Append("<input type='hidden' name='orderId' value='" + v_oid + "'>\n");
                    strHiddenField.Append("<input type='hidden' name='orderAmount' value='" + orderAmount + "'>\n");
                    strHiddenField.Append("<input type='hidden' name='orderTime' value='" + orderTime + "'>\n");
                    strHiddenField.Append("<input type='hidden' name='productName' value='" + productName + "'>\n");
                    strHiddenField.Append("<input type='hidden' name='productNum' value='" + productNum + "'>\n");
                    strHiddenField.Append("<input type='hidden' name='productId' value='" + productId + "'>\n");
                    strHiddenField.Append("<input type='hidden' name='productDesc' value='" + productDesc + "'>\n");
                    strHiddenField.Append("<input type='hidden' name='ext1' value='" + ext1 + "'>\n");
                    strHiddenField.Append("<input type='hidden' name='ext2' value='" + ext2 + "'>\n");
                    strHiddenField.Append("<input type='hidden' name='payType' value='" + payType + "'>\n");
                    strHiddenField.Append("<input type='hidden' name='bankId' value='" + bankId + "'>\n");
                    strHiddenField.Append("<input type='hidden' name='redoFlag' value='" + redoFlag + "'>\n");
                    strHiddenField.Append("<input type='hidden' name='pid' value='" + pid + "'>\n");
                    break;
                case 110:  //快钱神州行
                    m_PayOnlineProviderUrl = "https://www.99bill.com/szxgateway/recvMerchantInfoAction.htm";
                    //生成返回URL
                    v_urlBuilder.Append("User/PayOnline/PayResult99billSzx.aspx");
                    v_url = v_urlBuilder.ToString();

                    merchantAcctId = v_mid; //神州行网关账户号
                    key = payOnlineKey; //设置人民币网关密钥
                    inputCharset = "3"; //1代表UTF-8; 2代表GBK; 3代表gb2312
                    bgUrl = ""; //服务器接受支付结果的后台地址
                    pageUrl = v_url; //接受支付结果的页面地址
                    version = "v2.0"; //网关版本.固定值
                    language = "1"; //1代表中文；2代表英文
                    signType = "1"; //签名类型.固定值
                    payerName = ""; //支付人姓名
                    payerContactType = ""; //支付人联系方式类型,1代表Email；2代表手机号
                    payerContact = ""; //支付人联系方式,只能选择Email或手机号
                    orderAmount = Convert.ToString(decimal.Ceiling(Convert.ToDecimal(v_amount) * 100)); //订单金额,以分为单位，必须是整型数字
                    orderTime = v_ymd + v_hms; //订单提交时间
                    productName = ""; //商品名称
                    productNum = ""; //商品数量
                    productId = ""; //商品代码
                    productDesc = ""; //商品描述
                    ext1 = ""; //扩展字段1
                    ext2 = ""; //扩展字段2
                    payType = "00"; //只能选择00,代表支持神州行卡和快钱帐户支付
                    string cardNumber = ""; //神州行卡序号,仅在商户定制了神州行卡密直连功能时填写
                    string cardPwd = ""; //神州行卡密码,仅在商户定制了神州行卡密直连功能时填写
                    //全额支付标志       ////0代表卡面额小于订单金额时返回支付结果为失败；1代表卡面额小于订单金额是返回支付结果为成功，同时订单金额和实际支付金额都为神州行卡的面额.如果商户定制神州行卡密直连时，本参数固定值为1
                    string fullAmountFlag = "0"; //0代表卡面额小于订单金额时返回支付结果为失败

                    //请务必按照如下顺序和规则组成加密串！
                    signMsgVal = "";
                    signMsgVal = AppendParam(signMsgVal, "inputCharset", inputCharset);
                    signMsgVal = AppendParam(signMsgVal, "bgUrl", bgUrl);
                    signMsgVal = AppendParam(signMsgVal, "pageUrl", pageUrl);
                    signMsgVal = AppendParam(signMsgVal, "version", version);
                    signMsgVal = AppendParam(signMsgVal, "language", language);
                    signMsgVal = AppendParam(signMsgVal, "signType", signType);
                    signMsgVal = AppendParam(signMsgVal, "merchantAcctId", merchantAcctId);
                    signMsgVal = AppendParam(signMsgVal, "payerName", payerName);
                    signMsgVal = AppendParam(signMsgVal, "payerContactType", payerContactType);
                    signMsgVal = AppendParam(signMsgVal, "payerContact", payerContact);
                    signMsgVal = AppendParam(signMsgVal, "orderId", v_oid);
                    signMsgVal = AppendParam(signMsgVal, "orderAmount", orderAmount);
                    signMsgVal = AppendParam(signMsgVal, "payType", payType);
                    signMsgVal = AppendParam(signMsgVal, "cardNumber", cardNumber);
                    signMsgVal = AppendParam(signMsgVal, "cardPwd", cardPwd);
                    signMsgVal = AppendParam(signMsgVal, "fullAmountFlag", fullAmountFlag);
                    signMsgVal = AppendParam(signMsgVal, "orderTime", orderTime);
                    signMsgVal = AppendParam(signMsgVal, "productName", productName);
                    signMsgVal = AppendParam(signMsgVal, "productNum", productNum);
                    signMsgVal = AppendParam(signMsgVal, "productId", productId);
                    signMsgVal = AppendParam(signMsgVal, "productDesc", productDesc);
                    signMsgVal = AppendParam(signMsgVal, "ext1", ext1);
                    signMsgVal = AppendParam(signMsgVal, "ext2", ext2);
                    signMsgVal = AppendParam(signMsgVal, "key", key);
                    
                    md5string = Utils.MD5(signMsgVal).ToUpper();

                    strHiddenField.Append("<input type='hidden' name='inputCharset' value='" + inputCharset + "'>\n");
                    strHiddenField.Append("<input type='hidden' name='bgUrl' value='" + bgUrl + "'>\n");
                    strHiddenField.Append("<input type='hidden' name='pageUrl' value='" + pageUrl + "'>\n");
                    strHiddenField.Append("<input type='hidden' name='version' value='" + version + "'>\n");
                    strHiddenField.Append("<input type='hidden' name='language' value='" + language + "'>\n");
                    strHiddenField.Append("<input type='hidden' name='signType' value='" + signType + "'>\n");
                    strHiddenField.Append("<input type='hidden' name='merchantAcctId' value='" + merchantAcctId + "'>\n");
                    strHiddenField.Append("<input type='hidden' name='payerName' value='" + payerName + "'>\n");
                    strHiddenField.Append("<input type='hidden' name='payerContactType' value='" + payerContactType + "'>\n");
                    strHiddenField.Append("<input type='hidden' name='payerContact' value='" + payerContact + "'>\n");
                    strHiddenField.Append("<input type='hidden' name='orderId' value='" + v_oid + "'>\n");
                    strHiddenField.Append("<input type='hidden' name='orderAmount' value='" + orderAmount + "'>\n");
                    strHiddenField.Append("<input type='hidden' name='orderTime' value='" + orderTime + "'>\n");
                    strHiddenField.Append("<input type='hidden' name='productName' value='" + productName + "'>\n");
                    strHiddenField.Append("<input type='hidden' name='productNum' value='" + productNum + "'>\n");
                    strHiddenField.Append("<input type='hidden' name='productId' value='" + productId + "'>\n");
                    strHiddenField.Append("<input type='hidden' name='productDesc' value='" + productDesc + "'>\n");
                    strHiddenField.Append("<input type='hidden' name='ext1' value='" + ext1 + "'>\n");
                    strHiddenField.Append("<input type='hidden' name='ext2' value='" + ext2 + "'>\n");
                    strHiddenField.Append("<input type='hidden' name='payType' value='" + payType + "'>\n");
                    strHiddenField.Append("<input type='hidden' name='fullAmountFlag' value='" + fullAmountFlag + "'>\n");
                    strHiddenField.Append("<input type='hidden' name='cardNumber' value='" + cardNumber + "'>\n");
                    strHiddenField.Append("<input type='hidden' name='cardPwd' value='" + cardPwd + "'>\n");
                    strHiddenField.Append("<input type='hidden' name='signMsg' value='" + md5string + "'>\n");
                    break;
                case 10: //财付通
                case 11: //中介
                case 13: //双接口

                    subject = Utils.CutString(subject, 0, 32); //财付通限制长度
                    
                    v_urlBuilder.Append("User/PayOnline/TenpayNotify.aspx?from=" + from + "&paymentplat=" + payPlatformId + "&userid=" + (new TemporaryVar()).UserID);
                    v_url = v_urlBuilder.ToString();

                    //创建RequestHandler实例
                    RequestHandler reqHandler = new RequestHandler(Context);
                    //初始化
                    reqHandler.init();
                    //设置密钥
                    reqHandler.setKey(payOnlineKey);
                    reqHandler.setGateUrl("https://gw.tenpay.com/gateway/pay.htm");


                    //-----------------------------
                    //设置支付参数
                    //-----------------------------
                    reqHandler.setParameter("partner", v_mid);		        //商户号
                    reqHandler.setParameter("out_trade_no", orderId);		//商家订单号
                    reqHandler.setParameter("total_fee", (Convert.ToDouble(v_amount) * 100).ToString());			        //商品金额,以分为单位
                    reqHandler.setParameter("return_url", v_ShowResultUrl);		    //交易完成后跳转的URL
                    reqHandler.setParameter("notify_url", v_url);		    //接收财付通通知的URL
                    reqHandler.setParameter("body", subject);	                    //商品描述
                    reqHandler.setParameter("bank_type", "DEFAULT");		    //银行类型(中介担保时此参数无效)
                    reqHandler.setParameter("spbill_create_ip", Page.Request.UserHostAddress);   //用户的公网ip，不是商户服务器IP
                    reqHandler.setParameter("fee_type", "1");                    //币种，1人民币
                    reqHandler.setParameter("subject", subject);              //商品名称(中介交易时必填)

                    //系统可选参数
                    reqHandler.setParameter("sign_type", "MD5");
                    reqHandler.setParameter("service_version", "1.0");
                    reqHandler.setParameter("input_charset", "UTF-8");
                    reqHandler.setParameter("sign_key_index", "1");

                    //业务可选参数

                    reqHandler.setParameter("attach", "");                      //附加数据，原样返回
                    reqHandler.setParameter("product_fee", "0");                 //商品费用，必须保证transport_fee + product_fee=total_fee
                    reqHandler.setParameter("transport_fee", "0");               //物流费用，必须保证transport_fee + product_fee=total_fee
                    reqHandler.setParameter("time_start", DateTime.Now.ToString("yyyyMMddHHmmss"));            //订单生成时间，格式为yyyymmddhhmmss
                    reqHandler.setParameter("time_expire", "");                 //订单失效时间，格式为yyyymmddhhmmss
                    reqHandler.setParameter("buyer_id", "");                    //买方财付通账号
                    reqHandler.setParameter("goods_tag", "");                   //商品标记
                    reqHandler.setParameter("trade_mode", payPlatformId==11?"2":((payPlatformId==13)?"3":"1"));                 //交易模式，1即时到账(默认)，2中介担保，3后台选择（买家进支付中心列表选择）
                    reqHandler.setParameter("transport_desc", "");              //物流说明
                    reqHandler.setParameter("trans_type", "1");                  //交易类型，1实物交易，2虚拟交易
                    reqHandler.setParameter("agentid", "");                     //平台ID
                    reqHandler.setParameter("agent_type", "");                  //代理模式，0无代理(默认)，1表示卡易售模式，2表示网店模式
                    reqHandler.setParameter("seller_id", "");                   //卖家商户号，为空则等同于partner

                    string requestUrl = reqHandler.getRequestURL();
                    m_PayOnlineProviderUrl = reqHandler.getGateUrl();
                    Hashtable ht = reqHandler.getAllParameters();
                    foreach (DictionaryEntry de in ht)
                    {
                        strHiddenField.Append("<input type=\"hidden\" name=\"" + de.Key + "\" value=\"" + de.Value + "\" >\n");  

                    }
                    

                    break;
         
                default:
                    JS.Alert(Utils.GetLanguageNode("//language/node[@name='user']/payonline/platiderr"));
                    break;
            }
            string newForm = string.Empty;
            //string newForm = "<form method=\"post\" action='" + m_PayOnlineProviderUrl + "' id=\"form2\" target=\"_blank\">";
            string redirectcft;
           
            redirectcft = "<!--<input type=\"submit\" id=\"submits\" onclick=\"$('#__VIEWSTATE').remove();this.form.target='_blank';this.form.action='" + m_PayOnlineProviderUrl + "'\" class=\"button\" value=\"确认支付\">";
            string endFrom = redirectcft + "  <input type=\"button\" class=\"button\" id=\"Cancel\" value=\"取消支付\" onclick=\"window.location.href='index.aspx'\" />-->";
            
                

           // endFrom += "</form>";
            m_HiddenValue = newForm + strHiddenField.ToString() + endFrom;

            //给页面赋值
            this.LabUserName.Text = (new TemporaryVar()).UserName;
            this.LabOrderID.Text = KSCMS.S("OrderID");
            this.LabMoney.Text = vmoney.ToString();
            this.LabRate.Text = rate.ToString()+"%";
            this.LabRealMoney.Text = v_amount.ToString();

            m_HiddenValue = "正在转向支付页面,请稍候...<script src='../ks_inc/jquery.js'></scri"+@"pt><form name='myform' id='myform' action='" + m_PayOnlineProviderUrl + "' method='get'>" + m_HiddenValue + "</form>";
            m_HiddenValue += @"<script>$(document).ready(function(){
                   $('#myform').submit();
                 });
             </scr"+@"ipt>";
            KSCMS.Die(m_HiddenValue);
         
            LabHiddenField.Text = m_HiddenValue;
        }

       
     
        /// <summary>
        /// 添加参数,惹参数值不为空串,则添加。反之,不添加。
        /// </summary>
        private StringBuilder AddParameter(StringBuilder buf,String parameterName,String parameterValue)
        {
            if (null == parameterValue || "".Equals(parameterValue))
            {
                return buf;
            }

            if ("".Equals(buf.ToString()))
            {
                buf.Append(parameterName);
                buf.Append("=");
                buf.Append(parameterValue);
            }
            else
            {
                buf.Append("&");
                buf.Append(parameterName);
                buf.Append("=");
                buf.Append(parameterValue);
            }
            return buf;
        }

</script>


</asp:Content>

