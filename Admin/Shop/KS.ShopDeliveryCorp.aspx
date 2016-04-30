<%@ Page Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.Admin.Shop.Admin_ShopDeliveryCorp" Title="������˾����" Codebehind="KS.ShopDeliveryCorp.aspx.cs" %>
<%@ Import Namespace="System.IO" %>
<%@ Import Namespace="Kesion.Publics" %>

<asp:Content ID="Content1" ContentPlaceHolderID="KSContent" Runat="Server">
    <asp:Panel ID="listPanel" runat="server" Width="100%">
      <div id="manage_top" class="menu_top_fixed">
        <ul>
        <li id='p1'><asp:LinkButton ID="addbutton" runat="server" OnClick="addbutton_Click"><b></b>����������˾</asp:LinkButton></li>
        
        <li id='p4'><asp:LinkButton ID="editbutton" runat="server" OnClick="editTask_Click"><b></b>�༭������˾</asp:LinkButton></li>
        <li id='p3'><asp:LinkButton ID="delbutton" runat="server" OnClick="delTask_Click"><b></b>ɾ��������˾</asp:LinkButton></li>
        </ul>
        
      </div>     
       <div class="menu_top_fixed_height"></div>
    <div>
        <KS:OrderJS ID="OrderJS1" runat="server" />
        <KS:KSGV ID="PaymentListView" cssclass="CTable" runat="server" AutoGenerateColumns="False" DataKeyNames="FieldID" GridLines="None"
            OnRowDataBound="FieldListView_RowDataBound" PagerType="CustomNumeric" Width="99%" EnableTheming="True" OnRowCommand="FieldListView_RowCommand" EmptyDataText="����û������κ�������˾,��<a href='?action=add'>������</a>!">
            <Columns>
                <asp:TemplateField HeaderText="ѡ��">
                <itemstyle horizontalalign="Center" width="50px" />
                <itemtemplate>
                    <input type="checkbox"  name="ids" id="ids" value="<%#Eval("CorpID") %>" />
                </itemtemplate>
              </asp:TemplateField>
                <asp:TemplateField HeaderText="����">
                    <itemtemplate>
                     <asp:HiddenField runat="server" id="hidCorpID" value='<%#Eval("CorpID") %>'></asp:HiddenField>
                     <asp:DropDownList id="orderid" datasource="<%#bindorder() %>" runat="server"></asp:DropDownList>
                     
