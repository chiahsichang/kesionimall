<%@ Page Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="True" Inherits="Kesion.NET.WebSite.Admin_AdBoard" Title="���λ����" Codebehind="KS.AdBoard.aspx.cs" %>
<%@ Import Namespace="Kesion.Cache" %>
<%@ Import Namespace="Kesion.Publics" %>
<asp:Content ID="Content1" ContentPlaceHolderID="KSContent" Runat="Server">
<asp:Panel ID="listPanel" runat="server" Width="100%">
    <div id="manage_top" class="menu_top_fixed">
         <ul>
<span style="float:right;padding-right:10px">
        <select name="classid" style="width:150px" OnChange="location.href='KS.ADBoard.Aspx?classid='+this.value;">
                <option value="">������鿴...</option>
                <option value="-1"<%=KSCMS.S("classid")=="-1"?" selected":"" %>>��վͨ��</option>
                <option value="0"<%=KSCMS.S("classid")=="0"?" selected":"" %>>��վ��ҳ</option>
                <% =getClassOption()%>
               </select>  </span>    


           <li id='p1'><asp:LinkButton ID="addboard" runat="server" OnClick="addboard_Click"><b></b>��ӹ��λ</asp:LinkButton></li>
           <li id='p4'><asp:LinkButton ID="editboard" runat="server"><b></b>�༭���λ</asp:LinkButton></li>
           <li id='p3'><asp:LinkButton ID="delboard" runat="server" OnClick="delboard_Click"><b></b>ɾ�����λ</asp:LinkButton></li></ul>
    </div> 
    <div class="menu_top_fixed_height"></div>  
    
    <KS:KSGV ID="list" cssclass="CTable" runat="server" EmptyDataText="��û������κεĹ��λ!" GridLines="None" Width="99%" AutoGenerateColumns="False" OnRowDataBound="list_RowDataBound" PagerType="CustomNumeric" OnRowEditing="list_RowEditing" OnRowCommand="list_RowCommand" OnRowDeleting="list_RowDeleting" OnRowCreated="list_RowCreated">
       <Columns>
            <asp:TemplateField HeaderText="ѡ��">
                <ItemStyle HorizontalAlign="Center"  Width="40px"/>
                <ItemTemplate>
                <input type="checkbox"  name="ids" id="ids" value="<%#Eval("boardid") %>" />
                </ItemTemplate>
            </asp:TemplateField>

            <asp:TemplateField HeaderText="״̬">
              <itemstyle width="30px" horizontalalign="Center"/>
              <itemtemplate>
                   <a href="?action=status&boardid=<%#Eval("boardid")%>" <%# Convert.ToString(Eval("status"))=="0"?"class='no' title='��ͣ'":"class='ok' title='����'" %>></a>
              </itemtemplate>
            </asp:TemplateField>
                
            <asp:BoundField DataField="BoardID" HeaderText="���λID" ReadOnly="True">
                <itemstyle horizontalalign="Center" width="60px" />
            </asp:BoundField>

           <asp:TemplateField HeaderText="���λ����">
                <ItemStyle/>
                <ItemTemplate>
                  <a href="KS.Advertise.aspx?boardid=<%# Eval("boardid") %>" title="�鿴�ù��λ�µĹ����"><%# Eval("boardname") %></a>
                </ItemTemplate>
            </asp:TemplateField>
           <asp:TemplateField HeaderText="����">
                 <itemstyle horizontalalign="Center" width="120px" />
                <ItemTemplate>
                    <%# GetClassName(Utils.StrToInt(Convert.ToString(Eval("classId"))), Convert.ToString(Eval("className"))) %>
                </ItemTemplate>
            </asp:TemplateField>

            <asp:BoundField DataField="filename" HeaderText="JS�ļ���" />
            <asp:BoundField DataField="AdRate" DataFormatString="{0} Ԫ/��" HeaderText="���λ�۸�">
                <itemstyle horizontalalign="Center" width="100px" />
            </asp:BoundField>
            <asp:BoundField DataField="maxads" DataFormatString="{0} ��" HeaderText="�����">
                <itemstyle horizontalalign="Center" width="50px" />
            </asp:BoundField>

            <asp:TemplateField HeaderText="�༭">
              <itemstyle width="30px" horizontalalign="Center"/>
              <itemtemplate>
                <asp:LinkButton runat="server" CssClass="edit" ToolTip="�༭" CommandName="Edit" CausesValidation="False" id="LinkButton1"></asp:LinkButton>
              </itemtemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="ɾ��">
              <itemstyle width="30px" horizontalalign="Center"/>
              <itemtemplate>
                <asp:LinkButton runat="server"  ToolTip="ɾ��" CssClass="delete" CommandName="Delete" CausesValidation="False" id="LinkButtonDel"></asp:LinkButton>
              </itemtemplate>
            </asp:TemplateField>

           <asp:TemplateField HeaderText="������JS">
               <itemstyle width="50px" horizontalalign="Center" />
               <itemtemplate>
                <asp:LinkButton runat="server" CommandName="createjs" CausesValidation="False" CommandArgument='<%#Eval("boardid") %>' id="LinkButtonFso"><b>����</b></asp:LinkButton>
                </itemtemplate>
           </asp:TemplateField>
        </Columns>
        <HeaderStyle CssClass="CTitle" />
            <EmptyDataRowStyle CssClass="emptycss" />
    </KS:KSGV>
     <KS:Page ID="Page1" runat="server" />

     <div class="message">
       <strong>�������λ��</strong>
        <asp:DropDownList ID="DrpTJ" runat="server">
            <asp:ListItem Value="1" Selected="True">���λID</asp:ListItem>
            <asp:ListItem Value="2">���λ����</asp:ListItem>
        </asp:DropDownList>
         <asp:TextBox ID="TxtKeyWord" runat="server" CssClass="textbox" />
         <asp:Button ID="BtnSearch" runat="server" Text="����" CssClass="button" OnClick="BtnSearch_Click" />
   </div>

        <script type="text/javascript">
            showtips('<span class="state"><strong>˵����</strong><br /></span>1�����й��λ���������ɾ�̬JS��ſ��Ե���<br />        2�����JS�ļ��ĵ��÷����� &lt;script src="<span style="color: #ff3366"><%=MyCache.GetCacheConfig(5)+MyCache.GetCacheConfig(0)+MyCache.GetCacheConfig(12) %>/{0}</span>"&gt;&lt;/script&gt;<br />        ����<span style="color: #ff3366">{0}</span>��ʾ���JS���ɵ��ļ�������"banner.js��ad.js"��');
		</script>
