<%@ Page Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.Admin_User_MessageShow" Title="Untitled Page" Codebehind="KS.UserMessageShow.aspx.cs" %>
<asp:Content ID="Content1" ContentPlaceHolderID="KSContent" Runat="Server">
<table id="tbs0" width="99%" align="center" border="0" cellpadding="1" cellspacing="1" class="CTable"> 
          <tr>
            <td class="lefttd" height="30" align="right" style="width: 155px"><b>��Ϣ���⣺</b></td>
            <td class="righttd">
               <%=dr["msgtitle"].ToString() %></td>
          </tr>
    <tr>
        <td align="right" class="lefttd" height="30" style="width: 155px">
            <strong>�����ˣ�</strong></td>
        <td class="righttd">
           <%=dr["fromusername"].ToString() %></td>
    </tr>
    <tr>
        <td align="right" class="lefttd" style="width: 155px; height: 30px">
            <strong>�ռ��ˣ�</strong></td>
        <td class="righttd" style="height: 30px">
            <%=dr["tousername"].ToString() %></td>
    </tr>
    <tr>
        <td align="right" class="lefttd" style="width: 155px; height: 30px">
            <strong>����ʱ�䣺</strong></td>
        <td class="righttd" style="height: 30px">
           <%=dr["adddate"].ToString() %></td>
    </tr>

    <tr>
        <td align="right" class="lefttd" height="30" style="width: 155px">
            <strong>״̬��</strong></td>
        <td class="righttd">
           <%
               if (dr["readtf"].ToString() == "1")
               {
                   Response.Write("<span style='color:blue'>�Ѷ�</span>");
               }
               else if (dr["readtf"].ToString() == "2")
               {
                   Response.Write("<span style='color:green'>�ѻظ�</span>");
               }
               else
               {
                   Response.Write("<span style='color:red'>δ��</span>");
               }
                %></td>
    </tr>
    <tr>
        <td align="right" class="lefttd" height="30" style="width: 155px">
            <strong>��Ϣ���ݣ�</strong></td>
        <td class="righttd">
           <%=dr["msgcontent"].ToString() %></td>
    </tr>
</table>
<div style="margin:8px;text-align:center">
    &nbsp;<input type="button" value="�رմ���(C)" onclick="parent.box.close();" class="button" accesskey="C" />
    <br /><br /><br />
    </div>
</asp:Content>

