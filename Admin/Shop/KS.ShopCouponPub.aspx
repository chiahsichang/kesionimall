<%@ Page Language="C#" EnableEventValidation="false"  MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.Admin.Shop.Admin_ShopCouponPub" Title="�Ż�ȯ���Ź���" Codebehind="KS.ShopCouponPub.aspx.cs" %>
<asp:Content ID="Content1" ContentPlaceHolderID="KSContent" Runat="Server">
   <KS:TopNav ID="TopNav1" runat="server" />
    
    <asp:Panel ID="Panel1" runat="server" Width="100%" Visible="false">
    
<script type="text/javascript">
		 function searchUser()
		 {jQuery('#ajaxmsg',window.parent.document).fadeIn("slow");
					  var url = '../../plus/ajaxs.ashx'; 
					  jQuery.get(url,{a:"SearchUser",key:(jQuery("#key").val())},function(s){
					  jQuery('#ajaxmsg',window.parent.document).fadeOut("slow");
					   showResponse(s);
					  })    
		 }
		 function showResponse(s)
		  {
						  var result=s;
						  if (result!='')
						  {
							  var obj = jQuery('#user_search')[0];
							  obj.length = 0;
							  var rarr=result.split('|');
								for (var i = 0; i < rarr.length; i++)
								{
									 if (rarr[i]!=''){
									  var opt = document.createElement('OPTION');
									  opt.value = rarr[i];
									  opt.text  = rarr[i];
									  obj.options.add(opt);
									   }
								}
						  }
		 }
		function addUser()
				  {
					  var src = document.getElementById('user_search');
					  var dest = document.getElementById('user');
				
					  for (var i = 0; i < src.options.length; i++)
					  {
						  if (src.options[i].selected)
						  {
							  var exist = false;
							  for (var j = 0; j < dest.options.length; j++)
							  {
								  if (dest.options[j].value == src.options[i].value)
								  {
									  exist = true;
									  break;
								  }
							  }
							  if (!exist)
							  {
								  var opt = document.createElement('OPTION');
								  opt.value = src.options[i].value;
								  opt.text = src.options[i].text;
								  dest.options.add(opt);
							  }
						  }
					  }
				  }
				
				  function delUser()
				  {
					  var dest = document.getElementById('user');
				
					  for (var i = dest.options.length - 1; i >= 0 ; i--)
					  {
						  if (dest.options[i].selected)
						  {
							  dest.options[i] = null;
						  }
					  }
				  }
				function check()
				{
					var idArr = new Array();
					var dest = document.getElementById('user');
					for (var i = 0; i < dest.options.length; i++)
					{
						dest.options[i].selected = "true";
						idArr.push(dest.options[i].value);
					}
					if (idArr.length <= 0)
					{
						alert("��û��ѡ���û�!");
						return false;
					}
					else
					{
						return true;
					}
				  
				}
				</script>    
        <table width="100%" border="0" cellpadding="1" cellspacing="1" class="CTable"> 
          <tr>
           <td colspan="2" class="lefttd" style="text-align:left;color:Red;font-weight:bold">1�����û��鷢��</td>
          </tr>
          <tr>
            <td class="lefttd" height="30" align="right" style="width: 198px"><strong>ѡ���û��飺</strong></td>
            <td class="righttd">
               <div id="GroupPanel" runat="server"></div> 
            </td>
          </tr>
          <tr>
            <td class="lefttd" height="30" align="right" style="width: 198px"><strong>�ʼ�֪ͨѡ�</strong></td>
           <td class="righttd">
             <asp:CheckBox ID="CKB1" Text="����Email�ʼ�֪ͨ" Checked="true" runat="server" /><br />
             <asp:CheckBox ID="CKB2" Text="����վ�ڶ���Ϣ֪ͨ" Checked="true" runat="server" /><br />
           </td>
          </tr>
          <tr>
           <td colspan="2" class="lefttd" style="text-align:center">
           
           <asp:Button ID="Button1" runat="server" CssClass="button" Text="ȷ�������Ż�ȯ" OnClick="Button1_Click" />
           </td>
          </tr>
         </table>
         <br />
        <table width="100%" border="0" cellpadding="1" cellspacing="1" class="CTable"> 
          <tr>
           <td colspan="3" class="lefttd" style="text-align:left;color:Red;font-weight:bold">2�����û�����</td>
          </tr>
          <tr>
            <td class="righttd" colspan="3">
               <strong>�ؼ��֣�</strong><input type="text" class="textbox" name="key" id="key" size="20"/>
               <input type="button" value="�����û�" class="button" onclick="searchUser();"/>
            </td>
          </tr>
          <tr align='center'>
						<td height='25' class='clefttitle' style="text-align:center">��Ա�б�</td>
						<td  class='clefttitle' style="text-align:center">����</td>
						<td  class='clefttitle' style="text-align:center">�������û������Ż�ȯ</td>
		  </tr>
          <tr align='center'>
						<td height='25' class='righttd' style="text-align:center">
						<select name="user_search" id="user_search" size="15" style="width:260px" ondblclick="addUser()" multiple="true">
						  </select>
						</td>
						<td  class='righttd' style="text-align:center">
						<p><input type="button" value=" > " onclick="addUser()" class="button" /></p>
						<br />
						<p><input type="button" value=" < " onclick="delUser()" class="button" /></p>
						</td>
						<td  class='righttd' style="text-align:center">
						<select name="user" id="user" multiple="true" size="15" style="width:260px" ondblclick="delUser()">
						  </select>
						</td>
		  </tr>
            <tr>
                <td colspan="3" >
                    <asp:CheckBox ID="CKB3" Text="����Email�ʼ�֪ͨ" Checked="true" runat="server" /><br />
                    <asp:CheckBox ID="CKB4" Text="����վ�ڶ���Ϣ֪ͨ" Checked="true" runat="server" /><br />
                </td>
            </tr>
          
          
          <tr>
           <td colspan="3" class="lefttd" style="text-align:center">
           
           <asp:Button ID="Button2" runat="server" CssClass="button" Text="ȷ�������Ż�ȯ" OnClientClick="return(check())" OnClick="Button2_Click" />
           </td>
          </tr>
         </table>
         <br /><br />
     
    </asp:Panel>
    
    <asp:Panel ID="Panel2" runat="server" Width="100%" Visible="false">
        <table width="99%" align="center" border="0" cellpadding="1" cellspacing="1" class="CTable"> 
          <tr>
           <td colspan="2" class="lefttd" style="color:Red;font-weight:bold">���������Ż�ȯ��</td>
          </tr>
          <tr>
            <td class="lefttd" height="30" align="right" style="width: 198px"><strong>����������</strong></td>
            <td class="righttd">
             <asp:TextBox ID="TxtNum" CssClass="textbox" runat="server" style="text-align:center;" Width="40px" Text="100"></asp:TextBox> ��
            </td>
          </tr>
          <tr>
           <td class="lefttd" colspan="2" style="text-align:center">
           <asp:Button ID="Button3" runat="server" CssClass="button" Text="ȷ�����������Ż�ȯ��" OnClick="Button3_Click"/>
           </td>
          </tr>
         </table>
        <script type="text/javascript">
		showtips('<span class="state"><strong>����˵����</strong><br /></span>1.���Ż�ȯ����Ϊ���·���ʱ,�����������Ż�ȯ��<br />2.�����Խ����ɵ��Ż�ȯ�ŷ��Ÿ��û�ʹ��<br />3.�û��õ��Ż�ȯ�ź�,�����ڻ�Ա��������,ÿ���Ż�ȯ��ֻ����һ��<br />');
		</script>
    </asp:Panel>
    
</asp:Content>

