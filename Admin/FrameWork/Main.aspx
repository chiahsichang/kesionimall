<%@ Page Language="C#" AutoEventWireup="True" Inherits="Kesion.NET.WebSite.Main" Title="" Codebehind="Main.aspx.cs" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="Kesion.BLL" %>
<%@ Import Namespace="Kesion.Publics" %>
<%@ Import Namespace="Kesion.Cache" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>无标题文档</title>
<link href="/admin/images/style.css" rel="stylesheet" type="text/css" />
<script src="../../ks_inc/jquery.js"></script>
<script src="../../ks_inc/kesion.common.js"></script>
  
<script>
    function addWorkTable() {
            parent.openWin("添加快捷键到我的工作台", "System/KS.WorkTableManage.aspx?action=add", true, 820, 500);
    }
    function delWorkTable(id) {
        KesionJS.Confirm("确定删除该快捷键?", "location.href='System/KS.WorkTableManage.aspx?action=delQuickMenu&from=FrameWork/Main.aspx&ids=" + id + "';", null);
    }
    function addPlan() {
        parent.openWin("添加工作计划", "User/KS.AdminPlan.aspx?action=add", true, 820, 450);
    }
    function rz() {
        $(".concent .left").width($(window).width() - $(".right").width() - 40);
    }
    $(function () {
        rz();
        $(window).resize(function () {
            rz();
        });
    });
</script>
</head>

