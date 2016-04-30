<%@ Page Language="C#" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.Admin_Label_LabelContent" Codebehind="KS.LabelContent.aspx.cs" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title>无标题页</title>
    <link href="../../admin/images/style.CSS" rel="stylesheet" type="text/css" />
       <script src="../../KS_Inc/jQuery.js" type="text/javascript"></script>
 <script src="../../KS_Inc/Kesion.Common.js" type="text/javascript"></script>

    <style type="text/css">
     td{font-size:13px;}
     td a{text-decoration:underline;}
    </style>
   <script type="text/javascript"> 
    function getlabel(Title,Url,Width,Height,Scorll)
    {
      parent.frames['main'].insertparamlabel(Title,'label/labelparam/'+Url,Width,Height,Scorll)
    }    
    </script>
</head>
<body scroll="auto">
    <form id="form1" runat="server">
     <table border="0" cellpadding="0" width="100%" cellspacing="0">
      <tr>
       <td align="center" style="border-bottom:1px solid #cccccc"><strong>特殊字段标签</strong></td>
      </tr>
      <tr>
       <td>
          <table width="96%" align="center" cellpadding="0" cellspacing="0">
           <tr>
            <td><span class="label_4"></span><a href="#" onclick="parent.frames['main'].InsertLabel('{KS:Field:Hits}')">总点击数（自动累计）</a></td>
            <td><span class="label_4"></span><a href="#" onclick="parent.frames['main'].InsertLabel('{KS:Field:DayHits}')">日点击数</a></td>
            <td><span class="label_4"></span><a href="#" onclick="parent.frames['main'].InsertLabel('{KS:Field:WeekHits}')">周点击数</a></td>
            <td><span class="label_4"></span><a href="#" onclick="parent.frames['main'].InsertLabel('{KS:Field:MonthHits}')">月点击数</a></td>
            <td><span class="label_4"></span><a href="#" onclick="parent.frames['main'].InsertLabel('{KS:Field:CommentNum}')">评论数</a></td>
            <td><span class="label_4"></span><a href="#" onclick="parent.frames['main'].InsertLabel('{KS:Field:ShowComment}')">显示评论</a></td>
           </tr>
           <tr>
            <td><span class="label_4"></span><a href="#" onclick="parent.frames['main'].InsertLabel('{KS:Field:WriteComment}')">写评论表单</a></td>
            <td><span class="label_4"></span><a href="#" onclick="parent.frames['main'].InsertLabel('{KS:Field:GetPK}')">在内容页显示PK</a></td>
            <td><span class="label_4"></span><a href="#" onclick="parent.frames['main'].InsertLabel('{KS:Field:PreItem}')">显示上一篇</a></td>
            <td><span class="label_4"></span><a href="#" onclick="parent.frames['main'].InsertLabel('{KS:Field:NextItem}')">显示下一篇</a></td>
            <td><span class="label_4"></span><a href="#" onclick="parent.frames['main'].InsertLabel('{KS:Field:PreItemUrl}')">上一篇URL</a></td>
            <td><span class="label_4"></span><a href="#" onclick="parent.frames['main'].InsertLabel('{KS:Field:NextItemUrl}')">下一篇URL</a></td>
          </tr>
           <tr>
            <td><span class="label_4"></span><a href="#" onclick="parent.frames['main'].InsertLabel('{KS:Field:PreItemTitle}')">上一篇标题</a></td>
            <td><span class="label_4"></span><a href="#" onclick="parent.frames['main'].InsertLabel('{KS:Field:NextItemTitle}')">下一篇标题</a></td>
            <td><span class="label_4"></span><a href="#" onclick="parent.frames['main'].InsertLabel('{KS:Field:Province}')">显示省份</a></td>
            <td><span class="label_4"></span><a href="#" onclick="parent.frames['main'].InsertLabel('{KS:Field:City}')">显示城市</a></td>
            <td><span class="label_4"></span><a href="#" onclick="parent.frames['main'].InsertLabel('{KS:Field:County}')">显示县级</a></td>
            <td><span class="label_4"></span><a href="#" onclick="parent.frames['main'].InsertLabel('{KS:Current:ModelID}')">当前模型ID</a></td>
         </tr>
           <tr>
           <td><span class="label_4"></span><a href="#" onclick="parent.frames['main'].InsertLabel('{KS:Current:ItemID}')">当前项目ID</a></td>
            <td><span class="label_4"></span><a href="#" onclick="parent.frames['main'].InsertLabel('{KS:Current:ItemName}')">当前项目名称</a></td>
            <td><span class="label_4"></span><a href="#" onclick="parent.frames['main'].InsertLabel('{KS:Current:ItemUnit}')">当前项目单位</a></td>
            <td><span class="label_4"></span><a href="#" onclick="parent.frames['main'].InsertLabel('{KS:Current:Favorite}')">当前文档加入收藏</a></td>
            <td><span class="label_4"></span><a href="#" onclick="parent.frames['main'].InsertLabel('{KS:Field:KeyTags}')">关键字Tags</a></td>
            <td><span class="label_4"></span><a href="#" onclick="parent.frames['main'].InsertLabel('{KS:Field:KeyTagsByLink}')">关键字Tags(带链接)</a></td>
            </tr>
           <tr><td><span class="label_4"></span><a href="#" onclick="parent.frames['main'].InsertLabel('{KS:Field:GetVote}')">显示投票</a></td>
            <td><span class="label_4"></span><a href="#" onclick="parent.frames['main'].InsertLabel('{KS:Field:ItemUrl}')">显示文档URL</a></td>
           </tr>
          </table>
         
        </td>
      </tr>
      <tr>
       <td align="center" style="border-bottom:1px solid #cccccc"><strong>基本字段标签</strong></td>
      </tr>
      <tr>
       <td>
       <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
        </td>
      </tr>
     </table>
        
        <div style="text-align:center;">
          <script type="text/javascript">
		showtips('<span class="state"><strong>说明：</strong><br /></span>内容页标签构成格式：{KS:Field:<font color=red>字段英文名称</font>},为方便制作模板，您也可以在内容页模板里手工按以上格式录入．<br />');
		</script>
          <input type="button" class="button" onclick="javascript:parent.box.close();" accesskey="C" value="关闭取消(C)" /><br />
          <br />
         </div>

    
    </form>
</body>
</html>
