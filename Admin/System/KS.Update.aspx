<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="KS.Update.aspx.cs" Inherits="Kesion.NET.WebSite.Update" %>
<%@ Import Namespace="Kesion.Cache" %>
<%@ Import Namespace="Kesion.Publics" %>
<%@ Import Namespace="Kesion.BLL" %>
<%@ Import Namespace="Kesion.HtmlTags" %>
<%@ Import Namespace="System.Security.Cryptography" %>
<%@ Import Namespace="System.Collections.Generic" %>
<%@ Import Namespace="System.Net" %>
<%@ Import Namespace="System.IO" %>
<%@ Import Namespace="System.Xml" %>
<script runat="server">
 private const bool EnabledAutoUpdate = true;    //是否允许在线检查升级 true允许 false 不允许
 private const string updateUrl = "http://vip.kesion.com/netupdate.aspx";//升级配置的XML文件地址 
 private const string downUrl = "http://vip.kesion.com/netpatch/";  //官方远程文件更新列表地址,必须/结束
 private string tempDownFolder = MyCache.GetCacheConfig(0) + MyCache.GetCacheConfig(22) + "/update/"; // 下载存放的本地临时目录

 private string localversion;

 private string action = string.Empty;
 XmlDocument xmlDoc = new XmlDocument();
 private StringBuilder sb = new StringBuilder();

 private string newVersion = string.Empty;
 private string newVersionUpdateDate = string.Empty;

    
protected void Page_Load(object sender, EventArgs e)
 {
     action = KSCMS.S("action").ToLower();
     switch (action)
     {
         case "check":
             checkUpdate();
             break;
         case "showupdateinfo":
             showUpdateInfo();
             break;
         case "showintro":
             showIntro();
             break;
        
     }
    
 }

