<%@ Page Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.Admin_DownServer" Title="Untitled Page" Codebehind="KS.DownServer.aspx.cs" %>
<asp:Content ID="Content1" ContentPlaceHolderID="KSContent" Runat="Server">
 <div id="manage_top" class="menu_top_fixed">
         <ul>
           <li id='p1'><asp:LinkButton ID="addserver" runat="server" OnClick="addserver_Click"><b></b>��ӷ�����</asp:LinkButton></li><li id='p5'><asp:LinkButton ID="editserver" runat="server" CausesValidation="False" OnClick="editserver_Click"><b></b>·������</asp:LinkButton></li><li id='p9'><asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" OnClick="LinkButton1_Click"><b></b>����һ��</asp:LinkButton></li></ul>
 </div>  
 <div class="menu_top_fixed_height"></div>        
    <asp:Panel ID="Panel1" runat="server" Width="100%">
      <KS:KSGV ID="list" cssclass="CTable" runat="server" AutoGenerateColumns="False" PagerType="CustomNumeric"  Width="99%" EmptyDataText="û������κη�����" GridLines="None" OnRowDataBound="list_RowDataBound" OnRowCommand="list_RowCommand" OnRowCreated="list_RowCreated" PageSize="20">
          <Columns>
              <asp:BoundField DataField="parentid" HeaderText="��ID">
                  <itemstyle horizontalalign="Center" width="50px" />
              </asp:BoundField>
              <asp:TemplateField HeaderText="����������">
                  <itemtemplate>
                    <%# GetServerName(Convert.ToInt16(Eval("parentid")),Convert.ToString(Eval("downloadname")),Convert.ToString(Eval("child")))%>
                  </itemtemplate>
              </asp:TemplateField>
              <asp:TemplateField HeaderText="����">
                  <itemtemplate>

                <table border="0" cellpadding="0" cellspacing="0" align="center">
                <tr>
                <td style="width: 50%" nowrap>
                
                       <asp:DropDownList ID="DropUpOrder" runat="server" AutoPostBack="False">
                          <asp:ListItem Selected="True" Value="0">������</asp:ListItem>
                         </asp:DropDownList>&nbsp;<asp:Button runat="server" ID="UpButton" onmouseover="this.className='button_on';" onmouseout="this.className='button';" class="button" Text="�ƶ�" commandname="uporder" commandargument=<%#Eval("orders") %>></asp:Button>

              </td>
              <td style="width: 50%">
               <asp:DropDownList ID="DropDownOrder" runat="server" AutoPostBack="False">
                  <asp:ListItem Selected="True" Value="0">������</asp:ListItem>
               </asp:DropDownList>&nbsp;<asp:Button ID="DownButton" onmouseover="this.className='button_on';" onmouseout="this.className='button';" class="button" Text="�ƶ�" commandname="downorder" commandargument=<%#Eval("orders") %> runat="server" />
            </td>
            </table>
            
                <asp:TextBox runat="server" text='<%#Eval("rootid") %>' id='rootid' style='display:none'></asp:TextBox>
                <asp:TextBox runat="server" text='<%#Eval("downid") %>' id='downid' style='display:none'></asp:TextBox>
            
                </itemtemplate>
              </asp:TemplateField>
               <asp:BoundField DataField="orders" HeaderText="orders">
                  <itemstyle horizontalalign="Center" width="40px" />
              </asp:BoundField>

              <asp:TemplateField HeaderText="���������">
                <itemstyle width="220px" horizontalalign="Center" />
             <itemtemplate>
             <div style="text-align:right">
             <asp:LinkButton runat="server" id="addsub" commandargument='<%#Eval("downid") %>' commandname="addsub">������ط�����·��</asp:LinkButton>
             <asp:LinkButton runat="server" commandargument=<%#Eval("downid") %> commandname="modify">����������</asp:LinkButton>
             <asp:LinkButton runat="server" id="delete" commandargument=<%#Eval("downid") %> commandname="del">ɾ��</asp:LinkButton>
            </div>
