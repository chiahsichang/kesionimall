<%@ Page Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.Admin_FormShowCard" Title="��Ƭʽ�鿴���ύ���" CodeBehind="KS.FormShowCard.aspx.cs" %>
<asp:Content ID="Content1" ContentPlaceHolderID="KSContent" Runat="Server">
    <KS:TopNav ID="TopNav1" runat="server" />
    <asp:Repeater ID="List" runat="server">
          <HeaderTemplate>
             <table width="99%" align="center" border="0" cellpadding="1" cellspacing="1" class="CTable"> 
         </HeaderTemplate>
         <ItemTemplate>
                   <tr>
                       <td style="width: 30%" align='right' class="lefttd" height="30">
                                    �û�����
                                </td>
                                <td align="left" class="righttd">
                                     <%# Eval("UserName") %>
                                     <%# Convert.ToInt16(Eval("status"))==0?"<font color=red>δ���</font>":(Convert.ToInt16(Eval("status"))==1?"<font color=green>����</font>":"<font color=#999999>����</font>") %>
                                 </td>
                    </tr>
                     <tr>
                                <td style="width: 30%" align='right'  align='right' class="lefttd" height="30">
                                    �û�IP��
                                </td>
                                <td align="left" class="righttd">
                                 <%# Eval("UserIP") %></td>
                    </tr>
                            
                      <tr>
                                <td style="width: 30%" align='right'  align='right' class="lefttd" height="30">
                                    �ύʱ�䣺
                                </td>
                                <td align="left" class="righttd">
                                  <%# Eval("AddDate") %>
                                </td>
                     </tr>   
                     <%# GetItemList(Convert.ToInt32(Eval("RecordID"))) %>             
                   <tr>
                        <td style="width: 30%" align='right'  align='right' class="lefttd" height="30">
                              <strong>���������</strong>
                        </td>
                        <td align="left" class="righttd">
                              <a href="KS.FormShowCard.aspx?action=del&formid=<%=formid %>&ids=<%# Eval("RecordID") %>" onclick="return(confirm('ȷ��ɾ����'))">ɾ��</a>  
                              | <a href="KS.FormShowCard.aspx?action=status&formid=<%=formid %>&ids=<%# Eval("RecordID") %>&v=1">����</a>  
                              | <a href="KS.FormShowCard.aspx?action=status&formid=<%=formid %>&ids=<%# Eval("RecordID") %>&v=2">����</a>  
                              | <a href="javascript:;" onclick="top.openWin('�ظ�������','Common/KS.FormReply.aspx?formid=<%=formid %>&id=<%# Eval("RecordID") %>',true,800,480)">�ظ�</a>  
                              
                         </td>
                     </tr>   
         </ItemTemplate>
       <FooterTemplate>
               <tr style="display:<%# bool.Parse((List.Items.Count==0).ToString())?"":"none"%>">
                    <td class="lefttd" height="30" style="text-align:center"> û���ύ��¼�� </td>
               </tr>
       </table>
       </FooterTemplate>
    
    </asp:Repeater>
    
    <KS:Page ID="Page1" runat="server" />
</asp:Content>

