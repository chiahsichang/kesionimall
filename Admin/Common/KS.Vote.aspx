<%@ Page Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.Admin_Vote" Title="投票管理" Codebehind="KS.Vote.aspx.cs" %>
<asp:Content ID="Content1" ContentPlaceHolderID="KSContent" Runat="Server">
    <asp:Panel ID="ListPanel" runat="server" Width="100%">
    <div id="manage_top" class="menu_top_fixed">
       <ul>
           <li id='p1'><asp:LinkButton ID="addclassbutton" runat="server" OnClick="addclassbutton_Click"><b></b>添加投票</asp:LinkButton></li>
           <li id='p4'><asp:LinkButton ID="editclassbutton" runat="server" OnClick="editclassbutton_Click"><b></b>编辑主题</asp:LinkButton></li>
           <li id='p3'><asp:LinkButton ID="delclassbutton" runat="server" OnClick="delclassbutton_Click"><b></b>删除主题</asp:LinkButton></li></ul>
    </div>  
    <div class="menu_top_fixed_height"></div> 
        <KS:KSGV ID="List" cssclass="CTable" runat="server"  AutoGenerateColumns="False"
            GridLines="None" PagerType="CustomNumeric" Width="99%" HorizontalAlign="center" EmptyDataText="没有任何投票主题！" OnRowDataBound="List_RowDataBound" OnRowCommand="List_RowCommand" OnRowCreated="List_RowCreated" >
            <Columns>
            <asp:TemplateField HeaderText="选择">
                <itemstyle horizontalalign="Center" width="50px" />
                <itemtemplate>
                    <input type="checkbox"  name="ids" id="ids" value="<%#Eval("voteid") %>" />
                </itemtemplate>
            </asp:TemplateField>
                <asp:BoundField DataField="voteid" HeaderText="主题ID">
                <itemstyle horizontalalign="Center" width="50px" />
                </asp:BoundField>
                <asp:BoundField DataField="Subject" HeaderText="主题名称" />
                <asp:BoundField DataField="InfoId" HeaderText="项目名称" />
                <asp:BoundField DataField="BeginDate" HeaderText="开始时间" DataFormatString ="{0:yyyy-MM-dd}" HtmlEncode = "false">
                    <itemstyle horizontalalign="Center" width="150px" />
                </asp:BoundField>
                <asp:BoundField DataField="ExpireDate" HeaderText="结束时间" DataFormatString ="{0:yyyy-MM-dd}" HtmlEncode = "false">
                    <itemstyle horizontalalign="Center" width="150px" />
                </asp:BoundField>

                <asp:TemplateField HeaderText="IP限制">
                <ItemStyle  HorizontalAlign="Center" Width="50px" />
                    <ItemTemplate>
                   <a href="?action=LimitIP&id=<%#Eval("voteid")%>" <%# Convert.ToString(Eval("LimitIP"))=="0"?"class='no' title='否'":"class='ok' title='是'" %>></a>
                 </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="会员限制">
                <ItemStyle  HorizontalAlign="Center" Width="50px" />
                    <ItemTemplate>
                   <a href="?action=UserTF&id=<%#Eval("voteid")%>" <%# Convert.ToString(Eval("UserTF"))=="0"?"class='no' title='否'":"class='ok' title='是'" %>></a>
                 </ItemTemplate>
                </asp:TemplateField>


                 <asp:TemplateField HeaderText="编辑">
                       <itemstyle horizontalalign="Center" width="25px"/>
                        <itemtemplate>
             <asp:LinkButton ID="LinkButton1" CssClass="edit" ToolTip="编辑" runat="server" commandargument=<%#Eval("voteid") %> commandname="modify"></asp:LinkButton>
                        </itemtemplate>
                    </asp:TemplateField>
                 <asp:TemplateField HeaderText="删除">
                       <itemstyle horizontalalign="Center" width="25px"/>
                        <itemtemplate>
             <asp:LinkButton runat="server" CssClass="delete" ToolTip="删除" id="delete" commandargument=<%#Eval("voteid") %> commandname="del"></asp:LinkButton>
                        </itemtemplate>
                    </asp:TemplateField>

                
            <asp:TemplateField HeaderText="查看">
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
            &nbsp;&nbsp;<input type="checkbox" name="chkall" id="chkall" onclick="CheckAll(this.form);"/><label for="chkall">全部选中</label>
           
                       <input type="button" value="删除选中的主题" onmouseover="this.className='button_on';" onmouseout="this.className='button';" class="button" onclick="if (GetIDS('del')){this.form.action='?action=del';this.form.submit()}" />
              </asp:Panel>
              
      <KS:Page ID="Page1" runat="server" />
              
              
    </asp:Panel>
    <asp:Panel ID="AddPanel" runat="server" Width="100%" Visible="false">
        <KS:TopNav ID="TopNav1" runat="server" Text="增加投票主题" />
        <table width="99%" align="center" border="0" cellpadding="1" cellspacing="1" class="CTable"> 
          <tr>
            <td class="lefttd" height="30" align="right" style="width: 150px"><b>投票主题：</b></td>
            <td class="righttd">
                &nbsp;<asp:TextBox CssClass="textbox" ID="Subject" runat="server" Width="268px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="Subject"
                    ErrorMessage="请填写投票主题!" Display="Dynamic"></asp:RequiredFieldValidator>如：你对本站的哪些频道比较感谢兴趣?</td>
          </tr>
            <tr>
                <td align="right" class="lefttd" height="30" style="width: 150px">
                    <strong>选项类型：</strong></td>
                <td class="righttd">
                    <asp:RadioButtonList ID="VoteType" runat="server" RepeatDirection="Horizontal">
                        <asp:ListItem Selected="True" Value="1">单选</asp:ListItem>
                        <asp:ListItem Value="2">多选</asp:ListItem>
                    </asp:RadioButtonList></td>
            </tr>
            <tr>
                <td align="right" class="lefttd" height="30" style="width: 150px">
                    <strong>投票项目：</strong></td>
                <td class="righttd">
                <table border="0" cellpadding="0" cellspacing="0" style="margin-left:5px;" width="80%">
     
                 <tr>
                  <td colspan="3" height="30px">
                  投票扩展数量: 
              <input name="vote_num" class="textbox" type="text" id="votenum" value="1" size="5" style="text-align:center"> 
              <input type="button" name="Submit52" value="增加选项" class="button" onmouseover="this.className='button_on';" onmouseout="this.className='button';" onclick="javascript:doadd(jQuery('#votenum').val());"> 
              <input name="editnum" type="hidden" id="editnum" value="0"> 
                  
                  </td>
                 </tr>
                 <tr bgcolor='#DBEAF5'>
                 <td width='9%' height='20'> <div align='center'>编号</div></td>
                 <td width='65%'> <div align='center'>项目名称</div></td>
                 <td style='width: 100px'> <div align='center'>投票数</div></td>
                 </tr>
                 <tr>
                  <td colspan="3" id="addvote"></td>
                 </tr>
                </table>
                
                
                </td>
            </tr>
            <tr>
                <td align="right" class="lefttd" height="30" style="width: 150px">
                    <strong>开始日期：</strong></td>
                <td class="righttd"><script>isHour=1;</script>
                    <asp:TextBox CssClass="textbox" ID="BeginDate" runat="server" onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'});"></asp:TextBox></td>
            </tr>
            <tr>
                <td align="right" class="lefttd" height="30" style="width: 150px">
                    <strong>过期日期：</strong></td>
                <td class="righttd">
                    <asp:TextBox CssClass="textbox" ID="ExpireDate" runat="server"  onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'});"></asp:TextBox>
                    (超过此期限,将不能投票,设置为2000-01-01表示不限制)</td>
            </tr>
            <tr>
                <td align="right" class="lefttd" height="30" style="width: 150px">
                    <strong>只允许会员投票：</strong></td>
                <td class="righttd">
                    <asp:RadioButtonList ID="UserTF" runat="server" RepeatDirection="Horizontal">
                        <asp:ListItem Selected="True" Value="1">是</asp:ListItem>
                        <asp:ListItem Value="0">否</asp:ListItem>
                    </asp:RadioButtonList></td>
            </tr>
            <tr>
                <td align="right" class="lefttd" height="30" style="width: 150px">
                    <strong>启用IP限制：</strong></td>
                <td class="righttd">
                <asp:RadioButtonList ID="LimitIP" runat="server" RepeatDirection="Horizontal">
                    <asp:ListItem Selected="True" Value="1">是</asp:ListItem>
                    <asp:ListItem Value="0">否</asp:ListItem>
                </asp:RadioButtonList></td>
            </tr>
          </table>
          <br />
          <KS:Foot runat="server" ID="Foot1" SubmitButtonText="确定添加" OnSubmit="Foot1_Submit" />
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
        <KS:TopNav ID="TopNav2" runat="server" Text="查看各选项得票情况" />
        <br />
        
        <table width="99%" border="0" align="center" cellpadding="1" cellspacing="1" class="CTable">
            <tr>
                <td align="right" class="lefttd" style="height: 25px">
                    <strong>主题ID：</strong></td>
                <td class="righttd" style="height: 25px">
                    <asp:Label ID="LabVoteID" runat="server" Text="Label"></asp:Label></td>
            </tr>
										<tr> 
										  <td align="right" class="lefttd" style="height:25px;"><strong>调查主题：</strong></td>
											<td class="righttd" style="height: 25px;">
                                                <asp:Label ID="LabSubject" runat="server" Text="Label"></asp:Label></td>
										</tr>
										<tr> 
										  <td align="right" class="lefttd" style="height:25px;"><strong>总投票数：</strong></td>
											<td  class="righttd"> 
                                                <asp:Label ID="LabTotalNum" runat="server" Text="Label"></asp:Label>
			　　　　　　　　　　　　　　　　</td>
										</tr>
										<tr> 
											<td  class="righttd" colspan="2">
                                            <asp:Repeater ID="Repeater1" runat="server">
                                                <HeaderTemplate>
                                                <table border="0" align="center" cellpadding="1" cellspacing="1">
                                                 <tr class="CTitle">
                                                 <td height="25" width="190px"><strong>投票选项</strong></td>
                                                 <td align="center" width="90px"><strong>票数</strong></td>
                                                 <td align="center" width="388"><strong>百分比</strong></td>
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
                                              <asp:Button ID="Button1" runat="server" Text="取消返回" CausesValidation="False" OnClientClick="javascript:history.back();return false;" />
                                              <asp:Button ID="Button2" runat="server" Text="查看投票明细" CausesValidation="False"/>
                                          </div>
                                         </td>
										</tr>
									</table>	
    </asp:Panel>
          
</asp:Content>

