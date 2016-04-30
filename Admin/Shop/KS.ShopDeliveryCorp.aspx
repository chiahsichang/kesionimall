<%@ Page Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.Admin.Shop.Admin_ShopDeliveryCorp" Title="物流公司管理" Codebehind="KS.ShopDeliveryCorp.aspx.cs" %>
<%@ Import Namespace="System.IO" %>
<%@ Import Namespace="Kesion.Publics" %>

<asp:Content ID="Content1" ContentPlaceHolderID="KSContent" Runat="Server">
    <asp:Panel ID="listPanel" runat="server" Width="100%">
      <div id="manage_top" class="menu_top_fixed">
        <ul>
        <li id='p1'><asp:LinkButton ID="addbutton" runat="server" OnClick="addbutton_Click"><b></b>新增物流公司</asp:LinkButton></li>
        
        <li id='p4'><asp:LinkButton ID="editbutton" runat="server" OnClick="editTask_Click"><b></b>编辑物流公司</asp:LinkButton></li>
        <li id='p3'><asp:LinkButton ID="delbutton" runat="server" OnClick="delTask_Click"><b></b>删除物流公司</asp:LinkButton></li>
        </ul>
        
      </div>     
       <div class="menu_top_fixed_height"></div>
    <div>
        <KS:OrderJS ID="OrderJS1" runat="server" />
        <KS:KSGV ID="PaymentListView" cssclass="CTable" runat="server" AutoGenerateColumns="False" DataKeyNames="FieldID" GridLines="None"
            OnRowDataBound="FieldListView_RowDataBound" PagerType="CustomNumeric" Width="99%" EnableTheming="True" OnRowCommand="FieldListView_RowCommand" EmptyDataText="您还没有添加任何物流公司,请<a href='?action=add'>点此添加</a>!">
            <Columns>
                <asp:TemplateField HeaderText="选择">
                <itemstyle horizontalalign="Center" width="50px" />
                <itemtemplate>
                    <input type="checkbox"  name="ids" id="ids" value="<%#Eval("CorpID") %>" />
                </itemtemplate>
              </asp:TemplateField>
                <asp:TemplateField HeaderText="排序">
                    <itemtemplate>
                     <asp:HiddenField runat="server" id="hidCorpID" value='<%#Eval("CorpID") %>'></asp:HiddenField>
                     <asp:DropDownList id="orderid" datasource="<%#bindorder() %>" runat="server"></asp:DropDownList>
                     
