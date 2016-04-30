<%@ Page Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.Admin_Plan" Title="" Codebehind="KS.AdminPlan.aspx.cs" %>
<%@ Import Namespace="System.Xml" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="Kesion.Publics" %>
<%@ Import Namespace="Kesion.Cache" %>

<asp:Content ID="Content1" ContentPlaceHolderID="KSContent" Runat="Server">
   
   <asp:Panel ID="ListPanel" runat="server" Width="100%">
    <script>
        function addPlan() {
            parent.openWin("��ӹ����ƻ�", "User/KS.AdminPlan.aspx?action=add", true, 820, 450);
        }
        function editPlan(id) {
            parent.openWin("�޸Ĺ����ƻ�", "User/KS.AdminPlan.aspx?action=modify&id=" + id, true, 820, 450);
        } 
    </script>
       <div id="manage_top" class="menu_top_fixed">
         <ul>
           <li id='p1'><a href="javascript:addPlan();"><b></b>��Ӽƻ�</a></li>
           <li id='p3'><asp:LinkButton ID="delclassbutton" runat="server" onclick="delclassbutton_Click"><b></b>ɾ���ƻ�</asp:LinkButton></li>
          </ul>
        </div> 
        <div class="menu_top_fixed_height"></div>   


       <div class="tabs_header">
    <ul class="tabs">
    <li<%=KSCMS.S("showType")==""?" class='active'":string.Empty %>><a href="KS.AdminPlan.aspx?<%=UtilsQueryParam.Get("showtype") %>"><span>���мƻ�</span></a></li>
    <li<%=KSCMS.S("showType")=="1"?" class='active'":string.Empty %>><a href="KS.AdminPlan.aspx?showType=1&<%=UtilsQueryParam.Get("showtype") %>"><span>���ռƻ�</span></a></li>
    <li<%=KSCMS.S("showType")=="2"?" class='active'":string.Empty %>><a href="KS.AdminPlan.aspx?showType=2&<%=UtilsQueryParam.Get("showtype") %>"><span>���ܼƻ�</span></a></li>
    <li<%=KSCMS.S("showType")=="3"?" class='active'":string.Empty %>><a href="KS.AdminPlan.aspx?showType=3&<%=UtilsQueryParam.Get("showtype") %>"><span>���¼ƻ�</span></a></li>
    <li<%=KSCMS.S("showType")=="4"?" class='active'":string.Empty %>><a href="KS.AdminPlan.aspx?showType=4&<%=UtilsQueryParam.Get("showtype") %>"><span>δ��ɼƻ�</span></a></li>
    <li<%=KSCMS.S("showType")=="5"?" class='active'":string.Empty %>><a href="KS.AdminPlan.aspx?showType=5&<%=UtilsQueryParam.Get("showtype") %>"><span>����ɼƻ�</span></a></li>
    </ul>
</div>



       <asp:Panel ID="showAllPanel" runat="server" Width="100%">
          <table width="99%" border="0" cellpadding="1" cellspacing="1" class="CTable">
              <tr class="CTitle">
               <td height="25" width="48" align="center"><input type="checkbox" name="chkall" id="chkall" onclick="CheckAll(this.form);"/></td>
               <td style="text-align:center"><b>����</b></td>
               <td style="text-align:left"><b>�����ƻ�����</b></td>
              <td  width="68" align="center"><b>����״̬</b></td>
              <td  width="68" align="center"><b>��¼����</b></td>
               <td width="30" align="center"><b>�޸�</b></td>
               <td width="30" align="center"><b>ɾ��</b></td>
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
                 <a href="?action=status&id=<%#Eval("ID")%>"> <%# Convert.ToString(Eval("status"))=="0"?"<span class='tips'>δ���</span>":"<span style='color:green'>�����</span>" %></a>
            </td>
            <td class="Ctd" style="text-align:center">
                <%# getTipsDay(Convert.ToInt16(Eval("tipsDays"))) %>
            </td>
			
            <td  class="Ctd" nowrap align="center">
			<a class="edit" title="�༭" href="javascript:;" onClick="editPlan(<%# Eval("id") %>);"></a>
			</td>

            <td  class="Ctd" nowrap align="center">
			<a class="delete" onClick="return(confirm('ȷ��ɾ���ù����ƻ���?'))" href="?action=del&ids=<%# Eval("id") %>" title="ɾ��"></a>
			</td>
          </tr>
           
             
         </ItemTemplate>
          <FooterTemplate>
               <tr class="tdbg" style="display:<%# bool.Parse((Repeater1.Items.Count==0).ToString())?"":"none"%>">
                <td class="Ctd" style="height:50px;text-align:center" colspan="7">
                  <a href="javascript:;" onclick="addPlan()">��û������κι����ƻ���������&raquo;</a>
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
                                         <td  width="150" align="right"><strong>�ƻ����ݣ�</strong></td>
                                         <td align="left"> <%# Utils.replaceBR(Convert.ToString(Eval("Content")))%></td>
                                         <td class="Ctd" align="center" width="100">
                                             <a href="?action=status&id=<%#Eval("ID")%>"> <%# Convert.ToString(Eval("status"))=="0"?"<span class='tips'>δ���</span>":"<span style='color:green'>�����</span>" %></a>
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
                 <div><li class="hasplanfinish">&nbsp;</li>�����</div>
                 <div><li class="hasplannofinish">&nbsp;</li>δ���</div>
            </div>


        </asp:Panel>


