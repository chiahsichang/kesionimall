<%@ Page Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.Admin_Label_SpecialClass" Title="专题分类列表标签" Codebehind="KS.Label.SpecialClassList.aspx.cs" %>
<%@ Register Src="~/control/LabelJS.ascx" TagName="LabelJS" TagPrefix="uc1" %>
<%@ Import Namespace="Kesion.Cache"%>
<%@ Import Namespace="Kesion.BLL"%>

<asp:Content ID="Content1" ContentPlaceHolderID="KSContent" Runat="Server">
<uc1:LabelJS ID="LabelJS1" runat="server"/>

<script type="text/javascript">
  function checkform()
  {
   if (jQuery("#<%=this.LabelName.ClientID%>").val()=="")
   {
   KesionJS.Alert('请输入标签名称!',"jQuery('#<%=this.LabelName.ClientID%>').focus();");
   return false;
   }
   

   var ajax = 0;
   if (jQuery("#<%=this.ChkAjax.ClientID %>")[0].checked) ajax = 1;
 

   var str = '{KS:Label Type="specialclasslist"'
          + ' Ajax="'+ajax+'"'
          + '}' + jQuery('#<%=this.LoopBody.ClientID%>').val() + '{/KS:Label}';
   jQuery("#<%=this.LabelContent.ClientID %>").val(str);

  }
  function purview() {
      parent.openWin("自动编号变量样式预览", "../admin/include/autoid.html", false, 650, 230);
  }

  var pos = null;
  function setPos() {
      if (document.all) {
          jQuery("#<%=this.LoopBody.ClientID %>").focus();
          pos = document.selection.createRange();
      } else {
          pos = jQuery("#<%=this.LoopBody.ClientID %>")[0].selectionStart;
      }
  }
  //插入到循环体
  function InsertValue(Val) {
      if (pos == null) { KesionJS.Alert( '请先定位插入位置!', null); return false; }
      if (document.all) {
          pos.text = Val;
      } else {
          var obj = jQuery("#<%=this.LoopBody.ClientID %>");
          var lstr = obj.val().substring(0, pos);
          var rstr = obj.val().substring(pos);
          obj.val(lstr + Val + rstr);
      }
  }

  function InsertLabel(fieldname, fieldtype) {
      dragclear();
      if (pos == null) { KesionJS.Alert( '请先定位插入位置!', null); return false; }
      var link = "label/KS.GetFieldParam.aspx?m_fieldname=" + fieldname + "&fieldtype=" + fieldtype;
      parent.openWin('插入字段标签', link, false, 420, 250);
  }


  var fieldname, fieldtype;
  function DragStart() {
      dragclear();
      window.drag = 1;
      dragspan = document.createElement('div');
      dragspan.style.position = "absolute";
      dragspan.className = "div";
      var mousePos = mouseCoords(window.event);
      dragspan.style.left = mousePos.x + 10;
      dragspan.style.top = mousePos.y + 8;
      fieldname = window.event.srcElement.id;
      fieldtype = window.event.srcElement.fieldtype;
      dragspan.appendChild(document.createTextNode(window.event.srcElement.innerHTML));
      document.body.appendChild(dragspan);
  }
  function SetValue() {
      setPos();
      var link = "label/KS.GetFieldParam.aspx?m_fieldname=" + fieldname + "&fieldtype=" + fieldtype;
      parent.openWin('插入字段标签', link, false, 420, 250);
      if (window.drag) {
          window.drag = 0;
          window.event.returnValue = true;
      }

  }
  function dragend() {
      if (window.drag) {
          document.body.removeChild(dragspan);
          SetValue();
      }
  }
  function mouseCoords(ev) {
      if (ev.pageX || ev.pageY) {
          return { x: ev.pageX, y: ev.pageY };
      }
      return {
          x: ev.clientX + document.documentElement.scrollLeft - document.body.clientLeft,
          y: ev.clientY + document.documentElement.scrollTop - document.body.clientTop
      };
  }
  function dragclear() {
      if (window.drag) {
          document.body.removeChild(dragspan);
          window.drag = 0;
          window.event.returnValue = true;
      }

  }
  function dragmove() {
      if (window.drag) {
          var ev = ev || window.event;
          var mousePos = mouseCoords(ev);
          ev.returnValue = false;
          dragspan.style.left = mousePos.x + 10;
          dragspan.style.top = mousePos.y + 8;
      }
  }
  function movePoint() {
      if (window.drag) {
          var rng = event.srcElement.createTextRange();
          rng.moveToPoint(event.x, event.y);
          rng.select();
      }
  }
