<%@ Page Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.Admin_Label_ProList" Title="Untitled Page" Codebehind="KS.Label.ProList.aspx.cs" %>
<%@ Import Namespace="Kesion.Cache"%>
<%@ Import Namespace="Kesion.BLL"%>


<asp:Content ID="Content1" ContentPlaceHolderID="KSContent" Runat="Server">
<!--
<body onmousemove="dragmove();" onmouseup="dragclear()">
-->
<script type="text/javascript">
  
  function getfields(channelid)
  {
      jQuery.get('KS.GetFields.aspx', { from:'shop',channelid: channelid }, function (s) {
      jQuery('#fieldsarea').html(unescape(s));
    });
  }

  function selectclassid(v)
  { 
    
   var va=v.split(',');
   for(var i=0;i<jQuery("#classid1")[0].options.length;i++)
   {
    for(var n=0;n<va.length;n++)
    {
        if(va[n]==jQuery("#classid1")[0].options[i].value)
        {
          jQuery("#classid1")[0].options[i].selected=true;
        }
    }
   } 
  }


  function setstyle(v)
  {
      var s1 = "[Loop Times=\"10\"]\n <li><span class=\"date\">{$Field(AddDate,date,YY-MM-DD)}</span><a href=\"{$Field(InfoID,url,<%=this.ChannelID.SelectedValue %>,3)}\">{$Field(Title,text,30,...,2,)}</a></li>\n[/Loop]";
   var s2 = "[Loop Times=\"10\"]\n <table border=\"0\" cellspacing=\"1\" cellpadding=\"0\">\n"
          +"<tr>\n"
          + " <td align=\"center\"><a href=\"{$Field(InfoID,url,<%=this.ChannelID.SelectedValue %>,3)}\"><img src=\"{$Field(DefaultPic,text,0,...,2,/sysimg/nopic.gif)}\" border=\"0\" width=\"130\" height=\"90\"></a><br />\n"
          + " <a href=\"{$Field(InfoID,url,<%=this.ChannelID.SelectedValue %>,3)}\">{$Field(Title,text,18,0,2,)}</a>\n"
          +" </td>\n"
          +"</tr>\n"
          +"</table>\n[/Loop]";
   var s3 = "[Loop Times=\"10\"]\n <table border=\"0\" cellspacing=\"1\" cellpadding=\"0\">\n"
       +" <tr>\n"
       +"  <td align=\"center\"><a href=\"{$Field(InfoID,url,<%=this.ChannelID.SelectedValue %>,3)}\"><img src=\"{$Field(DefaultPic,text,0,...,2,/sysimg/nopic.gif)}\" border=\"0\" width=\"130\" height=\"90\"></a>\n"
       +"  </td>\n"
       +"  <td><a href=\"{$Field(InfoID,url,<%=this.ChannelID.SelectedValue %>,3)}\">{$Field(Title,text,18,0,2,)}</a><br />\n"
       +"{$Field(Intro,text,80,...,2,)}</td>\n"
       +"  </tr>\n"
       +"</table>\n[/Loop]";
   var s4 = "[Loop Times=\"10\"]\n <table align=\"center\" border=\"0\" height=\"160\" cellspacing=\"1\" cellpadding=\"0\">\n"
       +" <tr>\n"
       +"   <td valign=\"top\">\n"
       +"   <div style=\"text-align:center\"><a href=\"{$Field(InfoID,url,2,3)}\"><img src=\"{$Field(DefaultPic,text,0,...,2,/sysimg/nopic.gif)}\" border=\"0\" width=\"130\" height=\"90\"></a></div><br />\n"
       +"   <a href=\"{$Field(InfoID,url,2,3)}\">{$Field(Intro,text,50,...,2,)}</a>\n"
       +"  </td>\n"
       +" </tr>\n"
       +"</table>\n[/Loop]"
   jQuery("#<%=this.LoopBody.ClientID %>").val(eval("s"+v));
  }
  function checkform()
  {
   var childclass=0;
   if (jQuery('#<%=this.ChildClass.ClientID %>')[0].checked) childclass = 1;
      var autoarea = 0;
      if (jQuery('#<%=this.CkbArea.ClientID %>')[0].checked) autoarea = 1;

   var recommends=0;
   if (jQuery("#<%=this.Attribute.ClientID %>_0")[0].checked)
   recommends=1;
   var hot=0;
   if (jQuery("#<%=this.Attribute.ClientID %>_1")[0].checked)
   hot=1;
   var splendid=0;
   if (jQuery("#<%=this.Attribute.ClientID %>_2")[0].checked)
   splendid=1;
   var slide=0;
   if (jQuery("#<%=this.Attribute.ClientID %>_3")[0].checked)
   slide=1;
   var strip=0;
   if (jQuery("#<%=this.Attribute.ClientID %>_4")[0].checked)
   strip=1;
   var rolls=0;
   if (jQuery("#<%=this.Attribute.ClientID %>_5")[0].checked)
   rolls=1;
   var haspic=0;
   if (jQuery("#<%=this.Attribute.ClientID %>_6")[0].checked)
   haspic=1;


   var classid='';
   jQuery("#classid1 option:selected").each(function() {
		if (jQuery(this).val()!='0')
			if (classid=='') 
				 classid=jQuery(this).val() 
			else
				 classid+=","+jQuery(this).val();
		})
   if (classid=='') classid='0';
   var brandid = '';
   jQuery("#<%=this.LstBrandID.ClientID %> option:selected").each(function() {
       if (jQuery(this).val() != '0')
           if (brandid == '')
               brandid = jQuery(this).val()
       else
           brandid += "," + jQuery(this).val();
   })
   if (brandid == '') brandid = '0';

   var isScoreChange = jQuery("#<%=this.RdbIsScoreChange.ClientID %> :radio[checked]").val();

   var str='{KS:Label Type="IProList"'
          + ' ChannelID="<%=this.ChannelID.SelectedValue %>"'
          + ' ClassID="'+classid+'"'
          + ' ChildClass="' + childclass + '"'
          + ' AutoArea="' + autoarea + '"'
          + ' BrandID="' + brandid + '"'
          + ' Ajax="<%=this.PrintStyle.SelectedValue %>"'
          + ' Recommends="'+recommends+'"'
          + ' Hot="'+hot+'"'
          + ' Splendid="'+splendid+'"'
          + ' Slide="'+slide+'"'
          + ' Strip="'+strip+'"'
          + ' Rolls="'+rolls+'"'
          + ' HasPic="' + haspic + '"'
          + ' IsScoreChange="' + isScoreChange+'"'
          + ' Order="'+jQuery('#<%=this.Order.ClientID %>').val()+'"'
          + ' Num="'+jQuery('#<%=this.Num.ClientID %>').val()+'"'
          + ' SQLCondition="' + jQuery('#<%=this.SQLCondition.ClientID %>').val() + '"'
          + '}' + jQuery('#<%=this.LoopBody.ClientID%>').val() + '{/KS:Label}';
   
   jQuery("#<%=this.LabelContent.ClientID %>").val(str);
   return true;
  }
    function purview()
    {  
      parent.openWin("自动编号变量样式预览","../admin/include/autoid.html",false,650,230);
    } 
    
   var pos=null;
   function setPos() {
    if (document.all){
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
<KS:TopNav runat="server" Text="创建智能商品列表式标签第一步" ID="TopNav1" />
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
                    <strong>选择模型：</strong></td>
                <td class="righttd" style="height: 30px; text-align: left">

                      <asp:DropDownList ID="ChannelID" runat="server">
                      <asp:ListItem Value="0">--不指定模型--</asp:ListItem>
                      </asp:DropDownList>
                      
                      <span style="color:blue">指定具体模型时,可用字段会包括自定义字段</span>
                      </td>
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
                            <strong>标签模型：</strong></td>
                        <td runat="server" class="righttd" colspan="2" style="height: 30px; text-align: left" id="Td1">
                            <asp:Label ID="LabelModelName" runat="server" Text="Label"></asp:Label>
                            &nbsp;&nbsp; </td>
                    </tr>
            <tr>
                <td class="lefttd" style="height: 30px; text-align: right">
                    <span style="background-color: #f0f9fe"></span><strong>查询条数：</strong></td>
                <td id="Td3" runat="server" class="righttd" colspan="2" style="height: 30px; text-align: left">
                    <asp:TextBox CssClass="textbox" style="text-align:center" ID="Num" runat="server" Width="41px">10</asp:TextBox>条&nbsp;
                    <strong>排序方式：</strong><asp:DropDownList ID="Order" runat="server">
                    <asp:ListItem Value="I.InfoID desc">商品ID降序</asp:ListItem>
                    <asp:ListItem Value="I.InfoID asc">商品ID升序</asp:ListItem>
                    <asp:ListItem Value="I.hassold asc">销售量升序</asp:ListItem>
                    <asp:ListItem Value="I.hassold desc">销售量降序</asp:ListItem>
                    <asp:ListItem Value="I.adddate desc">更新时间降序</asp:ListItem>
                    <asp:ListItem Value="I.adddate asc">更新时间升序</asp:ListItem>
                    <asp:ListItem Value="i.commentnum desc">总评论数降序</asp:ListItem>
                    <asp:ListItem Value="i.commentnum asc">总评论数升序</asp:ListItem>
                    <asp:ListItem Value="i.hits desc">总浏览数降序</asp:ListItem>
                    <asp:ListItem Value="i.hits asc">总浏览数升序</asp:ListItem>
                    <asp:ListItem Value="i.hitsbymonth desc">月浏览数降序</asp:ListItem>
                    <asp:ListItem Value="i.hitsbymonth asc">月浏览数升序</asp:ListItem>
                    <asp:ListItem Value="i.hitsbyweek desc">周浏览数降序</asp:ListItem>
                    <asp:ListItem Value="i.hitsbyweek asc">周浏览数升序</asp:ListItem>
                    <asp:ListItem Value="i.hitsbyday desc">日浏览数降序</asp:ListItem>
                    <asp:ListItem Value="i.hitsbyday asc">日浏览数升序</asp:ListItem>
                     <asp:ListItem Value="newid()">随机显示</asp:ListItem>
                      </asp:DropDownList>
                SQL附加条件：<asp:TextBox CssClass="textbox" ID="SQLCondition" runat="server" Width="150px">1</asp:TextBox> 可留空，如: and I.Inputer='admin'
                </td>
            </tr>
            <tr>
                <td class="lefttd" style="height: 30px; text-align: right">
                    <strong>所属栏目：</strong><br /></td>
                <td id="Td4" runat="server" class="righttd" colspan="2" style="height: 30px; text-align: left">
                 <table border="0" cellpadding="0" cellspacing="0">
                     <tr>
                      <td style="width: 1px">
                      <select name='classid1' id='classid1' multiple size='3' style='width: 120px'>
                      <option value='0'>-不指定栏目-</option>
                      <option value='-1' style='color:red'>当前栏目通用</option>
                     <%=MyCache.GetShopClassOptionList(modelid)%>
                      </select>
                      
                      </td>
                      <td valign="top">
                     
                      <asp:CheckBox ID="ChildClass" runat="server" Checked="true" Text="允许列出子栏目商品(仅对单选有效)" />
                      <br />&nbsp;&nbsp;<font color=blue>若要调用多个栏目，可以按Ctrl进行多选</font>
                       <br /> <asp:CheckBox ID="CkbArea" runat="server" Checked="true" Text="自动识别地区" />
</td>
<td nowrap><strong> 所属品牌：</strong>
                     
                      
                      </td>
                      <td valign="top">
                          <asp:ListBox ID="LstBrandID" runat="server" SelectionMode="Multiple" Width="120" Rows="3">
                           <asp:ListItem Value=''>-不指定品牌-</asp:ListItem>
                          </asp:ListBox>
                      
                        </td>
                     </tr>
                    </table>
                </td>
               
            </tr>
                    <tr>
                        <td class="lefttd" style="height: 30px; text-align: right">
                         <strong>&nbsp;属性控制：</strong>
                        </td>
                        <td class="righttd" colspan="2" style="height: 30px; text-align: left">
                        
                        <table border="0" cellpadding="0" cellspacing="0">
                             <tr>
                              <td style="width: 1px"></td>
                              <td>
                                  <asp:CheckBoxList ID="Attribute" runat="server" RepeatDirection="Horizontal">
                                    <asp:ListItem Value="1">推荐</asp:ListItem>
                                    <asp:ListItem Value="2">热点</asp:ListItem>
                                    <asp:ListItem Value="3">精彩</asp:ListItem>
                                   <asp:ListItem Value="4">幻灯</asp:ListItem>
                                    <asp:ListItem Value="5">头条</asp:ListItem>
                                    <asp:ListItem Value="6">滚动</asp:ListItem>
                                    <asp:ListItem Value="7">仅显示带图片</asp:ListItem>
                                </asp:CheckBoxList>
                              </td>
                              <td><strong>显示商品：</strong><asp:RadioButtonList ID="RdbIsScoreChange" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow">
                               <asp:ListItem Value="0" Selected="True">不限</asp:ListItem>
                               <asp:ListItem Value="1">仅显示积分兑换</asp:ListItem>
                               <asp:ListItem Value="2">仅显示非积分兑换</asp:ListItem>
                               </asp:RadioButtonList>
                              </td>
                             </tr>
                            </table>
                        
                        
                        </td>
                    </tr>
                    <tr style="display:none" id="selectstyle" runat="server">
                        <td class="lefttd" style="height: 30px; text-align: right">
                            <strong>快速选择样式：</strong></td>
                        <td runat="server" class="righttd" colspan="2" style="height: 30px; text-align: left" id="Td5">
                        
                         <table border="0" width="100%">
                          <tr>
                           <td><img src="../../admin/images/view/1.gif"><input type="radio" value="1" name="loopstyle" onclick="setstyle(this.value)" checked>
                           </td>
                           <td><img src="../../admin/images/view/2.gif"><input type="radio" value="2" name="loopstyle" onclick="setstyle(this.value)">
                           </td>
                           <td>
                                  <img src="../../admin/images/view/3.gif"><input type="radio" value="3" name="loopstyle" onclick="setstyle(this.value)">
                           </td>
                           <td>
                                  <img src="../../admin/images/view/4.gif"><input type="radio" value="4" name="loopstyle" onclick="setstyle(this.value)">
                           </td>
                          </tr>
                         </table>
                        </td>
                    </tr>
            <tr>
                <td class="lefttd" style="text-align: right">
                    <strong>可用字段：</strong></td>
                <td class="righttd" colspan="2" style="text-align: left"><span id="fieldsarea"></span></td>
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

