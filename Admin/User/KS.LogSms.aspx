<%@ Page Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.Admin_LogSms"  Title="�鿴ϵͳ��־" Codebehind="KS.LogSms.aspx.cs" %>
<%@ Import Namespace="Kesion.BLL" %>
<asp:Content ID="Content1" ContentPlaceHolderID="KSContent" Runat="Server">

    <asp:Panel ID="Panel1" runat="server">
        <div id="manage_top" class="menu_top_fixed">
          <ul>
            <li id='p3'><asp:LinkButton ID="delall" runat="server" OnClick="LinkButton1_Click" OnClientClick="return(confirm('�˲��������棬ȷ��ɾ��ȫ�����ŷ��ͼ�¼��?'))"><b></b>ɾ��ȫ��</asp:LinkButton></li>
            <li id='p3'><asp:LinkButton ID="LinkButton2" runat="server" OnClientClick="return(confirm('�˲��������棬ȷ��ɾ��ѡ�еĶ��ŷ��ͼ�¼��?'))" OnClick="Button2_Click"><b></b>ɾ��ѡ��</asp:LinkButton></li>
            <li id='p7'><asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click1"><b></b>������Excel</asp:LinkButton></li>
            <li id='p1'><asp:LinkButton ID="LinkButton3" runat="server" OnClick="LinkButton3_Click"><b></b>�����ֻ�����</asp:LinkButton></li>
          </ul>
        </div>     
         <div class="menu_top_fixed_height"></div>  
        <KS:KSGV ID="LogListView"  cssclass="CTable" runat="server" AutoGenerateColumns="False" EmptyDataText="�����ֻ�����Ϣ���ͼ�¼��"
            OnRowDataBound="LogListView_RowDataBound" Width="100%" GridLines="None"  DataKeyNames="id">
            <Columns>
                <asp:TemplateField HeaderText="<input type='checkbox' name='chkall' id='chkall' onclick='CheckAll(this.form);'/>">
                <ItemStyle HorizontalAlign="Center"  Width="30"/>
                <ItemTemplate>
                <input type="checkbox"  name="ids" value="<%#Eval("id") %>" />
                </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="�û�">
                <itemstyle horizontalalign="Center" />
                <itemtemplate>
                   <%# string.IsNullOrEmpty(Convert.ToString(Eval("username")))?"-":Eval("username") %>
                </itemtemplate>
            </asp:TemplateField>
                <asp:BoundField DataField="UserIP" HeaderText="����IP">
                 <ItemStyle Width="100px" />
                </asp:BoundField>
                <asp:BoundField DataField="adddate" HeaderText="����ʱ��">
                <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="mobile" HeaderText="�����ֻ�">
                <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                 <asp:TemplateField HeaderText="״̬">
                <itemstyle horizontalalign="center" Height="30px"/>
                <itemtemplate>
                   <%# Eval("IsSuccess").ToString().Equals("1")?"<span style='color:green'>�ɹ�</span>":"<span style='color:red'>ʧ��</span>" %>
                </itemtemplate>
            </asp:TemplateField>
             <asp:TemplateField HeaderText="��������">
                <itemstyle horizontalalign="Left" Height="30px"/>
                <itemtemplate>
                    <span class="tips"><%# Eval("content") %></span>
                </itemtemplate>
            </asp:TemplateField>
                 <asp:TemplateField HeaderText="������Ϣ">
                <itemstyle horizontalalign="Left"/>
                <itemtemplate>
                    <span class="tips"><%# Kesion.Publics.Utils.ClearHtml(Convert.ToString(Eval("remark"))) %></span>
                </itemtemplate>
            </asp:TemplateField>
             
            </Columns>
            <HeaderStyle CssClass="CTitle" />
            <EmptyDataRowStyle CssClass="emptycss" />
           
        </KS:KSGV>


     <div style="border:1px dashed #cccccc; background-color:#f0f9fe; margin-top:10px;padding:10px; text-align: left; font-size: 12px;">
     <strong>�ر����ѣ�</strong> ������ż�¼̫�࣬Ӱ����ϵͳ���ܣ�����ɾ��һ��ʱ���ǰ�ļ�¼�Լӿ��ٶȡ�
     <div>
     <strong>ɾ����Χ��</strong><asp:RadioButtonList ID="RdbDelType" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow">
      <asp:ListItem Value="1">10��ǰ</asp:ListItem>
      <asp:ListItem Value="2">1����ǰ</asp:ListItem>
      <asp:ListItem Value="3">2����ǰ</asp:ListItem>
      <asp:ListItem Value="4">3����ǰ</asp:ListItem>
      <asp:ListItem Value="5">6����ǰ</asp:ListItem>
      <asp:ListItem Value="6" Selected="True">1��ǰ</asp:ListItem>
         </asp:RadioButtonList>
         <asp:Button ID="BtnDel" runat="server" Text="ִ��ɾ��"  CssClass="button" OnClick="BtnDel_Click" /></div>
     </div>

     <KS:Page ID="Page1" runat="server" />
     </asp:Panel>

    <asp:Panel ID="Panel2" runat="server" Visible="false">

         <div id="manage_top" class="toptitle menu_top_fixed"><ul>
             <li id='p9'><b></b><a href='KS.LogSms.aspx'>����</a></li> �����ֻ�����Ϣ</div>
        <div class="menu_top_fixed_height"></div> 

     <table width="100%" border="0" cellpadding="1" cellspacing="1" class="CTable"> 
          <tr>
            <td class="lefttd" height="30" align="right" style="width: 146px"><b>�ռ���ѡ��</b></td>
            <td class="righttd">
                <input type="radio" name="optype" onclick="jQuery('#grouparea').hide();" value="1" checked />���л�Ա(<span style="color:red"><%=DataFactory.GetOnlyValue("select count(1) From KS_User") %></span>λ)<br />
                <input type="radio" name="optype" onclick="jQuery('#grouparea').show();" value="2" />ָ����Ա��
                <br />
                <div id="grouparea" style="display:none">
                <%=BaseFun.GetUserGroup_CheckBox("groupid",4,"0") %>
                </div>
                <input type="radio" name="optype" onclick="jQuery('#grouparea').hide();" value="3" />ָ���ֻ�����<asp:TextBox ID="ToMobile" runat="server"
                    Width="246px" CssClass="textbox"></asp:TextBox>����û���������<font color="#0000ff">Ӣ�ĵĶ���</font>�ָ�</td>
          </tr>

         <tr>
             <td align="right" class="lefttd" height="30" style="width: 146px">
                 <strong>�������ݣ�</strong>

                 <div class="tips">
                 <strong>���ñ�ǩ��</strong><br />
                 {$UserName} -�û���<br />
                 {$RealName} -����<br />
                 {$Sex} -��������Ůʿ<br />
                 {$SiteName} -��վ����<br />
                 {$SendTime} -����ʱ��<br />
                 {$SendDate} -��������<br />
                 </div>
             </td>
             <td class="righttd">
                 <asp:TextBox ID="Content" TextMode="multiLine" style="width:95%;height:250px;" runat="server">����{$UserName}!  ������֣�{$SiteName}��!
                 </asp:TextBox>
                 <br />
                 <span class="tips">TIPS:���鲻����66���ַ�,��ȷ�����Ķ����˺������㣡����</span>
                 

             </td>
         </tr>
         
        </table>
    <br />
    <KS:Foot ID="Foot1" runat="server" SubmitButtonText="��ʼ����(0)" OnSubmit="Foot1_Submit" />
    </asp:Panel>
 


</asp:Content>
