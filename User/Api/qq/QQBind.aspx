<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="QQBind.aspx.cs" Inherits="Kesion.NET.WebSite.Api.qq.QQBind" %>
<%@ Import Namespace="Kesion.Cache"%>
<%@ Import Namespace="Kesion.Publics"%>
<%@ Import Namespace="Kesion.Collection"%>
<%@ Import Namespace="Kesion.BLL"%>
<%@ Import Namespace="System.Text"%>
<%@ Import Namespace="System.Data"%>
<%@ Import Namespace="Newtonsoft.Json"%>
<%@ Import Namespace="Newtonsoft.Json.Linq"%>


<script runat="server" type="text/C#">
   protected void Page_Load(object sender, EventArgs e)
 
   {
    if (MyCache.GetAccountAPIConfig("qq", "enable") != "true")
    {
        Utils.ShowError("对不起，本站没有开通QQ账号登录!", "error.gif", 2, KSCMS.GetInstallDir());
    }
    if (Session["qqopenid"] == null || Session["access_token"]==null)
    {
        Utils.ShowError("没有返回openid!", "error.gif", 2, KSCMS.GetInstallDir());
    }
    else
    {
        string action = KSCMS.S("action");
        if (action == "check")
        {
            Kesion.NET.WebSite.APPCode.Api.CommonCls.BindByQQ(); 
            
        }else if (action=="doreg"){

            Kesion.NET.WebSite.APPCode.Api.CommonCls.DoRegSave(1);
               
        }else{
            string ApiID=MyCache.GetAccountAPIConfig("qq","apiid");
            string ApiKey=MyCache.GetAccountAPIConfig("qq","apikey");

            string graph_url = "https://graph.qq.com/user/get_user_info";
            graph_url += "?access_token=" + Session["access_token"].ToString() + "&oauth_consumer_key=" + ApiID + "&openid=" + Session["qqopenid"].ToString()+"&format=json";
            Uri url = new Uri(graph_url);
            string result = Kesion.Collection.CollectionCommon.GetHttpPage(url, "utf-8");
            JObject jsonObj = JObject.Parse(result);
            if (jsonObj["ret"].ToString() != "0")
            {
                Utils.ShowError("出错啦，出错原因：" + jsonObj["msg"].ToString(), "error.gif", 2, KSCMS.GetInstallDir());
            }
            else
            {
                string nickname = jsonObj["nickname"].ToString();
                string sex = jsonObj["gender"].ToString();
                string face = jsonObj["figureurl_2"].ToString();

                using (DataTable dt = DataFactory.GetDataTable("select top 1 * From KS_User Where qqopenid='" + Utils.ChkSQL(Session["qqopenid"].ToString()) + "'"))
                {
                    if (dt.Rows.Count <= 0)
                    {
                        if (CheckUserLogin.Check() == "success")
                        {
                            DataFactory.ExecuteNonQuery(string.Format(@"Update KS_User Set qqopenid='{0}',qqtoken='{1}' Where UserName='{2}'", Session["qqopenid"].ToString(), Session["access_token"].ToString(), (new TemporaryVar()).UserName));
                            JS.Message("恭喜，通过QQ账号登录成功！", "success.gif", string.Format(@"location.href='{0}user/ApiBind.aspx';", KSCMS.GetInstallDir()));

                        }
                        else
                        {
                            Kesion.NET.WebSite.APPCode.Api.CommonCls.DoBind(1, "使用 QQ 快速登录!", nickname, face, sex, Session["qqopenid"].ToString());
                        }
                    }
                    else
                    {
                        DataRow dr = dt.Rows[0];

                        Kesion.NET.WebSite.APPCode.Api.CommonCls.DoLogin(dr["username"].ToString(), dr["password"].ToString());
                        JS.Message("恭喜，通过QQ账号登录成功！", "success.gif", string.Format(@"location.href='{0}';", Kesion.NET.WebSite.APPCode.Api.CommonCls.GetLoginSuccessTurnUrl));
                    }
                }


            }
          
        }

    }

   }
    
  
</script>