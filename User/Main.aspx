<%@ Page Language="C#" MasterPageFile="~/User/User.master" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.User_Main" Title="会员中心" Codebehind="Main.aspx.cs" %>
<%@ Import Namespace="Kesion.Publics" %>
<%@ Import Namespace="Kesion.Cache" %>
<%@ Import Namespace="Kesion.BLL" %>
<asp:Content ID="Content1" ContentPlaceHolderID="KSContent" Runat="Server">


     <div class="user_main_r">


          <div class="right_01 tabbox01" style="display:none">
             <div class="tit"><span>我的文章</span>
                    <ul class="tab">
                       <li><a href="#">已审核</a></li>
			           <li><a href="#">待审核</a></li>
			           <li><a href="#">草稿</a></li>
                       <li><a href="#">退稿</a></li>
                    </ul>  
             
             </div>
            
             <div class="con right_box">


                 <!---已审核 begin--->
              <div>

                  <asp:Repeater ID="RepeaterVerify" runat="server">
                    <HeaderTemplate>
                      <table id="tablist" width="98%" border="0" align="center" cellpadding="2" cellspacing="1" class="border">
                      <tr class="title">
        	                <td width="40" align="center">序号</td>
        	                <td align="center">标题</td>
                            <td align="center" width="110"> 录入 </td>
                            <td width="100" align="center"> 更新时间 </td>
                            <td align="center" width="50">状态</td>
	                        <td align="center" width="80">管理操作</td>
                        </tr>
                    </HeaderTemplate>
                    <ItemTemplate>
                       <tr class="tdbg">
                          <td class="splittd" align="center">
                          <%# RepeaterVerify.Items.Count+1 %>
                          </td>
                          <td class="splittd">
                              <img class="img" src="<%# Eval("DefaultPic") %>" width="45" height="45" align="left" onerror="this.style.display='none'"/>
                          <a href='../model/view.aspx?m_id=<%#Eval("ChannelID") %>&id=<%#Eval("InfoID") %>' target="_blank"><%#Eval("Title")%></a>
                          </td>
                          <td class="splittd" align="center"><%#Eval("Inputer") %></td>
                          <td class="splittd" align="center">
                           <span class="tips"><%# Utils.FormatHumanizedTime(Convert.ToDateTime(Eval("AddDate")))%></span>
                          </td>
                          <td class="splittd" style="text-align:center"><span class="tips">已审</span></td>
                          <td class="splittd" align="center">
                               <%# MyCache.GetCacheModel(Convert.ToInt16(Eval("ChannelID")),28)!="0"?@" <a href=""PostInfo.aspx?classid="+Eval("classid")+"&infoId="+Eval("infoid")+@""">修改</a> <a href=""javascript:;"" onclick=""$.dialog.confirm('确定删除吗?',function(){location.href='main.aspx?action=delinfo&id="+Eval("InfoID")+@"';},function(){});"">删除</a>":"-" %>
                          </td>
                      </tr>      
                    </ItemTemplate>
                     <FooterTemplate>
                       <tr class="splittd" style="display:<%# bool.Parse((RepeaterVerify.Items.Count==0).ToString())?"":"none"%>">
                                <td class="splittd" style="text-align:center" colspan="10">找不到任何记录！ </td>
                       </tr> 
                    </table>
                     </FooterTemplate>
                    </asp:Repeater>

               </div>
                <!---已审核 end--->
               
              <!---待审核 begin--->
               <div>
                    <asp:Repeater ID="RepeaterWaitVerify" runat="server">
                    <HeaderTemplate>
                      <table id="tablist" width="98%" border="0" align="center" cellpadding="2" cellspacing="1" class="border">
                      <tr class="title">
        	                <td width="40" align="center">序号</td>
        	                <td align="center">标题</td>
                            <td align="center" width="110"> 录入 </td>
                            <td width="100" align="center"> 更新时间 </td>
                            <td align="center" width="50">状态</td>
	                        <td align="center" width="80">管理操作</td>
                        </tr>
                    </HeaderTemplate>
                    <ItemTemplate>
                       <tr class="tdbg">
                          <td class="splittd" align="center">
                          <%# RepeaterWaitVerify.Items.Count+1 %>
                          </td>
                          <td class="splittd">
                              <img class="img" src="<%# Eval("DefaultPic") %>" width="45" height="45" align="left" onerror="this.style.display='none'"/>
                          <a href='../model/view.aspx?m_id=<%#Eval("ChannelID") %>&id=<%#Eval("InfoID") %>' target="_blank"><%#Eval("Title")%></a>
                          </td>
                          <td class="splittd" align="center"><%#Eval("Inputer") %></td>
                          <td class="splittd" align="center">
                           <span class="tips"><%# Utils.FormatHumanizedTime(Convert.ToDateTime(Eval("AddDate")))%></span>
                          </td>
                          <td class="splittd" style="text-align:center;color:red;">待审</td>
                          <td class="splittd" align="center">
                               <%# @" <a href=""PostInfo.aspx?classid="+Eval("classid")+"&infoId="+Eval("infoid")+@""">修改</a> <a href=""javascript:;"" onclick=""$.dialog.confirm('确定删除吗?',function(){location.href='main.aspx?action=delinfo&id="+Eval("InfoID")+@"';},function(){});"">删除</a>" %>
                          </td>
                      </tr>      
                    </ItemTemplate>
                     <FooterTemplate>
                       <tr class="splittd" style="display:<%# bool.Parse((RepeaterWaitVerify.Items.Count==0).ToString())?"":"none"%>">
                                <td class="splittd" style="text-align:center" colspan="10">找不到任何记录！ </td>
                       </tr> 
                    </table>
                     </FooterTemplate>
                    </asp:Repeater>
               </div>
              <!---待审核 end--->

              <!---草稿 begin--->
               <div>
              <asp:Repeater ID="RepeaterDraftVerify" runat="server">
                    <HeaderTemplate>
                      <table id="tablist" width="98%" border="0" align="center" cellpadding="2" cellspacing="1" class="border">
                      <tr class="title">
        	                <td width="40" align="center">序号</td>
        	                <td align="center">标题</td>
                            <td align="center" width="110"> 录入 </td>
                            <td width="100" align="center"> 更新时间 </td>
                            <td align="center" width="50">状态</td>
	                        <td align="center" width="80">管理操作</td>
                        </tr>
                    </HeaderTemplate>
                    <ItemTemplate>
                       <tr class="tdbg">
                          <td class="splittd" align="center">
                          <%# RepeaterDraftVerify.Items.Count+1 %>
                          </td>
                          <td class="splittd">
                              <img class="img" src="<%# Eval("DefaultPic") %>" width="45" height="45" align="left" onerror="this.style.display='none'"/>
                          <a href='../model/view.aspx?m_id=<%#Eval("ChannelID") %>&id=<%#Eval("InfoID") %>' target="_blank"><%#Eval("Title")%></a>
                          </td>
                          <td class="splittd" align="center"><%#Eval("Inputer") %></td>
                          <td class="splittd" align="center">
                           <span class="tips"><%# Utils.FormatHumanizedTime(Convert.ToDateTime(Eval("AddDate")))%></span>
                          </td>
                          <td class="splittd" style="text-align:center;color:red;">草稿</td>
                          <td class="splittd" align="center">
                               <%# @" <a href=""PostInfo.aspx?classid="+Eval("classid")+"&infoId="+Eval("infoid")+@""">修改</a> <a href=""javascript:;"" onclick=""$.dialog.confirm('确定删除吗?',function(){location.href='main.aspx?action=delinfo&id="+Eval("InfoID")+@"';},function(){});"">删除</a>" %>
                          </td>
                      </tr>      
                    </ItemTemplate>
                     <FooterTemplate>
                       <tr class="splittd" style="display:<%# bool.Parse((RepeaterDraftVerify.Items.Count==0).ToString())?"":"none"%>">
                                <td class="splittd" style="text-align:center" colspan="10">找不到任何记录！ </td>
                       </tr> 
                    </table>
                     </FooterTemplate>
                    </asp:Repeater>
               </div>
              <!---草稿 end--->

              <!---退稿 begin--->
               <div>
                    <asp:Repeater ID="RepeaterRejection" runat="server">
                    <HeaderTemplate>
                      <table id="tablist" width="98%" border="0" align="center" cellpadding="2" cellspacing="1" class="border">
                      <tr class="title">
        	                <td width="40" align="center">序号</td>
        	                <td align="center">标题</td>
                            <td align="center" width="110"> 录入 </td>
                            <td width="100" align="center"> 更新时间 </td>
                            <td align="center" width="50">状态</td>
	                        <td align="center" width="80">管理操作</td>
                        </tr>
                    </HeaderTemplate>
                    <ItemTemplate>
                       <tr class="tdbg">
                          <td class="splittd" align="center">
                          <%# RepeaterRejection.Items.Count+1 %>
                          </td>
                          <td class="splittd">
                              <img class="img" src="<%# Eval("DefaultPic") %>" width="45" height="45" align="left" onerror="this.style.display='none'"/>
                          <a href='../model/view.aspx?m_id=<%#Eval("ChannelID") %>&id=<%#Eval("InfoID") %>' target="_blank"><%#Eval("Title")%></a>
                          </td>
                          <td class="splittd" align="center"><%#Eval("Inputer") %></td>
                          <td class="splittd" align="center">
                           <span class="tips"><%# Utils.FormatHumanizedTime(Convert.ToDateTime(Eval("AddDate")))%></span>
                          </td>
                          <td class="splittd" style="text-align:center;color:red;">退稿</td>
                          <td class="splittd" align="center">
                               <%# @" <a href=""PostInfo.aspx?classid="+Eval("classid")+"&infoId="+Eval("infoid")+@""">修改</a> <a href=""javascript:;"" onclick=""$.dialog.confirm('确定删除吗?',function(){location.href='main.aspx?action=delinfo&id="+Eval("InfoID")+@"';},function(){});"">删除</a>" %>
                          </td>
                      </tr>      
                    </ItemTemplate>
                     <FooterTemplate>
                       <tr class="splittd" style="display:<%# bool.Parse((RepeaterRejection.Items.Count==0).ToString())?"":"none"%>">
                                <td class="splittd" style="text-align:center" colspan="10">找不到任何记录！ </td>
                       </tr> 
                    </table>
                     </FooterTemplate>
                    </asp:Repeater>
               </div>
              <!---退稿 end--->
              
                
             </div>
          </div>
          
     
          <%if (Utils.GetSysInfo("//sysinfo/model/mall").ToString().ToLower()=="true"){ %>
          <div class="right_02 tabbox02">
             <div class="tit">

             <span>我买到的宝贝</span>
                 
                 <span class="small"> 
                     <a href="shop/myorder.aspx?show=-2">待付款(<font><%=DataFactory.GetOnlyValue("select count(1) From KS_ProOrder Where UserName='"+new TemporaryVar().UserName+"' and MoneyReceipt<=0") %></font>)</a>
                     <a href="shop/myorder.aspx?show=-3">待收货(<font><%=DataFactory.GetOnlyValue("select count(1) From KS_ProOrder Where UserName='"+new TemporaryVar().UserName+"' and DeliverStatus=1") %></font>)</a>
                     <a href="shop/mycomment.aspx">待评价(<font><%=DataFactory.GetOnlyValue("select count(1) from ks_proorderitem a inner join ks_proorder b on a.orderid=b.orderid where b.username='"+new TemporaryVar().UserName+"' and (status=2 or deliverStatus=2) and infoid not in(select proid from ks_procomment where username='"+new TemporaryVar().UserName+"')") %></font>)</a>
                 </span>
                 <span class="small" style="float:right;padding-right:20px;"><a href="Shop/myorder.aspx">所有订单</a></span>

             
             </div>
             <div class="user_main_r_box">



                 <!--我的订单 beign-->
       <asp:Repeater ID="RepeaterOrder" runat="server"  onitemdatabound="RepeaterOrder_ItemDataBound" >
          <HeaderTemplate>
          <table width="98%" align="center" border="0" cellpadding="1" cellspacing="1" class="border">
              <tr class="title">
               <td height="25" width="40" nowrap><b>序号</b></td>
               <td style="width:500px;text-align:left">&nbsp;&nbsp;<b>商品</b></td>
               <td width="80" align="center"><b>单价</b></td>
               <td width="80" align="center"><b>数量</b></td>
               <td width="70" align="center"><b>实付</b></td>
               <td width="70" align="center" nowrap><b>状态</b></td>
               <td width="70" align="center" nowrap><b>操作</b></td>
              </tr>
          </HeaderTemplate>
         <ItemTemplate>
         
             <TR class="title1">
				 <td colspan="7" style="padding-top:2px;padding-bottom:2px;padding-left:10px;">
				 <strong>
				<%# RepeaterOrder.Items.Count+1 %>、 订单编号：<%#Eval("orderid")%> &nbsp;&nbsp;下单时间：<%# Utils.FormatHumanizedTime(Convert.ToDateTime(Eval("InputTime"))) %>
				</strong>
				<%# Convert.ToInt16(Eval("ordertype")) == 1 ? (string.Concat("<span style='color:Red'>团购</span>",!string.IsNullOrEmpty(Eval("verifycode").ToString())?" 消费验证码[<span style='color:green'>"+Eval("verifycode").ToString()+"</span>]":string.Empty)):string.Empty%>
                 <%# Convert.ToInt32(Eval("changescore")) >0 ? " <span style='color:green'>积分兑换</span>" : string.Empty%>
				</td>
			</TR>
			<tr>
			<tr class="tdbg">
              <td class="list_link" align="center" width="25"></td>
			  <td  colspan="3" align="left">
             <asp:Repeater ID="Repeater2" runat="server">
               <ItemTemplate>
               <table width="100%" class="table1" cellpadding="0" cellspacing="0" border="0">
               <tr class="TR_BG_list">
                  <td class="splittd" align="left" style="width:500px">
                    <table border='0' width="100%" cellpadding="0" cellspacing="0">
		               <tr>
			            <td width="60" height="70" align="center" class="img"><img onerror="this.src='<%=MyCache.GetCacheShopConfig(9) %>';" src='<%# Eval("DefaultPic") %>' width='50' height='50' align='left'/></td>
			            <td>
                         <%# Kesion.NET.WebSite.User_Order.getProOrder(Utils.StrToInt((Eval("ClassID"))), Convert.ToString(Eval("FileName") + ""), Convert.ToString(Eval("TurnUrl") + ""), Utils.StrToInt(Eval("ItemID")), Utils.StrToInt(Eval("ChannelID")), Utils.StrToInt(Eval("InfoID")), string.IsNullOrEmpty(Convert.ToString(Eval("Title") + "")) ? Convert.ToString(Eval("Title") + "") : Convert.ToString(Eval("Title")), Utils.StrToInt(Eval("isBundleSale")), Utils.StrToInt(Eval("isChangeBuy")), Utils.StrToInt(Eval("isLimitBuy")),Convert.ToString(Eval("AttributeCart")),Utils.StrToInt(Eval("attrID")))%>			            
		               </td>
		              </tr>
		             </table>
                  </td>
                  <td class="splittd" style="width:80px;">￥<%# Kesion.APPCode.Public.ReturnShopPrice(Convert.ToString(Eval("Price"))) %></td>
                  <td class="splittd" style="width:80px;text-align:center"><%#Eval("num") %></td>
                </table> 
               
               </ItemTemplate>
             </asp:Repeater>
             </td>
             <td class="list_link" style="text-align:center" valign="top">
              <%# Utils.StrToInt(Eval("ChangeScore")) > 0 ? ""+Eval("ChangeScore") +"分+": string.Empty%>
              ￥<%# Kesion.APPCode.Public.ReturnShopPrice(Convert.ToString(Eval("OrderTotalPrice")))%>
            
             </td>
             <td class="list_link" style="text-align:center" nowrap valign="top">
             <%# Kesion.APPCode.OrderProcess.GetOrderStatus(true,Utils.StrToInt(Eval("orderType")),Convert.ToString(Eval("OrderID")),Utils.StrToInt(Eval("ConsumptionMode")),Utils.StrToInt(Eval("IsBusinessConfirm")),Convert.ToString(Eval("alipaytradestatus")), Convert.ToInt16(Eval("status")), Convert.ToInt16(Eval("DeliverStatus")), Utils.StrToDecimal(Convert.ToString(Eval("MoneyReceipt"))), Utils.StrToDecimal(Convert.ToString(Eval("OrderTotalPrice"))))%>
             </td>
				<td nowrap class="list_link" style="text-align:center" valign="top">
				<a href="shop/ShowMyOrder.aspx?id=<%# Eval("id") %>">订单详情</a>
				<%# (((float)Convert.ToDouble(Eval("MoneyReceipt")) > 0 || Convert.ToString(Eval("DeliverStatus")) == "1") && Utils.StrToInt(Eval("status"))<=1 && Utils.StrToInt(Eval("IsBusinessConfirm"))==0) ? "<br/><a href='Shop/myorder.aspx?action=returns&id=" + Eval("id") + "'>退货退款</a>" : string.Empty%>
				
				<%# Convert.ToString(Eval("DeliverStatus")) == "1" ? @"<br/><a href='javascript:;' onclick=""KesionJS.Confirm('此操作不可逆，您确定收到商品了吗？', 'location.href=\'shop/ShowMyOrder.aspx?id=" + Eval("id") + @"&action=signorder\';', null);"">确认收货</a>" : ""%>
				<%# Convert.ToString(Eval("DeliverStatus")) == "2" && Convert.ToString(Eval("Status"))!= "2" ? @"<br/><a href='javascript:;' onclick=""KesionJS.Confirm('订单一旦结清，就可能再对该订单进行任何操作，确定结清吗？', 'location.href=\'shop/ShowMyOrder.aspx?id=" + Eval("id") + @"&action=finishorder\';', null);"">结清订单</a>" : ""%>
				<%# Convert.ToString(Eval("status")) == "0" && Convert.ToString(Eval("DeliverStatus")) == "0" && Utils.StrToFloat(Convert.ToString(Eval("MoneyReceipt"))) == 0 ? "<br /><a href='Shop/myorder.aspx?action=delorder&id=" + Eval("id") + @"' onClick=""return(confirm('此操作不可逆，确定执行删除操作吗？'))"">订单删除</a>" : ""%>
				<%# Convert.ToString(Eval("PayStatus")) != "1" && Convert.ToInt16(Eval("status")) < 2  ? "<br/><a href='Shop/myorder.aspx?action=pay&id=" + Eval("id") + "'>订单支付</a>" : ""%>
                <%# !string.IsNullOrEmpty(MyCache.GetShopCommonConfig(42)) && Convert.ToString(Eval("ConsumptionMode")) == "1" && Convert.ToString(Eval("DeliverStatus")) != "0" ? "<br/><a href='Shop/ExpressLog.aspx?OrderID="+Eval("OrderID")+"'>查看物流</a>" : string.Empty %>
				</td>

             </tr>
             
         </ItemTemplate>
          <FooterTemplate>
           <tr class="tdbg" style="display:<%# bool.Parse((RepeaterOrder.Items.Count==0).ToString())?"":"none"%>">
                <td class="splittd" style="text-align:center" colspan="7">
                  你买的东西太少了，这里空空的，快去挑选合适的商品吧！
                </td>
               </tr> 
           </table>
          </FooterTemplate>
        </asp:Repeater>

                 <!--我的订单 end-->






             </div>
          </div>
         <%} %> 

          
          <div class="right_02 tabbox03">
             <div class="tit"> <span>我的问答</span>
                
                <ul class="tab">
                       <li><a href="#">我提问的问题</a></li>
			           <li><a href="#">我参与的问题</a></li>
			           <li><a href="#">向我提问的话题</a></li>
               </ul> 
             </div>
            <div class="con right_box">

            <div>

              <asp:Repeater ID="RepeaterAsk" runat="server">
                <HeaderTemplate>
                     <table id="tablist" width="98%" border="0" align="center" cellpadding="2" cellspacing="1" class="border">
                  <tr align="center" class="title">
        	            <td width="50" align="center">序号</td>
        	            <td align="center"> 问题</td>
        	            <td align="center" nowrap>悬赏分</td>
                        <td align="center">状态</td>
                        <td align="center">操作</td>
                    </tr>
                </HeaderTemplate>
                <ItemTemplate>
                  <tr class="tdbg">
                      <td class="splittd" align="center"><%# RepeaterAsk.Items.Count+1 %></td>
                      <td class="splittd"> 
                       <a href="<%# Kesion.HtmlTags.BasicField.GetAskUrl(Convert.ToInt16(Eval("TopicID"))) %>" target="_blank"><%# Utils.CutStr(Utils.RemoveHtml(Convert.ToString(Eval("Title"))), 80)%></a>
                       <div class="tips">提问时间：<%# Utils.FormatHumanizedTime(Convert.ToDateTime(Eval("AddDate")))%> 是否审核：<%#Convert.ToString(Eval("verify"))=="1"?"<span style='color:green'>已审核</span>":"<span style='color:red'>未审核</span>" %> 分类：<%# MyCache.GetCacheAskCategory(Convert.ToInt16(Eval("ClassID")),"classname") %></div>
           
                      </td>
                      <td class="splittd" style="text-align:center"><font color=red><%# Convert.ToSingle(Convert.ToString(Eval("reward"))).ToString()%>
            </font> 分</td>
                      <td class="splittd" style="text-align:center"><%#Convert.ToString(Eval("IsSolve")) == "1" ? "<span style='color:green'>已解决</span>" : Convert.ToInt16(Eval("IsSolve"))==2?"已关闭":"<span style='color:red'>未解决</span>"%></td>
                      <td class="splittd" align="center">
                                 <%# MyCache.GetAskCacheConfig(23).Equals("0") ? "---" : (MyCache.GetAskCacheConfig(23).Equals("2") || (MyCache.GetAskCacheConfig(23).Equals("1") && Convert.ToInt16(Eval("IsSolve")) == 0) ? " <div class=\"bt\"><a onclick=\"return(confirm('确定删除吗？'));\" href='main.aspx?action=deleteAskTopic&ids=" + Eval("topicid") + "'>删除</a></div>" : string.Empty)%>
                       </td>
                  </tr>  
                 </ItemTemplate>
                 <FooterTemplate>
                     <tr class="tdbg" style="display:<%# bool.Parse((RepeaterAsk.Items.Count==0).ToString())?"":"none"%>">
                            <td class="splittd" style="text-align:center" colspan="10">
                             您没有提问题哦^_^
                            </td>
                       </tr> 
                  </table>
                 </FooterTemplate>
                </asp:Repeater>

           </div>

                <!--我参与的回答 begin-->
              <div>
            <asp:Repeater ID="RepeaterMyAnswer" runat="server">
                <HeaderTemplate>
                     <table id="tablist" width="98%" border="0" align="center" cellpadding="2" cellspacing="1" class="border">
                  <tr align="center" class="title">
        	            <td width="50" align="center">序号</td>
        	            <td align="center">问题</td>
        	            <td align="center">悬赏分</td>
                        <td align="center">状态</td>
                        <td align="center">操作</td>
                    </tr>
                </HeaderTemplate>
                <ItemTemplate>
                  <tr class="tdbg">
                      <td class="splittd" align="center"><%# RepeaterMyAnswer.Items.Count+1 %></td>
                      <td class="splittd"><a href="<%# Kesion.HtmlTags.BasicField.GetAskUrl(Convert.ToInt16(Eval("TopicID"))) %>" target="_blank"><%# Utils.CutStr(Utils.RemoveHtml(Convert.ToString(Eval("Title"))), 80)%></a>
                       <div class="tips">我的回答：<%# Utils.CutStr(Utils.RemoveHtml(Convert.ToString(Eval("Content"))),80)%></div>
                       <div class="tips">提问时间：<%# Utils.FormatHumanizedTime(Convert.ToDateTime(Eval("AddDate")))%> 提问者：<%#Eval("userName") %> 分类：<%# MyCache.GetCacheAskCategory(Convert.ToInt16(Eval("ClassID")),"classname") %></div>
           
                      </td>
                      <td class="splittd" style="text-align:center"><font color=red><%# Convert.ToSingle(Convert.ToString(Eval("reward"))).ToString()%>
            </font> 分</td>
                      <td class="splittd" style="text-align:center"><%#Convert.ToString(Eval("IsSolve")) == "1" ? "<span style='color:green'>已解决</span>" : Convert.ToInt16(Eval("IsSolve"))==2?"已关闭":"<span style='color:red'>未解决</span>"%></td>
                      <td class="splittd" align="center">
                             <%# MyCache.GetAskCacheConfig(20).Equals("0") || MyCache.GetAskCacheConfig(20).Equals("1")  || Convert.ToString(Eval("IsSolve")) != "0" ? "---" :  " <div class=\"bt\"><a onclick=\"return(confirm('确定删除吗？'));\" href='Main.aspx?action=deleteaskanswer&ids=" + Eval("postid") + "'>删除</a></div>"%>
                       </td>

                  </tr>  

                 </ItemTemplate>
                 <FooterTemplate>
                     <tr class="tdbg" style="display:<%# bool.Parse((RepeaterMyAnswer.Items.Count==0).ToString())?"":"none"%>">
                            <td class="splittd" style="text-align:center" colspan="10">
                              没有回答过问题！
                            </td>
                       </tr> 
                  </table>
                 </FooterTemplate>
                </asp:Repeater>


              </div>
                  <!--我参与的回答 end-->

                  <!--向我提问的话题 begin-->
              <div>

                  <asp:Repeater ID="RepeaterAskToMe" runat="server">
    <HeaderTemplate>
         <table id="tablist" width="98%" border="0" align="center" cellpadding="2" cellspacing="1" class="border">
      <tr align="center" class="title">
        	<td width="50" align="center">序号</td>
        	<td align="center"> 问题</td>
        	<td align="center" nowrap>悬赏分</td>
            <td align="center">状态</td>
            <td align="center">是否解答</td>
        </tr>
    </HeaderTemplate>
    <ItemTemplate>
      <tr class="tdbg">
          <td class="splittd" align="center"><%# RepeaterAskToMe.Items.Count+1 %></td>
          <td class="splittd"> 
           <a href="<%# Kesion.HtmlTags.BasicField.GetAskUrl(Convert.ToInt16(Eval("TopicID"))) %>" target="_blank"><%# Utils.CutStr(Utils.RemoveHtml(Convert.ToString(Eval("Title"))), 80)%></a>
           <div class="tips">提问者：<%# Eval("UserName") %> 提问时间：<%# Utils.FormatHumanizedTime(Convert.ToDateTime(Eval("AddDate")))%> 是否审核：<%#Convert.ToString(Eval("verify"))=="1"?"<span style='color:green'>已审核</span>":"<span style='color:red'>未审核</span>" %> 分类：<%# MyCache.GetCacheAskCategory(Convert.ToInt16(Eval("ClassID")),"classname") %></div>
           
          </td>
          <td class="splittd" style="text-align:center"><font color=red><%# Convert.ToSingle(Convert.ToString(Eval("reward"))).ToString()%>
