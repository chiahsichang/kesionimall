<%@ Page Language="C#" MasterPageFile="~/User/User.master" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.User_FeePackages" Title="���߹����շ��ײͰ�" Codebehind="FeePackages.aspx.cs" %>
<%@ Import Namespace="Kesion.Cache" %>
<%@ Import Namespace="Kesion.BLL" %>
<%@ Import Namespace="Kesion.Publics" %>
<asp:Content ID="Content1" ContentPlaceHolderID="KSContent" Runat="Server">

<asp:Panel ID="PnlStep1" runat="server" Width="100%">


     <div class="tabs" style="margin-left:10px">	
		<ul>             
           <li><a href="<%=MyCache.GetCacheConfig(0) %>user/payonline.aspx">���߳�ֵ</a></li>
           <li><a href="<%=MyCache.GetCacheConfig(0) %>user/basic/UserCard.aspx">��ֵ����ֵ</a></li>
           <li class='puton'><a href="<%=MyCache.GetCacheConfig(0) %>user/basic/FeePackages.aspx">�����ײͰ�</a></li>
		</ul>
	</div>


     <asp:Panel ID="page1Panel" runat="server" Visible="false">
     <KS:Page ID="Page2" runat="server" />
     </asp:Panel>
   
    <asp:Repeater ID="Repeater1" runat="server">
    <HeaderTemplate>
         <table id="tablist" width="98%" border="0" align="center" cellpadding="2" cellspacing="1" class="border">
      <tr class="title">
        	<td colspan="10">ѡ��Ҫ������շ��ײͷ����</td>
        </tr>
     
    </HeaderTemplate>
    <ItemTemplate>
      <tr class="tdbg">
          <td class="splittd"> 
              <label><input<%# Container.ItemIndex==0?" checked":""%> type="radio" name="packid" value='<%# Eval("id") %>' /><%# Eval("Title") %></label>
              ��ԭ�ۣ�<span style='font-size:14px;text-decoration:line-through;'><%=MyCache.GetCurrencySymbol %><%# Math.Round(Utils.StrToFloat(Eval("price")),2) %> <%=MyCache.GetCurrencyUnit %></span> &nbsp;&nbsp;�ۿۣ�<%# GetDiscount(Utils.StrToFloat(Eval("discount"))) %>&nbsp;&nbsp;ʵ����<span style='color:green;font-weight:bold;font-size:14px'><%=MyCache.GetCurrencySymbol %><%# Math.Round(Convert.ToDouble(Eval("price"))*Convert.ToDouble(Eval("discount")),2) %></span> <%=MyCache.GetCurrencyUnit %>��
             <div class="tips"><%# Eval("Descript") %></div>
          </td>

      </tr>  

     </ItemTemplate>
     <FooterTemplate>
         <tr class="tdbg" style="display:<%# bool.Parse((Repeater1.Items.Count==0).ToString())?"":"none"%>">
                <td class="splittd" style="text-align:center" colspan="10">
                  û�пɹ�������շ��ײͣ�
                </td>
           </tr> 
      </table>
     </FooterTemplate>
    </asp:Repeater>
    
    <div style="padding-left:30px;margin-top:5px;">
   <input type="hidden" name="action" id="action" value="" />
    <input type="button"  class="button" value="ȷ�������ײ�" onclick="check();"/>
    </div>
   <br />
   <br />
   <br />
     <asp:Panel ID="pagePanel" runat="server" Visible="false">
     <KS:Page ID="Page1" runat="server" />
     </asp:Panel>
     <script>
         function check() {
             jQuery("#action").val("dobuy");
             KesionJS.Confirm("�˲��������棬ȷ������ѡ�е��ײ���", "jQuery('#aspnetForm').submit();", "");
             return false;
         }
     </script>
     


    <style>
    .noexpire{color:Green;}
    .expire{color:brown;}
    </style>
   <table  cellspacing="1" cellpadding="3" class="border" width="98%" align="center" border="0">
	 <tr class="title">
         <td>�ѹ�����ײͰ�</td>
     </tr>
     <tr class="tdbg">
         <td class="splittd">
         
          <asp:Repeater ID="MyPackRepeater" runat="server">
    <HeaderTemplate>
        <table id="tablist" width="98%" border="0" align="center" cellpadding="2" cellspacing="1" class="border">
      <tr align="center" class="title">
        	<td width="40" align="center">���</td>
        	<td align="center" style="width:200px">�ײ�����</td>
        	<td align="center">����ʱ��</td>
            <td align="center"> ������ </td>
            <td align="center"> ӵ��Ȩ�� </td>

        </tr>
    </HeaderTemplate>
    <ItemTemplate>
      <tr class="tdbg" style="cursor:pointer;" onclick="jQuery('#s<%# Container.ItemIndex+1 %>').toggle();">
          <td class="splittd" style="text-align:center"> 
             <%# Container.ItemIndex+1 %>
          </td>
          <td class="splittd"> 
             <%# Eval("title") %>
          </td>
          <td class="splittd" nowrap style="text-align:center;color:#999;"> 
             <%# Eval("AddDate") %>
          </td>
          <td class="splittd"> 
             <%# GetExpireDate(Convert.ToDateTime(Eval("PackBeginDate")),Convert.ToInt16(Eval("packdays"))) %>
          </td>
          <td class="splittd">
             <%# GetPurview(Convert.ToUInt16(Eval("limit")),Convert.ToInt16(Eval("ContentTF")),Convert.ToInt16(Eval("ExamTF")),Convert.ToString(Eval("ContentClassIDs")),Convert.ToString(Eval("ExamClassIDs"))) %>
          </td>

      </tr>  
      <tbody id="s<%# Container.ItemIndex+1 %>" style="display:none">
      <tr class="tdbg">
       <td class="splittd" style="text-align:center">&nbsp;</td>
       <td class="splittd tips" colspan="4">
         <div class="tips"><strong>���ܣ�</strong> <%# Eval("Descript") %></div>
       </td>
      
      </tr>
</tbody>
     </ItemTemplate>
     <FooterTemplate>
         <tr class="tdbg" style="display:<%# bool.Parse((MyPackRepeater.Items.Count==0).ToString())?"":"none"%>">
                <td class="splittd" style="text-align:center" colspan="10">
                  ��û�й����κ��շ��ײͣ�
                </td>
           </tr> 
      </table>
     </FooterTemplate>
    </asp:Repeater>
         
         </td>
     </tr>
    </table>
    
    
</asp:Panel>



</asp:Content>

