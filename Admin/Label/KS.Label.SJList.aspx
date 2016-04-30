<%@ Page Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.Admin_Label_SJList" Title="�Ծ��б��ǩ" Codebehind="KS.Label.SJList.aspx.cs" %>
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


   var recommends = 0;
   if (jQuery("#<%=this.Attribute.ClientID %>_0")[0].checked)
       recommends = 1;
   var popular = 0;
   if (jQuery("#<%=this.Attribute.ClientID %>_1")[0].checked)
       popular = 1;
   var istop = 0;
   if (jQuery("#<%=this.Attribute.ClientID %>_2")[0].checked)
       istop = 1;
   var comment = 0;
   if (jQuery("#<%=this.Attribute.ClientID %>_3")[0].checked)
       comment = 1;
   var istjda = 0;
   if (jQuery("#<%=this.Attribute.ClientID %>_4")[0].checked)
       istjda = 1;


   
   var str='{KS:Label Type="sjlist"'
          + ' ClassID="' + classid + '"'
          + ' Recommend="' + recommends + '"'
          + ' popular="' + popular + '"'
          + ' istop="' + istop + '"'
          + ' comment="'+comment+'"'
          + ' istjda="'+istjda+ '"'
          + ' Order="' + jQuery('#<%=this.Order.ClientID %>').val() + '"'
          + ' Num="' + jQuery('#<%=this.Num.ClientID %>').val() + '"'
          + ' SQLCondition="' + jQuery('#<%=this.SQLCondition.ClientID %>').val() + '"'
          + ' Ajax="' + ajax + '" TypeID="' + jQuery("#<%=this.DrpSJTypeID.ClientID%> option:selected").val() + '"'
          + ' ProvinceID="' + jQuery("#<%=this.DrpProvince.ClientID %> option:selected").val() + '"'
          + ' Dtfs="'+jQuery("#<%=this.drpDtfs.ClientID %> option:selected").val()+'"'
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

<KS:TopNav runat="server" Text="�����Ծ��б��ǩ" ID="TopNav1" />
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
                <strong>�Ƿ�AJAX�����</strong></td>
            <td runat="server" class="righttd"  style="height: 30px; text-align: left">
                    <asp:CheckBox runat="server" ID="ChkAjax" Text="AJAX���" />
                    
                    <% if (MyCache.GetSJCacheConfig(4) == "1")
                             { %><span></span>
                <%}else{ %><span style="display:none"><%} %>�Ծ����
              <asp:DropDownList ID="DrpSJTypeID" runat="server">
               <asp:ListItem Value="0">--ѡ���Ծ����--</asp:ListItem>
              </asp:DropDownList>
              �ɲ�ѡ</span>
              <% if (MyCache.GetSJCacheConfig(3) == "1")
                             { %><span></span>
                <%}else{ %><span style="display:none"><%} %>
              �Ծ������
               <asp:DropDownList ID="DrpProvince" runat="server">
                <asp:ListItem Value="0">--ѡ��ʡ��--</asp:ListItem>
               </asp:DropDownList> 
               �ɲ�ѡ</span>
                    </td>
            <td class="righttd">&nbsp;
                </td>
        </tr>