</itemtemplate>
                    <headerstyle height="18px"/>
                    <itemstyle width="60px" horizontalalign="Center"  />
                </asp:TemplateField>
                  <asp:BoundField DataField="CorpName" HeaderText="物流公司名称">
                  <itemstyle horizontalalign="Center" width="150px" />
                </asp:BoundField>


           <asp:TemplateField HeaderText="网址">
                <ItemTemplate>
                 <span class="tips"><%# Eval("WebUrl").ToString()%></span>
                </ItemTemplate>
            </asp:TemplateField>
                
           <asp:TemplateField HeaderText="快递公司代码">
               <itemstyle width="120px" horizontalalign="Center"  />
                <ItemTemplate>
                 <span class="tips"><%# Eval("CorpCode").ToString()%></span>
                </ItemTemplate>
            </asp:TemplateField>
                

                <asp:TemplateField HeaderText="编辑">
              <itemstyle width="30px" horizontalalign="Center"/>
              <itemtemplate>
                     <asp:LinkButton ID="LinkButton1" ToolTip="编辑" CssClass="edit" runat="server" commandargument=<%#Eval("CorpID") %> commandname="modify"></asp:LinkButton>
              </itemtemplate>
            </asp:TemplateField>
             
            <asp:TemplateField HeaderText="删除">
                <itemstyle horizontalalign="Center" width="30px"/>
               <itemtemplate>
                     <asp:LinkButton runat="server" id="delete" ToolTip="删除" CssClass="delete" commandargument=<%#Eval("CorpID") %> commandname="del"></asp:LinkButton>
               </itemtemplate>
            </asp:TemplateField>

                <asp:TemplateField HeaderText="快递单模板">
                 <itemstyle Width="70px" horizontalalign="Center" />
                <itemtemplate>
                     <asp:LinkButton runat="server" id="LinkButton2" commandargument=<%#Eval("CorpID") %> commandname="print">设置</asp:LinkButton>
                </itemtemplate>
                </asp:TemplateField>
            </Columns>
            <HeaderStyle CssClass="CTitle" />
            <EmptyDataRowStyle CssClass="emptycss" />
        </KS:KSGV>
        <br />
        <asp:Panel ID="Panel1" runat="server" Height="30px">
           &nbsp;&nbsp;&nbsp;&nbsp;<input type="checkbox" name="chkall" id="chkall" onclick="CheckAll(this.form);"/><label for="chkall">全部选中</label>
            <asp:Button ID="Button1" runat="server" Text="批量设置物流公司排序" OnClick="Button1_Click" />&nbsp;<br />
            </asp:Panel>
        &nbsp;
        </div>
     </asp:Panel>
    
    <asp:Panel ID="addPanel" runat="server" Width="100%" Visible="false">
    <script type="text/javascript">
       function CheckForm()
	        {
	         if(jQuery('#<%=this.TxtCorpName.ClientID %>').val()==''){
	            KesionJS.Alert('请输入物流公司名称！',null);
	           return false;
	         }
	   }

    
    </script>
        <KS:TopNav ID="TopNav1" runat="server" Text="添加物流公司" />
        &nbsp;
         <table width="99%" align="center" border="0" cellpadding="1" cellspacing="1" class="CTable"> 
             
            <tr>
                <td align="right" class="lefttd" height="30" style="width: 198px">
                    <strong>物流公司名称：</strong></td>
                <td class="righttd">
                    &nbsp;<asp:TextBox CssClass="textbox" ID="TxtCorpName" runat="server"></asp:TextBox>
                    <span style="color: #ff0066">*</span> <span class="tips"> 如:天天快递,圆通快递等。</span><asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TxtCorpName"
                        ErrorMessage="请输入物流公司名称" Display="Dynamic"></asp:RequiredFieldValidator></td>
            </tr>
            <tr>
                <td align="right" class="lefttd" height="30" style="width: 198px">
                    <strong>物流公司网址：</strong></td>
                <td class="righttd">
                    &nbsp;<asp:TextBox CssClass="textbox" ID="TxtWebUrl" runat="server" Width="200px"></asp:TextBox></td>
            
            </tr>
            <tr>
                <td align="right" class="lefttd" height="30" style="width: 198px">
                    <strong>快递公司代码<br />(快递100 API)：</strong></td>
                <td class="righttd">
                    &nbsp;<asp:TextBox CssClass="textbox" ID="TxtCorpCode" runat="server"  Width="200px"></asp:TextBox>
                    <span class="tips">跟踪订单物流时用到的，没有开通快递查询可以不填。<a href="http://code.google.com/p/kuaidi-api/wiki/Open_API_API_URL" target="_blank" style="color:red">点此</a>查看快递公司代码。</span>

                </td>
            </tr>
            <tr>
                <td align="right" class="lefttd" height="30" style="width: 198px">
                    <strong>订单查询网址：</strong></td>
                <td class="righttd">
                    &nbsp;<asp:TextBox CssClass="textbox" ID="TxtOrderUrl" runat="server"  Width="200px"></asp:TextBox></td>
            </tr>
             <tr>
                 <td align="right" class="lefttd" style="width: 198px;">
                     <strong>物流公司介绍：</strong></td>
                 <td class="righttd">
                  <asp:TextBox ID="Content" TextMode="multiLine" style="width:80%;height:200px" runat="server"></asp:TextBox>
                <% Kesion.APPCode.EditorAPI.EchoEditor("editor", this.Content.ClientID, "Basic");%>

                 </td>
             </tr>
        </table>
        <br />
        <KS:Foot ID="Foot1" runat="server" OnSubmit="Foot1_Submit" SubmitButtonText="确定添加(0)" />
    
    </asp:Panel>
    
    
    <asp:Panel ID="printPanel" runat="server" Width="100%" Visible="false">
      <KS:TopNav ID="TopNav2" runat="server" Text="快递单打印模板配置" />
      
      
      <script>
