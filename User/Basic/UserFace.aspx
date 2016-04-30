<%@ Page Language="C#" MasterPageFile="~/User/User.master" ValidateRequest="false" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.User_UserFace" Title="Untitled Page" Codebehind="UserFace.aspx.cs" %>
<%@ Import Namespace="System.Xml" %>
<%@ Import Namespace="Kesion.Publics" %>
<asp:Content ID="Content1" ContentPlaceHolderID="KSContent" Runat="Server">
<div class="tabs">	
			<ul>
                <li><a href="editinfo.aspx">修改我的资料</a></li>
				<li class='puton'><a href="userface.aspx">上传头像</a></li>
				<li><a href="editPass.aspx">修改密码</a></li>
				<li><a href="EditQuestion.aspx">修改安全问题</a></li>
			</ul>
</div>
    <%
        string thumbarr = string.Empty;
    XmlDocument doc = new XmlDocument();
    doc.Load(Server.MapPath("~/config/uploadsetting.config"));
    XmlNode  xn = doc.SelectSingleNode("//uploadsetting/item[@module='userface']");
   if (xn != null)
     {
         thumbarr = xn.SelectSingleNode("@thumbarr").InnerText;
      }
   string[] arr=null;
   if (!string.IsNullOrEmpty(thumbarr))
   {
       arr = thumbarr.Split(',');
   }
   int userId = new TemporaryVar().UserID;
    %>
 <br />
 <table  cellspacing="1" cellpadding="3" class="border" width="85%" align="center" border="0">
	   <tr>
         <td colspan="10" style="height:60px;">  <%=Kesion.APPCode.UploadAPI.EchoUpload("userface",this.UserFace.ClientID) %></td>
        </tr>

	   <tr>
         <td colspan="10" style="height:60px;">  自动生成头像</td>
        </tr> <tr>
 <%
            
         if (arr!=null){
          foreach (string a in arr)
           {
               if (a.IndexOf("x") != -1)
               {
           %>
            <td style="height:<%=Utils.StrToInt(a.Split('x')[1])+80 %>px" valign="top">
             <div class="ar_r_t"><div class="ar_l_t"><div class="ar_r_b"><div class="ar_l_b">
             <img userface="<%=a %>" onerror="this.src='../../sysimg/face/boy.jpg';" src="../../UploadFiles/avatar/<%=userId %>_<%=a %>.jpg" width="<%=a.Split('x')[0] %>"  height="<%=a.Split('x')[1] %>"/>
            </div></div></div></div>
                <div style="clear:both;line-height:20px;" class="tips">尺寸：<%=a %>
                    <br />文件名：<%=userId.ToString()+"_"+a+".jpg" %>
                </div>
           </td>
            <% 
               } 
           } 
           }%>
        
        </tr>
             <tr style="clear:both">

             <td colspan="10">
                 原图:<br />
             <div class="ar_r_t"><div class="ar_l_t"><div class="ar_r_b"><div class="ar_l_b">
             <img userface="<%=userId %>" onerror="this.src='../../sysimg/face/boy.jpg';" src="../../UploadFiles/avatar/<%=userId %>.jpg" style="cursor:pointer;max-height:280px;max-width:280px" title="点击查看原图" onclick="window.open($(this).attr('src'));"/>
            </div></div></div></div>
                <div class="tips">
                    <br />文件名：<%=userId.ToString()+".jpg" %>
                </div>
           </td>
         </tr>
    
      
      </table>
    <span style="display:none">
    <asp:TextBox ID="UserFace" CssClass="textbox" runat="server"></asp:TextBox>
    </span>
</asp:Content>

