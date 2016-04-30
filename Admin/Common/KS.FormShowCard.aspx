<%@ Page Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.Admin_FormShowCard" Title="卡片式查看表单提交结果" CodeBehind="KS.FormShowCard.aspx.cs" %>
<asp:Content ID="Content1" ContentPlaceHolderID="KSContent" Runat="Server">
    <KS:TopNav ID="TopNav1" runat="server" />
    <asp:Repeater ID="List" runat="server">
          <HeaderTemplate>
             <table width="99%" align="center" border="0" cellpadding="1" cellspacing="1" class="CTable"> 
         </HeaderTemplate>
         <ItemTemplate>
                   <tr>
                       <td style="width: 30%" align='right' class="lefttd" height="30">
                                    用户名：
                                </td>
                                <td align="left" class="righttd">
                                     <%# Eval("UserName") %>
                                     <%# Convert.ToInt16(Eval("status"))==0?"<font color=red>未标记</font>":(Convert.ToInt16(Eval("status"))==1?"<font color=green>采纳</font>":"<font color=#999999>作废</font>") %>
                                 </td>
                    </tr>
                     <tr>
                                <td style="width: 30%" align='right'  align='right' class="lefttd" height="30">
                                    用户IP：
                                </td>
                                <td align="left" class="righttd">
                                 <%# Eval("UserIP") %></td>
                    </tr>
                            
                      <tr>
                                <td style="width: 30%" align='right'  align='right' class="lefttd" height="30">
                                    提交时间：
                                </td>
                                <td align="left" class="righttd">
                                  <%# Eval("AddDate") %>
                                </td>
                     </tr>   
                     <%# GetItemList(Convert.ToInt32(Eval("RecordID"))) %>             
                   <tr>
                        <td style="width: 30%" align='right'  align='right' class="lefttd" height="30">
                              <strong>管理操作：</strong>
                        </td>
                        <td align="left" class="righttd">
                              <a href="KS.FormShowCard.aspx?action=del&formid=<%=formid %>&ids=<%# Eval("RecordID") %>" onclick="return(confirm('确定删除吗？'))">删除</a>  
                              | <a href="KS.FormShowCard.aspx?action=status&formid=<%=formid %>&ids=<%# Eval("RecordID") %>&v=1">采纳</a>  
                              | <a href="KS.FormShowCard.aspx?action=status&formid=<%=formid %>&ids=<%# Eval("RecordID") %>&v=2">作废</a>  
                              | <a href="javascript:;" onclick="top.openWin('回复表单数据','Common/KS.FormReply.aspx?formid=<%=formid %>&id=<%# Eval("RecordID") %>',true,800,480)">回复</a>  
                              
                         </td>
                     </tr>   
         </ItemTemplate>
       <FooterTemplate>
               <tr style="display:<%# bool.Parse((List.Items.Count==0).ToString())?"":"none"%>">
                    <td class="lefttd" height="30" style="text-align:center"> 没有提交记录！ </td>
               </tr>
       </table>
       </FooterTemplate>
    
    </asp:Repeater>
    
    <KS:Page ID="Page1" runat="server" />
</asp:Content>

