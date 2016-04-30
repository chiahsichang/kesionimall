<%@ Page Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.Admin_Plan" Title="" Codebehind="KS.AdminPlan.aspx.cs" %>
<%@ Import Namespace="System.Xml" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="Kesion.Publics" %>
<%@ Import Namespace="Kesion.Cache" %>

<asp:Content ID="Content1" ContentPlaceHolderID="KSContent" Runat="Server">
   
   <asp:Panel ID="ListPanel" runat="server" Width="100%">
    <script>
        function addPlan() {
            parent.openWin("添加工作计划", "User/KS.AdminPlan.aspx?action=add", true, 820, 450);
        }
        function editPlan(id) {
            parent.openWin("修改工作计划", "User/KS.AdminPlan.aspx?action=modify&id=" + id, true, 820, 450);
        } 
    </script>
       <div id="manage_top" class="menu_top_fixed">
         <ul>
           <li id='p1'><a href="javascript:addPlan();"><b></b>添加计划</a></li>
           <li id='p3'><asp:LinkButton ID="delclassbutton" runat="server" onclick="delclassbutton_Click"><b></b>删除计划</asp:LinkButton></li>
          </ul>
        </div> 
        <div class="menu_top_fixed_height"></div>   


       <div class="tabs_header">
    <ul class="tabs">
    <li<%=KSCMS.S("showType")==""?" class='active'":string.Empty %>><a href="KS.AdminPlan.aspx?<%=UtilsQueryParam.Get("showtype") %>"><span>所有计划</span></a></li>
    <li<%=KSCMS.S("showType")=="1"?" class='active'":string.Empty %>><a href="KS.AdminPlan.aspx?showType=1&<%=UtilsQueryParam.Get("showtype") %>"><span>今日计划</span></a></li>
    <li<%=KSCMS.S("showType")=="2"?" class='active'":string.Empty %>><a href="KS.AdminPlan.aspx?showType=2&<%=UtilsQueryParam.Get("showtype") %>"><span>本周计划</span></a></li>
    <li<%=KSCMS.S("showType")=="3"?" class='active'":string.Empty %>><a href="KS.AdminPlan.aspx?showType=3&<%=UtilsQueryParam.Get("showtype") %>"><span>本月计划</span></a></li>
    <li<%=KSCMS.S("showType")=="4"?" class='active'":string.Empty %>><a href="KS.AdminPlan.aspx?showType=4&<%=UtilsQueryParam.Get("showtype") %>"><span>未完成计划</span></a></li>
    <li<%=KSCMS.S("showType")=="5"?" class='active'":string.Empty %>><a href="KS.AdminPlan.aspx?showType=5&<%=UtilsQueryParam.Get("showtype") %>"><span>已完成计划</span></a></li>
    </ul>
