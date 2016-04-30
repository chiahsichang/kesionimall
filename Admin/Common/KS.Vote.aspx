<%@ Page Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.Admin_Vote" Title="ͶƱ����" Codebehind="KS.Vote.aspx.cs" %>
<asp:Content ID="Content1" ContentPlaceHolderID="KSContent" Runat="Server">
    <asp:Panel ID="ListPanel" runat="server" Width="100%">
    <div id="manage_top" class="menu_top_fixed">
       <ul>
           <li id='p1'><asp:LinkButton ID="addclassbutton" runat="server" OnClick="addclassbutton_Click"><b></b>���ͶƱ</asp:LinkButton></li>
           <li id='p4'><asp:LinkButton ID="editclassbutton" runat="server" OnClick="editclassbutton_Click"><b></b>�༭����</asp:LinkButton></li>
           <li id='p3'><asp:LinkButton ID="delclassbutton" runat="server" OnClick="delclassbutton_Click"><b></b>ɾ������</asp:LinkButton></li></ul>
    </div>  
    <div class="menu_top_fixed_height"></div> 
        <KS:KSGV ID="List" cssclass="CTable" runat="server"  AutoGenerateColumns="False"
            GridLines="None" PagerType="CustomNumeric" Width="99%" HorizontalAlign="center" EmptyDataText="û���κ�ͶƱ���⣡" OnRowDataBound="List_RowDataBound" OnRowCommand="List_RowCommand" OnRowCreated="List_RowCreated" >
            <Columns>
            <asp:TemplateField HeaderText="ѡ��">
                <itemstyle horizontalalign="Center" width="50px" />
                <itemtemplate>
                    <input type="checkbox"  name="ids" id="ids" value="<%#Eval("voteid") %>" />
                </itemtemplate>
            </asp:TemplateField>
                <asp:BoundField DataField="voteid" HeaderText="����ID">
                <itemstyle horizontalalign="Center" width="50px" />
                </asp:BoundField>
                <asp:BoundField DataField="Subject" HeaderText="��������" />
                <asp:BoundField DataField="InfoId" HeaderText="��Ŀ����" />
                <asp:BoundField DataField="BeginDate" HeaderText="��ʼʱ��" DataFormatString ="{0:yyyy-MM-dd}" HtmlEncode = "false">
                    <itemstyle horizontalalign="Center" width="150px" />
                </asp:BoundField>
                <asp:BoundField DataField="ExpireDate" HeaderText="����ʱ��" DataFormatString ="{0:yyyy-MM-dd}" HtmlEncode = "false">
                    <itemstyle horizontalalign="Center" width="150px" />
                </asp:BoundField>

                <asp:TemplateField HeaderText="IP����">
                <ItemStyle  HorizontalAlign="Center" Width="50px" />
                    <ItemTemplate>
                   <a href="?action=LimitIP&id=<%#Eval("voteid")%>" <%# Convert.ToString(Eval("LimitIP"))=="0"?"class='no' title='��'":"class='ok' title='��'" %>></a>
                 </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="��Ա����">
                <ItemStyle  HorizontalAlign="Center" Width="50px" />
                    <ItemTemplate>
                   <a href="?action=UserTF&id=<%#Eval("voteid")%>" <%# Convert.ToString(Eval("UserTF"))=="0"?"class='no' title='��'":"class='ok' title='��'" %>></a>
                 </ItemTemplate>
                </asp:TemplateField>


                 <asp:TemplateField HeaderText="�༭">
                       <itemstyle horizontalalign="Center" width="25px"/>
                        <itemtemplate>
             <asp:LinkButton ID="LinkButton1" CssClass="edit" ToolTip="�༭" runat="server" commandargument=<%#Eval("voteid") %> commandname="modify"></asp:LinkButton>
                        </itemtemplate>
                    </asp:TemplateField>
                 <asp:TemplateField HeaderText="ɾ��">
                       <itemstyle horizontalalign="Center" width="25px"/>
                        <itemtemplate>
             <asp:LinkButton runat="server" CssClass="delete" ToolTip="ɾ��" id="delete" commandargument=<%#Eval("voteid") %> commandname="del"></asp:LinkButton>
                        </itemtemplate>
                    </asp:TemplateField>

                
            <asp:TemplateField HeaderText="�鿴">
             <itemstyle width="30px" horizontalalign="Center" />
             <itemtemplate>
             <asp:LinkButton runat="server" id="view" class="preview" commandargument=<%#Eval("voteid") %> commandname="view"></asp:LinkButton>
              </itemtemplate>
            </asp:TemplateField>
            </Columns>
            <HeaderStyle CssClass="CTitle" />
            <EmptyDataRowStyle CssClass="emptycss" />
        </KS:KSGV>
            <asp:Panel ID="Panel1" runat="server" Height="30px" Width="741px">
              <div style="margin-top:5px;overflow:hidden;"></div>
            &nbsp;&nbsp;<input type="checkbox" name="chkall" id="chkall" onclick="CheckAll(this.form);"/><label for="chkall">ȫ��ѡ��</label>
           
                       <input type="button" value="ɾ��ѡ�е�����" onmouseover="this.className='button_on';" onmouseout="this.className='button';" class="button" onclick="if (GetIDS('del')){this.form.action='?action=del';this.form.submit()}" />
              </asp:Panel>
              
      <KS:Page ID="Page1" runat="server" />
              
              
    </asp:Panel>
    <asp:Panel ID="AddPanel" runat="server" Width="100%" Visible="false">
        <KS:TopNav ID="TopNav1" runat="server" Text="����ͶƱ����" />
        <table width="99%" align="center" border="0" cellpadding="1" cellspacing="1" class="CTable"> 
          <tr>
            <td class="lefttd" height="30" align="right" style="width: 150px"><b>ͶƱ���⣺</b></td>
            <td class="righttd">
                &nbsp;<asp:TextBox CssClass="textbox" ID="Subject" runat="server" Width="268px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="Subject"
                    ErrorMessage="����дͶƱ����!" Display="Dynamic"></asp:RequiredFieldValidator>�磺��Ա�վ����ЩƵ���Ƚϸ�л��Ȥ?</td>
          </tr>
            <tr>
                <td align="right" class="lefttd" height="30" style="width: 150px">
                    <strong>ѡ�����ͣ�</strong></td>
                <td class="righttd">
                    <asp:RadioButtonList ID="VoteType" runat="server" RepeatDirection="Horizontal">
                        <asp:ListItem Selected="True" Value="1">��ѡ</asp:ListItem>
                        <asp:ListItem Value="2">��ѡ</asp:ListItem>
                    </asp:RadioButtonList></td>
            </tr>
            <tr>
                <td align="right" class="lefttd" height="30" style="width: 150px">
                    <strong>ͶƱ��Ŀ��</strong></td>
                <td class="righttd">
                <table border="0" cellpadding="0" cellspacing="0" style="margin-left:5px;" width="80%">
     
                 <tr>
                  <td colspan="3" height="30px">
                  ͶƱ��չ����: 
              <input name="vote_num" class="textbox" type="text" id="votenum" value="1" size="5" style="text-align:center"> 
              <input type="button" name="Submit52" value="����ѡ��" class="button" onmouseover="this.className='button_on';" onmouseout="this.className='button';" onclick="javascript:doadd(jQuery('#votenum').val());"> 
              <input name="editnum" type="hidden" id="editnum" value="0"> 
                  
                  </td>
                 </tr>
                 <tr bgcolor='#DBEAF5'>
                 <td width='9%' height='20'> <div align='center'>���</div></td>
                 <td width='65%'> <div align='center'>��Ŀ����</div></td>
                 <td style='width: 100px'> <div align='center'>ͶƱ��</div></td>
                 </tr>
                 <tr>
                  <td colspan="3" id="addvote"></td>
                 </tr>
                </table>
                
                
                </td>
            </tr>
            <tr>
                <td align="right" class="lefttd" height="30" style="width: 150px">
                    <strong>��ʼ���ڣ�</strong></td>
                <td class="righttd"><script>isHour=1;</script>
                    <asp:TextBox CssClass="textbox" ID="BeginDate" runat="server" onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'});"></asp:TextBox></td>
            </tr>
            <tr>
                <td align="right" class="lefttd" height="30" style="width: 150px">
                    <strong>�������ڣ�</strong></td>
                <td class="righttd">
                    <asp:TextBox CssClass="textbox" ID="ExpireDate" runat="server"  onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'});"></asp:TextBox>
                    (����������,������ͶƱ,����Ϊ2000-01-01��ʾ������)</td>
            </tr>
            <tr>
                <td align="right" class="lefttd" height="30" style="width: 150px">
                    <strong>ֻ�����ԱͶƱ��</strong></td>
                <td class="righttd">
                    <asp:RadioButtonList ID="UserTF" runat="server" RepeatDirection="Horizontal">
                        <asp:ListItem Selected="True" Value="1">��</asp:ListItem>
                        <asp:ListItem Value="0">��</asp:ListItem>
                    </asp:RadioButtonList></td>
            </tr>
            <tr>
                <td align="right" class="lefttd" height="30" style="width: 150px">
                    <strong>����IP���ƣ�</strong></td>
                <td class="righttd">
                <asp:RadioButtonList ID="LimitIP" runat="server" RepeatDirection="Horizontal">
                    <asp:ListItem Selected="True" Value="1">��</asp:ListItem>
                    <asp:ListItem Value="0">��</asp:ListItem>
                </asp:RadioButtonList></td>
            </tr>
          </table>
          <br />
          <KS:Foot runat="server" ID="Foot1" SubmitButtonText="ȷ�����" OnSubmit="Foot1_Submit" />
              <script>
    function doadd(num)
    {var i;
    var str="";
    var oldi=0;
    var j=0;
    oldi=parseInt(jQuery('#editnum').val());
    for(i=1;i<=num;i++)
    {
    j=i+oldi;
    str=str+"<tr><td width=9% height=20> <div align=center><input type=hidden name=id value=0>"+j+"</div></td><td width=65%> <div align=center><input type=text class=textbox name=item size=40></div></td><td width=26%> <div align=center><input type=text class=textbox name=votenum style='text-align:center' value=0 size=6></div></td></tr>";
    }
    window.addvote.innerHTML+="<table width=100% border=0 cellspacing=1 cellpadding=3>"+str+"</table>";
        jQuery('#editnum').val(j);
    }
    </script>
  </asp:Panel>
   
    <asp:Panel ID="ViewPanel" runat="server" Width="100%" Visible="False">
        <KS:TopNav ID="TopNav2" runat="server" Text="�鿴��ѡ���Ʊ���" />
        <br />
        
        <table width="99%" border="0" align="center" cellpadding="1" cellspacing="1" class="CTable">
            <tr>
                <td align="right" class="lefttd" style="height: 25px">
                    <strong>����ID��</strong></td>
                <td class="righttd" style="height: 25px">
                    <asp:Label ID="LabVoteID" runat="server" Text="Label"></asp:Label></td>
            </tr>
										<tr> 
										  <td align="right" class="lefttd" style="height:25px;"><strong>�������⣺</strong></td>
											<td class="righttd" style="height: 25px;">
                                                <asp:Label ID="LabSubject" runat="server" Text="Label"></asp:Label></td>
										</tr>
										<tr> 
										  <td align="right" class="lefttd" style="height:25px;"><strong>��ͶƱ����</strong></td>
											<td  class="righttd"> 
                                                <asp:Label ID="LabTotalNum" runat="server" Text="Label"></asp:Label>
			��������������������������������</td>
										</tr>
										<tr> 
											<td  class="righttd" colspan="2">
                                            <asp:Repeater ID="Repeater1" runat="server">
                                                <HeaderTemplate>
                                                <table border="0" align="center" cellpadding="1" cellspacing="1">
                                                 <tr class="CTitle">
                                                 <td height="25" width="190px"><strong>ͶƱѡ��</strong></td>
                                                 <td align="center" width="90px"><strong>Ʊ��</strong></td>
                                                 <td align="center" width="388"><strong>�ٷֱ�</strong></td>
                                                 </tr>
                                              </HeaderTemplate>
                                              <ItemTemplate> 
                                               <tr>
                                                <td height="25px" align="left" style="BORDER-BOTTOM: 1px solid"><font color="#ff6600"><%# Eval("itemname") %></font></td>
                                                <td align="center" style="BORDER-BOTTOM: 1px solid"><%# Eval("votenum") %></td>
                                                <td align="left" style="BORDER-BOTTOM: 1px solid">
                                                <%# GetVoteItemPer(Convert.ToInt32(Eval("votenum")),Convert.ToInt32(Eval("voteid"))) %>
                                                </td>
                                               </tr>  
                                              </ItemTemplate>
                                              <FooterTemplate>
                                              </table>
                                              </FooterTemplate> 
                                            </asp:Repeater>
                                         
                                          <div style="text-align:center;">
                                              <br />
                                              <asp:Button ID="Button1" runat="server" Text="ȡ������" CausesValidation="False" OnClientClick="javascript:history.back();return false;" />
                                              <asp:Button ID="Button2" runat="server" Text="�鿴ͶƱ��ϸ" CausesValidation="False"/>
                                          </div>
                                         </td>
										</tr>
									</table>	
    </asp:Panel>
          
</asp:Content>