</itemtemplate>
                    <headerstyle height="18px"/>
                    <itemstyle width="60px" horizontalalign="Center"  />
                </asp:TemplateField>
                  <asp:BoundField DataField="CorpName" HeaderText="������˾����">
                  <itemstyle horizontalalign="Center" width="150px" />
                </asp:BoundField>


           <asp:TemplateField HeaderText="��ַ">
                <ItemTemplate>
                 <span class="tips"><%# Eval("WebUrl").ToString()%></span>
                </ItemTemplate>
            </asp:TemplateField>
                
           <asp:TemplateField HeaderText="��ݹ�˾����">
               <itemstyle width="120px" horizontalalign="Center"  />
                <ItemTemplate>
                 <span class="tips"><%# Eval("CorpCode").ToString()%></span>
                </ItemTemplate>
            </asp:TemplateField>
                

                <asp:TemplateField HeaderText="�༭">
              <itemstyle width="30px" horizontalalign="Center"/>
              <itemtemplate>
                     <asp:LinkButton ID="LinkButton1" ToolTip="�༭" CssClass="edit" runat="server" commandargument=<%#Eval("CorpID") %> commandname="modify"></asp:LinkButton>
              </itemtemplate>
            </asp:TemplateField>
             
            <asp:TemplateField HeaderText="ɾ��">
                <itemstyle horizontalalign="Center" width="30px"/>
               <itemtemplate>
                     <asp:LinkButton runat="server" id="delete" ToolTip="ɾ��" CssClass="delete" commandargument=<%#Eval("CorpID") %> commandname="del"></asp:LinkButton>
               </itemtemplate>
            </asp:TemplateField>

                <asp:TemplateField HeaderText="��ݵ�ģ��">
                 <itemstyle Width="70px" horizontalalign="Center" />
                <itemtemplate>
                     <asp:LinkButton runat="server" id="LinkButton2" commandargument=<%#Eval("CorpID") %> commandname="print">����</asp:LinkButton>
                </itemtemplate>
                </asp:TemplateField>
            </Columns>
            <HeaderStyle CssClass="CTitle" />
            <EmptyDataRowStyle CssClass="emptycss" />
        </KS:KSGV>
        <br />
        <asp:Panel ID="Panel1" runat="server" Height="30px">
           &nbsp;&nbsp;&nbsp;&nbsp;<input type="checkbox" name="chkall" id="chkall" onclick="CheckAll(this.form);"/><label for="chkall">ȫ��ѡ��</label>
            <asp:Button ID="Button1" runat="server" Text="��������������˾����" OnClick="Button1_Click" />&nbsp;<br />
            </asp:Panel>
        &nbsp;
        </div>
     </asp:Panel>
    
    <asp:Panel ID="addPanel" runat="server" Width="100%" Visible="false">
    <script type="text/javascript">
       function CheckForm()
	        {
	         if(jQuery('#<%=this.TxtCorpName.ClientID %>').val()==''){
	            KesionJS.Alert('������������˾���ƣ�',null);
	           return false;
	         }
	   }

    
    </script>
        <KS:TopNav ID="TopNav1" runat="server" Text="���������˾" />
        &nbsp;
         <table width="99%" align="center" border="0" cellpadding="1" cellspacing="1" class="CTable"> 
             
            <tr>
                <td align="right" class="lefttd" height="30" style="width: 198px">
                    <strong>������˾���ƣ�</strong></td>
                <td class="righttd">
                    &nbsp;<asp:TextBox CssClass="textbox" ID="TxtCorpName" runat="server"></asp:TextBox>
                    <span style="color: #ff0066">*</span> <span class="tips"> ��:������,Բͨ��ݵȡ�</span><asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TxtCorpName"
                        ErrorMessage="������������˾����" Display="Dynamic"></asp:RequiredFieldValidator></td>
            </tr>
            <tr>
                <td align="right" class="lefttd" height="30" style="width: 198px">
                    <strong>������˾��ַ��</strong></td>
                <td class="righttd">
                    &nbsp;<asp:TextBox CssClass="textbox" ID="TxtWebUrl" runat="server" Width="200px"></asp:TextBox></td>
            
            </tr>
            <tr>
                <td align="right" class="lefttd" height="30" style="width: 198px">
                    <strong>��ݹ�˾����<br />(���100 API)��</strong></td>
                <td class="righttd">
                    &nbsp;<asp:TextBox CssClass="textbox" ID="TxtCorpCode" runat="server"  Width="200px"></asp:TextBox>
                    <span class="tips">���ٶ�������ʱ�õ��ģ�û�п�ͨ��ݲ�ѯ���Բ��<a href="http://code.google.com/p/kuaidi-api/wiki/Open_API_API_URL" target="_blank" style="color:red">���</a>�鿴��ݹ�˾���롣</span>

                </td>
            </tr>
            <tr>
                <td align="right" class="lefttd" height="30" style="width: 198px">
                    <strong>������ѯ��ַ��</strong></td>
                <td class="righttd">
                    &nbsp;<asp:TextBox CssClass="textbox" ID="TxtOrderUrl" runat="server"  Width="200px"></asp:TextBox></td>
            </tr>
             <tr>
                 <td align="right" class="lefttd" style="width: 198px;">
                     <strong>������˾���ܣ�</strong></td>
                 <td class="righttd">
                  <asp:TextBox ID="Content" TextMode="multiLine" style="width:80%;height:200px" runat="server"></asp:TextBox>
                <% Kesion.APPCode.EditorAPI.EchoEditor("editor", this.Content.ClientID, "Basic");%>

                 </td>
             </tr>
        </table>
        <br />
        <KS:Foot ID="Foot1" runat="server" OnSubmit="Foot1_Submit" SubmitButtonText="ȷ�����(0)" />
    
    </asp:Panel>
    
    
    <asp:Panel ID="printPanel" runat="server" Width="100%" Visible="false">
      <KS:TopNav ID="TopNav2" runat="server" Text="��ݵ���ӡģ������" />
      
      
      <script>
function CheckForm()
{
  jQuery("#template").val(jQuery("#mybody").html());
   if (jQuery("#template").val()==''){
	 KesionJS.Alert('ģ�����ݱ�������ǩ!','jQuery("#template").focus();');
	 return false;
   }
   return true;
}

