<%@ Page Language="C#" enableEventValidation="false" viewStateEncryptionMode ="Never" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.Admin_Safe" Title="��ȫѡ������" Codebehind="KS.Safe.aspx.cs" %>
<%@ Import Namespace="Kesion.Cache" %>
<asp:Content ID="Content1" ContentPlaceHolderID="KSContent" Runat="Server">
    <KS:topnav id="TopNav1" runat="server" text="ϵͳ��ȫѡ������"></KS:topnav>
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
                <strong>��̨Ŀ¼��</strong></td>
            <td class="righttd"><asp:TextBox CssClass="textbox" ID="AdminDir" runat="server" Width="119px"></asp:TextBox>&nbsp;<asp:RequiredFieldValidator
                    ID="RequiredFieldValidator1" ControlToValidate="AdminDir" runat="server" ErrorMessage="��̨Ŀ¼��������" Display="Dynamic"></asp:RequiredFieldValidator>
                <br />
                <span class="tips">�磺manage,admin�ȵȣ����ܴ���/�����Ҳ�����ϵͳ�����е��ļ���ͬ����
                �����޸ĺ󣬲����޸�ʵ�ʵ��ļ������ƣ�ϵͳ������αĿ¼����</span>

            </td>
        </tr>
          <tr>
            <td class="lefttd" height="30" align="right" style="width: 198px"><b>��̨�Ƿ�������֤�룺</b></td>
            <td class="righttd"><asp:RadioButtonList ID="RdbEnableSiteManageCode" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow">
             <asp:ListItem Value="1">����</asp:ListItem>
             <asp:ListItem Value="0" Selected="true">������</asp:ListItem>
            </asp:RadioButtonList>
            </td>
          </tr>
        <tr id="rzm">
            <td align="right" class="lefttd" height="30" style="width: 198px">
                <strong>��̨��֤�룺</strong><br /><font color=#ff0000>ϵͳĬ�ϵ���֤��Ϊ8888,Ϊ��ϵͳ�İ�ȫ�뼰ʱ�޸ġ�</font></td>
            <td class="righttd"><asp:TextBox MaxLength="50" CssClass="textbox" ID="SiteManageCode" runat="server" Width="107px"></asp:TextBox></td>
        </tr>
        <tr>
            <td align="right" class="lefttd" height="30" style="width: 198px">
                <strong>��̨��¼����ʱ�䣺</strong></td>
            <td class="righttd"><asp:TextBox CssClass="textbox" ID="AdminExpireTime" runat="server" Width="46px"></asp:TextBox>
                ����</td>
        </tr>
        <tr>
            <td align="right" class="lefttd" height="30" style="width: 198px">
                <strong>��̨��¼����������������룺</strong></td>
            <td class="righttd"><input type="radio" runat="server" id="SofeWareKeyBoardTrue" name="SofeKeyBoardTF" value="1" />����<input type="radio" runat="server" id="SofeWareKeyBoardFalse" name="SofeKeyBoardTF" value="0" />������
            </td>
        </tr>
        <tr>
            <td align="right" class="lefttd" height="30" style="width: 198px">
                <strong>��̨��¼�����ֻ�������֤�룺</strong></td>
            <td class="righttd">
            <asp:RadioButtonList ID="RdbManageByMobileCode" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow">
             <asp:ListItem Value="true">����</asp:ListItem>
             <asp:ListItem Value="false" Selected="true">������</asp:ListItem>
            </asp:RadioButtonList>
            <div class="tips">
             ���ô˹��ܣ���ȷ����<a href="KS.SMSAPI.aspx">[���Žӿ�API����]</a>���п��õĽӿڶ��ţ������п��ö�����
             ������ڶ���������Ƕ�ͣ��Ӫ�̶��ŷ���ʧ�ܵ����޷���¼��̨�����ֹ���conn.config,�ҵ���ManageByMobileCode���ڵ㣬��������Ϊfalse������ȡ����¼��̨��Ҫ�ֻ�������֤��
            </div>
            <div id="mobile">
            <strong>������ն��ŵ��ֻ��ţ�</strong>
             <asp:TextBox ID="TxtManageLoginAllowMobile" width="300px" runat="server" CssClass="textbox" />
             <br /><span class="tips">������պ�̨��¼���ŵ��ֻ��ţ�����ֻ�������Ӣ�Ķ��Ÿ������� 1350000000,1360000000�ȡ�</span>
            </div>
            </td>
        </tr>
        <tr>
            <td align="right" class="lefttd" height="30" style="width: 198px">
                <strong>��Ҫ��֤���ҳ�棺</strong></td>
            <td class="righttd">
               <table border="0" width="98%" cellpadding="0" cellspacing="0">
               <tr>
                 <td>
                 <input type="checkbox" name="code1" id="v1" onclick="checkselecedpage()"/><label for="v1">��̨��¼</label>
                 <input type="checkbox" name="code2" id="v2" onclick="checkselecedpage()"/><label for="v2">��Աע��</label>
                 <input type="checkbox" name="code3" id="v3" onclick="checkselecedpage()"/><label for="v3">��Ա��¼</label>
                 <input type="checkbox" name="code4" id="v4" onclick="checkselecedpage()"/><label for="v4">��Աȡ������</label>
                 <input type="checkbox" name="code5" id="v5" onclick="checkselecedpage()"/><label for="v5">������������</label>
                 <input type="checkbox" name="code6" id="v6" onclick="checkselecedpage()"/><label for="v6">��������</label>
                 <input type="checkbox" name="code7" id="v7" onclick="checkselecedpage()"/><label for="v7">�ʴ�ϵͳ����</label>
                 <input type="checkbox" name="code8" id="v8" onclick="checkselecedpage()"/><label for="v8">�ʴ�ش�����</label>
                 <input type="checkbox" name="code9" id="v9" onclick="checkselecedpage()"/><label for="v9">��̳������</label>
                 <input type="checkbox" name="code10" id="v10" onclick="checkselecedpage()"/><label for="v10">��̳�ظ�����</label>
                 
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
                <strong>�˺Ű�ȫ����</strong></td>
            <td class="righttd">
              ǰ��̨��¼ÿ��IP����������� <asp:TextBox ID="TxtPassErrorNum" style="text-align:center" runat="server" Text="0" CssClass="textbox" Width="50px" />�Ρ��˺�����<asp:TextBox style="text-align:center" runat="server" ID="TxtPassErrLimitTime" Text="0" CssClass="textbox" Width="50px" />
                ����<br />
              ÿ��IPÿ��ֻ���ã� <asp:TextBox ID="TxtGetPassNum" style="text-align:center" runat="server" Text="0" CssClass="textbox" Width="50px" />���һ����빦��<br />

                <span class="tips">Tips:�����������롰0����</span>
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

