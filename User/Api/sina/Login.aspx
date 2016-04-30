<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Kesion.NET.WebSite.Api.sina.SinaLogin" %>
<%@ Import Namespace="Kesion.Cache"%>
<%@ Import Namespace="Kesion.Publics"%>
<%
    
    if (MyCache.GetAccountAPIConfig("sina", "enable") != "true")
    {
        Utils.ShowError("对不起，本站没有开通新浪微博账号登录!", "error.gif", 2, KSCMS.GetInstallDir());
    }

    //如果不是跳窗登录的，记住来源页面
    if (string.IsNullOrEmpty((new TemporaryVar()).ComeUrl))
    {
        (new TemporaryVar()).ComeUrl = KSCMS.GetComeUrl();
    }

    Session["TokenFrom"] = KSCMS.S("tokenfrom");  //标注后台登录
    
    string ApiID=MyCache.GetAccountAPIConfig("sina","apiid");
    string ApiKey=MyCache.GetAccountAPIConfig("sina","apikey");
    string CallBack=Utils.UrlEncode(MyCache.GetAccountAPIConfig("sina","apireturnurl"));

    string url = "https://api.weibo.com/oauth2/authorize?client_id=" + ApiID + "&redirect_uri=" + CallBack ;
    KSCMS.W(@"<div style='margin-top:90px;color:#666;font-size:16px;text-align:center;'><img src='../images/loadingAnimation.gif'/><br/><br/>正在转向新浪微博登录授权页面，请稍候！！！如果长时间没有反应请<a href=""javascript:;"" onclick=""top.location.href='" + url + @"';"" style='color:red'>点此跳转</a>。</div>");

    Response.Redirect(url);

%>