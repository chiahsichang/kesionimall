<%@ Page Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.Admin_Label_LoopClass" Title="ѭ����Ŀ�б��ǩ" Codebehind="KS.Label.LoopClass.aspx.cs" %>
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
      var s1 = "[Loop Times=\"10\"]\n <li><span class=\"date\">{$Field(AddDate,date,YY-MM-DD)}</span><a href=\"{$Field(InfoID,url,<%=this.ChannelID.SelectedValue %>,3)}\">{$Field(Title,text,30,...,2,)}</a></li>\n[/Loop]\n";
   var s2="<table border=\"0\" cellspacing=\"1\" cellpadding=\"0\">\n"
		  +" <tr>\n"
		  +" [Loop times=\"3\"]\n"
          +"  <td width=\"130\" align=\"center\"><a href=\"{$Field(InfoID,url,<%=this.ChannelID.SelectedValue %>,3)}\"><img src=\"{$Field(DefaultPic,text,0,...,2,/sysimg/nopic.gif)}\" border=\"0\" width=\"120\" height=\"100\"></a><br />\n"
          +"  <a href=\"{$Field(InfoID,url,<%=this.ChannelID.SelectedValue %>,3)}\">{$Field(Title,text,10,0,2,)}</a>\n"
          +"  </td>\n"
          +" [/loop]\n"
          +"</tr>\n"
		  +" <tr>\n"
		  +" [Loop times=\"3\"]\n"
          +"  <td width=\"130\" align=\"center\"><a href=\"{$Field(InfoID,url,<%=this.ChannelID.SelectedValue %>,3)}\"><img src=\"{$Field(DefaultPic,text,0,...,2,/sysimg/nopic.gif)}\" border=\"0\" width=\"120\" height=\"100\"></a><br />\n"
          +"  <a href=\"{$Field(InfoID,url,<%=this.ChannelID.SelectedValue %>,3)}\">{$Field(Title,text,10,0,2,)}</a>\n"
          +"  </td>\n"
          +" [/loop]\n"
          +"</tr>\n"
          +"</table>\n";
   var s3="<table border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\n"
		  +"  <tr>\n"
		  +"    <td align=\"center\" width=\"150\">\n"
		  +"	  [Loop times=\"1\"]\n"
		  +"	   <a href=\"{$Field(InfoID,url,<%=this.ChannelID.SelectedValue %>,3)}\"><img src=\"{$Field(DefaultPic,text,0,...,2,/sysimg/nopic.gif)}\" border=\"0\" width=\"130\" height=\"100\"></a>\n"
		  +"		  <br> <a href=\"{$Field(InfoID,url,1,3)}\">{$Field(Title,text,12,,2,)}</a>\n"
		  +"	  [/loop]\n"
		  +"	 </td>\n"
		  +"     <td valign=\"top\">\n"
		  +"		[Loop times=\"10\"]\n"
		  +"		�� <a href=\"{$Field(InfoID,url,<%=this.ChannelID.SelectedValue %>,3)}\">{$Field(Title,text,0,...,2,)}</a> {$Field(AddDate,date,YY-MM-DD)}<br />\n"
		  +"	   [/Loop]\n"
		  +"     </td>\n"
		  +"   </tr>\n"
		  +"  </table>\n";
   var s4="<table cellspacing=\"0\" cellpadding=\"0\" width=\"100%\" border=\"0\">\n"
          +"    <tr>\n"
          +"      <td  width=\"80\" height=\"100\" align=\"center\">\n"
		  +"		 [Loop times=\"1\"]\n"
		  +"		<a href=\"{$Field(InfoID,url,<%=this.ChannelID.SelectedValue %>,3)}\" target=\"_blank\"><img style=\"BORDER-RIGHT: #666 1px solid; BORDER-TOP: #666 1px solid; BORDER-LEFT: #666 1px solid; BORDER-BOTTOM: #666 1px solid\" height=\"88\" src=\"{$Field(DefaultPic,text,0,...,2,/sysimg/nopic.gif)}\" title=\"{$Field(Title,text,0,...,2,)}\" width=\"64\" border=\"0\" /> </a>\n"
		  +"		[/loop]\n"
		  +"	  </td>\n"
          +"      <td> \n"
		  +"		[Loop times=\"5\"]\n"
		  +"			�� <a href=\"{$Field(InfoID,url,<%=this.ChannelID.SelectedValue %>,3)}\">{$Field(Title,text,25,,2,)}</a><br />\n"
	      +"        [/Loop]\n"
		  +"	  </td>\n"
          +"    </tr>\n"
          +"</table>\n"
          +"<table cellspacing=\"0\" cellpadding=\"4\" width=\"100%\" border=\"0\">\n"
          +"    <tr>\n"
          +"      <td bgcolor=\"#f6f6f6\" height=\"100\"> [Loop times=\"5\"]\n"
		  +"			�� <a href=\"{$Field(InfoID,url,<%=this.ChannelID.SelectedValue %>,3)}\">{$Field(Title,text,12,,2,)}</a><br />\n"
		  +"		   [/Loop]</td>\n"
          +"      <td bgcolor=\"#f6f6f6\"> [Loop times=\"5\"]\n"
		  +"			�� <a href=\"{$Field(InfoID,url,<%=this.ChannelID.SelectedValue %>,3)}\">{$Field(Title,text,12,,2,)}</a><br />\n"
		  +"		   [/Loop]</td>\n"
          +"    </tr>\n"
          +" </table>\n"
   jQuery("#<%=this.LoopBody.ClientID %>").val(eval("s"+v));
  }
  function checkform()
  {
    if (jQuery('#<%=this.ClassHead.ClientID %>').val()=='')
    {
      KesionJS.Alert('��������Ŀͷģ��!',"jQuery('#<%=this.ClassHead.ClientID%>').focus();");
      return false;
    }
    if (jQuery('#<%=this.ClassHead.ClientID %>').val().toLowerCase().indexOf('[!--looplist--]')<0)
    {
      KesionJS.Alert('�Բ������������Ŀͷģ��û�а���[!--looplist--]������ǩ!',"jQuery('#<%=this.ClassHead.ClientID%>').focus();");
     return false;
    }
    if (jQuery('#<%=this.ClassHead.ClientID %>').val().toLowerCase().indexOf('[ks:list]')<0)
    {
      KesionJS.Alert('�Բ������������Ŀͷģ��û�а���[KS:List]������ǩ!',"jQuery('#<%=this.ClassHead.ClientID%>').focus();");
     return false;
    }
    if (jQuery('#<%=this.ClassHead.ClientID %>').val().toLowerCase().indexOf('[/ks:list]')<0)
    {
      KesionJS.Alert('�Բ������������Ŀͷģ��û�а���[/KS:List]������ǩ!',"jQuery('#<%=this.ClassHead.ClientID%>').focus();");
     return false;
    }
    
    if (jQuery('#<%=this.LoopBody.ClientID %>').val().toLowerCase().indexOf('[/loop]')<0)
    {
          KesionJS.Alert('�Բ�����������б�ģ�岻��ȷ���������[loop][/loop]ѭ����!',"jQuery('#<%=this.LoopBody.ClientID%>').focus();");
      return false;
    }
   
   var childclass=0;
   if (jQuery('#<%=this.ChildClass.ClientID %>')[0].checked) childclass=1;
  
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
	jQuery("#classid1 option:selected").each(function(){
		if (jQuery(this).val()!='0' && jQuery(this).val()!='-1')
			if (classid=='') 
				 classid=jQuery(this).val() 
			else
				 classid+=","+jQuery(this).val();
})
   if (jQuery("#classid1 option:selected").val() == "-1") classid = "-1";
   if (classid=='')
   {
     KesionJS.Alert('��ָ��Ҫ���õ���Ŀ!',null);
    return false;
   }
   
   var str='{KS:Label Type="LClass"'
          + ' ChannelID="<%=this.ChannelID.SelectedValue %>"'
          + ' ClassID="'+classid+'"'
          + ' ChildClass="'+childclass+'"'
          + ' SpecialID="'+jQuery("#specialid1>option:selected").val()+'"'
          + ' Ajax="<%=this.PrintStyle.SelectedValue %>"'
          + ' Recommends="'+recommends+'"'
          + ' Hot="'+hot+'"'
          + ' Splendid="'+splendid+'"'
          + ' Slide="'+slide+'"'
          + ' Strip="'+strip+'"'
          + ' Rolls="'+rolls+'"'
          + ' HasPic="'+haspic+'"'
          + ' Order="'+jQuery('#<%=this.Order.ClientID %>>option:selected').val()+'"'
          + ' SQLCondition="' + jQuery('#<%=this.SQLCondition.ClientID %>').val() + '"'
          + ' EmptyText="'+jQuery('#<%=this.EmptyText.ClientID %>').val()+'"'
          +'}'+jQuery('#<%=this.ClassHead.ClientID%>').val()+'{/KS:Label}';
          
   jQuery("#<%=this.LabelContent.ClientID %>").val(str);
   return true;
  }
  function purview(){ parent.openWin("�Զ���ű�����ʽԤ��","../admin/include/autoid.html",false,650,230);
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
	function InsertValue(Val)
	{
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
{	setPos();
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
</script>
<KS:TopNav runat="server" Text="����ѭ����Ŀ�б��ǩ��һ��" ID="TopNav1" />
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
     <td class="righttd" style="text-align: left; height: 30px;"><span  id="classidarea" runat="server"></span><span style="color:blue"> ��ѡ���ǩ����Ŀ¼���Ա��պ�����ǩ</span></td>
    </tr>
            <tr>
                <td class="lefttd" style="height: 30px; text-align: right">
                    <strong>ѡ��ģ�ͣ�</strong></td>
                <td class="righttd" style="height: 30px; text-align: left">

                      <asp:DropDownList ID="ChannelID" runat="server">
                      <asp:ListItem Value="0">--��ָ��ģ��--</asp:ListItem>
                      </asp:DropDownList>
                      
                      <span style="color:blue">����ָ��������ģ��,���Ի�ø��ŵ����ܼ��ɵ����Զ����ֶΡ�</span>
                      </td>
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
                            <strong>��ǩģ�ͣ�</strong></td>
                        <td runat="server" class="righttd" colspan="2" style="height: 30px; text-align: left" id="Td1">
                            <asp:Label ID="LabelModelName" runat="server" Text="Label"></asp:Label>
                            &nbsp;&nbsp;&nbsp; SQL����������<asp:TextBox CssClass="textbox" ID="SQLCondition" runat="server" Width="150px">1</asp:TextBox> �����գ���: and I.Inputer='admin'</td>
                    </tr>
            
            <tr>
                <td class="lefttd" style="height: 30px; text-align: right">
                    <strong>����ѭ������Ŀ��</strong><br /></td>
                <td id="Td4" runat="server" class="righttd" colspan="2" style="height: 30px; text-align: left">
                 <table border="0" cellpadding="0" cellspacing="0">
                     <tr>
                      <td style="width: 1px; height: 39px;"><select name='classid1' id='classid1' multiple size='3' style='width: 120px'>
                      
                      <option value='-1' style='color:red'>��ǰ��Ŀͨ��</option>
                     <%=MyCache.GetClassOptionList(modelid)%>
                      </select>
                      </td>
                      <td valign="top" style="height: 39px">
                      <font color=blue>&nbsp;���ж����Ŀ����ѭ����������԰�Ctrl���ж�ѡ</font><br />
                      &nbsp;����Ŀָ��Ϊ<font color=red>����ǰ��Ŀͨ�á�</font>ʱ,��ô�ñ�ǩ�����ڱ�ģ���µ���Ŀҳͨ��<br />
                      <asp:CheckBox ID="ChildClass" runat="server" Checked="true" Text="ѭ�����������г�����Ŀ����Ϣ" />
                      &nbsp;
</td>
                     </tr>
                    </table>
                </td>
            </tr>
            
            <tr>
                <td class="lefttd" style="height: 30px; text-align: right">
                    <strong>��Ŀ��û����Ϣʱ��ʾ��</strong></td>
                <td id="Td3" runat="server" class="righttd" colspan="2" style="height: 30px; text-align: left">
                    &nbsp;<asp:TextBox CssClass="textbox" ID="EmptyText" runat="server"></asp:TextBox>
                    &nbsp;��Ϣ����ר�⣺<select name="specialid1" id="specialid1" style="width: 120px">
                       <option value=''>-��ָ��ר��-</option><option value="-1" style="color:red">��ǰר��ͨ��</option>
                       <%=BaseFun.GetSpecialOption("0") %>
                       </select> &nbsp; �б�����ʽ��<asp:DropDownList ID="Order" runat="server">
                    <asp:ListItem Value="I.infoid desc">��ϢID����</asp:ListItem>
                    <asp:ListItem Value="I.infoid asc">��ϢID����</asp:ListItem>
                    <asp:ListItem Value="I.adddate desc">����ʱ�併��</asp:ListItem>
                    <asp:ListItem Value="I.adddate ast">����ʱ������</asp:ListItem>
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
                      </asp:DropDownList>&nbsp;
                </td>
            </tr>
                    <tr>
                        <td class="lefttd" style="height: 30px; text-align: right">
                        <strong>&nbsp; �б����Կ��ƣ�</strong>
                        </td>
                        <td class="righttd" colspan="2" style="height: 30px; text-align: left">
                        
                        <table border="0" cellpadding="0" cellspacing="0">
                     <tr>
                      <td style="width: 1px"></td>
                      <td valign="top">
                      <strong>&nbsp;</strong>
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
                            <strong>��Ŀͷģ�壺</strong>
                            <br />
                            <table align="center" cellpadding="0" cellspacing="0" border="0">
                            <tr>
                             <td colspan="2" align="left"><font color=red>����˵����</font></td>
                            </tr>
                            <tr>
                             <td colspan="2" height="18" align="left">��Ŀ���ƣ�[KS:ClassName]</td>
                            </tr>
                            <tr>
                             <td colspan="2"  height="18" align="left">��Ŀ���ӣ�[KS:ClassLink]</td>
                            </tr>
                            <tr>
                             <td colspan="2" height="18" align="left">��ĿID�ţ�[KS:ClassID]</td>
                            </tr>
                            <tr>
                             <td height="18" align="left"><font color=red>ѭ���壺</font></td>
                             <td align="left">
                             <font color="blue">[KS:List]</font><br />
                              [!--looplist--]<br />
                             <font color="blue">[/KS:List]</font></td>
                            </tr>
                            
                            </table>
                            </td>
                        <td class="righttd" colspan="2" style="height: 30px; text-align: left">
                            <asp:TextBox ID="ClassHead" runat="server" CssClass="textbox textarea" Height="150px" onmousemove="movePoint()" onmouseup="dragend()"
                                Rows="10" TextMode="MultiLine" Width="92%"></asp:TextBox>
                                  <a class="textarea_min" href="javascript:zoomtextarea(-5,'<%=this.ClassHead.ClientID %>');"></a>
                                  <a class="textarea_max" href="javascript:zoomtextarea(5,'<%=this.ClassHead.ClientID %>');"></a>
                                
                                </td>
                    </tr>
                    <tr id="selectstyle" runat="server">
                        <td class="lefttd" style="height: 30px; text-align: right">
                            <strong>����ѡ����ʽ��</strong></td>
                        <td runat="server" class="righttd" colspan="2" style="height: 30px; text-align: left" id="Td5">
                        
                         <table border="0" width="100%">
                          <tr>
                           <td><img src="../../admin/images/view/1.gif"><input type="radio" value="1" name="loopstyle" onclick="setstyle(this.value)" checked>
                           </td>
                           <td><img src="../../admin/images/view/5.gif"><input type="radio" value="2" name="loopstyle" onclick="setstyle(this.value)">
                           </td>
                           <td>
                                  <img src="../../admin/images/view/6.gif"><input type="radio" value="3" name="loopstyle" onclick="setstyle(this.value)">
                           </td>
                           <td>
                                  <img src="../../admin/images/view/7.gif"><input type="radio" value="4" name="loopstyle" onclick="setstyle(this.value)">
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
                    <strong>�б�ģ�壺</strong><br />[!--looplist--]<br />
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
                       <span style="color: #ff0000"> 1��Loopʹ�ù���</span><br />
ѭ�����ʽ��[loop times="n"]ѭ����ǩ������[/loop]<br />
����n��ʾѭ����������n����n>=0��loopΪѭ���ؼ��֣���ѭ��������ظ�ʹ��,���ǲ���Ƕ�ס�
                  <br />
                            <span style="color: #ff0000">2���ֶα�ǩ����˵��</span><br />
                                ��ʽ��{$Field(FieldName,OutType,Len)}<br/>
FieldName  --���ݿ����ֶ�����<br />
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

