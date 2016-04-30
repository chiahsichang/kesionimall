<%@ Page Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.Admin_User_MessageShow" Title="Untitled Page" Codebehind="KS.UserMessageShow.aspx.cs" %>
<asp:Content ID="Content1" ContentPlaceHolderID="KSContent" Runat="Server">
<table id="tbs0" width="99%" align="center" border="0" cellpadding="1" cellspacing="1" class="CTable"> 
          <tr>
            <td class="lefttd" height="30" align="right" style="width: 155px"><b>消息标题：</b></td>
            <td class="righttd">
               <%=dr["msgtitle"].ToString() %></td>
          </tr>
    <tr>
        <td align="right" class="lefttd" height="30" style="width: 155px">
            <strong>发件人：</strong></td>
        <td class="righttd">
           <%=dr["fromusername"].ToString() %></td>
    </tr>
    <tr>
        <td align="right" class="lefttd" style="width: 155px; height: 30px">
            <strong>收件人：</strong></td>
        <td class="righttd" style="height: 30px">
            <%=dr["tousername"].ToString() %></td>
    </tr>
    <tr>
        <td align="right" class="lefttd" style="width: 155px; height: 30px">
            <strong>发件时间：</strong></td>
        <td class="righttd" style="height: 30px">
           <%=dr["adddate"].ToString() %></td>
    </tr>

    <tr>
        <td align="right" class="lefttd" height="30" style="width: 155px">
            <strong>状态：</strong></td>
        <td class="righttd">
           <%
               if (dr["readtf"].ToString() == "1")
               {
                   Response.Write("<span style='color:blue'>已读</span>");
               }
               else if (dr["readtf"].ToString() == "2")
               {
                   Response.Write("<span style='color:green'>已回复</span>");
               }
               else
               {
                   Response.Write("<span style='color:red'>未读</span>");
               }
                %></td>
    </tr>
    <tr>
        <td align="right" class="lefttd" height="30" style="width: 155px">
            <strong>消息内容：</strong></td>
        <td class="righttd">
           <%=dr["msgcontent"].ToString() %></td>
    </tr>
</table>
<div style="margin:8px;text-align:center">
    &nbsp;<input type="button" value="关闭窗口(C)" onclick="parent.box.close();" class="button" accesskey="C" />
    <br /><br /><br />
    </div>
</asp:Content>

