<%@ Page Language="C#" MasterPageFile="~/User/User.master" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.User_Main" Title="��Ա����" Codebehind="Main.aspx.cs" %>
<%@ Import Namespace="Kesion.Publics" %>
<%@ Import Namespace="Kesion.Cache" %>
<%@ Import Namespace="Kesion.BLL" %>
<asp:Content ID="Content1" ContentPlaceHolderID="KSContent" Runat="Server">


     <div class="user_main_r">


          <div class="right_01 tabbox01" style="display:none">
             <div class="tit"><span>�ҵ�����</span>
                    <ul class="tab">
                       <li><a href="#">�����</a></li>
			           <li><a href="#">�����</a></li>
			           <li><a href="#">�ݸ�</a></li>
                       <li><a href="#">�˸�</a></li>
                    </ul>  
             
             </div>
            
             <div class="con right_box">


                 <!---����� begin--->
              <div>

                  <asp:Repeater ID="RepeaterVerify" runat="server">
                    <HeaderTemplate>
                      <table id="tablist" width="98%" border="0" align="center" cellpadding="2" cellspacing="1" class="border">
                      <tr class="title">
        	                <td width="40" align="center">���</td>
        	                <td align="center">����</td>
                            <td align="center" width="110"> ¼�� </td>
                            <td width="100" align="center"> ����ʱ�� </td>
                            <td align="center" width="50">״̬</td>
	                        <td align="center" width="80">�������</td>
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
                          <td class="splittd" style="text-align:center"><span class="tips">����</span></td>
                          <td class="splittd" align="center">
                               <%# MyCache.GetCacheModel(Convert.ToInt16(Eval("ChannelID")),28)!="0"?@" <a href=""PostInfo.aspx?classid="+Eval("classid")+"&infoId="+Eval("infoid")+@""">�޸�</a> <a href=""javascript:;"" onclick=""$.dialog.confirm('ȷ��ɾ����?',function(){location.href='main.aspx?action=delinfo&id="+Eval("InfoID")+@"';},function(){});"">ɾ��</a>":"-" %>
                          </td>
                      </tr>      
                    </ItemTemplate>
                     <FooterTemplate>
                       <tr class="splittd" style="display:<%# bool.Parse((RepeaterVerify.Items.Count==0).ToString())?"":"none"%>">
                                <td class="splittd" style="text-align:center" colspan="10">�Ҳ����κμ�¼�� </td>
                       </tr> 
                    </table>
                     </FooterTemplate>
                    </asp:Repeater>

               </div>
                <!---����� end--->
               
              <!---����� begin--->
               <div>
                    <asp:Repeater ID="RepeaterWaitVerify" runat="server">
                    <HeaderTemplate>
                      <table id="tablist" width="98%" border="0" align="center" cellpadding="2" cellspacing="1" class="border">
                      <tr class="title">
        	                <td width="40" align="center">���</td>
        	                <td align="center">����</td>
                            <td align="center" width="110"> ¼�� </td>
                            <td width="100" align="center"> ����ʱ�� </td>
                            <td align="center" width="50">״̬</td>
	                        <td align="center" width="80">�������</td>
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
                          <td class="splittd" style="text-align:center;color:red;">����</td>
                          <td class="splittd" align="center">
                               <%# @" <a href=""PostInfo.aspx?classid="+Eval("classid")+"&infoId="+Eval("infoid")+@""">�޸�</a> <a href=""javascript:;"" onclick=""$.dialog.confirm('ȷ��ɾ����?',function(){location.href='main.aspx?action=delinfo&id="+Eval("InfoID")+@"';},function(){});"">ɾ��</a>" %>
                          </td>
                      </tr>      
                    </ItemTemplate>
                     <FooterTemplate>
                       <tr class="splittd" style="display:<%# bool.Parse((RepeaterWaitVerify.Items.Count==0).ToString())?"":"none"%>">
                                <td class="splittd" style="text-align:center" colspan="10">�Ҳ����κμ�¼�� </td>
                       </tr> 
                    </table>
                     </FooterTemplate>
                    </asp:Repeater>
               </div>
              <!---����� end--->

              <!---�ݸ� begin--->
               <div>
              <asp:Repeater ID="RepeaterDraftVerify" runat="server">
                    <HeaderTemplate>
                      <table id="tablist" width="98%" border="0" align="center" cellpadding="2" cellspacing="1" class="border">
                      <tr class="title">
        	                <td width="40" align="center">���</td>
        	                <td align="center">����</td>
                            <td align="center" width="110"> ¼�� </td>
                            <td width="100" align="center"> ����ʱ�� </td>
                            <td align="center" width="50">״̬</td>
	                        <td align="center" width="80">�������</td>
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
                          <td class="splittd" style="text-align:center;color:red;">�ݸ�</td>
                          <td class="splittd" align="center">
                               <%# @" <a href=""PostInfo.aspx?classid="+Eval("classid")+"&infoId="+Eval("infoid")+@""">�޸�</a> <a href=""javascript:;"" onclick=""$.dialog.confirm('ȷ��ɾ����?',function(){location.href='main.aspx?action=delinfo&id="+Eval("InfoID")+@"';},function(){});"">ɾ��</a>" %>
                          </td>
                      </tr>      
                    </ItemTemplate>
                     <FooterTemplate>
                       <tr class="splittd" style="display:<%# bool.Parse((RepeaterDraftVerify.Items.Count==0).ToString())?"":"none"%>">
                                <td class="splittd" style="text-align:center" colspan="10">�Ҳ����κμ�¼�� </td>
                       </tr> 
                    </table>
                     </FooterTemplate>
                    </asp:Repeater>
               </div>
              <!---�ݸ� end--->

              <!---�˸� begin--->
               <div>
                    <asp:Repeater ID="RepeaterRejection" runat="server">
                    <HeaderTemplate>
                      <table id="tablist" width="98%" border="0" align="center" cellpadding="2" cellspacing="1" class="border">
                      <tr class="title">
        	                <td width="40" align="center">���</td>
        	                <td align="center">����</td>
                            <td align="center" width="110"> ¼�� </td>
                            <td width="100" align="center"> ����ʱ�� </td>
                            <td align="center" width="50">״̬</td>
	                        <td align="center" width="80">�������</td>
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
                          <td class="splittd" style="text-align:center;color:red;">�˸�</td>
                          <td class="splittd" align="center">
                               <%# @" <a href=""PostInfo.aspx?classid="+Eval("classid")+"&infoId="+Eval("infoid")+@""">�޸�</a> <a href=""javascript:;"" onclick=""$.dialog.confirm('ȷ��ɾ����?',function(){location.href='main.aspx?action=delinfo&id="+Eval("InfoID")+@"';},function(){});"">ɾ��</a>" %>
                          </td>
                      </tr>      
                    </ItemTemplate>
                     <FooterTemplate>
                       <tr class="splittd" style="display:<%# bool.Parse((RepeaterRejection.Items.Count==0).ToString())?"":"none"%>">
                                <td class="splittd" style="text-align:center" colspan="10">�Ҳ����κμ�¼�� </td>
                       </tr> 
                    </table>
                     </FooterTemplate>
                    </asp:Repeater>
               </div>
              <!---�˸� end--->
              
                
             </div>
          </div>
          
     
          <%if (Utils.GetSysInfo("//sysinfo/model/mall").ToString().ToLower()=="true"){ %>
          <div class="right_02 tabbox02">
             <div class="tit">

             <span>���򵽵ı���</span>
                 
                 <span class="small"> 
                     <a href="shop/myorder.aspx?show=-2">������(<font><%=DataFactory.GetOnlyValue("select count(1) From KS_ProOrder Where UserName='"+new TemporaryVar().UserName+"' and MoneyReceipt<=0") %></font>)</a>
                     <a href="shop/myorder.aspx?show=-3">���ջ�(<font><%=DataFactory.GetOnlyValue("select count(1) From KS_ProOrder Where UserName='"+new TemporaryVar().UserName+"' and DeliverStatus=1") %></font>)</a>
                     <a href="shop/mycomment.aspx">������(<font><%=DataFactory.GetOnlyValue("select count(1) from ks_proorderitem a inner join ks_proorder b on a.orderid=b.orderid where b.username='"+new TemporaryVar().UserName+"' and (status=2 or deliverStatus=2) and infoid not in(select proid from ks_procomment where username='"+new TemporaryVar().UserName+"')") %></font>)</a>
                 </span>
                 <span class="small" style="float:right;padding-right:20px;"><a href="Shop/myorder.aspx">���ж���</a></span>

             
             </div>
             <div class="user_main_r_box">



                 <!--�ҵĶ��� beign-->
       <asp:Repeater ID="RepeaterOrder" runat="server"  onitemdatabound="RepeaterOrder_ItemDataBound" >
          <HeaderTemplate>
          <table width="98%" align="center" border="0" cellpadding="1" cellspacing="1" class="border">
              <tr class="title">
               <td height="25" width="40" nowrap><b>���</b></td>
               <td style="width:500px;text-align:left">&nbsp;&nbsp;<b>��Ʒ</b></td>
               <td width="80" align="center"><b>����</b></td>
               <td width="80" align="center"><b>����</b></td>
               <td width="70" align="center"><b>ʵ��</b></td>
               <td width="70" align="center" nowrap><b>״̬</b></td>
               <td width="70" align="center" nowrap><b>����</b></td>
              </tr>
          </HeaderTemplate>
         <ItemTemplate>
         
             <TR class="title1">
				 <td colspan="7" style="padding-top:2px;padding-bottom:2px;padding-left:10px;">
				 <strong>
				<%# RepeaterOrder.Items.Count+1 %>�� ������ţ�<%#Eval("orderid")%> &nbsp;&nbsp;�µ�ʱ�䣺<%# Utils.FormatHumanizedTime(Convert.ToDateTime(Eval("InputTime"))) %>
				</strong>
				<%# Convert.ToInt16(Eval("ordertype")) == 1 ? (string.Concat("<span style='color:Red'>�Ź�</span>",!string.IsNullOrEmpty(Eval("verifycode").ToString())?" ������֤��[<span style='color:green'>"+Eval("verifycode").ToString()+"</span>]":string.Empty)):string.Empty%>
                 <%# Convert.ToInt32(Eval("changescore")) >0 ? " <span style='color:green'>���ֶһ�</span>" : string.Empty%>
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
                  <td class="splittd" style="width:80px;">��<%# Kesion.APPCode.Public.ReturnShopPrice(Convert.ToString(Eval("Price"))) %></td>
                  <td class="splittd" style="width:80px;text-align:center"><%#Eval("num") %></td>
                </table> 
               
               </ItemTemplate>
             </asp:Repeater>
             </td>
             <td class="list_link" style="text-align:center" valign="top">
              <%# Utils.StrToInt(Eval("ChangeScore")) > 0 ? ""+Eval("ChangeScore") +"��+": string.Empty%>
              ��<%# Kesion.APPCode.Public.ReturnShopPrice(Convert.ToString(Eval("OrderTotalPrice")))%>
            
             </td>
             <td class="list_link" style="text-align:center" nowrap valign="top">
             <%# Kesion.APPCode.OrderProcess.GetOrderStatus(true,Utils.StrToInt(Eval("orderType")),Convert.ToString(Eval("OrderID")),Utils.StrToInt(Eval("ConsumptionMode")),Utils.StrToInt(Eval("IsBusinessConfirm")),Convert.ToString(Eval("alipaytradestatus")), Convert.ToInt16(Eval("status")), Convert.ToInt16(Eval("DeliverStatus")), Utils.StrToDecimal(Convert.ToString(Eval("MoneyReceipt"))), Utils.StrToDecimal(Convert.ToString(Eval("OrderTotalPrice"))))%>
             </td>
				<td nowrap class="list_link" style="text-align:center" valign="top">
				<a href="shop/ShowMyOrder.aspx?id=<%# Eval("id") %>">��������</a>
				<%# (((float)Convert.ToDouble(Eval("MoneyReceipt")) > 0 || Convert.ToString(Eval("DeliverStatus")) == "1") && Utils.StrToInt(Eval("status"))<=1 && Utils.StrToInt(Eval("IsBusinessConfirm"))==0) ? "<br/><a href='Shop/myorder.aspx?action=returns&id=" + Eval("id") + "'>�˻��˿�</a>" : string.Empty%>
				
				<%# Convert.ToString(Eval("DeliverStatus")) == "1" ? @"<br/><a href='javascript:;' onclick=""KesionJS.Confirm('�˲��������棬��ȷ���յ���Ʒ����', 'location.href=\'shop/ShowMyOrder.aspx?id=" + Eval("id") + @"&action=signorder\';', null);"">ȷ���ջ�</a>" : ""%>
				<%# Convert.ToString(Eval("DeliverStatus")) == "2" && Convert.ToString(Eval("Status"))!= "2" ? @"<br/><a href='javascript:;' onclick=""KesionJS.Confirm('����һ�����壬�Ϳ����ٶԸö��������κβ�����ȷ��������', 'location.href=\'shop/ShowMyOrder.aspx?id=" + Eval("id") + @"&action=finishorder\';', null);"">���嶩��</a>" : ""%>
				<%# Convert.ToString(Eval("status")) == "0" && Convert.ToString(Eval("DeliverStatus")) == "0" && Utils.StrToFloat(Convert.ToString(Eval("MoneyReceipt"))) == 0 ? "<br /><a href='Shop/myorder.aspx?action=delorder&id=" + Eval("id") + @"' onClick=""return(confirm('�˲��������棬ȷ��ִ��ɾ��������'))"">����ɾ��</a>" : ""%>
				<%# Convert.ToString(Eval("PayStatus")) != "1" && Convert.ToInt16(Eval("status")) < 2  ? "<br/><a href='Shop/myorder.aspx?action=pay&id=" + Eval("id") + "'>����֧��</a>" : ""%>
                <%# !string.IsNullOrEmpty(MyCache.GetShopCommonConfig(42)) && Convert.ToString(Eval("ConsumptionMode")) == "1" && Convert.ToString(Eval("DeliverStatus")) != "0" ? "<br/><a href='Shop/ExpressLog.aspx?OrderID="+Eval("OrderID")+"'>�鿴����</a>" : string.Empty %>
				</td>

             </tr>
             
         </ItemTemplate>
          <FooterTemplate>
           <tr class="tdbg" style="display:<%# bool.Parse((RepeaterOrder.Items.Count==0).ToString())?"":"none"%>">
                <td class="splittd" style="text-align:center" colspan="7">
                  ����Ķ���̫���ˣ�����տյģ���ȥ��ѡ���ʵ���Ʒ�ɣ�
                </td>
               </tr> 
           </table>
          </FooterTemplate>
        </asp:Repeater>

                 <!--�ҵĶ��� end-->






             </div>
          </div>
         <%} %> 

          
          <div class="right_02 tabbox03">
             <div class="tit"> <span>�ҵ��ʴ�</span>
                
                <ul class="tab">
                       <li><a href="#">�����ʵ�����</a></li>
			           <li><a href="#">�Ҳ��������</a></li>
			           <li><a href="#">�������ʵĻ���</a></li>
               </ul> 
             </div>
            <div class="con right_box">

            <div>

              <asp:Repeater ID="RepeaterAsk" runat="server">
                <HeaderTemplate>
                     <table id="tablist" width="98%" border="0" align="center" cellpadding="2" cellspacing="1" class="border">
                  <tr align="center" class="title">
        	            <td width="50" align="center">���</td>
        	            <td align="center"> ����</td>
        	            <td align="center" nowrap>���ͷ�</td>
                        <td align="center">״̬</td>
                        <td align="center">����</td>
                    </tr>
                </HeaderTemplate>
                <ItemTemplate>
                  <tr class="tdbg">
                      <td class="splittd" align="center"><%# RepeaterAsk.Items.Count+1 %></td>
                      <td class="splittd"> 
                       <a href="<%# Kesion.HtmlTags.BasicField.GetAskUrl(Convert.ToInt16(Eval("TopicID"))) %>" target="_blank"><%# Utils.CutStr(Utils.RemoveHtml(Convert.ToString(Eval("Title"))), 80)%></a>
                       <div class="tips">����ʱ�䣺<%# Utils.FormatHumanizedTime(Convert.ToDateTime(Eval("AddDate")))%> �Ƿ���ˣ�<%#Convert.ToString(Eval("verify"))=="1"?"<span style='color:green'>�����</span>":"<span style='color:red'>δ���</span>" %> ���ࣺ<%# MyCache.GetCacheAskCategory(Convert.ToInt16(Eval("ClassID")),"classname") %></div>
           
                      </td>
                      <td class="splittd" style="text-align:center"><font color=red><%# Convert.ToSingle(Convert.ToString(Eval("reward"))).ToString()%>
            </font> ��</td>
                      <td class="splittd" style="text-align:center"><%#Convert.ToString(Eval("IsSolve")) == "1" ? "<span style='color:green'>�ѽ��</span>" : Convert.ToInt16(Eval("IsSolve"))==2?"�ѹر�":"<span style='color:red'>δ���</span>"%></td>
                      <td class="splittd" align="center">
                                 <%# MyCache.GetAskCacheConfig(23).Equals("0") ? "---" : (MyCache.GetAskCacheConfig(23).Equals("2") || (MyCache.GetAskCacheConfig(23).Equals("1") && Convert.ToInt16(Eval("IsSolve")) == 0) ? " <div class=\"bt\"><a onclick=\"return(confirm('ȷ��ɾ����'));\" href='main.aspx?action=deleteAskTopic&ids=" + Eval("topicid") + "'>ɾ��</a></div>" : string.Empty)%>
                       </td>
                  </tr>  
                 </ItemTemplate>
                 <FooterTemplate>
                     <tr class="tdbg" style="display:<%# bool.Parse((RepeaterAsk.Items.Count==0).ToString())?"":"none"%>">
                            <td class="splittd" style="text-align:center" colspan="10">
                             ��û��������Ŷ^_^
                            </td>
                       </tr> 
                  </table>
                 </FooterTemplate>
                </asp:Repeater>

           </div>

                <!--�Ҳ���Ļش� begin-->
              <div>
            <asp:Repeater ID="RepeaterMyAnswer" runat="server">
                <HeaderTemplate>
                     <table id="tablist" width="98%" border="0" align="center" cellpadding="2" cellspacing="1" class="border">
                  <tr align="center" class="title">
        	            <td width="50" align="center">���</td>
        	            <td align="center">����</td>
        	            <td align="center">���ͷ�</td>
                        <td align="center">״̬</td>
                        <td align="center">����</td>
                    </tr>
                </HeaderTemplate>
                <ItemTemplate>
                  <tr class="tdbg">
                      <td class="splittd" align="center"><%# RepeaterMyAnswer.Items.Count+1 %></td>
                      <td class="splittd"><a href="<%# Kesion.HtmlTags.BasicField.GetAskUrl(Convert.ToInt16(Eval("TopicID"))) %>" target="_blank"><%# Utils.CutStr(Utils.RemoveHtml(Convert.ToString(Eval("Title"))), 80)%></a>
                       <div class="tips">�ҵĻش�<%# Utils.CutStr(Utils.RemoveHtml(Convert.ToString(Eval("Content"))),80)%></div>
                       <div class="tips">����ʱ�䣺<%# Utils.FormatHumanizedTime(Convert.ToDateTime(Eval("AddDate")))%> �����ߣ�<%#Eval("userName") %> ���ࣺ<%# MyCache.GetCacheAskCategory(Convert.ToInt16(Eval("ClassID")),"classname") %></div>
           
                      </td>
                      <td class="splittd" style="text-align:center"><font color=red><%# Convert.ToSingle(Convert.ToString(Eval("reward"))).ToString()%>
            </font> ��</td>
                      <td class="splittd" style="text-align:center"><%#Convert.ToString(Eval("IsSolve")) == "1" ? "<span style='color:green'>�ѽ��</span>" : Convert.ToInt16(Eval("IsSolve"))==2?"�ѹر�":"<span style='color:red'>δ���</span>"%></td>
                      <td class="splittd" align="center">
                             <%# MyCache.GetAskCacheConfig(20).Equals("0") || MyCache.GetAskCacheConfig(20).Equals("1")  || Convert.ToString(Eval("IsSolve")) != "0" ? "---" :  " <div class=\"bt\"><a onclick=\"return(confirm('ȷ��ɾ����'));\" href='Main.aspx?action=deleteaskanswer&ids=" + Eval("postid") + "'>ɾ��</a></div>"%>
                       </td>

                  </tr>  

                 </ItemTemplate>
                 <FooterTemplate>
                     <tr class="tdbg" style="display:<%# bool.Parse((RepeaterMyAnswer.Items.Count==0).ToString())?"":"none"%>">
                            <td class="splittd" style="text-align:center" colspan="10">
                              û�лش�����⣡
                            </td>
                       </tr> 
                  </table>
                 </FooterTemplate>
                </asp:Repeater>


              </div>
                  <!--�Ҳ���Ļش� end-->

                  <!--�������ʵĻ��� begin-->
              <div>

                  <asp:Repeater ID="RepeaterAskToMe" runat="server">
    <HeaderTemplate>
         <table id="tablist" width="98%" border="0" align="center" cellpadding="2" cellspacing="1" class="border">
      <tr align="center" class="title">
        	<td width="50" align="center">���</td>
        	<td align="center"> ����</td>
        	<td align="center" nowrap>���ͷ�</td>
            <td align="center">״̬</td>
            <td align="center">�Ƿ���</td>
        </tr>
    </HeaderTemplate>
    <ItemTemplate>
      <tr class="tdbg">
          <td class="splittd" align="center"><%# RepeaterAskToMe.Items.Count+1 %></td>
          <td class="splittd"> 
           <a href="<%# Kesion.HtmlTags.BasicField.GetAskUrl(Convert.ToInt16(Eval("TopicID"))) %>" target="_blank"><%# Utils.CutStr(Utils.RemoveHtml(Convert.ToString(Eval("Title"))), 80)%></a>
           <div class="tips">�����ߣ�<%# Eval("UserName") %> ����ʱ�䣺<%# Utils.FormatHumanizedTime(Convert.ToDateTime(Eval("AddDate")))%> �Ƿ���ˣ�<%#Convert.ToString(Eval("verify"))=="1"?"<span style='color:green'>�����</span>":"<span style='color:red'>δ���</span>" %> ���ࣺ<%# MyCache.GetCacheAskCategory(Convert.ToInt16(Eval("ClassID")),"classname") %></div>
           
          </td>
          <td class="splittd" style="text-align:center"><font color=red><%# Convert.ToSingle(Convert.ToString(Eval("reward"))).ToString()%>
