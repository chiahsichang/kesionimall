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
</script>
<KS:TopNav runat="server" Text="�Ź���Ʒ�б��ǩ��һ��" ID="TopNav1" />
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
                <td id="Td3" runat="server" class="righttd" colspan="2" 
                    style="height: 30px; text-align: left">
                    <asp:TextBox ID="Num" runat="server" CssClass="textbox" 
                        style="text-align:center" Width="41px">10</asp:TextBox>
                    ��&nbsp; <strong>����ʽ��</strong><asp:DropDownList ID="Order" runat="server">
                        <asp:ListItem Value="ID desc">�Ź���ƷID����</asp:ListItem>
                        <asp:ListItem Value="ID asc">�Ź���ƷID����</asp:ListItem>
                        <asp:ListItem Value="begindate desc">�Ź���ʼʱ�併��</asp:ListItem>
                        <asp:ListItem Value="begindate asc">�Ź���ʼʱ������</asp:ListItem>
                        <asp:ListItem Value="enddate desc">�Ź�����ʱ�併��</asp:ListItem>
                        <asp:ListItem Value="enddate asc">�Ź�����ʱ������</asp:ListItem>
                        <asp:ListItem Value="sellnum desc">����������</asp:ListItem>
                        <asp:ListItem Value="sellnum asc">����������</asp:ListItem>
                        <asp:ListItem Value="newid()">�����ʾ</asp:ListItem>
                    </asp:DropDownList>
                    SQL����������<asp:TextBox ID="SQLCondition" runat="server" CssClass="textbox" 
                        Width="150px"></asp:TextBox>
                    �����գ���: and price>100
                </td>
               
            </tr>
                    
                    <tr>
                        <td class="lefttd" style="height: 30px; text-align: right">
                         <strong>&nbsp;�������ƣ�</strong>
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
                                        jQuery("#<%=this.DrpClassID.ClientID %>").empty().append('<option value="0">--��ָ��С��--</option>').append(data);
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
                                        jQuery("#<%=this.DrpCityID.ClientID %>").empty().append('<option value="0">--��ָ������--</option>').append(data);
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
                  ���ࣺ          
                  <asp:DropDownList ID="DrpBigClassID"  runat="server"  >
                 </asp:DropDownList>   
                 <asp:DropDownList ID="DrpClassID" runat="server">
                  <asp:ListItem Value="0">--��ָ��С��--</asp:ListItem>
                 </asp:DropDownList>  
                  
                  ������
 <asp:DropDownList ID="DrpProvinceID" runat="server" >
                  
                  </asp:DropDownList>
                  <asp:DropDownList ID="DrpCityID" runat="server"></asp:DropDownList></td>
                            <td>
                            
                            
                              <asp:CheckBoxList ID="Attribute" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow">
                                <asp:ListItem Value="1">����ʾ�Ƽ�</asp:ListItem>
                            </asp:CheckBoxList>
                            </td>
                           </tr>
                          </table>
                          

                         
                        </td>
                    </tr>
                   
            <tr>
                <td class="lefttd" style="height: 30px; text-align: right">
                    <strong>�����ֶΣ�</strong></td>
                <td class="righttd" colspan="2" style="height: 30px; text-align: left">
                
                <table width="95%" cellspacing="0" cellpadding="0" border="0">
                <tr>
                <td align="center"><div  onclick="InsertValue('{KS:Field:GroupBuyURL}')" class="field" style="cursor:pointer">�Ź�����URL</div></td>
                <td align="center"><div  onclick="InsertValue('{KS:Field:GroupBuyCartURL}')" class="field" style="cursor:pointer">���ﳵ����URL</div></td>
                <td align="center"><div  onclick="InsertValue('{KS:Field:ID}')" class="field" style="cursor:pointer">�Ź���ƷID</div></td>
                <td align="center"><div onmousedown="DragStart()" id="Subject" fieldtype="1" onclick="InsertLabel(this.id,this.fieldtype)" class="field" style="cursor:pointer">�Ź���Ʒ����</div></td>
                <td align="center"><div onmousedown="DragStart()" id="PhotoUrl" fieldtype="0" onclick="InsertLabel(this.id,this.fieldtype)" class="field" style="cursor:pointer">�Ź���ƷСͼ</div></td>
                <td align="center"><div onmousedown="DragStart()" id="BigPhoto" fieldtype="0" onclick="InsertLabel(this.id,this.fieldtype)" class="field" style="cursor:pointer">�Ź���Ʒ��ͼ</div></td>
                <td align="center"><div onmousedown="DragStart()" id="Intro" fieldtype="0" onclick="InsertLabel(this.id,this.fieldtype)" class="field" style="cursor:pointer">�Ź���Ʒ����</div></td>
               </tr>
               <tr>
                <td align="center"><div onmousedown="DragStart()" id="BeginDate" fieldtype="0" onclick="InsertLabel(this.id,this.fieldtype)" class="field" style="cursor:pointer">��ʼʱ��</div></td>
                <td align="center"><div onmousedown="DragStart()" id="EndDate" fieldtype="0" onclick="InsertLabel(this.id,this.fieldtype)" class="field" style="cursor:pointer">����ʱ��</div></td>
                <td align="center"><div onmousedown="DragStart()" id="Price_Original" fieldtype="0" onclick="InsertLabel(this.id,this.fieldtype)" class="field" style="cursor:pointer">ԭ��</div></td>
                <td align="center"><div onmousedown="DragStart()" id="Discount" fieldtype="0" onclick="InsertLabel(this.id,this.fieldtype)" class="field" style="cursor:pointer">�ۿ�</div></td>
                <td align="center"><div onmousedown="DragStart()" id="Price" fieldtype="0" onclick="InsertLabel(this.id,this.fieldtype)" class="field" style="cursor:pointer">�Ź���</div></td>
                <td align="center"><div onmousedown="DragStart()" id="PriceSave" fieldtype="0" onclick="InsertLabel(this.id,this.fieldtype)" class="field" style="cursor:pointer">��ʡ��</div></td>
                <td align="center"><div onmousedown="DragStart()" id="MinNum" fieldtype="0" onclick="InsertLabel(this.id,this.fieldtype)" class="field" style="cursor:pointer">�������</div></td>
               </tr>
               <tr>
                <td align="center"><div onmousedown="DragStart()" id="LimitBuyNum" fieldtype="0" onclick="InsertLabel(this.id,this.fieldtype)" class="field" style="cursor:pointer">���ƹ�����</div></td>
               <td align="center"><div onmousedown="DragStart()" id="Weight" fieldtype="0" onclick="InsertLabel(this.id,this.fieldtype)" class="field" style="cursor:pointer">����</div></td>
               <td align="center"><div onmousedown="DragStart()" id="Unit" fieldtype="0" onclick="InsertLabel(this.id,this.fieldtype)" class="field" style="cursor:pointer">��λ</div></td>
               <td align="center"><div onmousedown="DragStart()" id="SellNum" fieldtype="0" onclick="InsertLabel(this.id,this.fieldtype)" class="field" style="cursor:pointer">��������</div></td>
               <td align="center"><div onclick="InsertValue('{KS:Field:TimeCountDown}')" class="field" style="cursor:pointer">�Ź���������</div></td>
               <td align="center"><div onclick="InsertValue('{KS:Field:BeginCountDown}')" class="field" style="cursor:pointer">�Ź���ʼ����</div></td>
                </tr></table>
                
                
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

