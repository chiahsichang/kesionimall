<%@ Page Language="C#" AutoEventWireup="True" Inherits="Kesion.NET.WebSite.Admin_Label_Special" Codebehind="KS.LabelSpecial.aspx.cs" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title>�ޱ���ҳ</title>
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
       <td align="center" style="border-bottom:1px solid #cccccc"><strong>ר����ñ�ǩ</strong></td>
      </tr>
      
      <tr>
       <td>
       <div style='margin:5px;font-weight:bold'><span class="folder"></span>ר�����ҳ��ǩ</div>
        <table width="96%" align="center">
         <tr>
          <td><span class="label_4"></span><a href="#" onclick="parent.frames['main'].InsertLabel('{KS:ClassID}')" title="���ø�ʽ��{KS:ClassID}">ר�����ID</a></td>
          <td><span class="label_4"></span><a href="#" onclick="parent.frames['main'].InsertLabel('{KS:ClassName}')" title="���ø�ʽ��{KS:ClassName}">��������</a></td>
          <td><span class="label_4"></span><a href="#" onclick="parent.frames['main'].InsertLabel('{KS:ClassEname}')" title="���ø�ʽ��{KS:ClassEname}">����Ӣ������</a></td>
          <td><span class="label_4"></span><a href="#" onclick="parent.frames['main'].InsertLabel('{KS:Descript}')" title="���ø�ʽ��{KS:Descript}">������</a></td>
          <td><span class="label_4"></span><a href="#" onclick="parent.frames['main'].InsertLabel('{KS:AddDate}')" title="���ø�ʽ��{KS:AddDate}">�������ʱ��</a></td>
          </tr>
         
 
          </table>
       <div style='margin:5px;font-weight:bold'><span class="folder"></span>ר��ҳ��ǩ</div>
        <table width="96%" align="center">
         <tr>
          <td><span class="label_4"></span><a href="#" onclick="parent.frames['main'].InsertLabel('{KS:SpecialID}')" title="���ø�ʽ��{KS:SpecialID}">ר��ID</a></td>
          <td><span class="label_4"></span><a href="#" onclick="parent.frames['main'].InsertLabel('{KS:SpecialName}')" title="���ø�ʽ��{KS:SpecialName}">ר������</a></td>
          <td><span class="label_4"></span><a href="#" onclick="parent.frames['main'].InsertLabel('{KS:SpecialEname}')" title="���ø�ʽ��{KS:SpecialEname})">ר��Ӣ������</a></td>
          <td><span class="label_4"></span><a href="#" onclick="parent.frames['main'].InsertLabel('{KS:SpecialPic}')" title="���ø�ʽ��{KS:SpecialPic}">ר��ͼƬ��ַ</a></td>
          <td><span class="label_4"></span><a href="#" onclick="parent.frames['main'].InsertLabel('{KS:Descript}')" title="���ø�ʽ��{KS:Descript}">ר�����</a></td>
          </tr>
         <tr>
          <td><span class="label_4"></span><a href="#" onclick="parent.frames['main'].InsertLabel('{KS:AddDate}')" title="���ø�ʽ��{KS:AddDate}">���ʱ��</a></td>
          <td><span class="label_4"></span><a href="#" onclick="parent.frames['main'].InsertLabel('{KS:MetaKeyWord}')" title="���ø�ʽ��{KS:MetaKeyWord}">ר��META�ؼ���</a></td>
          <td><span class="label_4"></span><a href="#" onclick="parent.frames['main'].InsertLabel('{KS:MetaDescript}')" title="���ø�ʽ��{KS:MetaDescript}">ר��META��ҳ����</a></td>
          <td><span class="label_4"></span><a href="#" onclick="parent.frames['main'].InsertLabel('{KS:ReadPoint}')" title="���ø�ʽ��{KS:ReadPoint}">�Ķ�����</a></td>
          <td></td>
          </tr>
         <tr>
          <td><span class="label_4"></span><a href="#" onclick="parent.frames['main'].InsertLabel('{$GetSpecialDefineContent1}')" title="���ø�ʽ��{$GetSpecialDefineContent1}">��������1</a></td>
          <td><span class="label_4"></span><a href="#" onclick="parent.frames['main'].InsertLabel('{$GetSpecialDefineContent2}')" title="���ø�ʽ��{$GetSpecialDefineContent2}">��������2</a></td>
          <td><span class="label_4"></span><a href="#" onclick="parent.frames['main'].InsertLabel('{$GetSpecialDefineContent3}')" title="���ø�ʽ��{$GetSpecialDefineContent3})">��������3</a></td>
          <td><span class="label_4"></span><a href="#" onclick="parent.frames['main'].InsertLabel('{$GetSpecialDefineContent4}')" title="���ø�ʽ��{$GetSpecialDefineContent4}">��������4</a></td>
          <td><span class="label_4"></span><a href="#" onclick="parent.frames['main'].InsertLabel('{$GetSpecialDefineContent5}')" title="���ø�ʽ��{$GetSpecialDefineContent5}">��������5</a></td>
          </tr>
         <tr>
          <td><span class="label_4"></span><a href="#" onclick="parent.frames['main'].InsertLabel('{$GetSpecialDefineContent6}')" title="���ø�ʽ��{$GetSpecialDefineContent6}">��������6</a></td>
          <td><span class="label_4"></span><a href="#" onclick="parent.frames['main'].InsertLabel('{$GetSpecialDefineContent7}')" title="���ø�ʽ��{$GetSpecialDefineContent7}">��������7</a></td>
          <td><span class="label_4"></span><a href="#" onclick="parent.frames['main'].InsertLabel('{$GetSpecialDefineContent8}')" title="���ø�ʽ��{$GetSpecialDefineContent8})">��������8</a></td>
          <td><span class="label_4"></span><a href="#" onclick="parent.frames['main'].InsertLabel('{$GetSpecialDefineContent9}')" title="���ø�ʽ��{$GetSpecialDefineContent9}">��������9</a></td>
          <td><span class="label_4"></span><a href="#" onclick="parent.frames['main'].InsertLabel('{$GetSpecialDefineContent10}')" title="���ø�ʽ��{$GetSpecialDefineContent10}">��������10</a></td>
          </tr>
         <tr>
          <td><span class="label_4"></span><a href="#" onclick="parent.frames['main'].InsertLabel('{$GetSpecialDefineContent11}')" title="���ø�ʽ��{$GetSpecialDefineContent11}">��������11</a></td>
          <td><span class="label_4"></span><a href="#" onclick="parent.frames['main'].InsertLabel('{$GetSpecialDefineContent12}')" title="���ø�ʽ��{$GetSpecialDefineContent12}">��������12</a></td>
          <td><span class="label_4"></span><a href="#" onclick="parent.frames['main'].InsertLabel('{$GetSpecialDefineContent13}')" title="���ø�ʽ��{$GetSpecialDefineContent13})">��������13</a></td>
          <td><span class="label_4"></span><a href="#" onclick="parent.frames['main'].InsertLabel('{$GetSpecialDefineContent14}')" title="���ø�ʽ��{$GetSpecialDefineContent14}">��������14</a></td>
          <td><span class="label_4"></span><a href="#" onclick="parent.frames['main'].InsertLabel('{$GetSpecialDefineContent15}')" title="���ø�ʽ��{$GetSpecialDefineContent15}">��������15</a></td>
          </tr>
         <tr>
          <td><span class="label_4"></span><a href="#" onclick="parent.frames['main'].InsertLabel('{$GetSpecialDefineContent16}')" title="���ø�ʽ��{$GetSpecialDefineContent16}">��������16</a></td>
          <td><span class="label_4"></span><a href="#" onclick="parent.frames['main'].InsertLabel('{$GetSpecialDefineContent17}')" title="���ø�ʽ��{$GetSpecialDefineContent17}">��������17</a></td>
          <td><span class="label_4"></span><a href="#" onclick="parent.frames['main'].InsertLabel('{$GetSpecialDefineContent18}')" title="���ø�ʽ��{$GetSpecialDefineContent18})">��������18</a></td>
          <td><span class="label_4"></span><a href="#" onclick="parent.frames['main'].InsertLabel('{$GetSpecialDefineContent19}')" title="���ø�ʽ��{$GetSpecialDefineContent19}">��������19</a></td>
          <td><span class="label_4"></span><a href="#" onclick="parent.frames['main'].InsertLabel('{$GetSpecialDefineContent20}')" title="���ø�ʽ��{$GetSpecialDefineContent20}">��������20</a></td>
          </tr>

          
          
         </table>
        </td>
      </tr>
      

     </table>
        
        <div style="text-align:center;">
          <script type="text/javascript">
		showtips('<span class="state"><strong>˵����</strong><br /></span>��ǩ���ɸ�ʽ��{KS:<font color=red>�ֶ�Ӣ������</font>},Ϊ��������ģ�壬��Ҳ����������ҳģ�����ֹ������ϸ�ʽ¼�룮<br />');
		</script>
          <input type="button" class="button" onclick="javascript:parent.box.close();" accesskey="C" value="�ر�ȡ��(C)" /><br />
          <br />
         </div>

    
    </form>
</body>
</html>
