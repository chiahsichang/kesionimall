<%@ Page Title="" Language="C#"  MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" Inherits="Admin_UserImport" Codebehind="KS.UserImport.aspx.cs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="KSContent" Runat="Server">
      <div id="manage_top" class="toptitle menu_top_fixed" style="text-align:left;">操作导航：<a href="KS.UserAdd.Aspx">新增用户</a> | <a href="KS.UserImport.Aspx">外部数据源批量导入</a></div>

    <style type="text/css"> 
body{ 
text-align:center; 
} 
.graph{ 
width:450px; 
border:1px solid #9bdf70; 
height:25px; 
} 
#bar{ 
display:block; 
background:#FFE7F4; 
float:left; 
height:100%; 
text-align:center; 
} 
#barNum{ 
position:absolute; 
} 
</style> 

<script type="text/javascript">

    function loadTable() {
        jQuery("#showtable").show();
        jQuery.get('KS.UserImport.aspx', { action: 'loadTable', lst: jQuery('#<%=this.LabelDataSource.ClientID %>>option:selected').val(), cstr: jQuery('#<%=this.ConnStr.ClientID %>').val() }, function (s) {
            jQuery("#tablename").empty().append(s);
        });
    }
    function checkdatasource() {
        jQuery.get('KS.UserImport.aspx', { action: 'CheckDataSource', lst: jQuery('#<%=this.LabelDataSource.ClientID %>>option:selected').val(), cstr: jQuery('#<%=this.ConnStr.ClientID %>').val() }, function (s) {
            if (s == 'true') {
                KesionJS.AlertByTime(1, '恭喜，数据源连接测试通过!', 2);
                loadTable();
             }
             else {
                 KesionJS.AlertByTime(2, '连接出错，请检查连接字符串!', 2);
             }
             return false;
         });
     }

 function changeconnstr() {
     switch (parseInt(jQuery('#<%=this.LabelDataSource.ClientID %>>option:selected').val())) {
         case 1:
             jQuery('#<%=this.ConnStr.ClientID %>').val('/DBPath/数据库.mdb');
			     break;
             case 2:
                 jQuery('#<%=this.ConnStr.ClientID %>').val('User ID=sa; Password=989066; Initial Catalog=kesionicms; server=(local);');
			     break;
             case 3:
                 jQuery('#<%=this.ConnStr.ClientID %>').val('DSN=数据源名;UID=用户名;PWD=密码');
			     break;
             case 4:
                 jQuery('#<%=this.ConnStr.ClientID %>').val('Data Source=数据源名;User Id=用户名;Password=密码;Integrated Security=no;');
			     break;
             case 5:
                 jQuery('#<%=this.ConnStr.ClientID %>').val('/DBPath/test.xls');
			     break;
             case 6:
               jQuery('#<%=this.ConnStr.ClientID %>').val('Data Source=完整数据库路径+名称;Provider=Microsoft.JET.OLEDB.4.0;');
			     break;
         }
 }

  

    
    </script>
          <br />
      <br />
      <br />


<asp:Panel ID="top" runat="server" Width="100%">

      <table width="96%" align="center" border="0" cellpadding="1" cellspacing="1" class="CTable">  
          <tr><td class="lefttd" style="text-align:left;padding-left:4px;"><strong>第一步 请选择数据源</strong></td></tr>
          </table>
    <br />
      <table width="96%" align="center" border="0" cellpadding="1" cellspacing="1" class="CTable">  
           <tr>
               <td class="lefttd" style="height: 30px; text-align: right">
                    <strong>数 据 源：</strong></td>
                <td class="righttd" style="height: 30px; text-align: left">
                        <asp:DropDownList ID="LabelDataSource" runat="server">
                         <asp:ListItem Value="1"  Selected="true">外部Access数据源</asp:ListItem>
                         <asp:ListItem Value="2">外部MS SQL数据源</asp:ListItem>
                         <asp:ListItem Value="3">外部ODBC数据源</asp:ListItem>
                         <asp:ListItem Value="4">外部Oracle数据源</asp:ListItem>
                         <asp:ListItem Value="5">外部Excel数据源</asp:ListItem>
                         <asp:ListItem Value="6">外部OLE数据源</asp:ListItem> 
                        </asp:DropDownList>
       
                </td>
            </tr>
      <tr>
                <td class="lefttd" style="height: 30px; text-align: right">
                    <strong>连接字符串：</strong></td>
                <td class="righttd" style="height: 30px; text-align: left">
                 <asp:TextBox ID="ConnStr" runat="server" Height="50px" TextMode="MultiLine" Width="450px">/DBPath/数据库.mdb</asp:TextBox>
                    <br />
                    <asp:Button ID="TextButton" runat="server" Text="测试数据源" CssClass="button" CausesValidation="False" UseSubmitBehavior="False" />

                </td>
            </tr> 
          <tbody  style="display:none;" id="showtable">
        <tr>
        <td class="lefttd" style="height: 30px; text-align: right"><strong>请选择要导入数据表：</strong></td>
          <td class="righttd" style="height: 30px; text-align: left" > 
              <select name="tablename" id="tablename"></select>
         </td>
     </tr> 
          <tr>
                <td class="lefttd" style="height: 30px; text-align: right">
                            
                    </td>
           <td class="righttd" style="height: 30px; text-align: left">  
               <asp:Button ID="Button1" runat="server" CssClass="button" OnClick="Button1_Click" Text="下一步" />
            </td>
          </tr>
              </tbody> 
  </table>
  </asp:Panel>   
     


     <asp:Panel ID="list" runat="server" Width="100%">
          
           <asp:Label ID="Label1" runat="server" Text="Label"/>
         <br />
           <asp:Button ID="Button2" CssClass="button" runat="server" Text="确定导入" OnClick="Button2_Click"/>   


 </asp:Panel> 
       
</asp:Content>

