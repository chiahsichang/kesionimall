<%@ Page Language="C#" AutoEventWireup="True" Inherits="Kesion.NET.WebSite.Admin_Label_Special" Codebehind="KS.LabelSpecial.aspx.cs" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title>无标题页</title>
    <link href="../../admin/images/style.CSS" rel="stylesheet" type="text/css" />
    <script src="../../KS_Inc/Kesion.Common.js" type="text/javascript"></script>
        <script src="../../KS_Inc/jQuery.js" type="text/javascript"></script>

    <style type="text/css">
     td{font-size:13px;}
     td a{text-decoration:underline;}
    </style>
   <script type="text/javascript"> 
    function getlabel(Title,Url,Width,Height,Scorll)
    {
      parent.insertparamlabel(Title,'../../admin/label/labelparam/'+Url,Width,Height,Scorll)
      parent.box.close();
    }    
    </script>
</head>
<body>
    <form id="form1" runat="server">
     <table border="0" cellpadding="0" width="100%" cellspacing="0">

      <tr>
       <td align="center" style="border-bottom:1px solid #cccccc"><strong>专题可用标签</strong></td>
      </tr>
      
      <tr>
       <td>
       <div style='margin:5px;font-weight:bold'><span class="folder"></span>专题分类页标签</div>
        <table width="96%" align="center">
         <tr>
          <td><span class="label_4"></span><a href="#" onclick="parent.frames['main'].InsertLabel('{KS:ClassID}')" title="调用格式：{KS:ClassID}">专题分类ID</a></td>
          <td><span class="label_4"></span><a href="#" onclick="parent.frames['main'].InsertLabel('{KS:ClassName}')" title="调用格式：{KS:ClassName}">分类名称</a></td>
          <td><span class="label_4"></span><a href="#" onclick="parent.frames['main'].InsertLabel('{KS:ClassEname}')" title="调用格式：{KS:ClassEname}">分类英文名称</a></td>
          <td><span class="label_4"></span><a href="#" onclick="parent.frames['main'].InsertLabel('{KS:Descript}')" title="调用格式：{KS:Descript}">分类简介</a></td>
          <td><span class="label_4"></span><a href="#" onclick="parent.frames['main'].InsertLabel('{KS:AddDate}')" title="调用格式：{KS:AddDate}">分类添加时间</a></td>
          </tr>
         
 
          </table>
       <div style='margin:5px;font-weight:bold'><span class="folder"></span>专题页标签</div>
        <table width="96%" align="center">
         <tr>
          <td><span class="label_4"></span><a href="#" onclick="parent.frames['main'].InsertLabel('{KS:SpecialID}')" title="调用格式：{KS:SpecialID}">专题ID</a></td>
          <td><span class="label_4"></span><a href="#" onclick="parent.frames['main'].InsertLabel('{KS:SpecialName}')" title="调用格式：{KS:SpecialName}">专题名称</a></td>
          <td><span class="label_4"></span><a href="#" onclick="parent.frames['main'].InsertLabel('{KS:SpecialEname}')" title="调用格式：{KS:SpecialEname})">专题英文名称</a></td>
          <td><span class="label_4"></span><a href="#" onclick="parent.frames['main'].InsertLabel('{KS:SpecialPic}')" title="调用格式：{KS:SpecialPic}">专题图片地址</a></td>
          <td><span class="label_4"></span><a href="#" onclick="parent.frames['main'].InsertLabel('{KS:Descript}')" title="调用格式：{KS:Descript}">专题介绍</a></td>
          </tr>
         <tr>
          <td><span class="label_4"></span><a href="#" onclick="parent.frames['main'].InsertLabel('{KS:AddDate}')" title="调用格式：{KS:AddDate}">添加时间</a></td>
          <td><span class="label_4"></span><a href="#" onclick="parent.frames['main'].InsertLabel('{KS:MetaKeyWord}')" title="调用格式：{KS:MetaKeyWord}">专题META关键词</a></td>
          <td><span class="label_4"></span><a href="#" onclick="parent.frames['main'].InsertLabel('{KS:MetaDescript}')" title="调用格式：{KS:MetaDescript}">专题META网页描述</a></td>
          <td><span class="label_4"></span><a href="#" onclick="parent.frames['main'].InsertLabel('{KS:ReadPoint}')" title="调用格式：{KS:ReadPoint}">阅读点数</a></td>
          <td></td>
          </tr>
         <tr>
          <td><span class="label_4"></span><a href="#" onclick="parent.frames['main'].InsertLabel('{$GetSpecialDefineContent1}')" title="调用格式：{$GetSpecialDefineContent1}">自设内容1</a></td>
          <td><span class="label_4"></span><a href="#" onclick="parent.frames['main'].InsertLabel('{$GetSpecialDefineContent2}')" title="调用格式：{$GetSpecialDefineContent2}">自设内容2</a></td>
          <td><span class="label_4"></span><a href="#" onclick="parent.frames['main'].InsertLabel('{$GetSpecialDefineContent3}')" title="调用格式：{$GetSpecialDefineContent3})">自设内容3</a></td>
          <td><span class="label_4"></span><a href="#" onclick="parent.frames['main'].InsertLabel('{$GetSpecialDefineContent4}')" title="调用格式：{$GetSpecialDefineContent4}">自设内容4</a></td>
          <td><span class="label_4"></span><a href="#" onclick="parent.frames['main'].InsertLabel('{$GetSpecialDefineContent5}')" title="调用格式：{$GetSpecialDefineContent5}">自设内容5</a></td>
          </tr>
         <tr>
          <td><span class="label_4"></span><a href="#" onclick="parent.frames['main'].InsertLabel('{$GetSpecialDefineContent6}')" title="调用格式：{$GetSpecialDefineContent6}">自设内容6</a></td>
          <td><span class="label_4"></span><a href="#" onclick="parent.frames['main'].InsertLabel('{$GetSpecialDefineContent7}')" title="调用格式：{$GetSpecialDefineContent7}">自设内容7</a></td>
          <td><span class="label_4"></span><a href="#" onclick="parent.frames['main'].InsertLabel('{$GetSpecialDefineContent8}')" title="调用格式：{$GetSpecialDefineContent8})">自设内容8</a></td>
          <td><span class="label_4"></span><a href="#" onclick="parent.frames['main'].InsertLabel('{$GetSpecialDefineContent9}')" title="调用格式：{$GetSpecialDefineContent9}">自设内容9</a></td>
          <td><span class="label_4"></span><a href="#" onclick="parent.frames['main'].InsertLabel('{$GetSpecialDefineContent10}')" title="调用格式：{$GetSpecialDefineContent10}">自设内容10</a></td>
          </tr>
         <tr>
          <td><span class="label_4"></span><a href="#" onclick="parent.frames['main'].InsertLabel('{$GetSpecialDefineContent11}')" title="调用格式：{$GetSpecialDefineContent11}">自设内容11</a></td>
          <td><span class="label_4"></span><a href="#" onclick="parent.frames['main'].InsertLabel('{$GetSpecialDefineContent12}')" title="调用格式：{$GetSpecialDefineContent12}">自设内容12</a></td>
          <td><span class="label_4"></span><a href="#" onclick="parent.frames['main'].InsertLabel('{$GetSpecialDefineContent13}')" title="调用格式：{$GetSpecialDefineContent13})">自设内容13</a></td>
          <td><span class="label_4"></span><a href="#" onclick="parent.frames['main'].InsertLabel('{$GetSpecialDefineContent14}')" title="调用格式：{$GetSpecialDefineContent14}">自设内容14</a></td>
          <td><span class="label_4"></span><a href="#" onclick="parent.frames['main'].InsertLabel('{$GetSpecialDefineContent15}')" title="调用格式：{$GetSpecialDefineContent15}">自设内容15</a></td>
          </tr>
         <tr>
          <td><span class="label_4"></span><a href="#" onclick="parent.frames['main'].InsertLabel('{$GetSpecialDefineContent16}')" title="调用格式：{$GetSpecialDefineContent16}">自设内容16</a></td>
          <td><span class="label_4"></span><a href="#" onclick="parent.frames['main'].InsertLabel('{$GetSpecialDefineContent17}')" title="调用格式：{$GetSpecialDefineContent17}">自设内容17</a></td>
          <td><span class="label_4"></span><a href="#" onclick="parent.frames['main'].InsertLabel('{$GetSpecialDefineContent18}')" title="调用格式：{$GetSpecialDefineContent18})">自设内容18</a></td>
          <td><span class="label_4"></span><a href="#" onclick="parent.frames['main'].InsertLabel('{$GetSpecialDefineContent19}')" title="调用格式：{$GetSpecialDefineContent19}">自设内容19</a></td>
          <td><span class="label_4"></span><a href="#" onclick="parent.frames['main'].InsertLabel('{$GetSpecialDefineContent20}')" title="调用格式：{$GetSpecialDefineContent20}">自设内容20</a></td>
          </tr>

          
          
         </table>
        </td>
      </tr>
      

     </table>
        
        <div style="text-align:center;">
          <script type="text/javascript">
		showtips('<span class="state"><strong>说明：</strong><br /></span>标签构成格式：{KS:<font color=red>字段英文名称</font>},为方便制作模板，您也可以在内容页模板里手工按以上格式录入．<br />');
		</script>
          <input type="button" class="button" onclick="javascript:parent.box.close();" accesskey="C" value="关闭取消(C)" /><br />
          <br />
         </div>

    
    </form>
</body>
</html>
