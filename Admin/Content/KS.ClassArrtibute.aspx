<%@ Page Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.Admin_ClassArrtibute" Title="����������Ŀ����" Codebehind="KS.ClassArrtibute.aspx.cs" %>
<%@ Import Namespace="Kesion.BLL" %>
<%@ Import Namespace="Kesion.Cache" %>
<%@ Import Namespace="Kesion.Publics" %>
<asp:Content ID="Content1" ContentPlaceHolderID="KSContent" Runat="Server">
    <KS:TopNav ID="TopNav1" Text="����������Ŀ����" runat="server" />
	<script type="text/javascript">

	function CheckForm()
	{
	    var ClassList=null;
	    jQuery("#ClassID option:selected").each(function(){
			 if (ClassList==null) 
						 ClassList=jQuery(this).val() 
			  else
						 ClassList+=","+jQuery(this).val();
		})

	  if (ClassList==null)
	  {
	   KesionJS.Alert('��ѡ��Ҫ�������õ���Ŀ!',null);
	   return false;
	  }
	  return true;
	}
	function SelectAll(){
	  jQuery("#ClassID option").each(function(){
	      jQuery(this).attr("selected",true);
	  });
	}
	function UnSelectAll(){
	  jQuery("#ClassID option").each(function(){
	      jQuery(this).attr("selected",false);
	  });
	}
	</script>

	<table cellspacing="1" cellpadding="2" width="100%" align="center" border="0">
    <tr class="tdbg">
      <td vAlign=top width=200>
          <asp:DropDownList ID="DropChannelID" runat="server" style="WIDTH: 196px;">
           <asp:ListItem Value="0">--��ѡ��Ҫ����ģ��--</asp:ListItem>
          </asp:DropDownList>
      <br />
<select style="WIDTH: 200px; HEIGHT: 380px" multiple size=2 name="ClassID" id="ClassID">
  <%
      string from = KSCMS.S("from");
      if (string.IsNullOrEmpty(from)) from = string.Empty;
  if (from.Equals("shop")){
      Response.Write(MyCache.GetShopClassOptionList(ChannelID));
  }else{
      Response.Write(MyCache.GetClassOptionList(ChannelID));
  } %>
