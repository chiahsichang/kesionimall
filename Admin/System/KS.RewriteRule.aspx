<%@ Page Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.Admin_RewriteRule" Title="Untitled Page" Codebehind="KS.RewriteRule.aspx.cs" %>
<asp:Content ID="Content1" ContentPlaceHolderID="KSContent" Runat="Server">
    <asp:Panel ID="listPanel" runat="server" Width="100%">
       <KS:TopNav ID="TopNav2" runat="server" Text="α��̬�������" />
        <script type="text/javascript">
 <!--

            function setExt(v) {
                if (v == '') return;
                jQuery("#<%=this.TxtRwriteExtension.ClientID %>").val(v);
            }
       //-->
	</script>
       <table width="99%"  border="0" cellpadding="1" cellspacing="1" class="CTable" style="border-bottom:none"> 
            <tr>
               <td class="lefttd" align="right" style="width:98px"><b>α��̬��չ����</b></td>
               <td class="righttd">
                  &nbsp;<asp:TextBox ID="TxtRwriteExtension" runat="server" CssClass="textbox" Width="40px" /> <=
                                                         <asp:DropDownList ID="DrpExtension" runat="server" onchange="setExt(this.value);">
                                                           <asp:ListItem Value="">--����ѡ��--</asp:ListItem>
                                                            <asp:ListItem>.aspx</asp:ListItem>
                                                            <asp:ListItem>.htm</asp:ListItem>
                                                            <asp:ListItem>.html</asp:ListItem>
                                                            <asp:ListItem>.shtm</asp:ListItem>
                                                            <asp:ListItem>.shtml</asp:ListItem>
                                                            <asp:ListItem>/</asp:ListItem>
                                                        </asp:DropDownList>
                  <span class="tips">����α��̬�������ñ�ǩ[ext]������չ����</span>  
                    <span style="float:right"><asp:Button ID="Button3" CssClass="button" runat="server" Text="����¹���" 
                onclick="Button2_Click"/></span>                                  
                  </td>
             </tr>
        </table>
       
        <KS:KSGV ID="list"  cssclass="CTable" runat="server" Width="99%" AutoGenerateColumns="False" EmptyDataText="����α��̬����!" GridLines="None" OnRowDataBound="list_RowDataBound" PagerType="CustomNumeric" OnRowCommand="list_RowCommand" OnRowCreated="list_RowCreated">
            <Columns>
             <asp:BoundField HeaderText="ID" DataField="ID">
                    <ItemStyle HorizontalAlign="Center" Width="40px" />
                </asp:BoundField>
            <asp:TemplateField HeaderText="����">
                <ItemStyle HorizontalAlign="Center" />
                <ItemTemplate>
              <asp:HiddenField ID="Hidissys" Value='<%# Eval("issys") %>' runat="server" />
              <asp:HiddenField ID="HidID" Value='<%# Eval("id") %>' runat="server" />
              <asp:HiddenField ID="Hidenable" Value='<%# Eval("enable") %>' runat="server" />

                 <asp:CheckBox ID="CkbEnable" runat="server" />
                 </ItemTemplate>
            </asp:TemplateField>  
                
                
            <asp:TemplateField HeaderText="��������">
                <ItemStyle HorizontalAlign="Center" />
                <ItemTemplate>
                  <asp:TextBox CssClass="textbox"  Width="100px" ID="TxtText" Text='<%#Eval("text") %>' runat="server"></asp:TextBox>
                 </ItemTemplate>
            </asp:TemplateField>  
            <asp:TemplateField HeaderText="α��̬������ʽ">
                <ItemStyle HorizontalAlign="Center" />
                <ItemTemplate>
                  <asp:TextBox CssClass="textbox" Width="180px" ID="Txtpattern" Text='<%#Eval("pattern") %>' runat="server"></asp:TextBox>
                 </ItemTemplate>
            </asp:TemplateField>  
            <asp:TemplateField HeaderText="����д�ĵ�ַ">
                <ItemStyle HorizontalAlign="Center" />
                <ItemTemplate>
                  <asp:TextBox CssClass="textbox" Width="180px" ID="Txtpage" Text='<%#Eval("page") %>' runat="server"></asp:TextBox>
                 </ItemTemplate>
            </asp:TemplateField>  
            <asp:TemplateField HeaderText="ǰ̨URL����">
                <ItemStyle HorizontalAlign="Center" />
                <ItemTemplate>
                  <asp:TextBox CssClass="textbox" Width="180px" ID="Txturlrule" Text='<%#Eval("urlrule") %>' runat="server"></asp:TextBox>
                 </ItemTemplate>
            </asp:TemplateField>  
                
                <asp:TemplateField HeaderText="ɾ��">
                <itemstyle horizontalalign="Center" width="25"/>
                <itemtemplate>
                  <asp:LinkButton runat="server" CssClass="delete" id="delete" commandargument=<%#Eval("id") %> commandname="del"></asp:LinkButton>
               </itemtemplate>
             </asp:TemplateField>

           
            </Columns>
           
            <PagerStyle CssClass="Page" HorizontalAlign="Right" />
            <HeaderStyle CssClass="CTitle" />
            <EmptyDataRowStyle CssClass="emptycss" />
      </KS:KSGV>
      
     <br />
     <asp:Panel ID="Panel1" runat="server" Height="30px" Width="739px">
            &nbsp;&nbsp;<asp:Button ID="Button1" CssClass="button" runat="server" Text="��������α��̬����" 
                onclick="Button1_Click" />&nbsp;
            <asp:Button ID="Button2" CssClass="button" runat="server" Text="����¹���" 
                onclick="Button2_Click"/>&nbsp;<br />
      </asp:Panel>
     
     
        <br />
        <script type="text/javascript">
            showtips('<span class="state"><strong>˵����</strong><br /></span>1���������α��̬�����˽⣬��������ý��鲻Ҫ���޸ģ�<br/>2����չ��Ϊ��.aspxʱ�� ��Ҫ������IIS�����ã��Ҽ������ԶԻ��������Ŀ¼����ǩ�������á�������ӡ���ִ���ļ�·��:C:\\WINDOWS\\Microsoft.NET\\Framework\\v2.0.50727\\aspnet_isapi.dll ��չ����.html����ȷ���ļ��Ƿ���ڡ��Ĺ���ȥ����<br/>2����չ��Ϊ��/��ʱ��������չ������IIS6���÷���ͬ�ϣ���չ������Ϊ��.*�� ��IIS7�����÷���Ϊ���������ӳ�䣬���ͨ����ű��ű�ӳ�䣬��ִ���ļ�Ϊ��%windir%\Microsoft.NET\Framework\v2.0.50727\aspnet_isapi.dll����');
		</script>

    </asp:Panel>
    
    <asp:Panel ID="addPanel" runat="server" Width="100%" Visible="false">
        <KS:TopNav ID="TopNav1" runat="server" Text="���α��̬����" />
        <table width="100%" border="0" cellpadding="1" cellspacing="1" class="CTable"> 
          <tr>
            <td class="lefttd" height="30" align="right" style="width: 198px"><b>�������ƣ�</b></td>
            <td class="righttd">
                &nbsp;<asp:TextBox CssClass="textbox" ID="TxtText" runat="server"></asp:TextBox> <font color=#ff0000>*</font>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" Display="Dynamic" runat="server" ControlToValidate="TxtText"
                    ErrorMessage="�������������!"></asp:RequiredFieldValidator></td>
          </tr>    
            <tr>
                <td align="right" class="lefttd" height="30" style="width: 198px">
                    <strong>α��̬������ʽ��</strong></td>
                <td class="righttd">
                     &nbsp;<asp:TextBox CssClass="textbox" ID="TxtPattern" runat="server"></asp:TextBox> <font color=#ff0000>*</font>
                <span class="tips">�磺list/(\d+)[ext]</span><asp:RequiredFieldValidator ID="RequiredFieldValidator2"  Display="Dynamic" runat="server" ControlToValidate="TxtPattern"
                    ErrorMessage="α��̬������ʽ!"></asp:RequiredFieldValidator>
                    </td>
            </tr>
            <tr>
                <td align="right" class="lefttd" height="30" style="width: 198px">
                    <strong>����д�ĵ�ַ��</strong></td>
                <td class="righttd">
                     &nbsp;<asp:TextBox CssClass="textbox" ID="TxtPage" runat="server"></asp:TextBox> <font color=#ff0000>*</font>
                <span class="tips">�磺model/list.aspx?id=$1</span> <asp:RequiredFieldValidator ID="RequiredFieldValidator3"  Display="Dynamic" runat="server" ControlToValidate="TxtPage"
                    ErrorMessage="ʵ�����ӱ��ʽ!"></asp:RequiredFieldValidator>
                    
                    </td>
            </tr>
            <tr>
                <td align="right" class="lefttd" height="30" style="width: 198px">
                    <strong>ǰ̨URL����</strong></td>
                <td class="righttd">
                     &nbsp;<asp:TextBox CssClass="textbox" ID="TxtUrlRule" runat="server"></asp:TextBox> 
                    <span class="tips">�磺list/{$id}[ext]</span>
               </td>
            </tr>
            <tr>
                <td align="right" class="lefttd" height="30" style="width: 198px">
                    <strong>�Ƿ����ã�</strong></td>
                <td class="righttd">
                     &nbsp;<asp:RadioButtonList ID="RdbEnable" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow">
                         <asp:ListItem Value="true" Selected="True">����</asp:ListItem>
                         <asp:ListItem Value="false">������</asp:ListItem>
                           </asp:RadioButtonList>
               </td>
            </tr>
            
        </table>
        <br />
        <KS:Foot ID="Foot1" runat="server" OnSubmit="Foot1_Submit" />
    </asp:Panel>
 
 
</asp:Content>

