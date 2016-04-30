<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CallBack.aspx.cs" Inherits="Kesion.NET.WebSite.Api.qq.QQCallBack" %>
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
    if (MyCache.GetAccountAPIConfig("qq", "enable") != "true")
    {
        Utils.ShowError("对不起，本站没有开通QQ账号登录!", "error.gif", 2, KSCMS.GetInstallDir());
    }
    if (Session["state"] == null)
    {
        Utils.ShowError("会话超时，请重新登录!", "error.gif", 2, KSCMS.GetInstallDir());
    }
    else
    {
        if (Session["state"].ToString() == KSCMS.S("state"))
        {
            qq_callback();
            qq_openid();
        }
        else
        {
            Utils.ShowError("会话超时，请重新登录!", "error.gif", 2, KSCMS.GetInstallDir());
        }
    }

   }
    
    private void qq_callback(){
        string ApiID=MyCache.GetAccountAPIConfig("qq","apiid");
        string ApiKey=MyCache.GetAccountAPIConfig("qq","apikey");
        string CallBack = Utils.UrlEncode(MyCache.GetAccountAPIConfig("qq", "apireturnurl"));

        string token_url = "https://graph.qq.com/oauth2.0/token";
        token_url += string.Concat("?grant_type=authorization_code&client_id=", ApiID, "&redirect_uri=", CallBack, "&client_secret=", ApiKey, "&code=", KSCMS.S("code"));
        Uri url = new Uri(token_url);
        string result = Kesion.Collection.CollectionCommon.GetHttpPage(url, "utf-8");
        if (result.IndexOf("callback") != -1)
        {
            result = Utils.ReplaceString(Utils.ReplaceString(result, "Callback(", string.Empty, true), ");", string.Empty, true);
            JObject jsonObj = JObject.Parse(result);
           Utils.ShowError(string.Format(@"出错啦！错别提示:<h3>Error:</h3>{0}<h3>Description:</h3>{1}", jsonObj["error"].ToString(), jsonObj["error_description"].ToString()), "error.gif", 2, KSCMS.GetInstallDir());
        }
        else
        {
            Hashtable ht = Utils.QueryStringToHashTable(result);
            Session["access_token"] = ht["access_token"].ToString();

           
            
            
        }

        
        
    }
    private void qq_openid()
    {
        if (Session["access_token"] == null)
        {
            Utils.ShowError("会话超时，请重新登录!", "error.gif", 2, KSCMS.GetInstallDir());
        }
        else
        {
            string graph_url = "https://graph.qq.com/oauth2.0/me";
            graph_url += "?access_token=" + Session["access_token"].ToString();
            Uri url = new Uri(graph_url);
            string result = Kesion.Collection.CollectionCommon.GetHttpPage(url, "utf-8");
            
             result = Utils.ReplaceString(Utils.ReplaceString(result, "Callback(", string.Empty, true), ");", string.Empty, true);
             JObject jsonObj = JObject.Parse(result);
            if (result.IndexOf("client_id") == -1)
            {
                Utils.ShowError(string.Format(@"出错啦！错别提示:<h3>Error:</h3>{0}<h3>Description:</h3>{1}", jsonObj["error"].ToString(), jsonObj["error_description"].ToString()), "error.gif", 2, KSCMS.GetInstallDir());

            }
            else
            {
                Session["qqopenid"] = jsonObj["openid"].ToString();

                if (Session["qqopenid"] == null)
                {
                    Utils.ShowError("出错啦，没有返回openid！", "error.gif", 2, KSCMS.GetInstallDir());

                }
                else
                {

                    if (Session["TokenFrom"] != null) //后台授权
                    {
                        if (Session["TokenFrom"].ToString() == "admin")
                        {
                            Kesion.NET.WebSite.APPCode.Api.CommonCls.SaveTokenToAccount("qq", Session["access_token"].ToString(), Session["qqopenid"].ToString());
                            KSCMS.Die("<script>alert('恭喜，登录授权成功！');top.box.close();</" + "script>");
                        }
                    }
                
                    
                    
                    KSCMS.W(@"<div style='margin-top:90px;color:#666;font-size:16px;text-align:center;'><img src='../images/loadingAnimation.gif'/><br/><br/>正在登录中，请稍候！！！如果长时间没有反应请<a href=""javascript:;"" onclick=""top.location.href='qqbind.aspx';"" style='color:red'>点此跳转</a>。</div>");
                    Response.Redirect("qqbind.aspx");
                }
                

            }
            
        }
        
    }
</script>