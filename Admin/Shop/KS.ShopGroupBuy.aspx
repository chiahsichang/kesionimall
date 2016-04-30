<%@ Page Language="C#" MasterPageFile="~/Admin/MasterPage.master" EnableEventValidation="false"  AutoEventWireup="true" Inherits="Kesion.NET.WebSite.Admin.Shop.Admin_ShopGroupBuy" Title="团购管理" Codebehind="KS.ShopGroupBuy.aspx.cs" %>
<%@ Import Namespace="Kesion.Publics"%>
<%@ Import Namespace="Kesion.APPCode"%>
<%@ Import Namespace="Kesion.Cache"%>
<asp:Content ID="Content1" ContentPlaceHolderID="KSContent" Runat="Server">
     <asp:Panel ID="TaskList" runat="server" Width="100%">
      <div id="manage_top" class="menu_top_fixed">
        <ul>
           <li id='p1'><asp:LinkButton ID="addTask" runat="server" OnClick="addTask_Click"><b></b>添加团购商品</asp:LinkButton></li>
           <li id='p5'><a href="KS.ShopGroupBuyClass.aspx"><b></b>团购分类管理</a></li>
           <li id='p4'><asp:LinkButton ID="editTask" runat="server" OnClick="editTask_Click"><b></b>编辑团购商品</asp:LinkButton></li>
           <li id='p3'><asp:LinkButton ID="delTask" runat="server" OnClick="delTask_Click"><b></b>删除团购商品</asp:LinkButton></li>
        </ul>
      </div>   
     <div class="menu_top_fixed_height"></div> 
      
<div class="tabs_header">
    <ul class="tabs">
    <li<%=KSCMS.S("flag")==""?" class='active'":string.Empty %>><a href="KS.ShopGroupBuy.aspx"><span>所有团购</span></a></li>
    <li<%=KSCMS.S("flag")=="1"?" class='active'":string.Empty %>><a href="KS.ShopGroupBuy.aspx?flag=1"><span>进行中的团购</span></a></li>
    <li<%=KSCMS.S("flag")=="2"?" class='active'":string.Empty %>><a href="KS.ShopGroupBuy.aspx?flag=2"><span>已结束的团购</span></a></li>
    <li<%=KSCMS.S("flag")=="3"?" class='active'":string.Empty %>><a href="KS.ShopGroupBuy.aspx?flag=3"><span>未审核的团购</span></a></li>
   <%if (MyCache.GetShopCommonConfig(41)=="1"){ %>
    <li<%=KSCMS.S("flag")=="4"?" class='active'":string.Empty %>><a href="KS.ShopGroupBuy.aspx?flag=4"><span>加盟商家发布的团购</span></a></li>
    <%} %>
    <li<%=KSCMS.S("flag")=="5"?" class='active'":string.Empty %>><a href="KS.ShopGroupBuy.aspx?flag=5"><span>库存少于10件的团购</span></a></li>
    </ul>
