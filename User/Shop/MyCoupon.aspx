<%@ Page Language="C#" MasterPageFile="~/User/User.master" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.MyCoupon" Title="Untitled Page" Codebehind="MyCoupon.aspx.cs" %>
<%@ Import Namespace="Kesion.Cache" %>
<%@ Import Namespace="Kesion.Publics" %>
<asp:Content ID="Content1" ContentPlaceHolderID="KSContent" Runat="Server">

<asp:Panel ID="PanList" runat="server">
    <div class="toptips">
     <span style="float:right">�����ڴ˲鿴���������������Ż�ȯ��</span> ���У�<asp:Label ID="Lab_Total_Info" runat="server" Text=""></asp:Label> ���Ż�ȯ
   </div>
    <asp:Repeater ID="Repeater1" runat="server">
    <HeaderTemplate>
         <table id="tablist" width="98%" border="0" align="center" cellpadding="2" cellspacing="1" class="border">
      <tr align="center" class="title">
        	<td>�Ż�ȯ��</td>
        	<td>�Ż�ȯ����</td>
        	<td>��ֵ</td>
        	<td>ʣ����</td>
        	<td>��С�������</td>
        	<td>��ֹʹ������</td>
        	<td>���ֿ۶�</td>
        	<td>ʹ�����</td>
        </tr>
    </HeaderTemplate>
    <ItemTemplate>
      <tr class="tdbg">
          <td class="splittd"><%# Eval("couponnum") %></td>
          <td class="splittd"> 
           <%# Eval("couponname") %>
          </td>
          <td class="splittd" nowrap><%# Math.Round(Convert.ToDecimal(Eval("facevalue")),2)%> <%=MyCache.GetCurrencyUnit%></td>
          <td class="splittd" align="center" nowrap><font color=green><%# Math.Round(Convert.ToDecimal(Eval("availablemoney")), 2)%> <%=MyCache.GetCurrencyUnit%></font></td>
          <td class="splittd" align="center" nowrap><%# Math.Round(Convert.ToDecimal(Eval("minamount")), 2)%> <%=MyCache.GetCurrencyUnit%></td>
          <td class="splittd" align="center" nowrap><%# Convert.ToDateTime(Eval("enddate")).ToShortDateString() %> </td>
          <td class="splittd" align="center"><%# Utils.StrToInt(Eval("maxdiscount")) == 0 ? Math.Round(Convert.ToDecimal(Eval("facevalue")), 2).ToString()+MyCache.GetCurrencyUnit : "�������ܶ��" + Eval("maxdiscount") + "%"%> </td>
          <td class="splittd">
          <%# Convert.ToString(Eval("useflag")) == "1" ? (Math.Round(Convert.ToDecimal(Eval("availablemoney")), 2) > 0 ? "��ʹ�ã�δ����" : "������")+("<a style=\'color:blue\' href='javascript:;' onclick=\"KesionJS.Tips('�Ż�ȯʹ�����','<div class=tips>" + Eval("note") + "</div>',500,200,null);\" >�����飩</a>") : "<div style='text-align:center'><font color=#999999>δʹ��</font></div>"%>
          
          
          </td>

      </tr>  

     </ItemTemplate>
     <FooterTemplate>
         <tr class="tdbg" style="display:<%# bool.Parse((Repeater1.Items.Count==0).ToString())?"":"none"%>">
                <td class="splittd" style="text-align:center" colspan="10">
                  û�п��õ��Ż�ȯ��
                </td>
           </tr> 
      </table>
     </FooterTemplate>
    </asp:Repeater>
    
   <br />
    
     <KS:Page ID="Page1" runat="server" />
     
   <br />
   
   
   
   <script>
       function check() {
           if ($("#<%=this.TxtCouponNum.ClientID %>").val() == '') {
               $.dialog.alert('�������Ż�ȯ��!', function() {
                   $("#<%=this.TxtCouponNum.ClientID %>").focus();
               });
           return false;
       }
       return true;
       }
   </script>
    <table width="98%" align="center" border="0" cellpadding="1" cellspacing="1" class="border"> 
    <tr class="title1">
     <td colspan=5>����Ż�ȯ</td>
    </tr>

            <tr class="tdbg">
                <td class="lefttd" height="30">�Ż�ȯ��: </td>
                <td class="righttd">
                    <asp:TextBox CssClass="textbox" ID="TxtCouponNum" runat="server"></asp:TextBox>
                     <span style="color:Red">*</span>
                     <asp:Button ID="BtnAddCoupon" OnClientClick="return(check());" CssClass="button" runat="server" Text="ȷ�����" 
                        onclick="BtnAddCoupon_Click" />
                </td>
            
            </tr>
      </table>
   
</asp:Panel>


</asp:Content>