</font> 分</td>
          <td class="splittd" style="text-align:center"><%#Convert.ToString(Eval("IsSolve")) == "1" ? "<span style='color:green'>已解决</span>" : Convert.ToInt16(Eval("IsSolve"))==2?"已关闭":"<span style='color:red'>未解决</span>"%></td>
          <td class="splittd" align="center">
              <%# Kesion.NET.WebSite.MyAsk.isAnswer(Convert.ToInt16(Eval("topicid")),Convert.ToString(Eval("postTable"))) %>      
           </td>
      </tr>  
     </ItemTemplate>
     <FooterTemplate>
         <tr class="tdbg" style="display:<%# bool.Parse((RepeaterAskToMe.Items.Count==0).ToString())?"":"none"%>">
                <td class="splittd" style="text-align:center" colspan="10">
                  没有人向我提问！
                </td>
           </tr> 
      </table>
     </FooterTemplate>
    </asp:Repeater>

              </div>
                 <!--向我提问的话题 end-->






             </div>
          </div>

        <script>
            $(".tabbox01").FengTab({ titCell: ".tab", mainCell: ".con", defaultIndex: 0, trigger: "mouseover", titOnClassName: "on", showtime: 0 });
            $(".tabbox03").FengTab({ titCell: ".tab", mainCell: ".con", defaultIndex: 0, trigger: "mouseover", titOnClassName: "on", showtime: 0 });
