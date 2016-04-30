<%@ Page Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.Admin.Shop.Admin_ShopOrder" Title="�̳Ƕ�������" Codebehind="KS.ShopOrder.aspx.cs" %>
<%@ Import Namespace="Kesion.Cache" %>
<%@ Import Namespace="Kesion.Publics" %>
<%@ Import Namespace="Kesion.APPCode" %>
<asp:Content ID="Content1" ContentPlaceHolderID="KSContent" Runat="Server">
    <asp:Panel ID="listPanel" runat="server" Width="100%">
      <div id="manage_top" class="menu_top_fixed">
           <ul>
               <li id='p3'><a href="javascript:;" onclick="if (GetIDS('del')){ $('#aspnetForm').attr('action','KS.ShopOrder.aspx?action=del');$('#aspnetForm').submit()}"><b></b>����ɾ������</a></li>
               <li id="p18"><asp:LinkButton ID="ExcelBtn" runat="server" Text="��ҳ����Excel" onclick="BtnSubmit_Click"><b></b>��ҳ����Excel</asp:LinkButton></li>
               <li id="p18"><asp:LinkButton ID="WordBtn" runat="server" Text="��ҳ����Word" onclick="Button3_Click"><b></b>��ҳ����Word</asp:LinkButton></li>
               <li id="p18"><a href="KS.ShopOrder.aspx?action=Exportexcel"><b></b>����������Excel</a></li>

           </ul>
      </div>    
   <div class="menu_top_fixed_height"></div>      


        <div class="message" style="margin-top:-5px;">

             <asp:DropDownList Visible="false" ID="DrpSearch" runat="server" AutoPostBack="true" OnSelectedIndexChanged="DrpSearch_SelectedIndexChanged">
         <asp:ListItem Value="0">���ж���</asp:ListItem>
         <asp:ListItem Value="1">24Сʱ���¶���</asp:ListItem>
         <asp:ListItem Value="2">���10�����¶���</asp:ListItem>
         <asp:ListItem Value="3">���һ���ڶ���</asp:ListItem>
         <asp:ListItem Value="4">�Ź�����</asp:ListItem>
         <asp:ListItem Value="5">δ����Ķ���</asp:ListItem>
         <asp:ListItem Value="6">δ����Ķ���</asp:ListItem>
         <asp:ListItem Value="7">δ�ͻ��Ķ���</asp:ListItem>
         <asp:ListItem Value="8">δǩ�յĶ���</asp:ListItem>
         <asp:ListItem Value="9">δ����Ʊ�Ķ���</asp:ListItem>
         <asp:ListItem Value="10">δ�������Ч����</asp:ListItem>
         <asp:ListItem Value="11">�ѽ���Ķ���</asp:ListItem>
         <asp:ListItem Value="12">��Ҫ��Ʊ�Ķ���</asp:ListItem>
         <asp:ListItem Value="13">����Ҫ��Ʊ�Ķ���</asp:ListItem>
         <asp:ListItem Value="14">���ϵĶ���</asp:ListItem>
        </asp:DropDownList>
        <strong>����=></strong>
         <asp:DropDownList ID="DrpIsBusinessConfirm" runat="server">
             <asp:ListItem Value="-1">�̼�ȷ��</asp:ListItem>
             <asp:ListItem Value="1">��ȷ������</asp:ListItem>
             <asp:ListItem Value="0">δȷ������</asp:ListItem>
         </asp:DropDownList>
          ʱ��Σ���<asp:TextBox onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'});" ID="TxtBeginDate" runat="server" CssClass="textbox Wdate" Width="120px"></asp:TextBox>��
          <asp:TextBox onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'});" ID="TxtEndDate" runat="server" CssClass="textbox Wdate" Width="120px"></asp:TextBox>
    <asp:DropDownList ID="DrpSearchType" runat="server">
     <asp:ListItem Value="1">�������</asp:ListItem>
     <asp:ListItem Value="2">�ջ���</asp:ListItem>
     <asp:ListItem Value="3">�û�����</asp:ListItem>
     <asp:ListItem Value="4">��ϵ��ַ</asp:ListItem>
     <asp:ListItem Value="5">��ϵ�绰</asp:ListItem>
    </asp:DropDownList><asp:TextBox ID="TxtKey"  CssClass="textbox"  runat="server" Width="100px"></asp:TextBox> 
    <span style="cursor:pointer" onclick="showA();">����������</span>
    <span id="showArea"<%=(provinceId!=0||CityId!=0|| CountyId!=0)?"":" style='display:none;'" %>><script src="../../plus/area.aspx?pid=<%=provinceId %>&cityid=<%=CityId %>&countyId=<%=CountyId %>" id="area"></script></span>
     <asp:Button ID="Button1" runat="server" Text=" �� �� " CssClass="button" OnClick="Button1_Click" />
     <script>
         function showA() {
             $("#showArea").toggle();
         }
     </script>
         </div>

