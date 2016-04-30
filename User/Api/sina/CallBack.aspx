<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CallBack.aspx.cs" Inherits="Kesion.NET.WebSite.Api.sina.SinaCallBack" %>
<%@ Import Namespace="Kesion.Cache"%>
<%@ Import Namespace="Kesion.Publics"%>
<%@ Import Namespace="Kesion.Collection"%>
<%@ Import Namespace="System.Text"%>
<%@ Import Namespace="System.IO"%>
<%@ Import Namespace="Newtonsoft.Json"%>
<%@ Import Namespace="Newtonsoft.Json.Linq"%>


<script runat="server" type="text/C#">
   protected void Page_Load(object sender, EventArgs e)
 
   {
    if (MyCache.GetAccountAPIConfig("sina", "enable") != "true")
    {
        Utils.ShowError("对不起，本站没有开通新浪微博账号登录!", "error.gif", 2, KSCMS.GetInstallDir());
    }
    
        if (!string.IsNullOrEmpty(KSCMS.S("code")))
        {
            sina_callback();
        }
        else
        {
            Utils.ShowError("无返回code值!", "error.gif", 2, KSCMS.GetInstallDir());
        }


   }

   private void sina_callback()
   {
        string ApiID=MyCache.GetAccountAPIConfig("sina","apiid");
        string ApiKey=MyCache.GetAccountAPIConfig("sina","apikey");
        string CallBack = Utils.UrlEncode(MyCache.GetAccountAPIConfig("sina", "apireturnurl"));

        string token_url = "https://api.weibo.com/oauth2/access_token";
        string postParam= string.Concat("client_id=", ApiID, "&client_secret=", ApiKey, "&grant_type=authorization_code&redirect_uri=", CallBack, "&code=", KSCMS.S("code"));
        string result = Kesion.Collection.CollectionCommon.GetHttpPage(token_url, postParam);
        if (result.IndexOf("error") != -1)
        {
           Utils.ShowError("出错啦！授权失败！", "error.gif", 2, KSCMS.GetInstallDir());
        }
        else
        {
            JObject jsonObj = JObject.Parse(result);

            Session["sina_access_token"] = jsonObj["access_token"].ToString();
            Session["sinaid"] = jsonObj["uid"].ToString();

            if (Session["TokenFrom"] != null)
            {
                if (Session["TokenFrom"].ToString() == "admin")
                {
                    Kesion.NET.WebSite.APPCode.Api.CommonCls.SaveTokenToAccount("sina", jsonObj["access_token"].ToString(), jsonObj["uid"].ToString());
                    KSCMS.Die("<script>alert('恭喜，登录授权成功！');top.box.close();</"+"script>");
                }
            }

            KSCMS.W(@"<div style='margin-top:90px;color:#666;font-size:16px;text-align:center;'><img src='../images/loadingAnimation.gif'/><br/><br/>正在登录中，请稍候！！！如果长时间没有反应请<a href=""sinabind.aspx"" style='color:red'>点此跳转</a>。</div>");
            Response.Redirect("sinabind.aspx");
        }

        
        
    }


</script>