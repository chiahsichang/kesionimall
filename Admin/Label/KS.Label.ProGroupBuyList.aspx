<%@ Page Language="C#" MasterPageFile="~/Admin/MasterPage.master" EnableEventValidation="false" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.Admin_Label_ProGroupBuyList" Title="Untitled Page" Codebehind="KS.Label.ProGroupBuyList.aspx.cs" %>
<%@ Import Namespace="Kesion.Cache"%>
<%@ Import Namespace="Kesion.BLL"%>


<asp:Content ID="Content1" ContentPlaceHolderID="KSContent" Runat="Server">
<!--
<body onmousemove="dragmove();" onmouseup="dragclear()">
-->
<script type="text/javascript">
  
  
  function checkform()
  {
   var recommends=0;
   if (jQuery("#<%=this.Attribute.ClientID %>_0")[0].checked)
   recommends=1;


  var bigClassID =jQuery("#<%=this.DrpBigClassID.ClientID %> option:selected").val();
  var classId = jQuery("#<%=this.DrpClassID.ClientID %> option:selected").val();
  var provinceId = 0;
  var cityId = 0;
  <% if (MyCache.GetCacheShopConfig(17) == "1")
            { %>
   var provinceId = jQuery("#<%=this.DrpProvinceID.ClientID %> option:selected").val();
   var cityId = jQuery("#<%=this.DrpCityID.ClientID %> option:selected").val();     
  <%} %>

   
   var str='{KS:Label Type="IProGroupBuyList"'
          + ' Ajax="<%=this.PrintStyle.SelectedValue %>"'
          + ' BigClassID="' + bigClassID + '"'
          + ' ClassID="' + classId + '"'
          + ' ProvinceID="' + provinceId + '"'
          + ' CityID="'+cityId+'"'
          + ' Recommends="' + recommends + '"'
          + ' Order="'+jQuery('#<%=this.Order.ClientID %>').val()+'"'
          + ' Num="'+jQuery('#<%=this.Num.ClientID %>').val()+'"'
          + ' SQLCondition="' + jQuery('#<%=this.SQLCondition.ClientID %>').val() + '"'
          + '}' + jQuery('#<%=this.LoopBody.ClientID%>').val() + '{/KS:Label}';
   jQuery("#<%=this.LabelContent.ClientID %>").val(str);
   return true;
  }
    function purview()
    { parent.openWin("自动编号变量样式预览","../admin/include/autoid.html",false,650,230);
    } 
    
   var pos=null;
   function setPos()
	{ if (document.all){
			jQuery("#<%=this.LoopBody.ClientID %>").focus();
		    pos = document.selection.createRange();
		  }else{
		    pos = jQuery("#<%=this.LoopBody.ClientID %>")[0].selectionStart;
		  }
   }
   		//插入到循环体
	function InsertValue(Val) {
	    if (pos == null) { KesionJS.Alert('请先定位插入位置!', null); return false; }
			 if (document.all){
			  pos.text=Val;
			 }else{
			   var obj=jQuery("#<%=this.LoopBody.ClientID %>");
			   var lstr=obj.val().substring(0,pos);
			   var rstr=obj.val().substring(pos);
			   obj.val(lstr+Val+rstr);
			 }
	}
     
   function InsertLabel(fieldname,fieldtype)
   {  
    dragclear();
    if(pos==null) {KesionJS.Alert('请先定位插入位置!',null);return false;}
	var link="label/KS.GetFieldParam.aspx?m_fieldname=" + fieldname+"&fieldtype="+fieldtype;
	parent.openWin('插入字段标签',link,false,350,200);
   }
 
  
