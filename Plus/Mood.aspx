<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Mood.aspx.cs" Inherits="Kesion.NET.WebSite.Plus.Mood" %>
<%@ Import Namespace="Kesion.Cache" %>
<%@ Import Namespace="Kesion.Publics" %>
MoodPosition=function(itemid){
     
 	  jQuery.ajax({url:'<%=KSCMS.GetInstallDir()%>plus/Mood.aspx',cache:false,data:'action=hits&itemid='+itemid+'&id=<%=moodid%>&m_ID=<%=channelid%>&c_id=<%=infoid%>',success:function(obj){
	    MoodPositionBack(obj)
	  }
	  });
}
MoodPositionBack=function(obj){
 switch(obj){
  case "nologin":
   KesionJS.Alert('对不起,您还没登录不能表态!','showuserlogin()');
   break;
  case "standoff":
   KesionJS.Alert('您已表态过了, 不能重复表态!');
   break;
  case "lock":
   KesionJS.Alert('心情指数已关闭!');
   break;
  case "errstartdate":
   KesionJS.Alert('未到表态时间!');
   break;
  case "errexpireddate":
   KesionJS.Alert('表态时间已过!');
   break;
  case "errgroupid":
   KesionJS.Alert('您没有表态的权限!');
   break;
  case "noinfo":
   KesionJS.Alert('找不到您要表态的信息!');
   break;
  default:
  // KesionJS.Message('success.gif','恭喜,您已成功表态!');
  $("#xinqing").animate({opacity:0}, 5).html(obj).animate({opacity:0.2},200).animate({opacity:0.5},200).animate({opacity:0.7},300).animate({opacity:1},800);

   break;
 }
}