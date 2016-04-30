<%@ Page Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.Admin_Label_BlogArticle" Title="�����б��ǩ" Codebehind="KS.Label.BlogArticle.aspx.cs" %>
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
   KesionJS.Alert('�������ǩ����!',"jQuery('#<%=this.LabelName.ClientID%>').focus();");
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

   var showType = jQuery("#<%=this.RdbShowType.ClientID %> :radio[checked]").val();

      var valuelist = "";
      if (jQuery('#<%=this.chkBest.ClientID %>').is(':checked')) {
          valuelist = "0";
      }
      if (jQuery('#<%=this.chkTop.ClientID %>').is(':checked')) {
          if (valuelist == "") {
              valuelist = "1";
          } else {
              valuelist += ",1";
          }
      }
      if (jQuery('#<%=this.chkHot.ClientID %>').is(':checked')) {
          if (valuelist == "") {
              valuelist = "2";
          } else {
              valuelist += ",2";
          }
      }

   var str='{KS:Label Type="blogArticlelist"'
          + ' ModelID="' + classid + '"'
          + ' ShowType="'+showType+'"'
          + ' Order="' + jQuery('#<%=this.Order.ClientID %>').val() + '"'
          + ' Num="' + jQuery('#<%=this.Num.ClientID %>').val() + '"'
          + ' Width="' + jQuery('#<%=this.TxtWidth.ClientID %>').val() + '"'
          + ' Height="' + jQuery('#<%=this.TxtHeight.ClientID %>').val() + '"'
          + ' Speed="' + jQuery('#<%=this.TxtSpeed.ClientID %>').val() + '"'
          + ' SQLCondition="' + jQuery('#<%=this.SQLCondition.ClientID %>').val() + '"'
          + ' Ajax="' + ajax + '"'
          + ' ExportBlog="' + jQuery('#<%=this.chkExportBlog.ClientID %>').is(':checked') + '"'
          + ' chkProperty="' + valuelist + '"'
          + '}' + jQuery('#<%=this.LoopBody.ClientID%>').val() + '{/KS:Label}';
   jQuery("#<%=this.LabelContent.ClientID %>").val(str);

  }
  function purview() {
      parent.openWin("�Զ���ű�����ʽԤ��", "../admin/include/autoid.html", false, 650, 230);
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
  //���뵽ѭ����
  function InsertValue(Val) {
      if (pos == null) { KesionJS.Alert( '���ȶ�λ����λ��!', null); return false; }
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
      if (pos == null) { KesionJS.Alert( '���ȶ�λ����λ��!', null); return false; }
      var link = "label/KS.GetFieldParam.aspx?m_fieldname=" + fieldname + "&fieldtype=" + fieldtype;
      parent.openWin('�����ֶα�ǩ', link, false, 300, 200);
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
      parent.openWin('�����ֶα�ǩ', link, false, 300, 200);
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
      var checkrad = jQuery("#<%=this.RdbShowType.ClientID %> :radio[checked]").val();
      if (checkrad == "0") {
          jQuery("#show0").show();
          jQuery("#show1").hide();
      } else {
          jQuery("#show0").hide();
          jQuery("#show1").show();
          if (checkrad == "1") {
              jQuery(".item").html("����");
              jQuery("#rolls").hide();
          } else {
              jQuery(".item").html("����");
              jQuery("#rolls").show();
          }
      }
  }
  jQuery(document).ready(function () {
      showType();
  });
</script>

<KS:TopNav runat="server" Text="���������б��ǩ" ID="TopNav1" />
    <table style="margin:6px" width="98%" align="center" cellpadding="1" cellspacing="1" class="CTable">
        <tr>
            <td class="lefttd" style="height: 30px; text-align: right">
                <strong>��ǩ���ƣ�</strong></td>
            <td runat="server" class="righttd" style="height: 30px; text-align: left">
                <span style="color: #000066">{KS_</span><asp:TextBox CssClass="noborder" ID="LabelName" runat="server" Width="126px"></asp:TextBox><span style="color: #000066"> } * ���ø�ʽ��{KS_��ǩ����}</span><asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="LabelName"
                    Display="Dynamic" ErrorMessage="��ǩ���Ʊ�������"></asp:RequiredFieldValidator></td>
        </tr>
    <tr>
     <td class="lefttd" style="text-align: right; height: 30px;">
         <strong>��ǩĿ¼��</strong></td>
     <td class="righttd" style="text-align: left; height: 30px;"><span  id="classidarea" runat="server"></span><font color=red> ��ѡ���ǩ����Ŀ¼���Ա��պ�����ǩ</font></td>
    </tr>
    </table>
        <table style="margin:6px" width="98%" align="center" cellpadding="1" cellspacing="1" class="CTable">
         <tr>
            <td align="right" class="lefttd" height="30">
                <strong>��Ŀ���ƣ�</strong></td>
            <td class="righttd">
                <table border="0" width="100%" cellpadding="0" cellspacing="0">
                 <tr>
                  <td valign="top" width="280">
                    <table border="0" cellpadding="0" cellspacing="0">
                      <tr>
                       <td><asp:ListBox ID="LstClassID" runat="server" SelectionMode="Multiple">
                </asp:ListBox></td>
                       <td valign="top" style="padding:4px">���ͬʱҪ���ö��<br />��ĿƵ���µ����ӣ����԰�����<br />��<font color=red>Ctrl</font>����ѡ��</td>
                      </tr>
                    </table>
                </td>
                <td style="display:none;">
                �Ƿ�AJAX�����  <asp:CheckBox runat="server" ID="ChkAjax" Text="AJAX���" />
                </td>
                 </tr>
                </table>
             
              </td>
        </tr>
        
        <tr>
                <td class="lefttd" style="height: 30px; text-align: right">
                    <span style="background-color: #f0f9fe"></span><strong>��ѯ������</strong></td>
                <td id="Td3" runat="server" class="righttd" colspan="2" style="height: 30px; text-align: left">
                    <asp:TextBox style="text-align:center" CssClass="textbox" ID="Num" runat="server" Width="41px">10</asp:TextBox>��&nbsp;
                    <strong>����ʽ��</strong><asp:DropDownList ID="Order" runat="server">
                    <asp:ListItem Value="BlogID desc">����ID����</asp:ListItem>
                    <asp:ListItem Value="BlogID asc">����ID����</asp:ListItem>
                    <asp:ListItem Value="AddDate desc">����ʱ�併��</asp:ListItem>
                    <asp:ListItem Value="AddDate asc">����ʱ������</asp:ListItem>
                      </asp:DropDownList>
                    �Ƿ���������Ϳռ䣺  <asp:CheckBox runat="server" ID="chkExportBlog" Text="��������Ϳռ�" />
                       <strong style="display:none;">��ʾ��ʽ��</strong>
                 <asp:RadioButtonList ID="RdbShowType" runat="server" RepeatLayout="Flow" RepeatDirection="Horizontal" style="display:none;">
                        <asp:ListItem Selected="True" Value="0">��ͨ���</asp:ListItem>
                        <asp:ListItem Value="1">��������</asp:ListItem>
                    </asp:RadioButtonList>

                      <span style="display:none">
                SQL����������<asp:TextBox ID="SQLCondition" CssClass="textbox" runat="server" Width="150px"></asp:TextBox> �����գ���: and Inputer='admin'
                </span>
                </td>
            </tr>
            <tr>
                <td class="lefttd" style="height: 30px; text-align: right">
                    <span style="background-color: #f0f9fe"></span><strong>�������ԣ�</strong></td>
                <td id="Td1" runat="server" class="righttd" colspan="2" style="height: 30px; text-align: left">
                        <input type="checkbox" runat="server" id="chkBest" value="0" />�Ƽ�&nbsp;&nbsp;
                        <input type="checkbox" runat="server" id="chkTop" value="1" />�ö�&nbsp;&nbsp;
                        <input type="checkbox" runat="server" id="chkHot" value="2" />����
                </td>
            </tr>
            <tbody id="show1">
            <tr>
            <td align="right" class="lefttd" height="30">
                <strong><span class="item"></span>��ȣ�</strong></td>
            <td class="righttd">
                <asp:TextBox ID="TxtWidth" Text="500" CssClass="textbox" runat="server" Width="50" style="text-align:center"></asp:TextBox> px
              &nbsp;&nbsp;<strong><span class="item"></span>�߶ȣ�</strong>
                <asp:TextBox ID="TxtHeight" Text="500" CssClass="textbox" runat="server" Width="50" style="text-align:center"></asp:TextBox> px
                &nbsp;&nbsp;
                <span id="rolls">
               <strong><span class="item"></span>�ٶȣ�</strong><asp:TextBox Text="1" ID="TxtSpeed" CssClass="textbox" runat="server" Width="50" style="text-align:center"></asp:TextBox>
               </span>
              </td>
        </tr>
            </tbody>
            <tbody id="show0">
            <tr>
                <td class="lefttd" style="height: 30px; text-align: right">
                    <strong>�����ֶΣ�       <td class="righttd" colspan="2" style="height: 30px; text-align: left">
                
                
                <table width="95%" cellspacing="0" cellpadding="0" border="0">
                <tr>
                <td align="center"><div onclick="InsertValue('{KS:Field:BlogArticleUrl}');" class="field" style="cursor:pointer">����(URL)</div></td>
                <td align="center"><div onclick=InsertValue('{KS:Field:ID}'); title="����ID" class="field" style="cursor:pointer">����ID</div></td>
                <td align="center"><div onmousedown="DragStart()" id="Title" fieldtype="0" onclick="InsertLabel(this.id,this.fieldtype)" class="field" style="cursor:pointer">���ı���</div></td>
                <td align="center"><div onmousedown="DragStart()" id="AddDate" fieldtype="0" onclick="InsertLabel(this.id,this.fieldtype)" class="field" style="cursor:pointer">����ʱ��</div></td>
                <td align="center"><div onmousedown="DragStart()" id="Author" fieldtype="0" onclick="InsertLabel(this.id,this.fieldtype)" class="field" style="cursor:pointer">��������</div></td>
                <td align="center"><div onmousedown="DragStart()" id="Content" fieldtype="0" onclick="InsertLabel(this.id,this.fieldtype)" class="field" style="cursor:pointer">��������</div></td>
                <td align="center" style="display:none;"><div onclick=InsertValue('{KS:Field:BlogArticleNewIco}'); title="����Newͼ��" class="field" style="cursor:pointer">Newͼ��</div></td>
                </tr>
               
               </table>
                
                
                </td>
            </tr>
            
            <tr>
                <td class="lefttd" style="height: 30px; text-align: right">
                    <strong>��ʽѭ���壺</strong><br />
                    �Զ���ű���<font color=red>{$Auto(n)}</font><br />
                    nȡֵ��Χ0-6֮��,<a href='#' onclick="purview();return false;"><font color=blue>Ԥ��</font></a>
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
                            <strong>��Ҫ������</strong></td>
                        <td runat="server" class="righttd" colspan="2" style="height: 30px; text-align: left" id="Td8">
                           <span style="color: #6666ff">1��Loopʹ�ù���</span><br />
ѭ�����ʽ��[loop times="n"]ѭ����ǩ������[/loop]<br />
����n��ʾѭ����������n����n>=0��loopΪѭ���ؼ��֣���ѭ��������ظ�ʹ��,���ǲ���Ƕ�ס� <br />
                            <span style="color: #6666ff">2���ֶα�ǩ����˵��</span><br />
                                ��ʽ��{$Field(FieldName,OutType,Len)}<br/>
FieldName  --���ݿ����ֶ�����<br />
OutType    --�����ʽ��֧���ı�(text),����(date),����(url)<br />
Len        --�������<br />

</td>
                    </tr>
            </tbody>
      </table>


      <div class="message">
     <strong>˵����</strong>
     ��ǩ��������Ϊ����ʱ����������ÿ��ֻ����һ����
     </div>


     <div style="text-align:center">
     
     <KS:Foot ID="Foot1" runat="server" OnSubmit="Button1_Click"  />
     
       <asp:TextBox ID="LabelContent" runat="server" Height="87px" TextMode="MultiLine" Width="445px"></asp:TextBox>
     
     </div>




</asp:Content>