var rDrag = {
    o:null,
    init:function(o){
    o.onmousedown = this.start;
    },
    start:function(e){
    var o;
    e = rDrag.fixEvent(e);
    e.preventDefault && e.preventDefault();
    rDrag.o = o = this;
    o.x = e.clientX - rDrag.o.offsetLeft;
    o.y = e.clientY - rDrag.o.offsetTop;
    document.onmousemove = rDrag.move;
    document.onmouseup = rDrag.end;
    },
    move:function(e){
    e = rDrag.fixEvent(e);
    var oLeft,oTop;
    oLeft = e.clientX - rDrag.o.x;
    oTop = e.clientY - rDrag.o.y;
    rDrag.o.style.left = oLeft + 'px';
    rDrag.o.style.top = oTop + 'px';
    },
    end:function(e){
    e = rDrag.fixEvent(e);
    rDrag.o = document.onmousemove = document.onmouseup = null;
    },
    fixEvent: function(e){
    if (!e) {
    e = window.event;
    e.target = e.srcElement;
    e.layerX = e.offsetX;
    e.layerY = e.offsetY;
    }
    return e;
    }
    }

var domid=1;	
function add_div()
{   var label=jQuery("#mylabel").val();
   if (label==''){KesionJS.Alert('��ѡ��ѡ��ǩ!',null);return;}
    var o=document.createElement("label");
    o.className="mo";
    o.id="m"+domid;
    jQuery("#mybody").append(o);
    o.innerHTML=label;
    domid++;
	rDrag.init(o);
	
	jQuery("#mybody").find(".mo").each(function(){ //˫��ɾ����ǩ
	   jQuery(this).dblclick(function(){
	    if (confirm('ȷ��ɾ���ñ�ǩ��')){
		 jQuery(this).remove();
		 }
	   });
    });
	
}
<%if (corpId!=0){%>
jQuery(function(){
 jQuery("#mybody").find("label").each(function(){
   rDrag.init(jQuery(this)[0]);
   jQuery(this).dblclick(function(){
	    if (confirm('ȷ��ɾ���ñ�ǩ��')){
		 jQuery(this).remove();
		 }
   });
 });
});
<%}%>