<div class="tabs_header">
    <ul class="tabs">
    <li<%=KSCMS.S("showType")==""?" class='active'":string.Empty %>><a href="KS.ShopOrder.aspx"><span>���ж���</span></a></li>
    <li<%=KSCMS.S("showType")=="1"?" class='active'":string.Empty %>><a href="KS.ShopOrder.aspx?showType=1"><span style='color:Red;font-weight:bold'>24Сʱ���¶���</span></a></li>
    <li<%=KSCMS.S("showType")=="2"?" class='active'":string.Empty %>><a href="KS.ShopOrder.aspx?showType=2"><span>�Ѹ���δ����</span></a></li>
    <li<%=KSCMS.S("showType")=="3"?" class='active'":string.Empty %>><a href="KS.ShopOrder.aspx?showType=3"><span>�Ѹ���δ��Ʊ</span></a></li>
    <li<%=KSCMS.S("showType")=="4"?" class='active'":string.Empty %>><a href="KS.ShopOrder.aspx?showType=4"><span>������δ����</span></a></li>
    <li<%=KSCMS.S("showType")=="5"?" class='active'":string.Empty %>><a href="KS.ShopOrder.aspx?showType=5"><span>�ѽ���</span></a></li>
    <li<%=KSCMS.S("showType")=="6"?" class='active'":string.Empty %>><a href="KS.ShopOrder.aspx?showType=6"><span>�Ź�</span></a></li>
    <li<%=KSCMS.S("showType")=="8"?" class='active'":string.Empty %>><a href="KS.ShopOrder.aspx?showType=8"><span>���ֶһ�</span></a></li>
    <li<%=KSCMS.S("showType")=="7"?" class='active'":string.Empty %>><a href="KS.ShopOrder.aspx?showType=7"><span>����</span></a></li>
    <%if (MyCache.GetShopCommonConfig(41).Equals("1")){ %>
    <li<%=KSCMS.S("showType")=="100"?" class='active'":string.Empty %>><a href="KS.ShopOrder.aspx?showType=100"><span>�̼Ҷ���</span></a></li>
    <li<%=KSCMS.S("showType")=="101"?" class='active'":string.Empty %>><a href="KS.ShopOrder.aspx?showType=101"><span>�̼���ȷ��</span></a></li>
    <%} %>
    </ul>
</div>

