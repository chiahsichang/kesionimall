<%@ Page Language="C#" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.Admin_Label_LabelCommon" Codebehind="KS.LabelCommon.aspx.cs" %>
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
      parent.frames['main'].insertparamlabel(Title,'../../admin/label/labelparam/'+Url,Width,Height,Scorll)
    }    
    </script>
</head>
<body scroll="auto">
    <form id="form1" runat="server">
     <table border="0" cellpadding="0" width="100%" cellspacing="0">
      <tr>
       <td style="height:30px;border-bottom:1px solid #cccccc;padding-left:10px;"><span class="folder"></span><strong>网站通用标签(全站通用)</strong></td>
      </tr>
      <tr>
       <td>
          <table width="96%" align="center" cellpadding="0" cellspacing="0">
           <tr>
            <td><span class="label_4"></span><a href="#" onclick="parent.frames['main'].InsertLabel('{$GetInstallDir}')">网站安装目录</a></td>
            <td><span class="label_4"></span><a href="#" onclick="parent.frames['main'].InsertLabel('{$GetSiteTitle}')">网站标题</a></td>
            <td><span class="label_4"></span><a href="#" onclick="parent.frames['main'].InsertLabel('{$GetSiteName}')">网站名称</a></td>
            <td><span class="label_4"></span><a href="#" onclick="parent.frames['main'].InsertLabel('{$GetSiteLogo}')">网站Logo地址</a></td>
            <td><span class="label_4"></span><a href="#" onclick="parent.frames['main'].InsertLabel('{$GetSiteUrl}')">网站Url</a></td>
           </tr>
           <tr>
            <td><span class="label_4"></span><a href="#" onclick="parent.frames['main'].InsertLabel('{$GetCopyRight}')">显示版权信息</a></td>
            <td><span class="label_4"></span><a href="#" onclick="parent.frames['main'].InsertLabel('{$GetWebmaster}')">显示站长</a></td>
            <td><span class="label_4"></span><a href="#" onclick="parent.frames['main'].InsertLabel('{$GetWebmasterEmail}')">显示站长邮箱</a></td>
            <td><span class="label_4"></span><a href="#" onclick="parent.frames['main'].InsertLabel('{$GetMetaKeyWords}')">网站META关键词</a></td>
            <td><span class="label_4"></span><a href="#" onclick="parent.frames['main'].InsertLabel('{$GetMetaDescript}')">网站META网页描述</a></td>
           </tr>
           <tr>
            <td><span class="label_4"></span><a href="#" onclick="parent.frames['main'].InsertLabel('{$GetTemplateDir}')">显示模板目录</a></td>
            <td><span class="label_4"></span><a href="#" onclick="getlabel('网站Logo调用标签','ks_logo.html',300,160,'auto');return false;">网站Logo(宽、高)</a></td>
            <td><span class="label_4"></span><a href="#" onclick="getlabel('网站Tags调用标签','ks_tags.html',300,160,'auto');return false;">Tags标签</a></td>
            <td><span class="label_4"></span><a href="#" onclick="parent.frames['main'].InsertLabel('{$GetUserLogin}')">会员登录(竖向)</a></td>
            <td><span class="label_4"></span><a href="#" onclick="parent.frames['main'].InsertLabel('{$GetTopUserLogin}')">会员登录(横向)</a></td>
           </tr>
           <tr>
            <td><span class="label_4"></span><a href="#" onclick="parent.frames['main'].InsertLabel('{$GetSearchForm}')">全站搜索表单</a></td>
            <td><span class="label_4"></span><a href="#" onclick="getlabel('根据栏目ID得到栏目URL','ks_classurl.html',300,130,'auto');return false;">根据栏目ID得URL</a></td>
            <td><span class="label_4"></span><a href="#" onclick="parent.frames['main'].InsertLabel('{$GetPointName}')">点券名称</a></td>
            <td><span class="label_4"></span><a href="#" onclick="parent.frames['main'].InsertLabel('{$GetPointUnit}')">点券单位</a></td>
            <td><span class="label_4"></span><a href="#" onclick="parent.frames['main'].InsertLabel('{$GetPointUnit}')">商品销售价名称</a></td>
          </tr>
            <tr>
            <td><span class="label_4"></span><a href="#" onclick="parent.frames['main'].InsertLabel('{$GetCurrencySymbol}')">货币符号</a></td>
            <td><span class="label_4"></span><a href="#" onclick="parent.frames['main'].InsertLabel('{$GetCurrencyUnit}')">货币单位名称</a></td>
            <td><span class="label_4"></span><a href="#" onclick="parent.frames['main'].InsertLabel('{KS:Field:EchoChangeCity}')">切换城市样式1</a></td>
            <td><span class="label_4"></span><a href="#" onclick="parent.frames['main'].InsertLabel('{KS:Field:ShowChangeCity}')">切换城市样式2</a></td>
            <td><span class="label_4"></span><a href="#" onclick="parent.frames['main'].InsertLabel('{KS:Field:ShowCurrCity}')">显示当前城市名称</a></td>
           </tr>
          </table>
         
        </td>
      </tr>
      <tr>
       <td style="height:30px;border-bottom:1px solid #cccccc;padding-left:10px;"><span class="folder"></span><strong>通用JS脚本标签(全站通用)</strong></td>
      </tr>
      <tr>
       <td>
          <table width="96%" align="center" cellpadding="0" cellspacing="0">
           <tr>
            <td nowrap><span class="label_4"></span><a href="#" onclick="parent.frames['main'].InsertLabel('{$JS_Time1}')">时间特效样式一:<br /><span style='font-size:10px'>(<script src="../../ks_inc/time/1.js"></script>)</span></a></td>
            <td><span class="label_4"></span><a href="#" onclick="parent.frames['main'].InsertLabel('{$JS_Time2}')">时间特效样式二:<br /><span style='font-size:10px'>(<script src="../../ks_inc/time/2.js"></script>)</span></a></td>
            <td><span class="label_4"></span><a href="#" onclick="parent.frames['main'].InsertLabel('{$JS_Time3}')">时间特效样式三:<br /><span style='font-size:10px'>(<script src="../../ks_inc/time/3.js"></script>)</span></a></td>
            <td><span class="label_4"></span><a href="#" onclick="parent.frames['main'].InsertLabel('{$JS_Time4}')">时间特效样式四:<br /><span style='font-size:10px'>(<span id="kstime"></span><script>setInterval("kstime.innerHTML=new Date().toLocaleString()+' 星期'+'日一二三四五六'.charAt (new Date().getDay());", 1000);</script>)</span></a></td>                                                                                                                                                                                             
            <td><span class="label_4"></span><a href="#" onclick="parent.frames['main'].InsertLabel('{$JS_Language}')">简繁转换</a></td>
           </tr>
           <tr>
            <td><span class="label_4"></span><a href="#" onclick="parent.frames['main'].InsertLabel('{$JS_NoCopy}')">防止网页信息被复制</a></td>
            <td><span class="label_4"></span><a href="#" onclick="parent.frames['main'].InsertLabel('{$JS_DCRoll}')">双击滚屏特效</a></td>
            <td><span class="label_4"></span><a href="#" onclick="parent.frames['main'].InsertLabel('{$JS_HomePage}')">设为首页</a></td>
            <td><span class="label_4"></span><a href="#" onclick="parent.frames['main'].InsertLabel('{$JS_Collection}')">加入收藏</a></td>
            <td><span class="label_4"></span><a href="#" onclick="parent.frames['main'].InsertLabel('{$JS_ContactWebMaster}')">联系站长</a></td>
           </tr>
           <tr>
            <td><span class="label_4"></span><a href="#" onclick="parent.frames['main'].InsertLabel('{$JS_GoBack}')">返回上一页</a></td>                                                                                                                                                                                     
            <td><span class="label_4"></span><a href="#" onclick="parent.frames['main'].InsertLabel('{$JS_WindowClose}')">关闭窗口</a></td>
            <td><span class="label_4"></span><a href="#" onclick="parent.frames['main'].InsertLabel('{$JS_NoSave}')">页面不被别人"另存为"</a></td>
            <td><span class="label_4"></span><a href="#" onclick="parent.frames['main'].InsertLabel('{$JS_NoIframe}')">页面不被别人放在框架中</a></td>           </tr>
          </table>
       </td>
     </tr>
      <tr>
       <td style="height:30px;border-bottom:1px solid #cccccc;padding-left:10px;"><span class="folder"></span><strong>当前栏目标签(栏目页及内容页模板调用)</strong></td>
      </tr>
      <tr>
       <td>
          <table width="96%" align="center" cellpadding="0" cellspacing="0">
           <tr>
            <td><span class="label_4"></span><a href="#" onclick="parent.frames['main'].InsertLabel('{$GetClassID}')">当前栏目ID</a></td>
            <td><span class="label_4"></span><a href="#" onclick="parent.frames['main'].InsertLabel('{$GetClassName}')">当前栏目名称</a></td>
            <td><span class="label_4"></span><a href="#" onclick="parent.frames['main'].InsertLabel('{$GetClassUrl}')">栏目链接URL</a></td>
            <td><span class="label_4"></span><a href="#" onclick="parent.frames['main'].InsertLabel('{$GetClassImgSrc}')">栏目图片Src</a></td>
            <td><span class="label_4"></span><a href="#" onclick="parent.frames['main'].InsertLabel('{$GetClassIntro}')">栏目介绍</a></td>
           </tr>
           <tr>
            <td><span class="label_4"></span><a href="#" onclick="parent.frames['main'].InsertLabel('{$GetClassMetaKeyWords}')">MetaKeywords</a></td>
            <td><span class="label_4"></span><a href="#" onclick="parent.frames['main'].InsertLabel('{$GetClassMetaDescript}')">MetaDescript</a></td>
            <td><span class="label_4"></span><a href="#" onclick="parent.frames['main'].InsertLabel('{$GetParentClassID}')">父栏目ID</a></td>
            <td><span class="label_4"></span><a href="#" onclick="parent.frames['main'].InsertLabel('{$GetParentClassName}')">父栏目名称</a></td>
            <td><span class="label_4"></span><a href="#" onclick="parent.frames['main'].InsertLabel('{$GetParentClassUrl}')">父栏目URL</a></td>
           </tr>
           <tr>
            <td><span class="label_4"></span><a href="#" onclick="parent.frames['main'].InsertLabel('{$GetParentClassImgSrc}')">父栏目图片Src</a></td>
            <td><span class="label_4"></span><a href="#" onclick="parent.frames['main'].InsertLabel('{$GetParentClassIntro}')">父栏目介绍</a></td>
            <td><span class="label_4"></span><a href="#" onclick="parent.frames['main'].InsertLabel('{$GetParentClassMetaKeyWords}')">父栏目MetaKeyWords</a></td>
            <td><span class="label_4"></span><a href="#" onclick="parent.frames['main'].InsertLabel('{$GetParentClassMetaDescript}')">父栏目MetaDescript</a></td>
            <td><span class="label_4"></span><a href="#" onclick="parent.frames['main'].InsertLabel('{$GetTopClassID}')">一级栏目ID</a></td>
           </tr>
           <tr>
            <td><span class="label_4"></span><a href="#" onclick="parent.frames['main'].InsertLabel('{$GetTopClassName}')">一级栏目名称</a></td>
            <td><span class="label_4"></span><a href="#" onclick="parent.frames['main'].InsertLabel('{$GetTopClassIntro}')">一级栏目介绍</a></td>
            <td><span class="label_4"></span><a href="#" onclick="parent.frames['main'].InsertLabel('{$GetTopClassMetaKeyWords}')">一级栏目MetaKeyWords</a></td>
            <td><span class="label_4"></span><a href="#" onclick="parent.frames['main'].InsertLabel('{$GetTopClassMetaDescript}')">一级栏目MetaDescript</a></td>
            <td><span class="label_4"></span><a href="#" onclick="parent.frames['main'].InsertLabel('{$GetTopClassUrl}')">一级栏目Url</a></td>
           </tr>

          </table>
         
        </td>
      </tr>
      
      <tr>
       <td style="height:40px;border-bottom:1px solid #cccccc;padding-left:10px;"><span class="folder"></span><strong>投票调查标签调用</strong></td>
      </tr>
      <tr>
      <td>
          <asp:Label ID="LabelVote" runat="server" Text="Label"></asp:Label>
      </td>
      </tr>

      <tr>
       <td style="height:40px;border-bottom:1px solid #cccccc;padding-left:10px;"><span class="folder"></span><strong>PK标签调用</strong></td>
      </tr>
      <tr>
      <td>
          <asp:Label ID="LabelPK" runat="server" Text="Label"></asp:Label>
      </td>
      </tr>


      <tr>
       <td style="height:40px;border-bottom:1px solid #cccccc;padding-left:10px;"><span class="folder"></span><strong>广告位标签调用</strong></td>
      </tr>
      <tr>
      <td>
          <asp:Label ID="LabelAd" runat="server" Text="Label"></asp:Label>
      </td>
      </tr>
      
     </table>
        
        <div style="text-align:center;">
         <script type="text/javascript">
		 showtips('<span class="state"><strong>说明：</strong><br /></span>除栏目标签只能在栏目页及内容页模板调用外，其它的标签是通用的，即可以在全站任意模板里进行调用．<br />');
		 </script>
          <input type="button" class="button" accesskey="C" onclick="javascript:parent.box.close();" value="关闭取消(C)" /><br />
          <br />
         </div>

    
    </form>
</body>
</html>