private void initialRemoteXML()
{
    localversion = Utils.GetSysInfo("//sysinfo/version"); //本地版本号

    int findNum = 0;
    string newLocalVersion = string.Empty;
    for (int i = 0; i < localversion.Length; i++)
    {
        if (localversion[i] == '.' && findNum == 0)
        {
            newLocalVersion = newLocalVersion + localversion[i];
            findNum++;
        }
        else if (localversion[i] == '.')
        {
        }
        else
        {
            newLocalVersion = newLocalVersion + localversion[i];
        }
    }

    string URL = updateUrl + "?v=" + newLocalVersion + "&b=" + Utils.GetSysInfo("//sysinfo/isbusiness") + "&d=" + Request.Url.Host.Replace("www.", string.Empty);
    //使用rssURL的值建立了一个WebRequest项              
    WebRequest myRequest = WebRequest.Create(URL);
    //WebRequest请求的响应将会被放到一个WebResponse对象myResponse里,然后这个WebResponse对象被用来建立一个流来取出XML的值                       
    WebResponse myResponse = myRequest.GetResponse();   
    Stream stream = myResponse.GetResponseStream();
    //使用一个XmlDocument对象rssDoc来存储流中的XML内容。XmlDocument对象用来调入XML的内容    
    xmlDoc.Load(stream);
    
   

}
public void checkUpdate() //检查是否需要更新
{
    if (EnabledAutoUpdate == false)
    {
        KSCMS.Die("enabled");
    }
    else
    {
        initialRemoteXML();
          
        XmlNodeList xnl = xmlDoc.GetElementsByTagName("item");

        for (int i = xnl.Count - 1; i >= 0; i--)//循环后获取最相邻更新版本
        {
            
            string s1 = xmlDoc.SelectSingleNode("//root/item[@id='" + i + "']").ChildNodes.Item(2).InnerText;
            int s2 = Convert.ToInt32(s1.Replace(".", string.Empty));
            int s3 = Convert.ToInt32(localversion.Replace(".", string.Empty));


            if (s2 > s3)//远程版本大于本地版本
            {
                KSCMS.Die("true");
                
               

            }

        }
        
    }
    KSCMS.Die("false");

}
private void showIntro()
{
   
    initialRemoteXML();
    XmlNode node = xmlDoc.SelectSingleNode(@"//root/item[@id='" + Utils.StrToInt(KSCMS.S("id"))+"']");
    if (node != null)
    {
        XmlElement xe = (XmlElement)node;
        sb.Append(@"<style>
h1{margin:3px 0px 0px 10px;padding:0px;border-bottom:1px solid #cccccc;height:25px;line-height:25px;font-weight:bold;font-size:14px;}
.listinfo{margin-left:10px}
.listinfo ul{margin:0px;padding:0px}
.listinfo li{line-height:23px;background:url(/admin/images/bullet2.gif) no-repeat 0px 7px;padding-left:10px}
</style>");
        sb.AppendFormat(@"<h1>更新列表<span style='color:#FF6600'>(更新时间:{0})</span></h1>", Convert.ToDateTime(xe.SelectSingleNode("adddate").InnerText).ToShortDateString());
        sb.AppendLine("<div class='listinfo'>");
        sb.AppendLine("<ul>");
        sb.Append(xe.SelectSingleNode("message").InnerText);
        sb.AppendLine("</ul>");
        sb.AppendLine("</div>");
    }

}
private void showUpdateInfo()
{
    initialRemoteXML();
    sb.Append("<table width='96%' style='margin-top:15px' align='center'>");
    int ii = 0;

    XmlNodeList nodelist = xmlDoc.DocumentElement.SelectNodes(@"//root/item");
     foreach (XmlNode node in nodelist)
     {

         XmlElement xe = (XmlElement)node;

         string s1 = xe.SelectSingleNode("version").InnerText;
         int s2 = Convert.ToInt32(s1.Replace(".", string.Empty));
         int s3 = Convert.ToInt32(localversion.Replace(".", string.Empty));


         if (s2 > s3)//远程版本大于本地版本
         {
             ii++;

             sb.Append("<tr class='tdbg'>");
             sb.Append("<td class='splittd' height='23' style='width:20px'><strong>" + ii + "、</strong></td>");
             sb.Append(" <td class='splittd' style='text-align:left'>名称：<font color=green>" + xe.SelectSingleNode("title").InnerText + @"</font> <a href='javascript:;' onclick=""jQuery('#v" + ii + @"').toggle();"">说明</a></td>");
             sb.Append(" <td class='splittd'>补丁号：<font color=red>v" + xe.SelectSingleNode("version").InnerText + "</font> 适合版本：<font color=red>" + xe.SelectSingleNode("forversion").InnerText + "</font></td>");
             sb.Append(" <td class='splittd'>时间：<font color=red>" + Convert.ToDateTime(xe.SelectSingleNode("adddate").InnerText).ToShortDateString() + "</font></td>");
             sb.Append(" <td class='splittd' style='text-align:center'>");
             if (ii == 1)
             {
                 if (xe.SelectSingleNode("allowupdateonline").InnerText.Trim().ToLower() == "true")
                 {
                     sb.Append(@"<input type='button' value='下载更新' onclick=""location.href='KS.Update.aspx?id="+xe.SelectSingleNode("@id").InnerText+@"&action=begindown';"" class='button'/>");
                 }
                 else
                 {
                     sb.Append("<label style='color:#ff6600'>该补丁不支持在线升级，<br/>请到 <a style='color:#ff6600' href='http://www.kesion.com' target='_blank'>http://www.kesion.com</a> 下载补丁包手工升级。</label>");
                 }
             }
             else
             {
                 sb.Append("<label style='color:#999'>---</label>");
             }

             sb.Append(" </td>");
             sb.Append("</tr>");
             if (ii == 1)
             {
                 sb.Append("<tbody id='v" + ii + "'>");
             }
             else
             {
                 sb.Append("<tbody style='display:none' id='v" + ii + "'>");
             }
             sb.Append("<tr class='tdbg'><td colspan=5 class='bborder'><iframe src='KS.Update.aspx?action=showintro&id=" + xe.SelectSingleNode("@id").InnerText + "' frameborder='0' width='100%' height='180' scrolling='auto'></iframe></td></tr></tbody>");

         }
     }
    

    sb.Append("</table>");
    
}


    
    //开始下载文件
 private void beginDown(){
     int errNum = 0;
     int succNum = 0;
     initialRemoteXML();
    XmlNode node = xmlDoc.SelectSingleNode(@"//root/item[@id='" + Utils.StrToInt(KSCMS.S("id"))+"']");
    if (node != null)
    {
        XmlElement xe = (XmlElement)node;
        string fileList = xe.SelectSingleNode("filelist").InnerText.ToString().Trim();
        if (!string.IsNullOrEmpty(fileList))
        {
            sb.AppendLine(@"<div style=""margin:0 auto;height:270px; overflow: auto; width:95%"" id=""uptips"">");
            sb.AppendLine("<strong><font color=blue>需要升级的文件列表:</font></strong>");
            sb.AppendLine("<div class='line c'><li class='l'>文件名</li><li class='r' style='padding-left:6px'>状态</li></div>");
            string[] files = fileList.Split(',');
            int i = 0;
            foreach (string file in files)
            {
                sb.AppendLine("<div class='line' class='splittd'><li class='l'>" + file + "</li><li class='r' id='d" + i + "' style='color:#999999'>等待下载</li></div>");
                i++;
            }
            sb.AppendLine("</div><div class='clear'></div>");
            sb.AppendLine("</div>");

            Response.Write(sb.ToString());
            
            //下载
            i = 0;
            
            if (!Directory.Exists(Server.MapPath(tempDownFolder)))
            {
                Function.CreateFolders(tempDownFolder);
            }
            else
            {
                Function.DelFolder(tempDownFolder);
                Function.CreateFolders(tempDownFolder);
            }
            
            foreach (string file in files)
            {
                string filePath = System.IO.Path.GetDirectoryName(file);
                if (filePath.Length > 1)
                {
                    if (filePath.StartsWith("\\"))
                    {
                        filePath = filePath.Substring(1, filePath.Length - 1);
                    }
                    Function.CreateFolders(tempDownFolder+filePath);
                }
                Response.Write(@"<script>InnerHtml(" + i + ",'<font color=blue>正在下载" + file + @"</font>');</sc" + "ript>");

               
                
                string ext = System.IO.Path.GetExtension(file);
                string downFile = file.Replace(ext, ".txt");

                string RemoteFileUrl = downUrl + xe.SelectSingleNode("version").InnerText.ToString().Trim()+downFile;


               try
                {
                    using (WebClient wc = new WebClient())
                    {
                        wc.DownloadFile(RemoteFileUrl, Server.MapPath(tempDownFolder + filePath + "/" + System.IO.Path.GetFileName(file)));

                        /*
                        string html = wc.DownloadString(RemoteFileUrl);
                        using (StreamWriter writer = new StreamWriter(Server.MapPath(tempDownFolder + filePath+"/"+System.IO.Path.GetFileName(file)), false, wc.Encoding))
                        {
                            writer.Write(html);
                            writer.Flush();
                        }*/
                    }
                    succNum++;
                    Response.Write(@"<script>InnerHtml(" + i + ",'<font color=green>下载完毕!</font>');</sc" + "ript>");
                    Response.Flush();
                }
               catch (Exception ex)
                {
                    errNum++;
                    Response.Write(@"<script>InnerHtml(" + i + ",'<font color=red>下载失败!</font>');</sc" + "ript>");
                    Response.Flush();
                }

                i++;
            }
        }

        if (errNum > 0)
        {
            Response.Write(string.Format(@"<div style='margin:2px'><font color=blue>发现有文件没有成功下载，建议直接到<a href='http://www.kesion.com' target='_blank'><font color=blue><u>官方网站</u></font></a>下载升级包覆盖!</font></div>"));
        }
        else
        {
            Response.Write("<div style='margin:2px'>共成功下载了 <font color=red>" + succNum + "</font>个更新文件到临时目录，请按“立即更新”按钮覆盖。</div>");
            Response.Write(@"<div style='height:40px;text-align:center'><input type='button' onclick=""location.href='KS.Update.aspx?action=beginUpdate&id="+Utils.StrToInt(KSCMS.S("id"))+@"';"" value="" 立即更新 "" class=""button""/> <input type=""button"" value="" 暂不升级 "" class=""button"" onclick=""top.box.close();""/></div>");
        }
        
        
        
    }
 }
 public void changeversion()//更改本地XML版本号
 {
     XmlDocument xml = new XmlDocument();
     xml.Load(HttpContext.Current.Server.MapPath("~/Config/ver.xml"));
     XmlNode node = xml.DocumentElement;
     node.SelectSingleNode("version").InnerText = newVersion;
     node.SelectSingleNode("updatedate").InnerText = newVersionUpdateDate;

     xml.Save(HttpContext.Current.Server.MapPath("~/Config/ver.xml"));

 }

  //覆盖
 private void beginUpdate()
 {
    int errNum = 0;
    int succNum = 0;
    initialRemoteXML();
    XmlNode node = xmlDoc.SelectSingleNode(@"//root/item[@id='" + Utils.StrToInt(KSCMS.S("id"))+"']");
    if (node != null)
    {
        XmlElement xe = (XmlElement)node;
        string fileList = xe.SelectSingleNode("filelist").InnerText.ToString().Trim();
        newVersion = xe.SelectSingleNode("version").InnerText.ToString().Trim();
        newVersionUpdateDate = Convert.ToDateTime(xe.SelectSingleNode("adddate").InnerText.ToString()).ToShortDateString();
        
        if (!string.IsNullOrEmpty(fileList))
        { 
            string[] files = fileList.Split(',');
            int i = 0;
            foreach (string file in files)
            {
                string filePath = System.IO.Path.GetDirectoryName(file);
                if (filePath.Length > 1)
                {
                    if (filePath.StartsWith("\\"))
                    {
                        filePath = filePath.Substring(1, filePath.Length - 1);
                    }
                    Function.CreateFolders(filePath);
                }
                
                string oriFilePath = tempDownFolder + file;
               try
                {
                    File.Copy(Server.MapPath(oriFilePath), Server.MapPath(file), true);
                    succNum++;
                }
               catch
                {
                    errNum++;
                }
            }
        }
    }
    if (errNum <= 0)
    {
        changeversion();
        Function.DelFolder(tempDownFolder);
    }
    Response.Write("<div style='text-align:center;padding-top:120px;'>成功更新了<font color=green>" + succNum + "</font>个文件，失败<font color=red>" + errNum + @"</font>个。<br/><br/><input type=""button"" value="" 关闭窗口 "" class=""button"" onclick=""top.location.reload();top.box.close();""/></div>");
 }
 </script>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv='Content-Type' content='text/html; charset=gb2312'>
<link href='../../admin/style/Admin_Style.CSS' rel='stylesheet'>
<script src='../../KS_Inc/Jquery.js'></script>
<script src='../../KS_Inc/Kesion.Common.js'></script>
<style type="text/css">
.listinfo li{height:23px;line-height:23px;background:url(images/37.gif) no-repeat 0px 7px;padding-left:10px}
.bborder{border:2px solid #cccccc }

#uptips{margin:10px}
.line{margin:0 auto;border-bottom:1px solid #efefef}
.c{background:#FBFDFF;border-top:2px solid #E1EEFF;
	height:28px;
	line-height:28px;
	letter-spacing:2px;
	font-weight:bold;
	border-bottom:1px solid #E1EEFF;
}
.line li{height:23px;line-height:23px}
.line .l{width:40%;float:left;}
.line .r{width:50%;float:left}
.clear{clear:both;height:1px;}


</style>
<script>
    function InnerHtml(i,msg) {
       eval("d"+i+".innerHTML = '"+msg+"';");
       document.getElementById('uptips').scrollTop = (i+1)*23;
    }
</script>
</head>
<body class="tdbg">
  
   <%if (KSCMS.S("action") == "begindown")
     {
         beginDown();
     }
     else if (KSCMS.S("action") == "beginUpdate")
     {
         beginUpdate();
     }else
     {%>
      <%=sb.ToString()%>
  <%} %>
</body>
</html>