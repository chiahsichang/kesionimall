<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CallBack.aspx.cs" Inherits="Kesion.NET.WebSite.Api.alipay.AlipayCallBack" %>
<%@ Import Namespace="Kesion.Cache"%>
<%@ Import Namespace="Kesion.Publics"%>
<%@ Import Namespace="Kesion.Collection"%>
<%@ Import Namespace="System.Text"%>
<%@ Import Namespace="System.Collections.Generic"%>


<script runat="server" type="text/C#">
   protected void Page_Load(object sender, EventArgs e)
 
   {
       if (MyCache.GetAccountAPIConfig("alipay", "enable") != "true")
       {
           Utils.ShowError("对不起，本站没有开通支付宝快捷登录!", "error.gif", 2, KSCMS.GetInstallDir());
       }
    
       
         alipay_callback();
      


   }

   private void alipay_callback()
   {
        SortedDictionary<string, string> sPara = GetRequestGet();

        if (sPara.Count > 0)//判断是否有带返回参数
        {
            Com.Alipay.Notify aliNotify = new Com.Alipay.Notify();
            bool verifyResult = aliNotify.Verify(sPara, Request.QueryString["notify_id"], Request.QueryString["sign"]);

            if (verifyResult)//验证成功
            {
                /////////////////////////////////////////////////////////////////////////////////////////////////////////////
                //请在这里加上商户的业务逻辑程序代码

                //——请根据您的业务逻辑来编写程序（以下代码仅作参考）——
                //获取支付宝的通知返回参数，可参考技术文档中页面跳转同步通知参数列表
                string user_id = Request.QueryString["user_id"];//支付宝用户id
                string token = Request.QueryString["token"];	//授权令牌

                Session["alipay_user_id"] = user_id;
                Session["alipay_token"] = token;
                Session["real_name"] = KSCMS.S("real_name");

                Response.Redirect("AlipayBind.aspx");

                //执行商户的业务程序

                //可美化该页面
              //  Response.Write("验证成功<br />token:" + token);

                //etao专用
                if (Request.QueryString["target_url"] != "")
                {
                    //程序自动跳转到target_url参数指定的url去
                }

                //——请根据您的业务逻辑来编写程序（以上代码仅作参考）——

                /////////////////////////////////////////////////////////////////////////////////////////////////////////////
            }
            else//验证失败
            {
                Utils.ShowError("对不起，验证失败!", "error.gif", 2, KSCMS.GetInstallDir());
            }
        }
        else
        {
            Utils.ShowError("对不起，无返回参数!", "error.gif", 2, KSCMS.GetInstallDir());

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