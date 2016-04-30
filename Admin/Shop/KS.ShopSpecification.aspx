<%@ Page Language="C#" EnableEventValidation="false"  MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.Admin.Shop.Admin_ShopSpecification" Title="商品规格管理" Codebehind="KS.ShopSpecification.aspx.cs" %>
<%@ Import Namespace="Kesion.BLL" %>
<asp:Content ID="Content1" ContentPlaceHolderID="KSContent" Runat="Server">
     <asp:Panel ID="SpecificationList" runat="server" Width="100%">
      <div id="manage_top" class="menu_top_fixed">
        <ul>
          <li id='p9'><a href="KS.ShopSpecial.aspx"><b></b>返回规格组管理</a></li>
           <li id='p1'><asp:LinkButton ID="addSpecification" runat="server" OnClick="addSpecification_Click"><b></b>添加</asp:LinkButton></li>
           <li id='p4'><asp:LinkButton ID="editSpecification" runat="server" OnClick="editSpecification_Click"><b></b>编辑</asp:LinkButton></li>
           <li id='p3'><asp:LinkButton ID="delSpecificationBtn" runat="server" OnClick="delSpecification_Click"><b></b>删除</asp:LinkButton></li>
        </ul>
      </div>   
       <div class="menu_top_fixed_height"></div>
       <KS:KSGV ID="list" cssclass="CTable" runat="server" AutoGenerateColumns="False" Width="99%" EmptyDataText="没有添加任何商品规格!" GridLines="None" OnRowDataBound="list_RowDataBound" OnRowCommand="list_RowCommand" OnRowCreated="list_RowCreated">
          <Columns>
              <asp:TemplateField HeaderText="<input type='checkbox' name='chkall' id='chkall' onclick='CheckAll(this.form);'/>">
                <itemstyle horizontalalign="Center" width="50px" />
                <itemtemplate>
                    <input type="checkbox"  name="ids" id="ids" value='<%#Eval("id") %>' />
                </itemtemplate>
              </asp:TemplateField>
             <asp:TemplateField HeaderText="属性名称">
             <itemtemplate>
             <%# Eval("Title") %> 
             </itemtemplate>
             </asp:TemplateField> 
             <asp:TemplateField HeaderText="属性值">
             <itemstyle/>
             <itemtemplate>
             <span class="tips"><%# GetSpeicalValue(Convert.ToString(Eval("SValue"))) %></span>
             </itemtemplate>
             </asp:TemplateField>
             
             <asp:TemplateField HeaderText="显示类型">
               <itemstyle width="60px" horizontalalign="Center"/>
             <itemtemplate>
             <%# Convert.ToInt16(Eval("ShowType"))==1?"文字":"图片"%>
             </itemtemplate>
             </asp:TemplateField>
             <asp:BoundField DataField="OrderID"  HeaderText="序号">
                  <itemstyle horizontalalign="Center" width="40px" />
                </asp:BoundField>
                
            <asp:TemplateField HeaderText="编辑">
              <itemstyle width="30px" horizontalalign="Center"/>
              <itemtemplate>
               <asp:LinkButton ID="LinkButton1" CssClass="edit" ToolTip="编辑" runat="server" commandargument=<%#Eval("id") %> commandname="modify"></asp:LinkButton>
              </itemtemplate>
            </asp:TemplateField>
             
            <asp:TemplateField HeaderText="删除">
                <itemstyle horizontalalign="Center" Width="30px" />
               <itemtemplate>
                <asp:LinkButton CssClass="delete" ToolTip="删除" runat="server" id="delete" commandargument=<%#Eval("id") %> commandname="del"></asp:LinkButton>
               </itemtemplate>
            </asp:TemplateField>
          </Columns>
            <HeaderStyle CssClass="CTitle" />
            <EmptyDataRowStyle CssClass="emptycss" />
      </KS:KSGV>

    
    <KS:Page ID="Page1" runat="server" />
        
    </asp:Panel>
    
    <asp:Panel ID="SpecificationManage" runat="server" Width="100%" Visible="false">
    
        <KS:TopNav ID="TopNav1" runat="server" />
       
       <script>
