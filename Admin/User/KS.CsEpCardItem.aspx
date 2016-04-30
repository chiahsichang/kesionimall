<%@ Page Language="C#" MasterPageFile="~/Admin/MasterPage.master"AutoEventWireup="True" Inherits="Kesion.NET.WebSite.Admin_CsEpCardItem" Codebehind="KS.CsEpCardItem.aspx.cs" %>

<%@ Import Namespace="Kesion.Cache" %>
<%@ Import Namespace="Kesion.APPCode" %>
<%@ Import Namespace="Kesion.BLL" %>
<%@ Import Namespace="Kesion.Publics"%>

<asp:Content ID="Content1" ContentPlaceHolderID="KSContent" Runat="Server">

<asp:Panel ID="ListPanel" runat="server" Width="100%">
     

<div id="manage_top" class="menu_top_fixed">
       <ul>
           <li id='p1'><asp:LinkButton ID="addclassbutton" runat="server" OnClick="addclassbutton_Click" ><b></b>添加充值卡名称</asp:LinkButton></li>    
             <li id='p3'><asp:LinkButton ID="delclassbutton" runat="server" OnClientClick="return(GetIDS('del'));" OnClick="delclassbutton_Click"><b></b>删除充值卡</asp:LinkButton></li>
              
           </ul>
         </div> 
         <div class="message">
             </div>
 <div class="message">
   <span style="float:right;padding-right:10px">
        卡号名称：<asp:TextBox CssClass="textbox" ID="Txtname" runat="server"></asp:TextBox>&nbsp;  
         <asp:Button ID="Button1" runat="server" Text=" 搜索 " CssClass="button" onclick="Button1_Click" />
            </span>
     当前位置：<asp:Label ID="LabNav" runat="server"></asp:Label>

</div>

 <KS:ksgv id="List" runat="server" AutoGenerateColumns="False" EmptyDataText="您还没有添加充值卡!" PagerType="CustomNumeric" Width="99%" CssClass="CTable" GridLines="None" OnRowDataBound="List_RowDataBound" OnRowCommand="List_RowCommand" OnRowCreated="List_RowCreated">
        <Columns>
          <asp:TemplateField HeaderText="&lt;input type='checkbox' name='chkall' id='chkall' onClick='CheckAll(this.form);'/&gt;">
                <itemstyle horizontalalign="Center" Height="30px" width="30px" />
                <itemtemplate>
                <input type="checkbox"  name="ids" id="ids" value="<%#Eval("id") %>" />
                </itemtemplate>
            </asp:TemplateField>

            <asp:TemplateField HeaderText="名称">
               <itemstyle  horizontalalign="Left" />
                <itemtemplate>
             <%# Eval("name") %>
                </itemtemplate>
            </asp:TemplateField>                     

             <asp:TemplateField HeaderText="充值卡数量">
               <itemstyle  horizontalalign="Center" />
                <itemtemplate>
             ( <a style="color:blue" href="KS.CsEpCard.aspx?id=<%# Eval("id")%>"><%# GetTotal(Utils.StrToInt(Eval("id")))%></a> )张 <a style="color:blue" href="KS.CsEpCard.aspx?id=<%# Eval("id")%>">查看/添加</a>
             <a href="KS.CsEpCard.aspx?Id=<%#Eval("id") %>&action=Excel"><span class="special"></span>导出Excel</a>          
               </itemtemplate>
            </asp:TemplateField>

             <asp:TemplateField HeaderText="过期时间">
               <itemstyle  horizontalalign="Center" />
                <itemtemplate>
             <%# Eval("enddate", "{0:yyyy-MM-dd HH:mm:ss}") %>
                </itemtemplate>
            </asp:TemplateField>
                    
            <asp:TemplateField HeaderText="管理操作">
             <itemstyle horizontalalign="Center" Width="200"/>
             <itemtemplate>             
             <asp:LinkButton runat="server" id="edit1" CssClass="edit"   commandargument=<%# Eval("ID") %> commandname="edit1" ToolTip="编辑">编辑</asp:LinkButton>
             <asp:LinkButton runat="server" id="delet" CssClass="delete"   commandargument=<%# Eval("ID") %> commandname="del"  ToolTip="删除">删除</asp:LinkButton>    
             </itemtemplate>           
            </asp:TemplateField>
            
        </Columns>
        
        
        <HeaderStyle CssClass="CTitle" />
        <EmptyDataRowStyle CssClass="emptycss" />
    </KS:ksgv>   
     <KS:Page ID="Page1" runat="server" />
           <asp:Panel ID="Panel1" runat="server" Height="30px" Width="100%">
         <br />
        <script type="text/javascript">
            showtips('<span class="state"><strong>提示：</strong><br/>导出Excel--将该项目所用数据导出  <br/> <span style = "color:red">已售出或已使用的充值卡，不允许删除，修改等操作。 。</span></span>');
		</script>
       </asp:Panel>
    </asp:Panel>

<asp:Panel ID="AddPanel" runat="server" Width="100%">
  <KS:TopNav ID="TopNav1" runat="server" Text="添加充值卡" />
        <div class="tab-page" id="sjPanel">
        
     <table width="100%"  border="0" cellpadding="1" cellspacing="1" class="CTable"> 
    
     <tr>
        <td align="right" class="lefttd" ><strong>充值卡名称：</strong></td>
         <td class="righttd"><asp:TextBox ID="Name" CssClass="textbox" runat="server"></asp:TextBox>
          <span class="tips">如:“10元购100点充值卡”等</span>
         </td>
     </tr>
     
       
      <tr>
        <td align="right" class="lefttd" height="30"><strong>充值截止期限：</strong></td>
         <td class="righttd"><asp:TextBox CssClass="textbox Wdate" ID="enddate" runat="server"  onfocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'});"></asp:TextBox>
              <span class="tips">购买人必须在此日期前进行充值，否则自动失效 </span>
        </td>
      </tr>


  </table>
   <br />
      <KS:Foot ID="Foot1" runat="server" OnSubmit="Foot1_Submit" />
     </asp:Panel>

        <script>
            function CheckForm() {
                if (jQuery('#<%=this.Name.ClientID %>').val() == '') {
                    KesionJS.Alert('名称必须输入!', "jQuery('#<%=this.Name.ClientID %>').focus()");
                    return false;
                }               
                return true;
            }
       </script>

</asp:Content>
