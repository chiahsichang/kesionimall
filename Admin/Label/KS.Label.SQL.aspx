<%@ Page Language="C#" ValidateRequest="false"  MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.Admin_Label_SQL" Title="�Զ���SQL��ǩ" Codebehind="KS.Label.SQL.aspx.cs" %>
<asp:Content ID="Content1" ContentPlaceHolderID="KSContent" Runat="Server">
<!--
<body onmousemove="dragmove();" onmouseup="dragclear()">
-->
<script type="text/javascript">
   var lbtf=true;
  function testlabelname(labelname)
  {
    jQuery.get('KS.Label.SQL.aspx',{action:'CheckLabelName',labeltype:'<%=labeltype %>',labelid:'<%=labelid %>',labelname:labelname},function(s){
    if (jQuery("#<%=this.LabelName.ClientID %>").val()==''){
	 jQuery('#labelmessage').html('<font color=red>�������ǩ����!</font>');
	 lbtf=false;
	}
	else if (s=='true'){
	   jQuery('#labelmessage').html('<font color=blue>��ϲ������ʹ�ø�����!</font>');
	   lbtf=true;
	   }
	else{
	   jQuery('#labelmessage').html('<font color=red>�Բ��𣬸����Ʋ����ã��Ѵ���!</font>');
	   lbtf=false;
	   }
    
    });
  }
  
  function checkdatasource()
  {
   jQuery.get('KS.Label.SQL.aspx',{action:'CheckDataSource',lst:jQuery('#<%=this.LabelDataSource.ClientID %>>option:selected').val(),cstr:jQuery('#<%=this.ConnStr.ClientID %>').val()},function(s){
     if(s=='true')
     {
       KesionJS.AlertByTime(1,'��ϲ����ǩ����Դ���Ӳ���ͨ��!',2);
     }
     else
     {
       KesionJS.AlertByTime(2,'���ӳ������������ַ���!',2);
     }
     return false;
   });
  }
  function conndisplay()
  {
     if (jQuery('#<%=this.LabelDataSource.ClientID %> option:selected').val()=='0')
     {
      jQuery("#<%=this.connstrarea.ClientID %>").css('display','none');
     }
     else{
      jQuery("#<%=this.connstrarea.ClientID %>").css('display','');
     }
  }
  function changeconnstr()
  {
     conndisplay();
	 switch (parseInt(jQuery('#<%=this.LabelDataSource.ClientID %>>option:selected').val()))
		{
			 case 1:
			  jQuery('#<%=this.ConnStr.ClientID %>').val('/DBPath/���ݿ�.mdb');
			  break;
			 case 2:
			  jQuery('#<%=this.ConnStr.ClientID %>').val('User ID=sa; Password=989066; Initial Catalog=kesionicms; server=(local);');
			  break;
			 case 3:
		      jQuery('#<%=this.ConnStr.ClientID %>').val('DSN=����Դ��;UID=�û���;PWD=����');
			  break;
			 case 4:
		      jQuery('#<%=this.ConnStr.ClientID %>').val('Data Source=����Դ��;User Id=�û���;Password=����;Integrated Security=no;');
			  break;
			 case 5:
		      jQuery('#<%=this.ConnStr.ClientID %>').val('/DBPath/test.xls');
			  break;
			 case 6:
		      jQuery('#<%=this.ConnStr.ClientID %>').val('Data Source=�������ݿ�·��+����;Provider=Microsoft.JET.OLEDB.4.0;');
			  break;
		}
  }
  function checkstep1()
  {
   if (jQuery("#<%=this.LabelName.ClientID %>").val()=='')
   {
       jQuery('#<%=this.LabelName.ClientID %>').focus();
       KesionJS.Alert('�������ǩ����!',null);
       return false;
   }
   if (lbtf==false)
   {
    KesionJS.Alert('�Բ���������ı�ǩ�Ѵ��ڣ�����������!',null);
    return false;
   }
   <%if (labeltype==6)
   { %>
   if (jQuery("#<%=this.JSFileName.ClientID %>").val()=='')
   {
       jQuery('#<%=this.JSFileName.ClientID %>').focus();
       KesionJS.Alert('���������ɵ�JS�ļ�����!',null);
       return false;
   }
   if (jQuery("#<%=this.JSFileName.ClientID %>").val().indexOf('.')<0)
   {
       jQuery('#<%=this.JSFileName.ClientID %>').focus();
       KesionJS.Alert('JS�ļ����Ʊ��������չ��!',null);
       return false;
   }
   <%} %>
  }
  function checkform()
  {
   if (jQuery('#<%=this.LoopBody.ClientID%>').val().toLowerCase().indexOf("[loop ")<0 || jQuery('#<%=this.LoopBody.ClientID%>').val().toLowerCase().indexOf("[/loop]")<0 || jQuery('#<%=this.LoopBody.ClientID%>').val().toLowerCase().indexOf("times=")<0)
   {
    KesionJS.Alert('��ʽ����ȷ,ѭ����������[Loop][/Loop]ѭ���ԣ�',null);
    return false;
   }
   var SQL=jQuery("#<%=this.SQL2.ClientID %>").val();


   <%if (labeltype==3)
   { %>
   var str='{KS:Label Type="ISQL"'
          + ' LabelSourceType="<%=this.LabelDataSource.SelectedValue %>"'
          + ' ConnectionString="{@connstr}"'
          + ' SQL="'+SQL+'"'
          + ' LabelType="<%=this.SQLType.SelectedValue %>"'
          + ' Ajax="<%=this.PrintStyle.SelectedValue %>"'
          + ' PageStyle="<%=this.PageStyle.SelectedValue %>"'
          + ' ItemName="<%=this.ItemName.Text %>"'
          + ' LabelParam="'+jQuery('#<%=this.LabelParam.ClientID %>').val()+'"'
          + ' EmptyText="<%=this.EmptyText.Text %>"'
          +'}'+jQuery('#<%=this.LoopBody.ClientID%>').val()+'{/KS:Label}';
    <%}else
    { %>
    var str='{KS:Label Type="ISQL"'
          + ' LabelSourceType="<%=this.LabelDataSource.SelectedValue %>"'
          + ' ConnectionString="{@connstr}"'
          + ' SQL="'+SQL+'"'
          + ' EmptyText="<%=this.EmptyText.Text %>"'
          +'}'+jQuery('#<%=this.LoopBody.ClientID%>').val()+'{/KS:Label}';
     <%} %>     
   jQuery("#<%=this.LabelContent.ClientID %>").val(str);
   return true;
  }
    function purview()
    {  
      parent.openWin("�Զ���ű�����ʽԤ��","../../admin/include/autoid.html",false,650,230);
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
	parent.openWin('�����ֶα�ǩ',link,false,400,220);
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

 <script type="text/javascript">
              function SetSQLType()
              {
               var v = jQuery("#<%=this.SQLType.ClientID %> :radio[checked]").val();
               if (v=='0'){
                 jQuery("#<%=this.pagestylearea.ClientID %>").css('display','none');
               }else{
               jQuery("#<%=this.pagestylearea.ClientID %>").css('display','');
               }
               
               }
	          function checkfield(){
		        var strtmpp;
		        strtmpp = "<tr align='center'>";
		        var fieldtemp = jQuery("#<%=this.FieldParam.ClientID%>").val().split("\n");
			        for(i=0;i<fieldtemp.length;i++){
				        strtmpp = strtmpp + "<td style='cursor:pointer;' class='field' onclick='AddParamToSql(" + i + ")'>" + fieldtemp[i] + "</td>";
				        if(((i+1)%4) == 0){
					        strtmpp = strtmpp + "</tr><tr align='center'>";
				        }
			        }
			        jQuery("#paramTr").empty().append(strtmpp);
             }
	         function AddParamToSql(input){
                InsertValue1("[KS:Param(" + input + ")]")
	        }

           var pos1=null;
           function setPos1()
	        { if (document.all){
			        jQuery("#<%=this.SQL1.ClientID %>").focus();
		            pos1 = document.selection.createRange();
		          }else{
		            pos1 = jQuery("#<%=this.SQL1.ClientID %>")[0].selectionStart;
		          }
           }
   		        //���뵽ѭ����
	        function InsertValue1(Val)
	        {   if (pos1==null) {KesionJS.Alert('���ȶ�λҪ�����λ��!');return false;}
			         if (document.all){
			          pos1.text=Val;
			         }else{
			           var obj=jQuery("#<%=this.SQL1.ClientID %>");
			           var lstr=obj.val().substring(0,pos1);
			           var rstr=obj.val().substring(pos1);
			           obj.val(lstr+Val+rstr);
			         }
	        }


	        function addfield(){
	        jQuery("#<%=this.SQL1.ClientID%>").val('');
			var select=jQuery("#<%=this.field.ClientID%>")[0];
			var select2=jQuery("#<%=this.field2.ClientID%>")[0];
			for(i=0;i<select.length;i++){
				if(document.all.<%=this.field.UniqueID%>[i].selected==true){
					if(jQuery("#<%=this.dbname2.ClientID%>>option:selected").val()==''){
						if (jQuery("#<%=this.SQL1.ClientID%>").val()==''){
							jQuery("#<%=this.SQL1.ClientID%>").val(document.all.<%=this.field.UniqueID%>[i].value);
						}else{
							jQuery("#<%=this.SQL1.ClientID%>").val(jQuery("#<%=this.SQL1.ClientID%>").val()+","+document.all.<%=this.field.UniqueID%>[i].value);
						}
					}else{
						if (jQuery("#<%=this.SQL1.ClientID%>").val()==''){
							jQuery("#<%=this.SQL1.ClientID%>").val(jQuery("#<%=this.dbname1.ClientID%>>option:selected").val() + "." + document.all.<%=this.field.UniqueID%>[i].value);
						}else{
							jQuery("#<%=this.SQL1.ClientID%>").val(jQuery("#<%=this.SQL1.ClientID%>").val() + "," + jQuery("#<%=this.dbname1.ClientID%>>option:selected").val() + "." + document.all.<%=this.field.UniqueID%>[i].value);
						}
					}
				}
			}
			if(jQuery("#<%=this.dbname2.ClientID%> option:selected").val()==''){
				if(<%= this.SQLType.SelectedIndex %>==1){
					jQuery("#<%=this.SQL1.ClientID%>").val("select " + jQuery("#<%=this.SQL1.ClientID%>").val() + " from [<%=this.dbname1.SelectedValue%>]");
				}else{
					jQuery("#<%=this.SQL1.ClientID%>").val("select top 10 " + jQuery("#<%=this.SQL1.ClientID%>").val() + " from [<%=this.dbname1.SelectedValue%>]");
				}
				
			}else{
				for(i=0;i<select2.length;i++){
					if(document.all.<%=this.field2.UniqueID%>[i].selected==true){
						if (jQuery("#<%=this.SQL1.ClientID%>").val()==''){
							jQuery("#<%=this.SQL1.ClientID%>").val(jQuery("#<%=this.dbname2.ClientID%>>option:selected").val() + "." + document.all.<%=this.field2.UniqueID%>[i].value);
						}else{
							jQuery("#<%=this.SQL1.ClientID%>").val(jQuery("#<%=this.SQL1.ClientID%>").val() + "," + jQuery("#<%=this.dbname2.ClientID%>>option:selected").val() + "." + document.all.<%=this.field2.UniqueID%>[i].value);
						}
					}
				}
				if(jQuery("#<%=this.dbname1.ClientID %> option:selected").val()==''){
					if(<%= this.SQLType.SelectedIndex %>==1){
						jQuery("#<%=this.SQL1.ClientID%>").val("select " + jQuery("#<%=this.SQL1.ClientID%>").val()+ " from <%=this.dbname2.SelectedValue%>");
					}else{
						jQuery("#<%=this.SQL1.ClientID%>").val("select top 10 " + jQuery("#<%=this.SQL1.ClientID%>").val() + " from <%=this.dbname2.SelectedValue%>");
					}
				}else{
					if(jQuery("#<%=this.bg1.ClientID %>>option:selected").val()=='' || jQuery("#<%=this.bg2.ClientID %>>option:selected").val()==''){
						if(<%= this.SQLType.SelectedIndex %>==1){
							jQuery("#<%=this.SQL1.ClientID%>").val("select " + jQuery("#<%=this.SQL1.ClientID%>").val() + " from <%=this.dbname1.SelectedValue%>,<%=this.dbname2.SelectedValue%>");
						}else{
							jQuery("#<%=this.SQL1.ClientID%>").val("select top 10 " + jQuery("#<%=this.SQL1.ClientID%>").val() + " from <%=this.dbname1.SelectedValue%>,<%=this.dbname2.SelectedValue%>");
						}
					}else{
						if(<%= this.SQLType.SelectedIndex %>==1){
							jQuery("#<%=this.SQL1.ClientID%>").val("select " + jQuery("#<%=this.SQL1.ClientID%>").val() + " from <%=this.dbname1.SelectedValue%>,<%=this.dbname2.SelectedValue%> where ");
						}else{
							jQuery("#<%=this.SQL1.ClientID%>").val("select top 10 " + jQuery("#<%=this.SQL1.ClientID%>").val() + " from <%=this.dbname1.SelectedValue%>,<%=this.dbname2.SelectedValue%> where ");
						}
						jQuery("#<%=this.SQL1.ClientID%>").val(jQuery("#<%=this.SQL1.ClientID%>").val() + "<%=this.dbname1.SelectedValue%>." + $F("<%=this.bg1.ClientID%>") + " = " + "<%=this.dbname2.SelectedValue%>." + jQuery("#<%=this.bg2.ClientID%>>option:selected").val());
					}
				}
			}
		}
                 </script>


<KS:TopNav runat="server" Text="��������SQL��ǩ��һ��" ID="TopNav1" />
    <asp:Panel ID="Step1Panel" runat="server" Width="100%">
        <br />
        <table style="margin:6px" width="98%" align="center" cellpadding="1" cellspacing="1" class="CTable">
        <tr>
            <td class="lefttd" style="height: 30px; text-align: right">
                <strong>
                <%if (labeltype == 3)
                  { %>
                ��ǩ����
                <%}
                  else
                  { %>
                  JS ����
                  <%} %>��</strong></td>
            <td id="Td2" runat="server" class="righttd" style="height: 30px; text-align: left">
                <span style="color: #000066">
                <%if (labeltype==3)
{  %>
                {SQL_<%
                     }
                         else{ 
                         %>{JS_<%} %></span><asp:TextBox CssClass="noborder" ID="LabelName" runat="server" Width="126px"></asp:TextBox><span style="color: #000066"> } *<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="LabelName"
                    Display="Dynamic" ErrorMessage="��ǩ���Ʊ�������"></asp:RequiredFieldValidator><span id="labelmessage"></span>
                <%if (labeltype==3){ %><br /> �����ǩ���ƣ�"�Ƽ������б�"������ģ���е��ã�<font color="red">"{SQL_�Ƽ������б�(����1,����2...)}"��</font>��<%} %></span></td>
        </tr>
    <tr>
     <td class="lefttd" style="text-align: right; height: 30px;">
         <strong>��ǩĿ¼��</strong></td>
     <td class="righttd" style="text-align: left; height: 30px;"><span  id="classidarea" runat="server"></span><font color=red> ��ѡ���ǩ����Ŀ¼���Ա��պ�����ǩ</font></td>
    </tr>
            <tr id="jsfilenamearea" runat="server">
                <td class="lefttd" style="height: 30px; text-align: right">
                    <strong>JS�ļ�����</strong></td>
                <td class="righttd" style="height: 30px; text-align: left">
                    <asp:TextBox CssClass="textbox" ID="JSFileName" runat="server"></asp:TextBox>
                    ��new.js��</td>
            </tr>
            <tr>
                <td class="lefttd" style="height: 30px; text-align: right">
                    <strong>�� �� Դ��</strong></td>
                <td class="righttd" style="height: 30px; text-align: left">
                        <asp:DropDownList ID="LabelDataSource" runat="server">
                         <asp:ListItem Value="0" Selected="true">ϵͳ�ڲ�����Դ(Ĭ��)</asp:ListItem>
                         <asp:ListItem Value="1">�ⲿAccess����Դ</asp:ListItem>
                         <asp:ListItem Value="2">�ⲿMS SQL����Դ</asp:ListItem>
                         <asp:ListItem Value="3">�ⲿODBC����Դ</asp:ListItem>
                         <asp:ListItem Value="4">�ⲿOracle����Դ</asp:ListItem>
                         <asp:ListItem Value="5">�ⲿExcel����Դ</asp:ListItem>
                         <asp:ListItem Value="6">�ⲿOLE����Դ</asp:ListItem>
 
                        </asp:DropDownList>
       
                </td>
            </tr>
            <tr id="connstrarea" runat="server" style="display:none">
                <td class="lefttd" style="height: 30px; text-align: right">
                    <strong>�����ַ�����</strong></td>
                <td class="righttd" style="height: 30px; text-align: left">
                
                <table border="0">
                        <tr>
                         <td>
                        <asp:TextBox ID="ConnStr" runat="server" Height="50px" TextMode="MultiLine" Width="450px">/DBPath/���ݿ�.mdb</asp:TextBox>
                         </td>
                         <td style="width: 40px"><asp:Button ID="TextButton" runat="server" Text="��������Դ" CssClass="button" CausesValidation="False" UseSubmitBehavior="False" /></td>
                        </tr>
                         </table>

                </td>
            </tr>
 
        <tr id="printoutarea" runat="server">
            <td class="lefttd" style="height: 30px; text-align: right">
                <strong>�����ʽ��</strong></td>
            <td class="righttd" style="height: 30px; text-align: left">
                    <asp:RadioButtonList ID="PrintStyle" runat="server" RepeatDirection="Horizontal">
                        <asp:ListItem Value="0" Selected="True">������Ajax���</asp:ListItem>
                        <asp:ListItem Value="1">����Ajax���</asp:ListItem>
                    </asp:RadioButtonList></td>
        </tr>
            <tr id="labeltypearea" runat="server">
                <td class="lefttd" style="height: 30px; text-align: right">
                    <strong>��ǩ���ͣ�</strong></td>
                <td class="righttd" style="height: 30px; text-align: left">
                    <asp:RadioButtonList ID="SQLType" runat="server" RepeatDirection="Horizontal">
                        <asp:ListItem Selected="True" Value="0">��ͨ��ǩ</asp:ListItem>
                        <asp:ListItem Value="1">�ռ���ҳ��ǩ</asp:ListItem>
                    </asp:RadioButtonList>
                    <div id="pagestylearea" runat="server" style="display:none">
                    ��ҳ��Ŀ��λ��<asp:TextBox CssClass="textbox" ID="ItemName" runat="server" Text="ƪ" Width="50"></asp:TextBox>��ƪ��������
                    &nbsp;&nbsp;��ҳ��ʽ��<asp:DropDownList ID="PageStyle" runat="server">
                    </asp:DropDownList>
                    </div>
                    </td>
            </tr>

            <tr>
                <td class="lefttd" style="height: 30px; text-align: right">
                    <strong>û�м�¼��ʾ��</strong></td>
                <td class="righttd" style="height: 30px; text-align: left">
                    <asp:TextBox ID="EmptyText" CssClass="textbox" Text="�Բ��𣬱���Ŀ��û���κ���Ϣ��" runat="server" Width="353px"></asp:TextBox></td>
            </tr>
            
            <tr id="showsql" runat="server" visible="false">
                <td class="lefttd" style="height: 30px; text-align: right">
                    <strong>SQL��ѯ��䣺</strong></td>
                <td class="righttd" style="height: 30px; text-align: left">
                    <asp:TextBox ID="TxtSQL1" TextMode="MultiLine" CssClass="textbox textarea" Text="" runat="server" Width="600px" Height="70px"></asp:TextBox></td>
            </tr>
        <tr>
            <td class="lefttd" style="height: 30px; text-align: right">
                <strong>��Ҫ���ܣ�</strong></td>
            <td class="righttd" style="height: 30px; text-align: left">
                <asp:TextBox CssClass="textbox textarea" ID="Descript" runat="server" Height="100px" Rows="5" TextMode="MultiLine" Width="500px"></asp:TextBox>
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
                        <td class="lefttd" nowrap style="height: 30px; text-align: right">
                            <strong>����</strong></td>
                        <td runat="server" class="righttd" colspan="2" style="height: 30px; text-align: left;" id="Td1">
                            <asp:DropDownList ID="dbname1" runat="server" AutoPostBack="True" OnSelectedIndexChanged="dbname1_SelectedIndexChanged" Width="320px">
                            </asp:DropDownList></td>
                        <td id="Td5" runat="server" class="righttd" colspan="1" style="height: 30px; text-align: center; width: 78px;">
                        <strong>�ӱ�</strong>
                        </td>
                        <td id="Td6" runat="server" class="righttd" colspan="1" style="height: 30px; text-align: left">
                        <asp:DropDownList id="dbname2" runat="server" AutoPostBack="True" OnSelectedIndexChanged="dbname2_SelectedIndexChanged" Width="320px">
                            </asp:DropDownList></td>
                    </tr>
               <tr class="tdbg" id="yszd" runat="server" visible="false">
			      <td class="lefttd" style="height: 30px; text-align: right;width:150px;"><strong>Լ���ֶΣ�</strong></td>
			      <td colspan="2" >
			       <asp:DropDownList id="bg1" runat="server" Width="320px">
                   </asp:DropDownList>
    			
                   </td>
			      <td align=center><strong>&lt;&lt; ���� &gt;&gt;</strong></td>
			      <td>
			        <asp:DropDownList id="bg2" runat="server" Width="320px">
                     </asp:DropDownList>	
			       </td>
		    </tr>
            <tr>
                <td class="lefttd" style="height: 30px; text-align: right">
                    <strong>��ѯ�ֶΣ�<br />
                    </strong><span style="color: #ff0000">��ѡ����Ҫ���õ��ֶ�����,��Ctrl��Shift����ѡ</span></td>
                <td id="Td3" runat="server" class="righttd" colspan="2" style="height: 30px; text-align: left; width: 27px;">
                    <asp:ListBox ID="field" runat="server" Rows="12" Width="320px" SelectionMode="Multiple"></asp:ListBox></td>
                <td runat="server" class="righttd" style="height: 30px; text-align: center; width: 78px;" id="Td4">
                    &gt;&gt;&gt;</td>
                <td class="righttd">
                    <asp:ListBox ID="field2" runat="server" Rows="12" Width="320px" SelectionMode="Multiple"></asp:ListBox></td>
            </tr>
                    <tr id="labelparamarea" runat="server">
                        <td class="lefttd" style="height: 30px; text-align: right">
                            <strong>����˵����</strong></td>
                        <td id="Td7" runat="server" class="righttd" colspan="4" style="height: 30px; text-align: left">
                            <asp:TextBox CssClass="textbox textarea" Width="700px" Height="60px" ID="FieldParam" runat="server" Columns="50" Rows="3" TextMode="MultiLine"></asp:TextBox>ÿ��һ����������������������</td>
                    </tr>
            <tr>
                <td class="lefttd" nowrap style="height: 30px; text-align: right">
                    <strong>SQL��ѯ��䣺</strong><br />
                    &nbsp;&nbsp;
                    </td>
                <td runat="server" class="righttd" colspan="4" style="height: 30px; text-align: left" id="Td9">
                    <div id="ParamList" runat="server">
			        <table border='1' cellpadding='2' cellspacing='1'  width='100%' class='CTable'>
			        <tr align='center'>
                        <td style='cursor:pointer;' class="field" onclick="InsertValue1('[KS:Current:ClassID]')" title='��ǰ���¡�ͼƬ�����صȵ�ͨ����ĿID�����������Թ����ͨ�õ��Զ��庯����ǩ.�� Select infoid,title From KS_InfoList Where ClassID=[KS:Current:ClassID]'>[KS:Current:ClassID]</td>
                        <td style='cursor:pointer;' class="field" onclick="InsertValue1('[KS:Current:ParentClassID]')" title='��ǰ���¡�ͼƬ�����صȵ�ͨ����ĿID�����������Թ����ͨ�õ��Զ��庯����ǩ.�� Select classid,classname From KS_Class Where ParentID=[KS:Current:ParentClassID]'>[KS:Current:ParentClassID]</td>
                        <td style='cursor:pointer;' class="field" onclick="InsertValue1('[KS:Current:ClassChildID]')" title="��������Ŀ��ͨ����ĿID,�ԡ������Ÿ���,�� Select InfoID,Title,AddDate From KS_InfoList Where Classid in([KS:Current:ClassChildID])">[KS:Current:ClassChildID]</td>
			            <td style="cursor:pointer" class="field" onclick="InsertValue1('[KS:Current:InfoID]')" title="��ǰ��Ϣ�����£�ͼƬ�����صȣ���ID,��Select InfoID,Title,Intro From KS_InfoList Where InfoID=[KS:Current:InfoID]">[KS:Current:InfoID]</td>
			        </tr>
                    <tr align='center'>
                        <td style="cursor:pointer" class="field" onclick="InsertValue1('[KS:Current:SpecialClassID]')" title="��ǰר�����ID��ֻ����ר�����ҳʹ�ã�,��Select SpecialName,SpecialPic,Descript From KS_Special Where ClassID=[KS:Current:SpecialClassID]">[KS:Current:SpecialClassID]</td>
			            <td style="cursor:pointer" class="field" onclick="InsertValue1('[KS:Current:SpecialID]')" title="��ǰר��ID��ֻ����ר��ҳʹ�ã�,��Select I.InfoID,I.Title From KS_InfoList I INNER JOIN KS_SpecialR S ON I.InfoID=S.InfoID Where S.Specialid=[KS:Current:SpecialID]">[KS:Current:SpecialID]</td>
			            <td style="cursor:pointer" class="field"  onclick="InsertValue1('[KS:Current:SpaceUserID]')" title="��ǰ�ռ���û�ID��ֻ���ڿռ�ģ����ʹ�ã�,��Select BlogID,Title From KS_BlogInfo Where UserID=[KS:Current:SpaceUserID]">[KS:Current:SpaceUserID]</td>
			            <td style="cursor:pointer" class="field" onclick="InsertValue1('[KS:Current:SpaceUserName]')" title="��ǰ�ռ���û����ƣ�ֻ���ڿռ�ģ����ʹ�ã�,��Select BlogID,Title From KS_BlogInfo Where UserName='[KS:Current:SpaceUserName]'">[KS:Current:SpaceUserName]</td>
			        </tr>
                        <tbody id="paramTr"></tbody>
			        </table>
			        </div>
                
                
                    <asp:TextBox ID="SQL1" onclick='setPos1()' onkeyup='setPos1()' CssClass="textbox textarea" Height="100px" onmouseup="dragend()" onmousemove="movePoint()" runat="server" Rows="5" TextMode="MultiLine" Width="740px">select top 10 InfoID,ClassID,Title,AddDate,DefaultPic,Intro from [KS_InfoList] Where verify=1 order by InfoID Desc</asp:TextBox>
                    <a class="textarea_min" href="javascript:zoomtextarea(-5,'<%=this.SQL1.ClientID %>');"></a>
                   <a class="textarea_max" href="javascript:zoomtextarea(5,'<%=this.SQL1.ClientID %>');"></a>
                </td>
            </tr>
            
      </table>

      <div class="message">
       <strong>ʹ����ʾ��</strong><br />
      1��<font color="red">֧��ʹ��[ReqNum(����)]��[ReqStr(����)]��ȡ��Url�Ĳ���ֵ</font><br />
�磺http://www.kesion.com/index.aspx?ClassID=100,��ôsql��䣺select top 10 classname from ks_class where classid=<font color=blue>[ReqNum(ClassID)]</font> ���Զ�ת��Ϊselect top 10 classname from ks_class where classid=<font color=blue>100</font><br />
      2����ѯKS_Class���ݱ�ʱ��������ѭ������ӡ�{KS:Field:CurrentCss}���Զ�������ʽ class="curr"���磺&lt;a href="{$Field(ClassID,url,0,3)}"<font color=blue>{KS:Field:CurrentCss}</font>>{$Field(ClassName,text,0,...,2,)}&lt;/a>




      </div>

     <div style="text-align:center">
         &nbsp;
         <asp:TextBox ID="LabelClassID" runat="server"></asp:TextBox>
         <br />
         <KS:Foot ID="Foot2" runat="server" OnSubmit="Foot2_Submit" SubmitButtonText="�� һ ��(0)" />
     </div>

        </asp:Panel>

      
        <asp:Panel ID="Step3Panel" runat="server" Visible="false" Width="100%">
         <table style="margin:6px" width="99%" cellpadding="1" cellspacing="1" class="CTable">
        <tr>
            <td class="lefttd" style="height: 30px; text-align: right">
                <strong>SQL��䣺</strong></td>
            <td id="Td8" runat="server" class="righttd" style="height: 30px; text-align: left">
                <span style="color: #000066">
                    <asp:TextBox ID="SQL2" runat="server" Columns="75" Rows="4" TextMode="MultiLine"></asp:TextBox></span></td>
        </tr>
             <tr id="labelparamarea1" runat="server">
                 <td class="lefttd" style="height: 30px; text-align: right">
                     <strong>��ǩ������</strong></td>
                 <td runat="server" class="righttd" style="height: 30px; text-align: left">
                     <asp:TextBox CssClass="textbox" ID="LabelParam" runat="server" Width="356px" ReadOnly="True"></asp:TextBox>������"|"���������ɸģ�</td>
             </tr>
             <tr>
                 <td class="lefttd" style="height: 30px; text-align: right">
                     <strong>�����ֶΣ�</strong></td>
                 <td runat="server" class="righttd" colspan="4" style="height: 30px; text-align: left; ">
                 <span id="fieldsarea">
                     <asp:Label ID="FieldLabel" runat="server" Text="Label"></asp:Label></span></td>
             </tr>
        <tr>
                <td class="lefttd" style="height: 30px; text-align: right">
                    <strong>��ʽѭ���壺<br />
                    </strong><span style="background-color: #f0f9fe">�Զ���ű���</span><font color="red">{$Auto(n)}</font><br />
                    <span style="background-color: #f0f9fe">nȡֵ��Χ0-6֮��,</span><a href="#" onclick="purview();return false"><font
                        color="blue">Ԥ��</font></a><br />
                    &nbsp;&nbsp;
                    </td>
                <td runat="server" class="righttd" colspan="4" style="height: 30px; text-align: left;" id="Td10">
                <script language = 'JavaScript'>

		            function show_ln(txt_ln,txt_main){
			            var txt_ln  = document.getElementById(txt_ln);
			            var txt_main  = document.getElementById(txt_main);
			            txt_ln.scrollTop = txt_main.scrollTop;
			            while(txt_ln.scrollTop != txt_main.scrollTop)
			            {
				            txt_ln.value += (i++) + '\n';
				            txt_ln.scrollTop = txt_main.scrollTop;
			            }
			            return;
		            }
		            function editTab(){
			            
			            }
		            //-->
		            </script>
		             <table border="0" width="100%" cellpadding="0" cellspacing="0">
		             <tr>
		             <td width="20" valign="top">
		             <textarea runat="server" id='txt_ln' name='rollContent' cols='6' style='overflow:hidden;height:200px;background-color:highlight;border-right:0px;text-align:right;font-family: tahoma;font-size:12px;font-weight:bold;color:highlighttext;cursor:default;' readonly></textarea>
		             </td>
		             <td valign="top">
                    <asp:TextBox ID="LoopBody" CssClass="textbox textarea" onmouseup="dragend()" onmousemove="movePoint()" onclick='setPos()' onkeyup='setPos()' runat="server" Height="200px" Rows="10" TextMode="MultiLine" Width="100%"></asp:TextBox>
                    </td>
		             </tr>
		            </table>
                
                </td>
        </tr>
             <tr>
                 <td class="lefttd" style="height: 30px; text-align: right">
                     <strong>��Ҫ������</strong></td>
                 <td runat="server" class="righttd" colspan="4" style="height: 30px; text-align: left;">
                     <span style="color: #ff0000">1��Loopʹ�ù���<br />
                     </span>ѭ�����ʽ��[loop times="n"]ѭ����ǩ������[/loop]<br />
                     ����n��ʾѭ����������n����n&gt;=0��loopΪѭ���ؼ��֣���ѭ��������ظ�ʹ��,���ǲ���Ƕ�ס�
                     <br />
                     <span style="color: #ff0000">2���ֶα�ǩ����˵��</span><br />
                     ��ʽ��{$Field(FieldName,OutType,Len)}<br />
                     FieldName --���ݿ����ֶ�����<br />
                     OutType --�����ʽ��֧���ı�(text),����(date),����(url)<br />
                     Len --�������<br />
                     <span style="color: #ff0000">3���õ�����������������</span><br />
                        �����ѯ����ģ�����ݱ������ѯ������ѯ�ֶ�Ҫ��ClassID������{$Field(infoid,url,0,3)}������ȷ�õ��������������������ĵ�URL��
                   
                   <br />
                     <span style="color: #ff0000">4�����������ҳ��ǩ��������ѭ������Ҫ��ʾ��ҳ�ĵط������ǩ��  [KS:PageStr]</span><br />   
                        
                      

                 </td>
             </tr>

        </table>
         <asp:TextBox ID="LabelContent" runat="server" Height="87px" TextMode="MultiLine" Width="445px"></asp:TextBox>&nbsp;
         <KS:Foot ID="Foot3" runat="server" OnSubmit="Foot3_Submit" SubmitButtonText="ȷ������(0)" />
        </asp:Panel>

</asp:Content>

