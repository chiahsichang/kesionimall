<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="PKAddControl.ascx.cs" Inherits="Kesion.NET.WebSite.PKAddControl" %>

<KS:TopNav ID="TopNav1" runat="server" Text="添加PK主题" />

<asp:HiddenField ID="HidInfoID" runat="server" Value="0" />
<table  style="width:100%;margin:0px auto;" cellpadding="2" cellspacing="1" class="CTable">
         <tr>
             <td align="right" class="lefttd" style="width: 198px;30px">
             <b>PK主题：</b>
             </td>
             <td class="righttd">
             &nbsp;<asp:TextBox CssClass="textbox" ID="TxtPkTitle" runat="server" Width="200px"></asp:TextBox>
              <span style="color:Red">*</span> <span class="tips">如 360安全卫士 Or QQ电脑管家</span>
                 <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="TxtPkTitle" runat="server" ErrorMessage="请输入正确的PK主题" Display="dynamic"></asp:RequiredFieldValidator>
             </td>
         </tr>
          <tr>
            <td class="lefttd" height="30" align="right" style="width: 198px"><b>正方观点：</b></td>
            <td class="righttd">
                &nbsp;<asp:TextBox ID="TxtPKZFGD" runat="server" Width="358px" Height="70px" TextMode="multiLine"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TxtPKZFGD"
                    ErrorMessage="请填写正方观点!" Display="Dynamic"></asp:RequiredFieldValidator></td>
          </tr>
          <tr>
            <td class="lefttd" height="30" align="right" style="width: 198px"><b>反方观点：</b></td>
            <td class="righttd">
                &nbsp;<asp:TextBox ID="TxtPKFFGD" runat="server" Width="358px" Height="70px" TextMode="multiLine"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="TxtPKFFGD"
                    ErrorMessage="请填写反方观点!" Display="Dynamic"></asp:RequiredFieldValidator></td>
          </tr>
         <tr>
             <td align="right" class="lefttd" height="30" style="width: 198px">
                <b>得票情况：</b></td>
             <td class="righttd">
               正方:<asp:TextBox CssClass="textbox" ID="TxtPKZFVotes" runat="server" Width="50px" style="text-align:center"></asp:TextBox>票 反方:<asp:TextBox CssClass="textbox" ID="TxtPKFFVotes" runat="server" Width="50px" style="text-align:center"></asp:TextBox>票 三方:<asp:TextBox CssClass="textbox" ID="TxtPKSFVotes" runat="server" Width="50px" style="text-align:center"></asp:TextBox>票
             </td>
         </tr>
          <tr>
            <td class="lefttd" height="30" align="right" style="width: 198px"><b>只允许会员参与PK：</b></td>
            <td class="righttd">
            <asp:RadioButtonList ID="RdbPKUserTF" runat="server" RepeatDirection="Horizontal">
                        <asp:ListItem Selected="True" Value="1">是</asp:ListItem>
                        <asp:ListItem Value="0">否</asp:ListItem>
                    </asp:RadioButtonList>
            </td>
          </tr>
          <tr>
            <td class="lefttd" align="right" style="width: 198px; height: 49px;"><b>每个用户只能参与PK一次：</b></td>
            <td class="righttd" style="height: 49px">
            <asp:RadioButtonList ID="RdbPKOnceTF" runat="server" RepeatDirection="Horizontal">
                        <asp:ListItem Selected="True" Value="1">是</asp:ListItem>
                        <asp:ListItem Value="0">否</asp:ListItem>
                    </asp:RadioButtonList>
            </td>
          </tr>
          <tr>
            <td class="lefttd" height="30" align="right" style="width: 198px"><b>用户PK意见需要审核：</b></td>
            <td class="righttd">
            <asp:RadioButtonList ID="RdbPKVerifyTF" runat="server" RepeatDirection="Horizontal">
                        <asp:ListItem Selected="True" Value="1">是</asp:ListItem>
                        <asp:ListItem Value="0">否</asp:ListItem>
                    </asp:RadioButtonList>
            </td>
          </tr>
          <tr>
            <td class="lefttd" height="30" align="right" style="width: 198px"><b>状态：</b></td>
            <td class="righttd">
            <asp:RadioButtonList ID="RdbPKStatus" runat="server" RepeatDirection="Horizontal">
                        <asp:ListItem Selected="True" Value="1">正常</asp:ListItem>
                        <asp:ListItem Value="0">锁定</asp:ListItem>
                    </asp:RadioButtonList>
            </td>
          </tr>
          <tr>
            <td class="lefttd" height="30" align="right" style="width: 198px"><b>是否启用时间限制：</b></td>
            <td class="righttd">
            <asp:RadioButtonList ID="RdbPKTimeLimit" runat="server" RepeatDirection="Horizontal">
                        <asp:ListItem  Value="1">限制时间</asp:ListItem>
                        <asp:ListItem Value="0" Selected="True">不限制</asp:ListItem>
                    </asp:RadioButtonList>
                 <div id="sTimeLimit" style="display:none">
                 开始时间:
                 <asp:TextBox CssClass="textbox" ID="TxtPKTBeginDate" runat="server" Width="200px" onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'});"></asp:TextBox>
                 格式:YYYY-MM-DD hh:mm:ss
                 <br />
                 结束时间:
                 <asp:TextBox CssClass="textbox" ID="TxtPKTEndDate" runat="server" Width="200px" onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'});"></asp:TextBox>
                 格式:YYYY-MM-DD hh:mm:ss
                 </div>
            </td>
          </tr>
      </table>
 <script type="text/javascript">
	   function showPKTimeLimit() {
	       var checkrad = jQuery("#<%=this.RdbPKTimeLimit.ClientID %> :radio[checked]").val();
	       if (checkrad == 1) {
	           jQuery("#sTimeLimit").show();
	       } else {
	       jQuery("#sTimeLimit").hide();
	       }
       }	   
</script>
<br />
<KS:Foot ID="Foot1" runat="server" OnSubmit="Foot1_Submit" />
	 