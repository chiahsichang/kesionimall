<%@ Page Language="C#" MasterPageFile="~/User/UserNoLogin.master" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.User_PayConfirm" Title="����֧��" Codebehind="PayConfirm.aspx.cs" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="Kesion.Cache" %>
<%@ Import Namespace="Kesion.Publics" %>
<%@ Import Namespace="Kesion.BLL" %>
<asp:Content ID="Content1" ContentPlaceHolderID="KSContent" Runat="Server">

<asp:Panel ID="PnlStep3" runat="server" Width="100%">

 <table  cellspacing="1" cellpadding="3" class="border" width="98%" align="center" border="0">
	 <tr class="title">
             <td colspan="2"> ȷ��֧��</td>
     </tr>
     <%if (!string.IsNullOrEmpty((new TemporaryVar()).UserName)){ %>
     <tr class="tdbg">
         <td class="lefttd splittd">�� �� ����</td>
         <td class="splittd">
          <asp:Label ID="LabUserName" runat="server" Text=""></asp:Label>
         </td>
     </tr>
     <%} %>
     <tr class="tdbg">
         <td class="lefttd splittd">֧����ţ�</td>
         <td class="splittd">
          <asp:Label ID="LabOrderID" runat="server" Text="0"></asp:Label>
          <asp:Label ID="LabShopInfo" runat="server" Text=""></asp:Label>
         </td>
     </tr>
     <tbody id="showrate" runat="server">
     <tr class="tdbg">
         <td class="lefttd splittd">��</td>
         <td class="splittd">
           <%=MyCache.GetCurrencySymbol %><asp:Label ID="LabMoney" runat="server" Text="0"></asp:Label>
          <%=MyCache.GetCurrencyUnit %>
         </td>
     </tr>
      
      <tr class="tdbg">
         <td class="lefttd splittd">�� �� �ѣ�</td>
         <td class="splittd">
          <asp:Label ID="LabRate" runat="server" Text="0"></asp:Label>
         </td>
     </tr>
     </tbody>
     <tr class="tdbg">
         <td class="lefttd splittd">ʵ��֧���� </td>
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

            string subject = "";    //����
            string v_oid = "";                 //�������
            string v_amount = "";              //ʵ��֧�����       
            string v_mid = "";                 //�̻����
            string v_url = "";                 //֧��������ɺ󷵻ص���url��֧�������POST��ʽ����
            string payOnlineKey = "";        //MD5˽Կ

            decimal vmoney = 0;           //֧�����   
            int payPlatformId = 0;           //֧��ƽ̨ID
            string md5string;             //����MD5У����
            string orderId;              //����ID
            string userName = "";          //��¼�û���
            string paymentNum = "";       //֧�����

            string m_PayOnlineProviderUrl = "";
            string m_HiddenValue = string.Empty;
            string partner = string.Empty;


            orderId = Utils.RemoveXss(Utils.ChkSQL(KSCMS.S("OrderId")));
            payPlatformId = Utils.StrToInt(KSCMS.S("platid")); 
            
            userName = (new TemporaryVar()).UserName;
            vmoney = Convert.ToDecimal(Utils.StrToFloat(Request.QueryString["Money"],0));

            #region �̳Ƕ���
            string from = KSCMS.S("from");
            string itemstr = string.Empty;
            if (from == "shop")
            {
                
                using (DataTable dt = DataFactory.GetDataTable("select top 1 * from ks_proorder where orderid='" + orderId + "'"))
                {
                    if (dt.Rows.Count <= 0)
                    {
                        Utils.ShowError("�Ҳ����ö������޷�֧��!", 1);
                    }
                    else
                    {
                       
                        DataRow dr = dt.Rows[0];
                        if (Utils.StrToFloat(dr["MoneyReceipt"].ToString()) >= Utils.StrToFloat(dr["OrderTotalPrice"].ToString()))
                        {
                            Utils.ShowError("�ö�����֧�����ˣ�����Ҫ��֧��!", 1);
                        }
                        else if (dr["status"].ToString() == "2")
                        {
                            Utils.ShowError("�ö����ѽ��壬������֧����!", 1);
                        }
                        else if (dr["status"].ToString() == "3")
                        {
                            Utils.ShowError("�ö�����ʧЧ��������֧����!", 1);
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
                        this.LabShopInfo.Text = "<br/><strong>������Ʒ��</strong><span class='tips'><br/>"+itemstr+"</span>";

                        if (Utils.StrToInt(dr["IsFrontPay"].ToString()) == 0)
                        {
                            vmoney = Convert.ToDecimal(Convert.ToDecimal(dr["OrderTotalPrice"].ToString()) - Convert.ToDecimal(dr["MoneyReceipt"].ToString()));
                        }
                        else if (Utils.StrToInt(dr["IsFrontPay"].ToString()) == 1) //ֻ����֧������
                        {
                            vmoney = Utils.StrToDecimal(dr["FrontMoney"].ToString());
                        }
                        else //����֧������
                        {
                            vmoney = Utils.StrToDecimal(KSCMS.S("money"));
                            if (vmoney < Utils.StrToDecimal(dr["FrontMoney"].ToString()))
                            {
                                Utils.ShowError("�Բ��𣬱�����������Ҫ֧����" + Kesion.APPCode.Public.ReturnShopPrice(Utils.StrToDecimal(dr["FrontMoney"].ToString())) + "Ԫ����!",6);
                            }
                            else if (vmoney > Convert.ToDecimal(Convert.ToDecimal(dr["OrderTotalPrice"].ToString()) - Convert.ToDecimal(dr["MoneyReceipt"].ToString())))
                            {
                                Utils.ShowError("�Բ��𣬱�����ֻ��Ҫ֧����" + Kesion.APPCode.Public.ReturnShopPrice(Convert.ToDecimal(Convert.ToDecimal(dr["OrderTotalPrice"].ToString()) - Convert.ToDecimal(dr["MoneyReceipt"].ToString()))) + "Ԫ!", 6);
  
                            }
                        }

                        #region ѡ���տ��˺�
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
            else if (from == "recharge")   //����������߳�ֵ��
            {
                
                using (DataTable dt = DataFactory.GetDataTable("Select top 1 * From KS_RechargeRecords Where OrderID='" + orderId + "'"))
                {
                    if (dt.Rows.Count <= 0)
                    {
                        Utils.ShowError("�Ҳ����ö������޷�֧��!", 1);
                    }
                    else
                    {
                        DataRow dr = dt.Rows[0];
                        if (dr["status"].ToString() != "0")
                        {
                            Utils.ShowError("�ö�����֧������������֧����!", 1);
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

            double realmoney = Convert.ToDouble(vmoney);  //ʵ�����˽��,����������
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
                Utils.ShowError("֧�����̫С!",6);
                return;
            }

            paymentNum = v_oid;


            DateTime datatime = DateTime.Now;
            string v_hms = datatime.ToString("HHmmss", System.Globalization.DateTimeFormatInfo.InvariantInfo);
            string v_ymd = datatime.ToString("yyyyMMdd", System.Globalization.DateTimeFormatInfo.InvariantInfo);

            StringBuilder strHiddenField = new StringBuilder();
            StringBuilder md5Builder = new StringBuilder();
            StringBuilder v_urlBuilder = new StringBuilder();    //���췵��URL

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
                subject = "������Ʒ��" + Utils.CutStr(itemstr.Replace("<br/>", " "),200);
            }
            else
            {
                subject = "��" + MyCache.GetCacheConfig(1) + "�����߳�ֵ�������ţ�" + v_oid;

                if (from != "recharge")
                {
                    addToRechargeRecords(orderId, Convert.ToDouble(v_amount),realmoney, "Ԥ�������߳�ֵ��", payPlatformId);
                }
                
            }
            switch (payPlatformId)
            {
                case 1:    //��������
                    m_PayOnlineProviderUrl = "https://pay3.chinabank.com.cn/PayGate";
                    //����MD5У�������ַ���
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
                    
                case 2://'�й�����֧����
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

                case 3://�Ϻ���Ѹ
                    m_PayOnlineProviderUrl = "http://pay.ips.com.cn/ipayment.aspx";
                    //m_PayOnlineProviderUrl = "http://pay.ips.net.cn/ipayment.aspx";  //���Խӿڣ���ϲ����ʺŲ���
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
                case 4://����֧��
                    m_PayOnlineProviderUrl = "http://www.yeepay.com/Pay/WestPayReceiveOrderFromMerchant.asp";
                    v_urlBuilder.Append("User/PayOnline/PayResultYeepay.aspx");
                    v_url = v_urlBuilder.ToString();

                    strHiddenField.Append("<input type='hidden' name='MerchantID' value='" + v_mid + "'>");
                    strHiddenField.Append("<input type='hidden' name='OrderNumber' value='" + v_oid + "'>");
                    strHiddenField.Append("<input type='hidden' name='OrderAmount' value='" + v_amount + "'>");
                    strHiddenField.Append("<input type='hidden' name='PostBackURL' value='" + v_url + "'>");
                    break;

                case 5://�׸�ͨ
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

                case 6://����֧��
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
                case 8:   //֧������ʱ����
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
                case 12:  //֧������������

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
                case 9:    //֧����˫�ӿ�
                    m_PayOnlineProviderUrl = "https://mapi.alipay.com/gateway.do?_input_charset=utf-8";
                    v_urlBuilder.Append("User/PayOnline/AlipayNotify1.aspx?from=" + from + "&paymentplat=" + payPlatformId + "&userid=" + (new TemporaryVar()).UserID);
                    v_url = v_urlBuilder.ToString();


                    //��������������Ʒ�����
                    if (orderId.Substring(1,2) == "0P")
                    {
                        isFabrication = true;   //��Ա��ֵ����Ϊ������Ʒ
                    }
                    else
                    {
                        isFabrication = false;   //��ⶩ���е���Ʒ�Ƿ���������Ʒ
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
                case 7:      //��Ǯ֧��
                    m_PayOnlineProviderUrl = "https://www.99bill.com/gateway/recvMerchantInfoAction.htm";
                    //���ɷ���URL
                    v_urlBuilder.Append("User/PayOnline/PayResult99bill.aspx");
                    v_url = v_urlBuilder.ToString();

                    string merchantAcctId = v_mid;   //�����˻���
                    string key = payOnlineKey; //������Կ
                    string inputCharset = "3"; //1����UTF-8; 2����GBK; 3����gb2312
                    string pageUrl = v_url; //����֧�������ҳ���ַ
                    string bgUrl = ""; //����������֧������ĺ�̨��ַ
                    string version = "v2.0"; //���ذ汾.�̶�ֵ
                    string language = "1"; //1�������ģ�2����Ӣ��
                    string signType = "1"; //1����MD5ǩ��
                    string payerName = ""; //֧��������
                    string payerContactType = ""; //֧������ϵ��ʽ���� 1����Email��2�����ֻ���
                    string payerContact = ""; //֧������ϵ��ʽ,ֻ��ѡ��Email���ֻ���
                    string orderAmount = Convert.ToString(decimal.Ceiling(Convert.ToDecimal(v_amount) * 100)); //�������,�Է�Ϊ��λ
                    string orderTime = v_ymd + v_hms; //�����ύʱ��,14λ����
                    string productName = ""; //��Ʒ����
                    string productNum = ""; //��Ʒ����
                    string productId = ""; //��Ʒ����
                    string productDesc = ""; //��Ʒ����
                    string ext1 = ""; //��չ�ֶ�1,��֧��������ԭ�����ظ��̻�
                    string ext2 = ""; //��չ�ֶ�2
                    string payType = "00"; //֧����ʽ,00�����֧��,��ʾ��Ǯ֧�ֵĸ���֧����ʽ,11���绰����֧��,12����Ǯ�˻�֧��,13������֧��,14��B2B֧��
                    string bankId = ""; //���д���,ʵ��ֱ����ת������ҳ��ȥ֧��,�������μ� �ӿ��ĵ����д����б�,ֻ��payType=10ʱ�������ò���
                    string redoFlag = "1"; //ͬһ������ֹ�ظ��ύ��־:1����ͬһ������ֻ�����ύ1��,0��ʾͬһ��������û��֧���ɹ���ǰ���¿��ظ��ύ���
                    string pid = ""; //��Ǯ�ĺ��������˻���

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
                    signMsgVal = AppendParam(signMsgVal, "orderId", v_oid);  //�̻�������
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
                case 110:  //��Ǯ������
                    m_PayOnlineProviderUrl = "https://www.99bill.com/szxgateway/recvMerchantInfoAction.htm";
                    //���ɷ���URL
                    v_urlBuilder.Append("User/PayOnline/PayResult99billSzx.aspx");
                    v_url = v_urlBuilder.ToString();

                    merchantAcctId = v_mid; //�����������˻���
                    key = payOnlineKey; //���������������Կ
                    inputCharset = "3"; //1����UTF-8; 2����GBK; 3����gb2312
                    bgUrl = ""; //����������֧������ĺ�̨��ַ
                    pageUrl = v_url; //����֧�������ҳ���ַ
                    version = "v2.0"; //���ذ汾.�̶�ֵ
                    language = "1"; //1�������ģ�2����Ӣ��
                    signType = "1"; //ǩ������.�̶�ֵ
                    payerName = ""; //֧��������
                    payerContactType = ""; //֧������ϵ��ʽ����,1����Email��2�����ֻ���
                    payerContact = ""; //֧������ϵ��ʽ,ֻ��ѡ��Email���ֻ���
                    orderAmount = Convert.ToString(decimal.Ceiling(Convert.ToDecimal(v_amount) * 100)); //�������,�Է�Ϊ��λ����������������
                    orderTime = v_ymd + v_hms; //�����ύʱ��
                    productName = ""; //��Ʒ����
                    productNum = ""; //��Ʒ����
                    productId = ""; //��Ʒ����
                    productDesc = ""; //��Ʒ����
                    ext1 = ""; //��չ�ֶ�1
                    ext2 = ""; //��չ�ֶ�2
                    payType = "00"; //ֻ��ѡ��00,����֧�������п��Ϳ�Ǯ�ʻ�֧��
                    string cardNumber = ""; //�����п����,�����̻������������п���ֱ������ʱ��д
                    string cardPwd = ""; //�����п�����,�����̻������������п���ֱ������ʱ��д
                    //ȫ��֧����־       ////0�������С�ڶ������ʱ����֧�����Ϊʧ�ܣ�1�������С�ڶ�������Ƿ���֧�����Ϊ�ɹ���ͬʱ��������ʵ��֧����Ϊ�����п������.����̻����������п���ֱ��ʱ���������̶�ֵΪ1
                    string fullAmountFlag = "0"; //0�������С�ڶ������ʱ����֧�����Ϊʧ��

                    //����ذ�������˳��͹�����ɼ��ܴ���
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
                case 10: //�Ƹ�ͨ
                case 11: //�н�
                case 13: //˫�ӿ�

                    subject = Utils.CutString(subject, 0, 32); //�Ƹ�ͨ���Ƴ���
                    
                    v_urlBuilder.Append("User/PayOnline/TenpayNotify.aspx?from=" + from + "&paymentplat=" + payPlatformId + "&userid=" + (new TemporaryVar()).UserID);
                    v_url = v_urlBuilder.ToString();

                    //����RequestHandlerʵ��
                    RequestHandler reqHandler = new RequestHandler(Context);
                    //��ʼ��
                    reqHandler.init();
                    //������Կ
                    reqHandler.setKey(payOnlineKey);
                    reqHandler.setGateUrl("https://gw.tenpay.com/gateway/pay.htm");


                    //-----------------------------
                    //����֧������
                    //-----------------------------
                    reqHandler.setParameter("partner", v_mid);		        //�̻���
                    reqHandler.setParameter("out_trade_no", orderId);		//�̼Ҷ�����
                    reqHandler.setParameter("total_fee", (Convert.ToDouble(v_amount) * 100).ToString());			        //��Ʒ���,�Է�Ϊ��λ
                    reqHandler.setParameter("return_url", v_ShowResultUrl);		    //������ɺ���ת��URL
                    reqHandler.setParameter("notify_url", v_url);		    //���ղƸ�֪ͨͨ��URL
                    reqHandler.setParameter("body", subject);	                    //��Ʒ����
                    reqHandler.setParameter("bank_type", "DEFAULT");		    //��������(�н鵣��ʱ�˲�����Ч)
                    reqHandler.setParameter("spbill_create_ip", Page.Request.UserHostAddress);   //�û��Ĺ���ip�������̻�������IP
                    reqHandler.setParameter("fee_type", "1");                    //���֣�1�����
                    reqHandler.setParameter("subject", subject);              //��Ʒ����(�н齻��ʱ����)

                    //ϵͳ��ѡ����
                    reqHandler.setParameter("sign_type", "MD5");
                    reqHandler.setParameter("service_version", "1.0");
                    reqHandler.setParameter("input_charset", "UTF-8");
                    reqHandler.setParameter("sign_key_index", "1");

                    //ҵ���ѡ����

                    reqHandler.setParameter("attach", "");                      //�������ݣ�ԭ������
                    reqHandler.setParameter("product_fee", "0");                 //��Ʒ���ã����뱣֤transport_fee + product_fee=total_fee
                    reqHandler.setParameter("transport_fee", "0");               //�������ã����뱣֤transport_fee + product_fee=total_fee
                    reqHandler.setParameter("time_start", DateTime.Now.ToString("yyyyMMddHHmmss"));            //��������ʱ�䣬��ʽΪyyyymmddhhmmss
                    reqHandler.setParameter("time_expire", "");                 //����ʧЧʱ�䣬��ʽΪyyyymmddhhmmss
                    reqHandler.setParameter("buyer_id", "");                    //�򷽲Ƹ�ͨ�˺�
                    reqHandler.setParameter("goods_tag", "");                   //��Ʒ���
                    reqHandler.setParameter("trade_mode", payPlatformId==11?"2":((payPlatformId==13)?"3":"1"));                 //����ģʽ��1��ʱ����(Ĭ��)��2�н鵣����3��̨ѡ����ҽ�֧�������б�ѡ��
                    reqHandler.setParameter("transport_desc", "");              //����˵��
                    reqHandler.setParameter("trans_type", "1");                  //�������ͣ�1ʵ�ｻ�ף�2���⽻��
                    reqHandler.setParameter("agentid", "");                     //ƽ̨ID
                    reqHandler.setParameter("agent_type", "");                  //����ģʽ��0�޴���(Ĭ��)��1��ʾ������ģʽ��2��ʾ����ģʽ
                    reqHandler.setParameter("seller_id", "");                   //�����̻��ţ�Ϊ�����ͬ��partner

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
           
            redirectcft = "<!--<input type=\"submit\" id=\"submits\" onclick=\"$('#__VIEWSTATE').remove();this.form.target='_blank';this.form.action='" + m_PayOnlineProviderUrl + "'\" class=\"button\" value=\"ȷ��֧��\">";
            string endFrom = redirectcft + "  <input type=\"button\" class=\"button\" id=\"Cancel\" value=\"ȡ��֧��\" onclick=\"window.location.href='index.aspx'\" />-->";
            
                

           // endFrom += "</form>";
            m_HiddenValue = newForm + strHiddenField.ToString() + endFrom;

            //��ҳ�渳ֵ
            this.LabUserName.Text = (new TemporaryVar()).UserName;
            this.LabOrderID.Text = KSCMS.S("OrderID");
            this.LabMoney.Text = vmoney.ToString();
            this.LabRate.Text = rate.ToString()+"%";
            this.LabRealMoney.Text = v_amount.ToString();

            m_HiddenValue = "����ת��֧��ҳ��,���Ժ�...<script src='../ks_inc/jquery.js'></scri"+@"pt><form name='myform' id='myform' action='" + m_PayOnlineProviderUrl + "' method='get'>" + m_HiddenValue + "</form>";
            m_HiddenValue += @"<script>$(document).ready(function(){
                   $('#myform').submit();
                 });
             </scr"+@"ipt>";
            KSCMS.Die(m_HiddenValue);
         
            LabHiddenField.Text = m_HiddenValue;
        }

       
     
        /// <summary>
        /// ��Ӳ���,�ǲ���ֵ��Ϊ�մ�,����ӡ���֮,����ӡ�
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

