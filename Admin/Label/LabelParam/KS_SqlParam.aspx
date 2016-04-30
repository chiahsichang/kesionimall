<%@ Page Language="C#" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.Admin_Label_LabelParam_KS_SqlParam" Codebehind="KS_SqlParam.aspx.cs" %>
<!DOCTYPE html>
<html>
<head runat="server">
    <title>无标题页</title>
    <script src="../../../KS_Inc/jQuery.js" type="text/javascript"></script>
    <script src="../../../KS_Inc/Kesion.Common.js" type="text/javascript"></script>
    <link href="../../../admin/images/Style.CSS" rel="stylesheet" type="text/css" />
<script type="text/javascript">
function OK(itotal) {
        var TempStr="";
        for(i=0;i<itotal;i++){
		    if (eval('document.myform.Field'+ i +'.value')=='')
			 {
			 alert('请输入'+eval('document.all.Param'+i+'.innerHTML'));
			 eval('document.myform.Field'+i+'.focus();');
			 return false;
			 }
            if(i<itotal-1){
                TempStr =TempStr + eval('document.myform.Field'+ i +'.value') + ","; 
            }else{
                TempStr=TempStr + eval('document.myform.Field'+ i +'.value'); 
            }
        }
    var Val = '{SQL_<%=LabelName %>('+TempStr+')}';
  
    parent.frames['main'].InsertLabel(Val);
}
</script>
</head>
<body scroll="auto">
    <form id="myform" runat="server">
    <div>
     <table width='100%' border='0' align='center' cellpadding='2' cellspacing='1'>
      <tr>
        <td  align="center"><strong>请输入高级SQL标签参数</strong><hr></td>
      </tr>
      <tr>
         <td>
             <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
         
         </td>
      </tr>
  </table>
    </div>
        <script type="text/javascript">
		   showtips('<span class="state"><strong>说明：</strong><br /></span>自定义函数标签的调用格式如下：<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{SQL_标签名称(<font color=blue>参数1,参数2...</font>)}<br />');
		</script>

    </form>
</body>
</html>