<body>
    <form id="form1" runat="server">
  <div class="concent" style="margin:0 10px;">
     <div id="manage_top" class="menu_top_fixed">
        <div class="mainarea">
           <span><h4> <label id="AdminLoginInfo" runat="server"></label></h4></span>
        </div>
     </div>
     <div class="menu_top_fixed_height"></div>  
      
      <div class="left">
         <div class="quickly">   
        <div class="title"><h3>快捷入口</h3></div>
        <ul>
        <asp:Repeater ID="MyWorkTable" runat="server"  >
          <HeaderTemplate>
          </HeaderTemplate>
         <ItemTemplate>
           <li>
             <a title="<%# Eval("intro") %>" href="<%# Convert.ToString(Eval("url")).Replace("{$AdminDir}",KSCMS.GetInstallDir()+MyCache.GetCacheConfig(4)+"/") %>"><img onerror="this.src='../../sysimg/default/1.png';" src="<%# Eval("ico") %>"></a>
             <span><i><a onclick="delWorkTable(<%# Eval("id") %>)" href="javascript:;"></a></i><%# Eval("itemname") %></span>
           </li>
         </ItemTemplate>
          <FooterTemplate>
              <li class="quickly_add">
               <a href="javascript:;" onclick="addWorkTable()">+</a>
             </li>
          </FooterTemplate>
        </asp:Repeater>
       </ul>
     </div>
     <div style="clear:both"></div>
     
     <div class="datatj">
        <div class="float_today">
          <div class="tit"><i></i>今日业务量</div>
           <ul>
            <% 
              int num = 0;
              using (DataTable dt = MyCache.GetCacheModelTable())
               {
                   if (dt.Rows.Count > 0)
                   {
                       foreach (DataRow dr in dt.Rows)
                       {
                           if (dr["modelstatus"].ToString() == "1")
                           {
                               if (dr["basictype"].ToString() != "4" || (dr["basictype"].ToString() == "4" &&  (Utils.GetSysInfo("//sysinfo/model/mall").ToString().ToLower() == "true")))
                               {
                                   num = Utils.StrToInt(DataFactory.GetOnlyValue("select count(1) From " + dr["ModelTable"].ToString() + " where datediff(day,[adddate],getdate())=0"));
                                   Response.Write(string.Format(@"<li title=""{0}"">{3}(新增{1})<span>{2}</span></li>", dr["modelname"].ToString(), dr["modelitem"].ToString(), num > 0 ? "<a href='" + (dr["basictype"].ToString() == "4" ? "../Shop/KS.ShopManage.aspx" : "../Content/KS.ContentManage.aspx") + "?adddate="+DateTime.Now.ToShortDateString()+"&channelid=" + dr["channelid"].ToString() + "' class='has'>" + num + "</a>" : num.ToString(),dr["modelname"].ToString()));
                               }
                              
                           }
                       }
                   }
               }

               
                if (Utils.GetSysInfo("//sysinfo/model/mall").ToString().ToLower() == "true") //商城
                {
                    num = Utils.StrToInt(DataFactory.GetOnlyValue("select count(1) From KS_ProOrder where datediff(day,[InputTime],getdate())=0"));
                    Response.Write(string.Format(@"<li title=""商城系统"">新增订单<span>{0}</span></li>", num > 0 ? @"<a href='../shop/KS.ShopOrder.aspx?adddate="+DateTime.Now.ToString("yyyy-MM-dd")+"' class='has'>"+num+"</a>" : num.ToString()));
                    num = Utils.StrToInt(DataFactory.GetOnlyValue("select count(1) From KS_ProComment where datediff(day,[AddDate],getdate())=0"));
                    Response.Write(string.Format(@"<li title=""商城系统"">新增评价<span>{0}</span></li>", num > 0 ? @"<a href='../shop/KS.ShopComment.aspx?adddate=" +DateTime.Now.ToString("yyyy-MM-dd") + "' class='has'>" + num + "</a>" : num.ToString()));
                    num = Utils.StrToInt(DataFactory.GetOnlyValue("select count(1) From KS_ProAsk where datediff(day,[AddDate],getdate())=0"));
                    Response.Write(string.Format(@"<li title=""商城系统"">新增售前咨询<span>{0}</span></li>", num > 0 ? @"<a href='../shop/KS.ShopAsk.aspx?adddate=" +DateTime.Now.ToString("yyyy-MM-dd") + "' class='has'>" + num + "</a>" : num.ToString()));

                }
                if (Utils.GetSysInfo("//sysinfo/model/exam").ToString().ToLower() == "true") //考试
                {
                    num = Utils.StrToInt(DataFactory.GetOnlyValue("select count(1) From KS_SJ where datediff(day,[AddDate],getdate())=0"));
                    Response.Write(string.Format(@"<li title=""考试系统"">新增试卷<span>{0}</span></li>", num > 0 ? @"<a href='../exam/KS.SJ.aspx?adddate=" +DateTime.Now.ToString("yyyy-MM-dd") + "' class='has'>" + num + "</a>" : num.ToString()));
                    num = Utils.StrToInt(DataFactory.GetOnlyValue("select count(1) From KS_SJScore where datediff(day,[AddDate],getdate())=0"));
                    Response.Write(string.Format(@"<li title=""考试系统"">新增成绩记录<span>{0}</span></li>", num > 0 ? @"<a href='../exam/KS.SJScore.aspx?adddate=" +DateTime.Now.ToString("yyyy-MM-dd") + "' class='has'>" + num + "</a>" : num.ToString()));
                    num = Utils.StrToInt(DataFactory.GetOnlyValue("select count(1) From KS_SJReviews where datediff(day,[AddDate],getdate())=0"));
                    Response.Write(string.Format(@"<li title=""考试系统"">新增考后心得<span>{0}</span></li>", num > 0 ? @"<a href='../exam/KS.SJReviews.aspx?adddate=" +DateTime.Now.ToString("yyyy-MM-dd") + "' class='has'>" + num + "</a>" : num.ToString()));
                }

                //问答
                num = Utils.StrToInt(DataFactory.GetOnlyValue("select count(1) From KS_AskTopic where datediff(day,[AddDate],getdate())=0"));
                Response.Write(string.Format(@"<li title=""问答系统"">新增问答问题<span>{0}</span></li>", num > 0 ? @"<a href='../ask/KS.asktopic.aspx?adddate=" +DateTime.Now.ToString("yyyy-MM-dd") + "' class='has'>" + num + "</a>" : num.ToString()));
                //微社区
                num = Utils.StrToInt(DataFactory.GetOnlyValue("select count(1) From KS_BBSTopic where datediff(day,[AddDate],getdate())=0"));
                Response.Write(string.Format(@"<li title=""微社区系统"">微社区新增话题<span>{0}</span></li>", num > 0 ? @"<a href='../bbs/KS.bbstopic.aspx?adddate=" +DateTime.Now.ToString("yyyy-MM-dd") + "' class='has'>" + num + "</a>" : num.ToString()));
                //空间门户
                num = Utils.StrToInt(DataFactory.GetOnlyValue("select count(1) From KS_Blog where datediff(day,[AddDate],getdate())=0"));
                Response.Write(string.Format(@"<li title=""空间门户系统"">新增空间门户<span>{0}</span></li>", num > 0 ? @"<a href='../space/KS.Blog.aspx?adddate=" +DateTime.Now.ToString("yyyy-MM-dd") + "' class='has'>" + num + "</a>" : num.ToString()));
                //友情链接
                num = Utils.StrToInt(DataFactory.GetOnlyValue("select count(1) From KS_Link where datediff(day,[AddDate],getdate())=0"));
                Response.Write(string.Format(@"<li title=""友情链接系统"">新增友情链接<span>{0}</span></li>", num > 0 ? @"<a href='../common/KS.Link.aspx?adddate=" +DateTime.Now.ToString("yyyy-MM-dd") + "' class='has'>" + num + "</a>" : num.ToString()));
                
                num = Utils.StrToInt(DataFactory.GetOnlyValue("select count(1) From KS_User where datediff(day,[regdate],getdate())=0"));
                Response.Write(string.Format(@"<li title=""会员系统"">新增会员<span>{0}</span></li>", num > 0 ? @"<a href='../user/KS.User.aspx?adddate=" +DateTime.Now.ToString("yyyy-MM-dd") + "' class='has'>" + num + "</a>" : num.ToString()));

             %>
          
          </ul>
        </div>
        <div class="float_today">
         <div class="tit"><i></i>待处理事务</div>
           <ul>
          <% 
              num = 0;
              using (DataTable dt = MyCache.GetCacheModelTable())
               {
                   if (dt.Rows.Count > 0)
                   {
                       foreach (DataRow dr in dt.Rows)
                       {
                           if (dr["modelstatus"].ToString() == "1")
                           {
                               if (dr["basictype"].ToString() != "4" || (dr["basictype"].ToString() == "4" &&  (Utils.GetSysInfo("//sysinfo/model/mall").ToString().ToLower() == "true")))
                               {
                                   num = Utils.StrToInt(DataFactory.GetOnlyValue("select count(1) From " + dr["ModelTable"].ToString() + " where verify=0"));
                                   Response.Write(string.Format(@"<li title=""{0}"">{3}(待审{1})<span>{2}</span></li>", dr["modelname"].ToString(), dr["modelitem"].ToString(), num > 0 ? "<a href='" + (dr["basictype"].ToString() == "4" ? "../Shop/KS.ShopManage.aspx" : "../Content/KS.ContentManage.aspx") + "?showType=1&channelid=" + dr["channelid"].ToString() + "' class='has'>" + num + "</a>" : num.ToString(),dr["modelname"].ToString()));
                               }
                              
                           }
                       }
                   }
               }

              //评论
              num = Utils.StrToInt(DataFactory.GetOnlyValue("select count(1) From KS_Comment where verify=0"));
              Response.Write(string.Format(@"<li title=""评论系统"">待审核评论<span>{0}</span></li>", num > 0 ? @"<a href='../Content/KS.Comment.Aspx?showType=1' class='has'>" + num + "</a>" : num.ToString()));

                if (Utils.GetSysInfo("//sysinfo/model/mall").ToString().ToLower() == "true") //商城
                {
                    num = Utils.StrToInt(DataFactory.GetOnlyValue("select count(1) From KS_ProOrder where MoneyReceipt>0 and DeliverStatus=0 and status=1"));
                    Response.Write(string.Format(@"<li title=""商城系统"">待发货订单<span>{0}</span></li>", num > 0 ? @"<a href='../shop/KS.ShopOrder.aspx?ShowType=2' class='has'>" + num + "</a>" : num.ToString()));
                    num = Utils.StrToInt(DataFactory.GetOnlyValue("select count(1) From KS_ProOrder where MoneyReceipt>0 and status=1 and IsInvoice=1 and Invoiced=0"));
                    Response.Write(string.Format(@"<li title=""商城系统"">待开发票订单<span>{0}</span></li>", num > 0 ? @"<a href='../shop/KS.ShopOrder.aspx?ShowType=3' class='has'>" + num + "</a>" : num.ToString()));
                    num = Utils.StrToInt(DataFactory.GetOnlyValue("select count(1) From KS_ProComment where status=0"));
                    Response.Write(string.Format(@"<li title=""商城系统"">待审核评价<span>{0}</span></li>", num > 0 ? @"<a href='../shop/KS.ShopComment.aspx?logType=2' class='has'>" + num + "</a>" : num.ToString()));
                    num = Utils.StrToInt(DataFactory.GetOnlyValue("select count(1) From KS_ProAsk where status=0"));
                    Response.Write(string.Format(@"<li title=""商城系统"">待审核售前咨询<span>{0}</span></li>", num > 0 ? @"<a href='../shop/KS.ShopAsk.aspx?logType=2' class='has'>" + num + "</a>" : num.ToString()));

                }
                if (Utils.GetSysInfo("//sysinfo/model/exam").ToString().ToLower() == "true") //考试
                {
                    num = Utils.StrToInt(DataFactory.GetOnlyValue("select count(1) From KS_SJReviews where status=0"));
                    Response.Write(string.Format(@"<li title=""考试系统"">待审核考后心得<span>{0}</span></li>", num > 0 ? @"<a href='../exam/KS.SJReviews.Aspx?showType=1' class='has'>" + num + "</a>" : num.ToString()));
                }

                //问答
                num = Utils.StrToInt(DataFactory.GetOnlyValue("select count(1) From KS_AskTopic where verify=0"));
                Response.Write(string.Format(@"<li title=""问答系统"">问答待审核问题<span>{0}</span></li>", num > 0 ? @"<a href='../Ask/KS.AskTopic.Aspx?showType=1' class='has'>" + num + "</a>" : num.ToString()));
                //微社区
                num = Utils.StrToInt(DataFactory.GetOnlyValue("select count(1) From KS_BBSTopic where verify=0"));
                Response.Write(string.Format(@"<li title=""微社区系统"">微社区待审核话题<span>{0}</span></li>", num > 0 ? @"<a href='../bbs/KS.bbstopic.aspx?showType=1' class='has'>" + num + "</a>" : num.ToString()));
                //空间门户
                num = Utils.StrToInt(DataFactory.GetOnlyValue("select count(1) From KS_Blog where status=0"));
                Response.Write(string.Format(@"<li title=""空间门户系统"">待审核空间门户<span>{0}</span></li>", num > 0 ? @"<a href='../Space/KS.Blog.Aspx?showType=1' class='has'>" + num + "</a>" : num.ToString()));
                //友情链接
                num = Utils.StrToInt(DataFactory.GetOnlyValue("select count(1) From KS_Link where verify=0"));
                Response.Write(string.Format(@"<li title=""友情链接系统"">待审核友情链接<span>{0}</span></li>", num > 0 ? @"<a href='../common/KS.Link.aspx?showType=1' class='has'>" + num + "</a>" : num.ToString()));

                num = Utils.StrToInt(DataFactory.GetOnlyValue("select count(1) From KS_User where locked=2"));
                Response.Write(string.Format(@"<li title=""会员系统"">待认证会员<span>{0}</span></li>", num > 0 ? @"<a href='../user/KS.User.aspx?UserType=3' class='has'>" + num + "</a>" : num.ToString()));

             %>




          </ul>
        </div>
        <div class="float_today">
          <div class="tit"><i></i>数据统计</div>
           <ul>

