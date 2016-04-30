<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Kesion.NET.WebSite.Api.alipay.AlipayLogin" %>
<%@ Import Namespace="Kesion.Cache"%>
<%@ Import Namespace="Kesion.Publics"%>
<%@ Import Namespace="System.Collections.Generic"%>
<%
    
    if (MyCache.GetAccountAPIConfig("alipay", "enable") != "true")
    {
        Utils.ShowError("对不起，本站没有开通支付宝快捷登录!", "error.gif", 2, KSCMS.GetInstallDir());
    }

    //如果不是跳窗登录的，记住来源页面
    if (string.IsNullOrEmpty((new TemporaryVar()).ComeUrl))
    {
        (new TemporaryVar()).ComeUrl = KSCMS.GetComeUrl();
    }

    
    ////////////////////////////////////////////请求参数////////////////////////////////////////////

    //选填参数//

    //防钓鱼时间戳
    string anti_phishing_key = "";
    //获取客户端的IP地址，建议：编写获取客户端IP地址的程序
    string exter_invoke_ip = "";
    //注意：
    //请慎重选择是否开启防钓鱼功能
    //exter_invoke_ip、anti_phishing_key一旦被设置过，那么它们就会成为必填参数
    //建议使用POST方式请求数据
    //示例：
    //exter_invoke_ip = "";
    //Service aliQuery_timestamp = new Service();
    //anti_phishing_key = aliQuery_timestamp.Query_timestamp();               //获取防钓鱼时间戳函数

    ////////////////////////////////////////////////////////////////////////////////////////////////

    //把请求参数打包成数组
    SortedDictionary<string, string> sParaTemp = new SortedDictionary<string, string>();
    sParaTemp.Add("anti_phishing_key", anti_phishing_key);
    sParaTemp.Add("exter_invoke_ip", exter_invoke_ip);

    //构造快捷登录接口表单提交HTML数据，无需修改
    Com.Alipay.Service ali = new Com.Alipay.Service();
    string sHtmlText = ali.Alipay_auth_authorize(sParaTemp);

    Response.Write(sHtmlText);

%>