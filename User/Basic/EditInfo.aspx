<%@ Page Language="C#" MasterPageFile="~/User/User.master" ValidateRequest="false" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.User_EditInfo" Title="Untitled Page" Codebehind="EditInfo.aspx.cs" %>
<asp:Content ID="Content1" ContentPlaceHolderID="KSContent" Runat="Server">

<script type="text/javascript" src="<%=ResolveUrl("~/KS_Inc/DatePicker/WdatePicker.js") %>"></script>
    <% Kesion.APPCode.EditorAPI.EchoHead();%>
<script>
    function checkform() {
        if ($("#<%=this.TxtRealName.ClientID %>").val() == '') {
            $.dialog.alert('������������ʵ����!', function() {
                $("#<%=this.TxtRealName.ClientID %>").focus();
            });
            return false;

        }
    return true;
    }
</script>

<div class="tabs">	
			<ul>
				<li class='puton'><a href="editinfo.aspx">�޸��ҵ�����</a></li>
				<li><a href="userFace.aspx">�ϴ�ͷ��</a></li>
				<li><a href="editPass.aspx">�޸�����</a></li>
				<li><a href="EditQuestion.aspx">�޸İ�ȫ����</a></li>
			</ul>
</div>


 <table  cellspacing="1" cellpadding="3" class="border" width="100%" align="center" border="0">
	   <tr class="title">
         <td colspan="2"> �� �� �� Ϣ</td>
        </tr>
        <tr class="tdbg">
         <td class="lefttd">�û����ƣ�</td>
         <td><asp:TextBox ID="UserName" CssClass="textbox" ReadOnly="true" Enabled="false" runat="server"></asp:TextBox></td>
        </tr>

        <tr class="tdbg">
        <td class="lefttd">�������䣺</td>
        <td><asp:TextBox ID="Email" runat="server" CssClass="textbox" MaxLength="100"></asp:TextBox><span class="tips">���������������ַ��</span></td>
        </tr>
        <tr class="tdbg">
        <td class="lefttd">��ʵ������</td>
        <td><asp:TextBox ID="TxtRealName" runat="server" CssClass="textbox" MaxLength="10"></asp:TextBox><span class="tips">������������ʵ������</span></td>
        </tr>       
        <tr class="tdbg">
        <td class="lefttd">���ڵ�����</td>
        <td>
            <%=string.Format(@"<script src='../../plus/area.aspx?classname=textbox&pid={0}&cityid={1}&countyid={2}'></script>", __info.ProID, __info.CityID, __info.CountyId) %>
        </td>
        </tr>
        <tr class="tdbg">
         <td class="lefttd">���ֻ���</td>
         <td>
         <%if (string.IsNullOrEmpty(__info.Mobile))
           {
               Response.Write("δ��");
           }
           else
           {
               Response.Write(__info.Mobile);
           } %>
         <span class="tips"><a href="MobileBind.aspx" style="font-weight:bold">�󶨹���</a></span></td>
        </tr>
        <tr class="tdbg">
            <td class="lefttd">�Ա�</td>
         <td>
          <asp:RadioButtonList ID="RdbSex" runat="server" RepeatDirection="Horizontal">
           <asp:ListItem Value="��" Selected="True">��</asp:ListItem>
           <asp:ListItem Value="Ů">Ů</asp:ListItem>
          </asp:RadioButtonList>
         </td>
        </tr>
        </table>


          <br>
          <style>
			.reg_box_l{ }
.reg_box_l ul li span.title{width:160px;float:left; line-height:23px;font-size:14px; text-align:right;padding-right:5px}
.reg_box_l ul li{ clear:both;padding:4px;}
.reg_box_l ul li span font{color:#e00;font-size:14px;margin-right:5px;}
.reg_box_l .det{ clear:both;width:100%;border-top:1px dotted #ddd;margin-top:5px;padding-top:10px}
.reg_box_l .tr_sex{height:15px;padding-top:2px; float:left}
.reg_box_l .rdiv{float:left;}
.d_default {  float:left; padding-left:6px; color:#666;width:200px;}
			</style>
<table  cellspacing="1" cellpadding="3" class="border" width="98%" align="center" border="0">
	       <tr class="title">
                            <td> �� �� ѡ ��</td>
           </tr>
                          <tr>
                          <td>
                          <div class="reg_box_l">
			                 <ul id="diyoption" runat="server">
                               </ul>
                            </div>
            
                          </td>
                          </tr>
      </table>
    
      <div style="text-align:center"><asp:Button ID="Button1" OnClientClick="return(checkform())" CssClass="button" runat="server" Text="OK,�ύ�޸�" OnClick="Button1_Click" />&nbsp;<input type="reset" class="button" value="����¼��" /></div>

</asp:Content>

