<%@ Page Language="C#" MasterPageFile="~/User/UserNoLogin.master" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.User_PayOnline_Receive" Title="支付结果" Codebehind="PayRecive.aspx.cs" %>
<%@ Import Namespace="Kesion.Cache" %>
<%@ Import Namespace="Kesion.Publics" %>
<%@ Import Namespace="Kesion.BLL" %>
<%@ Import Namespace="Kesion.Components" %>
<%@ Import Namespace="System.Security.Cryptography" %>
<%@ Import Namespace="System.Collections.Generic" %>
<%@ Import Namespace="System.Data" %>
<asp:Content ID="Content1" ContentPlaceHolderID="KSContent" Runat="Server">

    <br /><br /><br />
<table class="border" cellSpacing="1" cellPadding="2" width="60%" align="center" border="0">
  <tr class="title"> 
    <td><b><font color="#FF0000">温馨提示：</font> 您网上在线支付情况反馈如下：</b></td>
 </tr>
 <tr class="tdbg"><td height="45">
      <p>
        <asp:Label ID="LblMsg" runat="server" Text=""></asp:Label>
	  </p>
     </td>
  </tr>
  <tr class="title">
   <td  height="22" align="center"><a href="../index.aspx">进入会员中心</a> | <a href="../../">返回首页</a>
   </td>
  </tr>
</table>

<script runat="server">
    string payOnlineShopID;
    string PayOnlineKey;
    PlatFormInfo payPlatform;
    StringBuilder message = new StringBuilder();
protected void Page_Load(object sender, EventArgs e)
 {
        int payPlatformId = Utils.StrToInt(KSCMS.S("PaymentPlat"),1);  //支付接口
        payPlatform = PlatForm.GetPlatFormById(payPlatformId);
        payOnlineShopID = payPlatform.AccountID;
        PayOnlineKey = payPlatform.Md5Key;
       // Page.Request.ContentEncoding = Encoding.GetEncoding("gb2312");
        switch (payPlatformId)
        {
            case 1: //网银在线支付
                ChainBank();
                break;
            case 10: //财付通即时到账
            case 11: //财付通担保
            case 13: //财付通双接口
                TenPay();
                break;
            case 8: //支付宝即时到账
            case 9:
            case 12:
                AliPay();
                break;
        }
}
/// <summary>
/// 财付通
/// </summary>
private void TenPay()
{        
    //创建ResponseHandler实例
    ResponseHandler resHandler = new ResponseHandler(Context);
    resHandler.setKey(PayOnlineKey);

    //判断签名
    if (resHandler.isTenpaySign())
    {

        ///通知id
        string notify_id = resHandler.getParameter("notify_id");
        //商户订单号
        string out_trade_no = resHandler.getParameter("out_trade_no");
        //财付通订单号
        string transaction_id = resHandler.getParameter("transaction_id");
        //金额,以分为单位
        double total_fee = Convert.ToDouble(resHandler.getParameter("total_fee"));
        total_fee = total_fee / 100;
        
        //如果有使用折扣券，discount有值，total_fee+discount=原请求的total_fee
        string discount = resHandler.getParameter("discount");
        //支付结果
        string trade_state = resHandler.getParameter("trade_state");
        //交易模式，1即时到账，2中介担保
        string trade_mode = resHandler.getParameter("trade_mode");

        if ("1".Equals(trade_mode))
        {       //即时到账 
            if ("0".Equals(trade_state))
            {

                PlatForm.UpdateUserMoney((new TemporaryVar()).UserName, out_trade_no, Utils.StrToFloat(total_fee), string.Format(Utils.GetLanguageNode("//language/node[@name='user']/payonline/payremark"), payPlatform.PlatName));
                if (KSCMS.S("from")=="shop")
                {
                    Kesion.APPCode.OrderProcess.PaySuccessSendNewOrderTips(out_trade_no); //订单付款成功提醒管理员
                    string orderTipsTp = Kesion.APPCode.OrderProcess.GetOrderPaySuccessTips(out_trade_no);  //提交订单，根据状态得到提示信息
                    message.Append(orderTipsTp);

                    
                    
                    /*message.Append(Utils.GetLanguageNode("//language/node[@name='user']/payonline/paysuccess"));
                    if (new TemporaryVar().FromPage == "3g")
                    {
                        
                        Response.Redirect("../../"+MyCache.GetCacheConfig(73)+"/order.aspx");
                    }
                    else
                    {
                        Response.Redirect("../shop/myorder.aspx");
                    }*/
                }
                else
                {
                    message.AppendFormat(Utils.GetLanguageNode("//language/node[@name='user']/payonline/allowmoney"), UserManage.GetUserInfo((new TemporaryVar()).UserName).Money);

                }

               // Response.Write("即时到帐付款成功");
                //给财付通系统发送成功信息，财付通系统收到此结果后不再进行后续通知

            }
            else
            {
                message.Append(Utils.GetLanguageNode("//language/node[@name='user']/payonline/payerror"));
                //Response.Write("即时到账支付失败");
            }

        }
        else if ("2".Equals(trade_mode))
        {  
            
            //中介担保
            if ("0".Equals(trade_state))
            {

                OrderProcess.UpdateOrderByWAIT_SELLER_SEND_GOODS(out_trade_no, Utils.StrToFloat(total_fee), transaction_id, "WAIT_SELLER_SEND_GOODS", payPlatform.ID);

                message.Append("中介担保付款成功");
                //给财付通系统发送成功信息，财付通系统收到此结果后不再进行后续通知

            }
            else
            {
               message.Append("交易状态：trade_state=" + trade_state);
            }
        }
    }
    else
    {
       // Response.Write("认证签名失败");
    }

    //获取debug信息,建议把debug信息写入日志，方便定位问题
    string debuginfo = resHandler.getDebugInfo();
    if (string.IsNullOrEmpty(message.ToString()))
    {
        message.Append(debuginfo);
    }

    if (new TemporaryVar().FromPage == "3g")
    {
        KSCMS.Die("<script>alert('" + Utils.RemoveHtml(message.ToString()).Replace("'", "\'") + "');location.href='../../" + MyCache.GetCacheConfig(73) + "/user.aspx';</" + "script>");
    }
    else
    {
        LblMsg.Text = message.ToString();
    }



} 
    
