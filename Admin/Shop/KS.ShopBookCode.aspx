<%@ Page Language="C#" MasterPageFile="~/Admin/MasterPage.master" EnableEventValidation="false"  AutoEventWireup="true" Inherits="Kesion.NET.WebSite.Admin.Shop.Admin_ShopBookCode" Title="ԤԼ�����" Codebehind="KS.ShopBookCode.aspx.cs" %>
<%@ Import Namespace="Kesion.Publics"%>
<%@ Import Namespace="Kesion.APPCode"%>
<%@ Import Namespace="Kesion.Cache"%>
<asp:Content ID="Content1" ContentPlaceHolderID="KSContent" Runat="Server">
     <asp:Panel ID="TaskList" runat="server" Width="100%">
      <div id="manage_top" class="menu_top_fixed">
          <span style="float:right">
              <asp:DropDownList ID="DrpSelectType" runat="server">

              </asp:DropDownList>
          </span>
        <ul>
           <li id='p1'><asp:LinkButton ID="addTask" runat="server" OnClick="addTask_Click"><b></b>��������ԤԼ��</asp:LinkButton></li>
           <li id='p4'><a href="javascript:;" onclick="location.href='KS.ShopBookCodeType.aspx';"><b></b>ԤԼ��������</a></li>
           <li id='p3'><asp:LinkButton ID="delTask" runat="server" OnClick="delTask_Click"><b></b>ɾ��ԤԼ��</asp:LinkButton></li>
        </ul>
          
      </div>   
     <div class="menu_top_fixed_height"></div> 
      
<div class="tabs_header">
    <ul class="tabs">
    <li<%=KSCMS.S("flag")==""?" class='active'":string.Empty %>><a href="KS.ShopBookCode.aspx"><span>����ԤԼ��</span></a></li>
    <li<%=KSCMS.S("flag")=="1"?" class='active'":string.Empty %>><a href="KS.ShopBookCode.aspx?flag=1"><span>δʹ��ԤԼ��</span></a></li>
    <li<%=KSCMS.S("flag")=="2"?" class='active'":string.Empty %>><a href="KS.ShopBookCode.aspx?flag=2"><span>��ʹ��ԤԼ��</span></a></li>
    <li<%=KSCMS.S("flag")=="3"?" class='active'":string.Empty %>><a href="KS.ShopBookCode.aspx?flag=3"><span>����ԤԼ��</span></a></li>
    <li<%=KSCMS.S("flag")=="4"?" class='active'":string.Empty %>><a href="KS.ShopBookCode.aspx?flag=4"><span>�ѱ�����ԤԼ��</span></a></li>
    <li<%=KSCMS.S("flag")=="5"?" class='active'":string.Empty %>><a href="KS.ShopBookCode.aspx?flag=5"><span>δ������ԤԼ��</span></a></li>
    </ul>
