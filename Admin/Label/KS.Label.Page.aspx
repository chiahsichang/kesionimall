<%@ Page Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.Admin_Label_Page" Title="终级分页标签" CodeBehind="KS.Label.Page.aspx.cs" %>
<%@ Import Namespace="Kesion.Publics"%>
<%@ Import Namespace="Kesion.Cache"%>
<%@ Import Namespace="Kesion.BLL"%>
<asp:Content ID="Content1" ContentPlaceHolderID="KSContent" Runat="Server">

<!--
<body onmousemove="dragmove();" onmouseup="dragclear()">
-->
<script type="text/javascript">

  function getfields(channelid)
  {
    jQuery.get('KS.GetFields.aspx',{channelid:channelid},function(s){
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
  function selectspecialid(v)
  {
    for(var i=0;i<jQuery("#specialid1")[0].options.length;i++)
   {
        if(v==jQuery("#specialid1")[0].options[i].value)
          jQuery("#specialid1")[0].options[i].selected=true;
         
   }  
  }
  
  function setstyle(v)
  {
   var s1="[Loop Times=\"10\"]\n·<a href=\"{$Field(InfoID,url,<%=this.ChannelID.SelectedValue %>,3)}\">{$Field(Title,text,30,...,2,)}</a> {$Field(AddDate,date,YY-MM-DD)}<br />\n[/Loop]\n[KS:PageStr]";
   var s2="<table border=\"0\" cellspacing=\"1\" cellpadding=\"0\">\n"
		  +" <tr>\n"
		  +" [Loop times=\"4\"]\n"
          +"  <td width=\"130\" align=\"center\"><a href=\"{$Field(InfoID,url,<%=this.ChannelID.SelectedValue %>,3)}\"><img src=\"{$Field(DefaultPic,text,0,...,2,/sysimg/nopic.gif)}\" border=\"0\" width=\"120\" height=\"100\"></a><br />\n"
          +"  <a href=\"{$Field(InfoID,url,<%=this.ChannelID.SelectedValue %>,3)}\">{$Field(Title,text,10,0,2,)}</a>\n"
          +"  </td>\n"
          +" [/loop]\n"
          +"</tr>\n"
		  +" <tr>\n"
		  +" [Loop times=\"4\"]\n"
          +"  <td width=\"130\" align=\"center\"><a href=\"{$Field(InfoID,url,<%=this.ChannelID.SelectedValue %>,3)}\"><img src=\"{$Field(DefaultPic,text,0,...,2,/sysimg/nopic.gif)}\" border=\"0\" width=\"120\" height=\"100\"></a><br />\n"
          +"  <a href=\"{$Field(InfoID,url,<%=this.ChannelID.SelectedValue %>,3)}\">{$Field(Title,text,10,0,2,)}</a>\n"
          +"  </td>\n"
          +" [/loop]\n"
		  +" [Loop times=\"4\"]\n"
          +"  <td width=\"130\" align=\"center\"><a href=\"{$Field(InfoID,url,<%=this.ChannelID.SelectedValue %>,3)}\"><img src=\"{$Field(DefaultPic,text,0,...,2,/sysimg/nopic.gif)}\" border=\"0\" width=\"120\" height=\"100\"></a><br />\n"
          +"  <a href=\"{$Field(InfoID,url,<%=this.ChannelID.SelectedValue %>,3)}\">{$Field(Title,text,10,0,2,)}</a>\n"
          +"  </td>\n"
          +" [/loop]\n"
		  +" [Loop times=\"4\"]\n"
          +"  <td width=\"130\" align=\"center\"><a href=\"{$Field(InfoID,url,<%=this.ChannelID.SelectedValue %>,3)}\"><img src=\"{$Field(DefaultPic,text,0,...,2,/sysimg/nopic.gif)}\" border=\"0\" width=\"120\" height=\"100\"></a><br />\n"
          +"  <a href=\"{$Field(InfoID,url,<%=this.ChannelID.SelectedValue %>,3)}\">{$Field(Title,text,10,0,2,)}</a>\n"
          +"  </td>\n"
          +" [/loop]\n"
          +"</tr>\n"
          +"</table>\n"
          +"[KS:PageStr]\n";
   var s3="<table border=\"0\" cellspacing=\"1\" cellpadding=\"0\">\n"
       +" <tr>\n"
       +"  <td align=\"center\"><a href=\"{$Field(InfoID,url,<%=this.ChannelID.SelectedValue %>,3)}\"><img src=\"{$Field(DefaultPic,text,0,...,2,/sysimg/nopic.gif)}\" border=\"0\" width=\"130\" height=\"90\"></a>\n"
       +"  </td>\n"
       +"  <td><a href=\"{$Field(InfoID,url,<%=this.ChannelID.SelectedValue %>,3)}\">{$Field(Title,text,18,0,2,)}</a><br />\n"
       +"{$Field(Intro,text,80,...,2,)}</td>\n"
       +"  </tr>\n"
       +"</table>\n";
   var s4="<table align=\"center\" border=\"0\" height=\"160\" cellspacing=\"1\" cellpadding=\"0\">\n"
       +" <tr>\n"
       +"   <td valign=\"top\">\n"
       +"   <div style=\"text-align:center\"><a href=\"{$Field(InfoID,url,2,3)}\"><img src=\"{$Field(DefaultPic,text,0,...,2,/sysimg/nopic.gif)}\" border=\"0\" width=\"130\" height=\"90\"></a></div><br />\n"
       +"   <a href=\"{$Field(InfoID,url,2,3)}\">{$Field(Intro,text,50,...,2,)}</a>\n"
       +"  </td>\n"
       +" </tr>\n"
       +"</table>\n"
   jQuery("#<%=this.LoopBody.ClientID %>").val(eval("s"+v));
  }
  function checkform() {

      var classid = '';
      jQuery("#classid1 option:selected").each(function () {
          if (jQuery(this).val() != '0')
              if (classid == '')
                  classid = jQuery(this).val()
              else
                  classid += "," + jQuery(this).val();
      })
      if (classid == '') classid = '0';

      var autoarea = 0;
      if (jQuery('#<%=this.CkbArea.ClientID %>')[0].checked) autoarea = 1;


   var childclass=0;
   if (jQuery('#<%=this.ChildClass.ClientID %>')[0].checked) childclass=1;
   var haspic=0;
   if (jQuery('#<%=this.ShowPic.ClientID %>')[0].checked) haspic=1;
   var str='{KS:Label Type="Page"'
          + ' ChannelID="<%=this.ChannelID.SelectedValue %>"'
          + ' ClassID="' + classid + '"'
          + ' AutoArea="' + autoarea + '"'
          + ' ChildClass="' + childclass + '"'
          + ' Ajax="<%=this.PrintStyle.SelectedValue %>"'
          + ' PageStyle="'+jQuery('#<%=this.PageStyle.ClientID %>>option:selected').val()+'"'
          + ' HasPic="'+haspic+'"'
          + ' Order="'+jQuery('#<%=this.Order.ClientID %>>option:selected').val()+'"'
          + ' EmptyText="'+jQuery('#<%=this.EmptyText.ClientID %>').val()+'"'
          +'}'+jQuery('#<%=this.LoopBody.ClientID%>').val()+'{/KS:Label}';
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
{	setPos();
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
<KS:TopNav runat="server" Text="创建终级分页标签第一步" ID="TopNav1" />
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
                    <strong>所属栏目：</strong></td>
                <td id="Td6" runat="server" class="righttd" colspan="2" style="height: 30px; text-align: left">
                 <table border="0" cellpadding="0" cellspacing="0">
                     <tr>
                      <td><select name="classid1" id="classid1" multiple="multiple" size="3" style="width: 120px">
                      <option value="0">-不指定栏目-</option>
                      <option value="-1" style="color:red"<%=Utils.StrToInt(KSCMS.S("labelid")) == 0?" selected=true":""%>>当前栏目通用</option>
                       <%=MyCache.GetClassOptionList(modelid)%>
                      </select> 
                     </td>
                     <td>
                      <asp:CheckBox ID="ChildClass" runat="server" Checked="true" Text="允许列出子栏目信息" />
                    <asp:CheckBox ID="ShowPic" runat="server" Checked="true" Text="仅显示带图片" />
                     <asp:CheckBox ID="CkbArea" runat="server" Checked="true" Text="自动识别地区" /></td>
                     </tr>
                    </table>
                </td>
            </tr>


            <tr>
                <td class="lefttd" style="height: 30px; text-align: right">
                    <span style="background-color: #f0f9fe"></span><strong>分页样式：</strong></td>
                <td id="Td3" runat="server" class="righttd" colspan="2" style="height: 30px; text-align: left">
                    &nbsp;
                    <asp:DropDownList ID="PageStyle" runat="server">
                    </asp:DropDownList><strong>排序方式：</strong><asp:DropDownList ID="Order" runat="server">
                    <asp:ListItem Value="I.infoid desc">自动ID降序</asp:ListItem>
                    <asp:ListItem Value="I.infoid asc">自动ID升序</asp:ListItem>
                    <asp:ListItem Value="I.adddate desc">更新时间降序</asp:ListItem>
                    <asp:ListItem Value="I.adddate ast">更新时间升序</asp:ListItem>
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
                      </asp:DropDownList>
                   </td>
            </tr>
            <tr>
                <td class="lefttd" style="height: 30px; text-align: right">
                    <strong>栏目下没有信息时显示：</strong></td>
                <td id="Td4" runat="server" class="righttd" colspan="2" style="height: 30px; text-align: left">
                    &nbsp; <strong><asp:TextBox width="300px" CssClass="textbox" ID="EmptyText" runat="server">此栏目下没有任何信息！</asp:TextBox></strong></td>
            </tr>
                    <tr id="selectstyle" runat="server">
                        <td class="lefttd" style="height: 30px; text-align: right">
                            <strong>快速选择样式：</strong></td>
                        <td runat="server" class="righttd" colspan="2" style="height: 30px; text-align: left" id="Td5">
                        
                         <table border="0" width="100%">
                          <tr>
                           <td><img src="../../admin/images/view/1.gif"><input type="radio" value="1" name="loopstyle" onclick="setstyle(this.value)" checked>
                           </td>
                           <td><img src="../../admin/images/view/5.gif"><input type="radio" value="2" name="loopstyle" onclick="setstyle(this.value)">
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
                <td class="lefttd" style="height: 30px; text-align: right">
                    <strong>可用字段：</strong></td>
                <td class="righttd" colspan="2" style="height: 30px; text-align: left"><span id="fieldsarea"></span></td>
            </tr>
            <tr>
                <td class="lefttd" style="height: 30px; text-align: right">
                    <strong>样式循环体：</strong><br />
                    自动编号变量<font color=red>{$Auto(n)}</font><br />
                    n取值范围0-6之间,<a href='#' onclick="purview();return false"><font color=blue>预览</font></a>
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
                        <span style="color: #ff0000"> 1、Loop使用规则</span><br />
循环体格式：[loop times="n"]循环标签的内容[/loop]<br />
其中n表示循环次数，且n满足n>=0。loop为循环关键字，此循环体可以重复使用,但是不能嵌套。
                  <br />
                            <span style="color: #ff0000">2、字段标签规则说明</span><br />
                                格式：{$Field(FieldName,OutType,Len)}<br/>
FieldName  --数据库表的字段名称<br />
OutType    --输出格式，支持文本(text),日期(date),对象(url)<br />
Len        --输出长度
                   <br />
                     <span style="color: #ff0000">3、可以在循环体里要显示分页的地方放入标签：  [KS:PageStr]</span><br />   
                        


</td>
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