<tr>
            <td align="right" class="lefttd" height="30">
                <strong>�Ծ���ࣺ</strong></td>
            <td class="righttd">
                &nbsp;<table border="0" width="100%" cellpadding="0" cellspacing="0">
                 <tr>
                  <td valign="top" width="280">
                    <table border="0" cellpadding="0" cellspacing="0">
                      <tr>
                       <td><asp:ListBox ID="LstClassID" runat="server" SelectionMode="Multiple">
                <asp:ListItem Value="0">--�Ծ���಻��--</asp:ListItem>
                </asp:ListBox></td>
                       <td valign="top" style="padding:4px">���ͬʱҪ���ö��<br />�����µ��Ծ����԰�����<br />��<font color=red>Ctrl</font>����ѡ��</td>
                      </tr>
                    </table>
                </td>
                <td>
                
                <strong>�Ծ����ƣ�</strong>
                <asp:DropDownList ID="drpDtfs" runat="server">
                 <asp:ListItem Value="0"> ���� </asp:ListItem>
                 <asp:ListItem Value="1">�������</asp:ListItem>
                 <asp:ListItem Value="2">������</asp:ListItem>
                </asp:DropDownList> 
                <br />
                <strong>�������ƣ�</strong><br />
                <asp:CheckBoxList ID="Attribute" runat="server" RepeatDirection="Horizontal">
                        <asp:ListItem Value="1">�Ƽ�</asp:ListItem>
                        <asp:ListItem Value="2">����</asp:ListItem>
                        <asp:ListItem Value="3">�̶�</asp:ListItem>
                        <asp:ListItem Value="4">�������ĵ�</asp:ListItem>
                        <asp:ListItem Value="5">�����ύ����</asp:ListItem>
                    </asp:CheckBoxList>
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
                    <asp:ListItem Value="ID desc">�Ծ�ID����</asp:ListItem>
                    <asp:ListItem Value="ID asc">�Ծ�ID����</asp:ListItem>
                    <asp:ListItem Value="adddate desc">����ʱ�併��</asp:ListItem>
                    <asp:ListItem Value="adddate asc">����ʱ������</asp:ListItem>
                    <asp:ListItem Value="hits desc">���������</asp:ListItem>
                    <asp:ListItem Value="hits asc">���������</asp:ListItem>
                    <asp:ListItem Value="testhits desc">������������</asp:ListItem>
                    <asp:ListItem Value="testhits asc">������������</asp:ListItem>
                     <asp:ListItem Value="newid()">�����ʾ</asp:ListItem>
                      </asp:DropDownList>
                SQL����������<asp:TextBox ID="SQLCondition" CssClass="textbox" runat="server" Width="150px"></asp:TextBox> �����գ���: and Inputer='admin'
                </td>
            </tr>
            
            <tr>
                <td class="lefttd" style="height: 30px; text-align: right">
                    <strong>�����ֶΣ�       <td class="righttd" colspan="2" style="height: 30px; text-align: left">
                
                
                <table width="95%" cellspacing="0" cellpadding="0" border="0">
                <tr>
                <td align="center">
                <div  onclick="InsertValue('{KS:Field:ID}')" class="field" style="cursor:pointer">�Ծ�ID</div></td>
                <td align="center"><div onclick="InsertValue('{KS:Field:SJUrl}');" class="field" style="cursor:pointer">�Ծ�����(URL)</div></td>
                <td align="center"><div onmousedown="DragStart()" id="Title" fieldtype="0" onclick="InsertLabel(this.id,this.fieldtype)" class="field" style="cursor:pointer">�Ծ�����</div></td>
                <td align="center"><div onmousedown="DragStart()" id="AddDate" fieldtype="0" onclick="InsertLabel(this.id,this.fieldtype)" class="field" style="cursor:pointer">���ʱ��</div></td>
                <td align="center"><div onclick="InsertValue('{KS:Field:SJClassName}')" class="field" style="cursor:pointer">�Ծ���Ŀ����</div></td>
                </tr>
                <tr>               
                 <td align="center"><div onclick="InsertValue('{KS:Field:SJClassURL}')" class="field" style="cursor:pointer">�Ծ���ĿURL</div></td>
                 <td align="center"><div onclick="InsertValue('{KS:Field:KSSJ}')" class="field" style="cursor:pointer">����ʱ��</div></td>
                 <td align="center"><div onclick="InsertValue('{KS:Field:Hits}')" class="field" style="cursor:pointer">�����</div></td>
                 <td align="center"><div onclick="InsertValue('{KS:Field:Score}')" class="field" style="cursor:pointer">�Ծ��ܷ�</div></td>
                 <td align="center"><div onclick="InsertValue('{KS:Field:Money}')" class="field" style="cursor:pointer">�������</div></td>

</tr>
                <tr>
                <td align="center"><div onclick="InsertValue('{KS:Field:SJProvince}')" class="field" style="cursor:pointer">����ʡ��</div></td>
                <td align="center"><div onclick="InsertValue('{KS:Field:SJType}')" class="field" style="cursor:pointer">�Ծ����</div></td>
                <td align="center"><div onclick="InsertValue('{KS:Field:TestHits}')" class="field" style="cursor:pointer">��������</div></td>
                <td align="center"><div onclick="InsertValue('{KS:Field:Author}')" class="field" style="cursor:pointer">�Ծ�����</div></td>
                <td align="center"><div onclick="InsertValue('{KS:Field:CopyFrom}')" class="field" style="cursor:pointer">�Ծ���Դ</div></td>
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
                     <asp:TextBox CssClass="textbox textarea" Height="150px" ID="LoopBody" onmouseup="dragend()" onmousemove="movePoint()" onclick='setPos()' onkeyup='setPos()' runat="server" Rows="6" TextMode="MultiLine" Width="92%"></asp:TextBox>
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

<span style="color: #6666ff">3��������ֶα�ǩ���Ծ����б�ҳģ��ͨ�á�����Ӧ/<%=MyCache.GetSJCacheConfig(1) %>/List.aspxҳ�ĵ�ģ�塣</span><br />
</td>
                    </tr>
            
      </table>
     <div style="text-align:center">
     
     <KS:Foot ID="Foot1" runat="server" OnSubmit="Button1_Click"  />
     
       <asp:TextBox ID="LabelContent" runat="server" Height="87px" TextMode="MultiLine" Width="445px"></asp:TextBox>
     
     </div>


</asp:Content>

