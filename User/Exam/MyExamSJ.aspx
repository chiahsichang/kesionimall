<%@ Page Language="C#" MasterPageFile="~/User/User.master" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.MyExamSJ" Title="Untitled Page" Codebehind="MyExamSJ.aspx.cs" %>
<%@ Import Namespace="Kesion.Cache" %>
<%@ Import Namespace="Kesion.Publics" %>
<asp:Content ID="Content1" ContentPlaceHolderID="KSContent" Runat="Server">

<asp:Panel ID="PanList" runat="server">
    <div class="toptips">
     <span style="float:right" class="tips">��ѡ������Ȩ���Ծ�����</span> ���У�<asp:Label ID="Lab_Total_Info" runat="server" Text=""></asp:Label> �ݿ���
   </div>
    <asp:Repeater ID="Repeater1" runat="server">
    <HeaderTemplate>
         <table id="tablist" width="98%" border="0" align="center" cellpadding="2" cellspacing="1" class="border">
    </HeaderTemplate>
    <ItemTemplate>
      <tr class="tdbg">
          <td class="splittd" align="center" width="180" height="180">
           <div style="width:100px;padding:10px;background:#efefef"><img alt="<%# Eval("Title") %>" src="../../<%=MyCache.GetSJCacheConfig(1) %>/images/shijuan.jpg" width="100"/></div>
          </td>

          <td class="splittd" style="line-height:25px">
           <span style='font-size:18px;font-weight:bold'><%# Container.ItemIndex + 1 + (CurrPage - 1) * PageSize%>��<%# Eval("Title") %></span>
           <span class="tips"><br />����ʱ�䣺<%# Convert.ToString(Eval("OpenTimeLimit"))=="1"?Eval("TimeLimitBegin")+"��"+Eval("TimeLimitEnd"):"������" %>
          <br />�Ծ��ܷ֣�<span style='color:brown;font-weight:bold'><%# Eval("score")%></span> ��
          ʱ�����ƣ�<%# Eval("KSSJ")%>����
          <br />����Ȩ�ޣ�
          <%# Authorization(Convert.ToInt16(Eval("AuthorizationType")),Utils.StrToFloat(Eval("money")),Convert.ToString(Eval("groupids")))%>
           </span>
          </td>

          <td class="splittd" align="center">
          
           <a target="_blank" href='../../<%=MyCache.GetSJCacheConfig(1) %>/Go.aspx?id=<%#Eval("id") %>'>
           <img src="../../<%=MyCache.GetSJCacheConfig(1) %>/images/entersj.gif" title="���뿼��"  />
           </a>
           <br />
<a  target="_blank" href="../../<%=MyCache.GetSJCacheConfig(1) %>/Reviews.aspx?id=<%# Eval("id") %>" class="tips">�������ĵ�(<%# Eval("CmtNum") %>)</a>
           </td>

      </tr>  

     </ItemTemplate>
     <FooterTemplate>
         <tr class="tdbg" style="display:<%# bool.Parse((Repeater1.Items.Count==0).ToString())?"":"none"%>">
                <td class="splittd" style="text-align:center" colspan="10">
                  û��δ������Ծ�
                </td>
           </tr> 
      </table>
     </FooterTemplate>
    </asp:Repeater>
    
    
   <br />
    
     <KS:Page ID="Page1" runat="server" />
</asp:Panel>


</asp:Content>