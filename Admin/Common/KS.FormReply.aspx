<%@ Page Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.Admin_FormReply" Title="回复表单数据" Codebehind="KS.FormReply.aspx.cs" %>
<asp:Content ID="Content1" ContentPlaceHolderID="KSContent" Runat="Server">
   <script type="text/javascript" src="<%=ResolveUrl("~/KS_Inc/DatePicker/WdatePicker.js") %>"></script>
<script>
       function check() {
           if (editor.hasContents()==false) {
            KesionJS.Alert('请输入回复内容!','editor.focus();');
            return false;
           }
           if (jQuery('#<%=this.TxtReplyUser.ClientID %>').val()==''){
            KesionJS.Alert('请输入回复人!',"jQuery('#<%=this.TxtReplyUser.ClientID %>').focus();");
            return false;
           }
           return true;
       }
   </script>
<table width="100%" border="0" cellpadding="1" cellspacing="1" class="CTable"> 
          <tr>
              <td align="right" class="lefttd" style="width: 150px">
                  <strong>回复内容：</strong></td>
              <td class="righttd">
                  &nbsp;
                  <asp:TextBox ID="TxtReplyConent" runat="server" style="width:95%;height:200px;" TextMode="MultiLine"></asp:TextBox>
                   <%
                       Kesion.APPCode.EditorAPI.EchoEditor("editor", TxtReplyConent.ClientID, "Basic", 0, false, true);    
                  %> 
                  </td>
          </tr>
         <tr>
             <td align="right" class="lefttd" style="text-align: right; width: 150px;">
                 <strong>回复人：</strong></td>
             <td class="righttd">
                 &nbsp;
                 <asp:TextBox CssClass="textbox" ID="TxtReplyUser" runat="server"></asp:TextBox></td>
         </tr>
         <tr>
             <td align="right" class="lefttd" style="text-align: right; width: 150px;">
                 <strong>回复时间：</strong></td>
             <td class="righttd">
                 &nbsp;
                 <asp:TextBox CssClass="textbox" onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'});"  ID="TxtReplyTime" runat="server" ></asp:TextBox></td>
         </tr>
    
      </table>
      <div style="text-align:center;margin-top:15px">
      <asp:Button ID="Button1"  runat="server" OnClientClick="return(check());"  CssClass="button" Text="确定回复" OnClick="Button1_Click"/>
      <input type="button" class="button" value="关闭取消" onclick="top.box.close()" />
         </div>
</asp:Content>

