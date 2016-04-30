<%@ Page Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.Admin.Shop.Admin_LimitBuy" Title="��ʱ������������" Codebehind="KS.ShopLimitBuy.aspx.cs" %>
<%@ Import Namespace="Kesion.Publics" %>
<%@ Import Namespace="Kesion.HtmlTags" %>
<%@ Import Namespace="Kesion.Cache" %>
<asp:Content ID="Content1" ContentPlaceHolderID="KSContent" Runat="Server">
     <asp:Panel ID="TaskList" runat="server" Width="100%">
      <div id="manage_top" class="menu_top_fixed">
        <ul>
           <li id='p1'><asp:LinkButton ID="addTask" runat="server" OnClick="addTask_Click"><b></b>�����ʱ/������������</asp:LinkButton></li>
           <li id='p4'><asp:LinkButton ID="editTask" runat="server" OnClick="editTask_Click"><b></b>�༭��ʱ/������������</asp:LinkButton></li>
           <li id='p3'><asp:LinkButton ID="delTask" runat="server" OnClick="delTask_Click"><b></b>ɾ����ʱ/������������</asp:LinkButton></li>
           <li id='p5'><a href="KS.ShopLimitBuyPro.Aspx"><b></b>��������������Ʒ</a></li>
        </ul>
      </div>   
      <div class="menu_top_fixed_height"></div>
       <KS:KSGV ID="list" runat="server" cssclass="CTable" AutoGenerateColumns="False" Width="99%" EmptyDataText="û������κ���ʱ/������������!" GridLines="None" OnRowDataBound="list_RowDataBound" OnRowCommand="list_RowCommand" OnRowCreated="list_RowCreated" >
          <Columns>
              <asp:TemplateField HeaderText="ѡ��">
                <itemstyle horizontalalign="Center" width="50px" />
                <itemtemplate>
                    <input type="checkbox"  name="ids" id="ids" value='<%#Eval("taskid") %>' />
                </itemtemplate>
              </asp:TemplateField>
               <asp:BoundField DataField="TaskId" HeaderText="����ID" Visible="false">
                  <itemstyle horizontalalign="Center" />
                </asp:BoundField>

           <asp:TemplateField HeaderText="״̬">
              <itemstyle width="30px" horizontalalign="Center"/>
              <itemtemplate>
                   <a href="?action=status&taskid=<%#Eval("taskid")%>" <%# Convert.ToString(Eval("status"))=="0"?"class='no' title='�ر�'":"class='ok' title='����'" %>></a>
              </itemtemplate>
            </asp:TemplateField>

             <asp:TemplateField HeaderText="��������">
             <itemtemplate>
             <a href='<%# BasicField.GetLimitBuyUrl(Convert.ToInt32(Eval("taskid"))) %>' target="_blank" title='<%# Eval("taskname") %>'><%# Utils.CutStr(Convert.ToString(Eval("taskname")),40) %></a>
             <a href='KS.ShopLimitBuyPro.Aspx?TaskID=<%#Eval("taskid") %>'>(��Ʒ<span style="color:Red"><%# Eval("LimitBuyProNum") %></span>��)</a>
             </itemtemplate>
             </asp:TemplateField> 
             <asp:TemplateField HeaderText="����">
             <itemstyle horizontalalign="Center" />
             <itemtemplate>
             <%# Convert.ToString(Eval("tasktype")) == "1" ? "<span style='color:blue'>��ʱ</span>" : "<span style='color:green'>����</span>"%>  
             </itemtemplate>
             </asp:TemplateField>
             
             <asp:TemplateField HeaderText="ʱ������">
             <itemstyle horizontalalign="Left" Width="120" />
             <itemtemplate>
             <span class="tips">
             <%# Convert.ToString(Eval("tasktype")) == "1" ? (Convert.ToString(Eval("LimitBuyBeginTime")) + "��" + Convert.ToString(Eval("LimitBuyEndTime"))) : "---"%></span>
             </itemtemplate>
             </asp:TemplateField>
             
             <asp:TemplateField HeaderText="����ʱ��Ҫ��">
             <itemstyle horizontalalign="Center" />
             <itemtemplate>
             <span class="tips">�µ��� <%# Eval("LimitBuyPayTime")%> Сʱ��</span>
             </itemtemplate>
             </asp:TemplateField>
             

             
             <asp:TemplateField HeaderText="�༭">
              <itemstyle width="30px" horizontalalign="Center"/>
              <itemtemplate>
             <asp:LinkButton ID="LinkButton1" ToolTip="�༭" CssClass="edit" runat="server" commandargument=<%#Eval("taskid") %> commandname="modify"></asp:LinkButton>
              </itemtemplate>
            </asp:TemplateField>
             <asp:TemplateField HeaderText="ɾ��">
              <itemstyle width="30px" horizontalalign="Center"/>
              <itemtemplate>
             <asp:LinkButton runat="server" id="delete" CssClass="delete" ToolTip="ɾ��" commandargument=<%#Eval("taskid") %> commandname="del"></asp:LinkButton>
              </itemtemplate>
            </asp:TemplateField>

           
          </Columns>
            <HeaderStyle CssClass="CTitle" />
            <EmptyDataRowStyle CssClass="emptycss" />
      </KS:KSGV>
      <asp:Panel ID="Panel1" runat="server">
              <div style="height:5px;overflow:hidden;"></div>
            &nbsp;&nbsp;<input type="checkbox" name="chkall" id="chkall" onclick="CheckAll(this.form);"/><label for="chkall">ȫ��ѡ��</label>
            &nbsp;&nbsp;&nbsp;<input type="button" value="ɾ��ѡ�е�����" onmouseover="this.className='button_on';" onmouseout="this.className='button';" class="button" onclick="if (GetIDS('del')){this.form.action='?action=del';this.form.submit()}" id="Button1" />
    <input type="button" id="addProBtn" onclick="addPro()" class="button" value="���������Ʒ" />
          <script type="text/javascript">
              function addPro() {
                  top.openWin("�����ʱ����������Ʒ", "Shop/KS.ShopAddLimitPro.aspx", false, 400, 200);
              }
         
          </script>
    </asp:Panel> 
    
     <KS:Page ID="Page1" runat="server" />
        
    </asp:Panel>
    
    <asp:Panel ID="TaskManage" runat="server" Width="100%" Visible="false">
    
        <KS:TopNav ID="TopNav1" runat="server" />
        <table width="100%" border="0" cellpadding="1" cellspacing="1" class="CTable"> 
          <tr>
            <td class="lefttd" height="30" align="right" style="width: 147px"><strong>��ʱ/�����������ƣ�</strong></td>
            <td class="righttd">
                &nbsp;<asp:TextBox  CssClass="textbox" Width="250px" ID="TxtTaskName" runat="server"></asp:TextBox> ��: 1���װ7����ʱ����
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TxtTaskName"
                    ErrorMessage="��������ʱ/������������!"></asp:RequiredFieldValidator>
            </td>
          </tr>
          <tr>
                <td align="right" class="lefttd" height="30" style="width: 147px"><strong>�������ͣ�</strong></td>
                <td class="righttd">
                    <asp:RadioButtonList ID="RdbTaskType" runat="server" RepeatDirection="Horizontal" AutoPostBack="True" OnSelectedIndexChanged="RdbTaskType_SelectedIndexChanged">
                        <asp:ListItem Value="1" Selected="True">��ʱ����</asp:ListItem>
                        <asp:ListItem Value="2">��������</asp:ListItem>
                    </asp:RadioButtonList></td>
            </tr>
            <tr id="ShowTime" runat="server">
                <td align="right" class="lefttd" height="30" style="width: 147px">
                 <strong>����ʱ�����ƣ�</strong>
                </td>
                <td class="righttd">
                 <script>isHour = 1;</script>
                 &nbsp;<asp:TextBox  CssClass="textbox Wdate" ID="TxtLimitBuyBeginTime" onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'});" runat="server"></asp:TextBox> �� <asp:TextBox CssClass="textbox Wdate" onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'});" ID="TxtLimitBuyEndTime" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td align="right" class="lefttd" height="30" style="width: 147px">
                 <strong>��ٸ���ʱ�䣺</strong>
                </td>
                <td class="righttd">
                 �µ���<asp:TextBox style="text-align:center" CssClass="textbox" ID="TxtLimitBuyEndPayTime" Text="0" runat="server" Width="50"></asp:TextBox>Сʱ��û�и���,��Ϊ������Ч�������������¼��"0"�� 
                </td>
            </tr>
            <tr>
                <td align="right" class="lefttd" height="30" style="width: 147px">
                 <strong>������ܣ�</strong>
                </td>
                <td class="righttd">
                    <asp:TextBox  ID="TxtIntro" TextMode="multiLine" style="width:80%;height:200px;" runat="server"></asp:TextBox>
                    <% Kesion.APPCode.EditorAPI.EchoEditor("editor", this.TxtIntro.ClientID, "Basic");%>
                   
                
                </td>
            </tr>
             <tr>
                 <td align="right" class="lefttd" style="width: 132px; height: 30px">
                     <strong>����ͼƬ��</strong></td>
                 <td class="righttd" style="height: 30px">
                 &nbsp;<asp:TextBox CssClass="textbox" ID="TxtPhotoUrl" runat="server" width="250px"></asp:TextBox>
          &nbsp;<input type="button" class="button" onclick="SelectFiles('<%=this.TxtPhotoUrl.ClientID %>',4);" value="ѡ��ͼƬ">
                 </td>
             </tr>
             <tr>
                 <td align="right" class="lefttd" style="width: 132px; height: 30px">
                     <strong>�۸�Χ��</strong></td>
                 <td class="righttd" style="height: 30px">
                 &nbsp;<asp:TextBox CssClass="textbox" ID="TxtJGRange" runat="server" width="150px"></asp:TextBox>
                �� 100<%=MyCache.GetCurrencyUnit%>-120<%=MyCache.GetCurrencyUnit%>  </td>
             </tr>
             
            <tr>
                 <td align="right" class="lefttd" style="width: 132px; height: 30px">
                     <strong>�Ƿ��Ƽ���</strong></td>
                 <td class="righttd" style="height: 30px">
                 
                  <asp:RadioButtonList ID="RdbRecommend" runat="server" RepeatDirection="Horizontal">
                   <asp:ListItem Value="0" Selected>��</asp:ListItem>
                   <asp:ListItem Value="1">��</asp:ListItem>
                  </asp:RadioButtonList>
                 </td>
             </tr>
             <tr>
                 <td align="right" class="lefttd" style="width: 132px; height: 30px">
                     <strong>��ģ�壺</strong></td>
                 <td class="righttd" style="height: 30px">
                 &nbsp;<asp:TextBox CssClass="textbox" Text="{$TemplateDir}/�̳�ϵͳ/��������ҳ.html" ID="TxtTemplateFile" runat="server" width="250px"></asp:TextBox>
                  &nbsp;<input type="button" class="button" onclick="SelectTemplate('<%=this.TxtTemplateFile.ClientID %>');" value="ѡ��ģ��">
                 </td>
             </tr>

             
            <tr>
                <td align="right" class="lefttd" height="30" style="width: 147px">
                <strong>����״̬��</strong>
                </td>
                <td class="righttd">
                <asp:RadioButtonList ID="RdbStatus" runat="server" RepeatDirection="horizontal">
                 <asp:ListItem Value="1" Selected="true">����</asp:ListItem>
                 <asp:ListItem Value="0">����</asp:ListItem>
                </asp:RadioButtonList>
                </td>
            </tr>
        </table>
      <br />
      <KS:Foot ID="Foot1" runat="server" OnSubmit="Foot1_Submit" />
    </asp:Panel>
    
</asp:Content>