function CheckForm()
{
  jQuery("#template").val(jQuery("#mybody").html());
   if (jQuery("#template").val()==''){
	 KesionJS.Alert('模板内容必须放入标签!','jQuery("#template").focus();');
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
   if (label==''){KesionJS.Alert('请选择选标签!',null);return;}
    var o=document.createElement("label");
    o.className="mo";
    o.id="m"+domid;
    jQuery("#mybody").append(o);
    o.innerHTML=label;
    domid++;
	rDrag.init(o);
	
	jQuery("#mybody").find(".mo").each(function(){ //双击删除标签
	   jQuery(this).dblclick(function(){
	    if (confirm('确定删除该标签吗？')){
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
	    if (confirm('确定删除该标签吗？')){
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
      <td height='26' class='clefttitle' style="text-align:left"><strong>背景图片：</strong><select name="photourl" onchange="changebg(this.value);">
		<option value=''>请选择...</option>
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
		&nbsp;&nbsp;<span class="tips">请将扫描好的快递单图片放到/shop/express/目录下，规格：874*483</span>
		
	  </td>
      
    </tr>
<tr class="tdbg">
      <td height='26' class='clefttitle' style="text-align:left">
		  <strong>插入标签：</strong><select name="mylabel" id="mylabel">
		   <option value=''>请选择标签...</option>
		   <OPTGROUP label="寄件人标签"/> 
		   <option value='{$寄件人_姓名}'>{$寄件人_姓名}</option>
		   <option value='{$寄件人_地址}'>{$寄件人_地址}</option>
		   <option value='{$寄件人_电话}'>{$寄件人_电话}</option>
		   <option value='{$寄件人_手机}'>{$寄件人_手机}</option>
		   <option value='{$寄件人_邮编}'>{$寄件人_邮编}</option>
		   <option value='{$寄件人_单位}'>{$寄件人_单位}</option>
		   <option value='{$寄件人_其它说明1}'>{$寄件人_其它说明1}</option>
		   <option value='{$寄件人_其它说明2}'>{$寄件人_其它说明2}</option>
		   <option value='{$寄件人_其它说明3}'>{$寄件人_其它说明3}</option>
		   <option value='{$寄件人_其它说明4}'>{$寄件人_其它说明4}</option>
		   <option value='{$寄件人_其它说明5}'>{$寄件人_其它说明5}</option>
          <OPTGROUP label="收件人标签"/> 
		   <option value='{$收件人_姓名}'>{$收件人_姓名}</option>
		   <option value='{$收件人_地址}'>{$收件人_地址}</option>
		   <option value='{$收件人_电话}'>{$收件人_电话}</option>
		   <option value='{$收件人_手机}'>{$收件人_手机}</option>
		   <option value='{$收件人_邮编}'>{$收件人_邮编}</option>
		   <option value='{$收件人_目的地}'>{$收件人_目地的}</option>
		  <OPTGROUP label="其它标签"/>  
		   <option value='{$年}'>{$当前日期_年}</option>
		   <option value='{$月}'>{$当前日期_月}</option>
		   <option value='{$日}'>{$当前日期_日}</option>
		   <option value='{$时}'>{$当前日期_时}</option>
		   <option value='{$分}'>{$当前日期_分}</option>
		   <option value='{$秒}'>{$当前日期_秒}</option>
		   <option value='{$订单_备注留言}'>{$订单_备注留言}</option>
		   <option value='{$订单_总金额}'>{$订单_总金额}</option>
		   <option value='{$订单_送货日期}'>{$订单_送货日期}</option>
		   <option value='{$订单_送货时间}'>{$订单_送货时间}</option>
		   
		   <option value='√'>{$打勾_√}</option>
		  </select>
		  <textarea name="template" style="display:none" id="template"></textarea>
		  <input type='button' class="button" value=" 插入标签 " onclick="add_div();"/>
		  
		 <asp:Button CssClass="button" ID="BtnSubmit" Text="保存模板" runat="server" 
              OnClientClick="return(CheckForm())"
              onclick="BtnSubmit_Click" />
		  <input type="button" class="button" value="返回物流公司管理" onclick="location.href='KS.ShopDeliveryCorp.aspx';" />
		   
   </td>
  </tr>
</table>
	</div>

   <div id="mybody" class="box"><%=template%></div>
   
    <br />
        <script type="text/javascript">
            showtips('<img src="../../admin/images/dot.gif"> <span><strong>模板标签说明：</strong><br /></span>提示，鼠标点中标签可以拖动，双击标签可以删除。<br /><img src="../../admin/images/dot.gif"> <strong>打印注意事项： </strong><br/>设置打印机的尺寸，开始->打印机和传真->右击 服务器属性->创建新格式->填写快递单尺寸（一般大小为：23cm*12.7cm）<br/>打印机后进纸的时候，纸张一定靠左，以左对齐，然后再对齐右边。这样不会打歪<br/>扫描好的快递单图片大小应该改成874*483<br/>把浏览器的页面设置量的 上和下改成0,页眉页脚都要设置为空（非常重要）<br/>要开始打印时需给打印机设置下纸张大小：选择打印机->打印首选项->高级->选择纸张规格，选择刚第一步添加的纸规格即可。');
		</script>
		
    </asp:Panel>

  </asp:Content>