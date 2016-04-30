<%@ Page Language="C#"  MasterPageFile="~/User/User.master"  AutoEventWireup="True" Inherits="Kesion.NET.WebSite.User_UserCard" Codebehind="UserCard.aspx.cs" %>

<%@ Import Namespace="Kesion.Cache" %>
<%@ Import Namespace="Kesion.Publics" %>
<asp:Content ID="Content1" ContentPlaceHolderID="KSContent" Runat="Server">
 

    <div class="tabs" style="margin-left:10px">	
		<ul>             
           <li><a href="<%=MyCache.GetCacheConfig(0) %>user/payonline.aspx">在线充值</a></li>
           <li class='puton'><a href="<%=MyCache.GetCacheConfig(0) %>user/basic/UserCard.aspx">充值卡充值</a></li>
           <li><a href="<%=MyCache.GetCacheConfig(0) %>user/basic/FeePackages.aspx">购买套餐包</a></li>
		</ul>
	</div>

<asp:Panel ID="PanList" runat="server">

 <div style="padding-left:10px;">
  <div style="height:10px;"></div>
    <input type="button" class="button" value="使用充值卡充值" onclick="location.href = 'UserCard.aspx?action=add';" />
         &nbsp;&nbsp;
         <span style="text-align:right">查询卡号：<asp:TextBox ID="TextBox1" CssClass="textbox" runat="server"></asp:TextBox>
             <asp:Button ID="Button2" CssClass="button" runat="server" Text="查询" OnClick="Button2_Click" /></span>
   
               
        <div style="height:10px;"></div>
    <asp:Repeater ID="Repeater1" runat="server">
    <HeaderTemplate>
         <table id="tablist" width="100%" border="0" align="center" cellpadding="2" cellspacing="1" class="border">
      <tr align="center" class="title">
        
        	<td width="100" align="left">名称</td>
            <td width="100" align="center">充值卡号</td>
            <td width="60" align="center">面值</td>
            <td width="50" align="center">充值金额</td>
            <td width="100" align="center">充值时间</td>
            <td width="100" align="center">过期时间</td>
            <td width="30" align="center">状态</td>
        
        </tr>
    </HeaderTemplate>
    <ItemTemplate>
      <tr class="tdbg">
         <td class="splittd" > 
           <%# Eval("Name")%>
            </td>
          <td class="splittd"> 
         <%# Eval("Cardnumber")%>
            </td>
            <td class="splittd"> 
         ￥<%# Kesion.APPCode.Public.ReturnShopPrice(Utils.StrToDecimal(Eval("FaceValue"))) %></td>
            <td class="splittd" style="text-align:center;"> 
         <%# Eval("PointNumber")%><%# getType(Utils.StrToInt(Eval("PointType")))%>
            </td>
          <td class="splittd"> 
           <%# Eval("UseDate", "{0:yyyy-MM-dd HH:mm:ss}")%>
            </td>
          <td class="splittd"> 
           <%# Eval("enddate", "{0:yyyy-MM-dd HH:mm:ss}")%>
            </td>
          <td class="splittd"> 
            <%# Convert.ToString(Eval("IsUse"))=="0"?"未使用":"已使用" %>
            </td>
      </tr>  

     </ItemTemplate>
     <FooterTemplate>
         <tr class="tdbg" style="display:<%# bool.Parse((Repeater1.Items.Count==0).ToString())?"":"none"%>">
                <td class="splittd" style="text-align:center" colspan="10">
                  您没有充值卡记录！
                </td>
           </tr> 
      </table>
     </FooterTemplate>
    </asp:Repeater>
    
     <KS:Page ID="page1" runat="server" />
     </div>
</asp:Panel>