</script>

<KS:TopNav runat="server" Text="创建专题分类列表标签" ID="TopNav1" />
    <table style="margin:6px" width="98%" align="center" cellpadding="1" cellspacing="1" class="CTable">
        <tr>
            <td class="lefttd" style="height: 30px; text-align: right">
                <strong>标签名称：</strong></td>
            <td runat="server" class="righttd" style="height: 30px; text-align: left">
                <span style="color: #000066">{KS_</span><asp:TextBox CssClass="noborder" ID="LabelName" runat="server" Width="126px"></asp:TextBox><span style="color: #000066"> } * 调用格式：{KS_标签名称}</span><asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="LabelName"
                    Display="Dynamic" ErrorMessage="标签名称必须输入"></asp:RequiredFieldValidator></td>
        </tr>
    <tr>
     <td class="lefttd" style="text-align: right; height: 30px;">
         <strong>标签目录：</strong></td>
     <td class="righttd" style="text-align: left; height: 30px;"><span  id="classidarea" runat="server"></span><font color=red> 请选择标签所属目录，以便日后管理标签</font></td>
    </tr>
    </table>
        <table style="margin:6px" width="98%" align="center" cellpadding="1" cellspacing="1" class="CTable">
        <tr>
            <td class="lefttd" style="height: 30px; text-align: right">
               <strong>是否AJAX输出：</strong></td>
            <td runat="server" class="righttd"  style="height: 30px; text-align: left">
             <asp:CheckBox runat="server" ID="ChkAjax" Text="AJAX输出" /></td>
        </tr>

            
            <tr>
                <td class="lefttd" style="height: 30px; text-align: right">
                    <strong>可用字段： 
                    <td class="righttd" colspan="2" style="height: 30px; text-align: left">
                
                
                <table width="95%" cellspacing="0" cellpadding="0" border="0">
                <tr>
                <td align="center"><div  onclick="InsertValue('{KS:Field:ClassID}')" class="field" style="cursor:pointer">专题分类ID</div></td>
                <td align="center"><div  onclick="InsertValue('{KS:Field:SpecialClassUrl}')" class="field" style="cursor:pointer">专题分类URL</div></td>
                <td align="center"><div onmousedown="DragStart()" id="ClassName" fieldtype="0" onclick="InsertLabel(this.id,this.fieldtype)" class="field" style="cursor:pointer">专题分类名称</div></td>
                <td align="center"><div onmousedown="DragStart()" id="AddDate" fieldtype="0" onclick="InsertLabel(this.id,this.fieldtype)" class="field" style="cursor:pointer">分类创建时间</div></td>
                <td align="center"><div onmousedown="DragStart()" id="PhotoUrl" fieldtype="0" onclick="InsertLabel(this.id,this.fieldtype)" class="field" style="cursor:pointer">分类图片地址</div></td>
                </tr>
                <tr>
                <td align="center"><div onmousedown="DragStart()" id="Descript" fieldtype="0" onclick="InsertLabel(this.id,this.fieldtype)" class="field" style="cursor:pointer">分类介绍</div></td>
                <td align="center"><div onclick="InsertValue('{KS:Field:SpecialClassCurrentCss}')" class="field" style="cursor:pointer">当前分类CSS</div></td>
                </tr>
               </table>
                
                
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
     
     <KS:Foot ID="Foot1" runat="server" OnSubmit="Button1_Click"  />
     
       <asp:TextBox ID="LabelContent" runat="server" Height="87px" TextMode="MultiLine" Width="445px"></asp:TextBox>
     
     </div>


</asp:Content>

