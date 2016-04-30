<%@ Page Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.Admin_Label_JSLabel" Title="JS管理" Codebehind="KS.JSLabel.aspx.cs" %>
<asp:Content ID="Content1" ContentPlaceHolderID="KSContent" Runat="Server">
<asp:Panel ID="MainPanel" runat="server" Width="100%">
<script language="javascript">
    function addclass(parentid,classid)
   {  
           parent.openWin("标签目录管理","label/KS.LabelClass.aspx?parentid="+parentid+"&classid="+classid+"&classtype=<%=LabelType %>",true,620,350);
    } 
    function edit(id,type,labelflag)
    {
      if (type==0){
       addclass(<%=ClassID %>,id);
      }
      else
      {
        switch (labelflag)
        {
           case 5:
             location.href='KS.JS.Var.aspx?jsid='+id;
             break;
           case 6:
             location.href='KS.Label.SQL.aspx?labelid='+id;
             break;
        }
       
      } 
    }
</script>
<div id="manage_top" class="menu_top_fixed">
<ul>
      <li id='p1'>
      <a href="#" onclick="addclass(<%=ClassID %>,0);return false;" title="创建标签分类"><b></b>新建分类</a></li><%if (LabelType==5) 
        {%><li id='p8'><a href="KS.JS.Var.aspx?LabelType=<%=LabelType %>&ClassID=<%=ClassID %>"><b></b>新建静态JS</a></li><%
        }
        else
        { %><li id='p8'><a href="KS.Label.SQL.aspx?LabelType=<%=LabelType %>&ClassID=<%=ClassID %>"><b></b>新建智能JS</a></li><%} %><li id='p9'><a href="?LabelType=<%=LabelType %>&ClassID=<%=ParentID %>"><b></b>回上一级</a></li></ul>
  </div>
  
 <div class="menu_top_fixed_height"></div>  
  
 <KS:KSGV ID="List" cssclass="CTable" runat='server' PagerType="CustomNumeric" Width="99%" AutoGenerateColumns="False" GridLines="None" OnRowDataBound="List_RowDataBound" OnRowCommand="List_RowCommand" OnRowCreated="List_RowCreated" EmptyDataText="没有添加JS标签!">
                <Columns>
                    <asp:BoundField HeaderText="标签ID" DataField="classid" >
                        <itemstyle horizontalalign="Center" />
                    </asp:BoundField>

                    <asp:TemplateField HeaderText="选择">
                        <ItemTemplate>
                         <%#GetCheckBox(Convert.ToInt16(Eval("OrderID")),Convert.ToInt32(Eval("classid"))) %>
                        
</ItemTemplate>
                        <ItemStyle HorizontalAlign="Center"  Width="35px"/>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="标签名称">
                        <itemtemplate>
                        &nbsp;
                           <%#GetImg(Convert.ToInt16(Eval("OrderID")))%>
                             <%#GetName(Convert.ToString(Eval("ClassName")),Convert.ToInt32(Eval("ClassID")),Convert.ToInt32(Eval("OrderID")),Convert.ToInt32(Eval("ClassType"))) %> 
                        
</itemtemplate>
                     <ItemStyle Width="200px" />
                    </asp:TemplateField>
                    <asp:BoundField HeaderText="标签类型" DataField="ClassType" >
                        <itemstyle horizontalalign="Center" />
                    </asp:BoundField>
                    <asp:BoundField HeaderText="JS文件名" DataField="JSFileName" >
                        <itemstyle horizontalalign="Center" />
                    </asp:BoundField>
                    <asp:TemplateField HeaderText="调用代码">
                 <itemtemplate>
                  <asp:TextBox runat="server" id="code" TextMode="MultiLine" Text='<%# Eval("JSFileName") %>' width="350px"></asp:TextBox>
                 
                   
</itemtemplate>
                 <itemstyle horizontalalign="Center" />
                </asp:TemplateField>
                    <asp:TemplateField HeaderText="操作管理">
                    <itemtemplate>
                    
                      <a href="#" onclick="edit(<%# Eval("ClassID", "{0}")%>,<%#Eval("orderid") %>,<%#Eval("ClassType") %>);return false;">编辑</a>
                      <a href='?Action=del&id=<%#Eval("classid") %>&orderid=<%#Eval("orderid") %>&labeltype=<%=LabelType %>&ClassID=<%=ClassID %>'  onclick="return(confirm('此操作不可逆，确定删除操作吗?'))">删除</a>
                     <br />
                     <asp:LinkButton ID="refresh" Text="刷新" CommandArgument='<%# Eval("ClassID", "{0}")%>' CommandName="refresh" runat="server"></asp:LinkButton>
                     <asp:LinkButton ID="PreView" Text="预览" CommandArgument='<%# Eval("ClassID", "{0}")%>' CommandName="preview" runat="server"></asp:LinkButton>
                    
</itemtemplate>
                        <itemstyle horizontalalign="Center" />

                    
                    </asp:TemplateField>
                </Columns>
                <EmptyDataRowStyle CssClass="emptycss" />
                <HeaderStyle CssClass="CTitle" />
            </KS:KSGV>
      <asp:Panel ID="Panel1" runat="server" Height="30px" Width="741px">
              <div style="margin-top:5px;overflow:hidden;"></div>
            &nbsp;&nbsp;<input type="checkbox" name="chkall" id="chkall" onclick="CheckAll(this.form);"/><label for="chkall">全部选中</label>
             <input type="button" value="删除选中的JS" onmouseover="this.className='button_on';" onmouseout="this.className='button';" class="button" onclick="if (GetIDS('del')){this.form.action='?action=del&orderid=2';this.form.submit()}" />
            
          <asp:Button ID="Button1" runat="server" onmouseover="this.className='button_on';" onmouseout="this.className='button';" class="button" Text="刷新选中的JS" OnClick="Button1_Click" />
          <asp:Button ID="Button2" runat="server" onmouseover="this.className='button_on';" onmouseout="this.className='button';" class="button" Text="刷新所有的JS" OnClick="Button2_Click" />
          </asp:Panel> 
   </asp:Panel>
   
   <asp:Panel ID="PreViewPanel" runat="server" Width="100%" Visible="false">
       <KS:TopNav ID="TopNav1" runat="server" Text="预览JS" />
       <table style="margin:6px" width="98%" align="center" cellpadding="1" cellspacing="1" class="CTable">
       <tr>
         <td class="lefttd" width="150px" align="right"><b>J S名称：</b></td>
         <td class="righttd">
             <asp:Label ID="JSName" runat="server" Text="Label"></asp:Label>
         </td>
       </tr>
       <tr>
         <td class="lefttd" width="150px" align="right"><b>J S路径：</b></td>
         <td class="righttd">
             <asp:Label ID="JSPath" runat="server" Text="Label"></asp:Label>
         </td>
       </tr>
        <tr>
           <td class="lefttd" align="right"><b>效果预览：</b></td>
            <td class="righttd"  height="100">
                  <div id="preview" runat="server"></div>

            </td>

        </tr>
        </table>
        <div style="text-align:center"><input class="button" accesskey="C" type="button" onclick="javascript:history.back();" value="取消返回(C)" /></div>
   </asp:Panel>
</asp:Content>

