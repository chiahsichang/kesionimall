<%@ Page Language="C#" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.Admin_Label_LabelParam_KS_SqlParam" Codebehind="KS_SqlParam.aspx.cs" %>
<!DOCTYPE html>
<html>
<head runat="server">
    <title>�ޱ���ҳ</title>
    <script src="../../../KS_Inc/jQuery.js" type="text/javascript"></script>
    <script src="../../../KS_Inc/Kesion.Common.js" type="text/javascript"></script>
    <link href="../../../admin/images/Style.CSS" rel="stylesheet" type="text/css" />
<script type="text/javascript">
function OK(itotal) {
        var TempStr="";
        for(i=0;i<itotal;i++){
		    if (eval('document.myform.Field'+ i +'.value')=='')
			 {
			 alert('������'+eval('document.all.Param'+i+'.innerHTML'));
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
        <td  align="center"><strong>������߼�SQL��ǩ����</strong><hr></td>
      </tr>
      <tr>
         <td>
             <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
         
         </td>
      </tr>
  </table>
    </div>
        <script type="text/javascript">
		   showtips('<span class="state"><strong>˵����</strong><br /></span>�Զ��庯����ǩ�ĵ��ø�ʽ���£�<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{SQL_��ǩ����(<font color=blue>����1,����2...</font>)}<br />');
		</script>

    </form>
</body>
</html>
