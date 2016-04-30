<%@ Page Language="C#" enableEventValidation="false" viewStateEncryptionMode ="Never" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.Admin_Safe" Title="安全选项设置" Codebehind="KS.Safe.aspx.cs" %>
<%@ Import Namespace="Kesion.Cache" %>
<asp:Content ID="Content1" ContentPlaceHolderID="KSContent" Runat="Server">
    <KS:topnav id="TopNav1" runat="server" text="系统安全选项设置"></KS:topnav>
    <script>
        function showwrzm() {
            var checkrad = jQuery("#<%=this.RdbEnableSiteManageCode.ClientID%> :radio[checked]").val();
             if (checkrad == "0") {
                 jQuery("#rzm").css("display", "none");
             } else {
                 jQuery("#rzm").css("display", "");
             }
         }
        function showmobile() {
            if (jQuery("#<%=this.RdbManageByMobileCode.ClientID %> :radio[checked]").val() == "true") {
                jQuery("#mobile").show();
            } else {
                jQuery("#mobile").hide();
            }

        }
        jQuery(document).ready(function() {
            showmobile();
            showwrzm();
        });
</script>
    <table id="tbs" width="99%" border="0" cellpadding="1" cellspacing="1" class="CTable"> 
        <tr>
            <td align="right" class="lefttd" height="30" style="width: 198px">
                <strong>后台目录：</strong></td>
            <td class="righttd"><asp:TextBox CssClass="textbox" ID="AdminDir" runat="server" Width="119px"></asp:TextBox>&nbsp;<asp:RequiredFieldValidator
                    ID="RequiredFieldValidator1" ControlToValidate="AdminDir" runat="server" ErrorMessage="后台目录必须输入" Display="Dynamic"></asp:RequiredFieldValidator>
                <br />
                <span class="tips">如：manage,admin等等，不能带＂/＂，且不能与系统里已有的文件夹同名。
                这里修改后，不用修改实际的文件夹名称，系统将采用伪目录管理。</span>

            </td>
        </tr>
          <tr>
            <td class="lefttd" height="30" align="right" style="width: 198px"><b>后台是否启用认证码：</b></td>
            <td class="righttd"><asp:RadioButtonList ID="RdbEnableSiteManageCode" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow">
             <asp:ListItem Value="1">启用</asp:ListItem>
             <asp:ListItem Value="0" Selected="true">不启用</asp:ListItem>
            </asp:RadioButtonList>
            </td>
          </tr>
        <tr id="rzm">
            <td align="right" class="lefttd" height="30" style="width: 198px">
                <strong>后台认证码：</strong><br /><font color=#ff0000>系统默认的认证码为8888,为了系统的安全请及时修改。</font></td>
            <td class="righttd"><asp:TextBox MaxLength="50" CssClass="textbox" ID="SiteManageCode" runat="server" Width="107px"></asp:TextBox></td>
        </tr>
        <tr>
            <td align="right" class="lefttd" height="30" style="width: 198px">
                <strong>后台登录过期时间：</strong></td>
            <td class="righttd"><asp:TextBox CssClass="textbox" ID="AdminExpireTime" runat="server" Width="46px"></asp:TextBox>
                分钟</td>
        </tr>
        <tr>
            <td align="right" class="lefttd" height="30" style="width: 198px">
                <strong>后台登录密码启用软键盘输入：</strong></td>
            <td class="righttd"><input type="radio" runat="server" id="SofeWareKeyBoardTrue" name="SofeKeyBoardTF" value="1" />启用<input type="radio" runat="server" id="SofeWareKeyBoardFalse" name="SofeKeyBoardTF" value="0" />不启用
            </td>
        </tr>
        <tr>
            <td align="right" class="lefttd" height="30" style="width: 198px">
                <strong>后台登录启用手机短信验证码：</strong></td>
            <td class="righttd">
            <asp:RadioButtonList ID="RdbManageByMobileCode" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow">
             <asp:ListItem Value="true">启用</asp:ListItem>
             <asp:ListItem Value="false" Selected="true">不启用</asp:ListItem>
            </asp:RadioButtonList>
            <div class="tips">
             启用此功能，请确保在<a href="KS.SMSAPI.aspx">[短信接口API配置]</a>里有可用的接口短信，并且有可用短信余额。
             如果由于短信余额不足或是短停运营商短信发送失败导致无法登录后台，请手工打开conn.config,找到“ManageByMobileCode”节点，将其设置为false，即可取消登录后台需要手机短信验证。
            </div>
            <div id="mobile">
            <strong>允许接收短信的手机号：</strong>
             <asp:TextBox ID="TxtManageLoginAllowMobile" width="300px" runat="server" CssClass="textbox" />
             <br /><span class="tips">允许接收后台登录短信的手机号，多个手机号请用英文逗号隔开，如 1350000000,1360000000等。</span>
            </div>
            </td>
        </tr>
        <tr>
            <td align="right" class="lefttd" height="30" style="width: 198px">
                <strong>需要验证码的页面：</strong></td>
            <td class="righttd">
               <table border="0" width="98%" cellpadding="0" cellspacing="0">
               <tr>
                 <td>
                 <input type="checkbox" name="code1" id="v1" onclick="checkselecedpage()"/><label for="v1">后台登录</label>
                 <input type="checkbox" name="code2" id="v2" onclick="checkselecedpage()"/><label for="v2">会员注册</label>
                 <input type="checkbox" name="code3" id="v3" onclick="checkselecedpage()"/><label for="v3">会员登录</label>
                 <input type="checkbox" name="code4" id="v4" onclick="checkselecedpage()"/><label for="v4">会员取回密码</label>
                 <input type="checkbox" name="code5" id="v5" onclick="checkselecedpage()"/><label for="v5">申请友情链接</label>
                 <input type="checkbox" name="code6" id="v6" onclick="checkselecedpage()"/><label for="v6">发表评论</label>
                 <input type="checkbox" name="code7" id="v7" onclick="checkselecedpage()"/><label for="v7">问答系统提问</label>
                 <input type="checkbox" name="code8" id="v8" onclick="checkselecedpage()"/><label for="v8">问答回答问题</label>
                 <input type="checkbox" name="code9" id="v9" onclick="checkselecedpage()"/><label for="v9">论坛发表话题</label>
                 <input type="checkbox" name="code10" id="v10" onclick="checkselecedpage()"/><label for="v10">论坛回复话题</label>
                 
                 </td>
                <td style="text-align: right;display:none;">
                
                    <asp:TextBox ID="NeedVerifyCodePage" runat="server" Height="106px" TextMode="MultiLine" Width="206px"></asp:TextBox>
                </td>
               </tr>
               </table>
                
                </td>
        </tr>
         <tr>
            <td align="right" class="lefttd" height="30" style="width: 198px">
                <strong>账号安全设置</strong></td>
            <td class="righttd">
              前后台登录每个IP密码连续输错： <asp:TextBox ID="TxtPassErrorNum" style="text-align:center" runat="server" Text="0" CssClass="textbox" Width="50px" />次　账号锁定<asp:TextBox style="text-align:center" runat="server" ID="TxtPassErrLimitTime" Text="0" CssClass="textbox" Width="50px" />
                分钟<br />
              每个IP每天只能用： <asp:TextBox ID="TxtGetPassNum" style="text-align:center" runat="server" Text="0" CssClass="textbox" Width="50px" />次找回密码功能<br />

                <span class="tips">Tips:不限制请输入“0”。</span>
            </td>
        </tr>

    </table>
    <br />
    <KS:Foot runat="server" CancelButtonVisible="false" ID="Foot1" OnSubmit="Foot1_Submit"/>
    <KS:Tips ID="Tips1" runat="server" ImagePath="../../admin/images/tipsico/" />
    
    <script type="text/javascript" language="javascript">
