<%@ Page Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.Admin_ShopBatch" Title="����������Ʒ����" Codebehind="KS.ShopBatch.aspx.cs" %>
<%@ Import Namespace="Kesion.Cache" %>
<%@ Import Namespace="Kesion.BLL" %>
<asp:Content ID="Content1" ContentPlaceHolderID="KSContent" Runat="Server">
    <KS:TopNav ID="TopNav1" runat="server" />
	<SCRIPT language=javascript>
	function CheckForm()
	{
	  if (jQuery("#ClassID").val()==''&&jQuery('#<%=this.IDS.ClientID %>').val()=='')
	  {
	   alert('��ѡ��Ҫ�������õ���Ŀ!');
	   return false;
	  }
	  return true;
	}
	function SelectAll(){
	    jQuery("#ClassID option").each(function() {
	        jQuery(this).attr("selected", true);
	    });
	}
	function UnSelectAll() {
	    jQuery("#ClassID option:selected").each(function() {
	        jQuery(this).attr("selected", false);
	    });
	}
	</SCRIPT>

	<table cellSpacing=1 cellPadding=2 width="99%" align=center border=0>
    <tr class=tdbg>
      <td vAlign=top width=200 id="classArea" runat="server" align="center">
          <asp:DropDownList ID="S_ChannelID" runat="server" style="width:100%">
          <asp:ListItem Value="0">---ѡ��Ҫ���õ�ģ��---</asp:ListItem>
          </asp:DropDownList>

        <Select style="WIDTH: 200px; HEIGHT: 380px" multiple size=2 name="ClassID" id="ClassID">
          <%=MyCache.GetShopClassOptionList(ChannelID) %>
        </Select>
       <div align=center>
       <Input onclick=SelectAll() type=button class="button" value="ѡ��������Ŀ" name=Submit><br />
       <Input onclick=UnSelectAll() type=button value="ȡ��ѡ����Ŀ" class="button" name=Submit>
       <br />
       <font color=red>��ʾ��</font>���԰�ס��Shift��<br />��Ctrl�������ж����Ŀ��ѡ��</div>
   </td>
   <td vAlign=top>
   
        
                  <table  id="tbs0" width="100%" border="0" align="center" cellpadding="1" cellspacing="1" class="CTable">
                      <tr id="idArea" runat="server">
                          <td align="center" class="lefttd" style="width: 52px; height: 30px; text-align: center">
                          </td>
                          <td align="right" class="lefttd" style="width: 105px; height: 30px">
                              <strong>
                           �����õ�ID�ţ�</strong>
                          </td>
                          <td class="righttd" style="height: 30px">
                              <asp:TextBox CssClass="textbox" ID="IDS" runat="server" ReadOnly="True" Width="365px"></asp:TextBox></td>
                      </tr>
				  <tr>
				    <td align='center' class='lefttd' style="width: 52px;  height: 30px;">
                        <asp:CheckBox ID="C1" runat="server" /></td>
					<td align='right' class='lefttd' style="width: 105px; height: 30px;"><strong>
					<%=ItemName %>��λ��</strong></td>
					<td class="righttd" style="height: 30px">
                        <asp:TextBox CssClass="textbox" ID="TxtUnit" runat="server"></asp:TextBox>
                        
                        <<
				<select name='SelAuthor' style='width:100px' onChange="jQuery('#<%=this.TxtUnit.ClientID %>').val(this.options[this.selectedIndex].value);">")
		    <option value="" selected> </option><option value="" style="color:red">���</option>
			<%=BaseFun.GetSQLOption("Select Distinct Top 10 Unit,unit From KS_ProductList Group by unit", "")%>
			 </select>
                        </td>          
				  </tr>
                      <tr>
                          <td align="center" class="lefttd" style="width: 52px; height: 30px;"><asp:CheckBox ID="C2" runat="server" /></td>
                          <td align="right" class="lefttd" style="width: 105px; height: 30px;">
                              <strong><%=ItemName %>����ʱ��<span style="background-color: #f0f9fe">��</span></strong></td>
                          <td class="righttd" style="height: 30px">
                          <script>
                              isHour = 1;
                            </script>
                              <asp:TextBox CssClass="textbox Wdate" ID="TxtAddDate"  onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'});"  runat="server"></asp:TextBox> <span class="tips">���ڸ�ʽ����-��-�� ʱ:��:��</span>
                          </td>
                      </tr>
				  <tr>
				    <td align='center' class='lefttd' style="width: 52px"><asp:CheckBox ID="C3" runat="server" /></td>
					<td height='30' align='right' class='lefttd' style="width: 105px"><strong>����������ӣ�</strong></td>
					<td height='28' class="righttd">
                        <asp:TextBox CssClass="textbox" ID="Hits" Text="1000" runat="server" Width="57px" style="text-align:center"></asp:TextBox> ��
                        &nbsp;<span class="tips">Tips:��ԭ��������������ӡ�</span>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="Hits"
                            ErrorMessage="��������ȷ������" ValidationExpression="\d{1,4}"></asp:RegularExpressionValidator></td>          
				 </tr>
                      <tr>
                          <td align="center" class="lefttd" style="width: 52px"><asp:CheckBox ID="C4" runat="server" /></td>
                          <td align="right" class="lefttd" height="30" style="width: 105px">
                             <strong><span style="color: #666666">�Ƿ��Ƽ���</span></strong></td>
                          <td class="righttd" height="28">
                              <asp:RadioButtonList ID="Recommend" runat="server" RepeatDirection="Horizontal">
                                  <asp:ListItem Selected="True" Value="1">��</asp:ListItem>
                                  <asp:ListItem Value="0">��</asp:ListItem>
                              </asp:RadioButtonList></td>
                      </tr>
                      <tr>
                          <td align="center" class="lefttd" style="width: 52px"><asp:CheckBox ID="C5" runat="server" /></td>
                          <td align="right" class="lefttd" height="30" style="width: 105px">
                              <strong>�Ƿ��ȵ㣺</strong></td>
                          <td class="righttd"><asp:RadioButtonList ID="Hot" runat="server" RepeatDirection="Horizontal">
                              <asp:ListItem Selected="True" Value="1">��</asp:ListItem>
                              <asp:ListItem Value="0">��</asp:ListItem>
                          </asp:RadioButtonList></td>
                      </tr>
                      <tr>
                          <td align="center" class="lefttd" style="width: 52px; height: 39px"><asp:CheckBox ID="C6" runat="server" /></td>
                          <td align="right" class="lefttd" style="width: 105px; height: 39px">
                              <strong>�Ƿ񾫲ʣ�</strong></td>
                          <td class="righttd" style="height: 39px"><asp:RadioButtonList ID="Splendid" runat="server" RepeatDirection="Horizontal">
                              <asp:ListItem Selected="True" Value="1">��</asp:ListItem>
                              <asp:ListItem Value="0">��</asp:ListItem>
                          </asp:RadioButtonList></td>
                      </tr>
                      <tr>
                          <td align="center" class="lefttd" style="width: 52px"><asp:CheckBox ID="C7" runat="server" /></td>
                          <td align="right" class="lefttd" height="30" style="width: 105px">
                              <strong>�Ƿ�ͷ����</strong></td>
                          <td class="righttd"><asp:RadioButtonList ID="Strip" runat="server" RepeatDirection="Horizontal">
                              <asp:ListItem Selected="True" Value="1">��</asp:ListItem>
                              <asp:ListItem Value="0">��</asp:ListItem>
                          </asp:RadioButtonList></td>
                      </tr>
                      <tr>
                          <td align="center" class="lefttd" style="width: 52px"><asp:CheckBox ID="C8" runat="server" /></td>
                          <td align="right" class="lefttd" height="30" style="width: 105px">
                              <strong>�Ƿ������</strong></td>
                          <td class="righttd"><asp:RadioButtonList ID="Roll" runat="server" RepeatDirection="Horizontal">
                              <asp:ListItem Selected="True" Value="1">��</asp:ListItem>
                              <asp:ListItem Value="0">��</asp:ListItem>
                          </asp:RadioButtonList></td>
                      </tr>
                      <tr>
                          <td align="center" class="lefttd" style="width: 52px"><asp:CheckBox ID="C9" runat="server" /></td>
                          <td align="right" class="lefttd" height="30" style="width: 105px">
                              <strong>�Ƿ�õƣ�</strong></td>
                          <td class="righttd"><asp:RadioButtonList ID="Slide" runat="server" RepeatDirection="Horizontal">
                              <asp:ListItem Selected="True" Value="1">��</asp:ListItem>
                              <asp:ListItem Value="0">��</asp:ListItem>
                          </asp:RadioButtonList></td>
                      </tr>
				  <tr>
				    <td align='center' class='lefttd' style="width: 52px; height: 30px;"><asp:CheckBox ID="C10" runat="server" /></td>
					<td align='right' class='lefttd' style="width: 105px; height: 30px;"><strong>�������ۣ�</strong> </td>
					<td class="righttd" style="height: 30px">
         
                        <asp:RadioButtonList ID="Comment" runat="server" RepeatDirection="Horizontal">
                            <asp:ListItem Selected="True" Value="1">��</asp:ListItem>
                            <asp:ListItem Value="0">��</asp:ListItem>
                        </asp:RadioButtonList></td>
				 </tr>
				 <tr>
				   <td align='center' class='lefttd' style="width: 52px; height: 30px;"><asp:CheckBox ID="C11" runat="server" />
                   </td>
				   <td align='right'  class='lefttd' style="width: 105px; height: 30px;"><strong>����ҳģ�壺</strong></td>
				   <td class="righttd" style="height: 30px">
				    <%if (!ContentID.Equals(""))
            {%>
				      <script>
				          dialogType = 1;
				      </script>
				      <%} %>
					  <input type="text" class='textbox' name='ContentTemplate' id="ContentTemplate" size='30'>&nbsp;<input type='button' name="Submit" class="button" onmouseover="this.className='button_on';" onmouseout="this.className='button';" value="ѡ��ģ��..." onClick="SelectTemplate('ContentTemplate');">    </td></tr>        

