<%@ Page Language="C#" MasterPageFile="~/User/User.master" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.User_MyComment" Title="商品评价管理" Codebehind="MyComment.aspx.cs" %>
<%@ Import Namespace="Kesion.Publics" %>
<%@ Import Namespace="Kesion.BLL" %>
<%@ Import Namespace="Kesion.Cache" %>
<%@ Import Namespace="Kesion.HtmlTags" %>

<asp:Content ID="Content1" ContentPlaceHolderID="KSContent" Runat="Server">
<asp:Panel ID="ListPannel" runat="server">
<div class="tabs">	
			<ul>
				<li class='puton'><a href="mycomment.aspx">我购买的商品列表</a></li>
			</ul>
</div>
<br />
  <asp:Repeater ID="Repeater1" runat="server">
          <HeaderTemplate>
          <table width="98%" align="center" border="0" cellpadding="1" cellspacing="1" class="border">
              <tr class="title">
               <td height="25" width="40" nowrap><b>序号</b></td>
               <td><b>商品</b></td>
               <td align="center"><b>购买时间</b></td>
               <td align="center" nowrap><b>评价</b></td>
               <td align="center" nowrap><b>评价等级</b></td>
              </tr>
          </HeaderTemplate>
         <ItemTemplate>
             <TR>
				 <td class="splittd" style="text-align:center">
				 <strong>
				<%# Container.ItemIndex + 1 + (CurrPage - 1) * PageSize%>、
				</strong>
				</td>
                <td class="splittd">
                <%# GetTitle(Convert.ToInt16(Eval("ordertype")),Convert.ToInt32(Eval("infoid"))) %>
                </td>
                <td class="splittd" ><%# Eval("InputTime")%></td>
                <td class="splittd" style="text-align:center"><%# GetCommentTips(Convert.ToInt16(Eval("status")),Convert.ToInt16(Eval("deliverStatus")),Convert.ToString(Eval("orderId")),Convert.ToInt16(Eval("infoId"))) %></td>
                <td class="splittd" style="text-align:center"><%# GetCommentStar(Convert.ToString(Eval("orderId")), Convert.ToInt16(Eval("infoId"))) %></td>
			</TR>
			<tr>
			
             
         </ItemTemplate>
          <FooterTemplate>
           <tr class="tdbg" style="display:<%# bool.Parse((Repeater1.Items.Count==0).ToString())?"":"none"%>">
                <td class="splittd" style="text-align:center" colspan="7">
                 您还没有购买任何的商品！
                </td>
               </tr> 
           </table>
          </FooterTemplate>
        </asp:Repeater>
        
        
        
           <br />
    
     <KS:Page ID="Page1" runat="server" />
</asp:Panel>


<asp:Panel ID="WritePannel" runat="server" Visible="false">
        <table  cellspacing="1" cellpadding="3" class="border" width="98%" align="center" border="0">
	                   <tr class="title">
                            <td colspan="2"> 评价我购买的商品</td>
                          </tr>
                          <tr class="tdbg">
                            <td class="lefttd" style="height:30px">商品名称：</td>
                            <td>  <%=productName %> </td>
                          </tr>
                          <tr class="tdbg">
                            <td class="lefttd" style="height:30px">购买时间：</td>
                            <td>  <%=buyDate %> </td>
                          </tr>
                          <tr class="tdbg">
                            <td class="lefttd" style="height:30px">评价等级：</td>
                            <td>  <asp:RadioButtonList ID="RdbCmtType" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow">
                             <asp:ListItem Value="0">好评</asp:ListItem>
                             <asp:ListItem Value="1" Selected="True">中评</asp:ListItem>
                             <asp:ListItem Value="2">差评</asp:ListItem>
                            </asp:RadioButtonList> </td>
                          </tr>
                          <tr class="tdbg">
                            <td class="lefttd" style="height:30px">得星星数：</td>
                            <td>
                           
                            <SCRIPT>
                                var startnum = 5; //星的个数
                                var selectedcolor = "red"; //选上的颜色
                                var uselectedcolor = "gray"; //未选的颜色
                                function _$(id) {
                                    return document.getElementById(id);
                                }
                                function setstarover(k, index) {

                                    for (var i = 1; i <= index; i++) {
                                        _$("s" + k + i).style.color = selectedcolor;
                                        _$("s" + k + i).style.cursor = "hand";
                                    }
                                }
                                function setstar(k, index) {
                                    
                                    for (var i =  1; i <= startnum; i++) {
                                        _$("s" + k + i).style.color = uselectedcolor;
                                        _$("s" + k + i).style.cursor = "hand";
                                    }
                                    for (var i = 1; i <= starNum; i++) {
                                        _$("s" + k + i).style.color = selectedcolor;
                                        _$("s" + k + i).style.cursor = "hand";
                                    }
                                }
                                var starNum = 0;
                                function clickstar(presetpoint, k, index) {
                                    starNum = index;
                                    _$("star").value = '' + index + '';
                                }

                                var str = '';
                                var PresetPoint = Array('');
                                for (var k = 0; k < PresetPoint.length; k++) {
                                    str += '<input type="hidden" name="star" value="0" id="star">';
                                    for (var i = 1; i <= startnum; i++) {
                                        str += ('<span id="s' + k + i + '" style="font-size:24px" onclick="clickstar(\'' + PresetPoint[k] + '\',' + k + ',' + i + ')" title="' + i + '星" onmouseout="setstar(' + k + ',' + starNum + ')" onmouseover="setstarover(' + k + ',' + i + ')">★</span>');
                                    }
                                    str += "&nbsp;"
                                }
                                document.write(str);
</SCRIPT>
                            
                            </td>
                          </tr>
                          <tr class="tdbg">
                            <td class="lefttd">评价内容：</td>
                            <td>
                            <asp:TextBox ID="TxtContent" TextMode="MultiLine" runat="server" Width="500px" Height="200px" CssClass="textbox"></asp:TextBox>
                            </td>
                          </tr>

                          <tr class="tdbg">
                            <td height="40">&nbsp;</td>
                            <td>
                                &nbsp; &nbsp;&nbsp;<asp:Button ID="BtnComment" CssClass="button" runat="server"   
                                    Text="OK!确定评价" onclick="Button1_Click" />
                                &nbsp; &nbsp; &nbsp;
                              <input type="reset" value=" 重 置 " class="button"/></td>
                        </tr>

      </table>
      <script>
          function checkComment() {
              if (jQuery("#star").val() == 0) {
                  KesionJS.Alert("请选择评定的星星数!");
                  return false;
              }
              if (jQuery("#<%=this.TxtContent.ClientID %>").val() == '') {
                  KesionJS.Alert("请输入评价内容！", 'jQuery("#<%=this.TxtContent.ClientID %>").focus()');
                  return false;
              }
              return true;
          }
      </script>
</asp:Panel>

</asp:Content>

