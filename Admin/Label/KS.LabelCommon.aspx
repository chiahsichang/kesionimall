<%@ Page Language="C#" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.Admin_Label_LabelCommon" Codebehind="KS.LabelCommon.aspx.cs" %>
<!DOCTYPE html>
<html>
<head runat="server">
    <title>�ޱ���ҳ</title>
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
       <td style="height:30px;border-bottom:1px solid #cccccc;padding-left:10px;"><span class="folder"></span><strong>��վͨ�ñ�ǩ(ȫվͨ��)</strong></td>
      </tr>
      <tr>
       <td>
          <table width="96%" align="center" cellpadding="0" cellspacing="0">
           <tr>
            <td><span class="label_4"></span><a href="#" onclick="parent.frames['main'].InsertLabel('{$GetInstallDir}')">��վ��װĿ¼</a></td>
            <td><span class="label_4"></span><a href="#" onclick="parent.frames['main'].InsertLabel('{$GetSiteTitle}')">��վ����</a></td>
            <td><span class="label_4"></span><a href="#" onclick="parent.frames['main'].InsertLabel('{$GetSiteName}')">��վ����</a></td>
            <td><span class="label_4"></span><a href="#" onclick="parent.frames['main'].InsertLabel('{$GetSiteLogo}')">��վLogo��ַ</a></td>
            <td><span class="label_4"></span><a href="#" onclick="parent.frames['main'].InsertLabel('{$GetSiteUrl}')">��վUrl</a></td>
           </tr>
           <tr>
            <td><span class="label_4"></span><a href="#" onclick="parent.frames['main'].InsertLabel('{$GetCopyRight}')">��ʾ��Ȩ��Ϣ</a></td>
            <td><span class="label_4"></span><a href="#" onclick="parent.frames['main'].InsertLabel('{$GetWebmaster}')">��ʾվ��</a></td>
            <td><span class="label_4"></span><a href="#" onclick="parent.frames['main'].InsertLabel('{$GetWebmasterEmail}')">��ʾվ������</a></td>
            <td><span class="label_4"></span><a href="#" onclick="parent.frames['main'].InsertLabel('{$GetMetaKeyWords}')">��վMETA�ؼ���</a></td>
            <td><span class="label_4"></span><a href="#" onclick="parent.frames['main'].InsertLabel('{$GetMetaDescript}')">��վMETA��ҳ����</a></td>
           </tr>
           <tr>
            <td><span class="label_4"></span><a href="#" onclick="parent.frames['main'].InsertLabel('{$GetTemplateDir}')">��ʾģ��Ŀ¼</a></td>
            <td><span class="label_4"></span><a href="#" onclick="getlabel('��վLogo���ñ�ǩ','ks_logo.html',300,160,'auto');return false;">��վLogo(����)</a></td>
            <td><span class="label_4"></span><a href="#" onclick="getlabel('��վTags���ñ�ǩ','ks_tags.html',300,160,'auto');return false;">Tags��ǩ</a></td>
            <td><span class="label_4"></span><a href="#" onclick="parent.frames['main'].InsertLabel('{$GetUserLogin}')">��Ա��¼(����)</a></td>
            <td><span class="label_4"></span><a href="#" onclick="parent.frames['main'].InsertLabel('{$GetTopUserLogin}')">��Ա��¼(����)</a></td>
           </tr>
           <tr>
            <td><span class="label_4"></span><a href="#" onclick="parent.frames['main'].InsertLabel('{$GetSearchForm}')">ȫվ������</a></td>
            <td><span class="label_4"></span><a href="#" onclick="getlabel('������ĿID�õ���ĿURL','ks_classurl.html',300,130,'auto');return false;">������ĿID��URL</a></td>
            <td><span class="label_4"></span><a href="#" onclick="parent.frames['main'].InsertLabel('{$GetPointName}')">��ȯ����</a></td>
            <td><span class="label_4"></span><a href="#" onclick="parent.frames['main'].InsertLabel('{$GetPointUnit}')">��ȯ��λ</a></td>
            <td><span class="label_4"></span><a href="#" onclick="parent.frames['main'].InsertLabel('{$GetPointUnit}')">��Ʒ���ۼ�����</a></td>
          </tr>
            <tr>
            <td><span class="label_4"></span><a href="#" onclick="parent.frames['main'].InsertLabel('{$GetCurrencySymbol}')">���ҷ���</a></td>
            <td><span class="label_4"></span><a href="#" onclick="parent.frames['main'].InsertLabel('{$GetCurrencyUnit}')">���ҵ�λ����</a></td>
            <td><span class="label_4"></span><a href="#" onclick="parent.frames['main'].InsertLabel('{KS:Field:EchoChangeCity}')">�л�������ʽ1</a></td>
            <td><span class="label_4"></span><a href="#" onclick="parent.frames['main'].InsertLabel('{KS:Field:ShowChangeCity}')">�л�������ʽ2</a></td>
            <td><span class="label_4"></span><a href="#" onclick="parent.frames['main'].InsertLabel('{KS:Field:ShowCurrCity}')">��ʾ��ǰ��������</a></td>
           </tr>
          </table>
         
        </td>
      </tr>
      <tr>
       <td style="height:30px;border-bottom:1px solid #cccccc;padding-left:10px;"><span class="folder"></span><strong>ͨ��JS�ű���ǩ(ȫվͨ��)</strong></td>
      </tr>
      <tr>
       <td>
          <table width="96%" align="center" cellpadding="0" cellspacing="0">
           <tr>
            <td nowrap><span class="label_4"></span><a href="#" onclick="parent.frames['main'].InsertLabel('{$JS_Time1}')">ʱ����Ч��ʽһ:<br /><span style='font-size:10px'>(<script src="../../ks_inc/time/1.js"></script>)</span></a></td>
            <td><span class="label_4"></span><a href="#" onclick="parent.frames['main'].InsertLabel('{$JS_Time2}')">ʱ����Ч��ʽ��:<br /><span style='font-size:10px'>(<script src="../../ks_inc/time/2.js"></script>)</span></a></td>
            <td><span class="label_4"></span><a href="#" onclick="parent.frames['main'].InsertLabel('{$JS_Time3}')">ʱ����Ч��ʽ��:<br /><span style='font-size:10px'>(<script src="../../ks_inc/time/3.js"></script>)</span></a></td>
            <td><span class="label_4"></span><a href="#" onclick="parent.frames['main'].InsertLabel('{$JS_Time4}')">ʱ����Ч��ʽ��:<br /><span style='font-size:10px'>(<span id="kstime"></span><script>setInterval("kstime.innerHTML=new Date().toLocaleString()+' ����'+'��һ����������'.charAt (new Date().getDay());", 1000);</script>)</span></a></td>                                                                                                                                                                                             
            <td><span class="label_4"></span><a href="#" onclick="parent.frames['main'].InsertLabel('{$JS_Language}')">��ת��</a></td>
           </tr>
           <tr>
            <td><span class="label_4"></span><a href="#" onclick="parent.frames['main'].InsertLabel('{$JS_NoCopy}')">��ֹ��ҳ��Ϣ������</a></td>
            <td><span class="label_4"></span><a href="#" onclick="parent.frames['main'].InsertLabel('{$JS_DCRoll}')">˫��������Ч</a></td>
            <td><span class="label_4"></span><a href="#" onclick="parent.frames['main'].InsertLabel('{$JS_HomePage}')">��Ϊ��ҳ</a></td>
            <td><span class="label_4"></span><a href="#" onclick="parent.frames['main'].InsertLabel('{$JS_Collection}')">�����ղ�</a></td>
            <td><span class="label_4"></span><a href="#" onclick="parent.frames['main'].InsertLabel('{$JS_ContactWebMaster}')">��ϵվ��</a></td>
           </tr>
           <tr>
            <td><span class="label_4"></span><a href="#" onclick="parent.frames['main'].InsertLabel('{$JS_GoBack}')">������һҳ</a></td>                                                                                                                                                                                     
            <td><span class="label_4"></span><a href="#" onclick="parent.frames['main'].InsertLabel('{$JS_WindowClose}')">�رմ���</a></td>
            <td><span class="label_4"></span><a href="#" onclick="parent.frames['main'].InsertLabel('{$JS_NoSave}')">ҳ�治������"���Ϊ"</a></td>
            <td><span class="label_4"></span><a href="#" onclick="parent.frames['main'].InsertLabel('{$JS_NoIframe}')">ҳ�治�����˷��ڿ����</a></td>           </tr>
          </table>
       </td>
     </tr>
      <tr>
       <td style="height:30px;border-bottom:1px solid #cccccc;padding-left:10px;"><span class="folder"></span><strong>��ǰ��Ŀ��ǩ(��Ŀҳ������ҳģ�����)</strong></td>
      </tr>
      <tr>
       <td>
          <table width="96%" align="center" cellpadding="0" cellspacing="0">
           <tr>
            <td><span class="label_4"></span><a href="#" onclick="parent.frames['main'].InsertLabel('{$GetClassID}')">��ǰ��ĿID</a></td>
            <td><span class="label_4"></span><a href="#" onclick="parent.frames['main'].InsertLabel('{$GetClassName}')">��ǰ��Ŀ����</a></td>
            <td><span class="label_4"></span><a href="#" onclick="parent.frames['main'].InsertLabel('{$GetClassUrl}')">��Ŀ����URL</a></td>
            <td><span class="label_4"></span><a href="#" onclick="parent.frames['main'].InsertLabel('{$GetClassImgSrc}')">��ĿͼƬSrc</a></td>
            <td><span class="label_4"></span><a href="#" onclick="parent.frames['main'].InsertLabel('{$GetClassIntro}')">��Ŀ����</a></td>
           </tr>
           <tr>
            <td><span class="label_4"></span><a href="#" onclick="parent.frames['main'].InsertLabel('{$GetClassMetaKeyWords}')">MetaKeywords</a></td>
            <td><span class="label_4"></span><a href="#" onclick="parent.frames['main'].InsertLabel('{$GetClassMetaDescript}')">MetaDescript</a></td>
            <td><span class="label_4"></span><a href="#" onclick="parent.frames['main'].InsertLabel('{$GetParentClassID}')">����ĿID</a></td>
            <td><span class="label_4"></span><a href="#" onclick="parent.frames['main'].InsertLabel('{$GetParentClassName}')">����Ŀ����</a></td>
            <td><span class="label_4"></span><a href="#" onclick="parent.frames['main'].InsertLabel('{$GetParentClassUrl}')">����ĿURL</a></td>
           </tr>
           <tr>
            <td><span class="label_4"></span><a href="#" onclick="parent.frames['main'].InsertLabel('{$GetParentClassImgSrc}')">����ĿͼƬSrc</a></td>
            <td><span class="label_4"></span><a href="#" onclick="parent.frames['main'].InsertLabel('{$GetParentClassIntro}')">����Ŀ����</a></td>
            <td><span class="label_4"></span><a href="#" onclick="parent.frames['main'].InsertLabel('{$GetParentClassMetaKeyWords}')">����ĿMetaKeyWords</a></td>
            <td><span class="label_4"></span><a href="#" onclick="parent.frames['main'].InsertLabel('{$GetParentClassMetaDescript}')">����ĿMetaDescript</a></td>
            <td><span class="label_4"></span><a href="#" onclick="parent.frames['main'].InsertLabel('{$GetTopClassID}')">һ����ĿID</a></td>
           </tr>
           <tr>
            <td><span class="label_4"></span><a href="#" onclick="parent.frames['main'].InsertLabel('{$GetTopClassName}')">һ����Ŀ����</a></td>
            <td><span class="label_4"></span><a href="#" onclick="parent.frames['main'].InsertLabel('{$GetTopClassIntro}')">һ����Ŀ����</a></td>
            <td><span class="label_4"></span><a href="#" onclick="parent.frames['main'].InsertLabel('{$GetTopClassMetaKeyWords}')">һ����ĿMetaKeyWords</a></td>
            <td><span class="label_4"></span><a href="#" onclick="parent.frames['main'].InsertLabel('{$GetTopClassMetaDescript}')">һ����ĿMetaDescript</a></td>
            <td><span class="label_4"></span><a href="#" onclick="parent.frames['main'].InsertLabel('{$GetTopClassUrl}')">һ����ĿUrl</a></td>
           </tr>

          </table>
         
        </td>
      </tr>
      
      <tr>
       <td style="height:40px;border-bottom:1px solid #cccccc;padding-left:10px;"><span class="folder"></span><strong>ͶƱ�����ǩ����</strong></td>
      </tr>
      <tr>
      <td>
          <asp:Label ID="LabelVote" runat="server" Text="Label"></asp:Label>
      </td>
      </tr>

      <tr>
       <td style="height:40px;border-bottom:1px solid #cccccc;padding-left:10px;"><span class="folder"></span><strong>PK��ǩ����</strong></td>
      </tr>
      <tr>
      <td>
          <asp:Label ID="LabelPK" runat="server" Text="Label"></asp:Label>
      </td>
      </tr>


      <tr>
       <td style="height:40px;border-bottom:1px solid #cccccc;padding-left:10px;"><span class="folder"></span><strong>���λ��ǩ����</strong></td>
      </tr>
      <tr>
      <td>
          <asp:Label ID="LabelAd" runat="server" Text="Label"></asp:Label>
      </td>
      </tr>
      
     </table>
        
        <div style="text-align:center;">
         <script type="text/javascript">
		 showtips('<span class="state"><strong>˵����</strong><br /></span>����Ŀ��ǩֻ������Ŀҳ������ҳģ������⣬�����ı�ǩ��ͨ�õģ���������ȫվ����ģ������е��ã�<br />');
		 </script>
          <input type="button" class="button" accesskey="C" onclick="javascript:parent.box.close();" value="�ر�ȡ��(C)" /><br />
          <br />
         </div>

    
    </form>
</body>
</html>
