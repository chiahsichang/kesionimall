<%@ Page Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.Admin_UserAdd" Title="Untitled Page" Codebehind="KS.UserAdd.aspx.cs" %>
<asp:Content ID="Content1" ContentPlaceHolderID="KSContent" Runat="Server">
    <asp:Panel ID="AddPanel" runat="server" Width="100%">

      <div id="manage_top" class="toptitle menu_top_fixed" style="text-align:left;">����������<a href="KS.UserAdd.Aspx">�����û�</a> | <a href="KS.UserImport.Aspx">�ⲿ����Դ��������</a></div>
        <div class="menu_top_fixed_height"></div> 

        	<div class="tab-page" id="AddUserPanel">
         <script type="text/javascript">
             var tabPane1 = new WebFXTabPane(document.getElementById("AddUserPanel"), 1)
         </script>
             <style>
			.reg_box_l{ width:800px;}
.reg_box_l ul li span.title{width:80px;float:left; line-height:23px; text-align:right;padding-right:5px}
.reg_box_l ul li{ clear:both;padding:4px;}
.reg_box_l ul li span font{color:#e00;font-size:14px;margin-right:5px;}
.text{width:100px;padding-left:5px;height:24px; line-height:24px;margin-right:5px;border:1px solid #ccc; float:left}
.reg_box_l .det{ clear:both;width:100%;border-top:1px dotted #ddd;margin-top:5px;padding-top:10px}
.reg_box_l .tr_sex{height:15px;padding-top:2px; float:left}
.reg_box_l .rdiv{float:left;}
.d_default {  float:left; padding-left:6px; color:#666;width:200px;}
			</style>
		 <div class="tab-page" id="tab0">
		  <h2 class="tab">������Ϣ</h2>
			<script type="text/javascript">
						 tabPane1.addTabPage( document.getElementById( "tab0" ) );
			</script>
			
             <table width="100%" border="0" cellpadding="1" cellspacing="1" class="CTable">

          <tr>
              <td align="right" class="lefttd" height="30" style="width: 84px">
                  <strong>�û����ͣ�</strong></td>
              <td class="righttd">
              <span id="groupidarea" runat="server"></span>
              </td>
          </tr>
          <tr>
             <td align="right" class="lefttd" height="30" style="width: 84px"><strong>�������ţ�</strong></td>
             <td class="righttd">
                &nbsp;<asp:DropDownList ID="DrpDepartID" runat="server">
                 <asp:ListItem Value="0">--�������κβ���--</asp:ListItem>
                </asp:DropDownList>
             </td>
          </tr>
          <tr id="AskRank" runat="server">
             <td align="right" class="lefttd" height="30" style="width: 84px"><strong>�ʰɵȼ���</strong></td>
             <td class="righttd">
                &nbsp;<asp:DropDownList ID="DrpAskRankId" runat="server">
                 <asp:ListItem Value="0">--�������ʰɵȼ�--</asp:ListItem>
                </asp:DropDownList>
             </td>
          </tr>
          <tr>
            <td class="lefttd" height="30" align="right" style="width: 84px"><b>��Ա���ƣ�</b></td>
            <td class="righttd">
                &nbsp;<asp:TextBox CssClass="textbox" ID="UserName" runat="server" Width="268px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="UserName"
                    ErrorMessage="����д�û���¼����!" Display="Dynamic"></asp:RequiredFieldValidator>
                   <span class="tips">����ʹ��Ӣ�����ơ�</span> 
                    </td>
          </tr>
          <tr>
              <td align="right" class="lefttd" height="30" style="width: 84px">
                  <strong>��¼���룺</strong></td>
              <td class="righttd">
                  &nbsp;<asp:TextBox CssClass="textbox" ID="PassWord" runat="server" TextMode="password" Width="268px"></asp:TextBox>
                  <asp:RequiredFieldValidator ID="ValidatorPass" runat="server" ControlToValidate="PassWord"
                      ErrorMessage="�������¼����!" Display="Dynamic"></asp:RequiredFieldValidator>
                      <asp:Label ID="passtips" CssClass="tips" runat="server"></asp:Label>
                     <span class="tips">�������ò�����6λ��</span>  </td>
          </tr>
          <tr>
              <td align="right" class="lefttd" height="30" style="width: 84px">
                  <strong>�������䣺</strong></td>
              <td class="righttd">
                  &nbsp;<asp:TextBox CssClass="textbox" ID="Email" runat="server" Width="268px"></asp:TextBox>
                 
                  <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="Email"
                      Display="Dynamic" ErrorMessage="���������ʽ����ȷ!" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                      <span class="tips">�磺kesioncms@hotmail.com</span>
                      </td>
          </tr>
          <tr>
              <td align="right" class="lefttd" height="30" style="width: 84px">
                  <strong>�ֻ����룺</strong></td>
              <td class="righttd">
                  &nbsp;<asp:TextBox CssClass="textbox" ID="TxtMobile" runat="server" Width="168px"></asp:TextBox>
                <strong>�����ֻ���������֤��</strong><asp:RadioButtonList ID="RdbIsMobileRZ" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow">
                   <asp:ListItem Value="0" Selected>��</asp:ListItem>
                   <asp:ListItem Value="1">��</asp:ListItem>
                  </asp:RadioButtonList> </td>
          </tr>
         
          <tr>
              <td align="right" class="lefttd" height="30" style="width: 84px">
                  <strong>��ʾ���⣺</strong></td>
              <td class="righttd">
              &nbsp;<asp:DropDownList ID="Question" runat="server">
                    <asp:ListItem>�ҵĳ������֣�</asp:ListItem>
                    <asp:ListItem>����õ�������˭��</asp:ListItem>
                    <asp:ListItem>����ϲ������ɫ��</asp:ListItem>
                    <asp:ListItem>����ϲ���ĵ�Ӱ��</asp:ListItem>
                    <asp:ListItem>����ϲ����Ӱ�ǣ�</asp:ListItem>
                    <asp:ListItem>����ϲ���ĸ�����</asp:ListItem>
                    <asp:ListItem>����ϲ����ʳ�</asp:ListItem>
                    <asp:ListItem>�����İ��ã�</asp:ListItem>
                    <asp:ListItem>����ѧУ��ȫ����ʲô��</asp:ListItem>
                    <asp:ListItem>�ҵ��������ǣ�</asp:ListItem>
                    <asp:ListItem>����ϲ����С˵�����֣�</asp:ListItem>
                    <asp:ListItem>����ϲ���Ŀ�ͨ�������֣�</asp:ListItem>
                    <asp:ListItem>��ĸ��/���׵����գ�</asp:ListItem>
                    <asp:ListItem>�������͵�һλ���˵����֣�</asp:ListItem>
                    <asp:ListItem>����ϲ�����˶���ȫ�ƣ�</asp:ListItem>
                    <asp:ListItem>����ϲ����һ��Ӱ��̨�ʣ�</asp:ListItem>
              </asp:DropDownList>
              </td>
          </tr>
          <tr>
              <td align="right" class="lefttd" height="30" style="width: 84px">
                  <strong>����𰸣�</strong></td>
              <td class="righttd">
                  &nbsp;<asp:TextBox CssClass="textbox" ID="Answer" runat="server" Width="268px"></asp:TextBox>
                  </td>
          </tr>
          <tr>
              <td align="right" class="lefttd" height="30" style="width: 84px">
                  <strong>���ڵ�����</strong></td>
              <td class="righttd">
                  &nbsp;<asp:Label ID="LabArea" runat="server"></asp:Label></td>
          </tr>
          <tr>
              <td align="right" class="lefttd" height="30" style="width: 84px">
                  <strong>��Աͷ��</strong></td>
              <td class="righttd">
                  &nbsp;<asp:TextBox CssClass="textbox" ID="TxtUserFace" runat="server" Width="268px"></asp:TextBox>
                <input type="button" class="button" onclick="SelectFiles('<%=this.TxtUserFace.ClientID %>',0);" value="ѡ��ͼƬ">  </td>
          </tr>
          <tr style="display:none">
              <td align="right" class="lefttd" style="width: 84px; height: 37px;">
                  <strong>�Ʒѷ�ʽ��</strong></td>
              <td class="righttd" style="height: 37px">
              <asp:RadioButtonList ID="ChargeType" runat="server" RepeatDirection="Horizontal">
                      <asp:ListItem Selected="True" Value="1">�Ƶ���</asp:ListItem>
                      <asp:ListItem Value="2">��Ч��</asp:ListItem>
                      <asp:ListItem Value="3">������</asp:ListItem>
                  </asp:RadioButtonList>
              </td>
          </tr>
          <tr>
              <td align="right" class="lefttd" height="30" style="width: 84px">
                  <strong>��Ա״̬��</strong></td>
              <td class="righttd">
                  <asp:RadioButtonList ID="Status" runat="server" RepeatDirection="Horizontal">
                      <asp:ListItem Selected="true" Value="0">����</asp:ListItem>
                      <asp:ListItem Value="1">����</asp:ListItem>
                      <asp:ListItem Value="2">�����</asp:ListItem>
                      <asp:ListItem Value="3">���ʼ�����</asp:ListItem>
                  </asp:RadioButtonList></td>
          </tr>
          </table>
          </div>
          
          <div class="tab-page" id="tab1">
		  <h2 class="tab" id="diyoption" runat="server">�Զ���ѡ��</h2>
			<script type="text/javascript">
						 tabPane1.addTabPage( document.getElementById( "tab1" ) );
			</script>
			
			
 <table width="100%" border="0"  cellpadding="1" cellspacing="1" class="CTable">
          <tr>
           <td colspan="2" class="lefttd">
           <div class="reg_box_l">
			 <ul id="useroptionsarea" runat="server">
               </ul>
            </div>
           </td>
          </tr>
       </table>
       </div>
       </div>
        <br />
       

        <div style="clear:both;text-align:center"><br />
           <KS:Foot ID="Foot1" runat="server" OnSubmit="Foot1_Submit" />
      </div>
        
        <asp:TextBox ID="ComeUrl" Visible="false" runat="server"></asp:TextBox>
       
    </asp:Panel>
</asp:Content>

