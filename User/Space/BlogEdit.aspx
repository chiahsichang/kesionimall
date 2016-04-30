<%@ Page Title="" Language="C#" MasterPageFile="~/User/User.master" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.User_BlogEdit" Codebehind="BlogEdit.aspx.cs" %>


<asp:Content ID="Content1" ContentPlaceHolderID="KSContent" Runat="Server">
<div class="tabs">	
			<ul>
				<li class='puton'><a href="blogedit.aspx">空间参数设置</a></li>
				<li><a href="UserBlogNav.aspx">空间导航管理</a></li>
				<li><a href="SetSpaceTemplate.aspx" target="_blank">空间模板绑定</a></li>
			</ul>
</div>
    <table width="98%" border="0" align="center" cellpadding="3" cellspacing="1" style="margin-top:10px;font-size:14px;">
<script>
    function checkform() {
        if ($("#<%=this.TxtBlogName.ClientID %>").val() == '') {
            $.dialog.alert('请输入空间名称!', function() {
            $("#<%=this.TxtBlogName.ClientID %>").focus();
            });
            return false;

        }
        if ($("#<%=this.DrpClassID.ClientID %> option:selected").val() == '0') {
            $.dialog.alert('请选择分类!', function() {
             $("#<%=this.DrpClassID.ClientID %>").focus();
            });
            return false;

        }
        if ($("#<%=this.txtDescript.ClientID %>").val() == '') {
            $.dialog.alert('请填写你的站点描述!', function () {
                $("#<%=this.txtDescript.ClientID %>").focus();
            });
            return false;

        }
        if ($("#<%=this.txtAnnounce.ClientID %>").val() == '') {
            $.dialog.alert('请填写你的站点公告!', function () {
                $("#<%=this.txtAnnounce.ClientID %>").focus();
            });
            return false;
        }
        if (isNaN($("#<%=this.tboxContentLen.ClientID %>").val())) {
            $.dialog.alert('请填写新鲜事!未填写正确，列表每页显示多少条！', function () {
                $("#<%=this.tboxContentLen.ClientID %>").focus();
            });
            return false;
        }
        if (isNaN($("#<%=this.tboxListBlogNum.ClientID %>").val())) {
            $.dialog.alert('请填写显示博文!未填写正确，首页显示博文多少篇！', function () {
                $("#<%=this.tboxListBlogNum.ClientID %>").focus();
            });
            return false;
        }
        if (isNaN($("#<%=this.tboxListGuestNum.ClientID %>").val())) {
            $.dialog.alert('请填写显示回复!未填写正确，首页显示回复多少条！', function () {
                $("#<%=this.tboxListGuestNum.ClientID %>").focus();
            });
            return false;
        }
        if (isNaN($("#<%=this.tboxListLogNum.ClientID %>").val())) {
            $.dialog.alert('请填写博文列表!未填写正确，列表页显示博文多少篇！', function () {
                $("#<%=this.tboxListLogNum.ClientID %>").focus();
            });
            return false;
        }
        if (isNaN($("#<%=this.tboxListReplayNum.ClientID %>").val())) {
            $.dialog.alert('请填写显示留言!未填写正确，首页显示留言多少条！', function () {
                $("#<%=this.tboxListReplayNum.ClientID %>").focus();
            });
            return false;
        }



    }

</script>

