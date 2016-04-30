<%@ Page Title="" Language="C#" MasterPageFile="~/User/User.master"  Inherits="Kesion.NET.WebSite.MyGroupBuy" Codebehind="MyGroupBuy.aspx.cs" %>
<%@ Import Namespace="Kesion.Cache"%>
<%@ Import Namespace="Kesion.Publics"%>
<%@ Import Namespace="Kesion.APPCode"%>
<%@ Import Namespace="Kesion.BLL" %>

<asp:Content ID="Content1" ContentPlaceHolderID="KSContent" runat="server">

<asp:Panel ID="Panel1" runat="server" Width="100%">

<div class="tabs">	
			<ul>
				<li<%if (string.IsNullOrEmpty(KSCMS.S("show"))) Response.Write (" class='puton'"); %>>
                <a href="MyGroupBuy.aspx">所有团购商品(<%=DataFactory.GetOnlyValue("select count(1) From KS_ProGroupBuy Where inputer='"+(new TemporaryVar()).UserName+"'")  %>)</a></li>
				<li<%if (KSCMS.S("show")=="1") Response.Write (" class='puton'"); %>>
                <a href="MyGroupBuy.aspx?show=1">进行中的团购商品(<%=DataFactory.GetOnlyValue("select count(1) From KS_ProGroupBuy Where locked=0 and endtf=0 and datediff(s,EndDate,getdate())<0 and inputer='" + (new TemporaryVar()).UserName + "'")%>)</a></li>
				<li<%if (KSCMS.S("show")=="2") Response.Write (" class='puton'"); %>>
                <a href="MyGroupBuy.aspx?show=2">已结束的团购商品(<%=DataFactory.GetOnlyValue("select count(1) From KS_ProGroupBuy Where (endtf=1 or datediff(s,EndDate,getdate())>0) and inputer='" + (new TemporaryVar()).UserName + "'")%>)</a></li>
                <li<%if (KSCMS.S("show")=="3") Response.Write (" class='puton'"); %>>
                <a href="MyGroupBuy.aspx?show=3">未审核的团购商品(<%=DataFactory.GetOnlyValue("select count(1) From KS_ProGroupBuy Where locked=1 and inputer='" + (new TemporaryVar()).UserName + "'")%>)</a></li>
			</ul>
</div>
<br />

