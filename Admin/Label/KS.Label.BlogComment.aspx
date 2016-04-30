<%@ Page Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.Admin_Label_BlogComment" Title="空间评论标签" Codebehind="KS.Label.BlogComment.aspx.cs" %>
<%@ Register Src="~/control/LabelJS.ascx" TagName="LabelJS" TagPrefix="uc1" %>
<%@ Import Namespace="Kesion.Cache"%>
<%@ Import Namespace="Kesion.BLL"%>

<asp:Content ID="Content1" ContentPlaceHolderID="KSContent" Runat="Server">
<uc1:LabelJS ID="LabelJS1" runat="server"/>

<script type="text/javascript">
    function selectclassid(v) {
        var va = v.split(',');
        for (var i = 0; i < jQuery("#<%=this.LstClassID.ClientID %>")[0].options.length; i++) {
            for (var n = 0; n < va.length; n++) {
                if (va[n] == jQuery("#<%=this.LstClassID.ClientID %>")[0].options[i].value) {
                    jQuery("#<%=this.LstClassID.ClientID %>")[0].options[i].selected = true;
                }
            }
        }
    }
  function checkform()
  {
   if (jQuery("#<%=this.LabelName.ClientID%>").val()=="")
   {
   KesionJS.Alert('请输入标签名称!',"jQuery('#<%=this.LabelName.ClientID%>').focus();");
   return false;
   }
   

   var ajax = 0;
   if (jQuery("#<%=this.ChkAjax.ClientID %>")[0].checked) ajax = 1;
   
   var classid='';
   jQuery("#<%=this.LstClassID.ClientID %> option:selected").each(function() {
		if (jQuery(this).val()!='0')
			if (classid=='') 
				 classid=jQuery(this).val() 
			else
				 classid+=","+jQuery(this).val();
		})
   if (classid=='') classid='0';

   var showType = jQuery("#<%=this.rdoRange.ClientID %> :radio[checked]").val();

   
   var str='{KS:Label Type="blogCommentlist"'
          + ' ModelID="' + classid + '"'
          + ' ShowType="'+showType+'"'
          + ' Order="' + jQuery('#<%=this.Order.ClientID %>').val() + '"'
          + ' Num="' + jQuery('#<%=this.Num.ClientID %>').val() + '"'
          + ' Width="' + jQuery('#<%=this.TxtWidth.ClientID %>').val() + '"'
          + ' Height="' + jQuery('#<%=this.TxtHeight.ClientID %>').val() + '"'
          + ' Speed="' + jQuery('#<%=this.TxtSpeed.ClientID %>').val() + '"'
          + ' Ajax="' + ajax + '"'
          + ' ExportBlog="' + jQuery('#<%=this.chkExportBlog.ClientID %>').is(':checked') + '"'
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
      parent.openWin('插入字段标签', link, false, 300, 200);
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
      parent.openWin('插入字段标签', link, false, 300, 200);
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
  function showType() {
      
      //var checkrad = jQuery("#<%=this.rdoRange.ClientID %> :radio[checked]").val();
      //if (checkrad == "0") {
      //    jQuery("#show0").show();
      //    jQuery("#show1").hide();
      //} else {
       //   jQuery("#show0").hide();
       //   jQuery("#show1").show();
       //   if (checkrad == "1") {
       //       jQuery(".item").html("弹窗");
        //      jQuery("#rolls").hide();
        //  } else {
        //      jQuery(".item").html("滚动");
       //       jQuery("#rolls").show();
        //  }
      //}
     
  }
  jQuery(document).ready(function () {
      showType();
  });
</script>

<KS:TopNav runat="server" Text="创建空间评论标签" ID="TopNav1" />
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
            <td align="right" class="lefttd" height="30">
                <strong>栏目限制：</strong></td>
            <td class="righttd">
                <table border="0" width="100%" cellpadding="0" cellspacing="0">
                 <tr>
                  <td valign="top" width="280">
                    <table border="0" cellpadding="0" cellspacing="0">
                      <tr>
                       <td><asp:ListBox ID="LstClassID" runat="server" SelectionMode="Multiple">
                </asp:ListBox></td>
                       <td valign="top" style="padding:4px">如果同时要调用多个<br />频道下的链接，可以按键盘<br />的<font color=red>Ctrl</font>键多选。</td>
                      </tr>
                    </table>
                </td>
                <td style="display:none;">
                是否AJAX输出：  <asp:CheckBox runat="server" ID="ChkAjax" Text="AJAX输出" />
                </td>
                 </tr>
                </table>
             
              </td>
        </tr>
        
        <tr>
                <td class="lefttd" style="height: 30px; text-align: right">
                    <span style="background-color: #f0f9fe"></span><strong>查询条数：</strong></td>
                <td id="Td3" runat="server" class="righttd" colspan="2" style="height: 30px; text-align: left">
                    <asp:TextBox style="text-align:center" CssClass="textbox" ID="Num" runat="server" Width="41px">8</asp:TextBox>条&nbsp;
                    <strong>排序方式：</strong><asp:DropDownList ID="Order" runat="server">
                    <asp:ListItem Value="ID desc">评论ID降序</asp:ListItem>
                    <asp:ListItem Value="ID asc">评论ID升序</asp:ListItem>
                    <asp:ListItem Value="AddTime desc">更新时间降序</asp:ListItem>
                    <asp:ListItem Value="AddTimes asc">更新时间升序</asp:ListItem>
                      </asp:DropDownList>

                       <strong style="display:none;">评论内容：</strong>
                 <asp:RadioButtonList ID="rdoRange2" runat="server" RepeatLayout="Flow" RepeatDirection="Horizontal" style="display:none;">
                        <asp:ListItem Selected="True" Value="0">所有评论</asp:ListItem>
                        <asp:ListItem Value="1">博文评论</asp:ListItem>
                        <asp:ListItem Value="2">相册评论</asp:ListItem>
                        
                    </asp:RadioButtonList>
                     是否输出到博客空间：  <asp:CheckBox runat="server" ID="chkExportBlog" Text="输出到博客空间" />
                </td>

            </tr>

            <tr>
                <td class="lefttd" style="height: 30px; text-align: right">
                    <span style="background-color: #f0f9fe"></span><strong>评论内容：</strong></td>
                <td id="Td1" runat="server" class="righttd" colspan="2" style="height: 30px; text-align: left">

                 <asp:RadioButtonList ID="rdoRange" runat="server" RepeatLayout="Flow" RepeatDirection="Horizontal">
                        <asp:ListItem Selected="True" Value="0">所有评论</asp:ListItem>
                        <asp:ListItem Value="1">博文评论</asp:ListItem>
                        <asp:ListItem Value="2">相册评论</asp:ListItem>
                        
                    </asp:RadioButtonList>

                </td>
            </tr>
            
            <tbody id="show1">
            <tr style="display:none;">
            <td align="right" class="lefttd" height="30">
                <strong><span class="item"></span>宽度：</strong></td>
            <td class="righttd">
                <asp:TextBox ID="TxtWidth" Text="500" CssClass="textbox" runat="server" Width="50" style="text-align:center"></asp:TextBox> px
              &nbsp;&nbsp;<strong><span class="item"></span>高度：</strong>
                <asp:TextBox ID="TxtHeight" Text="500" CssClass="textbox" runat="server" Width="50" style="text-align:center"></asp:TextBox> px
                &nbsp;&nbsp;
                <span id="rolls">
               <strong><span class="item"></span>速度：</strong><asp:TextBox Text="1" ID="TxtSpeed" CssClass="textbox" runat="server" Width="50" style="text-align:center"></asp:TextBox>
               </span>
              </td>
        </tr>
            </tbody>
            <tbody id="show0">
            <tr>
                <td class="lefttd" style="height: 30px; text-align: right">
                    <strong>可用字段：       <td class="righttd" colspan="2" style="height: 30px; text-align: left">
                
                
                <table width="95%" cellspacing="0" cellpadding="0" border="0">
                <tr>
                    <td align="center"><div onclick="InsertValue('{KS:Field:BlogCommentUrl}');" class="field" style="cursor:pointer">评论(URL)</div></td>
                    <td align="center"><div onclick=InsertValue('{KS:Field:LogID}'); title="评论ID" class="field" style="cursor:pointer">评论文章ID</div></td>
                    <td align="center"><div onmousedown="DragStart()" id="AddTime" fieldtype="0" onclick="InsertLabel(this.id,this.fieldtype)" class="field" style="cursor:pointer">评论时间</div></td>
                    <td align="center"><div onclick=InsertValue('{KS:Field:AnounName}'); title="评论照片" class="field" style="cursor:pointer">评论用户</div></td>

                    <td align="center"><div onmousedown="DragStart()" id="Content" fieldtype="0" onclick="InsertLabel(this.id,this.fieldtype)" class="field" style="cursor:pointer">评论内容</div></td>
                    <td align="center"><div onmousedown="DragStart()" id="Title" fieldtype="0" onclick="InsertLabel(this.id,this.fieldtype)" class="field" style="cursor:pointer">评论标题</div></td>

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
                    <asp:TextBox ID="LoopBody" Height="150px" Text="textbox textarea" onmouseup="dragend()" onmousemove="movePoint()" onclick='setPos()' onkeyup='setPos()' runat="server" Rows="6" TextMode="MultiLine" Width="92%"></asp:TextBox>
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
Len        --输出长度<br />

</td>
                    </tr>
            </tbody>
      </table>


      <div class="message">
     <strong>说明：</strong>
     标签类型设置为弹窗时，建议设置每次只弹出一条。
     </div>


     <div style="text-align:center">
     
     <KS:Foot ID="Foot1" runat="server" OnSubmit="Button1_Click"  />
     
       <asp:TextBox ID="LabelContent" runat="server" Height="87px" TextMode="MultiLine" Width="445px"></asp:TextBox>
     
     </div>




</asp:Content>