<style type="text/css">
table tr td { font-size:14px;height:30px; line-height:30px;}
.msgtips { color:#aaa; font-size:12px; line-height:30px; height:30px;}
.textbox { height:30px;  font-size:14px;}
</style>


            <tr class="tdbg">
              <td class="clefttitle">空间名称：</td>
              <td> <asp:TextBox ID="TxtBlogName" CssClass="textbox"  Enabled="true" runat="server" value="" style="width:250px;"></asp:TextBox>
               <span class="msgtips">空间站点的名称。如我的家园，我的博客等</span></td>
            </tr>
			
            <tr class="tdbg">
              <td class="clefttitle">Logo地址：</td>
              <td>


              <span style="display:none"><asp:TextBox ID="txtLogo" CssClass="textbox" runat="server"></asp:TextBox>
        </span> <span class="tips"></span>
              <div id="uppannel" class="tx_box" style="width:480px;height:40px;">
                   <%=Kesion.APPCode.UploadAPI.EchoUpload("spacelogo",this.txtLogo.ClientID) %>
            </div>
              
                <div class="ar_r_t"><div class="ar_l_t"><div class="ar_r_b"><div class="ar_l_b"><img id="blogLogo" onerror="this.src='../../sysimg/nopic.gif';" userface="" src="<%=avatar %>" style="height:140px;width:130px;border-width:0px;" /></div></div></div></div>

               
             </td>
            </tr>
      
            <tr class="tdbg">
              <td class="clefttitle">空间分类：</td>
              <td>
               <asp:DropDownList ID="DrpClassID" runat="server">
                    
               </asp:DropDownList>
              
               <span class="msgtips">空间站点分类，以便游客查找</span>
                  
                 
                  
                  </td>
            </tr>
            <tr class="tdbg">
              <td class="clefttitle">站点描述：</td>
              <td><textarea class="textbox" runat="server" name="txtDescript" id="txtDescript" style="width:80%;height:60px" cols=50 rows=6>本空间欢迎大家一块交流讨论KesionICMS,包括她的使用心得,使用方法和新版开发建议..</textarea>
              
              
              
              <br/><span class="msgtips">关于您的空间站点介绍</span> </td>
            </tr>
            <tr class="tdbg">
              <td class="clefttitle">空间公告：</td>
              <td><textarea class="textbox" runat="server" name="txtAnnounce" id="txtAnnounce" style="width:80%;height:80px" cols=50 rows=6>KesionICMS 测试版本发布！！！</textarea><br/><span class="msgtips">发布您的最新活动公告，让更多用户了解您。</span></td>
            </tr>
            <tr class="tdbg" style="display:none;">
              <td class="clefttitle">新 鲜 事：</td>
              <td>列表页每页显示<asp:TextBox ID="tboxContentLen" CssClass="textbox"  Enabled="true" runat="server" style="width:50px; border-top:none; border-left:none; border-right:none;"></asp:TextBox> 条  <span class="msgtips">指空间新鲜事列表页里，每页显示新鲜事条数。</span>    </td>
            </tr>
            <tr class="tdbg" style="display:none;">
              <td class="clefttitle">显示博文：</td>
              <td>首页显示博文<asp:TextBox ID="tboxListBlogNum" CssClass="textbox"  Enabled="true" runat="server" style="width:50px; border-top:none; border-left:none; border-right:none;"></asp:TextBox>篇 <span class="msgtips">空间首页显示博文条数。</span>             </td>
            </tr>
            <tr class="tdbg" style="display:none;">
              <td class="clefttitle">显示回复：</td>
              <td>首页显示回复<asp:TextBox ID="tboxListReplayNum" CssClass="textbox"  Enabled="true" runat="server" style="width:50px; border-top:none; border-left:none; border-right:none;"></asp:TextBox>条  <span class="msgtips">空间首页显示最新回复条数。</span>              </td>
            </tr>
            <tr class="tdbg" style="display:none;">
              <td class="clefttitle">博文列表：</td>
              <td>列表页显示博文<asp:TextBox ID="tboxListLogNum" CssClass="textbox"  Enabled="true" runat="server" style="width:50px; border-top:none; border-left:none; border-right:none;"></asp:TextBox>篇  <span class="msgtips">空间首页显示最新博文篇数。 </span>             </td>
            </tr>
            <tr class="tdbg" style="display:none;">
              <td  class="clefttitle">显示留言：</td>
              <td  valign=top>首页显示留言<asp:TextBox ID="tboxListGuestNum" CssClass="textbox"  Enabled="true" runat="server" style="width:50px; border-top:none; border-left:none; border-right:none;"></asp:TextBox>条    <span class="msgtips">空间首页显示最新留言条数。</span>        </td>
            </tr>

            <tr class="tdbg">
			  <td></td>
              <td height="30"><br />
			    <asp:Button ID="Button1"  CssClass="button" OnClientClick="return(checkform())" 
                      runat="server" Text="OK,提交修改" onclick="Button1_Click" />
                </td>
            </tr>

                  
</table>


</asp:Content>

