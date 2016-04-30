<%@ Page Language="C#" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.Admin_Label_LabelFun" Codebehind="KS.LabelFun.aspx.cs" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title>无标题页</title>
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
              <li id='p9'><a href="?LabelType=<%=labeltype %>&ClassID=<%=ParentID %>'"><b></b>回上一级</a></li></ul>
         </div>
         <div class="menu_top_fixed_height"></div>  

         <KS:KSGV ID="List" cssclass="CTable" runat='server' AllowPaging="true" PageSize="20" 
        PagerType="CustomNumeric" Width="99%" EmptyDataText="没有找到标签记录！" AutoGenerateColumns="False" GridLines="None" 
        
        onpageindexchanging="List_PageIndexChanging" CellSpacing="1">
                <Columns>
                    <asp:BoundField HeaderText="标签ID" DataField="classid" >
                        <itemstyle horizontalalign="Center" />
                    </asp:BoundField>
             
                    <asp:TemplateField HeaderText="标签名称">
                        <itemtemplate>
                        &nbsp;
                            <%#GetImg(Convert.ToInt16(Eval("OrderID")),labeltype)%>
                             <%#GetName(Convert.ToString(Eval("ClassName")),Convert.ToInt32(Eval("ClassID")),Convert.ToInt32(Eval("OrderID")),Convert.ToInt32(Eval("labelflag"))) %> 
                        </itemtemplate>
                    </asp:TemplateField>
                </Columns>
                <PagerSettings FirstPageText="首页" LastPageText="末页" Mode="NumericFirstLast" 
                    NextPageText="下一页" PreviousPageText="上一页" />
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
		   showtips('<span class="state"><strong>标签介绍：</strong><br /></span>入门级标签是为方便初学者快速建立站点，对标签语法进行封装达到简化的效果，而这一切对用户来说是完全透明的．您只需要点点鼠标设置标签属性即可轻松实现各种不同的显示效果！<br />');
		   <%}else if(labeltype==2)
		   { %>
              showtips('<span class="state"><strong>标签介绍：</strong><br /></span>中级标签是为方便有一定HTMl基础的用户,可以自由的控制前台显示样式而设置的一种标签！<br />');
		   <%}
		   else if(labeltype==3)
		   { %>
              showtips('<span class="state"><strong>标签介绍：</strong><br /></span>高级SQL标签允许用户根据自己的查询语句，自由设置前台显示样式,从而达到你想要实现的各种效果！<br />');
		   <%} %>
		</script>
          <input type="button" class="button" accesskey="C" onclick="javascript:parent.box.close();" value="关闭取消(C)" /><br />
          <br />
         </div>

    
    </form>
</body>
</html>