function changebg(v){
 if (v=='') return;
 jQuery("#mybody").attr("style","background:url(../../shop/express/"+v+")");
}
    </script>

    <style type="text/css">
	.mo{
	 display:block;
	border:1px solid #ff6600;
    padding:0px;
    height:22px;
	font-size:14px;
	line-height:22px;
    position:absolute;
	}
	
	 .box{position:relative;border:1px solid #ccc;border-top:2px solid #000;width:874px;height:483px;background:url(../../shop/express/<%=photoUrl%>) no-repeat;}
	 .noprint{display:naone;}
	 @media print {     
            .noprint{     
              display: none;    
        }     
    }     

    </style>

	<div class="noprint">

<table width="100%" border="0" align="center" cellpadding="1" cellspacing="1" class="ctable">
    <tr class="tdbg">
      <td height='26' class='clefttitle' style="text-align:left"><strong>����ͼƬ��</strong><select name="photourl" onchange="changebg(this.value);">
		<option value=''>��ѡ��...</option>
		<%
		string _path="~/shop/express/";
		string[] files = Directory.GetFiles(Server.MapPath(_path));
		foreach (string file in files)
        {
            System.IO.FileInfo fileInfo = new FileInfo(file);
            string fileName=fileInfo.Name;
            if (fileName.ToLower().IndexOf(".jpg")!=-1 || fileName.ToLower().IndexOf(".gif")!=-1||fileName.ToLower().IndexOf(".png")!=-1){
               if (photoUrl.ToLower()==fileName.ToLower()){
                   Response.Write(string.Format(@"<option value='{0}' selected>{0}</option>",fileName));
               }else{
                   Response.Write(string.Format(@"<option value='{0}'>{0}</option>",fileName));
               }
            }
        }    
		
	  %>
		</select>
		&nbsp;&nbsp;<span class="tips">�뽫ɨ��õĿ�ݵ�ͼƬ�ŵ�/shop/express/Ŀ¼�£����874*483</span>
		
	  </td>
      
    </tr>
<tr class="tdbg">
      <td height='26' class='clefttitle' style="text-align:left">
		  <strong>�����ǩ��</strong><select name="mylabel" id="mylabel">
		   <option value=''>��ѡ���ǩ...</option>
		   <OPTGROUP label="�ļ��˱�ǩ"/> 
		   <option value='{$�ļ���_����}'>{$�ļ���_����}</option>
		   <option value='{$�ļ���_��ַ}'>{$�ļ���_��ַ}</option>
		   <option value='{$�ļ���_�绰}'>{$�ļ���_�绰}</option>
		   <option value='{$�ļ���_�ֻ�}'>{$�ļ���_�ֻ�}</option>
		   <option value='{$�ļ���_�ʱ�}'>{$�ļ���_�ʱ�}</option>
		   <option value='{$�ļ���_��λ}'>{$�ļ���_��λ}</option>
		   <option value='{$�ļ���_����˵��1}'>{$�ļ���_����˵��1}</option>
		   <option value='{$�ļ���_����˵��2}'>{$�ļ���_����˵��2}</option>
		   <option value='{$�ļ���_����˵��3}'>{$�ļ���_����˵��3}</option>
		   <option value='{$�ļ���_����˵��4}'>{$�ļ���_����˵��4}</option>
		   <option value='{$�ļ���_����˵��5}'>{$�ļ���_����˵��5}</option>
          <OPTGROUP label="�ռ��˱�ǩ"/> 
		   <option value='{$�ռ���_����}'>{$�ռ���_����}</option>
		   <option value='{$�ռ���_��ַ}'>{$�ռ���_��ַ}</option>
		   <option value='{$�ռ���_�绰}'>{$�ռ���_�绰}</option>
		   <option value='{$�ռ���_�ֻ�}'>{$�ռ���_�ֻ�}</option>
		   <option value='{$�ռ���_�ʱ�}'>{$�ռ���_�ʱ�}</option>
		   <option value='{$�ռ���_Ŀ�ĵ�}'>{$�ռ���_Ŀ�ص�}</option>
		  <OPTGROUP label="������ǩ"/>  
		   <option value='{$��}'>{$��ǰ����_��}</option>
		   <option value='{$��}'>{$��ǰ����_��}</option>
		   <option value='{$��}'>{$��ǰ����_��}</option>
		   <option value='{$ʱ}'>{$��ǰ����_ʱ}</option>
		   <option value='{$��}'>{$��ǰ����_��}</option>
		   <option value='{$��}'>{$��ǰ����_��}</option>
		   <option value='{$����_��ע����}'>{$����_��ע����}</option>
		   <option value='{$����_�ܽ��}'>{$����_�ܽ��}</option>
		   <option value='{$����_�ͻ�����}'>{$����_�ͻ�����}</option>
		   <option value='{$����_�ͻ�ʱ��}'>{$����_�ͻ�ʱ��}</option>
		   
		   <option value='��'>{$��_��}</option>
		  </select>
		  <textarea name="template" style="display:none" id="template"></textarea>
		  <input type='button' class="button" value=" �����ǩ " onclick="add_div();"/>
		  
		 <asp:Button CssClass="button" ID="BtnSubmit" Text="����ģ��" runat="server" 
              OnClientClick="return(CheckForm())"
              onclick="BtnSubmit_Click" />
		  <input type="button" class="button" value="����������˾����" onclick="location.href='KS.ShopDeliveryCorp.aspx';" />
		   
   </td>
  </tr>
</table>
	</div>

   <div id="mybody" class="box"><%=template%></div>
   
    <br />
        <script type="text/javascript">
            showtips('<img src="../../admin/images/dot.gif"> <span><strong>ģ���ǩ˵����</strong><br /></span>��ʾ�������б�ǩ�����϶���˫����ǩ����ɾ����<br /><img src="../../admin/images/dot.gif"> <strong>��ӡע����� </strong><br/>���ô�ӡ���ĳߴ磬��ʼ->��ӡ���ʹ���->�һ� ����������->�����¸�ʽ->��д��ݵ��ߴ磨һ���СΪ��23cm*12.7cm��<br/>��ӡ�����ֽ��ʱ��ֽ��һ������������룬Ȼ���ٶ����ұߡ������������<br/>ɨ��õĿ�ݵ�ͼƬ��СӦ�øĳ�874*483<br/>���������ҳ���������� �Ϻ��¸ĳ�0,ҳüҳ�Ŷ�Ҫ����Ϊ�գ��ǳ���Ҫ��<br/>Ҫ��ʼ��ӡʱ�����ӡ��������ֽ�Ŵ�С��ѡ���ӡ��->��ӡ��ѡ��->�߼�->ѡ��ֽ�Ź��ѡ��յ�һ����ӵ�ֽ��񼴿ɡ�');
		</script>
		
    </asp:Panel>

  </asp:Content>