<tr<%=MyCache.GetCacheConfig(72)=="0"?" style='display:none'":"" %>>
				   <td align='center' class='lefttd' style="width: 52px; height: 30px;"><asp:CheckBox ID="C12" runat="server" />
                   </td>
				   <td align='right'  class='lefttd' style="width: 105px; height: 30px;"><strong>�ֻ�������ҳģ�壺</strong></td>
				   <td class="righttd" style="height: 30px">
				      <%if (!ContentID.Equals(""))
            {%>
				      <script>
				          dialogType = 1;
				      </script>
				      <%} %>
					  <input class="textbox" type="text" name='Content3GTemplate' id="Content3GTemplate" size='30'>&nbsp;<input type='button' name="Submit" class="button" onmouseover="this.className='button_on';" onmouseout="this.className='button';" value="ѡ��ģ��..." onClick="SelectTemplate('Content3GTemplate');">    
                      </td>
                   </tr>  
                   <tr<%=MyCache.GetCacheConfig(72)=="0"?" style='display:none'":"" %>>
				    <td align='center' class='lefttd' style="width: 52px; height: 30px;"><asp:CheckBox ID="C13" runat="server" /></td>
					<td align='right' class='lefttd' style="width: 105px; height: 30px;"><strong>��ʾ���ֻ��棺</strong> </td>
					<td class="righttd" style="height: 30px">
         
                        <asp:RadioButtonList ID="ShowOn3G" runat="server" RepeatDirection="Horizontal">
                            <asp:ListItem Selected="True" Value="1">��</asp:ListItem>
                            <asp:ListItem Value="0">��</asp:ListItem>
                        </asp:RadioButtonList></td>
				   </tr>

				 </table>
		 
		
              <%if (ContentID.Equals("")) {%>
                <script type="text/javascript">
		        showtips('<span class="state"><strong>˵����</strong><br /></span>1����Ҫ�����޸�ĳ�����Ե�ֵ������ѡ�������ĸ�ѡ��Ȼ�����趨����ֵ��<br>2��������ʾ������ֵ����ϵͳĬ��ֵ����ԭ�е������޹ء�');
		        </script>
              <%} %>
		</td>
    </tr>
  </table>
  <%if (ContentID.Equals(""))
    {%>
    <br />
    <KS:Foot ID="Foot1" runat="server" SubmitButtonText="ִ��������(0)" OnSubmit="Foot1_Submit"/>
  <%}
    else
    { %>
    <div style="text-align:center;margin-top:5px;">
    <asp:Button ID="Button1" runat="server" Text="ִ��������(O)" AccessKey="0" OnClick="Foot1_Submit" class="button" onmouseover="this.className='button_on';" onmouseout="this.className='button';"/>
    <input type="button" value="�ر�ȡ��(C)" accesskey="C" onclick="parent.box.close()" class="button" onmouseover="this.className='button_on';" onmouseout="this.className='button';" />
    </div>
    
  <%} %>
</asp:Content>