<asp:Panel ID="AddPanel" runat="server" Width="100%">  
      
      <%-- 用ajax来使课时联动--%>
       <table width="100%" border="0" align="center" cellpadding="3" cellspacing="1" style="font-size:14px;">
            <tr class="title">
                 <td colspan="3">我的充值卡</td>
                </tr>
        </table>
        <%-- 用ajax来使课时联动--%>
     <table width="100%" align="center" border="0" cellpadding="1" cellspacing="1" class="CTable"> 
     
      <tr>
     <td class="lefttd" height="30" align="right" ><b>请输入充值卡号</b></td>
      <td class="righttd">
      <asp:TextBox ID="Cardnumber" CssClass="textbox" runat="server" Width="300px"></asp:TextBox>
      </td>          
     </tr>
   
    <tr>
     <td class="lefttd" height="30" align="right" ><b>请输入卡号密码</b></td>
      <td class="righttd">
      <asp:TextBox ID="password" CssClass="textbox" runat="server" Width="300px"></asp:TextBox>
      </td>          
     </tr>

   <tr>
       <td class="lefttd" height="40">&nbsp;</td>
          &nbsp; &nbsp; &nbsp;<td><asp:Button ID="Button1" runat="server" CssClass="button" Text="确定充值" OnClientClick="return(CheckForm());" OnClick="Button1_Click" />
          &nbsp; &nbsp; &nbsp;<input type="button" class="button" value=" 返 回 "  onclick="javascript: location.href = 'UserCard.aspx'">
    </td>
   </tr>
        
  </table>
     
     </asp:Panel>

 <asp:Panel ID="Panel1" runat="server" Width="100%">  
      
  
     <table width="100%" border="0" align="center" cellpadding="3" cellspacing="1" style="font-size:14px;">
            <tr class="title">
                 <td colspan="3">我的充值卡</td>
                </tr>
     </table>
     <table width="100%" align="center" border="0" cellpadding="1" cellspacing="1" class="CTable"> 
          <tr>
     <td class="lefttd" height="30" align="right" > &nbsp; &nbsp; &nbsp;</td>
      <td class="righttd">充值卡号信息
      </td> 
      <tr>
     <td class="lefttd" height="30" align="right" ><b>充值卡号名称:</b></td>
      <td class="righttd">
          <asp:Label ID="Label6" runat="server" ></asp:Label>
      </td>          
     </tr>

      <tr>
     <td class="lefttd" height="30" align="right" ><b>充值卡号:</b></td>
      <td class="righttd">
          <asp:Label ID="Label1" runat="server" ></asp:Label>
      </td>          
     </tr>
    <tr>
     <td class="lefttd" height="30" align="right" ><b>卡号面值:</b></td>
      <td class="righttd">
          <asp:Label ID="Label2" runat="server"></asp:Label>
      </td>          
     </tr>
         <tr>
     <td class="lefttd" height="30" align="right" ><b>卡号类型:</b></td>
      <td class="righttd">
          <asp:Label ID="Label3" runat="server" ></asp:Label>
      </td>          
     </tr>
     <tr>
     <td class="lefttd" height="30" align="right" ><b>卡号点数:</b></td>
      <td class="righttd">
          <asp:Label ID="Label4" runat="server" ></asp:Label>
      </td>          
     </tr>

     <tr>
     <td class="lefttd" height="30" align="right" ><b>过期时间:</b></td>
      <td class="righttd">
          <asp:Label ID="Label5" runat="server" ></asp:Label>
      </td>          
     </tr>

      <tr>
       <td class="lefttd" height="40">&nbsp;</td>
          &nbsp; &nbsp; &nbsp;<td>
          &nbsp; &nbsp; &nbsp;<input type="button" class="button" value=" 返 回 "  onclick="javascript: location.href ='UserCard.aspx'">
    </td>
   </tr>
  </table>
     
     </asp:Panel>
     <script>
         function CheckForm() {
             if (jQuery('#<%=this.Cardnumber.ClientID %>').val() == '') {
                 KesionJS.Alert('请输入卡号!', "jQuery('#<%=this.Cardnumber.ClientID %>').focus()");
                 return false;
             }
             if (jQuery('#<%=this.password.ClientID %>').val() == '') {
                 KesionJS.Alert('请输入密码!', "jQuery('#<%=this.password.ClientID %>').focus()");
                  return false;
              }
         }
   </script>
</asp:Content>