</asp:Panel>

    <asp:Panel ID="addPanel" runat="server" Width="100%" Visible="false">
        <KS:TopNav ID="TopNav2" runat="server" Text="��ӹ��λ" />
    <table width="99%" align="center" border="0" cellpadding="1" cellspacing="1" class="CTable"> 
        <tr>
            <td class="lefttd" height="30" align="right" style="width: 198px"><b>���λ���ࣺ</b></td>
            <td class="righttd">
                &nbsp;<asp:DropDownList ID="DrpClassID" runat="server"></asp:DropDownList>
               </td>
          </tr>
          <tr>
            <td class="lefttd" height="30" align="right" style="width: 198px"><b>���λ���ƣ�</b></td>
            <td class="righttd">
                &nbsp;<asp:TextBox CssClass="textbox" ID="BoardName" runat="server" Width="268px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="BoardName"
                    ErrorMessage="����д���λ����!" Display="Dynamic"></asp:RequiredFieldValidator></td>
          </tr>
        <tr>
            <td align="right" class="lefttd" height="30" style="width: 198px">
                <strong>���λJS�ļ���</strong></td>
            <td class="righttd">
                &nbsp;<asp:TextBox CssClass="textbox" ID="FileName" runat="server" Width="87px"></asp:TextBox>&nbsp; �� banner.js
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="FileName"
                    ErrorMessage="����д���λJS�ļ���!" Display="Dynamic"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="FileName"
                    ErrorMessage="RegularExpressionValidator" ValidationExpression="[\W\w-]+\.([jJ][sS])">��չ��������.js</asp:RegularExpressionValidator></td>
        </tr>
        <tr>
            <td align="right" class="lefttd" height="30" style="width: 198px">
                <strong>���λ�۸�</strong></td>
            <td class="righttd">
                &nbsp;<asp:TextBox CssClass="textbox" ID="AdRate" runat="server" Text="200" Width="60px"></asp:TextBox>
                Ԫ/��<asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server"
                    ControlToValidate="AdRate" ErrorMessage="��������ȷ�Ĺ��λ�۸�" ValidationExpression="\d{1,4}"></asp:RegularExpressionValidator></td>
        </tr>
        <tr>
            <td align="right" class="lefttd" height="30" style="width: 198px">
                <strong>���������</strong></td>
            <td class="righttd">
                &nbsp;<asp:TextBox CssClass="textbox" ID="Maxads" runat="server" Text="5" Width="60px"></asp:TextBox>
                ��
                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="Maxads"
                    ErrorMessage="��������ȷ�Ĺ��λ����" ValidationExpression="\d{1,2}"></asp:RegularExpressionValidator></td>
        </tr>
        <tr>
            <td align="right" class="lefttd" height="30" style="width: 198px">
                <strong>��ע˵����</strong></td>
            <td class="righttd">
                &nbsp;<asp:TextBox CssClass="textbox" ID="Note" runat="server" Height="67px" TextMode="MultiLine" Width="303px"></asp:TextBox></td>
        </tr>
        <tr>
            <td align="right" class="lefttd" height="30" style="width: 198px">
                <strong>���λ״̬��</strong></td>
            <td class="righttd">
                <asp:RadioButtonList ID="Status" runat="server" RepeatDirection="Horizontal">
                    <asp:ListItem Selected="True" Value="1">�</asp:ListItem>
                    <asp:ListItem Value="0">��ͣ</asp:ListItem>
                </asp:RadioButtonList></td>
        </tr>
    </table>
        <br />
        <KS:Foot ID="Foot1" runat="server" OnSubmit="Foot1_Submit" />
    </asp:Panel>
</asp:Content>

