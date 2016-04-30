<%@ Page Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.Admin_Label_Class" Title="��Ŀ�б��ǩ" Codebehind="KS.Label.Class.aspx.cs" %>
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
   KesionJS.Alert('�������ǩ����!',"jQuery('#<%=this.LabelName.ClientID%>').focus();");
   return false;
   }
   

   var ajax = 0;
   if (jQuery("#<%=this.ChkAjax.ClientID %>")[0].checked) ajax = 1;
   
   var classid='';
	jQuery("#classid1 option:selected").each(function(){
		if (jQuery(this).val()!='0')
			if (classid=='') 
				 classid=jQuery(this).val() 
			else
				 classid+=","+jQuery(this).val();
		})
   if (classid=='') classid='0';

   var str = '{KS:Label Type="classlist" ModelType="<%=this.RdbModelType.SelectedValue %>"'
          + ' ClassID="' + classid + '"'
          + ' Single="' + $("#<%=this.CkbSingle.ClientID%>").prop("checked")+'"'
          + ' Ajax="'+ajax+'"'
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
      parent.openWin('�����ֶα�ǩ', link, false, 420, 250);
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
      parent.openWin('�����ֶα�ǩ', link, false, 420, 250);
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

<KS:TopNav runat="server" Text="������Ŀ�����б��ǩ" ID="TopNav1" />
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
            <td class="lefttd" style="height: 30px; text-align: right">
               <strong>ѡ��ģ�ͣ�</strong></td>
            <td runat="server" class="righttd"  style="height: 30px; text-align: left">
                <asp:RadioButtonList ID="RdbModelType" runat="server" 
                    RepeatDirection="Horizontal" RepeatLayout="Flow" 
                    onselectedindexchanged="RdbModelType_SelectedIndexChanged" AutoPostBack="true">
                 <asp:ListItem Value="0" Selected>����ģ��</asp:ListItem>
                 <asp:ListItem Value="1">����ģ��</asp:ListItem>
                </asp:RadioButtonList>     </td>
            <td class="righttd">
             <strong>�Ƿ�AJAX�����</strong><asp:CheckBox runat="server" ID="ChkAjax" Text="AJAX���" /></td>
        </tr>
            <tr>
                <td class="lefttd" style="height: 30px; text-align: right">
                    <strong>������Ŀ��</strong></td>
                <td runat="server" class="righttd" colspan="2" style="height: 30px; text-align: left">
                
                 <table border="0" cellpadding="0" cellspacing="0">
                     <tr>
                      <td><select name="classid1" id="classid1" multiple="multiple" size="3" style='height:120px;width:350px'>
                      <option value="0">-��վ����-</option>
                      <option value="-1" style="color:red">��ǰ��Ŀͨ��</option>
                      <option value="-2" style="color:blue">ͬ����Ŀ����</option>
                       <%=classOption%>
                      </select> 
                     </td>
                      <td>
                      <strong>&nbsp;��Ctrl���Զ�ѡ����ѡʱ�� ��ֱ�������ѡ����Ŀ��ѡ����վ����ʱ������ģ�����ơ�</strong>

                           <br />&nbsp;<font color=blue>��Ҫ���ö����Ŀ�����԰�Ctrl���ж�ѡ</font>
					  <br/>
                     <asp:CheckBox ID="CkbSingle" runat="server" Text="������ѡ�е���Ŀ" /><br />
					  <a href="javascript:;" onclick="$('#classid1').height($('#classid1').height()*2);" style="font-weight:bold;color:green;">+����</a>
</td>

                      <td>&nbsp;
                       </td>
                      <td>&nbsp;</td>
                     </tr>
                    </table>
                </td>
            </tr>
            
            <tr>
                <td class="lefttd" style="height: 30px; text-align: right">
                    <strong>�����ֶΣ�       <td class="righttd" colspan="2" style="height: 30px; text-align: left">
                
                
                <table width="95%" cellspacing="0" cellpadding="0" border="0">
                <tr>
                <td align="center">
                <div  onclick="InsertValue('{KS:Field:ClassID}')" class="field" style="cursor:pointer">��ĿID</div></td>
                <td align="center"><div onmousedown="DragStart()" id="ClassID" fieldtype="1" onclick="InsertLabel(this.id,this.fieldtype)" class="field" style="cursor:pointer">��ĿID(URL)</div></td>
                <td align="center"><div onmousedown="DragStart()" id="ClassName" fieldtype="0" onclick="InsertLabel(this.id,this.fieldtype)" class="field" style="cursor:pointer">��Ŀ����</div></td>
                <td align="center"><div onmousedown="DragStart()" id="AddDate" fieldtype="0" onclick="InsertLabel(this.id,this.fieldtype)" class="field" style="cursor:pointer">��Ŀ����ʱ��</div></td>
                <td align="center"><div onclick="InsertValue('{KS:Field:ClassImgSrc}')" class="field" style="cursor:pointer">��ĿͼƬ��ַ</div></td>
                </tr>
                <tr>
                <td align="center"><div onclick="InsertValue('{KS:Field:ClassIntro}')" class="field" style="cursor:pointer">��Ŀ����</div></td>
                <td align="center"><div onclick="InsertValue('{KS:Field:ChannelID}')" class="field" style="cursor:pointer">��Ŀ����ģ��ID</div></td>
                <td align="center"><div onclick="InsertValue('{KS:Field:ParentID}')" class="field" style="cursor:pointer">��Ŀ����ĿID</div></td>
                <td align="center"><div onclick="InsertValue('{KS:Field:CurrentCss}')" class="field" style="cursor:pointer">��ǰ��ĿCSS</div></td>
                <td align="center"><div onclick="InsertValue('{KS:Field:InfoNum}')" class="field" style="cursor:pointer">��Ŀ���ĵ���</div></td>
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
Len        --�������</td>
                    </tr>
            
      </table>
     <div style="text-align:center">
     
     <KS:Foot ID="Foot1" runat="server" OnSubmit="Button1_Click"  />
     
       <asp:TextBox ID="LabelContent" runat="server" Height="87px" TextMode="MultiLine" Width="445px"></asp:TextBox>
     
     </div>


</asp:Content>