</div>



       <asp:Panel ID="showAllPanel" runat="server" Width="100%">
          <table width="99%" border="0" cellpadding="1" cellspacing="1" class="CTable">
              <tr class="CTitle">
               <td height="25" width="48" align="center"><input type="checkbox" name="chkall" id="chkall" onclick="CheckAll(this.form);"/></td>
               <td style="text-align:center"><b>日期</b></td>
               <td style="text-align:left"><b>工作计划内容</b></td>
              <td  width="68" align="center"><b>工作状态</b></td>
              <td  width="68" align="center"><b>登录提醒</b></td>
               <td width="30" align="center"><b>修改</b></td>
               <td width="30" align="center"><b>删除</b></td>
              </tr>
       
        <asp:Repeater ID="Repeater1" runat="server"  >
          <HeaderTemplate>
          </HeaderTemplate>
         <ItemTemplate>
         
            <tr class="tdbg" onclick="chk(this)"> 
            <td class="Ctd" width="50" nowrap="nowrap" align="center">
             <input type="checkbox"  name="ids" id="ids" value="<%#Eval("id") %>" />
			</td>
            <td class="Ctd" width="120">
                <%# Convert.ToDateTime(Eval("AddDate")).ToShortDateString() %><span class="tips">(<%# Utils.GetWeekDay(Convert.ToDateTime(Eval("AddDate"))) %>)</span>

            </td>
            <td class="Ctd"><%# Utils.replaceBR(Convert.ToString(Eval("Content"))) %></td>
            <td class="Ctd" align="center">
                 <a href="?action=status&id=<%#Eval("ID")%>"> <%# Convert.ToString(Eval("status"))=="0"?"<span class='tips'>未完成</span>":"<span style='color:green'>已完成</span>" %></a>
            </td>
            <td class="Ctd" style="text-align:center">
                <%# getTipsDay(Convert.ToInt16(Eval("tipsDays"))) %>
            </td>
			
            <td  class="Ctd" nowrap align="center">
			<a class="edit" title="编辑" href="javascript:;" onClick="editPlan(<%# Eval("id") %>);"></a>
			</td>

            <td  class="Ctd" nowrap align="center">
			<a class="delete" onClick="return(confirm('确定删除该工作计划吗?'))" href="?action=del&ids=<%# Eval("id") %>" title="删除"></a>
			</td>
          </tr>
           
             
         </ItemTemplate>
          <FooterTemplate>
               <tr class="tdbg" style="display:<%# bool.Parse((Repeater1.Items.Count==0).ToString())?"":"none"%>">
                <td class="Ctd" style="height:50px;text-align:center" colspan="7">
                  <a href="javascript:;" onclick="addPlan()">还没有添加任何工作计划，点此添加&raquo;</a>
                </td>
               </tr> 
           </table>

          </FooterTemplate>
        </asp:Repeater>
          </table>
       
         <KS:Page ID="Page1" runat="server" />
       </asp:Panel>       

       <asp:Panel ID="showWeekPannel" runat="server" Width="100%" Visible="false">

         <asp:Repeater ID="showWeekRepeaterOuter" runat="server" OnItemDataBound="showWeekRepeaterOuter_ItemDataBound"  >
          <HeaderTemplate>
              <table class="CTable" Width="99%">
          </HeaderTemplate>
         <ItemTemplate>
         
          <tr class="CTitle"> 
            <td class="Ctd"  nowrap="nowrap" style="font-size:16px;text-align:left">
              <%# Utils.GetWeekDay(Convert.ToDateTime(Eval("date"))) %><span class="tips">(<%# Convert.ToDateTime(Eval("date")).ToShortDateString() %>)</span>
			</td>
          </tr>

             <tr>
                <td>
                        <asp:Repeater runat="server" ID="showWeekRepeaterInner">
                             <HeaderTemplate>
                                  <table class="CTable" Width="99%">
                             </HeaderTemplate>
                            <ItemTemplate>
                                     <tr>
                                         <td  width="150" align="right"><strong>计划内容：</strong></td>
                                         <td align="left"> <%# Utils.replaceBR(Convert.ToString(Eval("Content")))%></td>
                                         <td class="Ctd" align="center" width="100">
                                             <a href="?action=status&id=<%#Eval("ID")%>"> <%# Convert.ToString(Eval("status"))=="0"?"<span class='tips'>未完成</span>":"<span style='color:green'>已完成</span>" %></a>
                                        </td>
                                     </tr>
                            </ItemTemplate>
                             <FooterTemplate>
                               </table>
                          </FooterTemplate>
                        </asp:Repeater>
                </td>
            </tr>

           
         </ItemTemplate>
          <FooterTemplate>
           </table>
          </FooterTemplate>
        </asp:Repeater>

       </asp:Panel>
      
        <asp:Panel ID="showMonthPannel" runat="server" Width="100%" Visible="false">
                 <style>
                 .today {
                     background:#ccc;
                 }
                 .otherday {
                     border:1px solid #f1f1f1; 
                 }
                 .titleday {
                      border:1px solid #f1f1f1;
                 }
                 .titlestyle td{
                     border:1px solid #f1f1f1;text-align:center;
                 }
                 .hasplanfinish {
                    background-color:#ccc;border:1px solid #f1f1f1;
                 }
                 .hasplannofinish {
                    background-color:red;border:1px solid #f1f1f1;
                 }
                 .CalendarStatus {
                     height:60px;
                 }
                     .CalendarStatus div{
                         float:left;margin:5px;text-align:center;color:#777;
                     }
                     .CalendarStatus li {
                         width:30px; height:20px;
                     }
             </style>
            <asp:Calendar CellPadding="1" CellSpacing="1" ID="Calendar1" CssClass="CTable" ShowGridLines="True"
ShowDayHeader="True"
SelectionMode="Day"
DayHeaderStyle-HorizontalAlign="Center" Height="380"
Width="99%"
TitleStyle-Font-Size="13px" TitleStyle-CssClass="titlestyle"
TodayDayStyle-CssClass="today" DayStyle-CssClass="otherday" DayHeaderStyle-CssClass="otherday"
DayStyle-Font-Size="13px"
DayHeaderStyle-Font-Size="16px" 
OtherMonthDayStyle-ForeColor="#cccccc" OnDayRender="Calendar1_DayRender" runat="server" >
            </asp:Calendar>


             <div class="CalendarStatus" style="clear:both">
                 <div><li class="hasplanfinish">&nbsp;</li>已完成</div>
                 <div><li class="hasplannofinish">&nbsp;</li>未完成</div>
            </div>


        </asp:Panel>


</asp:Panel>

 <asp:Panel ID="ModifyPanel" runat="server" Width="100%" Visible="false">
<script type="text/javascript">
    function checkform() {

      if (jQuery("#<%=this.TxtIntro.ClientID%>").val() == "") {
          KesionJS.Alert('请输入计划内容!', "jQuery('#<%=this.TxtIntro.ClientID%>').focus();");
          return false;
      }

      return true;
  }
