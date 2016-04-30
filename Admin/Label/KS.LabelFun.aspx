<%@ Page Language="C#" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.Admin_Label_LabelFun" Codebehind="KS.LabelFun.aspx.cs" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title>�ޱ���ҳ</title>
    <link href="../../admin/images/Style.CSS" rel="stylesheet" type="text/css" />
    <script src="../../KS_Inc/jQuery.js" type="text/javascript"></script>
    <script src="../../KS_Inc/Kesion.Common.js" type="text/javascript"></script>
    <style type="text/css">
     td{font-size:13px;}
     td a{text-decoration:underline;}
    </style>
    <script type="text/javascript">
    
    function getlabel(Title,Url,Width,Height,Scorll)
    {
        parent.frames['main'].insertparamlabel(Title, Url, Width, Height, Scorll)
      
    }    
    function InsertLabel(Label)
    {
	    parent.frames['main'].InsertLabel('{KS_'+Label+'}');
    }
    function SelectFolder(Obj)
    {
	var CurrObj;
	if (Obj.ShowFlag=='True')
	{
		ShowOrDisplay(Obj,'none',true);
		Obj.ShowFlag='False';
	}
	else
	{
		ShowOrDisplay(Obj,'',false);
		Obj.ShowFlag='True';
	}
    }
function ShowOrDisplay(Obj,Flag,Tag)
{
	for (var i=0;i<document.all.length;i++)
	{
		CurrObj=document.all(i);
		if (CurrObj.ParentID==Obj.TypeID)
		{
			CurrObj.style.display=Flag;
			if (Tag) 
			if (CurrObj.TypeFlag=='Class') ShowOrDisplay(CurrObj.children(0).children(0).children(0).children(0).children(1).children(0),Flag,Tag);
		}
	}
}

    </script>
</head>
<body scroll="auto">
    <form id="form1" runat="server">
       <div id="manage_top" class="menu_top_fixed">
        <ul>
              <li id='p9'><a href="?LabelType=<%=labeltype %>&ClassID=<%=ParentID %>'"><b></b>����һ��</a></li></ul>
         </div>
         <div class="menu_top_fixed_height"></div>  

         <KS:KSGV ID="List" cssclass="CTable" runat='server' AllowPaging="true" PageSize="20" 
        PagerType="CustomNumeric" Width="99%" EmptyDataText="û���ҵ���ǩ��¼��" AutoGenerateColumns="False" GridLines="None" 
        
        onpageindexchanging="List_PageIndexChanging" CellSpacing="1">
                <Columns>
                    <asp:BoundField HeaderText="��ǩID" DataField="classid" >
                        <itemstyle horizontalalign="Center" />
                    </asp:BoundField>
             
                    <asp:TemplateField HeaderText="��ǩ����">
                        <itemtemplate>
                        &nbsp;
                            <%#GetImg(Convert.ToInt16(Eval("OrderID")),labeltype)%>
                             <%#GetName(Convert.ToString(Eval("ClassName")),Convert.ToInt32(Eval("ClassID")),Convert.ToInt32(Eval("OrderID")),Convert.ToInt32(Eval("labelflag"))) %> 
                        </itemtemplate>
                    </asp:TemplateField>
                </Columns>
                <PagerSettings FirstPageText="��ҳ" LastPageText="ĩҳ" Mode="NumericFirstLast" 
                    NextPageText="��һҳ" PreviousPageText="��һҳ" />
                <EmptyDataRowStyle CssClass="emptycss" />
                <PagerStyle BorderStyle="None" BorderWidth="1px" Height="40px" Wrap="True" />
                <HeaderStyle CssClass="CTitle" />
            </KS:KSGV>



    
    <table width="100%" border="0" cellspacing="0" cellpadding="0" id="SysFLabel">
       <tr> 
         <td height="20" valign-"top"> 
            <asp:Label runat="server" ID="label1"></asp:Label>
         </td>
       </tr>
     </table>
    
  
        
        <div style="text-align:center;">
          <script type="text/javascript">
          <%if (labeltype==1)
          { %>
		   showtips('<span class="state"><strong>��ǩ���ܣ�</strong><br /></span>���ż���ǩ��Ϊ�����ѧ�߿��ٽ���վ�㣬�Ա�ǩ�﷨���з�װ�ﵽ�򻯵�Ч��������һ�ж��û���˵����ȫ͸���ģ���ֻ��Ҫ���������ñ�ǩ���Լ�������ʵ�ָ��ֲ�ͬ����ʾЧ����<br />');
		   <%}else if(labeltype==2)
		   { %>
              showtips('<span class="state"><strong>��ǩ���ܣ�</strong><br /></span>�м���ǩ��Ϊ������һ��HTMl�������û�,�������ɵĿ���ǰ̨��ʾ��ʽ�����õ�һ�ֱ�ǩ��<br />');
		   <%}
		   else if(labeltype==3)
		   { %>
              showtips('<span class="state"><strong>��ǩ���ܣ�</strong><br /></span>�߼�SQL��ǩ�����û������Լ��Ĳ�ѯ��䣬��������ǰ̨��ʾ��ʽ,�Ӷ��ﵽ����Ҫʵ�ֵĸ���Ч����<br />');
		   <%} %>
		</script>
          <input type="button" class="button" accesskey="C" onclick="javascript:parent.box.close();" value="�ر�ȡ��(C)" /><br />
          <br />
         </div>

    
    </form>
</body>
</html>
