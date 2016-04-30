<%@ Page Language="C#" MasterPageFile="~/User/User.master" ValidateRequest="false" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.User_User_MobileBind" Title="Untitled Page" Codebehind="MobileBind.aspx.cs" %>
<%@ Import Namespace="Kesion.Cache" %>
<asp:Content ID="Content1" ContentPlaceHolderID="KSContent" Runat="Server">

    <script>
    function checkform() {
        if ($("#<%=this.TxtMobile.ClientID %>").val() == '') {
            KesionJS.Alert('请输入您的手机号码！', "$('#<%=this.TxtMobile.ClientID %>').focus()");
            return false;
        }
        <%if (EnabledSms == 1)
         { %>
            if ($("#<%=this.TxtMobileCode.ClientID %>").val() == '') {
               KesionJS.Alert('请输入手机验证码！', "$('#<%=this.TxtMobileCode.ClientID %>').focus()");
               return false;
               }
        <%} %>

    }
var OutTimes=<%=MyCache.GetCacheConfig(38) %>;
var SessionID="<%=SessionID %>";
 function leavePage() {
		 if (OutTimes==0){
		 $("#SendMobileBtn").attr("disabled",false);
		 $("#SendMobileBtn").val("免费获取手机验证码")
		 }
		 else{
		 OutTimes -= 1;
		 $("#SendMobileBtn").val("已发，如果"+OutTimes+"秒后没有收到，可以重发!")
		 setTimeout("leavePage()", 1000);}
}

function getMobileCode(){
	var mobile=$("#<%=this.TxtMobile.ClientID %>").val();
	if (mobile==''){
	  $.dialog.alert('请输入手机号码！',function(){ $("#<%=this.TxtMobile.ClientID %>").focus();});
	   return false;
	}
	if (ismobile(mobile)==false){
	  $.dialog.alert('手机号码格式不正确，请重新输入！',function(){ $("#<%=this.TxtMobile.ClientID %>").focus();});
	  return false;
	}
	$("#SendMobileBtn").attr("disabled",true);
	$.ajax({type:"get",async:false,url:"../regajax.ashx?action=sendmobilecode&model=modifymobile&mobile="+mobile+"&SessionID="+SessionID+"&anticache=" + Math.floor(Math.random()*1000),cache:false,dataType:"html",success:function(d){
		 if (d=='true'){
			leavePage();
		 }else{
			$.dialog.alert(d,function(){ $("#SendMobileBtn").attr("disabled",false); });
		 }
	}});
	return false;
	
}
</script>

 <table  cellspacing="1" cellpadding="3" class="border" width="98%" align="center" border="0">
	                   <tr class="title">
                            <td colspan="2"> 绑定手机 </td>
                          </tr>
                          <%if (__info.IsMobileRZ == 1)
                            { %>
                          
                          <tbody id="MobileRZ">
                           <tr class="tdbg"  style="font-size:14px;color:green;line-height:30px;">
                            <td class="lefttd" style="width: 88px">温馨提示：</td>
                            <td>您的手机号码已经过本站认证绑定。</td>
                          </tr>
                           <tr class="tdbg">
                           <td  class="lefttd" height="50" style="width: 88px">手机号码：</td>
                           <td><%=__info.Mobile %>
                           <input type="button" class="button" value="修改绑定" onclick="$('#MobileRZ').hide();$('#ModifyMobile').show();"/>
                           
                            </td>
                          </tr>
                          </tbody>
                          <%}%>
                           
                          
                         <tbody id="ModifyMobile" <%=__info.IsMobileRZ == 1?" style='display:none'":""%>>
                          <tr class="tdbg">
                            <td  class="lefttd" style="width: 88px">手机号码：</td>
                            <td>
                            <asp:TextBox ID="TxtMobile" CssClass="textbox"  runat="server"></asp:TextBox><span class="tips">请输入您的手机号码。</span>
                            </td>
                          </tr>
                          
                          <%if (EnabledSms == 1)
                            { %>
                          <tr class="tdbg">
                            <td  class="lefttd" height="40" style="width: 88px">验 证 码：</td>
                            <td>
                            <asp:TextBox ID="TxtMobileCode" runat="server" CssClass="textbox" Width="50" MaxLength="6" />
                            <input type="button" id="SendMobileBtn" onclick="getMobileCode()" value="免费获取手机验证码"/>
                            </td>
                          </tr>
                         <%} %>
 
                          
						<tr class="tdbg">
                            <td class="lefttd" height="40" style="width: 88px">&nbsp;</td>
                            <td><asp:Button OnClientClick="return(checkform());" ID="Button1" CssClass="button" runat="server" OnClick="Button1_Click"
                                    Text="OK!确定修改" />
                               </td>
                        </tr>
                        </tbody>  
                        
                        <tr class="tdbg">
                            <td class="lefttd" valign="top" style="width: 88px">绑定手机：</td>
                            <td class="tips" align="left">
                                您可以免费享受(手机找回密码)、（余额支付手机验证功能）、 （网店订单处理提示）
                            
                               </td>
                        </tr>
            </table>
          <br>
         

</asp:Content>

