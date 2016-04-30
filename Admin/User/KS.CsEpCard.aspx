<%@ Page Language="C#"  MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="True" Inherits="Kesion.NET.WebSite.Admin_User_CsEpCard" Codebehind="KS.CsEpCard.aspx.cs" %>
<%@ Import Namespace="Kesion.Cache" %>
<%@ Import Namespace="Kesion.APPCode" %>
<%@ Import Namespace="Kesion.BLL" %>
<%@ Import Namespace="Kesion.Publics"%>

<asp:Content ID="Content1" ContentPlaceHolderID="KSContent" Runat="Server">
<script>
    function AddWay() {
        var checkrad = jQuery("#<%=this.RadioButtonList4.ClientID %> :radio[checked]").val();
        if (checkrad == "1") {
            jQuery("#<%=this.Tbody2.ClientID %>").css("display", "");
            jQuery("#<%=this.Tbody4.ClientID %>").css("display", "none");
        } else {
            jQuery("#<%=this.Tbody2.ClientID %>").css("display", "none");
            jQuery("#<%=this.Tbody4.ClientID %>").css("display", "");
        }
    }

</script> 
<script> 
    function AddMore() {
        <%if (KSCMS.S("action") == "addmore")
          {%>
        jQuery("#<%=this.Tbody3.ClientID %>").css("display", "");
       <% } else {%>
            jQuery("#<%=this.Tbody3.ClientID %>").css("display", "none");
      <% } %>
</script> 
<asp:Panel ID="ListPanel" runat="server" Width="100%">

<div id="manage_top" class="menu_top_fixed">
       <ul>
           <li id='p1'><asp:LinkButton ID="addclassbutton" runat="server" OnClick="addclassbutton_Click" ><b></b>添加充值卡</asp:LinkButton></li>
           <li id='p1'><a href="KS.CsEpCard.aspx?action=addmore&id=<%=ItemID %>"><b></b>批量生成充值卡</a></li>
            <li id='p3'><asp:LinkButton ID="delclassbutton" runat="server" OnClientClick="return(GetIDS('del'));" OnClick="delclassbutton_Click"><b></b>删除</asp:LinkButton></li>
           </ul>
         </div> 
         <div class="message">
             </div>
 <div class="message">
   <span style="float:right;padding-right:10px">
        卡号名称：<asp:TextBox CssClass="textbox" ID="Txtname" runat="server"></asp:TextBox>&nbsp;
      充值卡号：<asp:TextBox ID="TextBox1" CssClass="textbox" runat="server"></asp:TextBox>
         <asp:Button ID="Button1" runat="server" Text=" 搜索 " CssClass="button" onclick="Button1_Click" />
            </span>
     当前位置：<asp:Label ID="LabNav" runat="server"></asp:Label>

</div>

<div class="tabs_header">
    <ul class="tabs">
    <li <%=KSCMS.S("IsUse")==""?" class='active'":string.Empty %>><a href="KS.CsEPCard.Aspx?id=<%=ItemID %>"><span>所有充值卡</span></a></li>
    <li <%=KSCMS.S("IsUse")=="1"?" class='active'":string.Empty %>><a href="KS.CsEPCard.Aspx?IsUse=1&id=<%=ItemID %>"><span>已使用</span></a></li>
    <li <%=KSCMS.S("IsUse")=="0"?" class='active'":string.Empty %>><a href="KS.CsEPCard.Aspx?IsUse=0&id=<%=ItemID %>"><span>未使用</span></a></li>
    <li <%=KSCMS.S("IsUse")=="2"?" class='active'":string.Empty %>><a href="KS.CsEPCard.Aspx?IsUse=2&id=<%=ItemID %>"><span>点数</span></a></li>
    <li <%=KSCMS.S("IsUse")=="3"?" class='active'":string.Empty %>><a href="KS.CsEPCard.Aspx?IsUse=3&id=<%=ItemID %>"><span>元</span></a></li>
    <li <%=KSCMS.S("IsUse")=="4"?" class='active'":string.Empty %>><a href="KS.CsEPCard.Aspx?IsUse=4&id=<%=ItemID %>"><span>积分</span></a></li>
    <li <%=KSCMS.S("IsUse")=="5"?" class='active'":string.Empty %>><a href="KS.CsEPCard.Aspx?IsUse=5&id=<%=ItemID %>"><span>天数</span></a></li>
  
    </ul>
</div>
 <KS:ksgv id="List" runat="server" AutoGenerateColumns="False" EmptyDataText="您还没有添加充值卡!" PagerType="CustomNumeric" Width="99%" CssClass="CTable" GridLines="None" OnRowDataBound="List_RowDataBound" OnRowCommand="List_RowCommand" OnRowCreated="List_RowCreated">
        <Columns>
            <asp:TemplateField HeaderText="&lt;input type='checkbox' name='chkall' id='chkall' onClick='CheckAll(this.form);'/&gt;">
                <itemstyle horizontalalign="Center" Height="30px" width="30px" />
                <itemtemplate>
                <input type="checkbox"  name="ids" id="ids" value="<%#Eval("id") %>" />
                </itemtemplate>
            </asp:TemplateField>

            <asp:TemplateField HeaderText="名称">
               <itemstyle  horizontalalign="Center" />
                <itemtemplate>
             <%# Eval("name") %>
                </itemtemplate>
            </asp:TemplateField>

             <asp:TemplateField HeaderText="充值卡号">
               <itemstyle  horizontalalign="Center" />
                <itemtemplate>
             <%# Eval("Cardnumber") %>
                </itemtemplate>
            </asp:TemplateField>
           
             <asp:TemplateField HeaderText="密码">
               <itemstyle  horizontalalign="Center" />
                <itemtemplate>
             <%# Eval("password") %>
                </itemtemplate>
            </asp:TemplateField>

             <asp:TemplateField HeaderText="面值">
               <itemstyle   horizontalalign="Center"/>
                <itemtemplate>
             ￥<%# Kesion.APPCode.Public.ReturnShopPrice(Utils.StrToDecimal(Eval("FaceValue"))) %>
                </itemtemplate>
            </asp:TemplateField>

             <asp:TemplateField HeaderText="点数">
               <itemstyle  horizontalalign="Center" />
                <itemtemplate>
             <%# Eval("PointNumber") %><%# GetPointType(Utils.StrToInt(Eval("PointType")))%>
                </itemtemplate>
            </asp:TemplateField>

             <asp:TemplateField HeaderText="过期时间">
               <itemstyle  horizontalalign="Center" />
                <itemtemplate>
             <%# Eval("enddate", "{0:yyyy-MM-dd HH:mm:ss}") %>
                </itemtemplate>
            </asp:TemplateField>

             <asp:TemplateField HeaderText="出售">
               <itemstyle  horizontalalign="Center" />
                <itemtemplate>
               <%# Utils.StrToInt(Eval("IsSell"))== 0 ?"<font color=green>未出售</font>":"<font color=red>已出售</font>" %>
                </itemtemplate>
            </asp:TemplateField>

             <asp:TemplateField HeaderText="使用">
               <itemstyle  horizontalalign="Center" />
                <itemtemplate>
               <%# Utils.StrToInt(Eval("IsUse"))== 0 ?"<font color=green>未使用</font>":"<font color=red>已使用</font>" %>
                </itemtemplate>
            </asp:TemplateField>

            <asp:TemplateField HeaderText="使用者">
            <itemstyle  horizontalalign="Center" />
                <itemtemplate>
                   <div class="tips" style=" text-align:center">
                     <%# Eval("Users") %>
                   </div>
                </itemtemplate>
            </asp:TemplateField>

             <asp:TemplateField HeaderText="充值时间">
            <itemstyle  horizontalalign="Center" />
                <itemtemplate>
                   <div class="tips" style=" text-align:center"><%# Eval("usedate", "{0:yyyy-MM-dd HH:mm:ss}") %></div>
                </itemtemplate>
            </asp:TemplateField>

            <asp:TemplateField HeaderText="管理操作">
                <itemstyle horizontalalign="Center" Width="100"/>
             <itemtemplate>  
             <asp:LinkButton runat="server" id="edit1" CssClass="edit" Visible='<%# Eval("IsSell").ToString()=="1" || Eval("IsUse").ToString()=="1" ? false:true %>'  commandargument=<%# Eval("ID") %> commandname="edit1" ToolTip="编辑">编辑</asp:LinkButton>
             <asp:LinkButton runat="server" id="delet" CssClass="delete" Visible='<%# Eval("IsSell").ToString()=="1" || Eval("IsUse").ToString()=="1" ? false:true %>'  commandargument=<%# Eval("ID") %> commandname="del"  ToolTip="删除">删除</asp:LinkButton>    
             </itemtemplate>
           
            </asp:TemplateField>
            
        </Columns>
        
        
        <HeaderStyle CssClass="CTitle" />
        <EmptyDataRowStyle CssClass="emptycss" />
    </KS:ksgv>
  
     <KS:Page ID="Page1" runat="server" />

           <asp:Panel ID="Panel1" runat="server" Height="30px" Width="100%">
         <br />
        <script type="text/javascript">
            showtips('<span class="state"><strong>提示：</strong><font style = "color:red">已售出或已使用的充值卡，不允许删除，修改等操作。 。</font></span>');
		</script>
       </asp:Panel>
    </asp:Panel>

<asp:Panel ID="AddPanel" runat="server" Width="100%">
    <script src="../../ks_inc/DatePicker/WdatePicker.js"></script>
  <KS:TopNav ID="TopNav1" runat="server" Text="添加充值卡" />
       <script src="../../ks_inc/weiboApi.js"></script>
        <div class="tab-page" id="sjPanel">
        
     <table width="100%" align="center" border="0" cellpadding="1" cellspacing="1" class="CTable"> 
    
     <tr>
        <td align="right" class="lefttd" ><strong>充值卡名称：</strong></td>
         <td class="righttd">
             <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>        
         </td>
     </tr>
     
    <tbody id="Tbody1" runat="server">
      <tr>
        <td align="right" class="lefttd" height="30" ><strong>添加方式：</strong></td>
         <td class="righttd">
              <asp:RadioButtonList ID="RadioButtonList4" onclick="AddWay()" runat="server" RepeatDirection="Horizontal">
                 <asp:ListItem Value="0" Selected>单张充值卡</asp:ListItem>
                 <asp:ListItem Value="1">批量添加充值卡</asp:ListItem>
             </asp:RadioButtonList>
         </td>
     </tr>
     </tbody>
     
     <tbody id="Tbody2" style="display:none"  runat="server">
      <tr>
        <td align="right" class="lefttd" height="30" ><strong>格式文本：</strong></td>
         <td class="righttd">
             <asp:TextBox ID="TextBox2" TextMode="MultiLine" Rows="7" Width="300px" runat="server"></asp:TextBox>
           <a class="textarea_min" href="javascript:zoomtextarea(-5,'<%=this.TextBox2.ClientID %>');"></a>
          <a class="textarea_max" href="javascript:zoomtextarea(5,'<%=this.TextBox2.ClientID %>');">
          <br />
            <span class="tips"> 请按照每行每张卡， 每张卡按“卡号＋分隔符＋密码”的格式录入</span>
            <span class="tips">例：734534759|kSo94Sf4Xs（以“|”作为分隔符）</span>
         </td>
     </tr>
     </tbody>

     <tbody id="Tbody3" style='display:none'  runat="server">
      <tr>
        <td align="right" class="lefttd" height="30" ><strong>充值卡数量：</strong></td>
         <td class="righttd">
             <asp:TextBox ID="Number" CssClass="textbox" runat="server" Width="60px" Text="10"></asp:TextBox>张
         </td>
     </tr>
         <tr>
        <td align="right" class="lefttd" height="30" ><strong>充值卡号码前缀：</strong></td>
         <td class="righttd">
             <asp:TextBox ID="Prefix" CssClass="textbox" runat="server" Text="KS2014"></asp:TextBox>
         </td>
     </tr>
         <tr>
        <td align="right" class="lefttd" height="30" ><strong>充值卡号码位数：</strong></td>
         <td class="righttd">
             <asp:TextBox ID="CardsNumber" CssClass="textbox" runat="server" Text="12" ></asp:TextBox>
             <span class="tips">建议设为10--15位</span>
         </td>
     </tr>
         <tr>
        <td align="right" class="lefttd" height="30" ><strong>充值卡密码位数：</strong></td>
         <td class="righttd">
             <asp:TextBox ID="PassNumber" CssClass="textbox" runat="server" Text="6"  ></asp:TextBox>
             <span class="tips">建议设为6--10位</span>
         </td>
     </tr>

          <tr>
        <td align="right" class="lefttd" height="30" ><strong>充值卡密码方式：</strong></td>
         <td class="righttd"> <asp:RadioButtonList ID="RadioButtonList1" runat="server" RepeatDirection="Horizontal" Height="24px">
              <asp:ListItem Value="0" Selected="True">纯数字</asp:ListItem>
              <asp:ListItem Value="1">数字与字母结合</asp:ListItem>
             </asp:RadioButtonList>
         </td>
     </tr>

     </tbody>


     <tbody id="Tbody4" runat="server">
      <tr>
        <td align="right" class="lefttd" height="30" ><strong>充值卡卡号：</strong></td>
         <td class="righttd"><asp:TextBox ID="Cardnumber" CssClass="textbox" runat="server"></asp:TextBox>
               <span class="tips">建议设为10--15位</span>
         </td>
     </tr>
       <tr>
        <td align="right" class="lefttd" height="30" ><strong>充值卡密码：</strong></td>
         <td class="righttd"><asp:TextBox ID="password" CssClass="textbox" runat="server"></asp:TextBox>
             <span class="tips">建议设为6--10位 </span>
         </td>
     </tr>
     </tbody>

     <tr>
        <td align="right" class="lefttd" height="30" ><strong>充值卡面值：</strong></td>
         <td class="righttd"><asp:TextBox ID="FaceValue" CssClass="textbox" runat="server" Text="50" Width="60px"></asp:TextBox>元
              <span class="tips">即购买人需要花费的实际金额</span>
         </td>
     </tr>

      <tr>
        <td align="right" class="lefttd" height="30" ><strong>充值卡点数、资金：</strong></td>
         <td class="righttd"><asp:TextBox ID="PointNumber" CssClass="textbox" runat="server" Width="60px"></asp:TextBox>
             <asp:DropDownList ID="PointType" runat="server">
                  <asp:ListItem Value="1" >点</asp:ListItem>
                  <asp:ListItem Value="2" Selected>元</asp:ListItem>
                  <asp:ListItem Value="3">积分</asp:ListItem>
                  <asp:ListItem Value="4" Enabled="false">天</asp:ListItem>
             </asp:DropDownList>
             
             <span class="tips">购买人可以得到的点数、资金和积分</span>
         </td>
     </tr>
       
      <tr>
            <td align="right" class="lefttd">
                <strong>允许使用此充值卡的用户组：</strong></td>
            <td class="righttd"> 
            <asp:Label ID="GroupId" runat="server"></asp:Label>
                </td>
      </tr>
    
     <tr style="display:none">
        <td align="right" class="lefttd" height="30" ><strong>充值后自动归入的用户组：</strong></td>
         <td class="righttd">
             <asp:DropDownList ID="UsedGroupId" runat="server"></asp:DropDownList>      
         </td>
     </tr>

       <tr  style="display:none">
        <td align="right" class="lefttd" height="30" ><strong>到期后自动归入的用户组：</strong></td>
         <td class="righttd"> <asp:DropDownList ID="EndGroupId" runat="server"></asp:DropDownList>  
            <span class="tips">充值类型为“天”数的才有效。</span>   
         </td>
     </tr>

      <tr>
        <td align="right" class="lefttd" height="30" ><strong>充值截止期限：</strong></td>
         <td class="righttd"><asp:TextBox CssClass="textbox Wdate" ID="enddate" runat="server"  onfocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'});"></asp:TextBox>
              <span class="tips">购买人必须在此日期前进行充值，否则自动失效 </span>
        </td>
      </tr>


        <tr>
            <td align="right" class="lefttd" height="30" style="width: 102px">
                <strong>是否出售：</strong></td>
            <td class="righttd">
             <asp:RadioButtonList ID="IsSell" runat="server" Width="137px" 
                    RepeatDirection="Horizontal" Height="24px">
              <asp:ListItem Value="0" Selected="True">未出售</asp:ListItem>
              <asp:ListItem Value="1">已出售</asp:ListItem>
             </asp:RadioButtonList>
             </td>
        </tr>
        
          <tr>
            <td align="right" class="lefttd" height="30" style="width: 102px">
                <strong>是否使用：</strong></td>
            <td class="righttd">
             <asp:RadioButtonList ID="IsUse" runat="server" Width="137px" 
                    RepeatDirection="Horizontal" Height="24px">
              <asp:ListItem Value="0" Selected="True">未使用</asp:ListItem>
              <asp:ListItem Value="1">已使用</asp:ListItem>
             </asp:RadioButtonList>
             </td>
        </tr>

  </table>
     <br />
      <KS:Foot ID="Foot1" runat="server" OnSubmit="Foot1_Submit" />
     </asp:Panel>

        <script>
            function CheckForm() {               
                if (jQuery('#<%=this.FaceValue.ClientID %>').val() == '') {
                    KesionJS.Alert('面值不能为空!', "jQuery('#<%=this.FaceValue.ClientID %>').focus()");
                    return false;
                }
                return true;
            }
    </script>

</asp:Content>