</div>
      

  <KS:KSGV ID="list" runat="server" cssclass="CTable" AutoGenerateColumns="False" Width="99%" 
             EmptyDataText="û���ҵ��κ�ԤԼ��!" GridLines="None" OnRowDataBound="list_RowDataBound" 
             OnRowCommand="list_RowCommand" OnRowCreated="list_RowCreated" 
             AllowPaging="false">
          <Columns>
              <asp:TemplateField HeaderText="ѡ��">
                <itemstyle horizontalalign="Center" width="40px" />
                <itemtemplate>
                    <input type="checkbox"  name="ids" id="ids" value='<%#Eval("id") %>' />
                </itemtemplate>
              </asp:TemplateField>
               
             <asp:TemplateField HeaderText="ԤԼ�����">
             <itemstyle VerticalAlign="Top" />
             <itemtemplate>
            <%# Eval("TypeName")%>

             </itemtemplate>
             </asp:TemplateField> 
              <asp:TemplateField HeaderText="ԤԼ�뿨��">
             <itemstyle />
             <itemtemplate>
                 <%# Eval("CodeID") %>
             </itemtemplate>
             </asp:TemplateField>
             <asp:TemplateField HeaderText="����ʱ��">
             <itemstyle horizontalalign="Center" />
             <itemtemplate>
                 <%# Eval("AddDate") %>
             </itemtemplate>
             </asp:TemplateField>
             <asp:TemplateField HeaderText="�Ƿ�ʹ��">
             <itemstyle horizontalalign="Center" />
             <itemtemplate>
             <itemstyle horizontalalign="Center" />
                 <%# Convert.ToString(Eval("IsUsed"))=="1"?"��ʹ��":(Convert.ToString(Eval("IsUsed"))=="2"?"<span class='tips'>����</span>":"<span style='color:red'>δʹ��</span>") %>
             </itemtemplate>
             </asp:TemplateField>
             <asp:TemplateField HeaderText="ʹ����">
             <itemstyle horizontalalign="Center" />
             <itemtemplate>
             <itemstyle horizontalalign="Center" />
                 <%# Convert.ToString(Eval("IsUsed"))=="1"?Eval("UserName"):"-" %>
             </itemtemplate>
             </asp:TemplateField>
             <asp:TemplateField HeaderText="ʹ��ʱ��">
             <itemstyle horizontalalign="Center" />
             <itemtemplate>
             <itemstyle horizontalalign="Center" />
                 <%# Convert.ToString(Eval("IsUsed"))=="1"?Eval("UseTime"):"-" %>
             </itemtemplate>
             </asp:TemplateField>
             <asp:TemplateField HeaderText="����">
             <itemstyle horizontalalign="Center" />
             <itemtemplate>
             <itemstyle horizontalalign="Center" />
                 <%# Convert.ToString(Eval("IsUsed"))=="1"?MyCache.GetAreaName(Utils.StrToInt(Convert.ToString(Eval("cityid"))),"city"):"-" %>
             </itemtemplate>
             </asp:TemplateField>

              <asp:TemplateField HeaderText="�༭">
              <itemstyle width="30px" horizontalalign="Center"/>
              <itemtemplate>
             <asp:LinkButton ID="LinkButton1" CssClass="edit" ToolTip="�༭" runat="server" commandargument=<%#Eval("id") %> commandname="modify"></asp:LinkButton>
              </itemtemplate>
             </asp:TemplateField>
             
              <asp:TemplateField HeaderText="ɾ��">
              <itemstyle width="30px" horizontalalign="Center"/>
              <itemtemplate>
             <asp:LinkButton runat="server" CssClass="delete" ToolTip="ɾ��" id="delete" commandargument=<%#Eval("id") %> commandname="del"></asp:LinkButton>
              </itemtemplate>
            </asp:TemplateField>

             
            <asp:TemplateField HeaderText="������">
                <itemstyle horizontalalign="Center" />
             <itemtemplate>
             <asp:LinkButton ID="BtnLock" runat="server" CommandArgument=<%#Eval("id") %>  CommandName="locked"></asp:LinkButton>
               </itemtemplate>
            </asp:TemplateField>
          </Columns>
            <HeaderStyle CssClass="CTitle" />
            <EmptyDataRowStyle CssClass="emptycss" />
      </KS:KSGV>
      <asp:Panel ID="Panel1" runat="server">
              <div style="height:5px;overflow:hidden;"></div>
            &nbsp;&nbsp;&nbsp;&nbsp;<input type="checkbox" name="chkall" id="chkall" onclick="CheckAll(this.form);"/><label for="chkall">ȫ��ѡ��</label>
          <input type="button" value="ɾ��ѡ�е�������" onmouseover="this.className='button_on';" onmouseout="this.className='button';" class="button" onclick="if (GetIDS('del')){this.form.action='?action=del';this.form.submit()}" id="Button1" />
          <input type="button" value="��ӡ" class="button" onclick="window.print();" />
    </asp:Panel> 
    
    <KS:Page ID="Page1" runat="server" />
    
    <div class="message">
    
   <strong>����ԤԼ�룺</strong><asp:DropDownList ID="DrpTJ" runat="server">
     <asp:ListItem Value="0">ԤԼ���������</asp:ListItem>
     <asp:ListItem Value="1" Selected="True">ԤԼ�뿨��</asp:ListItem>
     <asp:ListItem Value="2">ʹ�û�Ա����</asp:ListItem>
    </asp:DropDownList> <asp:TextBox runat="server" ID="TxtKeyWord" CssClass="textbox" /> 

    <asp:Button ID="BtnSearch" runat="server" CssClass="button" Text="��ʼ����" 
            onclick="BtnSearch_Click"  />
        </div>
        
    </asp:Panel>
    

    <asp:Panel ID="PanelModify" runat="server" Width="100%" Visible="false">
         <KS:TopNav ID="TopNav2" runat="server" Text="�޸��ջ���Ϣ" />
        <table width="99%" align="center" border="0" cellpadding="1" cellspacing="1" class="CTable"> 
          <tr>
            <td class="lefttd" height="30" align="right" style="width: 109px"><strong>ԤԼ�룺</strong></td>
            <td class="righttd">
                &nbsp;<asp:Label ID="LabCodeID" runat="server"></asp:Label>
            </td>
          </tr>
          <tr>
            <td class="lefttd" height="30" align="right" style="width: 109px"><strong>ʹ�õ�����</strong></td>
            <td class="righttd">
                &nbsp;<asp:Label ID="LabArea" runat="server"></asp:Label>
            </td>
          </tr>
          <tr>
            <td class="lefttd" height="30" align="right" style="width: 109px"><strong>�ջ��ˣ�</strong></td>
            <td class="righttd">
                &nbsp;<asp:TextBox ID="TxtRealName" runat="server" CssClass="textbox" width="200"/>
            </td>
          </tr>
          <tr>
            <td class="lefttd" height="30" align="right" style="width: 109px"><strong>�ջ���ַ��</strong></td>
            <td class="righttd">
                &nbsp;<asp:TextBox ID="TxtAddress" runat="server" CssClass="textbox" width="200"/>
            </td>
          </tr>
          <tr>
            <td class="lefttd" height="30" align="right" style="width: 109px"><strong>�ջ��绰��</strong></td>
            <td class="righttd">
                &nbsp;<asp:TextBox ID="TxtMobile" runat="server" CssClass="textbox" width="200"/>
            </td>
          </tr>
          <tr>
            <td class="lefttd" height="30" align="right" style="width: 109px"><strong>�ջ��ʱࣺ</strong></td>
            <td class="righttd">
                &nbsp;<asp:TextBox ID="TxtZipCode" runat="server" CssClass="textbox" width="200"/>
            </td>
          </tr>
        </table>
        <br />
        <br />
              <KS:Foot ID="Foot2" runat="server" OnSubmit="Foot2_Submit" />

    </asp:Panel>

    <asp:Panel ID="TaskManage" runat="server" Width="100%" Visible="false">
    
        <KS:TopNav ID="TopNav1" runat="server" />
        <table width="99%" align="center" border="0" cellpadding="1" cellspacing="1" class="CTable"> 
          <tr>
            <td class="lefttd" height="30" align="right" style="width: 109px"><strong>ԤԼ����ࣺ</strong></td>
            <td class="righttd" style="width: 487px">
                &nbsp;<asp:DropDownList ID="DrpTypeID" runat="server">

                </asp:DropDownList>
                <span class="tips">��ѡ��ԤԼ���������ࡣ</span> <a href="KS.ShopBookCodeType.aspx">���ԤԼ�����</a>
                
            </td>
          </tr>
          
          <tr>
                <td align="right" class="lefttd" height="30" style="width: 109px"><strong>����������</strong></td>
                <td class="righttd" style="width: 487px">
                 &nbsp;<asp:TextBox ID="TxtNum" runat="server" Text="100" CssClass="textbox" />��
                </td>
            </tr>
            <tr>
                 <td align="right" class="lefttd" style="width: 109px; height: 30px">
                     <strong>����ԤԼ��ǰ׺��</strong></td>
                 <td class="righttd" style="height: 30px; width: 487px;">
                 &nbsp;<asp:TextBox ID="TxtPre" runat="server" Text="yym" CssClass="textbox" /> <span class="tips">�磺KS,YYM��</span>
                 </td>
             </tr>
            <tr>
                 <td align="right" class="lefttd" style="width: 109px; height: 30px">
                     <strong>����ԤԼ��λ����</strong></td>
                 <td class="righttd" style="height: 30px; width: 487px;">
                 &nbsp;<asp:TextBox ID="TxtLen" runat="server" Text="10" CssClass="textbox" /> <span class="tips">��������10-15֮������֡�</span>
                 </td>
             </tr>
            <tr>
                 <td align="right" class="lefttd" style="width: 109px; height: 30px">
                     <strong>ԤԼ�빹�ɷ�ʽ��</strong></td>
                 <td class="righttd" style="height: 30px; width: 487px;">
                  <asp:RadioButtonList ID="RdbType" runat="server">
                      <asp:ListItem Value="0" Selected="True">������</asp:ListItem>
                      <asp:ListItem Value="1">����ĸ</asp:ListItem>
                      <asp:ListItem Value="2">���ֵ�Ӣ�ĵ�������</asp:ListItem>
                  </asp:RadioButtonList>

                 </td>
             </tr>
            <tr>
                 <td align="right" class="lefttd" style="width: 109px; height: 30px">
                     <strong>ԤԼ������ʱ�䣺</strong></td>
                 <td class="righttd" style="height: 30px; width: 487px;">
                 &nbsp;<asp:TextBox ID="TxtAddDate" runat="server" onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'});" CssClass="textbox" />
                     <span class="tips">��ʽ��<%=DateTime.Now.ToString() %></span>
                 </td>
             </tr>

        </table>
        <script>
             
            function CheckForm() {
                if (jQuery("#<%=this.DrpTypeID.ClientID %>").val() == '0') {
                    KesionJS.Alert("����ѡ��ԤԼ���������࣡", 'jQuery("#<%=this.DrpTypeID.ClientID %>").focus()');
                    return false;
                }

                if (jQuery("#<%=this.TxtNum.ClientID %>").val() == '') {
                    KesionJS.Alert("����������������", 'jQuery("#<%=this.TxtNum.ClientID %>").focus()');
                    return false;
                }

                return true;
            }
        </script>
      <br />
      <KS:Foot ID="Foot1" runat="server" OnSubmit="Foot1_Submit" />
    </asp:Panel>
    
</asp:Content>