var seccodestatus='<%=ViewState["NeedVerifyCodePage"].ToString().Trim()%>';

loadseccodestatus();
function loadseccodestatus()
{
	if(seccodestatus.indexOf('login.aspx')==0) 
	{
		document.getElementById("v1").checked=true;
	}  

	if(seccodestatus.indexOf('user/userreg.aspx')>=0) 
	{
		document.getElementById("v2").checked=true;
	}  

	if(seccodestatus.indexOf('user/login.aspx')>=0) 
	{
		document.getElementById("v3").checked=true;
	}  

	if(seccodestatus.indexOf('user/getpassword.aspx')>=0) 
	{
		document.getElementById("v4").checked=true;
	}  

	if(seccodestatus.indexOf('plus/link/apply.aspx')>=0) 
	{
		document.getElementById("v5").checked =true;
	}

	if (seccodestatus.indexOf('plus/comment.aspx') >= 0) {
	    document.getElementById("v6").checked = true;
	}

	if (seccodestatus.indexOf('<%=MyCache.GetAskCacheConfig(1).ToLower()%>/ask.aspx') >= 0) {
	    document.getElementById("v7").checked = true;
	}
    if (seccodestatus.indexOf('<%=MyCache.GetAskCacheConfig(1).ToLower()%>/question.aspx') >= 0) {
	    document.getElementById("v8").checked = true;
	}  
    if (seccodestatus.indexOf('<%=MyCache.GetBBSCacheConfig(1).ToLower()%>/post.aspx') >= 0) {
        document.getElementById("v9").checked = true;
    }
    if (seccodestatus.indexOf('<%=MyCache.GetBBSCacheConfig(1).ToLower()%>/reply.aspx') >= 0) {
        document.getElementById("v10").checked = true;
    }

}

function checkselecedpage()
{
	jQuery("#<%=NeedVerifyCodePage.ClientID %>").val('');
    var selectstr='';
    
    if(document.getElementById("v1").checked)
    {
       selectstr+='login.aspx\r\n';
    }
    
    if(document.getElementById("v2").checked)
    {
       selectstr+='user/userreg.aspx\r\n';
    }
    if(document.getElementById("v3").checked)
    {
       selectstr+='user/login.aspx\r\n';
    }
    if(document.getElementById("v4").checked)
    {
       selectstr+='user/getpassword.aspx\r\n';
    }
    if(document.getElementById("v5").checked)
    {
       selectstr+='plus/link/apply.aspx\r\n';
    }
    if (document.getElementById("v6").checked) {
        selectstr += 'plus/comment.aspx\r\n';
    }

    if (document.getElementById("v7").checked) {
        selectstr += '<%=MyCache.GetAskCacheConfig(1).ToLower()%>/ask.aspx\r\n';
    }
    if (document.getElementById("v8").checked) {
        selectstr += '<%=MyCache.GetAskCacheConfig(1).ToLower()%>/question.aspx\r\n';
    }
    if (document.getElementById("v9").checked) {
        selectstr += '<%=MyCache.GetBBSCacheConfig(1).ToLower()%>/post.aspx\r\n';
    }
    if (document.getElementById("v10").checked) {
        selectstr += '<%=MyCache.GetBBSCacheConfig(1).ToLower()%>/reply.aspx\r\n';
    }

    
	jQuery("#<%=NeedVerifyCodePage.ClientID %>").val(selectstr);
}


</script>	
</asp:Content>