</select>
   <div align="center" style="line-height:30px;">
   <input onclick="SelectAll()" type="button" class="button" value="ѡ��������Ŀ" name="Submit" /><br />
      
   <input onclick="UnSelectAll()" type="button" value="ȡ��ѡ����Ŀ" class="button" name="Submit" />
   <br /><font color=red>��ʾ��</font>���԰�ס��Shift��<br />��Ctrl�������ж����Ŀ��ѡ��</div>
   </td>
   <td vAlign="top">
     <div class="tab-page" id="ClassAttributePanel">
         <script type="text/javascript">
           var tabPane1 = new WebFXTabPane( document.getElementById( "ClassAttributePanel" ), 1 )
         </script>
             
		 <div class="tab-page" id="tab0">
		  <h2 class="tab">������Ϣ</h2>
			<script type="text/javascript">
						 tabPane1.addTabPage( document.getElementById( "tab0" ) );
			</script>
        
                  <table  width="100%" border="0" cellpadding="1" cellspacing="1" class="CTable">
                    <tr<%=KSCMS.S("from").Equals("shop")?"":" style='display:none'" %>>
				    <td align='center' class='lefttd' style="width: 52px;"><asp:CheckBox ID="C13" runat="server" /></td>
					<td height='30' align='right' class='lefttd' style="width: 186px"><strong>����Ʒ����飺</strong></td>
					<td height='28' class="righttd">
                        <asp:DropDownList ID="DrpProSpecialID" runat="server"></asp:DropDownList>
                     </td>          
				  </tr>
				  <tr>
				    <td align='center' class='lefttd' style="width: 52px;"><asp:CheckBox ID="C1" runat="server" /></td>
					<td height='30' align='right' class='lefttd' style="width: 186px"><strong>��Ŀ����������</strong></td>
					<td height='28' class="righttd">
                        <asp:RadioButtonList ID="ShowInTop" runat="server" RepeatDirection="Horizontal">
                            <asp:ListItem Selected="True" Value="1">��ʾ</asp:ListItem>
                            <asp:ListItem Value="0">����ʾ</asp:ListItem>
                        </asp:RadioButtonList></td>          
				  </tr>
                  <tr<%=MyCache.GetCacheConfig(72)=="0"?" style='display:none'":"" %>>
				    <td align='center' class='lefttd' style="width: 52px;"><asp:CheckBox ID="C12" runat="server" /></td>
					<td height='30' align='right' class='lefttd' style="width: 186px"><strong>���ֻ�����Ŀ��������ʾ��</strong></td>
					<td height='28' class="righttd">
                        <asp:RadioButtonList ID="RdbShowOn3g" runat="server" RepeatDirection="Horizontal">
                            <asp:ListItem Selected="True" Value="1">��ʾ</asp:ListItem>
                            <asp:ListItem Value="0">����ʾ</asp:ListItem>
                        </asp:RadioButtonList></td>          
				  </tr>
                      <tr>
                          <td align="center" class="lefttd" style="width: 52px; height: 30px;"><asp:CheckBox ID="C2" runat="server" /></td>
                          <td align="right" class="lefttd" style="width: 186px; height: 30px;">
                              <strong>�Ƿ���ѭ����Ŀ����ʾ</strong><span style="background-color: #f0f9fe">��</span></td>
                          <td class="righttd" style="height: 30px">
                              <asp:RadioButtonList ID="ShowInCir" runat="server" RepeatDirection="Horizontal">
                                  <asp:ListItem Selected="True" Value="1">��ʾ</asp:ListItem>
                                  <asp:ListItem Value="0">����ʾ</asp:ListItem>
                              </asp:RadioButtonList></td>
                      </tr>
                  <tbody  id="showtg" runat="server">

                    <tr>
				    <td align='center' class='lefttd' style="width: 52px"><asp:CheckBox ID="C31" runat="server" /></td>
					<td height='30' align='right' class='lefttd' style="width: 186px"><strong>��Ŀ�Ƿ�����Ͷ�壺</strong></td>
					<td height='28' class="righttd">
                        <asp:RadioButtonList ID="RdbPubFlag" runat="server" RepeatDirection="Horizontal">
                            <asp:ListItem Value="0">������</asp:ListItem>
                            <asp:ListItem Value="1" Selected>����</asp:ListItem>
                        </asp:RadioButtonList></td>          
				 </tr>


				 <tr>
				    <td align='center' class='lefttd' style="width: 52px"><asp:CheckBox ID="C3" runat="server" /></td>
					<td height='30' align='right' class='lefttd' style="width: 186px"><strong>��Ŀ�Ƿ�����Ͷ�壺</strong></td>
					<td height='28' class="righttd">
                        <asp:RadioButtonList ID="AllowPubInfo" runat="server" RepeatDirection="Vertical">
                            <asp:ListItem Value="0">�ٲ�����</asp:ListItem>
                              <asp:ListItem Selected="True" Value="1">����ȫ����Ͷ��(<font color=blue>�����ο�</font>)</asp:ListItem>
                              <asp:ListItem Value="2">��ֻ���Ż�ԱͶ��(<font color=red>�οͳ���</font>)</asp:ListItem>
                              <asp:ListItem Value="3">��ֻ����ָ���Ļ�Ա��Ͷ��</asp:ListItem>
                        </asp:RadioButtonList></td>          
				 </tr>
                      <tr>
                          <td align="center" class="lefttd" style="width: 52px"><asp:CheckBox ID="C4" runat="server" /></td>
                          <td align="right" class="lefttd" height="30" style="width: 186px">
                              <strong>�������Ŀ��Ͷ��Ļ�Ա�飺</strong>
                              <br />
                              <font color="blue">�������Ŀ����Ͷ��ѡ������ڢ���ʱ�����ڴ����������ڴ���Ŀ��Ͷ��Ļ�Ա��</font></td>
                          <td class="righttd" height="28" ID="PubGroupIDArea" runat="server">
                          </td>
                      </tr>
                      <tr>
                          <td align="center" class="lefttd" style="width: 52px"><asp:CheckBox ID="C5" runat="server" /></td>
                          <td align="right" class="lefttd" height="30" style="width: 186px">
                              <strong>��ԱͶ�影��</strong>��<br />
                              <span style="color: #ff0033">�ڻ�Ա���ķ�����Ϣ����ͨ����˺�Ľ�����ʩ</span></td>
                          <td class="righttd">
                              <span style="display:none">��Աÿ����һ����Ϣ�����Եõ�<asp:TextBox ID="PubAddMoney" CssClass="textbox" runat="server" Style="text-align: center"
                                  Text="0" Width="37px"></asp:TextBox>Ԫ����ң�Ϊ0ʱ��������ֻ��ͨ����̨��˵Ĳ�����<br /></span>
                              ��Աÿ����һ����Ϣ�����Եõ�<asp:TextBox ID="PubAddPoint" CssClass="textbox" runat="server" Style="text-align: center"
                                  Text="0" Width="37px"></asp:TextBox>���ȯ��Ϊ0ʱ��������<span class="tips">ֻ��ͨ����̨��˵Ĳ�����</span><br />
                              ��Աÿ����һ����Ϣ�����Եõ�<asp:TextBox ID="PubAddScore" CssClass="textbox" runat="server" Style="text-align: center"
                                  Text="0" Width="37px"></asp:TextBox>�ֻ��֣�Ϊ0ʱ��������<span class="tips">ֻ��ͨ����̨��˵Ĳ�����</span><br />
                          </td>
                      </tr>
                  </tbody>
                <tr>
				    <td align='center' class='lefttd' style="width: 52px"><asp:CheckBox ID="C10" runat="server" /></td>
					<td height='30' align='right' class='lefttd' style="width: 186px"><strong>�ڴ���Ŀ�������۽�����</strong> </td>
					<td height='28' class="righttd">
					   <asp:TextBox ID="TxtCmtAddScore" CssClass="textbox" Text="0" style="text-align:center" runat="server" Width="37px"></asp:TextBox>����(Ϊ0ʱ������)<span class="tips">ֻ��ͨ����˵ĵ����۲Ž���,�������ý������ֵ����������������Ҫ��̨��˲���ʾ��</span>
				    </td>
				 </tr>
                <tr>
				    <td align='center' class='lefttd' style="width: 52px"><asp:CheckBox ID="C11" runat="server" /></td>
					<td height='30' align='right' class='lefttd' style="width: 186px"><strong>�����ť���ͻ��֣�</strong> </td>
					<td height='28' class="righttd">
					  <asp:TextBox ID="TxtShareAddScore" Text="0" CssClass="textbox" runat="server" Style="text-align: center"
                            Width="37px"></asp:TextBox>
                        ��</td>
				 </tr>


				  <tr>
				    <td align='center' class='lefttd' style="width: 52px"><asp:CheckBox ID="C6" runat="server" /></td>
					<td height='30' align='right' class='lefttd' style="width: 186px"><strong>��Ŀģ�壺</strong> </td>
					<td height='28' class="righttd">
					  <input type="text" name='ClassTemplate' class="textbox" id="ClassTemplate" size='35'/>&nbsp;<input type='button' name="Submit" class="button" value="ѡ��ģ��..." onclick="SelectTemplate('ClassTemplate');" />
				    </td>
				 </tr>
                 <tr<%=MyCache.GetCacheConfig(72)=="0"?" style='display:none'":"" %>>
				    <td align='center' class='lefttd' style="width: 52px"><asp:CheckBox ID="C8" runat="server" /></td>
					<td height='30' align='right' class='lefttd' style="width: 186px"><strong>�ֻ�����Ŀģ�壺</strong> </td>
					<td height='28' class="righttd">
					  <input type="text" name='Class3GTemplate' class="textbox" id="Class3GTemplate" size='35'/>&nbsp;<input type='button' name="Submit" class="button" value="ѡ��ģ��..." onclick="SelectTemplate('Class3GTemplate');" />
				    </td>
				 </tr>
				 <tr>
				   <td align='center' class='lefttd' style="width: 52px; height: 30px;"><asp:CheckBox ID="C7" runat="server" /></td>
				   <td align='right'  class='lefttd' style="width: 186px; height: 30px;"><strong>����ҳģ�壺</strong></td>
				   <td class="righttd" style="height: 30px">
					  <input type="text" name='ContentTemplate' class="textbox" id="ContentTemplate" size='35' />&nbsp;<input type='button' name="Submit" class="button" value="ѡ��ģ��..." onclick="SelectTemplate('ContentTemplate');" />  
					  <div class="tips">
					  <asp:CheckBox ID="CkbTBMB" runat="server" Checked="true" Text="ͬ�������Ѿ���ӵ��ĵ�" />
					  </div>
					    </td>
                  </tr> 
				  <tr<%=MyCache.GetCacheConfig(72)=="0"?" style='display:none'":"" %>>
				   <td align='center' class='lefttd' style="width: 52px; height: 30px;"><asp:CheckBox ID="C9" runat="server" /></td>
				   <td align='right'  class='lefttd' style="width: 186px; height: 30px;"><strong>�ֻ�������ҳģ�壺</strong></td>
				   <td class="righttd" style="height: 30px">
					  <input type="text" name='Content3GTemplate' class="textbox" id="Content3GTemplate" size='35' />&nbsp;<input type='button' name="Submit" class="button" value="ѡ��ģ��..." onclick="SelectTemplate('Content3GTemplate');" />  
					  <div class="tips">
					  <asp:CheckBox ID="CkbTB3GMB" runat="server" Checked="true" Text="ͬ�������Ѿ���ӵ��ĵ�" />
					  </div>
					    </td>
                  </tr> 
                  
                         
				 </table>
			
			
		 </div>
		 
		 <div class="tab-page" id="tab1">
		  <h2 class="tab">����ѡ��</h2>
			<script type="text/javascript">
						 tabPane1.addTabPage( document.getElementById( "tab1" ) );
			</script>
              <table width="100%" border="0" cellpadding="1" cellspacing="1" class="CTable">
                <tr>
				  <td align='center' class='lefttd' style="width: 50px; "><asp:CheckBox ID="F1" runat="server" /></td>
                  <td class='lefttd' align="right" style="width: 181px">
                      <strong>����ѡ�<br />
                      </strong><font color="#ff0000">����ѡ��ʾ�����ɾ�̬������ѡ������þ�̬�����Ч</font></td>
                  <td class='righttd'>
                      <asp:RadioButtonList ID="CreateHtmlFlag" runat="server">
                          <asp:ListItem Selected="" Value="1">����Ŀ���������ɾ�̬HTML����</asp:ListItem>
                          <asp:ListItem Value="2">����������ҳ���ɾ�̬HTML����</asp:ListItem>
                          <asp:ListItem Value="3">����ҳ����Ŀҳ���������ɾ�̬HTML����</asp:ListItem>
                      </asp:RadioButtonList></td>
                </tr>
                  <tr>
                      <td align="center" class="lefttd" style="width: 50px">
                          <asp:CheckBox ID="F2" runat="server" /></td>
                      <td align="right" class="lefttd" style="width: 181px">
                          <strong>�Զ�����ѡ�</strong>
                          <br />
                          <font color="red">�趨�����/�༭������ʱ�Զ����ɾ�̬HTML��ҳ��</font></td>
                      <td class="righttd">
                          <asp:RadioButtonList ID="AutoCreateType" runat="server">
                              <asp:ListItem Value="1">���Զ����ɣ���Ҫ�ֹ����ɣ�</asp:ListItem>
                              <asp:ListItem Selected="True" Value="2">����������ҳ&lt;font color=red&gt;���Ƽ���&lt;/font&gt;</asp:ListItem>
                              <asp:ListItem Value="3">�Զ���������ҳ����������Ŀҳ</asp:ListItem>
                              <asp:ListItem Value="4">�Զ���������ҳ����������Ŀҳ�������ĸ���Ŀҳ</asp:ListItem>
                              <asp:ListItem Value="5">�Զ���������ҳ����վ��ҳ</asp:ListItem>
                              <asp:ListItem Value="6">�Զ���������ҳ������������Ŀҳ����վ��ҳ</asp:ListItem>
                          </asp:RadioButtonList></td>
                  </tr>
                  <tr id="fsoclassindx" runat="server">
                      <td align="center" class="lefttd" style="width: 50px">
                          <asp:CheckBox ID="F3" runat="server" /></td>
                      <td align="right" class="lefttd" style="width: 181px">
                          <strong>���ɵ���Ŀ��ҳ�ļ���</strong></td>
                      <td class="righttd">
                          <asp:TextBox ID="ClassFsoIndex" CssClass="textbox" runat="server" Text="index.html" Width="92px"></asp:TextBox>
                          <select id="select2" class="upfile" name="SelectClassFsoIndex" onchange="jQuery('#<%=this.ClassFsoIndex.ClientID %>').val(this.value);">
                              <option selected="selected" value="index.html">index.html</option>
                              <option value="index.htm">index.htm</option>
                              <option value="index.shtm">index.shtm</option>
                              <option value="index.shtml">index.shtml</option>
                              <option value="default.html">default.html</option>
                              <option value="default.htm">default.htm</option>
                              <option value="default.shtm">default.shtm</option>
                              <option value="default.shtml">default.shtml</option>
                              <option value="index.asp">index.asp</option>
                              <option value="default.asp">default.asp</option>
                              <option value="index.aspx">index.aspx</option>
                              <option value="default.aspx">default.aspx</option>
                          </select>
                      </td>
                  </tr>
                  <tr>
                      <td align="center" class="lefttd" style="width: 50px">
                          <asp:CheckBox ID="F4" runat="server" /></td>
                      <td align="right" class="lefttd" style="width: 181px">
                          <strong>����ҳ����·������</strong>
                          <br />
                          ���ñ�ǩ��{$ClassDir},{$Year},{$Month},{$Day}</td>
                      <td class="righttd">
                          <asp:TextBox ID="CreateInfoPath" CssClass="textbox" runat="server" Text="{$ClassDir}/" Width="283px"></asp:TextBox>�����룢/������<br />
                          <select name="SelectInfoFsoPath" onchange="if (this.value!=''){jQuery('#<%=this.CreateInfoPath.ClientID %>').val(this.value);}">
                              <option selected="selected" value="">--����ѡ������·������--</option>
                              <option value="{$ClassDir}/">{$ClassDir}/</option>
                              <option value="{$ClassDir}/{$Year}-{$Month}/">{$ClassDir}/{$Year}-{$Month}/</option>
                              <option value="{$ClassDir}/{$Year}/{$Month}/{$Day}/">{$ClassDir}/{$Year}/{$Month}/{$Day}/</option>
                              <option value="{$Year}/{$Month}/{$Day}/">{$Year}/{$Month}/{$Day}/</option>
                              <option value="{$Month}/{$Day}/">{$Month}/{$Day}/</option>
                              <option value="List/{$Month}/">List/{$Month}/</option>
                          </select>
                      </td>
                  </tr>
                  <tr>
                      <td align="center" class="lefttd" style="width: 50px; height: 57px">
                          <asp:CheckBox ID="F5" runat="server" /></td>
                      <td align="right" class="lefttd" style="width: 181px; height: 57px">
                          <strong>����ҳ�����ļ�������</strong>
                          <br />
                          ���ñ�ǩ��{$InfoID},{$Year},{$Month},{$Day},{$RE}</td>
                      <td class="righttd" style="height: 57px">
                          <asp:TextBox ID="CretaeInfoFname" CssClass="textbox" runat="server" Text="{$InfoID}.html" Width="283px"></asp:TextBox><br />
                          <select name="SelectInfoName" onchange="if (this.value!=''){jQuery('#<%=this.CretaeInfoFname.ClientID %>').val(this.value);}">
                              <option selected="selected" value="">--����ѡ���ļ�������--</option>
                              <option value="{$InfoID}.htm">{$InfoID}.htm</option>
                              <option value="{$InfoID}.html">{$InfoID}.html</option>
                              <option value="{$Year}{$InfoID}.html">{$Year}{$InfoID}.html</option>
                              <option value="{$Year}{$Month}{$InfoID}.html">{$Year}{$Month}{$InfoID}.html</option>
                              <option title="���ʱ����" value="{$RE}.html">{$RE}.html</option>
                              <option title="���ʱ����" value="{$RE}.aspx">{$RE}.aspx</option>
                          </select>
                      </td>
                  </tr>
				</table>

			
			
		 </div>
		 
		 <div class="tab-page" id="tab2">
        <%if (KSCMS.S("from")=="shop"){ %>
		  <h2 class="tab" style="display:none">�շ�ѡ��</h2>
        <%}else{ %>
		  <h2 class="tab">�շ�ѡ��</h2>
		 <%} %>
		 
			<script type="text/javascript">
						 tabPane1.addTabPage( document.getElementById( "tab2" ) );
			</script>
			
            <table width="100%" border="0" cellpadding="1" cellspacing="1" class="CTable">
                <tr>
				  <td align='center' class='lefttd' style="width: 50px; text-align: center;"><asp:CheckBox ID="M1" runat="server" /></td>
                  <td class='lefttd' align="right" style="width: 181px">
                      <strong>���/�鿴Ȩ�ޣ�</strong></td>
                  <td class='righttd'>
                      <asp:RadioButtonList ID="ClassPurview" runat="server">
                          <asp:ListItem Selected="True" Value="0">������Ŀ  &lt;font color=red&gt;�κ��ˣ������οͣ���������Ͳ鿴����Ŀ�µ���Ϣ��&lt;/font&gt;</asp:ListItem>
                          <asp:ListItem Value="1">�뿪����Ŀ  &lt;font color=red&gt;�κ��ˣ������οͣ�������������οͲ��ɲ鿴��������Ա���ݻ�Ա�����ĿȨ�����þ����Ƿ���Բ鿴��&lt;/font&gt;</asp:ListItem>
                          <asp:ListItem Value="2">��֤��Ŀ  &lt;font color=red&gt;�οͲ�������Ͳ鿴��������Ա���ݻ�Ա�����ĿȨ�����þ����Ƿ��������Ͳ鿴��&lt;/font&gt;</asp:ListItem>
                      </asp:RadioButtonList></td>
                </tr>
                <tr>
                    <td align="center" class="lefttd" style="width: 50px; text-align: center">
                        <asp:CheckBox ID="M2" runat="server" /></td>
                    <td align="right" class="lefttd" style="width: 181px">
                        <strong>����鿴����Ŀ����Ϣ�Ļ�Ա�飺</strong>
                        <br />
                        <font color="blue">�����Ŀ�ǡ���֤��Ŀ�������ڴ���������鿴����Ŀ����Ϣ�Ļ�Ա��,�������Ϣ�������˲鿴Ȩ�ޣ�������Ϣ�е�Ȩ����������</font></td>
                    <td id="ViewGroupIDArea" class="righttd" runat="server">
                    </td>
                </tr>
                <tr>
                    <td align="center" class="lefttd" style="width: 50px; text-align: center">
                        <asp:CheckBox ID="M3" runat="server" /></td>
                    <td align="right" class="lefttd" style="width: 181px">
                        <strong>Ĭ���Ķ���Ϣ���������<br />
                        </strong><span style="color: #0000ff">�������Ϣ���������Ķ�������������Ϣ�еĵ�����������</span></td>
                    <td class="righttd">
                        <asp:TextBox ID="DefaultReadPoint" CssClass="textbox" runat="server" Style="text-align: center" Text="0"
                            Width="55px"></asp:TextBox><span style="color: #ff0000"> ����Ķ�����Ϊ "</span><font color="red"><span
                                style="color: #666666; background-color: #f0f9fe">0</span></font>"��������Ȩ�޵Ļ�Ա�Ķ�����Ŀ�µ���Ϣʱ��������Ӧ�������οͽ��޷��Ķ���</td>
                </tr>
                <tr>
                    <td align="center" class="lefttd" style="width: 50px; text-align: center">
                        <asp:CheckBox ID="M4" runat="server" /></td>
                    <td align="right" class="lefttd" style="width: 181px">
                        <strong>Ĭ���Ķ���Ϣ�ظ��շѣ�<br />
                        </strong><font color="blue">�������Ϣ�������˴�ѡ�������Ϣ�е���������</font></td>
                    <td class="righttd">
                        <asp:RadioButtonList ID="DefaultChargeType" runat="server">
                            <asp:ListItem Selected="True" Value="0">���ظ��շ�(�����Ϣ��۵������ܲ鿴������ʹ��)</asp:ListItem>
                            <asp:ListItem Value="1">�����ϴ��շ�ʱ��&lt;input type=&quot;text&quot; class=&quot;textbox&quot; style=&quot;text-align:center;&quot; value=&quot;12&quot; name=&quot;DefaultPitchTime&quot; size=&quot;5&quot;&gt;  Сʱ�������շ�</asp:ListItem>
                            <asp:ListItem Value="2">��Ա�ظ��Ķ���Ϣ&lt;input type=&quot;text&quot; class=&quot;textbox&quot; style=&quot;text-align:center;&quot; value=&quot;10&quot; name=&quot;DefaultReadTimes&quot; size=&quot;5&quot;&gt;   ҳ�κ������շ�</asp:ListItem>
                            <asp:ListItem Value="3">�������߶�����ʱ�����շ�</asp:ListItem>
                            <asp:ListItem Value="4">����������һ������ʱ�������շ�</asp:ListItem>
                            <asp:ListItem Value="5">ÿ�Ķ�һҳ�ξ��ظ��շ�һ�Σ����鲻Ҫʹ��,��ҳ��Ϣ���۶�ε�����</asp:ListItem>
                        </asp:RadioButtonList></td>
                </tr>
                <tr>
                    <td align="center" class="lefttd" style="width: 50px; text-align: center">
                        <asp:CheckBox ID="M5" runat="server" /></td>
                    <td align="right" class="lefttd" style="width: 181px">
                        <strong>Ĭ�Ϸֳɱ�����<br />
                        </strong><span style="color: #0000ff">��Ա�ڴ���Ŀ���������ʱ��������Ĭ�ϵķֳɱ���</span></td>
                    <td class="righttd">
                        <asp:TextBox ID="DefaultDividePercent" Text="0" CssClass="textbox" runat="server" Style="text-align: center"
                            Width="46px"></asp:TextBox>
                        %</td>
                </tr>
                </table>
			
		 </div>
		 
		 
	</div>
       <div style="clear:both;"></div>
		
       <script type="text/javascript">
		showtips(' <span class="state"><strong>˵����</strong><br /></span>1����Ҫ�����޸�ĳ�����Ե�ֵ������ѡ�������ĸ�ѡ��Ȼ�����趨����ֵ��<br>2��������ʾ������ֵ����ϵͳĬ��ֵ������ѡ��Ŀ�����������޹ء�');
		</script>

		</td>
    </tr>
  </table>
  
    <br />
    <KS:Foot ID="Foot1" runat="server" SubmitButtonText="ִ��������(0)" OnSubmit="Foot1_Submit"/>

</asp:Content>

