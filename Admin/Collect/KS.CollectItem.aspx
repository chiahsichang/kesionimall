<%@ Page Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="True" Inherits="Kesion.NET.WebSite.Admin_CollectItem" Title="�ɼ���Ŀ����" Codebehind="KS.CollectItem.aspx.cs" %>
<asp:Content ID="Content1" ContentPlaceHolderID="KSContent" Runat="Server">
    <asp:Panel ID="ListPanel" runat="server" Width="100%">
    <div id="manage_top" class="menu_top_fixed">
       <ul>
           <li id='p1'><asp:LinkButton ID="addclassbutton" runat="server" OnClick="addclassbutton_Click"><b></b>��Ӳɼ���Ŀ</asp:LinkButton></li>
           <li id='p4'><asp:LinkButton ID="editclassbutton" runat="server" OnClick="editclassbutton_Click"><b></b>�༭��Ŀ</asp:LinkButton></li>
           <li id='p3'><asp:LinkButton ID="delclassbutton" runat="server" OnClick="delclassbutton_Click"><b></b>ɾ����Ŀ</asp:LinkButton></li>
           <li id='p5'><asp:LinkButton ID="topverifybutton" runat="server" OnClick="topverifybutton_Click"><b></b>��ʼ�ɼ�</asp:LinkButton></li><div id="go">
           <asp:DropDownList ID="ShowClassID" runat="server">
           </asp:DropDownList>
           </div>
           </ul>
    </div> 
     <div class="menu_top_fixed_height"></div>   
    <KS:ksgv id="List" cssclass="CTable" runat="server" AutoGenerateColumns="False" EmptyDataText="û������κβɼ���Ŀ!" PagerType="CustomNumeric" Width="99%" HorizontalAlign="center" GridLines="None" OnRowDataBound="List_RowDataBound" OnRowCommand="List_RowCommand" OnRowCreated="List_RowCreated" AllowPaging="False">
        <Columns>
            <asp:TemplateField HeaderText="ѡ��">
                <itemstyle horizontalalign="Center" width="50px" />
                
                <itemtemplate>
<input type="checkbox"  name="ids" id="ids" value="<%#Eval("ItemID") %>" />
            
</itemtemplate>
            </asp:TemplateField>

            <asp:BoundField HeaderText="��Ŀ����" DataField="ItemName" >
             <itemstyle width="180px"/>
            </asp:BoundField>

            <asp:TemplateField HeaderText="Ŀ��վ������">
              <itemstyle />
              <itemtemplate>
              <span class="tips"><%# Eval("SiteName")%></span>
              </itemtemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="�ϴβɼ�ʱ��">
              <itemstyle width="130px" horizontalalign="Center"/>
              <itemtemplate>
              <span class="tips"><%# Eval("LastCollectTime") %></span>
              </itemtemplate>
            </asp:TemplateField>



            <asp:TemplateField HeaderText="״̬">
                <ItemStyle  HorizontalAlign="Center" Width="60px" />
                    <ItemTemplate>
                   <a href="javascript:;" <%# Convert.ToString(Eval("IsCanCollect"))=="0"?"class='no' title='��'":"class='ok' title='��'" %>></a>
                 </ItemTemplate>
                </asp:TemplateField>

 

            <asp:TemplateField HeaderText="�༭">
              <itemstyle width="30px" horizontalalign="Center"/>
              <itemtemplate>
               <asp:LinkButton ToolTip="�༭" CssClass="edit" ID="LinkButton1" runat="server" commandargument=<%#Eval("itemid") %> commandname="modify"></asp:LinkButton>
              </itemtemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="ɾ��">
              <itemstyle width="30px" horizontalalign="Center"/>
              <itemtemplate>
             <asp:LinkButton runat="server" CssClass="delete" ToolTip="ɾ��" id="delete" commandargument=<%#Eval("itemid") %> commandname="del"></asp:LinkButton><br />
              </itemtemplate>
            </asp:TemplateField>

            <asp:TemplateField HeaderText="���������">
                <itemstyle width="120px" horizontalalign="Center" />
             <itemtemplate>
             <asp:LinkButton runat="server" id="test" commandargument=<%#Eval("itemid") %> commandname="test">����</asp:LinkButton>
             <asp:LinkButton runat="server" id="collect" commandargument=<%#Eval("itemid") %> commandname="collect">�ɼ�</asp:LinkButton>
             <asp:LinkButton runat="server" id="copy" commandargument=<%#Eval("itemid") %> commandname="copy">����</asp:LinkButton>
            
            
