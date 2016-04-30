<%@ Page Language="C#" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.Admin.Index" Codebehind="Index.aspx.cs" %>
<%@ Import Namespace="System.Xml" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="Kesion.Publics" %>
<%@ Import Namespace="Kesion.BLL" %>
<%@ Import Namespace="Kesion.Cache" %><!DOCTYPE html>
<html>
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
 <link href="../admin/images/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="../KS_inc/Jquery.js"></script>
<script type="text/javascript" src="../ks_inc/kesion.common.js"></script>
<script src="../admin/include/main.js"></script>
<script>
        var showtips = '<%=Convert.ToString(MyCache.GetCacheConfig(56).IndexOf('3') >= 0).ToLower()%>';
</script>

<!--[if IE 6]>
  <script src="../admin/include/iepng.js" type="text/javascript"></script>
  <script type="text/javascript">
    try{
     EvPNG.fix('div, ul, img, li, input, em, a, p,i,b,span,em,' ); 
    }catch(e){
    }
  </script>
  <![endif]-->

</head>

<body style="overflow:hidden" scroll="no">

<form id="form1" runat="server">
  <div class="top">
     <div class="logo"> <img src='../admin/images/kesioni<%=Utils.GetSysInfo("//sysinfo/showver") %>.png' /></div>
      <div id='ajaxmsg' style='display:none;text-align:center;background-color: #fff;border: 1px #f1f1f1 solid;position:absolute; z-index:1; right: 550px; top: 15px;'> 请稍候,正在执行您的请求...  </div>
      <%if (MyCache.GetCacheConfig(56).IndexOf('2') >= 0) {%>
     <iframe class="ro" scrolling=no src="http://www.kesion.com/websystem/GetofficialInfo.asp" name="ShowAnnounce" id="ShowAnnounce" height="20" width="100%" marginheight="0" marginwidth="0" frameborder="0" align="middle" allowtransparency="true"></iframe>
     <%} %>
	 <div class="right">
	    <ul>
           <li class="t1"><a href="../<%=MyCache.GetCacheConfig(4) %>/index.aspx" title="后台首页" ><i></i><br></a></li>
           <li class="t2"><a href="../index.aspx" title="网站首页（PC版）" target="_blank"><i></i><br></a></li>
           <li class="t3"><a href="../<%=MyCache.GetCacheConfig(73) %>/" title="手机版" target="_blank"><i></i><br></a></li>
		   <li class="t4"><a href="javascript:void(0)" onClick="openWin('修改管理员密码','User/KS.AdminPassEdit.aspx',false,500,250)" title="修改密码"><i></i><br></a></li>
		  <%if (KSSecurity.CheckPower("label", "l005")) { %>
            <li class="t5"><a href="System/KS.CleanCache.aspx" title="更新缓存" target="main"><i></i><br></a></li>
          <%} %>
          <li class="t6"><a href="http://bbs.kesion.com/" title="技术论坛" target="_blank"><i></i><br></a></li>
           <li class="t7"><a href="javascript:Exit();" title="退出登录 "><i></i></a></li>
          
		</ul>
        <div class="new_date">今天是：<script src="../ks_inc/time/2.js"></script></div>
	 </div>
     
     <div class="clear"></div>
     <div class="topnav">
        <ul>
           <%
               
            XmlDocument doc = new XmlDocument();
            doc.Load(Server.MapPath("~/config/managemenu.xml"));
            XmlNode nodes = doc.SelectSingleNode("managemenu");
            int i = 0;
            foreach (XmlNode node in nodes.ChildNodes)
            {
                if (KSSecurity.CheckMenuPower(node.SelectSingleNode("@role").InnerText)) //检查权限
                {
                    bool isShow = true;
                    if (node.SelectSingleNode("@type") != null) 
                    {
                        if (node.SelectSingleNode("@type").InnerText == "shop" && Utils.GetSysInfo("//sysinfo/model/mall").ToString().ToLower() != "true")
                        {
                            isShow = false;
                        }
                        else if (node.SelectSingleNode("@type").InnerText == "exam" && Utils.GetSysInfo("//sysinfo/model/exam").ToString().ToLower() != "true")
                        {
                            isShow = false;
                        }
                    }
                    if (isShow)
                    {
                        Response.Write(string.Format(@"<li{2}><a href=""javascript:;""><span><i class=""{1} all_icon""></i>{0}</span></a></li>", node.SelectSingleNode("@name").InnerText, node.SelectSingleNode("@icoclass").InnerText, i == 0 ? @" class=""curr""" : string.Empty));
                        i++;
                    }
                }
            }
           %>
           <li class="about">
              <a href="javascript:;">
              <span><i class="n9 all_icon"></i>关 于</span></a>
              <ul class="second-menu">
                   <asp:PlaceHolder ID="PlaceHolder1"  runat="server"></asp:PlaceHolder>
             </ul>
           </li>           
        </ul>
     </div>
      

  </div>
  
  <!--top end-->
   <div class="main">
    <a href="javascript:;" onclick="closeLeft()" class="left_frame_open" id="closeBtn"></a>
    
       <div class="leftmain">
        <%
            i = 0;
            foreach (XmlNode node in nodes.ChildNodes)
            {
               
                if (KSSecurity.CheckMenuPower(node.SelectSingleNode("@role").InnerText)) //检查权限
                {
                    bool isShow = true;
                    if (node.SelectSingleNode("@type") != null) 
                    {
                        if (node.SelectSingleNode("@type").InnerText == "shop" && Utils.GetSysInfo("//sysinfo/model/mall").ToString().ToLower() != "true")
                        {
                            isShow = false;
                        }
                        else if (node.SelectSingleNode("@type").InnerText == "exam" && Utils.GetSysInfo("//sysinfo/model/exam").ToString().ToLower() != "true")
                        {
                            isShow = false;
                        }

                    }
                    if (isShow)
                    {
        %>
                <div class="content" id="left<%=i %>"<%=(i>0)?@" style=""display:none""":string.Empty %>>
		        <ul class="menu-one">

                    <%
                        int num = 0;

                        #region 内容及网店选项
                        if (node.SelectSingleNode("@type") != null) 
                        {
                            if (node.SelectSingleNode("@type").InnerText == "content")
                            {
                                #region 文章，图片，下载模型
                                using (DataTable dt=MyCache.GetCacheModelTable()){
                                  if (dt.Rows.Count > 0)
                                  {
                                      foreach (DataRow dr in dt.Rows)
                                      {
                                          if (KSSecurity.CheckMenuPower(dr["modelfolder"].ToString())) //检查权限
                                         {
                                              if (dr["basictype"].ToString()!="4")
                                              {
                                             %>
                                            <li<%=(num==0)?@"  class=""firstChild menu-show""":string.Empty %>>
				                                        <div class="header">
					                                        <span class="txt"><i class="c<%=dr["BasicType"].ToString() %> all_icon"></i><%=dr["ModelName"].ToString() %></span>
					                                        <span class="arrow"></span>
				                                        </div>
				                                        <ul class="menu-two"<%=(num==0)?@"  style=""display:block""":string.Empty %>>
					                                       <li><a href="Content/KS.ContentManage.aspx?channelid=<%=dr["channelid"].ToString() %>" target="main"><%=dr["ModelItem"].ToString() %>管理</a></li>
					                                       <%if (KSSecurity.CheckPower("content",dr["modelfolder"].ToString().ToLower(),0)){ %>
                                                             <li><a href="Content/KS.Content.Aspx?Action=Add&Channelid=<%=dr["channelid"].ToString() %>" target="main">添加<%=dr["ModelItem"].ToString() %></a></li>
                                                           <%} %>
                                                            <%if (KSSecurity.CheckPower("content",dr["modelfolder"].ToString().ToLower(),3)){ %>
					                                       <li><a href="Content/KS.ContentManage.aspx?showType=1&channelid=<%=dr["channelid"].ToString() %>" target="main">审核<%=dr["ModelItem"].ToString() %></a></li>
                                                            <%} %>
				                                        </ul>
			                                </li>

                                             <% 
                                              num++;
                                              }
                                          }
                                      }
                                  }
                                }
                                #endregion
                            }
                            else if (node.SelectSingleNode("@type").InnerText == "shop")
                            {
                               #region 商城模型
                                using (DataTable dt=MyCache.GetCacheModelTable()){
                                  if (dt.Rows.Count > 0)
                                  {
                                      foreach (DataRow dr in dt.Rows)
                                      {
                                           if (KSSecurity.CheckMenuPower(dr["modelfolder"].ToString())) //检查权限
                                         {
                                              if (dr["basictype"].ToString()=="4")
                                              {
                                             %>
                                            <li<%=(num==0)?@"  class=""firstChild menu-show""":string.Empty %>>
				                                        <div class="header">
                                                
					                                        <span class="txt 
                                                            "><i class="c<%=dr["BasicType"].ToString() %> all_icon"></i><%=dr["ModelName"].ToString() %></span>
					                                        <span class="arrow"></span>
				                                        </div>
				                                        <ul class="menu-two"<%=(num==0)?@"  style=""display:block""":string.Empty %>>
					                                       <li><a href="Shop/KS.ShopManage.aspx?channelid=<%=dr["channelid"].ToString() %>" target="main"><%=dr["ModelItem"].ToString() %>管理</a></li>
                                                            <%if (KSSecurity.CheckPower("shop",dr["modelfolder"].ToString().ToLower(),0)){ %>
					                                       <li><a href="Shop/KS.Shop.Aspx?Action=Add&Channelid=<%=dr["channelid"].ToString() %>" target="main">添加<%=dr["ModelItem"].ToString() %></a></li>
                                                            <%} %>
                                                            <%if (KSSecurity.CheckPower("shop", dr["modelfolder"].ToString().ToLower(), 0))
                                                              { %>
					                                       <li><a href="Shop/KS.ShopManage.aspx?showType=1&channelid=<%=dr["channelid"].ToString() %>" target="main">审核<%=dr["ModelItem"].ToString() %></a></li>
                                                            <%} %>
				                                        </ul>
			                                </li>

                                             <% 
                                              num++;
                                              }
                                            }
                                      }
                                  }
                                }
                                #endregion

                        
                            }
                        }
                        #endregion

                        foreach (XmlNode leftnode in node.SelectNodes("leftitem"))
                        {
                            if (KSSecurity.CheckMenuPower(leftnode.SelectSingleNode("@role").InnerText)) //检查权限
                            {
                               %>
                                <li<%=(num==0)?@"  class=""firstChild menu-show""":string.Empty %>>
				                    <div class="header">
					                    <span class="txt"><i class="<%=leftnode.SelectSingleNode("@icoclass").InnerText %> all_icon"></i><%=leftnode.SelectSingleNode("@name").InnerText %></span>
					                    <span class="arrow"></span>
				                    </div>
				                    <ul class="menu-two"<%=(num==0)?@"  style=""display:block""":string.Empty %>>
					       
                                        <%
                                        foreach (XmlNode item in leftnode.SelectNodes("itemlist/item"))
                                        {
                                        string power = KSSecurity.RemovePowerBadChar(item.SelectSingleNode("url").InnerText);
                                        if (KSSecurity.CheckMenuPower(power)) //检查权限
                                        {
                                            Response.Write(string.Format(@"<li><a href=""{1}"" target=""main"">{0}</a></li>", item.SelectSingleNode("name").InnerText, item.SelectSingleNode("url").InnerText));
                                        }
                                        }     
                                        %>
				                    </ul>
			                    </li>
                              <%
                               num++;
                            }
                        }
                     %>

			
		

			
		        </ul>
	        </div>


                <%
                        i++;
                    }     
           }
        }
        %>



	
	</div>
	<div class="rightmain">
    <%
        string mainUrl = string.Empty;
        if (Session["MainUrl"] != null) mainUrl = Session["MainUrl"].ToString();
        if (string.IsNullOrEmpty(mainUrl))
        {
            mainUrl = nodes.SelectSingleNode("@mainurl").InnerText;
        }
        Session["MainUrl"] = string.Empty;
    %>
    <iframe src="<%=mainUrl %>" id="main" name="main" frameborder="0" scrolling="auto" style="width:100%;height:691px"> </iframe>
       <%if (Session["MainClickClass"] != null)
         { %>
        <script>
            $(window).load(function () {
                $(".topnav").find("<%=Session["MainClickClass"].ToString()%>").parent().click();
            });
        </script>
    <%Session["MainClickClass"] = string.Empty;
        } %>
   </div>	
 </div>
	<div class="clear"></div>
     <!--<div class="footer">
	   <div class="copyright"> 
		 福建·漳州科兴信息技术有限公司　 版权所有&copy; 2006-2014 工商注册号:350602100002211 税务登记号:350602666863734 闽ICP备06009871号
	   </div>
    </div>
-->








    </form>
</body>
</html>