</div>
      

  <KS:KSGV ID="list" cssclass="CTable" runat="server" AutoGenerateColumns="False" Width="99%" 
             EmptyDataText="没有添加任何团购商品!" GridLines="None" OnRowDataBound="list_RowDataBound" 
             OnRowCommand="list_RowCommand" OnRowCreated="list_RowCreated" 
             AllowPaging="false"  >
          <Columns>
              <asp:TemplateField HeaderText="选择">
                <itemstyle horizontalalign="Center" width="40px" />
                <itemtemplate>
                    <input type="checkbox"  name="ids" id="ids" value='<%#Eval("id") %>' />
                </itemtemplate>
              </asp:TemplateField>
               
             <asp:TemplateField HeaderText="团购商品名称">
             <itemstyle VerticalAlign="Top" />
             <itemtemplate>
             <img width="35" height="35" onerror="this.src='<%=MyCache.GetCacheShopConfig(9) %>';" src='<%# Eval("PhotoUrl") %>' style="border:1px solid #efefef;padding:2px;margin:2px;" align="left" />
             <a href='<%# Kesion.HtmlTags.BasicField.GetGroupBuyUrl(Convert.ToInt16(Eval("id"))) %>' title='<%# Eval("subject") %>' target="_blank"><%# Utils.CutStr(Convert.ToString(Eval("subject")),60) %></a>
             <%# Convert.ToInt16(Eval("recommend"))==1?"<span style='color:green'>荐</span>":string.Empty %>
             <br />
             <span class="tips">[总销量：<%# getSellNum(1, Convert.ToInt16(Eval("id")))%> <%# string.IsNullOrEmpty(Convert.ToString(Eval("unit")))?"件":Eval("unit") %>，已付：<span style='color:green'><%# getSellNum(2,Convert.ToInt16(Eval("id"))) %></span> <%# string.IsNullOrEmpty(Convert.ToString(Eval("unit")))?"件":Eval("unit") %>，未付：<span style='color:Red'><%# getSellNum(3,Convert.ToInt16(Eval("id"))) %></span> <%# string.IsNullOrEmpty(Convert.ToString(Eval("unit")))?"件":Eval("unit") %>] </span>

             [<a href="#" onclick="parent.openWin('查看商品[<%# Utils.CutStr(Convert.ToString(Eval("subject")),60) %>]销售详情','Shop/KS.ShopGroupBuySell.aspx?proID=<%# Eval("id") %>',false);return false;"><span class="tips">销售详情</span></a>]
             <span class="tips">[库存：<%# Utils.StrToInt(Eval("Amount")) %> <%# string.IsNullOrEmpty(Convert.ToString(Eval("unit")))?"件":Eval("unit") %>]</span>
             </itemtemplate>
             </asp:TemplateField> 
              <asp:TemplateField HeaderText="录入">
             <itemstyle horizontalalign="Center" />
             <itemtemplate>
                 <%# Eval("inputer") %>
             </itemtemplate>
             </asp:TemplateField>
             <asp:TemplateField HeaderText="原价">
             <itemstyle horizontalalign="Center" />
             <itemtemplate>
             <span style='color:#999999;text-decoration:line-through;'><%=MyCache.GetCurrencySymbol %><%# Public.ReturnShopPrice(Utils.StrToDecimal(Eval("price_original")))%><%=MyCache.GetCurrencyUnit %></span>
             </itemtemplate>
             </asp:TemplateField>
             <asp:TemplateField HeaderText="团购价">
             <itemstyle horizontalalign="Center" />
             <itemtemplate>
             <span style='color:brown;font-size:14px'><%=MyCache.GetCurrencySymbol %><%# Public.ReturnShopPrice(Utils.StrToDecimal(Eval("Price")))%><%=MyCache.GetCurrencyUnit %></span>
             </itemtemplate>
             </asp:TemplateField>
             
             <asp:TemplateField HeaderText="时间限制">
             <itemstyle horizontalalign="Center"/>
             <itemtemplate>
             <span class="tips">
             <%# Convert.ToString(Eval("BeginDate")) + "<br/>至<br/>" + Convert.ToString(Eval("EndDate"))%></span>
             </itemtemplate>
             </asp:TemplateField>
             
             
             <asp:TemplateField HeaderText="状态">
             <itemstyle horizontalalign="Center" width="55"/>
             <itemtemplate>
             <%# GetGroupBuyStatus(Convert.ToInt16(Eval("endtf")), Convert.ToInt16(Eval("locked")), Convert.ToDateTime(Eval("begindate")), Convert.ToDateTime(Eval("enddate")))%>
             </itemtemplate>
             </asp:TemplateField>

          <asp:TemplateField HeaderText="编辑">
              <itemstyle width="30px" horizontalalign="Center"/>
              <itemtemplate>
                <asp:LinkButton ID="LinkButton1" ToolTip="编辑" CssClass="edit" runat="server" commandargument=<%# Eval("id") %> commandname="modify"></asp:LinkButton>
              </itemtemplate>
            </asp:TemplateField>

              <asp:TemplateField HeaderText="删除">
              <itemstyle width="30px" horizontalalign="Center"/>
              <itemtemplate>
             <asp:LinkButton runat="server" CssClass="delete" ToolTip="删除" id="delete" commandargument=<%#Eval("id") %> commandname="del"></asp:LinkButton>
              </itemtemplate>
            </asp:TemplateField>

             
            <asp:TemplateField HeaderText="↓管理操作">
                <itemstyle horizontalalign="Center" />
             <itemtemplate>
             <asp:LinkButton ID="BtnLock" runat="server" CommandArgument=<%#Eval("id") %>  CommandName="locked"></asp:LinkButton>
             <asp:LinkButton ID="BtnEnd" runat="server" CommandArgument=<%#Eval("id") %>  CommandName="endtf"></asp:LinkButton>
               </itemtemplate>
            </asp:TemplateField>
          </Columns>
            <HeaderStyle CssClass="CTitle" />
            <EmptyDataRowStyle CssClass="emptycss" />
      </KS:KSGV>
      <asp:Panel ID="Panel1" runat="server">
              <div style="height:5px;overflow:hidden;"></div>
            &nbsp;&nbsp;&nbsp;&nbsp;<input type="checkbox" name="chkall" id="chkall" onclick="CheckAll(this.form);"/><label for="chkall">全部选中</label>
           &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="button" value="删除选中的商品" onmouseover="this.className='button_on';" onmouseout="this.className='button';" class="button" onclick="if (GetIDS('del')){this.form.action='?action=del';this.form.submit()}" id="Button1" />
 <asp:Button ID="BtnRecommend" runat="server" Text="批量推荐" CssClass="button" 
                  onclick="BtnRecommend_Click" />&nbsp;
 <asp:Button ID="BtnUnRecommend" runat="server" Text="批量取消推荐" CssClass="button" 
                  onclick="BtnUnRecommend_Click" />
    </asp:Panel> 
    
    <KS:Page ID="Page1" runat="server" />
    
    <div class="message">
    
<strong>搜索团购商品：</strong><asp:DropDownList ID="DrpTJ" runat="server">
     <asp:ListItem Value="1" Selected="True">商品名称</asp:ListItem>
     <asp:ListItem Value="2">商家名称（会员名称)</asp:ListItem>
    </asp:DropDownList> <asp:TextBox runat="server" ID="TxtKeyWord" CssClass="textbox" /> 

    <asp:Button ID="BtnSearch" runat="server" CssClass="button" Text="开始搜索" 
            onclick="BtnSearch_Click"  />
        </div>
        
    </asp:Panel>
    
    <asp:Panel ID="TaskManage" runat="server" Width="100%" Visible="false">
    
        <KS:TopNav ID="TopNav1" runat="server" />
        <table width="99%" align="center" border="0" cellpadding="1" cellspacing="1" class="CTable"> 
          <tr>
            <td class="lefttd" height="30" align="right" style="width: 109px"><strong>团购商品名称：</strong></td>
            <td class="righttd" style="width: 487px">
                &nbsp;<asp:TextBox  CssClass="textbox" Width="300px" ID="TxtTitle" runat="server"></asp:TextBox> 
                &nbsp;商品单位：<asp:TextBox ID="TxtUnit" runat="server" style="text-align:center" Width="30px" CssClass="textbox"></asp:TextBox><=
                <asp:DropDownList ID="DrpSelectUnit" runat="server" AutoPostBack="false"></asp:DropDownList><br />
                <span class="tips">今日原价3288<%=MyCache.GetCurrencyUnit%>的婚纱照1239<%=MyCache.GetCurrencyUnit%>限量火爆团购。</span>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TxtTitle"
                    ErrorMessage="请输入团购商品名称!"></asp:RequiredFieldValidator>
            </td>
              <td class="righttd" rowspan="8" align="center" style="width:130px">
               <asp:Image ID="ImgPic" runat="server" Width="100" ImageUrl="../../sysimg/nopic.gif" />
                </td>
          </tr>
          
          <tr>
                <td align="right" class="lefttd" height="30" style="width: 109px"><strong>团购商品分类：</strong></td>
                <td class="righttd" style="width: 487px">
                 &nbsp;<asp:DropDownList ID="DrpBigClassID" runat="server">
                 </asp:DropDownList>   
                <select name="ClassID" id="ClassID">
                 <option value="0">--选择小类--</option>
                </select>   
                </td>
            </tr>
            <tr>
                 <td align="right" class="lefttd" style="width: 109px; height: 30px">
                     <strong>封面大图片：</strong></td>
                 <td class="righttd" style="height: 30px; width: 487px;">
                     <table cellspacing="0" cellpadding="0">
                         <tr><td>&nbsp;<asp:TextBox CssClass="textbox" ID="TxtBigPhoto" runat="server" width="250px"></asp:TextBox>&nbsp;<input type="button" class="button" onclick="SelectFiles('<%=this.TxtBigPhoto.ClientID %>',4,'<%=this.ImgPic.ClientID %>');" value="选择图片"></td>
                            <td style="padding-left:4px;padding-top:12px;"> <%=Kesion.APPCode.UploadAPI.EchoUpload("classpic",this.TxtBigPhoto.ClientID) %></td>
                    </tr></table>

                 </td>
             </tr>
            <tr>
                 <td align="right" class="lefttd" style="width: 109px; height: 30px">
                     <strong>封面小图片：</strong></td>
                 <td class="righttd" style="height: 30px; width: 487px;">
                     <table cellspacing="0" cellpadding="0">
                         <tr><td>&nbsp;<asp:TextBox CssClass="textbox" ID="TxtPhotoUrl" runat="server" width="250px"></asp:TextBox>&nbsp;<input type="button" class="button" onclick="SelectFiles('<%=this.TxtPhotoUrl.ClientID %>',4,'<%=this.TxtPhotoUrl.ClientID %>');" value="选择图片"></td>
                            <td style="padding-left:4px;padding-top:12px;"> <%=Kesion.APPCode.UploadAPI.EchoUpload("classpic",this.TxtPhotoUrl.ClientID) %></td>
                    </tr></table>
                 </td>
             </tr>
            <tr>
                <td align="right" class="lefttd" height="30" style="width: 109px">
                 <strong>团购时间限制：</strong>
                </td>
                <td class="righttd" style="width: 487px">
                 <script>                     isHour = 1;</script>
                 &nbsp;<asp:TextBox  CssClass="textbox" ID="TxtBeginTime" onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'});" runat="server"></asp:TextBox> 至 <asp:TextBox CssClass="textbox" onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'});" ID="TxtEndTime" runat="server"></asp:TextBox>
                </td>
            </tr>
             <tr>
                 <td align="right" class="lefttd" style="width: 109px; height: 30px">
                   <strong>地区设置：</strong></td>
                 <td class="righttd" style="height: 30px">
                  <asp:DropDownList ID="DrpProvinceID" runat="server">
                  
                  </asp:DropDownList>
                  <select name="CityID" id="CityID">
                   <option value="0">--选择城市--</option>
                  </select>
                  百度地图坐标：<asp:TextBox ID="TxtMapMarker" runat="server" CssClass="textbox" Width="150px" />
                     &nbsp;</td>
             </tr>
            <tr>
                <td align="right" class="lefttd" height="30" style="width: 109px">
                 <strong>消费方式：</strong>
                </td>
                <td class="righttd">
                    <asp:RadioButtonList ID="RdbShowDelivery" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow">
                        <asp:ListItem Value="1">需要送货</asp:ListItem>
                        <asp:ListItem Value="0" Selected="True">凭验证码消费</asp:ListItem>
                    </asp:RadioButtonList>
                </td>
            </tr>

           <tr>
                             <td align="right" class="lefttd" style="width: 109px; height: 30px">
                                 <strong>属性设置：</strong></td>
                             <td class="righttd" style="height: 30px">
                                 <asp:CheckBox ID="CkbRecommend" runat="server" Text="推荐" />
                                 <asp:CheckBox ID="CkbLocked" runat="server" Text="未审核" />
                                 <asp:CheckBox ID="CkbEndTF" runat="server" Text="已结束" />
                                 <asp:CheckBox ID="CkbCleanCart" runat="server" Checked="" Text="清空购物车" Visible="false" />
                                 <asp:CheckBox ID="CkbShowPayMent" runat="server" Checked="" Text="显示支付方式" />
                             </td>
            </tr>
                         <tr>
                 <td align="right" class="lefttd" style="width: 109px; height: 30px">
                     <strong>价格设置：</strong></td>
                 <td class="righttd" style="height: 30px" colspan="2">
                 原价：<asp:TextBox onKeyPress= "return regInput(this,/^\d*\.?\d{0,2}$/,String.fromCharCode(event.keyCode))" onpaste="return regInput(this,/^\d*\.?\d{0,2}$/,window.clipboardData.getData('Text'))" ondrop="return regInput(this,    /^\d*\.?\d{0,2}$/,event.dataTransfer.getData('Text'))" CssClass="textbox" ID="TxtPrice_Original" runat="server" width="50px" style="text-align:center"></asp:TextBox><%=MyCache.GetCurrencyUnit%>
                 折扣：<asp:TextBox onKeyPress= "return regInput(this,/^\d*\.?\d{0,2}$/,String.fromCharCode(event.keyCode))" onpaste="return regInput(this,/^\d*\.?\d{0,2}$/,window.clipboardData.getData('Text'))" ondrop="return regInput(this,    /^\d*\.?\d{0,2}$/,event.dataTransfer.getData('Text'))" onChange="getprice(this.value);"  CssClass="textbox" ID="TxtDiscount" runat="server" width="50px" style="text-align:center"></asp:TextBox>折
                 团购价：<asp:TextBox onKeyPress= "return regInput(this,/^\d*\.?\d{0,2}$/,String.fromCharCode(event.keyCode))" onpaste="return regInput(this,/^\d*\.?\d{0,2}$/,window.clipboardData.getData('Text'))" ondrop="return regInput(this,    /^\d*\.?\d{0,2}$/,event.dataTransfer.getData('Text'))" CssClass="textbox" ID="TxtPrice" runat="server" width="50px" style="text-align:center"></asp:TextBox><%=MyCache.GetCurrencyUnit%>
                 重量：<asp:TextBox CssClass="textbox" onKeyPress= "return regInput(this,/^\d*\.?\d{0,2}$/,String.fromCharCode(event.keyCode))" onpaste="return regInput(this,/^\d*\.?\d{0,2}$/,window.clipboardData.getData('Text'))" ondrop="return regInput(this,    /^\d*\.?\d{0,2}$/,event.dataTransfer.getData('Text'))" ID="TxtWeight" runat="server" width="50px" Text="0" style="text-align:center"></asp:TextBox>KG
                 <span class="tips">计算运费用的,包邮请输入0。</span>
                 
                  </td>
             </tr>
             <tr>
                 <td align="right" class="lefttd" style="width: 109px; height: 30px">
                     <strong>购买设置：</strong></td>
                 <td class="righttd" style="height: 30px" colspan="2">
                 最低人数：<asp:TextBox Text="0" CssClass="textbox" ID="TxtMinNum" runat="server" width="50px" style="text-align:center"></asp:TextBox>人
                 每人限制购买：<asp:TextBox Text="1" CssClass="textbox" ID="TxtLimitBuyNum" runat="server" width="50px" style="text-align:center"></asp:TextBox>件
                 <span class="tips">不限制请输入0。</span>
                 初始已销售：<asp:TextBox CssClass="textbox" Text="0" ID="TxtHasSellNum" runat="server" width="50px" style="text-align:center"></asp:TextBox>件
                 <span class="tips">作弊用的。</span>
                 库存：<asp:TextBox CssClass="textbox" Text="1000" ID="TxtAmount" runat="server" Width="50px" style="text-align:center"></asp:TextBox>件
                 库存报警：<asp:TextBox CssClass="textbox" Text="0" ID="TxtAmountNum" runat="server" Width="50px" style="text-align:center"></asp:TextBox>件 <span class="tips">为“0”不报警。</span>
                  </td>
             </tr>
             <tr>
              <td class="lefttd" align="right"><strong>收款账号：</strong></td>
              <td class="righttd">
                  <asp:DropDownList ID="DrpPayID" runat="server">
                  </asp:DropDownList>
         </td>
      </tr>
            <tr>
                <td align="right" class="lefttd" height="30" style="width: 109px">
                 <strong>本单详情：</strong>
                </td>
                <td class="righttd" colspan="2">
                    <asp:TextBox  ID="TxtIntro" TextMode="multiLine" style="width:90%;height:200px" runat="server"></asp:TextBox>
                    <% Kesion.APPCode.EditorAPI.EchoEditor("editor", this.TxtIntro.ClientID, "Basic");%>
                </td>
            </tr>
            <tr>
                <td align="right" class="lefttd" height="30" style="width: 109px">
                 <strong>精彩卖点：</strong>
                </td>
                <td class="righttd" colspan="2">
                    <asp:TextBox  ID="TxtHighlights" TextMode="multiLine" style="width:90%;height:120px" runat="server"></asp:TextBox>
                    <% Kesion.APPCode.EditorAPI.EchoEditor("editor1", this.TxtHighlights.ClientID, "Basic",0,false,true,false,false);%>
                   
                 <div class="tips">Tips：简要介绍商品的卖点,可以留空。</div>
                </td>
            </tr>
            <tr>
                <td align="right" class="lefttd" height="30" style="width: 109px">
                 <strong>团购保障：</strong>
                </td>
                <td class="righttd" colspan="2">
                    <asp:TextBox ID="TxtProtection" TextMode="multiLine" style="width:90%;height:120px" runat="server"></asp:TextBox>
              <% Kesion.APPCode.EditorAPI.EchoEditor("editor2", this.TxtProtection.ClientID, "Basic",0,false,true,false,false);%>

                </td>
            </tr>
            <tr>
                <td align="right" class="lefttd" height="30" style="width: 109px">
                 <strong>温馨提示：</strong>
                </td>
                <td class="righttd" colspan="2">
                    <asp:TextBox  ID="TxtNotes" TextMode="multiLine" style="width:90%;height:120px" runat="server"></asp:TextBox>
              <% Kesion.APPCode.EditorAPI.EchoEditor("editor3", this.TxtNotes.ClientID, "Basic",0,false,true,false,false);%>

                </td>
            </tr>
             

             


             <tr>
                 <td align="right" class="lefttd" style="height: 30px; width: 109px;">
                     <strong>允许参加团购的权限：</strong></td>
                 <td class="righttd" style="height: 30px" colspan="2">
                 
                  <asp:RadioButtonList ID="RdbAllowBMFlag" runat="server">
                   <asp:ListItem Value="0" Selected>允许所有人报名参加,包括游客</asp:ListItem>
                   <asp:ListItem Value="1">只允许会员报名参加</asp:ListItem>
                   <asp:ListItem Value="2">只允许指定的会员组报名参加 </asp:ListItem>
                  </asp:RadioButtonList>
                 </td>
             </tr>
             <tbody id="groups">
             <tr>
                 <td align="right" class="lefttd" style="height: 30px; width: 109px;">
                     <strong>允许参加团购的会员组：</strong></td>
                 <td class="righttd" style="height: 30px" colspan="2">
                  <div ID="GroupPanel" runat="server"></div>
                 </td>
             </tr>
             
             </tbody>
             
             
             <tr>
                 <td align="right" class="lefttd" style=" height: 30px; width: 109px;">
                   <strong>购买链接：</strong></td>
                 <td class="righttd" style="height: 30px" colspan="2">
                 &nbsp;<asp:TextBox ID="TxtChangesUrl" runat="server" CssClass="textbox" Width="380" />
                 <br />
                 <span class="tips">如果这里输入购买链接，则用户购买时将跳转到其它地方购买（如淘宝或是到商城中心去购买）。</span>
                 </td>
             </tr>

          
            <tr>
                <td align="right" class="lefttd" style=" height: 30px; width: 109px;">
                    <strong>绑定模板：</strong></td>
                <td class="righttd" colspan="2" style="height: 30px">
                    &nbsp;<asp:TextBox ID="TxtTemplateFile" runat="server" CssClass="textbox" 
                        Text="{$TemplateDir}/商城系统/团购内容页.html" width="250px"></asp:TextBox>
                    &nbsp;<input class="button" 
                        onclick="SelectTemplate('<%=this.TxtTemplateFile.ClientID %>');" type="button" 
                        value="选择模板"> <span class="tips">可以留空直接读商城配置里的通用模板。</span> </input></td>
            </tr>
            <tr>
                <td align="right" class="lefttd" style=" height: 30px; width: 109px;">
                    <strong>录入员：</strong></td>
                <td class="righttd" colspan="2" style="height: 30px">
                    &nbsp;<asp:TextBox ID="TxtInputer" runat="server" CssClass="textbox" 
                        Text="" width="250px"></asp:TextBox>
                   <span class="tips">绑定发布的用户名。</span> </input></td>
            </tr>

          
        </table>
        <script>
             var classId=<%=smallClassID %>;
             var cityId=<%=cityId %>;
             function getClass() {
                                var parentId = jQuery("#<%=this.DrpBigClassID.ClientID %> option:selected").val();
                                jQuery('#ajaxmsg', window.parent.document).toggle();
                                jQuery.ajax({
                                    type: "POST",
                                    url: "../../plus/Ajaxs.ashx",
                                    data: "classid="+classId+"&parentid=" + parentId + "&a=groupbuyclassoption",
                                    success: function(data) {
                                        jQuery('#ajaxmsg', window.parent.document).toggle();
                                        jQuery("#ClassID").empty().append('<option value="0">--选择小类--</option>').append(data);
                                    }
                                });
             }
             function getCity(){
                                var provinceId = jQuery("#<%=this.DrpProvinceID.ClientID %> option:selected").val();
                                jQuery('#ajaxmsg', window.parent.document).toggle();
                                jQuery.ajax({
                                    type: "POST",
                                    url: "../../plus/Ajaxs.ashx",
                                    data: "cityId="+cityId+"&provinceId=" + provinceId + "&a=groupbuycityoption",
                                    success: function(data) {
                                        jQuery('#ajaxmsg', window.parent.document).toggle();
                                        jQuery("#CityID").empty().append('<option value="0">--选择城市--</option>').append(data);
                                    }
                                });
              }

            jQuery(document).ready(function() {
                ShowGroup();
                getClass();
                getCity();
            });
            function regInput(obj, reg, inputStr) {
                var docSel = document.selection.createRange()
                if (docSel.parentElement().tagName != "INPUT") return false
                oSel = docSel.duplicate()
                oSel.text = ""
                var srcRange = obj.createTextRange()
                oSel.setEndPoint("StartToStart", srcRange)
                var str = oSel.text + inputStr + srcRange.text.substr(oSel.text.length)
                return reg.test(str)
            }
            function getprice(discount) {
                if (parseFloat(discount) > 10) {
                    alert('折扣不能大于10！');
                    jQuery("#<%=this.TxtDiscount.ClientID %>").val(10);
                    return false;
                }
                var Price_Original = jQuery("#<%=this.TxtPrice_Original.ClientID %>").val();
                if (Price_Original == '' || isNaN(Price_Original)) { Price_Original = 0; }
                jQuery("#<%=this.TxtPrice.ClientID %>").val(Math.round(Price_Original * (discount / 10)));
   
            }
            function ShowGroup() {
                var checkrad = jQuery("#<%=this.RdbAllowBMFlag.ClientID %> :radio[checked]").val();
                if (checkrad == 2) {
                    jQuery("#groups").show();
                } else {
                jQuery("#groups").hide();
                }
            }
            function getUnit(v) {
                jQuery("#<%=this.TxtUnit.ClientID %>").val(v);
            }
            function CheckForm() {
                if (jQuery("#<%=this.TxtTitle.ClientID %>").val() == '') {
                    KesionJS.Alert("请输入团购商品名称！", 'jQuery("#<%=this.TxtTitle.ClientID %>").focus()');
                    return false;
                }
                if (jQuery("#ClassID option:selected").val() == '0') {
                    KesionJS.Alert("请选择团购分类！", 'jQuery("#ClassID").focus()');
                    return false;
                }
                if (jQuery("#<%=this.TxtBigPhoto.ClientID %>").val() == '') {
                    KesionJS.Alert("请上传团购封面大图！", 'jQuery("#<%=this.TxtBigPhoto.ClientID %>").focus()');
                    return false;
                }
                if (jQuery("#<%=this.TxtPhotoUrl.ClientID %>").val() == '') {
                    KesionJS.Alert("请上传团购封面小图！", 'jQuery("#<%=this.TxtPhotoUrl.ClientID %>").focus()');
                    return false;
                }
                if (jQuery("#<%=this.TxtPrice_Original.ClientID %>").val() == '') {
                    KesionJS.Alert("请输入商品原价！", 'jQuery("#<%=this.TxtPrice_Original.ClientID %>").focus()');
                    return false;
                }
                if (jQuery("#<%=this.TxtDiscount.ClientID %>").val() == '') {
                    KesionJS.Alert("请输入商品折扣！", 'jQuery("#<%=this.TxtDiscount.ClientID %>").focus()');
                    return false;
                }
                if (parseFloat(jQuery("#<%=this.TxtDiscount.ClientID %>").val()) > 10) {
                    KesionJS.Alert("折扣不能大于10！", 'jQuery("#<%=this.TxtDiscount.ClientID %>").focus()');
                    return false;
                }
                if (jQuery("#<%=this.TxtPrice.ClientID %>").val() == '') {
                    KesionJS.Alert("请输入团购价！", 'jQuery("#<%=this.TxtPrice.ClientID %>").focus()');
                    return false;
                }
                return true;
            }
        </script>
      <br />
      <KS:Foot ID="Foot1" runat="server" OnSubmit="Foot1_Submit" />
    </asp:Panel>
    
</asp:Content>