var fieldname,fieldtype;
function DragStart()
{
    dragclear();
    window.drag = 1;
    dragspan = document.createElement('div');
    dragspan.style.position = "absolute";
    dragspan.className="div" ;
    var mousePos = mouseCoords(window.event);
    dragspan.style.left = mousePos.x + 10;
    dragspan.style.top = mousePos.y + 8;    
    fieldname = window.event.srcElement.id;
    fieldtype=window.event.srcElement.fieldtype;
    dragspan.appendChild(document.createTextNode(window.event.srcElement.innerHTML));
    document.body.appendChild(dragspan);
}
function SetValue()
{	
    setPos();
    var link="label/KS.GetFieldParam.aspx?m_fieldname=" + fieldname+"&fieldtype="+fieldtype;
    parent.openWin('插入字段标签',link,false,350,200);
    if(window.drag)
    {
        window.drag = 0;
        window.event.returnValue = true;
    } 
    
}
function dragend()
{
    if(window.drag)
    {
        document.body.removeChild(dragspan); 
        SetValue(); 
    }
}
function mouseCoords(ev) {
    if(ev.pageX || ev.pageY) {
      return {x:ev.pageX, y:ev.pageY};
    }
    return {
      x:ev.clientX + document.documentElement.scrollLeft - document.body.clientLeft,
      y:ev.clientY + document.documentElement.scrollTop - document.body.clientTop
    };
}
function dragclear()
{
    if(window.drag)
    {
        document.body.removeChild(dragspan);
        window.drag = 0;
        window.event.returnValue = true;
    }
    
}
function dragmove()
{
    if(window.drag)
    {
        var ev = ev || window.event;
        var mousePos = mouseCoords(ev);
        ev.returnValue = false; 
        dragspan.style.left = mousePos.x + 10;
        dragspan.style.top = mousePos.y + 8;
    }
}
function movePoint() 
{
    if(window.drag)
    {
        var rng = event.srcElement.createTextRange(); 
        rng.moveToPoint(event.x,event.y); 
        rng.select(); 
    }
}
</script>
<KS:TopNav runat="server" Text="团购商品列表标签第一步" ID="TopNav1" />
    <asp:Panel ID="Step1Panel" runat="server" Width="100%">
        <br />
        <table style="margin:6px" width="98%" align="center" cellpadding="1" cellspacing="1" class="CTable">
        <tr>
            <td class="lefttd" style="height: 30px; text-align: right">
                <strong>标签名称：</strong></td>
            <td id="Td2" runat="server" class="righttd" style="height: 30px; text-align: left">
                <span style="color: #000066">{KS_</span><asp:TextBox CssClass="noborder" ID="LabelName" runat="server" Width="126px"></asp:TextBox><span style="color: #000066"> } * 调用格式：{KS_标签名称}</span><asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="LabelName"
                    Display="Dynamic" ErrorMessage="标签名称必须输入"></asp:RequiredFieldValidator></td>
        </tr>
    <tr>
     <td class="lefttd" style="text-align: right; height: 30px;">
         <strong>标签目录：</strong></td>
     <td class="righttd" style="text-align: left; height: 30px;"><span  id="classidarea" runat="server"></span><span style="color:blue"> 请选择标签所属目录，以便日后管理标签</span></td>
    </tr>

           
        <tr>
            <td class="lefttd" style="height: 30px; text-align: right">
                <strong>输出方式：</strong></td>
            <td class="righttd" style="height: 30px; text-align: left">
                    <asp:RadioButtonList ID="PrintStyle" runat="server" RepeatDirection="Horizontal">
                        <asp:ListItem Value="0" Selected="True">不采用Ajax输出</asp:ListItem>
                        <asp:ListItem Value="1">采用Ajax输出</asp:ListItem>
                    </asp:RadioButtonList></td>
        </tr>
        <tr>
            <td class="lefttd" style="height: 30px; text-align: right">
                <strong>简要介绍：</strong></td>
            <td class="righttd" style="height: 30px; text-align: left">
                <asp:TextBox ID="Descript" runat="server" CssClass="textbox textarea" Height="100px" Rows="8" TextMode="MultiLine" Width="500px"></asp:TextBox>
                   <a class="textarea_min" href="javascript:zoomtextarea(-5,'<%=this.Descript.ClientID %>');"></a>
                   <a class="textarea_max" href="javascript:zoomtextarea(5,'<%=this.Descript.ClientID %>');"></a>
            </td>
        </tr>
    </table><br />
    <KS:Foot ID="Foot1" runat="server" OnSubmit="Foot1_Submit" SubmitButtonText="下一步(0)" />
    </asp:Panel>


        <asp:Panel ID="Step2Panel" runat="server" Visible="false" Width="100%">
        
                <table style="margin:6px" width="98%" align="center" cellpadding="1" cellspacing="1" class="CTable">
                  

            <tr>
                <td class="lefttd" style="height: 30px; text-align: right">
                    <span style="background-color: #f0f9fe"></span><strong>查询条数：</strong></td>
                <td id="Td3" runat="server" class="righttd" colspan="2" 
                    style="height: 30px; text-align: left">
                    <asp:TextBox ID="Num" runat="server" CssClass="textbox" 
                        style="text-align:center" Width="41px">10</asp:TextBox>
                    条&nbsp; <strong>排序方式：</strong><asp:DropDownList ID="Order" runat="server">
                        <asp:ListItem Value="ID desc">团购商品ID降序</asp:ListItem>
                        <asp:ListItem Value="ID asc">团购商品ID升序</asp:ListItem>
                        <asp:ListItem Value="begindate desc">团购开始时间降序</asp:ListItem>
                        <asp:ListItem Value="begindate asc">团购开始时间升序</asp:ListItem>
                        <asp:ListItem Value="enddate desc">团购结束时间降序</asp:ListItem>
                        <asp:ListItem Value="enddate asc">团购结束时间升序</asp:ListItem>
                        <asp:ListItem Value="sellnum desc">销售量降序</asp:ListItem>
                        <asp:ListItem Value="sellnum asc">销售量升序</asp:ListItem>
                        <asp:ListItem Value="newid()">随机显示</asp:ListItem>
                    </asp:DropDownList>
                    SQL附加条件：<asp:TextBox ID="SQLCondition" runat="server" CssClass="textbox" 
                        Width="150px"></asp:TextBox>
                    可留空，如: and price>100
                </td>
               
            </tr>
                    
                    <tr>
                        <td class="lefttd" style="height: 30px; text-align: right">
                         <strong>&nbsp;属性限制：</strong>
                        </td>
                        <td class="righttd" colspan="2" style="height: 30px; text-align: left">
                        
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
                                        jQuery("#<%=this.DrpClassID.ClientID %>").empty().append('<option value="0">--不指定小类--</option>').append(data);
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
                                        jQuery("#<%=this.DrpCityID.ClientID %>").empty().append('<option value="0">--不指定城市--</option>').append(data);
                                    }
                                });
                            }
                            jQuery(document).ready(function() {
                                getClass();
                                getCity();
                            });
                        </script>
                       
                          <table width="100%" cellpadding="0" cellspacing="0">
                           <tr>
                            <td>
                  分类：          
                  <asp:DropDownList ID="DrpBigClassID"  runat="server"  >
                 </asp:DropDownList>   
                 <asp:DropDownList ID="DrpClassID" runat="server">
                  <asp:ListItem Value="0">--不指定小类--</asp:ListItem>
                 </asp:DropDownList>  
                  
                  地区：
 <asp:DropDownList ID="DrpProvinceID" runat="server" >
                  
                  </asp:DropDownList>
                  <asp:DropDownList ID="DrpCityID" runat="server"></asp:DropDownList></td>
                            <td>
                            
                            
                              <asp:CheckBoxList ID="Attribute" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow">
                                <asp:ListItem Value="1">仅显示推荐</asp:ListItem>
                            </asp:CheckBoxList>
                            </td>
                           </tr>
                          </table>
                          

                         
                        </td>
                    </tr>
                   
            <tr>
                <td class="lefttd" style="height: 30px; text-align: right">
                    <strong>可用字段：</strong></td>
                <td class="righttd" colspan="2" style="height: 30px; text-align: left">
                
                <table width="95%" cellspacing="0" cellpadding="0" border="0">
                <tr>
                <td align="center"><div  onclick="InsertValue('{KS:Field:GroupBuyURL}')" class="field" style="cursor:pointer">团购链接URL</div></td>
                <td align="center"><div  onclick="InsertValue('{KS:Field:GroupBuyCartURL}')" class="field" style="cursor:pointer">购物车链接URL</div></td>
                <td align="center"><div  onclick="InsertValue('{KS:Field:ID}')" class="field" style="cursor:pointer">团购商品ID</div></td>
                <td align="center"><div onmousedown="DragStart()" id="Subject" fieldtype="1" onclick="InsertLabel(this.id,this.fieldtype)" class="field" style="cursor:pointer">团购商品名称</div></td>
                <td align="center"><div onmousedown="DragStart()" id="PhotoUrl" fieldtype="0" onclick="InsertLabel(this.id,this.fieldtype)" class="field" style="cursor:pointer">团购商品小图</div></td>
                <td align="center"><div onmousedown="DragStart()" id="BigPhoto" fieldtype="0" onclick="InsertLabel(this.id,this.fieldtype)" class="field" style="cursor:pointer">团购商品大图</div></td>
                <td align="center"><div onmousedown="DragStart()" id="Intro" fieldtype="0" onclick="InsertLabel(this.id,this.fieldtype)" class="field" style="cursor:pointer">团购商品介绍</div></td>
               </tr>
               <tr>
                <td align="center"><div onmousedown="DragStart()" id="BeginDate" fieldtype="0" onclick="InsertLabel(this.id,this.fieldtype)" class="field" style="cursor:pointer">开始时间</div></td>
                <td align="center"><div onmousedown="DragStart()" id="EndDate" fieldtype="0" onclick="InsertLabel(this.id,this.fieldtype)" class="field" style="cursor:pointer">结束时间</div></td>
                <td align="center"><div onmousedown="DragStart()" id="Price_Original" fieldtype="0" onclick="InsertLabel(this.id,this.fieldtype)" class="field" style="cursor:pointer">原价</div></td>
                <td align="center"><div onmousedown="DragStart()" id="Discount" fieldtype="0" onclick="InsertLabel(this.id,this.fieldtype)" class="field" style="cursor:pointer">折扣</div></td>
                <td align="center"><div onmousedown="DragStart()" id="Price" fieldtype="0" onclick="InsertLabel(this.id,this.fieldtype)" class="field" style="cursor:pointer">团购价</div></td>
                <td align="center"><div onmousedown="DragStart()" id="PriceSave" fieldtype="0" onclick="InsertLabel(this.id,this.fieldtype)" class="field" style="cursor:pointer">节省价</div></td>
                <td align="center"><div onmousedown="DragStart()" id="MinNum" fieldtype="0" onclick="InsertLabel(this.id,this.fieldtype)" class="field" style="cursor:pointer">最低人数</div></td>
               </tr>
               <tr>
                <td align="center"><div onmousedown="DragStart()" id="LimitBuyNum" fieldtype="0" onclick="InsertLabel(this.id,this.fieldtype)" class="field" style="cursor:pointer">限制购买量</div></td>
               <td align="center"><div onmousedown="DragStart()" id="Weight" fieldtype="0" onclick="InsertLabel(this.id,this.fieldtype)" class="field" style="cursor:pointer">重量</div></td>
               <td align="center"><div onmousedown="DragStart()" id="Unit" fieldtype="0" onclick="InsertLabel(this.id,this.fieldtype)" class="field" style="cursor:pointer">单位</div></td>
               <td align="center"><div onmousedown="DragStart()" id="SellNum" fieldtype="0" onclick="InsertLabel(this.id,this.fieldtype)" class="field" style="cursor:pointer">已销售量</div></td>
               <td align="center"><div onclick="InsertValue('{KS:Field:TimeCountDown}')" class="field" style="cursor:pointer">团购结束倒计</div></td>
               <td align="center"><div onclick="InsertValue('{KS:Field:BeginCountDown}')" class="field" style="cursor:pointer">团购开始倒计</div></td>
                </tr></table>
                
                
                </td>
            </tr>
            <tr>
                <td class="lefttd" style="height: 30px; text-align: right">
                    <strong>样式循环体：</strong><br />
                    自动编号变量<font color=red>{$Auto(n)}</font><br />
                    n取值范围0-6之间,<a href='#' onclick="purview();return false;"><font color=blue>预览</font></a>
                    &nbsp;&nbsp;
                    </td>
                <td id="Td10" runat="server" class="righttd" colspan="2" style="height: 30px; text-align: left">
                   <asp:TextBox CssClass="textbox textarea" Height="150px" ID="LoopBody" onmouseup="dragend()" onmousemove="movePoint()" onclick='setPos()' onkeyup='setPos()' runat="server" Rows="6" TextMode="MultiLine" Width="92%"></asp:TextBox>
                    <a class="textarea_min" href="javascript:zoomtextarea(-5,'<%=this.LoopBody.ClientID %>');"></a>
                   <a class="textarea_max" href="javascript:zoomtextarea(5,'<%=this.LoopBody.ClientID %>');"></a>
                   </td>
            </tr>
                    <tr>
                        <td class="lefttd" style="height: 30px; text-align: right">
                            <strong>简要描述：</strong></td>
                        <td runat="server" class="righttd" colspan="2" style="height: 30px; text-align: left" id="Td8">
                           <span style="color: #6666ff">1、Loop使用规则</span><br />
循环体格式：[loop times="n"]循环标签的内容[/loop]<br />
其中n表示循环次数，且n满足n>=0。loop为循环关键字，此循环体可以重复使用,但是不能嵌套。 <br />
                            <span style="color: #6666ff">2、字段标签规则说明</span><br />
                                格式：{$Field(FieldName,OutType,Len)}<br/>
FieldName  --数据库表的字段名称<br />
OutType    --输出格式，支持文本(text),日期(date),对象(url)<br />
Len        --输出长度</td>
                    </tr>
            
      </table>
     <div style="text-align:center">
         <asp:TextBox ID="LabelContent" runat="server" Height="87px" TextMode="MultiLine" Width="445px"></asp:TextBox>&nbsp;
         <asp:TextBox ID="LabelClassID" runat="server"></asp:TextBox>
         <asp:TextBox ID="LName" runat="server"></asp:TextBox>
         <asp:TextBox ID="LNote" runat="server"></asp:TextBox>
         <br />
         <KS:Foot ID="Foot2" runat="server" OnSubmit="Foot2_Submit" />
     </div>

        </asp:Panel>


</asp:Content>