</script>
    <table style="margin:6px" width="98%" cellpadding="1" cellspacing="1" class="CTable">
        <tr>
            <td class="lefttd" style="height: 30px; text-align: right">
                <strong>记录日期：</strong></td>
            <td class="righttd" style="height: 30px; text-align: left">
               <asp:TextBox   CssClass="textbox Wdate" onclick="WdatePicker({isShowClear:false,readOnly:true});" ID="TxtAddDate" runat="server"></asp:TextBox>
                <span class="tips">格式：<%=DateTime.Now.ToShortDateString() %></span></td>
        </tr>
         <tr>
            <td class="lefttd" style="height: 30px; text-align: right">
                <strong>计划内容：</strong></td>
            <td class="righttd" style="height: 30px; text-align: left">
               <asp:TextBox TextMode="MultiLine" Height="200px"  CssClass="textbox textarea"  ID="TxtIntro" runat="server" Width="450px"></asp:TextBox>
               <br />
                <span class="tips">可以记录您的工作计划</span>
           </td>
        </tr>
       
        <tr>
            <td class="lefttd" style="height: 30px; text-align: right">
                <strong>计划状态：</strong></td>
            <td class="righttd" style="height: 30px; text-align: left">
              <asp:RadioButtonList ID="RdbStatus" runat="server" RepeatDirection="Horizontal">
                  <asp:ListItem Value="0" Selected="True">未完成</asp:ListItem>
                  <asp:ListItem Value="1">已完成</asp:ListItem>
              </asp:RadioButtonList>

           </td>
        </tr>
        <tr>
            <td class="lefttd" style="height: 30px; text-align: right">
                <strong>登录提醒：</strong></td>
            <td class="righttd" style="height: 30px; text-align: left">
                <asp:DropDownList ID="RdbTipsDays" runat="server">
                  <asp:ListItem Value="0">不提醒</asp:ListItem>
                  <asp:ListItem Value="1">1天</asp:ListItem>
                  <asp:ListItem Value="3">3天</asp:ListItem>
                  <asp:ListItem Value="5">5天</asp:ListItem>
                  <asp:ListItem Value="7">一周</asp:ListItem>
                  <asp:ListItem Value="15">半个月</asp:ListItem>
                  <asp:ListItem Value="30">一个月</asp:ListItem>
                    </asp:DropDownList>
                <span class="tips">说明：未完成的计划可以这里设置登录后台提醒时间。</span>
           </td>
        </tr>
      
       
    
    </table>
       
     <div style="text-align:center;">
     <asp:HiddenField ID="HidID" runat="server" Value="0" />
     <asp:Button ID="Button1" CssClass="button" runat="server" OnClientClick="return(checkform())" Text="确定创建(O)" AccessKey="O" OnClick="Button1_Click"/>
           <input type="button" class="button" onclick="javascript: parent.box.close();" accesskey="C" value="关闭取消(C)" /><br />
     </div>

     </asp:Panel>






    <asp:Panel ID="showPannel" runat="server" Width="100%" Visible="false">

        <table width="99%" border="0" cellpadding="1" cellspacing="1" class="CTable">
              <tr class="CTitle">
               <td height="25" width="48" align="center">星期</td>
               <td  align="center"><b>日期</b></td>
               <td style="text-align:left"><b>工作计划内容</b></td>
              <td  width="68" align="center"><b>工作状态</b></td>
              <td  width="68" align="center"><b>登录提醒</b></td>
              </tr>
       
        <asp:Repeater ID="showRepeater" runat="server"  >
          <HeaderTemplate>
          </HeaderTemplate>
         <ItemTemplate>
         
            <tr class="tdbg" onclick="chk(this)"> 
            <td class="Ctd" width="50" nowrap="nowrap" align="center">
             <%# Utils.GetWeekDay(Convert.ToDateTime(Eval("adddate"))) %>
			</td>
            <td class="Ctd" width="100" align="center"><%# Convert.ToDateTime(Eval("AddDate")).ToShortDateString() %>
                

            </td>
            <td class="Ctd"><%# Utils.replaceBR(Convert.ToString(Eval("Content"))) %></td>
            <td class="Ctd" align="center">
                 <a href="?action=status&id=<%#Eval("ID")%>"> <%# Convert.ToString(Eval("status"))=="0"?"<span class='tips'>未完成</span>":"<span style='color:green'>已完成</span>" %></a>
            </td>
            <td class="Ctd" style="text-align:center">
                <%# getTipsDay(Convert.ToInt16(Eval("tipsDays"))) %>
            </td>
			
           
          </tr>
           
             
         </ItemTemplate>
          <FooterTemplate>
               <tr class="tdbg" style="display:<%# bool.Parse((showRepeater.Items.Count==0).ToString())?"":"none"%>">
                <td class="Ctd" style="height:50px;text-align:center" colspan="7">
                  <a href="javascript:;" onclick="addPlan()">还没有添加任何工作计划，点此添加&raquo;</a>
                </td>
               </tr> 
           </table>

          </FooterTemplate>
        </asp:Repeater>
          </table>


    </asp:Panel>


</asp:Content>