function CheckForm() {
   
	if (jQuery('#<%=this.TxtTitle.ClientID %>').val()==''){
	    KesionJS.Alert( '请输入商品规格名称！', "jQuery('#<%=this.TxtTitle.ClientID %>').focus()");
	  return false;
	}

 var num=parseInt(jQuery("#num").val());
 if (num == 0) {
     KesionJS.Alert( '规格值必须输入！', null);
  return false;
 }
 for (var i=0;i<num;i++){
     if (jQuery("#item" + i).val() == '') {
         KesionJS.Alert( '第' + (i + 1) + '个规格值必须输入!', "jQuery('#item" + i + "').focus()");
	 return false;
   }
   if (parseInt(jQuery("input[@name='ShowType']:checked").val())==2){
       if (jQuery("#itempic" + i).val() == '') {
           KesionJS.Alert( '第' + (i + 1) + '个规格值的图片必须输入!', "jQuery('#itempic" + i + "').focus()");
		 return false;
	   }
   }

}
return true;
}
function showpic() {
    var v = jQuery("#<%=this.RdbShowType.ClientID %> :radio[checked]").val();
 if (v==1){
  jQuery("#table1").find(".tp").hide();
 }else{
  jQuery("#table1").find(".tp").show();
 }
}
function doadd(){
    var str="";
	var ss='display:none;';
	if (parseInt(jQuery("#<%=this.RdbShowType.ClientID %> :radio[checked]").val()) == 2) {
	ss=''
	}
	var num=parseInt( jQuery("#num").val());
	str = str + "<tr id='tr" + num + "'><td class='Ctd'><input class=textbox type=text name=item id=item" + num + " size=20></td><td class='tp Ctd' class='splittd' style='" + ss + ";text-align:center'><input class=textbox type=text name=itempic id=itempic" + num + " size=26>&nbsp;<input class='button'  type='button' name='Submit' value='选择...' onClick=\"SelectFiles('itempic" + num + "');\"></td><td class='Ctd' style='text-align:center'><a href='javascript:deltd(" + num + ")' name='delbtn'>删除</a></td></tr>";
     jQuery("#additem").append(str);
	 jQuery("#num").val(parseInt(jQuery("#num").val())+1);
}
function deltd(i){
 jQuery("#tr"+i).remove();
}


</script>
        
        <table width="99%" align="center" border="0" cellpadding="1" cellspacing="1" class="CTable"> 
          <tr>
            <td class="lefttd" height="30" align="right" style="width: 198px"><strong>商品规格名称：</strong></td>
            <td class="righttd">
                &nbsp;<asp:TextBox CssClass="textbox" ID="TxtTitle" runat="server"></asp:TextBox> <span class="tips">如: 颜色、尺码、型号等</span>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TxtTitle"
                    ErrorMessage="请输入商品规格名称!"></asp:RequiredFieldValidator>
            </td>
          </tr>
           
            <tr>
                <td align="right" class="lefttd" height="30" style="width: 198px">
                    <strong>显示类型：</strong></td>
                <td class="righttd">
                   
                   <asp:RadioButtonList ID="RdbShowType" runat="server">
                    <asp:ListItem value="1" Selected>文字</asp:ListItem>
                    <asp:ListItem Value="2">图片</asp:ListItem>
                   </asp:RadioButtonList>
                   
                   </td>
            </tr>
           
            <tr>
                <td align="right" class="lefttd" height="30" style="width: 198px">
                    <strong>序号：</strong></td>
                <td class="righttd">
                    <asp:TextBox CssClass="textbox" ID="TxtOrderID" Text="1" style="text-align:center" runat="server" Width="56px"></asp:TextBox><span style="color: #999">值越小排在越前面。</span></td>
            </tr>

           
            
            <tr>
                <td colspan="2" class="righttd" style="padding:20px">
                
                <input type='button' class="button" onclick="doadd()" value="添加规格值"> <br/>
	    <table width="98%" id='table1' class="CTable" cellpadding="1" cellspacing="1" border="0">
		  <tr class="CTitle">
		    <td style="text-align:center">规则格值名称</td>
			<td class='tp' id='tp'style='<%if (ShowType==1){%>display:none;<%}%>width:400px;text-align:center'>图片</td>
			<td style="width:200px;text-align:center">操作</td>
		  </tr>
		  
		 <%
             if (!string.IsNullOrEmpty(SValue))
             {
                 string[] SArr = SValue.Split(',');
                 string v1 = string.Empty;
                 string v2 = string.Empty;
                 string ss = string.Empty;
                 num = SArr.Length + 1;
                 for (int i = 0; i < SArr.Length; i++)
                 {
                     if (ShowType == 1)
                     {
                         ss = "display:none;";
                         v1 = SArr[i].Trim();
                         v2 = string.Empty;
                     }
                     else
                     {
                         ss = string.Empty;
                         v1 = SArr[i].Split('|')[0];
                         v2 = SArr[i].Split('|')[1];
                     }
                     Response.Write(string.Format(@"<tr id='tr{0}'><td class='Ctd'><input class=textbox type=text value='{1}' name=item id=item{0} size=20></td><td class='tp' class='splittd' style='{3}text-align:center'><input value='{2}' type=text class=textbox name=itempic id=itempic{0} size=26>&nbsp;<input class='button'  type='button' name='Submit' value='选择...' onClick=""SelectFiles('itempic{0}',4);""> </td><td class='splittd' style='text-align:center'><a href='javascript:deltd({0})' name='delbtn'>删除</a></td></tr>", i, v1, v2, ss));
                 }

             }
             else
             {
                 num = 0;
             }
		%>     
		
		
		    
			
		  <tbody id="additem"> </tbody>
		</table>
	  	   <input type='hidden' name="num" id="num" value="<%=num%>"/>
	  	   
	  	   
                </td>
            </tr>
            
           
        </table>
      <br />
      <KS:Foot ID="Foot1" runat="server" OnSubmit="Foot1_Submit" />
      
    </asp:Panel>
    
</asp:Content>