</font> ��</td>
          <td class="splittd" style="text-align:center"><%#Convert.ToString(Eval("IsSolve")) == "1" ? "<span style='color:green'>�ѽ��</span>" : Convert.ToInt16(Eval("IsSolve"))==2?"�ѹر�":"<span style='color:red'>δ���</span>"%></td>
          <td class="splittd" align="center">
              <%# Kesion.NET.WebSite.MyAsk.isAnswer(Convert.ToInt16(Eval("topicid")),Convert.ToString(Eval("postTable"))) %>      
           </td>
      </tr>  
     </ItemTemplate>
     <FooterTemplate>
         <tr class="tdbg" style="display:<%# bool.Parse((RepeaterAskToMe.Items.Count==0).ToString())?"":"none"%>">
                <td class="splittd" style="text-align:center" colspan="10">
                  û�����������ʣ�
                </td>
           </tr> 
      </table>
     </FooterTemplate>
    </asp:Repeater>

              </div>
                 <!--�������ʵĻ��� end-->






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
           <td colspan="2" > �� �� ͨ <a href="ApiBind.aspx" style="color:#666;font-size:12px">(�󶨹���)</a> </td>
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
                <br /><br /> <div class="tips">��ɫ��˵����û�а󶨵�������¼ƽ̨��</div>
             </td>
     </tr>
 
  </table>

<%} %>


</asp:Content>