<asp:Repeater ID="Repeater1" runat="server">
    <HeaderTemplate>
      <table id="tablist" width="98%" border="0" align="center" cellpadding="2" cellspacing="1" class="border">
      <tr class="title">
        	<td width="20" align="center">&nbsp;</td>
        	<td align="center">团购商品名称</td>
            <td align="center"> 原价</td>
            <td align="center"> 团购价 </td>
            <td align="center">状态</td>
	        <td align="center">操作</td>
        </tr>
    </HeaderTemplate>
    <ItemTemplate>
       <tr class="tdbg">
          <td class="splittd" align="center">
          <input type="checkbox"  name="ids" id="ids" value='<%#Eval("id") %>' />
         </td>
          <td class="splittd">
              <img width="35" height="45" onerror="this.src='<%=Kesion.Cache.MyCache.GetCacheShopConfig(9) %>';" src='<%# Eval("PhotoUrl") %>' style="border:1px solid #efefef;padding:2px;margin:2px;" align="left" />
             <a href='<%# Kesion.HtmlTags.BasicField.GetGroupBuyUrl(Convert.ToInt16(Eval("id"))) %>' title='<%# Eval("subject") %>' target="_blank"><%# Utils.CutStr(Convert.ToString(Eval("subject")),60) %></a>
             <%# Convert.ToInt16(Eval("recommend"))==1?"<span style='color:green'>荐</span>":string.Empty %>
             <br />
             <span class="tips">[总销量：<%# getSellNum(1,Convert.ToInt16(Eval("id"))) %><%# string.IsNullOrEmpty(Convert.ToString(Eval("unit")))?"件":Eval("unit") %>，已付：<span style='color:green'><%# getSellNum(2,Convert.ToInt16(Eval("id"))) %></span><%# string.IsNullOrEmpty(Convert.ToString(Eval("unit")))?"件":Eval("unit") %>，未付：<span style='color:Red'><%# getSellNum(3,Convert.ToInt16(Eval("id"))) %></span><%# string.IsNullOrEmpty(Convert.ToString(Eval("unit")))?"件":Eval("unit") %>] </span>

             <span class="tips">[库存：<%# Utils.StrToInt(Eval("Amount")) %> <%# string.IsNullOrEmpty(Convert.ToString(Eval("unit")))?"件":Eval("unit") %>]</span>
            
         </td>
          <td class="splittd" align="center">
             <span style='color:#999999;text-decoration:line-through;'><%=MyCache.GetCurrencySymbol%><%# Public.ReturnShopPrice(Utils.StrToDecimal(Eval("price_original")))%><%=MyCache.GetCurrencyUnit%></span>
         </td>
          <td class="splittd" align="center">
             <span style='color:brown;font-size:14px'><%=MyCache.GetCurrencySymbol%><%# Public.ReturnShopPrice(Utils.StrToDecimal(Eval("Price")))%><%=MyCache.GetCurrencyUnit%></span>
         </td>
         <td class="splittd" align="center">
            <%# GetGroupBuyStatus(Convert.ToInt16(Eval("endtf")), Convert.ToInt16(Eval("locked")), Convert.ToDateTime(Eval("begindate")), Convert.ToDateTime(Eval("enddate")))%>
         </td>
        <td class="splittd" align="center">
             <a href="MyGroupBuy.aspx?action=modify&id=<%# Eval("id") %>">修改</a>
             <a href="MyGroupBuy.aspx?action=del&id=<%# Eval("id") %>" onclick="return(confirm('确定删除吗？'))">删除</a>
          </td>

      </tr>      
    </ItemTemplate>
     <FooterTemplate>
     <tr class="tdbg" style="display:<%# bool.Parse((Repeater1.Items.Count==0).ToString())?"":"none"%>">
                <td class="splittd" style="text-align:center" colspan="10">
                  找不到任何团购商品！
                </td>
           </tr> 
    </table>
     </FooterTemplate>
    </asp:Repeater>

       &nbsp;&nbsp;&nbsp;<input type="checkbox" name="chkall" id="chkall" onclick="CheckAll(this.form);"/>全选  &nbsp;&nbsp; 
    <asp:Button ID="ButtonDel" class="button" runat="server" Text=" 删除 " 
        onclick="ButtonDel_Click" />

     <KS:Page ID="Page1" runat="server" />


</asp:Panel>



<asp:Panel ID="Panel2" runat="server" Width="100%" Visible="false">

<script src="../../KS_Inc/DatePicker/WdatePicker.js"></script>
<% Kesion.APPCode.EditorAPI.EchoHead();%>

<table class="border" cellspacing="2" cellpadding="1" width="98%" align=center border=0>
   <tr class="title">
         <td colspan="2"> <%=KSCMS.S("action").Equals("modify") ? "修 改 " : "发 布 "%>团 购</td>
        </tr>
       
          <tr class="tdbg">
            <td class="lefttd" height="30" align="right"><strong>商品名称：</strong></td>
            <td>
                &nbsp;<asp:TextBox  CssClass="textbox" Width="300px" ID="TxtTitle" runat="server"></asp:TextBox> 
                &nbsp;商品单位：<asp:TextBox ID="TxtUnit" runat="server" style="text-align:center" Width="30px" CssClass="textbox"></asp:TextBox><=
                <asp:DropDownList ID="DrpSelectUnit" runat="server" AutoPostBack="false"></asp:DropDownList><br />
               <span class="tips">如: 今日原价3288<%=MyCache.GetCurrencyUnit%>的婚纱照1239<%=MyCache.GetCurrencyUnit%>限量火爆团购。</span> 
            </td>
          </tr>
        
          <tr class="tdbg">
                <td align="right" class="lefttd" height="30"><strong>商品分类：</strong></td>
                <td>
                 &nbsp;<asp:DropDownList ID="DrpBigClassID" runat="server">
                 </asp:DropDownList>   
                <select name="ClassID" id="ClassID">
                 <option value="0">--选择小类--</option>
                </select>   
                </td>
            </tr>
            <tr class="tdbg">
                 <td align="right" class="lefttd">
                     <strong>封面大图片：</strong></td>
                 <td class="righttd" style="height: 30px; width: 487px;">
                 &nbsp;<asp:TextBox CssClass="textbox" ID="TxtBigPhoto" runat="server" width="250px"></asp:TextBox>
          &nbsp;<input type="button" class="button" onclick="OpenThenSetValue('../Include/SelectFile.aspx?ChannelID=4',550,290,window,jQuery('#<%=this.TxtBigPhoto.ClientID %>')[0]);"  value="选择图片" />

          <iframe src="../include/UpLoad.aspx?IsPic=1&FieldID=<%=this.TxtBigPhoto.ClientID %>&ChannelID=4" marginheight="0" marginwidth="0"  width="100%" height="30" frameborder="0" scrolling="no"></iframe>

                 </td>
             </tr>
            <tr class="tdbg">
                 <td align="right" class="lefttd">
                     <strong>封面小图片：</strong></td>
                 <td class="righttd">
                 &nbsp;<asp:TextBox CssClass="textbox" ID="TxtPhotoUrl" runat="server" width="250px"></asp:TextBox>
          &nbsp;<input type="button" class="button" onclick="OpenThenSetValue('../Include/SelectFile.aspx?ChannelID=4',550,290,window,jQuery('#<%=this.TxtPhotoUrl.ClientID %>')[0]);" value="选择图片" />
                    <iframe src="../include/UpLoad.aspx?IsPic=1&FieldID=<%=this.TxtPhotoUrl.ClientID %>&ChannelID=4" marginheight="0" marginwidth="0"  width="100%" height="30" frameborder="0" scrolling="no"></iframe>

                 </td>
             </tr>
            <tr class="tdbg">
                <td align="right" class="lefttd" height="30">
                 <strong>团购时间限制：</strong>
                </td>
                <td>
                 <script>   isHour = 1;</script>
                 &nbsp;<asp:TextBox  CssClass="textbox" ID="TxtBeginTime" onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'});" runat="server"></asp:TextBox> 至 <asp:TextBox CssClass="textbox" onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'});" ID="TxtEndTime" runat="server"></asp:TextBox>
                </td>
            </tr>
           <tr class="tdbg">
                 <td align="right" class="lefttd">
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
                <td align="right" class="lefttd" height="30">
                 <strong>消费方式：</strong>
                </td>
                <td class="righttd">
                    <asp:RadioButtonList ID="RdbShowDelivery" onclick="showYf();" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow">
                        <asp:ListItem Value="1">实物（需要送货）</asp:ListItem>
                        <asp:ListItem Value="0" Selected="True">凭验证码消费</asp:ListItem>
                    </asp:RadioButtonList>
                    <div id="yf" style="display:none;border:1px solid #999999;background-color:#f1f1f1;padding:2px;">
                        <input type="radio" value="0" name="FreightType"<%if (FreightType == 0) Response.Write(" checked"); %>/>
                        包邮
                        <br />
                        <input type="radio" value="1" name="FreightType" <%if (FreightType == 1) Response.Write(" checked"); %>/>
                        运费 <asp:TextBox ID="TxtFreight" runat="server" Text="12" CssClass="textbox" Width="60px" style="text-align:center" /><%=MyCache.GetCurrencyUnit%>
                        <!--
                         <br /><input type="radio" value="2" name="FreightType" <%if (FreightType == 2) Response.Write(" checked"); %>/>按重量计算，重量：<asp:TextBox CssClass="textbox" onKeyPress= "return regInput(this,/^\d*\.?\d{0,2}$/,String.fromCharCode(event.keyCode))" onpaste="return regInput(this,/^\d*\.?\d{0,2}$/,window.clipboardData.getData('Text'))" ondrop="return regInput(this,    /^\d*\.?\d{0,2}$/,event.dataTransfer.getData('Text'))" ID="TxtWeight" runat="server" width="50px" Text="0" style="text-align:center"></asp:TextBox>KG
                       -->
                 

                    </div>
                </td>
            </tr>
             <tr class="tdbg">
                             <td align="right" class="lefttd">
                                 <strong>属性设置：</strong></td>
                             <td class="righttd">
                                 <asp:CheckBox ID="CkbEndTF" runat="server" Text="已结束" />
                                 <asp:CheckBox ID="CkbShowPayMent" runat="server" Checked="" Text="显示支付方式" />
                             </td>
            </tr>
           <tr class="tdbg">
                 <td align="right" class="lefttd">
                     <strong>价格设置：</strong></td>
                 <td class="righttd" style="height: 30px">
                 原价：<asp:TextBox Text="100" onKeyPress= "return regInput(this,/^\d*\.?\d{0,2}$/,String.fromCharCode(event.keyCode))" onpaste="return regInput(this,/^\d*\.?\d{0,2}$/,window.clipboardData.getData('Text'))" ondrop="return regInput(this,    /^\d*\.?\d{0,2}$/,event.dataTransfer.getData('Text'))" CssClass="textbox" ID="TxtPrice_Original" runat="server" width="40px" style="text-align:center"></asp:TextBox><%=MyCache.GetCurrencyUnit%>
                 折扣：<asp:TextBox Text="1" onKeyPress= "return regInput(this,/^\d*\.?\d{0,2}$/,String.fromCharCode(event.keyCode))" onpaste="return regInput(this,/^\d*\.?\d{0,2}$/,window.clipboardData.getData('Text'))" ondrop="return regInput(this,    /^\d*\.?\d{0,2}$/,event.dataTransfer.getData('Text'))" onChange="getprice(this.value);"  CssClass="textbox" ID="TxtDiscount" runat="server" width="30px" style="text-align:center"></asp:TextBox>折
                 团购价：<asp:TextBox Text="10" onKeyPress= "return regInput(this,/^\d*\.?\d{0,2}$/,String.fromCharCode(event.keyCode))" onpaste="return regInput(this,/^\d*\.?\d{0,2}$/,window.clipboardData.getData('Text'))" ondrop="return regInput(this,    /^\d*\.?\d{0,2}$/,event.dataTransfer.getData('Text'))" CssClass="textbox" ID="TxtPrice" runat="server" width="40px" style="text-align:center"></asp:TextBox><%=MyCache.GetCurrencyUnit%>
                 库存：<asp:TextBox CssClass="textbox" Text="1000" ID="TxtAmount" runat="server" Width="30px" style="text-align:center"></asp:TextBox>件
                 库存报警：<asp:TextBox CssClass="textbox" Text="0" ID="TxtAmountNum" runat="server" Width="30px" style="text-align:center"></asp:TextBox>件 <span class="tips">为“0”不报警。</span>
                  </td>
             </tr>
             <tr class="tdbg">
                 <td align="right" class="lefttd">
                     <strong>购买设置：</strong></td>
                 <td class="righttd">
                 最低人数：<asp:TextBox Text="0" CssClass="textbox" ID="TxtMinNum" runat="server" width="50px" style="text-align:center"></asp:TextBox>人
                 每人限制购买：<asp:TextBox Text="1" CssClass="textbox" ID="TxtLimitBuyNum" runat="server" width="50px" style="text-align:center"></asp:TextBox>件
                 <span class="tips">不限制请输入0。</span>
                 初始已销售：<asp:TextBox CssClass="textbox" Text="0" ID="TxtHasSellNum" runat="server" width="50px" style="text-align:center"></asp:TextBox>件
                 <span class="tips">作弊用的。</span>
                  </td>
             </tr>
           
            <tr class="tdbg">
                <td align="right" class="lefttd" >
                 <strong>本单详情：</strong>
                </td>
                <td class="righttd">
                    <asp:TextBox TextMode="MultiLine" ID="TxtIntro" style="width:600px;height:200px" runat="server"></asp:TextBox>
                    <%
                        Kesion.APPCode.EditorAPI.EchoEditor("editor", TxtIntro.ClientID, "Basic", 0, false, true, true,false);    
                    %>
                
                </td>
           </tr>

            <tr class="tdbg">
                <td align="right" class="lefttd">
                 <strong>精彩卖点：</strong>
                </td>
                <td class="righttd">
                    <asp:TextBox  ID="TxtHighlights" TextMode="multiLine"  style="width:600px;height:120px;" runat="server"></asp:TextBox>
                    <%
                       Kesion.APPCode.EditorAPI.EchoEditor("Highlights", TxtHighlights.ClientID, "Basic", 0, false, true,true,false);    
                    %>

                 <div class="tips">Tips：简要介绍商品的卖点,可以留空。</div>
                </td>
            </tr>
            <tr class="tdbg">
                <td align="right" class="lefttd">
                 <strong>团购保障：</strong>
                </td>
                <td class="righttd">
                    <asp:TextBox  ID="TxtProtection" TextMode="multiLine" style="width:600px;height:120px;" runat="server"></asp:TextBox>
                     <%
                         Kesion.APPCode.EditorAPI.EchoEditor("Protection", TxtProtection.ClientID, "Basic", 0, false, true, true,false);    
                    %>
                </td>
            </tr>
            <tr class="tdbg">
                <td align="right" class="lefttd">
                 <strong>温馨提示：</strong>
                </td>
                <td class="righttd">
                 <asp:TextBox  ID="TxtNotes"  TextMode="multiLine" style="width:600px;height:120px;" runat="server"></asp:TextBox>
                     <%
                         Kesion.APPCode.EditorAPI.EchoEditor("Notes", TxtNotes.ClientID, "Basic", 0, false, true, true,false);    
                    %>
                   
                </td>
            </tr>

        </table>

        <div style="text-align:center;height:50px;line-height:50px">
          <asp:HiddenField ID="HidId" runat="server" Value="0" />
          <asp:Button ID="BtnSubmit" OnClientClick="return(CheckForm());" CssClass="button" Text="确定发布" runat="server" 
                onclick="BtnSubmit_Click" />
        </div>

        <script>
             var classId=<%=smallClassID %>;
             var cityId=<%=cityId %>;
             function getClass() {
                                var parentId = jQuery("#<%=this.DrpBigClassID.ClientID %> option:selected").val();
                                jQuery.ajax({
                                    type: "POST",
                                    url: "../../plus/Ajaxs.ashx",
                                    data: "classid="+classId+"&parentid=" + parentId + "&a=groupbuyclassoption",
                                    success: function(data) {
                                        jQuery("#ClassID").empty().append('<option value="0">--选择小类--</option>').append(data);
                                    }
                                });
             }
             function getCity(){
                                var provinceId = jQuery("#<%=this.DrpProvinceID.ClientID %> option:selected").val();
                                jQuery.ajax({
                                    type: "POST",
                                    url: "../../plus/Ajaxs.ashx",
                                    data: "cityId="+cityId+"&provinceId=" + provinceId + "&a=groupbuycityoption",
                                    success: function(data) {
                                        jQuery("#CityID").empty().append('<option value="0">--选择城市--</option>').append(data);
                                    }
                                });
             }
            function showYf() {
                if (jQuery("#<%=this.RdbShowDelivery.ClientID%> :radio[checked]").val() == "1") {
                    jQuery("#yf").show();
                } else {
                    jQuery("#yf").hide();
                }
            }

            jQuery(document).ready(function() {
                <%if (Id!=0){%>
                   getClass();
                   getCity();
                   showYf();
                <%}%>
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
               //jQuery("#aspnetForm").attr("action","MyGroupBuy.aspx");
             //jQuery("#<%=this.BtnSubmit.ClientID %>").attr("value","正在提交保存...").attr("disabled",false);
                return true;
            }
        </script>
      <br />









</asp:Panel>



</asp:Content>