</itemtemplate>
           
            </asp:TemplateField>
        </Columns>
        <HeaderStyle CssClass="CTitle" />
            <EmptyDataRowStyle CssClass="emptycss" />
    </KS:ksgv>
            <asp:Panel ID="Panel1" runat="server" Height="30px" Width="741px">
              <div style="margin-top:5px;overflow:hidden;"></div>
            &nbsp;&nbsp;<input type="checkbox" name="chkall" id="chkall" onclick="CheckAll(this.form);"/><label for="chkall">ȫ��ѡ��</label>
            
            <input type="button" value="ɾ��ѡ�е���Ŀ" onmouseover="this.className='button_on';" onmouseout="this.className='button';" class="button" onclick="if (GetIDS('del')){this.form.action='?action=del';this.form.submit()}" />
                    <asp:Button ID="CollectButton" runat="server" Text="�����ɼ�" OnClick="CollectButton_Click" />
<KS:Page ID="Page1" runat="server" />
           </asp:Panel>
</asp:Panel>


     
    <asp:Panel ID="PannelStep1" runat="server" Width="100%" Visible="false">
        <KS:TopNav ID="TopNav1" runat="server" Text="��Ӳɼ���Ŀ��һ��" />
    <table width="99%" align="center" border="0" cellpadding="1" cellspacing="1" class="CTable"> 
          <tr>
            <td class="lefttd" align="right" style="height:30px;width: 198px"><b>�ɼ���Ŀ���ƣ�</b></td>
            <td class="righttd">
                &nbsp;<asp:TextBox CssClass="textbox" ID="ItemName" runat="server" Width="268px"></asp:TextBox>
                <span style="color: #009900">�磺������Ŀ�ɼ���</span><asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="ItemName"
                    ErrorMessage="����д�ɼ���Ŀ����!"></asp:RequiredFieldValidator></td>
          </tr>
        <tr>
            <td align="right" class="lefttd" style="height:30px;width: 198px">
                <strong>ģ�����ã�</strong></td>
            <td class="righttd">
                &nbsp;<asp:DropDownList ID="ModelID" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ModelID_SelectedIndexChanged">
                </asp:DropDownList></td>
        </tr>
        <tr>
            <td align="right" class="lefttd" style="height:30px;width: 198px">
                <strong>��Ϣ�����Ŀ��</strong></td>
            <td class="righttd">
             <span id="ClassArea" runat="server"></span>
                </td>
        </tr>
        <tr>
            <td align="right" class="lefttd" style="height:30px;width: 198px">
                <strong>Ŀ��վ�����ƣ�</strong></td>
            <td class="righttd">
                &nbsp;<asp:TextBox CssClass="textbox" ID="SiteName" runat="server"></asp:TextBox>
                �磺����163��<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="SiteName"
                    ErrorMessage="����дĿ��վ������!"></asp:RequiredFieldValidator></td>
        </tr>
        <tr>
            <td align="right" class="lefttd" style="height:30px;width: 198px">
                <strong>�ɼ�Ŀ��URL��</strong></td>
            <td class="righttd">
                &nbsp;<asp:TextBox CssClass="textbox" ID="SiteURL" Width="350px" Text="http://" runat="server"></asp:TextBox>
                �磺http://www.kesion.com/news/index.html<asp:RequiredFieldValidator ControlToValidate="SiteURL" ID="RequiredFieldValidator4" runat="server" ErrorMessage="������Ŀ����վURL��ַ"></asp:RequiredFieldValidator></td>
        </tr>
        <tr>
            <td align="right" class="lefttd" style="height:30px;width: 198px">
                <strong>���뷽ʽ��</strong></td>
            <td class="righttd">
                &nbsp;<asp:DropDownList ID="Encoding" runat="server">
                    <asp:ListItem Value="0">�Զ����</asp:ListItem>
                    <asp:ListItem>UTF-8</asp:ListItem>
                    <asp:ListItem>GB2312</asp:ListItem>
                    <asp:ListItem>BIG5</asp:ListItem>
                </asp:DropDownList></td>
        </tr>
        <tr>
            <td align="right" class="lefttd" style="height:30px;width: 198px">
                <strong>�������ԣ�</strong></td>
            <td class="righttd">
                <asp:CheckBoxList ID="Attribute" runat="server" RepeatDirection="Horizontal">
                    <asp:ListItem Value="1">�Ƽ�</asp:ListItem>
                    <asp:ListItem Value="2">�ȵ�</asp:ListItem>
                    <asp:ListItem Value="3">����</asp:ListItem>
                    <asp:ListItem Value="4">ͷ��</asp:ListItem>
                    <asp:ListItem Value="5">����</asp:ListItem>
                    <asp:ListItem Value="6">�õ�</asp:ListItem>
                    <asp:ListItem Value="7" Selected="True">��������</asp:ListItem>
                    <asp:ListItem Selected="True" Value="8">���ͨ��</asp:ListItem>
                    <asp:ListItem Value="9" Selected="True">��ʾ���ֻ���</asp:ListItem>
                </asp:CheckBoxList></td>
        </tr>
        <tr>
            <td align="right" class="lefttd" style="height:30px;width: 198px">
                <strong>�ɼ�ѡ�</strong></td>
            <td class="righttd">
                <asp:CheckBoxList ID="CollectionOption" runat="server" RepeatDirection="Horizontal">
                    <asp:ListItem Value="1">����ͼƬ������</asp:ListItem>
                    <asp:ListItem Selected="True" Value="2">��������HMTL</asp:ListItem>
                    <asp:ListItem Value="3" Selected>�Ѵ��������ͬ����¼����</asp:ListItem>
                    <asp:ListItem Value="4">����ɼ�</asp:ListItem>
                    <asp:ListItem Value="5">�Զ�������ҳͼƬ</asp:ListItem>
                </asp:CheckBoxList>
               <strong>��ͣ���ã�</strong>
                
               ÿ�ɼ�<asp:TextBox CssClass="textbox" ID="PausePerNum" Text="100" Width="40px" runat="server"></asp:TextBox>����¼��ͣ<asp:TextBox  CssClass="textbox" ID="PauseTime" Width="40px" Text="2" runat="server"></asp:TextBox>��
                
                </td>
        </tr>
        <tr>
            <td align="right" class="lefttd" style="height:30px;width: 198px">
            <b>�б���ȣ�</b>
            </td>
            <td class="righttd">
                &nbsp;<asp:TextBox CssClass="textbox" Text="0" ID="CollectListNum"  Width="40px" runat="server"></asp:TextBox> <font color=green>��0����ձ�ʾ�ɼ������б�</font></td>
        </tr>
        <tr>
            <td align="right" class="lefttd" style="height:30px;width: 198px">
            <b>�ɼ���Ϣ������</b>
            </td>
            <td class="righttd">
                &nbsp;<asp:TextBox CssClass="textbox" Text="0" ID="CollectInfoNum"  Width="40px" runat="server"></asp:TextBox> <font color=green>��0����ձ�ʾ�ɼ�������Ϣ�������ʾ�ɹ��ɼ������趨�ļ�¼��ֹͣ��</font></td>
        </tr>
        <tr>
            <td align="right" class="lefttd" style="height:30px;width: 198px">
            <b>��Ŀ���ܣ�</b>
            </td>
            <td class="righttd">
                &nbsp;<asp:TextBox CssClass="textbox" ID="ItemRemark" TextMode="MultiLine" Width="420px" runat="server" Height="69px"></asp:TextBox></td>
        </tr>
      </table>
      <br />
        <KS:Foot ID="Foot1" runat="server" OnSubmit="Foot1_Submit" SubmitButtonText="��һ��(0)" />
      
    </asp:Panel>
    

    

</asp:Content>
