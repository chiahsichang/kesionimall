<%@ Page Language="C#" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.Admin_Label_TemplateUp" Codebehind="KS.TemplateUp.aspx.cs" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>�ޱ���ҳ</title>
    <link href="../../admin/style/Admin_Style.CSS" rel="stylesheet" type="text/css" />
    <script src="../../ks_inc/jquery.js" type="text/javascript"></script>
    <script src="../../KS_Inc/Kesion.Common.js" type="text/javascript"></script>
</head>
<body  class="righttd" scroll="auto">
   <script type="text/JavaScript">
        function addFile()
        {
        var str = '<div>�ļ�:<INPUT type="file" size="50" NAME="File"></div>'
        document.getElementById('MyFile').insertAdjacentHTML("beforeEnd",str)
        }
        function PromptInfo()
		{
		    LayerPrompt.style.visibility='visible';
		    return true;
		}
		var ForwardShow=true;
		function ShowPromptMessage()
		{ 
		    var TempStr=ShowInfoArea.innerText;
		    if (ForwardShow==true)
		    {
		        if (TempStr.length>4) ForwardShow=false;
		        ShowInfoArea.innerText=TempStr+'.';
		    } 
		   else
		   {
		        if (TempStr.length==1) ForwardShow=true;
		        ShowInfoArea.innerText=TempStr.substr(0,TempStr.length-1);
		    }
		}
		window.setInterval('ShowPromptMessage()',150)
        </script>

    <form id="form2" runat="server" enctype="multipart/form-data">
    <table width="100%" border="0" cellpadding="1" cellspacing="1">
           <tr>
            <td height="30" align="right" class="lefttd">
                <strong>�� ����</strong></td>
           <td class="righttd"><input type="button" value="����(A)" class="button"  onclick="addFile()" accesskey="S">
           &nbsp;<input onclick="this.form.reset()" type="button" class="button" value="����(R)" accesskey="R"></td>
           </tr>
           <tr>
           <td align="right" class="lefttd">
               <strong>��ѡҪ�ϴ���ģ���ļ���</strong></td>
           <td class="righttd">
                <div id="MyFile">�ļ�:<input size="50" type="file" name="File" /></div>
                
           </td>
           </tr>
        <tr>
            <td align="right"  class="lefttd">
                <strong>ģ���ļ��������ǣ�</strong></td>
            <td class="righttd">
                <asp:CheckBox ID="FileOverTF" runat="server" Checked="True" Text="��" /> <font color=blue>����ѡ,��ô���ڵ�ͬ��ģ���ļ���������</font></td>
        </tr>
           </table>
           <div align="center">
           
           <asp:Button Runat="server" Text=" �� ��(U) " ID="UploadButton" CssClass="button" OnClick="Upload_Click" AccessKey="U"></asp:Button>
           <input type="button" class="button" onclick="javascript:parent.box.close();" accesskey="C" value="�ر�ȡ��(C)" /><br />
              <br />
              
                <script type="text/javascript">
		 showtips('<span class="state"><strong>˵����</strong><br /></span>ģ���ļ�������.html,.html.shtml..shtm�ľ�̬�ļ���<br />');
  </script>
              
             </div>
           
          <div id="LayerPrompt" style="position:absolute; z-index:1; left: 150px; top: 100px; background-color: #99CC00; layer-background-color: #00CCFF; border: 1px none #000000; width: 300px; height: 63px; visibility: hidden;">
		  <table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0">
		    <tr>
		      <td><div align="right">���Եȣ������ϴ��ļ�</div></td>
		      <td width="35%"><div align="left"><font id="ShowInfoArea" size="+1"></font></div></td>
		    </tr>
		  </table>
		</div>
    </form>
</body>
</html>