<asp:PlaceHolder ID="PlaceHolder2" runat="server">
<div class="border">
<style>
.border{border:0px;}
.border .wait,.border .wff,.border .wfk,.border .wxf{color:red;}
.border .yff,.border .yfq,.border .yqs,.border .confirm{color:green;}
.border .wx{color:#999;}
.border .jq{color:#888;}
.border .tf{color:brown;}
.border .tk{color:Purple}
.border .ddff{color:brown;}
.border .list_link{line-height:22px;border-left:1px solid #efefef;padding:5px;}
.border .img img{border:1px solid #ccc;padding:1px;}
</style>


  <asp:Repeater ID="Repeater1" runat="server"  onitemdatabound="Repeater1_ItemDataBound" >
          <HeaderTemplate>
          <table width="99%" class="CTable"  border="0" cellpadding="1" cellspacing="1" class="border">
              <tr class="CTitle">
               <td height="20" width="30" nowrap><input type="checkbox" name="chkall" id="chkall" onclick="CheckAll(this.form);"/></td>
               <td><b>�������</b></td>
               <td width="80" align="center"><b>�û���</b></td>
               <td align="center"><b>��ϵ��</b></td>
               <td align="center"><b>����</b></td>
               <td  align="center"><b>�µ�ʱ��</b></td>
               <td width="70" align="center" nowrap><b>�������</b></td>
               <td width="70" align="center" nowrap><b>��Ʊ��Ϣ</b></td>
               <td width="100" align="center" nowrap><b>����״̬</b></td>
               <td width="50" align="center"><b>��Ʒ</b></td>
              </tr>
          </HeaderTemplate>
         <ItemTemplate>
               <tr onmouseover="this.className='CtrMouseOver'" onmouseout="this.className='CtrMouseOut'" onclick="chk(this);">
			<td class="Ctd" align="center" style="width:35px;">
                     <input type="checkbox"  name="ids" id="ids" value="<%#Eval("ID") %>" />
                </td><td class="Ctd">
                  <a title="����鿴����[<%# Eval("orderid") %>]����" href="?action=orderdetail&id=<%#Eval("ID")%>" title="<%#  Utils.StrToInt(Eval("smsnum"))>0?"�ۼƷ��� "+Eval("SmsNum")+" ���ε����Ѹ�����Ϣ":string.Empty%>"><%#Eval("OrderID") %></a>
                   <%# Utils.StrToInt(Eval("ordertype"))==1?" <span style='color:red'>��</span>":string.Empty %>
                   <%# Utils.StrToInt(Eval("changescore")) >0 ? " <span style='color:green'>�һ�</span>" : string.Empty%>
                   <%# Utils.StrToInt(Eval("OrderType"))==0?"":Utils.StrToInt(Eval("ConsumptionMode"))==1?" <span style='color:green'>����</span>":" <span style='color:blue'>ƾ��</span>" %>
                </td><td class="Ctd" align="center" style="width:50px;">
                   <%# Convert.ToString(Eval("IsAnonymous"))=="1"?"<span style='color:#999999'>�ο�</span>":Eval("username")%>
                </td>
                <td class="Ctd" align="center"><%# Eval("RealName") %></td>
                <td class="Ctd tips" align="center"><%# MyCache.GetAreaName(Utils.StrToInt(Eval("ProvinceID")),"city") %><%# MyCache.GetAreaName(Utils.StrToInt(Eval("CityID")),"city") %><%# MyCache.GetAreaName(Utils.StrToInt(Eval("CountyID")),"city") %></td>
                 <td class="Ctd" align="center"><%#Eval("InputTime") %></td>
                   <td class="Ctd" align="center" style="width:70px;">
               <%=MyCache.GetCurrencySymbol %><%# Public.ReturnShopPrice(Utils.StrToDecimal(Eval("OrderTotalPrice"))) %></td><td class="Ctd" align="center" style="width:70px;">
                  <%# getInvoiceInfo(Utils.StrToInt(Convert.ToString(Eval("Invoiced"))), Utils.StrToInt(Convert.ToString(Eval("IsInvoice"))))%>
                </td><td class="Ctd" align="center">
             <%# GetOrderStatus(Utils.StrToInt(Eval("OrderType")),Convert.ToString(Eval("OrderID")),Utils.StrToInt(Eval("ConsumptionMode")),Utils.StrToInt(Eval("IsBusinessConfirm")),Convert.ToString(Eval("alipaytradestatus")), Convert.ToInt16(Eval("status")), Convert.ToInt16(Eval("DeliverStatus")), Utils.StrToDecimal(Convert.ToString(Eval("MoneyReceipt"))), Utils.StrToDecimal(Convert.ToString(Eval("OrderTotalPrice"))))%>
                </td>
                <td align="center"><a href="javascript:;" onclick="jQuery('#s<%# Eval("orderid") %>').toggle();">��Ʒ</a></td>
			
             <tr id="s<%# Eval("orderid") %>" style="display:none;">
                 <td></td>
                 <td colspan="10">
                      <asp:Repeater ID="Repeater2" runat="server">
                       <HeaderTemplate>
                            <table width="60%" align="left" class="border" cellspacing="1" cellpadding="1"  border="0">
                            <tr class="CTitle">
                                <td>��Ʒ</td>
                                <td style="width:80px;text-align:center">����</td>
                                <td style="width:80px;text-align:center">����</td>
                            </tr>
                       </HeaderTemplate>
                       <ItemTemplate>
                      
                       <tr>
                          <td class="Ctd" align="left">
                            <table border='0' width="100%" cellpadding="0" cellspacing="0">
		                       <tr>
			                    <td width="35" height="50" align="center" class="img"><img src='<%# string.IsNullOrEmpty(Convert.ToString(Eval("DefaultPic")))?MyCache.GetCacheShopConfig(9):Kesion.BLL.BaseFun.GetFullImageSrc(Convert.ToString(Eval("DefaultPic")))  %>' width='30' height='30' align='left'/></td>
			                    <td>
                           <%#  getProOrder(Utils.StrToInt((Eval("ClassID"))), Convert.ToString(Eval("FileName") + ""), Convert.ToString(Eval("TurnUrl") + ""), Utils.StrToInt(Eval("ItemID")), Utils.StrToInt(Eval("ChannelID")), Utils.StrToInt(Eval("InfoID")),  Convert.ToString(Eval("Title")), Utils.StrToInt(Eval("isBundleSale")), Utils.StrToInt(Eval("isChangeBuy")), Utils.StrToInt(Eval("isLimitBuy")),Convert.ToString(Eval("AttributeCart")),Utils.StrToInt(Convert.ToString(Eval("AttrID"))))%>

		                       </td>
		                      </tr>
		                     </table>
                          </td>
                          <td class="Ctd" style="width:80px;text-align:center"><%=MyCache.GetCurrencySymbol %><%# Public.ReturnShopPrice(Convert.ToString(Eval("Price"))) %></td>
                          <td class="Ctd" style="width:80px;text-align:center"><%#Eval("num") %></td>
                       </tr>
                       </ItemTemplate>
                           <FooterTemplate>
                               </table> 
                           </FooterTemplate>
                     </asp:Repeater>
                 </td>
             </tr></tr>
       </ItemTemplate>
             <FooterTemplate>
           <tr class="tdbg" style="display:<%# bool.Parse((Repeater1.Items.Count==0).ToString())?"":"none"%>">
                <td class="splittd" style="text-align:center" colspan="10">
                  ��û���κεĶ�����
                </td>
               </tr> 
           </table>
          </FooterTemplate>
</asp:Repeater>
</asp:PlaceHolder>
    
        <KS:Page ID="Page1" runat="server" />
        <script type="text/javascript">
            showtips('<span class="state"><strong>˵����</strong><br /></span>1������<span style=\'color:red\'>��</span>���ֵĶ�����ʾ�Ź��Ķ���������<span style=\'color:green\'>�һ�</span>���ֵĶ�����ʾ���ֶһ��Ķ�����<br/>2����ʾ��<span style=\'color:blue\'>ƾ��</span>����ʾ�ö���ͨ���ֻ���֤����֤���ѣ���ʾ��<span style=\'color:green\'>����</span>����ʾ�ö�����Ҫ������<br/>3��Ϊ��������ͳ����ȷ�ϡ��ѽ��塢�����յ����(�������յ�Ԥ����)�Ķ�������ɾ����<br/>4�����ֶһ��Ķ���δ����ɾ���ģ������ѵĻ��ֽ������û��˺��ϡ�');
		</script>
     </asp:Panel>
    
    <asp:Panel ID="showPanel" runat="server" Width="100%" Visible="false">

        <asp:PlaceHolder ID="PlaceHolder1" runat="server"></asp:PlaceHolder>
       
    </asp:Panel>
    
    

  </asp:Content>