</script>    



















  
  <%
      string qqenable = MyCache.GetAccountAPIConfig("qq", "enable");
      string sinaenable = MyCache.GetAccountAPIConfig("sina", "enable");
      string alipayenable = MyCache.GetAccountAPIConfig("alipay", "enable");
      if (qqenable == "true" || sinaenable == "true" || alipayenable == "true")
      {     
  %>
   <table  cellspacing="1" cellpadding="3" class="border" width="98%" align="center" border="0">
	 <tr class="title">
           <td colspan="2" > 账 号 通 <a href="ApiBind.aspx" style="color:#666;font-size:12px">(绑定管理)</a> </td>
      </tr>
     <tr class="tdbg">
         <td style="padding:10px">
            <%
                
      StringBuilder sb = new StringBuilder();
      if (qqenable == "true")
      {
          if (!string.IsNullOrEmpty(__info.QQOpenID))
          {
              sb.AppendFormat(@"<img src=""{{$GetSiteUrl}}sysimg/default/icon_qq.png"" align=""absmiddle"" title=""{0}""/>{0}", MyCache.GetAccountAPIConfig("qq", "name"));
          }
          else
          {
              sb.AppendFormat(@"<img src=""{{$GetSiteUrl}}sysimg/default/icon_qq_no.png"" align=""absmiddle"" title=""{0}""/>{0}", MyCache.GetAccountAPIConfig("qq", "name"));

          }
      }
      if (sinaenable == "true")
      {
          if (!string.IsNullOrEmpty(__info.SinaID))
          {
              sb.AppendFormat(@" <img src=""{{$GetSiteUrl}}sysimg/default/icon_sina.png"" align=""absmiddle"" title=""{0}""/>{0}", MyCache.GetAccountAPIConfig("sina", "name"));
          }
          else
          {
              sb.AppendFormat(@" <img src=""{{$GetSiteUrl}}sysimg/default/icon_sina_no.png"" align=""absmiddle"" title=""{0}""/>{0}", MyCache.GetAccountAPIConfig("sina", "name"));

          }
      }
      if (alipayenable == "true")
      {
          if (!string.IsNullOrEmpty(__info.AlipayID))
          {
              sb.AppendFormat(@" <img src=""{{$GetSiteUrl}}sysimg/default/icon_alipay.png"" align=""absmiddle"" title=""{0}""/>{0}", MyCache.GetAccountAPIConfig("alipay", "name"));
          }
          else
          {
              sb.AppendFormat(@" <img src=""{{$GetSiteUrl}}sysimg/default/icon_alipay_no.png"" align=""absmiddle"" title=""{0}""/>{0}", MyCache.GetAccountAPIConfig("alipay", "name"));

          }
      }
      string tp = sb.ToString().Replace("{$GetSiteUrl}", MyCache.GetCacheConfig(5) + KSCMS.GetInstallDir());

      Response.Write(tp);          
                
                 %>
                <br /><br /> <div class="tips">灰色的说明您没有绑定第三方登录平台！</div>
             </td>
     </tr>
 
  </table>

<%} %>


</asp:Content>

