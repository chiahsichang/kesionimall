<%@ Page Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.Admin_Label_IRelated" Title="Untitled Page" Codebehind="KS.Label.IRelated.aspx.cs" %>
<%@ Import Namespace="Kesion.Cache"%>
<%@ Import Namespace="Kesion.BLL"%>


<asp:Content ID="Content1" ContentPlaceHolderID="KSContent" Runat="Server">
<!--
<body onmousemove="dragmove();" onmouseup="dragclear()">
-->
<script type="text/javascript">
  
  function getfields(channelid)
  {
      channelid = jQuery("#<%=this.DrpChannelID.ClientID %> :selected").val();
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

  
  function checkform()
  {
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



   
   var str='{KS:Label Type="IRelated"'
          + ' ChannelID="'+jQuery("#<%=this.DrpChannelID.ClientID %> :selected").val()+'"'
          + ' Condition="' + jQuery("#<%=this.Condition.ClientID %> :selected").val() + '"'
          + ' Ajax="<%=this.PrintStyle.SelectedValue %>"'
          + ' Recommends="'+recommends+'"'
          + ' Hot="'+hot+'"'
          + ' Splendid="'+splendid+'"'
          + ' Slide="'+slide+'"'
          + ' Strip="'+strip+'"'
          + ' Rolls="'+rolls+'"'
          + ' HasPic="'+haspic+'"'
          + ' Order="'+jQuery('#<%=this.Order.ClientID %>').val()+'"'
          + ' Num="'+jQuery('#<%=this.Num.ClientID %>').val()+'"'
          + ' SQLCondition="' + jQuery('#<%=this.SQLCondition.ClientID %>').val() + '"'
          + '}' + jQuery('#<%=this.LoopBody.ClientID%>').val() + '{/KS:Label}';
   
      jQuery("#<%=this.LabelContent.ClientID %>").val(str);
   return true;
  }
    function purview()
    { parent.openWin("�Զ���ű�����ʽԤ��","../admin/include/autoid.html",false,650,230);
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
   		//���뵽ѭ����
	function InsertValue(Val) {
	    if (pos == null) { KesionJS.Alert('���ȶ�λ����λ��!', null); return false; }
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
    if(pos==null) {KesionJS.Alert('���ȶ�λ����λ��!',null);return false;}
	var link="label/KS.GetFieldParam.aspx?m_fieldname=" + fieldname+"&fieldtype="+fieldtype;
	parent.openWin('�����ֶα�ǩ',link,false,350,200);
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
    parent.openWin('�����ֶα�ǩ',link,false,350,200);
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
jQuery(document).ready(function () {
    getfields(<%=modelid%>)
});
</script>
<KS:TopNav runat="server" Text="���������б�ʽ��ǩ��һ��" ID="TopNav1" />
    <asp:Panel ID="Step1Panel" runat="server" Width="100%">
        <br />
        <table style="margin:6px" width="98%" align="center" cellpadding="1" cellspacing="1" class="CTable">
        <tr>
            <td class="lefttd" style="height: 30px; text-align: right">
                <strong>��ǩ���ƣ�</strong></td>
            <td id="Td2" runat="server" class="righttd" style="height: 30px; text-align: left">
                <span style="color: #000066">{KS_</span><asp:TextBox CssClass="noborder" ID="LabelName" runat="server" Width="126px"></asp:TextBox><span style="color: #000066"> } * ���ø�ʽ��{KS_��ǩ����}</span><asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="LabelName"
                    Display="Dynamic" ErrorMessage="��ǩ���Ʊ�������"></asp:RequiredFieldValidator></td>
        </tr>
    <tr>
     <td class="lefttd" style="text-align: right; height: 30px;">
         <strong>��ǩĿ¼��</strong></td>
     <td class="righttd" style="text-align: left; height: 30px;"><span  id="classidarea" runat="server"></span><span style="color:blue"> ��ѡ���ǩ����Ŀ¼���Ա��պ������ǩ</span></td>
    </tr>
            
        <tr>
            <td class="lefttd" style="height: 30px; text-align: right">
                <strong>�����ʽ��</strong></td>
            <td class="righttd" style="height: 30px; text-align: left">
                    <asp:RadioButtonList ID="PrintStyle" runat="server" RepeatDirection="Horizontal">
                        <asp:ListItem Value="0" Selected="True">������Ajax���</asp:ListItem>
                        <asp:ListItem Value="1">����Ajax���</asp:ListItem>
                    </asp:RadioButtonList></td>
        </tr>
        <tr>
            <td class="lefttd" style="height: 30px; text-align: right">
                <strong>��Ҫ���ܣ�</strong></td>
            <td class="righttd" style="height: 30px; text-align: left">
                <asp:TextBox ID="Descript" runat="server" CssClass="textbox textarea" Height="100px" Rows="8" TextMode="MultiLine" Width="500px"></asp:TextBox>
                   <a class="textarea_min" href="javascript:zoomtextarea(-5,'<%=this.Descript.ClientID %>');"></a>
                   <a class="textarea_max" href="javascript:zoomtextarea(5,'<%=this.Descript.ClientID %>');"></a>
            </td>
        </tr>
    </table><br />
    <KS:Foot ID="Foot1" runat="server" OnSubmit="Foot1_Submit" SubmitButtonText="��һ��(0)" />
    </asp:Panel>


        <asp:Panel ID="Step2Panel" runat="server" Visible="false" Width="100%">
           <table style="margin:6px" width="98%" align="center" cellpadding="1" cellspacing="1" class="CTable">

            <tr>
                <td class="lefttd" style="height: 30px; text-align: right">
                    <span style="background-color: #f0f9fe"></span><strong>��ѯ������</strong></td>
                <td id="Td3" runat="server" class="righttd" colspan="2" style="height: 30px; text-align: left">
                    <asp:TextBox CssClass="textbox" style="text-align:center" ID="Num" runat="server" Width="41px">10</asp:TextBox>��&nbsp;
                    <strong>����ʽ��</strong><asp:DropDownList ID="Order" runat="server">
                    <asp:ListItem Value="I.InfoID desc">��ϢID����</asp:ListItem>
                    <asp:ListItem Value="I.InfoID asc">��ϢID����</asp:ListItem>
                    <asp:ListItem Value="I.adddate desc">����ʱ�併��</asp:ListItem>
                    <asp:ListItem Value="I.adddate asc">����ʱ������</asp:ListItem>
                    <asp:ListItem Value="i.commentnum desc">������������</asp:ListItem>
                    <asp:ListItem Value="i.commentnum asc">������������</asp:ListItem>
                    <asp:ListItem Value="i.hits desc">�����������</asp:ListItem>
                    <asp:ListItem Value="i.hits asc">�����������</asp:ListItem>
                    <asp:ListItem Value="i.hitsbymonth desc">�����������</asp:ListItem>
                    <asp:ListItem Value="i.hitsbymonth asc">�����������</asp:ListItem>
                    <asp:ListItem Value="i.hitsbyweek desc">�����������</asp:ListItem>
                    <asp:ListItem Value="i.hitsbyweek asc">�����������</asp:ListItem>
                    <asp:ListItem Value="i.hitsbyday desc">�����������</asp:ListItem>
                    <asp:ListItem Value="i.hitsbyday asc">�����������</asp:ListItem>
                    <asp:ListItem Value="newid()">�����ʾ</asp:ListItem>
                      </asp:DropDownList>
                SQL����������<asp:TextBox CssClass="textbox" ID="SQLCondition" runat="server" Width="150px">1</asp:TextBox> �����գ���: and I.Inputer='admin'
                </td>
            </tr>
            <tr>
                <td class="lefttd" style="height: 30px; text-align: right">
                    <strong>����ģ�ͣ�</strong><br /></td>
                <td id="Td4" runat="server" class="righttd" colspan="2" style="height: 30px; text-align: left">
                 <asp:DropDownList ID="DrpChannelID" runat="server" onchange="getfields(this.value);">
                <asp:ListItem Value="0">---��ָ��ģ��---</asp:ListItem>
                </asp:DropDownList>
                    ������ģ�Ϳ��Թ����Ǳ�ģ���µ��ĵ���
                </td>
            </tr>
                    <tr>
                        <td class="lefttd" style="height: 30px; text-align: right">
                         <strong>����������</strong>
                        </td>
                        <td class="righttd" colspan="2" style="height: 30px; text-align: left">
                        
                        <table border="0" cellpadding="0" cellspacing="0">
                     <tr>
                      <td style="width: 1px">
                        <asp:DropDownList ID="Condition" runat="server">
                        <asp:ListItem Value="keytags">��ؼ���Tags����</asp:ListItem>
                        <asp:ListItem Value="author">�����߹���</asp:ListItem>
                        <asp:ListItem Value="copyfrom">����Դ����</asp:ListItem>
                    </asp:DropDownList>

                      </td>
                      <td valign="top">
                      <strong>&nbsp;���Կ��ƣ�</strong>
                      </td>
                      <td>
                          <asp:CheckBoxList ID="Attribute" runat="server" RepeatDirection="Horizontal">
                            <asp:ListItem Value="1">�Ƽ�</asp:ListItem>
                            <asp:ListItem Value="2">�ȵ�</asp:ListItem>
                            <asp:ListItem Value="3">����</asp:ListItem>
                            <asp:ListItem Value="4">�õ�</asp:ListItem>
                            <asp:ListItem Value="5">ͷ��</asp:ListItem>
                            <asp:ListItem Value="6">����</asp:ListItem>
                            <asp:ListItem Value="7">����ʾ��ͼƬ</asp:ListItem>
                        </asp:CheckBoxList>
                      </td>
                     </tr>
                    </table>
                        
                        
                        </td>
                    </tr>
       
            <tr>
                <td class="lefttd" style="height: 30px; text-align: right">
                    <strong>�����ֶΣ�</strong></td>
                <td class="righttd" colspan="2" style="height: 30px; text-align: left"><span id="fieldsarea"></span></td>
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
FieldName  --���ݿ�����ֶ�����<br />
OutType    --�����ʽ��֧���ı�(text),����(date),����(url)<br />
Len        --�������</td>
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
