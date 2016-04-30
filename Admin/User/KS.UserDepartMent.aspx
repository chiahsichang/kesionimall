<%@ Page Language="C#" ValidateRequest="false" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.Admin_UserDepartMent" Title="用户部门管理" Codebehind="KS.UserDepartMent.aspx.cs" %>
<%@ Import Namespace="Kesion.Cache" %>
<%@ Import Namespace="Kesion.Publics" %>
<asp:Content ID="Content1" ContentPlaceHolderID="KSContent" Runat="Server">
         
     <asp:Panel ID="ClassList" runat="server" Width="100%">
     <div id="manage_top" class="menu_top_fixed">
       <ul>
         <li id='p1'><asp:LinkButton ID="addbutton" runat="server" OnClick="lbtaddmodel_Click"><b></b>添加部门</asp:LinkButton></li>
         <li id='p5'><asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click"><b></b>一级部门排序</asp:LinkButton></li>
         <li id='p7'><asp:LinkButton ID="LinkButton2" runat="server" OnClick="LinkButton2_Click"><b></b>N级部门排序</asp:LinkButton></li>
       </ul>
     </div>
 <div class="menu_top_fixed_height"></div> 
 <script type="text/javascript">

     function showUser(id,depart) {
         location.href="KS.User.aspx?depart="+depart+"&did="+id;

   // parent.openWin('查看部门['+depart+']下的用户', 'user/KS.UserList.Aspx?departid=' +id, false, 900, 520);
}
</script>
 
        <!-- &nbsp;&nbsp;<img src="../../admin/images/folder/folderopen.gif" align="top"/><a href="KS.UserDepartMent.aspx?Action=showall">全部展开</a>-->
         <asp:Repeater ID="list" runat="server">
          <HeaderTemplate>
           <table width="99%" align="center" cellpadding="0" cellspacing="0" class="CTable">
           <tr class="CTitle">
				<th scope="col" style="width:30px;">部门ID</th><th scope="col">部门名称</th>
				<th scope="col" style="width:60px">会员数</th>
                <th scope="col" style="width:50px">序号</th>
                <th scope="col" style="width:25px">编辑</th>
                <th scope="col" style="width:25px">删除</th>
			</tr>
          </HeaderTemplate>
          <ItemTemplate>
            <tr onmouseover="jQuery('#a<%# Eval("departId") %>').show();this.className='CtrMouseOver'" onmouseout="jQuery('#a<%# Eval("departId") %>').hide();this.className='CtrMouseOut'" onclick="chk(this)">
             <td class="Ctd" align="center"><%# Eval("departid") %></td>
             <td class="Ctd" style="height:30px;width:350px;">
            
             <%# getClassListName(Eval("DepartMentName", "{0}"), Convert.ToInt16(Eval("child")), Convert.ToInt16(Eval("NextID")), Convert.ToInt16(Eval("depth", "{0}")), 1)%>
             <span id="a<%# Eval("departId") %>" style="padding-left:20px;display:none">
               <a style="color:#999" href="KS.UserDepartMent.aspx?action=add&parentid=<%# Eval("departid") %>">添加子部门</a>
             </span>
             </td>
             <td class="Ctd" align="center"><a href="javascript:" onclick="showUser(<%# Eval("DepartId") %>,'<%# Eval("departmentName") %>')"><%# GetMemberNum(Convert.ToInt16(Eval("DepartId"))) %> 位</a></td>
             <td class="Ctd" align="center"><%# Container.ItemIndex + 1 + (CurrPage - 1) * PageSize%></td>
             <td class="Ctd" align="center">
              <a href="KS.UserDepartMent.aspx?action=edit&classid=<%# Eval("departid") %>" class="edit" title="编辑"></a>
             </td>
              <td class="Ctd" align="center">
              <a  class="delete"  title="删除" href="KS.UserDepartMent.aspx?Action=del&ClassID=<%# Eval("departid") %>" onclick="return(confirm('此操作不可逆，确定删除部门吗?'));"></a>
             </td>
            </tr>
          </ItemTemplate>
          <FooterTemplate>
               <tr style="display:<%# bool.Parse((list.Items.Count==0).ToString())?"":"none"%>">
                <td class="Ctd" style="text-align:center" colspan="6">
                 <asp:LinkButton ID="addbutton" runat="server" OnClick="lbtaddmodel_Click"> 还没有添加任何部门，点此添加部门&raquo;</asp:LinkButton>
                </td>
               </tr> 
          </table>
          </FooterTemplate>
         </asp:Repeater>
         
          <KS:Page ID="Page1" runat="server" />
         
          <br />
        <script type="text/javascript">
            showtips('<span class="state"><strong>操作说明：</strong><br /></span>1、如果您是学校客户，这里可以添加年段班级，如果您是公司客户，这里可以是添加公司的部门，以方便按此设置的年段班级（部门）进行考试统计分析；<br/>2、年段班级(部门)创建后不建议删除操作，以免导致会员找不到对应的年段班级(部门)。');
		</script>
         
        </asp:Panel> 
        
        <asp:Panel ID="ClassAdd" runat="server" Width="100%">
        <script type="text/javascript">
        <!--
	        function setFileFileds(num){    
             for(var i=1,str="";i<=20;i++){
	            jQuery("#define" + i).css("display","none");
              }
             for(var i=1,str="";i<=num;i++){	jQuery("#define" + i).css("display","");
                 }
            }

           
            function ConvertPinYin(){
                var className = jQuery('#<%=this.TxtDepartMentName.ClientID %>').val();
              jQuery.get("../../plus/ajaxs.ashx",{a:"convertclassname",classname:className},function(v){
              jQuery('#<%=this.TxtDepartMentEName.ClientID %>').val(unescape(v));
              });
            }
           
            

	        function CheckForm()
	        {
	            if (jQuery('#<%=this.TxtDepartMentName.ClientID %>').val() == '') {
	                KesionJS.Alert('请输入部门名称！', "jQuery('#<%=this.TxtDepartMentName.ClientID %>').focus()");
	           return false;
	         }

	         if (jQuery('#<%=this.TxtDepartMentEName.ClientID %>').val() == '') {
	             KesionJS.Alert('请输入部门标识！', "jQuery('#<%=this.TxtDepartMentEName.ClientID %>').focus()");
                       return false;}
                       return true;    
                    
                }
	         
	       
	        //-->
	    </script>
	    

        <KS:TopNav ID="TopNav1" runat="server" Text="添加新部门" />
        <br />
        
        
       	<div class="tab-page" id="DepartPanel">
         <script type="text/javascript">
             var tabPane1 = new WebFXTabPane(document.getElementById("DepartPanel"), 1)
         </script>
             
		 <div class="tab-page" id="tab0">
		  <h2 class="tab">基本信息</h2>
			<script type="text/javascript">
						 tabPane1.addTabPage( document.getElementById( "tab0" ) );
			</script>
			
             <table width="100%" border="0" cellpadding="1" cellspacing="1" class="CTable">
				   <tr>
                       <td align="right" class="lefttd" style="width: 155px; height: 37px;"><strong>
                           所属部门：</strong><br>
                         </td>
                         <td width="751" class="righttd" style="height: 37px">
                             <asp:DropDownList ID="ParentID" runat="server">
                             <asp:ListItem Value="0">-无（作为一级部门）-</asp:ListItem>
                             </asp:DropDownList>&nbsp;
                             <span id="ParentIDMessage" runat="server"></span>
                       </td>
                     </tr>
                     
                     
                     
                    <tr>
                    <td class="lefttd" height="30" align="right" style="width: 155px">
                        <strong> 部门名称：</strong></td>
                    <td class="righttd" width="751">
                        <asp:TextBox CssClass="textbox" ID="TxtDepartMentName" runat="server"></asp:TextBox>
                        <span class="tips">*请输入部门名称，如技术部、研发部等。</span>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TxtDepartMentName"
                            ErrorMessage="RequiredFieldValidator">请输入部门名称，如技术部、研发部等。</asp:RequiredFieldValidator></td>
                  </tr>
                  <tr>
                    <td  class="lefttd" align="right" style="width: 155px; height: 48px"><strong>部门标识：</strong><br />
                        </td>
                    <td  class="righttd" width="751" style="height: 48px">
             
                        <asp:TextBox CssClass="textbox" ID="TxtDepartMentEName" runat="server" onblur="CheckEnglishStr(this,'部门的标识')"></asp:TextBox>&nbsp;<span class="tips">*只能填写英文和数字的组合,不能带\/：*？“ &lt; &gt; | 等特殊符号</span>
						</td>
                  </tr>
                   
      
                <tr id="IntroArea">
                    <td align="right"  class="lefttd" style="width: 155px; height: 50px;">
                        <strong>部门介绍：</strong><br />
                        </td>
                    <td  class="righttd" style="height: 50px">
                        <asp:TextBox CssClass="textbox textarea" Height="100px" ID="TxtIntro" runat="server" rows="8" TextMode="MultiLine" Width="383px"></asp:TextBox>
                       <a class="textarea_min" href="javascript:zoomtextarea(-5,'<%=this.TxtIntro.ClientID %>');"></a>
                   <a class="textarea_max" href="javascript:zoomtextarea(5,'<%=this.TxtIntro.ClientID %>');"></a>
                          
                        </td>
                  </tr>
                  <tr>
                    <td  height="30" class="lefttd" align="right" style="width: 155px">
                        <strong>部门图片：</strong></td>
                    <td class="righttd">
                        <asp:TextBox CssClass="textbox" ID="TxtPhotoUrl" runat="server" Width="380px"></asp:TextBox>&nbsp;<input type="button" class="button" onclick="SelectFiles('<%=this.TxtPhotoUrl.ClientID %>',101);" value="选择图片">
                        </td>
              </tr>
              
              
                  
              
          </table>	

        </div>
      
		
        
		

      
      <div style="clear:both;text-align:center"><br />
          <KS:Foot ID="Foot1" runat="server" OnSubmit="SaveButton_Click" />
      </div>
        </asp:Panel>
   </asp:Content>