/// <summary>
/// 支付宝
/// </summary>
private void AliPay()
{
    string partner = string.Empty;
    if (PayOnlineKey.IndexOf("|") > 0)
    {
        string[] ArrMD5Key = PayOnlineKey.Split(new char[] { '|' });
        PayOnlineKey = ArrMD5Key[0];
        partner = ArrMD5Key[1];
    }

    SortedDictionary<string, string> sPara = GetRequestGet();
    if (sPara.Count > 0)//判断是否有带返回参数
    {

        AlipayNotify aliNotify = new AlipayNotify(partner, PayOnlineKey);
        bool verifyResult = aliNotify.Verify(sPara, Request.QueryString["notify_id"], Request.QueryString["sign"]);
       

        if (verifyResult)//验证成功
        {
            /////////////////////////////////////////////////////////////////////////////////////////////////////////////
            //请在这里加上商户的业务逻辑程序代码

            //——请根据您的业务逻辑来编写程序（以下代码仅作参考）——
            //获取支付宝的通知返回参数，可参考技术文档中页面跳转同步通知参数列表
            string trade_no = Utils.ChkSQL(Request.QueryString["trade_no"]);              //支付宝交易号
            string order_no = Utils.ChkSQL(Request.QueryString["out_trade_no"]);	        //获取订单号
            string total_fee = Request.QueryString["total_fee"];            //获取总金额
            string subject = Request.QueryString["subject"];                //商品名称、订单名称
            string body = Request.QueryString["body"];                      //商品描述、订单备注、描述
            string buyer_email = Request.QueryString["buyer_email"];        //买家支付宝账号
            string trade_status = Utils.ChkSQL(Request.QueryString["trade_status"]);      //交易状态

            if (Request.QueryString["trade_status"] == "TRADE_FINISHED" || Request.QueryString["trade_status"] == "TRADE_SUCCESS")
            {  //即时到账

                PlatForm.UpdateUserMoney((new TemporaryVar()).UserName, order_no, Utils.StrToFloat(total_fee), string.Format(Utils.GetLanguageNode("//language/node[@name='user']/payonline/payremark"), payPlatform.PlatName));
 
                //判断该笔订单是否在商户网站中已经做过处理
                //如果没有做过处理，根据订单号（out_trade_no）在商户网站的订单系统中查到该笔订单的详细，并执行商户的业务程序
                //如果有做过处理，不执行商户的业务程序
            }
            else if (Request.QueryString["trade_status"] == "WAIT_SELLER_SEND_GOODS") //非即时到账，等待发货
            {
                OrderProcess.UpdateOrderByWAIT_SELLER_SEND_GOODS(order_no, Utils.StrToFloat(total_fee), trade_no, trade_status, payPlatform.ID);
                
            }


            if (KSCMS.S("from") == "shop")
            {
			    Kesion.APPCode.OrderProcess.PaySuccessSendNewOrderTips(order_no); //订单付款成功提醒管理员
                string orderTipsTp = Kesion.APPCode.OrderProcess.GetOrderPaySuccessTips(order_no);  //提交订单，根据状态得到提示信息
                message.Append(orderTipsTp);
                
               // message.Append(Utils.GetLanguageNode("//language/node[@name='user']/payonline/paysuccess"));
               /* if (new TemporaryVar().FromPage == "3g")
                {

                    Response.Redirect("../../" + MyCache.GetCacheConfig(73) + "/order.aspx");
                }
                else
                {
                    Response.Redirect("../shop/myorder.aspx");
                }*/
            }
            else
            {
                message.AppendFormat(Utils.GetLanguageNode("//language/node[@name='user']/payonline/allowmoney"), UserManage.GetUserInfo((new TemporaryVar()).UserName).Money);

            }
            

            //打印页面
            //Response.Write("验证成功<br />");

            //——请根据您的业务逻辑来编写程序（以上代码仅作参考）——

            /////////////////////////////////////////////////////////////////////////////////////////////////////////////
        }
        else//验证失败
        {
            message.Append(Utils.GetLanguageNode("//language/node[@name='user']/payonline/payerror"));

        }
    }
    else
    {
        message.Append(Utils.GetLanguageNode("//language/node[@name='user']/payonline/paynobackparam"));
    }

    if (new TemporaryVar().FromPage == "3g")
    {
        KSCMS.Die("<script>alert('" + Utils.RemoveHtml(message.ToString()).Replace("'", "\'") + "');location.href='../../" + MyCache.GetCacheConfig(73) +"/user.aspx';</"+"script>");
    }
    else
    {
        LblMsg.Text = message.ToString();
    }

}   
 private void ChainBank(){ //网银
       string v_mid, v_oid, v_pmode, v_pstatus, v_pstring, v_amount, v_md5, v_moneytype;
    
        v_mid = payOnlineShopID;
        v_oid = Utils.Trim(Request["v_oid"]);
        v_md5 = Utils.Trim(Request["v_md5str"]);            //数字签名
        v_amount = Utils.Trim(Request["v_amount"]);         //支付金额
        v_pstatus = Utils.Trim(Request["v_pstatus"]);       //支付状态
        v_moneytype = Utils.Trim(Request["v_moneytype"]);   //支付币种
        v_pmode = Utils.Trim(Request["v_pmode"]);           //支付银行
        v_pstring = Utils.Trim(Request["v_pstring"]);       //支付结果说明

    string md5string = Utils.MD5(v_oid + v_pstatus + v_amount + v_moneytype + PayOnlineKey);

        StringBuilder message = new StringBuilder();
        if (md5string.ToUpper() == v_md5.ToUpper() && v_pstatus == "20")
        {
            PlatForm.UpdateUserMoney((new TemporaryVar()).UserName, v_oid, Convert.ToDouble(v_amount), string.Format(Utils.GetLanguageNode("//language/node[@name='user']/payonline/payremark"), payPlatform.PlatName));

            if (KSCMS.S("from") == "shop")
            {
                Kesion.APPCode.OrderProcess.PaySuccessSendNewOrderTips(v_oid); //订单付款成功提醒管理员

                string orderTipsTp = Kesion.APPCode.OrderProcess.GetOrderPaySuccessTips(v_oid);  //提交订单，根据状态得到提示信息
                message.Append(orderTipsTp);

                /*
                message.Append(Utils.GetLanguageNode("//language/node[@name='user']/payonline/paysuccess"));
                if (new TemporaryVar().FromPage == "3g")
                {

                    Response.Redirect("../../" + MyCache.GetCacheConfig(73) + "/order.aspx");
                }
                else
                {
                    Response.Redirect("../shop/myorder.aspx");
                }*/
            }
            else
            {
                message.AppendFormat(Utils.GetLanguageNode("//language/node[@name='user']/payonline/allowmoney"), UserManage.GetUserInfo((new TemporaryVar()).UserName).Money);

            }
        }
        else
        {
            message.Append(Utils.GetLanguageNode("//language/node[@name='user']/payonline/payerror"));
        }

        if (new TemporaryVar().FromPage == "3g")
        {
            KSCMS.Die("<script>alert('" + Utils.RemoveHtml(message.ToString()).Replace("'", "\'") + "');location.href='../../" + MyCache.GetCacheConfig(73) + "/user.aspx';</" + "script>");
        }
        else
        {
            LblMsg.Text = message.ToString();
        }
    }

 /// <summary>
 /// 获取支付宝GET过来通知消息，并以“参数名=参数值”的形式组成数组
 /// </summary>
 /// <returns>request回来的信息组成的数组</returns>
 public SortedDictionary<string, string> GetRequestGet()
 {
     int i = 0;
     SortedDictionary<string, string> sArray = new SortedDictionary<string, string>();
     NameValueCollection coll;
     //Load Form variables into NameValueCollection variable.
     coll = Request.QueryString;

     // Get names of all forms into a string array.
     String[] requestItem = coll.AllKeys;

     for (i = 0; i < requestItem.Length; i++)
     {
         
         
         sArray.Add(requestItem[i], Request.QueryString[requestItem[i]]);
     }

     return sArray;
 }
</script>
    
</asp:Content>