<%@ Page Language="C#" ValidateRequest="false" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.Admin_Announce" Title="�������" Codebehind="KS.Announce.aspx.cs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="KSContent" Runat="Server">
      
      <asp:Panel runat="server" ID="list" Width="100%">  
              <div id="manage_top" class="menu_top_fixed">
              <ul>
           <li id='p1'><asp:LinkButton ID="delall" runat="server" OnClick="LinkButton1_Click"><b></b>��ӹ���</asp:LinkButton></li>
           <li id='p4'><asp:LinkButton ID="LinkButton2" runat="server" OnClick="LinkButton2_Click"><b></b>�༭����</asp:LinkButton></li>
           <li id='p3'><asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click1"><b></b>ɾ������</asp:LinkButton></li></ul>
        </div>  
        <div class="menu_top_fixed_height"></div> 
        <KS:KSGV ID="AnnounceListView" cssclass="CTable" runat="server" AutoGenerateColumns="False" EmptyDataText="��������κεĹ��棡"
            OnRowDataBound="LogListView_RowDataBound" Width="99%" GridLines="None"  DataKeyNames="id" OnRowCommand="AnnounceListView_RowCommand" OnRowCreated="AnnounceListView_RowCreated">
            <Columns>
                <asp:TemplateField HeaderText="ѡ��">
                <ItemStyle HorizontalAlign="Center"  Width="40px"/>
                <ItemTemplate>
                <input type="checkbox"  name="ids" id="ids" value="<%#Eval("id") %>" />
                </ItemTemplate>
                </asp:TemplateField>

                 <asp:TemplateField HeaderText="�������">
                 <ItemStyle Width="300px" />
                 <ItemTemplate>
                    <a title="Ԥ��" href='<%# Kesion.HtmlTags.BasicField.GetAnnounceUrl(Convert.ToInt32(Eval("id"))) %>' target="_blank"><%# Eval("Title") %></a>
                </ItemTemplate>
                 </asp:TemplateField>
                
                <asp:BoundField DataField="channelid" HeaderText="����ģ��" >
                    <itemstyle horizontalalign="Center" />
                </asp:BoundField>
                 <asp:BoundField DataField="author" HeaderText="������">
                 <ItemStyle HorizontalAlign="Center" Width="100px" />
                </asp:BoundField>
                <asp:TemplateField HeaderText="����ʱ��">
                <ItemStyle  HorizontalAlign="Center" Width="120px" />
                    <ItemTemplate>
                    <span class="tips"><%# Eval("adddate") %></span>
                 </ItemTemplate>
                </asp:TemplateField>

               
                <asp:TemplateField HeaderText="����">
                <ItemStyle  HorizontalAlign="Center" Width="50px" />
                    <ItemTemplate>
                   <a href="?action=setnew&id=<%#Eval("ID")%>" <%# Convert.ToString(Eval("Newest"))=="0"?"class='no' title='��'":"class='ok' title='��'" %>></a>
                 </ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="�޸�">
              <itemstyle width="30px" horizontalalign="Center"/>
              <itemtemplate>
                    <asp:LinkButton ToolTip="�޸�" CssClass="edit" runat="server" ID="edit" CommandArgument=<%#Eval("id") %>  CommandName="modify" ></asp:LinkButton>
              </itemtemplate>
            </asp:TemplateField>

                <asp:TemplateField HeaderText="ɾ��">
                <ItemStyle  HorizontalAlign="Center" Width="30px" />
                    <ItemTemplate>
                    <asp:LinkButton CssClass="delete" ToolTip="ɾ��" runat="server" ID="delete" CommandArgument=<%#Eval("id") %>  CommandName="del" ></asp:LinkButton>
                     </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            <HeaderStyle CssClass="CTitle" />
            <PagerStyle CssClass="Page" HorizontalAlign="Right" />
            <EmptyDataRowStyle CssClass="emptycss" />
        </KS:KSGV>
        <asp:Panel ID="Panel1" runat="server" Height="30px" Width="741px">
            &nbsp;&nbsp;<input type="checkbox" name="chkall" id="chkall" onclick="CheckAll(this.form);"/><label for="chkall">ȫ��ѡ��</label>
            
            <input type="button" value="ɾ��ѡ�й���" onmouseover="this.className='button_on';" onmouseout="this.className='button';" class="button" onclick="if (GetIDS('del')){this.form.action='?action=del';this.form.submit()}" />
            </asp:Panel>
            
             <KS:Page ID="Page1" runat="server" />
            
</asp:Panel> 
      <asp:Panel runat="server" ID="add" Width="100%" Visible="false">  
          <KS:TopNav ID="TopNav1" runat="server" />
        <table width="100%" border="0" cellpadding="1" cellspacing="1" class="CTable"> 
          <tr>
            <td class="lefttd" height="30" align="right" style="width: 151px"><b>������⣺</b></td>
            <td class="righttd">
                &nbsp;<asp:TextBox CssClass="textbox" ID="TxtTitle" Width="500px" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator Display="Dynamic" ID="RequiredFieldValidator1" runat="server" ControlToValidate="TxtTitle"
                    ErrorMessage="����д�������!"></asp:RequiredFieldValidator>
                    
                     <asp:CheckBox ID="Newest" runat="server" />��Ϊ���±�־
                    </td>
          </tr>
            <tr>
                <td align="right" class="lefttd" height="30" style="width: 151px">
                <strong>��������ϵͳ��</strong>
                </td>
            <td class="righttd">
                &nbsp;<asp:DropDownList ID="ChannelID" runat="server">
            </asp:DropDownList></td>
           </tr>
            <tr>
                <td align="right" class="lefttd" height="30" style="width: 151px">
                <strong>��������������</strong>
                </td>
            <td class="righttd">
                &nbsp;<script src="../../plus/area.aspx?pid=<%=provinceId %>&cityid=<%=cityId %>&countyid=<%=countyId %>"></script></td>
           </tr>
           
           
            <tr>
                <td align="right" class="lefttd" height="30" style="width: 151px">
                    <strong>�������ݣ�</strong></td>
                <td class="righttd">
                    <asp:TextBox ID="Content" TextMode="multiLine" style="width:96%;height:300px;" runat="server"></asp:TextBox>
                  
                      <% Kesion.APPCode.EditorAPI.EchoEditor("editor",this.Content.ClientID,"Common");%>
                </td>
            </tr>
             <tr>
                <td align="right" class="lefttd" height="30" style="width: 151px">
                    <strong>���淢��ʱ�䣺</strong></td>
                <td class="righttd"><script> isHour = 1;</script>
                    &nbsp;<asp:TextBox CssClass="textbox" ID="AddDate" Width="300px" onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'});" runat="server"></asp:TextBox>
                    <a href="#" onClick="WdatePicker({el:'<%=this.AddDate.ClientID %>',dateFmt:'yyyy-MM-dd HH:mm:ss'});return false;"><img src="../../sysimg/default/date.gif" border="0" align="absmiddle" title="ѡ������"></a>
                   &nbsp;&nbsp;<strong>�����ߣ�</strong><asp:TextBox CssClass="textbox" ID="Author" runat="server"></asp:TextBox></td>
            </tr>
           
          </table>
          <br />
              <KS:Foot ID="CopyRight1" runat="server" SubmitButtonText="ȷ������(O)" OnSubmit="CopyRight1_Submit"/>
          
          </asp:Panel>
</asp:Content>