</itemtemplate>
            </asp:TemplateField>
              <asp:BoundField DataField="DayDownHits" HtmlEncode="False" DataFormatString="&lt;font color=red&gt;{0}&lt;/font&gt; �˴�" HeaderText="������" >
                  <itemstyle horizontalalign="Center" width="100px" />
              </asp:BoundField>
              <asp:BoundField DataField="AllDownHits" HtmlEncode="False" DataFormatString="{0} �˴�" HeaderText="��������" >
                  <itemstyle horizontalalign="Center" width="100px" />
              </asp:BoundField>
          </Columns>
             <HeaderStyle CssClass="CTitle" />
            <EmptyDataRowStyle CssClass="emptycss" />
      </KS:KSGV>
    </asp:Panel>

         
    <asp:Panel ID="Panel2" runat="server" Width="100%" Visible="false">
    <script language="javascript">

            function CheckForm()
            {
                if (jQuery('#<%=this.DownLoadName.ClientID%>').val() == '')
             {
                 KesionJS.Alert('���������ط���������!', "jQuery('#<%=this.DownLoadName.ClientID%>').focus();");
              return false;
          }
          if (jQuery("#servers").val() != 0) {
              if ((jQuery('#<%=this.DownLoadPath.ClientID %>').val() == '' || jQuery('#<%=this.DownLoadPath.ClientID %>').val() == 'http://') && jQuery('#servers').val() != 0) {
                  KesionJS.Alert('�����������·��!', "jQuery('#<%=this.DownLoadPath.ClientID %>').focus();");
                  return false;
              } 
          }
          return true;
            }
            function addserver(editid)
            {
             location.href='?action=add&editid='+editid+'&channelid=3';
             parent.frames['BottomFrame'].location.href='KS.Split.asp?ChannelID=3&OpStr=���ط��������� >> <font color=red>������ط�����</font>&ButtonSymbol=GO';
            }
            function editserver(editid)
            {
             location.href='?action=edit&editid='+editid+'&channelid=3';
             parent.frames['BottomFrame'].location.href='KS.Split.asp?ChannelID=3&OpStr=���ط��������� >> <font color=red>�༭���ط�����</font>&ButtonSymbol=GOSave';
            }
            function formatbt()
            {
              var arr = showModalDialog("../../admin/include/btformat.htm",null, "dialogWidth:250pt;dialogHeight:166pt;toolbar=no;location=no;directories=no;status=no;menubar=NO;scrollbars=no;resizable=no;help=0; status:0");
              if (arr != null){
                 jQuery('#<%=this.selfont.ClientID%>').val(arr);
                 jQuery('#<%=this.myfont.ClientID %>').html("<span style='background-color: #FFFFff;font-size:14px' "+arr+">���ñ�����ʽ ABCdef</span>");
              }
            }
            function Cancelform()
            {
              jQuery('#selfont').val('');
              myfont.innerHTML="<span style='background-color: #FFFFff;font-size:14px;color:#000000'>���ñ�����ʽ ABCdef</span>";
            }
            function setunion(val)
            {
             val=parseInt(val);
             if (val==0){
               jQuery('#unionarea').hide();
             }else{
             jQuery('#unionarea').show();
             }
            }
            function setdisabled(val)
            {
              val=parseInt(val);
              if (val==0){
                   jQuery('#<%=this.ssss.ClientID%>').hide();
              }
              else{
                  jQuery('#<%=this.ssss.ClientID%>').show();
              }
            }
            //-->
            </script>
            <table width="99%"  border="0" cellspacing="1" class="CTable" cellpadding="1" align=center>
             <tr>
             <td class="lefttd" align="right"><b>�������</b></td>
             <td class="righttd" id="ClassPannel" runat="server"></td>
            </tr>
             <tr>
             <td class="lefttd" align="right"><b>���������ƣ�</b></td>
             <td class="righttd"> <asp:TextBox CssClass="textbox" ID="DownLoadName" runat="server"></asp:TextBox>
                 <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="DownLoadName"
                     ErrorMessage="���������������"></asp:RequiredFieldValidator></td>
            </tr>
             <tbody id="ssss" runat="server">
             <tr>
             <td class="lefttd" align="right" style="height: 30px"><b>������·����</b></td>
             <td class="righttd" style="height: 30px"><asp:TextBox CssClass="textbox" ID="DownLoadPath" runat="server">http://</asp:TextBox></td>
            </tr>
              <tr style="display:none">
                 <td  class="lefttd" align="right"><b>������������ʽ��</b></td>
                 <td class="righttd">��ʽ: <asp:TextBox ID="selfont" runat="server"/>&nbsp; <span style="background-color: #fFfFff;cursor:hand; font-size:14px" id="myfont" runat="server" onclick="javascript:formatbt(this);">���ñ�����ʽ ABCdef</span> 
                <input type="checkbox" name="cancel" onclick="Cancelform()"> ȡ����ʽ</td>
                </tr>
            
                 <tr>
                     <td align="right" class="lefttd" style="height: 30px">
                         <strong>������״̬��</strong></td>
                     <td class="righttd" style="height: 30px">
                         <asp:RadioButtonList ID="IsLock" runat="server" RepeatDirection="Horizontal"
                             RepeatLayout="Flow">
                             <asp:ListItem Selected="True" Value="1">����</asp:ListItem>
                             <asp:ListItem Value="1">����</asp:ListItem>
                         </asp:RadioButtonList></td>
                 </tr>
             <tr class='tdbg'>
             <td height='25' class="lefttd" align="right"><b>�Ƿ��ⲿ���ӣ�</b></td>
             <td class="righttd"> <input type=radio onclick='setunion(this.value)' name=IsOuter value="0" checked> ��&nbsp;&nbsp; <input type=radio onclick='setunion(this.value)' name=IsOuter value="2"> WEBѸ��ר�����ص�ַ&nbsp;&nbsp; <input type=radio onclick='setunion(this.value)' name=IsOuter value="3"> FLASHGET(�쳵)ר�����ص�ַ<div id='unionarea' style='display:none'>����ID:<asp:TextBox ID="UnionID" CssClass="textbox" runat="server" Width="58px"></asp:TextBox><font color="red">�����û������ID��������ע��<a href="http://union.xunlei.com/" target="_blank"><font color="blue">Ѹ������</font></a>|<a href="http://union.flashget.com/" target="_blank"><font color="blue">�쳵����</font></a></div></td>
             </tr>
             </tbody>
            </table>

        <br />
            <KS:Foot runat="server" ID="Foot1" OnSubmit="Foot1_Submit" />
    </asp:Panel>


</asp:Content>

