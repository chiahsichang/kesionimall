<%@ Page Language="C#" ValidateRequest="false" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.Admin_UserDepartMent" Title="�û����Ź���" Codebehind="KS.UserDepartMent.aspx.cs" %>
<%@ Import Namespace="Kesion.Cache" %>
<%@ Import Namespace="Kesion.Publics" %>
<asp:Content ID="Content1" ContentPlaceHolderID="KSContent" Runat="Server">
         
     <asp:Panel ID="ClassList" runat="server" Width="100%">
     <div id="manage_top" class="menu_top_fixed">
       <ul>
         <li id='p1'><asp:LinkButton ID="addbutton" runat="server" OnClick="lbtaddmodel_Click"><b></b>��Ӳ���</asp:LinkButton></li>
         <li id='p5'><asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click"><b></b>һ����������</asp:LinkButton></li>
         <li id='p7'><asp:LinkButton ID="LinkButton2" runat="server" OnClick="LinkButton2_Click"><b></b>N����������</asp:LinkButton></li>
       </ul>
     </div>
 <div class="menu_top_fixed_height"></div> 
 <script type="text/javascript">

     function showUser(id,depart) {
         location.href="KS.User.aspx?depart="+depart+"&did="+id;

   // parent.openWin('�鿴����['+depart+']�µ��û�', 'user/KS.UserList.Aspx?departid=' +id, false, 900, 520);
}
</script>
 
        <!-- &nbsp;&nbsp;<img src="../../admin/images/folder/folderopen.gif" align="top"/><a href="KS.UserDepartMent.aspx?Action=showall">ȫ��չ��</a>-->
         <asp:Repeater ID="list" runat="server">
          <HeaderTemplate>
           <table width="99%" align="center" cellpadding="0" cellspacing="0" class="CTable">
           <tr class="CTitle">
				<th scope="col" style="width:30px;">����ID</th><th scope="col">��������</th>
				<th scope="col" style="width:60px">��Ա��</th>
                <th scope="col" style="width:50px">���</th>
                <th scope="col" style="width:25px">�༭</th>
                <th scope="col" style="width:25px">ɾ��</th>
			</tr>
          </HeaderTemplate>
          <ItemTemplate>
            <tr onmouseover="jQuery('#a<%# Eval("departId") %>').show();this.className='CtrMouseOver'" onmouseout="jQuery('#a<%# Eval("departId") %>').hide();this.className='CtrMouseOut'" onclick="chk(this)">
             <td class="Ctd" align="center"><%# Eval("departid") %></td>
             <td class="Ctd" style="height:30px;width:350px;">
            
             <%# getClassListName(Eval("DepartMentName", "{0}"), Convert.ToInt16(Eval("child")), Convert.ToInt16(Eval("NextID")), Convert.ToInt16(Eval("depth", "{0}")), 1)%>
             <span id="a<%# Eval("departId") %>" style="padding-left:20px;display:none">
               <a style="color:#999" href="KS.UserDepartMent.aspx?action=add&parentid=<%# Eval("departid") %>">����Ӳ���</a>
             </span>
             </td>
             <td class="Ctd" align="center"><a href="javascript:" onclick="showUser(<%# Eval("DepartId") %>,'<%# Eval("departmentName") %>')"><%# GetMemberNum(Convert.ToInt16(Eval("DepartId"))) %> λ</a></td>
             <td class="Ctd" align="center"><%# Container.ItemIndex + 1 + (CurrPage - 1) * PageSize%></td>
             <td class="Ctd" align="center">
              <a href="KS.UserDepartMent.aspx?action=edit&classid=<%# Eval("departid") %>" class="edit" title="�༭"></a>
             </td>
              <td class="Ctd" align="center">
              <a  class="delete"  title="ɾ��" href="KS.UserDepartMent.aspx?Action=del&ClassID=<%# Eval("departid") %>" onclick="return(confirm('�˲��������棬ȷ��ɾ��������?'));"></a>
             </td>
            </tr>
          </ItemTemplate>
          <FooterTemplate>
               <tr style="display:<%# bool.Parse((list.Items.Count==0).ToString())?"":"none"%>">
                <td class="Ctd" style="text-align:center" colspan="6">
                 <asp:LinkButton ID="addbutton" runat="server" OnClick="lbtaddmodel_Click"> ��û������κβ��ţ������Ӳ���&raquo;</asp:LinkButton>
                </td>
               </tr> 
          </table>
          </FooterTemplate>
         </asp:Repeater>
         
          <KS:Page ID="Page1" runat="server" />
         
          <br />
        <script type="text/javascript">
            showtips('<span class="state"><strong>����˵����</strong><br /></span>1���������ѧУ�ͻ���������������ΰ༶��������ǹ�˾�ͻ��������������ӹ�˾�Ĳ��ţ��Է��㰴�����õ���ΰ༶�����ţ����п���ͳ�Ʒ�����<br/>2����ΰ༶(����)�����󲻽���ɾ�����������⵼�»�Ա�Ҳ�����Ӧ����ΰ༶(����)��');
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
	                KesionJS.Alert('�����벿�����ƣ�', "jQuery('#<%=this.TxtDepartMentName.ClientID %>').focus()");
	           return false;
	         }

	         if (jQuery('#<%=this.TxtDepartMentEName.ClientID %>').val() == '') {
	             KesionJS.Alert('�����벿�ű�ʶ��', "jQuery('#<%=this.TxtDepartMentEName.ClientID %>').focus()");
                       return false;}
                       return true;    
                    
                }
	         
	       
	        //-->
	    </script>
	    

        <KS:TopNav ID="TopNav1" runat="server" Text="����²���" />
        <br />
        
        
       	<div class="tab-page" id="DepartPanel">
         <script type="text/javascript">
             var tabPane1 = new WebFXTabPane(document.getElementById("DepartPanel"), 1)
         </script>
             
		 <div class="tab-page" id="tab0">
		  <h2 class="tab">������Ϣ</h2>
			<script type="text/javascript">
						 tabPane1.addTabPage( document.getElementById( "tab0" ) );
			</script>
			
             <table width="100%" border="0" cellpadding="1" cellspacing="1" class="CTable">
				   <tr>
                       <td align="right" class="lefttd" style="width: 155px; height: 37px;"><strong>
                           �������ţ�</strong><br>
                         </td>
                         <td width="751" class="righttd" style="height: 37px">
                             <asp:DropDownList ID="ParentID" runat="server">
                             <asp:ListItem Value="0">-�ޣ���Ϊһ�����ţ�-</asp:ListItem>
                             </asp:DropDownList>&nbsp;
                             <span id="ParentIDMessage" runat="server"></span>
                       </td>
                     </tr>
                     
                     
                     
                    <tr>
                    <td class="lefttd" height="30" align="right" style="width: 155px">
                        <strong> �������ƣ�</strong></td>
                    <td class="righttd" width="751">
                        <asp:TextBox CssClass="textbox" ID="TxtDepartMentName" runat="server"></asp:TextBox>
                        <span class="tips">*�����벿�����ƣ��缼�������з����ȡ�</span>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TxtDepartMentName"
                            ErrorMessage="RequiredFieldValidator">�����벿�����ƣ��缼�������з����ȡ�</asp:RequiredFieldValidator></td>
                  </tr>
                  <tr>
                    <td  class="lefttd" align="right" style="width: 155px; height: 48px"><strong>���ű�ʶ��</strong><br />
                        </td>
                    <td  class="righttd" width="751" style="height: 48px">
             
                        <asp:TextBox CssClass="textbox" ID="TxtDepartMentEName" runat="server" onblur="CheckEnglishStr(this,'���ŵı�ʶ')"></asp:TextBox>&nbsp;<span class="tips">*ֻ����дӢ�ĺ����ֵ����,���ܴ�\/��*���� &lt; &gt; | ���������</span>
						</td>
                  </tr>
                   
      
                <tr id="IntroArea">
                    <td align="right"  class="lefttd" style="width: 155px; height: 50px;">
                        <strong>���Ž��ܣ�</strong><br />
                        </td>
                    <td  class="righttd" style="height: 50px">
                        <asp:TextBox CssClass="textbox textarea" Height="100px" ID="TxtIntro" runat="server" rows="8" TextMode="MultiLine" Width="383px"></asp:TextBox>
                       <a class="textarea_min" href="javascript:zoomtextarea(-5,'<%=this.TxtIntro.ClientID %>');"></a>
                   <a class="textarea_max" href="javascript:zoomtextarea(5,'<%=this.TxtIntro.ClientID %>');"></a>
                          
                        </td>
                  </tr>
                  <tr>
                    <td  height="30" class="lefttd" align="right" style="width: 155px">
                        <strong>����ͼƬ��</strong></td>
                    <td class="righttd">
                        <asp:TextBox CssClass="textbox" ID="TxtPhotoUrl" runat="server" Width="380px"></asp:TextBox>&nbsp;<input type="button" class="button" onclick="SelectFiles('<%=this.TxtPhotoUrl.ClientID %>',101);" value="ѡ��ͼƬ">
                        </td>
              </tr>
              
              
                  
              
          </table>	

        </div>
      
		
        
		

      
      <div style="clear:both;text-align:center"><br />
          <KS:Foot ID="Foot1" runat="server" OnSubmit="SaveButton_Click" />
      </div>
        </asp:Panel>
   </asp:Content>