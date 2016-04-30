<%@ Page Language="C#" EnableEventValidation="false"  MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.Admin.Shop.Admin_ShopCouponPub" Title="优惠券发放管理" Codebehind="KS.ShopCouponPub.aspx.cs" %>
<asp:Content ID="Content1" ContentPlaceHolderID="KSContent" Runat="Server">
   <KS:TopNav ID="TopNav1" runat="server" />
    
    <asp:Panel ID="Panel1" runat="server" Width="100%" Visible="false">
    
<script type="text/javascript">
		 function searchUser()
		 {jQuery('#ajaxmsg',window.parent.document).fadeIn("slow");
					  var url = '../../plus/ajaxs.ashx'; 
					  jQuery.get(url,{a:"SearchUser",key:(jQuery("#key").val())},function(s){
					  jQuery('#ajaxmsg',window.parent.document).fadeOut("slow");
					   showResponse(s);
					  })    
		 }
		 function showResponse(s)
		  {
						  var result=s;
						  if (result!='')
						  {
							  var obj = jQuery('#user_search')[0];
							  obj.length = 0;
							  var rarr=result.split('|');
								for (var i = 0; i < rarr.length; i++)
								{
									 if (rarr[i]!=''){
									  var opt = document.createElement('OPTION');
									  opt.value = rarr[i];
									  opt.text  = rarr[i];
									  obj.options.add(opt);
									   }
								}
						  }
		 }
		function addUser()
				  {
					  var src = document.getElementById('user_search');
					  var dest = document.getElementById('user');
				
					  for (var i = 0; i < src.options.length; i++)
					  {
						  if (src.options[i].selected)
						  {
							  var exist = false;
							  for (var j = 0; j < dest.options.length; j++)
							  {
								  if (dest.options[j].value == src.options[i].value)
								  {
									  exist = true;
									  break;
								  }
							  }
							  if (!exist)
							  {
								  var opt = document.createElement('OPTION');
								  opt.value = src.options[i].value;
								  opt.text = src.options[i].text;
								  dest.options.add(opt);
							  }
						  }
					  }
				  }
				
				  function delUser()
				  {
					  var dest = document.getElementById('user');
				
					  for (var i = dest.options.length - 1; i >= 0 ; i--)
					  {
						  if (dest.options[i].selected)
						  {
							  dest.options[i] = null;
						  }
					  }
				  }
				function check()
				{
					var idArr = new Array();
					var dest = document.getElementById('user');
					for (var i = 0; i < dest.options.length; i++)
					{
						dest.options[i].selected = "true";
						idArr.push(dest.options[i].value);
					}
					if (idArr.length <= 0)
					{
						alert("你没有选择用户!");
						return false;
					}
					else
					{
						return true;
					}
				  
				}
				</script>    
        <table width="100%" border="0" cellpadding="1" cellspacing="1" class="CTable"> 
          <tr>
           <td colspan="2" class="lefttd" style="text-align:left;color:Red;font-weight:bold">1、按用户组发放</td>
          </tr>
          <tr>
            <td class="lefttd" height="30" align="right" style="width: 198px"><strong>选择用户组：</strong></td>
            <td class="righttd">
               <div id="GroupPanel" runat="server"></div> 
            </td>
          </tr>
          <tr>
            <td class="lefttd" height="30" align="right" style="width: 198px"><strong>邮件通知选项：</strong></td>
           <td class="righttd">
             <asp:CheckBox ID="CKB1" Text="发送Email邮件通知" Checked="true" runat="server" /><br />
             <asp:CheckBox ID="CKB2" Text="发送站内短消息通知" Checked="true" runat="server" /><br />
           </td>
          </tr>
          <tr>
           <td colspan="2" class="lefttd" style="text-align:center">
           
           <asp:Button ID="Button1" runat="server" CssClass="button" Text="确定发放优惠券" OnClick="Button1_Click" />
           </td>
          </tr>
         </table>
         <br />
        <table width="100%" border="0" cellpadding="1" cellspacing="1" class="CTable"> 
          <tr>
           <td colspan="3" class="lefttd" style="text-align:left;color:Red;font-weight:bold">2、按用户发放</td>
          </tr>
          <tr>
            <td class="righttd" colspan="3">
               <strong>关键字：</strong><input type="text" class="textbox" name="key" id="key" size="20"/>
               <input type="button" value="搜索用户" class="button" onclick="searchUser();"/>
            </td>
          </tr>
          <tr align='center'>
						<td height='25' class='clefttitle' style="text-align:center">会员列表</td>
						<td  class='clefttitle' style="text-align:center">操作</td>
						<td  class='clefttitle' style="text-align:center">给下列用户发放优惠券</td>
		  </tr>
          <tr align='center'>
						<td height='25' class='righttd' style="text-align:center">
						<select name="user_search" id="user_search" size="15" style="width:260px" ondblclick="addUser()" multiple="true">
						  </select>
						</td>
						<td  class='righttd' style="text-align:center">
						<p><input type="button" value=" > " onclick="addUser()" class="button" /></p>
						<br />
						<p><input type="button" value=" < " onclick="delUser()" class="button" /></p>
						</td>
						<td  class='righttd' style="text-align:center">
						<select name="user" id="user" multiple="true" size="15" style="width:260px" ondblclick="delUser()">
						  </select>
						</td>
		  </tr>
            <tr>
                <td colspan="3" >
                    <asp:CheckBox ID="CKB3" Text="发送Email邮件通知" Checked="true" runat="server" /><br />
                    <asp:CheckBox ID="CKB4" Text="发送站内短消息通知" Checked="true" runat="server" /><br />
                </td>
            </tr>
          
          
          <tr>
           <td colspan="3" class="lefttd" style="text-align:center">
           
           <asp:Button ID="Button2" runat="server" CssClass="button" Text="确定发放优惠券" OnClientClick="return(check())" OnClick="Button2_Click" />
           </td>
          </tr>
         </table>
         <br /><br />
     
    </asp:Panel>
    
    <asp:Panel ID="Panel2" runat="server" Width="100%" Visible="false">
        <table width="99%" align="center" border="0" cellpadding="1" cellspacing="1" class="CTable"> 
          <tr>
           <td colspan="2" class="lefttd" style="color:Red;font-weight:bold">批量生成优惠券号</td>
          </tr>
          <tr>
            <td class="lefttd" height="30" align="right" style="width: 198px"><strong>生成数量：</strong></td>
            <td class="righttd">
             <asp:TextBox ID="TxtNum" CssClass="textbox" runat="server" style="text-align:center;" Width="40px" Text="100"></asp:TextBox> 张
            </td>
          </tr>
          <tr>
           <td class="lefttd" colspan="2" style="text-align:center">
           <asp:Button ID="Button3" runat="server" CssClass="button" Text="确定批量生成优惠券号" OnClick="Button3_Click"/>
           </td>
          </tr>
         </table>
        <script type="text/javascript">
		showtips('<span class="state"><strong>操作说明：</strong><br /></span>1.当优惠券类型为线下发放时,必须先生成优惠券号<br />2.您可以将生成的优惠券号发放给用户使用<br />3.用户得到优惠券号后,可以在会员中心启用,每张优惠券号只能用一次<br />');
		</script>
    </asp:Panel>
    
</asp:Content>

