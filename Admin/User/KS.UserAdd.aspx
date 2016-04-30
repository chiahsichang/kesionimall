<%@ Page Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.Admin_UserAdd" Title="Untitled Page" Codebehind="KS.UserAdd.aspx.cs" %>
<asp:Content ID="Content1" ContentPlaceHolderID="KSContent" Runat="Server">
    <asp:Panel ID="AddPanel" runat="server" Width="100%">

      <div id="manage_top" class="toptitle menu_top_fixed" style="text-align:left;">操作导航：<a href="KS.UserAdd.Aspx">新增用户</a> | <a href="KS.UserImport.Aspx">外部数据源批量导入</a></div>
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
		  <h2 class="tab">基本信息</h2>
			<script type="text/javascript">
						 tabPane1.addTabPage( document.getElementById( "tab0" ) );
			</script>
			
             <table width="100%" border="0" cellpadding="1" cellspacing="1" class="CTable">

          <tr>
              <td align="right" class="lefttd" height="30" style="width: 84px">
                  <strong>用户类型：</strong></td>
              <td class="righttd">
              <span id="groupidarea" runat="server"></span>
              </td>
          </tr>
          <tr>
             <td align="right" class="lefttd" height="30" style="width: 84px"><strong>所属部门：</strong></td>
             <td class="righttd">
                &nbsp;<asp:DropDownList ID="DrpDepartID" runat="server">
                 <asp:ListItem Value="0">--不属于任何部门--</asp:ListItem>
                </asp:DropDownList>
             </td>
          </tr>
          <tr id="AskRank" runat="server">
             <td align="right" class="lefttd" height="30" style="width: 84px"><strong>问吧等级：</strong></td>
             <td class="righttd">
                &nbsp;<asp:DropDownList ID="DrpAskRankId" runat="server">
                 <asp:ListItem Value="0">--不设置问吧等级--</asp:ListItem>
                </asp:DropDownList>
             </td>
          </tr>
          <tr>
            <td class="lefttd" height="30" align="right" style="width: 84px"><b>会员名称：</b></td>
            <td class="righttd">
                &nbsp;<asp:TextBox CssClass="textbox" ID="UserName" runat="server" Width="268px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="UserName"
                    ErrorMessage="请填写用户登录名称!" Display="Dynamic"></asp:RequiredFieldValidator>
                   <span class="tips">建议使用英文名称。</span> 
                    </td>
          </tr>
          <tr>
              <td align="right" class="lefttd" height="30" style="width: 84px">
                  <strong>登录密码：</strong></td>
              <td class="righttd">
                  &nbsp;<asp:TextBox CssClass="textbox" ID="PassWord" runat="server" TextMode="password" Width="268px"></asp:TextBox>
                  <asp:RequiredFieldValidator ID="ValidatorPass" runat="server" ControlToValidate="PassWord"
                      ErrorMessage="请输入登录密码!" Display="Dynamic"></asp:RequiredFieldValidator>
                      <asp:Label ID="passtips" CssClass="tips" runat="server"></asp:Label>
                     <span class="tips">建议设置不少于6位。</span>  </td>
          </tr>
          <tr>
              <td align="right" class="lefttd" height="30" style="width: 84px">
                  <strong>电子邮箱：</strong></td>
              <td class="righttd">
                  &nbsp;<asp:TextBox CssClass="textbox" ID="Email" runat="server" Width="268px"></asp:TextBox>
                 
                  <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="Email"
                      Display="Dynamic" ErrorMessage="电子邮箱格式不正确!" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                      <span class="tips">如：kesioncms@hotmail.com</span>
                      </td>
          </tr>
          <tr>
              <td align="right" class="lefttd" height="30" style="width: 84px">
                  <strong>手机号码：</strong></td>
              <td class="righttd">
                  &nbsp;<asp:TextBox CssClass="textbox" ID="TxtMobile" runat="server" Width="168px"></asp:TextBox>
                <strong>设置手机号码已认证：</strong><asp:RadioButtonList ID="RdbIsMobileRZ" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow">
                   <asp:ListItem Value="0" Selected>否</asp:ListItem>
                   <asp:ListItem Value="1">是</asp:ListItem>
                  </asp:RadioButtonList> </td>
          </tr>
         
          <tr>
              <td align="right" class="lefttd" height="30" style="width: 84px">
                  <strong>提示问题：</strong></td>
              <td class="righttd">
              &nbsp;<asp:DropDownList ID="Question" runat="server">
                    <asp:ListItem>我的宠物名字？</asp:ListItem>
                    <asp:ListItem>我最好的朋友是谁？</asp:ListItem>
                    <asp:ListItem>我最喜爱的颜色？</asp:ListItem>
                    <asp:ListItem>我最喜爱的电影？</asp:ListItem>
                    <asp:ListItem>我最喜爱的影星？</asp:ListItem>
                    <asp:ListItem>我最喜爱的歌曲？</asp:ListItem>
                    <asp:ListItem>我最喜爱的食物？</asp:ListItem>
                    <asp:ListItem>我最大的爱好？</asp:ListItem>
                    <asp:ListItem>我中学校名全称是什么？</asp:ListItem>
                    <asp:ListItem>我的座右铭是？</asp:ListItem>
                    <asp:ListItem>我最喜欢的小说的名字？</asp:ListItem>
                    <asp:ListItem>我最喜欢的卡通人物名字？</asp:ListItem>
                    <asp:ListItem>我母亲/父亲的生日？</asp:ListItem>
                    <asp:ListItem>我最欣赏的一位名人的名字？</asp:ListItem>
                    <asp:ListItem>我最喜欢的运动队全称？</asp:ListItem>
                    <asp:ListItem>我最喜欢的一句影视台词？</asp:ListItem>
              </asp:DropDownList>
              </td>
          </tr>
          <tr>
              <td align="right" class="lefttd" height="30" style="width: 84px">
                  <strong>问题答案：</strong></td>
              <td class="righttd">
                  &nbsp;<asp:TextBox CssClass="textbox" ID="Answer" runat="server" Width="268px"></asp:TextBox>
                  </td>
          </tr>
          <tr>
              <td align="right" class="lefttd" height="30" style="width: 84px">
                  <strong>所在地区：</strong></td>
              <td class="righttd">
                  &nbsp;<asp:Label ID="LabArea" runat="server"></asp:Label></td>
          </tr>
          <tr>
              <td align="right" class="lefttd" height="30" style="width: 84px">
                  <strong>会员头像：</strong></td>
              <td class="righttd">
                  &nbsp;<asp:TextBox CssClass="textbox" ID="TxtUserFace" runat="server" Width="268px"></asp:TextBox>
                <input type="button" class="button" onclick="SelectFiles('<%=this.TxtUserFace.ClientID %>',0);" value="选择图片">  </td>
          </tr>
          <tr style="display:none">
              <td align="right" class="lefttd" style="width: 84px; height: 37px;">
                  <strong>计费方式：</strong></td>
              <td class="righttd" style="height: 37px">
              <asp:RadioButtonList ID="ChargeType" runat="server" RepeatDirection="Horizontal">
                      <asp:ListItem Selected="True" Value="1">计点数</asp:ListItem>
                      <asp:ListItem Value="2">有效期</asp:ListItem>
                      <asp:ListItem Value="3">无限期</asp:ListItem>
                  </asp:RadioButtonList>
              </td>
          </tr>
          <tr>
              <td align="right" class="lefttd" height="30" style="width: 84px">
                  <strong>会员状态：</strong></td>
              <td class="righttd">
                  <asp:RadioButtonList ID="Status" runat="server" RepeatDirection="Horizontal">
                      <asp:ListItem Selected="true" Value="0">正常</asp:ListItem>
                      <asp:ListItem Value="1">锁定</asp:ListItem>
                      <asp:ListItem Value="2">待审核</asp:ListItem>
                      <asp:ListItem Value="3">待邮件激活</asp:ListItem>
                  </asp:RadioButtonList></td>
          </tr>
          </table>
          </div>
          
          <div class="tab-page" id="tab1">
		  <h2 class="tab" id="diyoption" runat="server">自定义选项</h2>
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

