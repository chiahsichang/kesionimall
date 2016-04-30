<%@ Page Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.Admin.Shop.Admin_ShopDeliveryAddress" Title="送货地址管理" Codebehind="KS.ShopDeliveryAddress.aspx.cs" %>
<%@ Import Namespace="Kesion.Cache" %>
<asp:Content ID="Content1" ContentPlaceHolderID="KSContent" Runat="Server">
    <asp:Panel ID="listPanel" runat="server" Width="100%">
      <div id="manage_top" class="menu_top_fixed">
        <ul>   
             <span style="float:right">
             &nbsp;&nbsp;<strong>搜索=></strong>
    <asp:DropDownList ID="DrpSearchType" runat="server">
     <asp:ListItem Value="1">用户名</asp:ListItem>
     <asp:ListItem Value="2">收货人</asp:ListItem>
    </asp:DropDownList>
    <asp:TextBox ID="TxtKey"  CssClass="textbox" runat="server" Width="100px"></asp:TextBox> 
<asp:Button ID="Button2" runat="server" Text=" 查 找 " CssClass="button" OnClick="Button2_Click" />
            </span>

        <li id='p4'><asp:LinkButton ID="editbutton" runat="server" OnClick="editTask_Click"><b></b>编辑收货地址</asp:LinkButton></li>
        <li id='p3'><asp:LinkButton ID="delbutton" runat="server" OnClick="delTask_Click"><b></b>删除收货地址</asp:LinkButton></li>
        </ul> 
      </div>     
      <div class="menu_top_fixed_height"></div>
    <div>
        <KS:KSGV ID="AddressListView" cssclass="CTable" runat="server" AutoGenerateColumns="False" DataKeyNames="FieldID" GridLines="None"
            OnRowDataBound="FieldListView_RowDataBound" PagerType="CustomNumeric" Width="99%" EnableTheming="True" OnRowCommand="FieldListView_RowCommand" EmptyDataText="没有找到任何收货地址!">
            <Columns>
                <asp:TemplateField HeaderText="选择">
                <itemstyle horizontalalign="Center" width="50px" />
                <itemtemplate>
                    <input type="checkbox"  name="ids" id="ids" value="<%#Eval("AddressID") %>" />
                </itemtemplate>
              </asp:TemplateField>
                
                <asp:BoundField DataField="UserName" HeaderText="用户名">
                </asp:BoundField>
                <asp:BoundField DataField="RealName" HeaderText="收货人">
                <itemstyle width="130px" horizontalalign="Center" />
                </asp:BoundField>
                
              <asp:TemplateField HeaderText="送货地址">
                  <itemstyle  width="250px" />
                <ItemTemplate>
                  <%# MyCache.GetAreaName(Convert.ToInt16(Eval("Provinceid")),"city") %><%# MyCache.GetAreaName(Convert.ToInt16(Eval("Cityid")), "city")%><%# MyCache.GetAreaName(Convert.ToInt16(Eval("Countyid")), "city")%>
                  <%# Eval("Address").ToString() %>
                 <span class="tips"><%# Eval("Title") %></span>
                </ItemTemplate>  
              </asp:TemplateField>
                
                <asp:BoundField DataField="ZipCode" HeaderText="邮编">
                  <itemstyle horizontalalign="Center" width="120px" />
                </asp:BoundField>

                <asp:TemplateField HeaderText="联系电话">
                   <itemstyle horizontalalign="Center" width="120px" />
                <ItemTemplate>
                  <%# Eval("Tel").ToString() %>
                  <%# Eval("Mobile").ToString() %>
                </ItemTemplate>  
              </asp:TemplateField>

 

          <asp:TemplateField HeaderText="编辑">
              <itemstyle width="30px" horizontalalign="Center"/>
              <itemtemplate>
                     <asp:LinkButton ID="LinkButton1" CssClass="edit" ToolTip="编辑" runat="server" commandargument=<%#Eval("AddressID") %> commandname="modify"></asp:LinkButton>
              </itemtemplate>
            </asp:TemplateField>
             
            <asp:TemplateField HeaderText="删除">
                <itemstyle horizontalalign="Center" width="30px"/>
               <itemtemplate>
                     <asp:LinkButton runat="server" CssClass="delete" ToolTip="删除" id="delete" commandargument=<%#Eval("AddressID") %> commandname="del"></asp:LinkButton>
               </itemtemplate>
            </asp:TemplateField>

                
              
            </Columns>
            <HeaderStyle CssClass="CTitle" />
            <EmptyDataRowStyle CssClass="emptycss" />
        </KS:KSGV>
        <br />
        <asp:Panel ID="Panel1" runat="server" Height="30px" Width="739px">
            &nbsp;&nbsp;&nbsp;&nbsp;<input type="checkbox" name="chkall" id="chkall" onclick="CheckAll(this.form);"/><label for="chkall">全部选中</label>
            <asp:Button ID="Button1" runat="server" Text="批量删除收货地址" OnClick="Button1_Click" />&nbsp;<br />
            </asp:Panel>
        &nbsp;
        </div>
        
         <KS:Page ID="Page1" runat="server" />
          <br />
        <script type="text/javascript">
		showtips('<span class="state"><strong>说明：</strong><br /></span>这里管理的是客户的自己添加的收货地址,您可以在此进行编辑,删除操作!');
		</script>
     </asp:Panel>
    
    <asp:Panel ID="addPanel" runat="server" Width="100%" Visible="false">
    <script type="text/javascript">
       function CheckForm()
	        {
	         if(jQuery('#<%=this.TxtRealName.ClientID %>').val()==''){
	            KesionJS.Alert('请输入收货人姓名！',null);
	           return false;
	         }
	   }

	 function loadCity(){
	   var pid=jQuery("#provinceid option:selected").val();
	   if (pid!=''){
	     jQuery.get("../../plus/ajaxs.ashx", { a: "loadcityoption", pid:pid},
			 function(data){
					if (data!=null&&data!=''){
					  jQuery("#showcity").show();
					  jQuery("#cityid").empty();
					  jQuery("#cityid").append("<option value=''>请选择...</option>");
					  jQuery("#cityid").append(data);
					}else{
					  jQuery("#showcity").hide();
					  jQuery("#cityid").empty();
					  jQuery("#cityid").append("<option value=''>请选择...</option>");
					}
					jQuery("#showcounty").hide();
					jQuery("#countyid").empty();
					jQuery("#countyid").append("<option value=''>请选择...</option>");
			  });
	  }
	  jQuery("#showselectarea").html(jQuery("#provinceid option:selected").get(0).text);
	 }
	 function loadCounty(){
	   var cid=jQuery("#cityid option:selected").val();
	   if (cid!=''){
	     jQuery.get("../../plus/ajaxs.ashx", { a: "loadcountyoption", cid:cid},
			 function(data){
					if (data!=null&&data!=''){
					jQuery("#showcounty").show();
					jQuery("#countyid").empty();
					jQuery("#countyid").append("<option value=''>请选择...</option>");
					jQuery("#countyid").append(data);
					}else{
					jQuery("#showcounty").hide();
					jQuery("#countyid").empty();
					jQuery("#countyid").append("<option value=''>请选择...</option>");
					}
			  });
		}
	  	var str=jQuery("#provinceid option:selected").get(0).text;
	   try{
	   if (jQuery("#cityid option:selected").val()!='') str+=jQuery("#cityid option:selected").get(0).text;
	   }catch(e){
	   }
	   jQuery("#showselectarea").html(str);

	 }
	 function loadSelect(){
	   var str=jQuery("#provinceid option:selected").get(0).text;
	   try{
	   if (jQuery("#cityid option:selected").val()!='') str+=jQuery("#cityid option:selected").get(0).text;
	   if (jQuery("#countyid option:selected").val()!='') str+=jQuery("#countyid option:selected").get(0).text;
	   }catch(e){
	   }
	   jQuery("#showselectarea").html(str);
	 }

    </script>
        <KS:TopNav ID="TopNav1" runat="server" Text="添加收货地址" />
        &nbsp;
         <table width="100%" border="0" cellpadding="1" cellspacing="1" class="CTable"> 
             
            <tr>
                <td align="right" class="lefttd" height="30" style="width: 198px">
                    <strong>收货地址：</strong></td>
                <td class="righttd">
                <asp:Label ID="LabProvince" runat="server"></asp:Label>
                <asp:Label ID="LabCity" runat="server"></asp:Label>
                <asp:Label ID="LabCounty" runat="server"></asp:Label>

                </td>
            </tr>
            <tr>
                <td align="right" class="lefttd" height="30" style="width: 198px">
                    <strong>地　　址：</strong></td>
                <td class="righttd"><span id="showselectarea"><%=addStr %></span>
                    <asp:TextBox ID="TxtAddress" CssClass="textbox" runat="server"></asp:TextBox>
                     <span style="color:Red">*</span>
                    </td>
            
            </tr>
            <tr>
                <td align="right" class="lefttd" height="30" style="width: 198px">
                    <strong>邮政编码：</strong></td>
                <td class="righttd">
                 <asp:TextBox ID="TxtZipCode" CssClass="textbox" runat="server"></asp:TextBox><span style="color:Red">*</span>
               </td>
            </tr>
            <tr>
                <td align="right" class="lefttd" height="30" style="width: 198px">
                    <strong>收货人：</strong></td>
                <td class="righttd">
                 <asp:TextBox ID="TxtRealName" CssClass="textbox" runat="server"></asp:TextBox><span style="color:Red">*</span>
               </td>
            </tr>
            <tr>
                <td align="right" class="lefttd" height="30" style="width: 198px">
                    <strong>固定电话：</strong></td>
                <td class="righttd">
                 <asp:TextBox ID="TxtTel" CssClass="textbox" runat="server"></asp:TextBox>
               </td>
            </tr>
            <tr>
                <td align="right" class="lefttd" height="30" style="width: 198px">
                    <strong>手机号码：</strong></td>
                <td class="righttd">
                 <asp:TextBox ID="TxtMobile" CssClass="textbox" runat="server"></asp:TextBox>
               </td>
            </tr>
             
            <tr>
                <td align="right" class="lefttd" height="30" style="width: 198px">
                    <strong>电子邮箱：</strong></td>
                <td class="righttd">
                 <asp:TextBox ID="TxtEmail" CssClass="textbox" runat="server"></asp:TextBox>
               </td>
            </tr>
            <tr>
                <td align="right" class="lefttd" height="30" style="width: 198px">
                    <strong>地址别名：</strong></td>
                <td class="righttd">
                 <asp:TextBox ID="TxtTitle" CssClass="textbox" runat="server"></asp:TextBox>
               </td>
            </tr>
             
        </table>
        <br />
        <KS:Foot ID="Foot1" runat="server" OnSubmit="Foot1_Submit" SubmitButtonText="确定修改(0)" />
    
    </asp:Panel>
    

  </asp:Content>