<% 
              num = 0;
              using (DataTable dt = MyCache.GetCacheModelTable())
               {
                   if (dt.Rows.Count > 0)
                   {
                       foreach (DataRow dr in dt.Rows)
                       {
                           if (dr["modelstatus"].ToString() == "1")
                           {
                               if (dr["basictype"].ToString() != "4" || (dr["basictype"].ToString() == "4" &&  (Utils.GetSysInfo("//sysinfo/model/mall").ToString().ToLower() == "true")))
                               {
                                   num = Utils.StrToInt(DataFactory.GetOnlyValue("select count(1) From " + dr["ModelTable"].ToString() + " where verify=1"));
                                   Response.Write(string.Format(@"<li title=""{0}"">{3}({1}总数)<span>{2}</span></li>", dr["modelname"].ToString(), dr["modelitem"].ToString(), num > 0 ? "<a href='" + (dr["basictype"].ToString() == "4" ? "../Shop/KS.ShopManage.aspx" : "../Content/KS.ContentManage.aspx") + "?channelid=" + dr["channelid"].ToString() + "' class='has'>" + num + "</a>" : num.ToString(),dr["modelname"].ToString()));
                               }
                              
                           }
                       }
                   }
               }

              //评论
              num = Utils.StrToInt(DataFactory.GetOnlyValue("select count(1) From KS_Comment where verify=1"));
              Response.Write(string.Format(@"<li title=""评论系统"">评论总数<span>{0}</span></li>", num > 0 ? @"<a href='../Content/KS.Comment.Aspx' class='has'>" + num + "</a>" : num.ToString()));

                if (Utils.GetSysInfo("//sysinfo/model/mall").ToString().ToLower() == "true") //商城
                {
                    num = Utils.StrToInt(DataFactory.GetOnlyValue("select count(1) From KS_ProOrder"));
                    Response.Write(string.Format(@"<li title=""商城系统"">订单总数<span>{0}</span></li>", num > 0 ? @"<a href='../shop/KS.ShopOrder.aspx' class='has'>" + num + "</a>" : num.ToString()));
                    //num = Utils.StrToInt(DataFactory.GetOnlyValue("select count(1) From KS_ProLogInvoice"));
                   // Response.Write(string.Format(@"<li title=""商城系统"">已开发票张数<span>{0}</span></li>", num > 0 ? @"<a href='../shop/KS.ShopLogInvoice.aspx' class='has'>" + num + "</a>" : num.ToString()));
                    num = Utils.StrToInt(DataFactory.GetOnlyValue("select count(1) From KS_ProComment where status=1"));
                    Response.Write(string.Format(@"<li title=""商城系统"">商品评价数<span>{0}</span></li>", num > 0 ? @"<a href='../shop/KS.ShopComment.aspx' class='has'>" + num + "</a>" : num.ToString()));
                    num = Utils.StrToInt(DataFactory.GetOnlyValue("select count(1) From KS_ProAsk where status=1"));
                    Response.Write(string.Format(@"<li title=""商城系统"">商品售前咨询<span>{0}</span></li>", num > 0 ? @"<a href='../shop/KS.ShopAsk.aspx' class='has'>" + num + "</a>" : num.ToString()));

                }
                if (Utils.GetSysInfo("//sysinfo/model/exam").ToString().ToLower() == "true") //考试
                {
                    num = Utils.StrToInt(DataFactory.GetOnlyValue("select count(1) From KS_SJ"));
                    Response.Write(string.Format(@"<li title=""考试系统"">试卷份数<span>{0}</span></li>", num > 0 ? @"<a href='../exam/KS.SJ.aspx' class='has'>" + num + "</a>" : num.ToString()));
                    num = Utils.StrToInt(DataFactory.GetOnlyValue("select count(1) From KS_SJTK"));
                    Response.Write(string.Format(@"<li title=""考试系统"">试题数<span>{0}</span></li>", num > 0 ? @"<a href='../exam/KS.SJTK.aspx' class='has'>" + num + "</a>" : num.ToString()));

                  //  num = Utils.StrToInt(DataFactory.GetOnlyValue("select count(1) From KS_SJReviews where status=0"));
                 //   Response.Write(string.Format(@"<li title=""考试系统"">考后心得<span>{0}</span></li>", num > 0 ? @"<a href='../exam/KS.SJReviews.Aspx?showType=1' class='has'>" + num + "</a>" : num.ToString()));
                }

                //问答
                num = Utils.StrToInt(DataFactory.GetOnlyValue("select count(1) From KS_AskTopic where verify=1"));
                Response.Write(string.Format(@"<li title=""问答系统"">问答问题数<span>{0}</span></li>", num > 0 ? @"<a href='../Ask/KS.AskTopic.Aspx' class='has'>" + num + "</a>" : num.ToString()));
                //微社区
                num = Utils.StrToInt(DataFactory.GetOnlyValue("select count(1) From KS_BBSTopic where verify=1"));
                Response.Write(string.Format(@"<li title=""微社区系统"">微社区话题<span>{0}</span></li>", num > 0 ? @"<a href='../bbs/KS.bbstopic.aspx' class='has'>" + num + "</a>" : num.ToString()));
                //空间门户
                num = Utils.StrToInt(DataFactory.GetOnlyValue("select count(1) From KS_Blog where status=1"));
                Response.Write(string.Format(@"<li title=""空间门户系统"">空间门户数<span>{0}</span></li>", num > 0 ? @"<a href='../Space/KS.Blog.Aspx' class='has'>" + num + "</a>" : num.ToString()));
                //友情链接
                num = Utils.StrToInt(DataFactory.GetOnlyValue("select count(1) From KS_Link where verify=1"));
                Response.Write(string.Format(@"<li title=""友情链接系统"">友情链接数<span>{0}</span></li>", num > 0 ? @"<a href='../common/KS.Link.aspx' class='has'>" + num + "</a>" : num.ToString()));

                num = Utils.StrToInt(DataFactory.GetOnlyValue("select count(1) From KS_User"));
                Response.Write(string.Format(@"<li title=""会员系统"">会员总数<span>{0}</span></li>", num > 0 ? @"<a href='../user/KS.User.aspx' class='has'>" + num + "</a>" : num.ToString()));

             %>

          </ul>
        </div>
        
        
     </div>
      </div>
      
      <div class="right">

          <div class="gzjh_box">
          <label></label><input type="button" style="padding:10px;text-align:center;width:100%" onclick="addPlan()" value="写 工 作 计 划" class="gzjh_btn" />
          </div>
          <br />
          <br />
         <div class="rili">

             <style>
			    .gzjh_box{ position:relative}
				.gzjh_btn{ height:44px; color:#FFF;background:#A5CAF7; cursor:pointer; font-family:"微软雅黑";font-size:18px; border:0}
				.gzjh_box label{background: url(/admin/images/all_icon.png) no-repeat -403px -505px; display:inline-block; height:27px; width:27px; position:absolute; top:9px; left:29px;}
                 .today {
                     background:#FFBB00; font-size:16px;  font-weight:bold
                 }
			 
                 .otherday {
                     border:1px solid #f1f1f1; 
                 }
                 .titleday {
                      border:1px solid #f1f1f1;
                 }
                 .titlestyle td{
                     border:1px solid #f1f1f1;text-align:center;
                 }
                 .hasplanfinish {
                    background-color:#ccc;border:1px solid #f1f1f1;
                 }
                 .hasplannofinish {
                    background-color:#1E89CD;border:1px solid #f1f1f1;
                 }
                 .CalendarStatus {
                     height:60px;
                 }
                     
                     .CalendarStatus li {
                          float:left;margin:5px;text-align:center;color:#777;
                     }
					 .CalendarStatus li i{ display:block;width:35px; height:20px;}
					 .CalendarStatus span{ display:block;}
             </style>
            <asp:Calendar CssClass="CTable" ID="Calendar1" ShowGridLines="True"
ShowDayHeader="True"
SelectionMode="Day"
DayHeaderStyle-HorizontalAlign="Center"
Width="100%"
TitleStyle-Font-Size="13px" TitleStyle-CssClass="titlestyle"
TodayDayStyle-CssClass="today" DayStyle-CssClass="otherday" DayHeaderStyle-CssClass="otherday"
DayStyle-Font-Size="13px"
DayHeaderStyle-Font-Size="12px" 
OtherMonthDayStyle-ForeColor="#cccccc" OnDayRender="Calendar1_DayRender" runat="server"  OnSelectionChanged="Calendar1_SelectionChanged">
            </asp:Calendar>
             
             

          </div>

          <div class="CalendarStatus" style="clear:both">
                 <ul>
                    <li><i class="hasplanfinish"></i><span>已完成</span></li>
                    <li><i class="hasplannofinish"></i><span>未完成</span></li>
                 </ul>
                 
          </div>

        
         <div class="rizhi">
           <div class="tit"><i></i>查看工作计划</div>
            <ul>
               <li class="i_today"><i></i><a href="../User/KS.AdminPlan.aspx?showType=1">今日工作计划</a></li>
               <li class="i_week"><i></i><a href="../User/KS.AdminPlan.aspx?showType=2">本周工作计划</a></li>
               <li class="i_month"><i></i><a href="../User/KS.AdminPlan.aspx?showType=3">本月工作计划</a></li>
               <li class="i_no"><i></i><a href="../User/KS.AdminPlan.aspx?showType=4">未完成计划</a></li>
               <li class="i_yes"><i></i><a href="../User/KS.AdminPlan.aspx?showType=5">已完成计划</a></li>
            </ul>
           
         </div>
        
      </div>

    

  </div>

        <div style="clear:both" class="tips"></div>
            <br />

            <div style="margin:0 auto;height:10px;border-bottom:1px solid #ccc;width:80%;"/>
              <%=KSCMS.CopyRight() %>
        </div>
        
  </form>
</body>
</html>
