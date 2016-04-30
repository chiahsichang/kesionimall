<%@ WebHandler Language="C#" Class="UEditorHandler" %>

using System;
using System.Web;
using System.IO;
using System.Collections;
using Newtonsoft.Json;


using Kesion.Publics;
using Kesion.APPCode;
using Kesion.BLL;
using System.Web.SessionState;


public class UEditorHandler : IHttpHandler, IRequiresSessionState
{
    public void ProcessRequest(HttpContext context)
    {
        #region ==============KESION 修改 判断权限及获取上传目录======================
        string path = string.Empty;
        if (KSSecurity.chkCode() == true && KSSecurity.chkLogin() == true) //管理员上传目录
        {
            path = Kesion.APPCode.Public.GetUpfilesDir();
        }
        else if (CheckUserLogin.Check() == "success")  //会员上传目录
        {
            path = UserManage.GetUserUpfilesDir();
        }
        else
        {
            KSCMS.Die("nologin");
        }
       // path = path.TrimEnd('/');
        #endregion


        
        Handler action = null;
        switch (context.Request["action"])
        {
            case "config":
                action = new ConfigHandler(context);
                break;
            case "uploadimage":
                action = new UploadHandler(context, new UploadConfig()
                {
                    AllowExtensions = Config.GetStringList("imageAllowFiles"),
                   // PathFormat = Config.GetString("imagePathFormat"),
                    PathFormat = path + Config.GetString("imagePathFormat"),
                    SizeLimit = Config.GetInt("imageMaxSize"),
                    UploadFieldName = Config.GetString("imageFieldName")
                });
               
                break;
            case "uploadscrawl":
                action = new UploadHandler(context, new UploadConfig()
                {
                    AllowExtensions = new string[] { ".png" },
                   // PathFormat = Config.GetString("scrawlPathFormat"),
                    PathFormat = path + Config.GetString("scrawlPathFormat"),
                    SizeLimit = Config.GetInt("scrawlMaxSize"),
                    UploadFieldName = Config.GetString("scrawlFieldName"),
                    Base64 = true,
                    Base64Filename = "scrawl.png"
                });
                break;
            case "uploadvideo":
                action = new UploadHandler(context, new UploadConfig()
                {
                    AllowExtensions = Config.GetStringList("videoAllowFiles"),
                    //PathFormat = Config.GetString("videoPathFormat"),
                    PathFormat = path + Config.GetString("videoPathFormat"),
                    SizeLimit = Config.GetInt("videoMaxSize"),
                    UploadFieldName = Config.GetString("videoFieldName")
                });
                break;
            case "uploadfile":
                action = new UploadHandler(context, new UploadConfig()
                {
                    AllowExtensions = Config.GetStringList("fileAllowFiles"),
                   // PathFormat = Config.GetString("filePathFormat"),
                    PathFormat = path + Config.GetString("filePathFormat"),
                    SizeLimit = Config.GetInt("fileMaxSize"),
                    UploadFieldName = Config.GetString("fileFieldName")
                });
                break;
            case "listimage":
                if (KSSecurity.chkCode() == true && KSSecurity.chkLogin() == true) //管理员上传目录
                {
                    path = Kesion.Cache.MyCache.GetCacheConfig(0) + Kesion.Cache.MyCache.GetCacheConfig(22);
                }
                else if (CheckUserLogin.Check() == "success")  //会员上传目录
                {
                    path = Kesion.Cache.MyCache.GetCacheConfig(0) + Kesion.Cache.MyCache.GetCacheConfig(22)+"user/"+UserManage.GetUserInfo().UserID;
                }
               
                //action = new ListFileManager(context, path + Config.GetString("imageManagerListPath"), Config.GetStringList("imageManagerAllowFiles"));
                action = new ListFileManager(context, path, Config.GetStringList("imageManagerAllowFiles"));
                break;
            case "listfile":
                if (KSSecurity.chkCode() == true && KSSecurity.chkLogin() == true) //管理员上传目录
                {
                    path = Kesion.Cache.MyCache.GetCacheConfig(0) + Kesion.Cache.MyCache.GetCacheConfig(22);
                }
                else if (CheckUserLogin.Check() == "success")  //会员上传目录
                {
                    path = Kesion.Cache.MyCache.GetCacheConfig(0) + Kesion.Cache.MyCache.GetCacheConfig(22) + "user/" + UserManage.GetUserInfo().UserID;
                }
                //action = new ListFileManager(context, Config.GetString("fileManagerListPath"), Config.GetStringList("fileManagerAllowFiles"));
                action = new ListFileManager(context,path, Config.GetStringList("fileManagerAllowFiles"));
                break;
            case "catchimage":
                KSCMS.Die("");
                action = new CrawlerHandler(context);
                break;
            default:
                action = new NotSupportedHandler(context);
                break;
        }
        action.Process();
    }

    public bool IsReusable
    {
        get
        {
            return false;
        }
    }
}