</asp:Panel>

 <asp:Panel ID="ModifyPanel" runat="server" Width="100%" Visible="false">
<script type="text/javascript">
    function checkform() {

      if (jQuery("#<%=this.TxtIntro.ClientID%>").val() == "") {
          KesionJS.Alert('������ƻ�����!', "jQuery('#<%=this.TxtIntro.ClientID%>').focus();");
          return false;
      }

      return true;
  }
</script>
    <table style="margin:6px" width="98%" cellpadding="1" cellspacing="1" class="CTable">
        <tr>
            <td class="lefttd" style="height: 30px; text-align: right">
                <strong>��¼���ڣ�</strong></td>
            <td class="righttd" style="height: 30px; text-align: left">
               <asp:TextBox   CssClass="textbox Wdate" onclick="WdatePicker({isShowClear:false,readOnly:true});" ID="TxtAddDate" runat="server"></asp:TextBox>
                <span class="tips">��ʽ��<%=DateTime.Now.ToShortDateString() %></span></td>
        </tr>
         <tr>
            <td class="lefttd" style="height: 30px; text-align: right">
                <strong>�ƻ����ݣ�</strong></td>
            <td class="righttd" style="height: 30px; text-align: left">
               <asp:TextBox TextMode="MultiLine" Height="200px"  CssClass="textbox textarea"  ID="TxtIntro" runat="server" Width="450px"></asp:TextBox>
               <br />
                <span class="tips">���Լ�¼���Ĺ����ƻ�</span>
           </td>
        </tr>
       
        <tr>
            <td class="lefttd" style="height: 30px; text-align: right">
                <strong>�ƻ�״̬��</strong></td>
            <td class="righttd" style="height: 30px; text-align: left">
              <asp:RadioButtonList ID="RdbStatus" runat="server" RepeatDirection="Horizontal">
                  <asp:ListItem Value="0" Selected="True">δ���</asp:ListItem>
                  <asp:ListItem Value="1">�����</asp:ListItem>
              </asp:RadioButtonList>

           </td>
        </tr>
        <tr>
            <td class="lefttd" style="height: 30px; text-align: right">
                <strong>��¼���ѣ�</strong></td>
            <td class="righttd" style="height: 30px; text-align: left">
                <asp:DropDownList ID="RdbTipsDays" runat="server">
                  <asp:ListItem Value="0">������</asp:ListItem>
                  <asp:ListItem Value="1">1��</asp:ListItem>
                  <asp:ListItem Value="3">3��</asp:ListItem>
                  <asp:ListItem Value="5">5��</asp:ListItem>
                  <asp:ListItem Value="7">һ��</asp:ListItem>
                  <asp:ListItem Value="15">�����</asp:ListItem>
                  <asp:ListItem Value="30">һ����</asp:ListItem>
                    </asp:DropDownList>
                <span class="tips">˵����δ��ɵļƻ������������õ�¼��̨����ʱ�䡣</span>
           </td>
        </tr>
      
       
    
    </table>
       
     <div style="text-align:center;">
     <asp:HiddenField ID="HidID" runat="server" Value="0" />
     <asp:Button ID="Button1" CssClass="button" runat="server" OnClientClick="return(checkform())" Text="ȷ������(O)" AccessKey="O" OnClick="Button1_Click"/>
           <input type="button" class="button" onclick="javascript: parent.box.close();" accesskey="C" value="�ر�ȡ��(C)" /><br />
     </div>

     </asp:Panel>






    <asp:Panel ID="showPannel" runat="server" Width="100%" Visible="false">

        <table width="99%" border="0" cellpadding="1" cellspacing="1" class="CTable">
              <tr class="CTitle">
               <td height="25" width="48" align="center">����</td>
               <td  align="center"><b>����</b></td>
               <td style="text-align:left"><b>�����ƻ�����</b></td>
              <td  width="68" align="center"><b>����״̬</b></td>
              <td  width="68" align="center"><b>��¼����</b></td>
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
                 <a href="?action=status&id=<%#Eval("ID")%>"> <%# Convert.ToString(Eval("status"))=="0"?"<span class='tips'>δ���</span>":"<span style='color:green'>�����</span>" %></a>
            </td>
            <td class="Ctd" style="text-align:center">
                <%# getTipsDay(Convert.ToInt16(Eval("tipsDays"))) %>
            </td>
			
           
          </tr>
           
             
         </ItemTemplate>
          <FooterTemplate>
               <tr class="tdbg" style="display:<%# bool.Parse((showRepeater.Items.Count==0).ToString())?"":"none"%>">
                <td class="Ctd" style="height:50px;text-align:center" colspan="7">
                  <a href="javascript:;" onclick="addPlan()">��û������κι����ƻ���������&raquo;</a>
                </td>
               </tr> 
           </table>

          </FooterTemplate>
        </asp:Repeater>
          </table>


    </asp:Panel>


</asp:Content>
