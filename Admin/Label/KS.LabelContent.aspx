<%@ Page Language="C#" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.Admin_Label_LabelContent" Codebehind="KS.LabelContent.aspx.cs" %>

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
      parent.frames['main'].insertparamlabel(Title,'label/labelparam/'+Url,Width,Height,Scorll)
    }    
    </script>
</head>
<body scroll="auto">
    <form id="form1" runat="server">
     <table border="0" cellpadding="0" width="100%" cellspacing="0">
      <tr>
       <td align="center" style="border-bottom:1px solid #cccccc"><strong>�����ֶα�ǩ</strong></td>
      </tr>
      <tr>
       <td>
          <table width="96%" align="center" cellpadding="0" cellspacing="0">
           <tr>
            <td><span class="label_4"></span><a href="#" onclick="parent.frames['main'].InsertLabel('{KS:Field:Hits}')">�ܵ�������Զ��ۼƣ�</a></td>
            <td><span class="label_4"></span><a href="#" onclick="parent.frames['main'].InsertLabel('{KS:Field:DayHits}')">�յ����</a></td>
            <td><span class="label_4"></span><a href="#" onclick="parent.frames['main'].InsertLabel('{KS:Field:WeekHits}')">�ܵ����</a></td>
            <td><span class="label_4"></span><a href="#" onclick="parent.frames['main'].InsertLabel('{KS:Field:MonthHits}')">�µ����</a></td>
            <td><span class="label_4"></span><a href="#" onclick="parent.frames['main'].InsertLabel('{KS:Field:CommentNum}')">������</a></td>
            <td><span class="label_4"></span><a href="#" onclick="parent.frames['main'].InsertLabel('{KS:Field:ShowComment}')">��ʾ����</a></td>
           </tr>
           <tr>
            <td><span class="label_4"></span><a href="#" onclick="parent.frames['main'].InsertLabel('{KS:Field:WriteComment}')">д���۱�</a></td>
            <td><span class="label_4"></span><a href="#" onclick="parent.frames['main'].InsertLabel('{KS:Field:GetPK}')">������ҳ��ʾPK</a></td>
            <td><span class="label_4"></span><a href="#" onclick="parent.frames['main'].InsertLabel('{KS:Field:PreItem}')">��ʾ��һƪ</a></td>
            <td><span class="label_4"></span><a href="#" onclick="parent.frames['main'].InsertLabel('{KS:Field:NextItem}')">��ʾ��һƪ</a></td>
            <td><span class="label_4"></span><a href="#" onclick="parent.frames['main'].InsertLabel('{KS:Field:PreItemUrl}')">��һƪURL</a></td>
            <td><span class="label_4"></span><a href="#" onclick="parent.frames['main'].InsertLabel('{KS:Field:NextItemUrl}')">��һƪURL</a></td>
          </tr>
           <tr>
            <td><span class="label_4"></span><a href="#" onclick="parent.frames['main'].InsertLabel('{KS:Field:PreItemTitle}')">��һƪ����</a></td>
            <td><span class="label_4"></span><a href="#" onclick="parent.frames['main'].InsertLabel('{KS:Field:NextItemTitle}')">��һƪ����</a></td>
            <td><span class="label_4"></span><a href="#" onclick="parent.frames['main'].InsertLabel('{KS:Field:Province}')">��ʾʡ��</a></td>
            <td><span class="label_4"></span><a href="#" onclick="parent.frames['main'].InsertLabel('{KS:Field:City}')">��ʾ����</a></td>
            <td><span class="label_4"></span><a href="#" onclick="parent.frames['main'].InsertLabel('{KS:Field:County}')">��ʾ�ؼ�</a></td>
            <td><span class="label_4"></span><a href="#" onclick="parent.frames['main'].InsertLabel('{KS:Current:ModelID}')">��ǰģ��ID</a></td>
         </tr>
           <tr>
           <td><span class="label_4"></span><a href="#" onclick="parent.frames['main'].InsertLabel('{KS:Current:ItemID}')">��ǰ��ĿID</a></td>
            <td><span class="label_4"></span><a href="#" onclick="parent.frames['main'].InsertLabel('{KS:Current:ItemName}')">��ǰ��Ŀ����</a></td>
            <td><span class="label_4"></span><a href="#" onclick="parent.frames['main'].InsertLabel('{KS:Current:ItemUnit}')">��ǰ��Ŀ��λ</a></td>
            <td><span class="label_4"></span><a href="#" onclick="parent.frames['main'].InsertLabel('{KS:Current:Favorite}')">��ǰ�ĵ������ղ�</a></td>
            <td><span class="label_4"></span><a href="#" onclick="parent.frames['main'].InsertLabel('{KS:Field:KeyTags}')">�ؼ���Tags</a></td>
            <td><span class="label_4"></span><a href="#" onclick="parent.frames['main'].InsertLabel('{KS:Field:KeyTagsByLink}')">�ؼ���Tags(������)</a></td>
            </tr>
           <tr><td><span class="label_4"></span><a href="#" onclick="parent.frames['main'].InsertLabel('{KS:Field:GetVote}')">��ʾͶƱ</a></td>
            <td><span class="label_4"></span><a href="#" onclick="parent.frames['main'].InsertLabel('{KS:Field:ItemUrl}')">��ʾ�ĵ�URL</a></td>
           </tr>
          </table>
         
        </td>
      </tr>
      <tr>
       <td align="center" style="border-bottom:1px solid #cccccc"><strong>�����ֶα�ǩ</strong></td>
      </tr>
      <tr>
       <td>
       <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
        </td>
      </tr>
     </table>
        
        <div style="text-align:center;">
          <script type="text/javascript">
		showtips('<span class="state"><strong>˵����</strong><br /></span>����ҳ��ǩ���ɸ�ʽ��{KS:Field:<font color=red>�ֶ�Ӣ������</font>},Ϊ��������ģ�壬��Ҳ����������ҳģ�����ֹ������ϸ�ʽ¼�룮<br />');
		</script>
          <input type="button" class="button" onclick="javascript:parent.box.close();" accesskey="C" value="�ر�ȡ��(C)" /><br />
          <br />
         </div>

    
    </form>
</body>
</html>
