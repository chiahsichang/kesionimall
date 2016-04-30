<%@ Page Language="C#" MasterPageFile="~/User/User.master" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.MyJingJiaRecord" Title="Untitled Page" Codebehind="MyJingJiaRecord.aspx.cs" %>
<%@ Import Namespace="Kesion.Cache" %>
<%@ Import Namespace="Kesion.Publics" %>
<asp:Content ID="Content1" ContentPlaceHolderID="KSContent" Runat="Server">

<asp:Panel ID="PanList" runat="server">
    <div class="toptips">
     ��Ʒ���ƣ�<%=dr["title"].ToString()%>����<%=dr["times"].ToString() %>�ξ���  ��߳���<%=Kesion.APPCode.Public.ReturnShopPrice(dr["HightMoney"].ToString()) %>Ԫ��
   </div>
    <asp:Repeater ID="Repeater1" runat="server">
    <HeaderTemplate>
         <table id="tablist" width="98%" border="0" align="center" cellpadding="2" cellspacing="1" class="border">
      <tr align="center" class="title">
        	<td>���</td>
        	<td>������</td>
        	<td>����ʱ��</td>
        	<td>����(Ԫ)</td>
        	<td>״̬</td>
        	<td>ȷ��</td>
        </tr>
    </HeaderTemplate>
    <ItemTemplate>
      <tr class="tdbg">
          <td class="splittd" style="text-align:center"><%# (CurrPage-1)*PageSize+Container.ItemIndex+1%></td>
          <td class="splittd" style="text-align:center"><%# Eval("username")%></td>
          <td class="splittd" style="text-align:center"><%# Eval("adddate")%></td>
          <td class="splittd" style="text-align:center"><%# Kesion.APPCode.Public.ReturnShopPrice(Convert.ToDecimal(Eval("Money"))) %></td>
          <td class="splittd" style="text-align:center">
             <%# (CurrPage-1)*PageSize+Container.ItemIndex+1<=Utils.StrToInt(dr["num"].ToString())?(dr["isend"].ToString().Equals("1")?"<span style='color:green'>�б�</span>":"<span style='color:green'>����</span>"):"<span style='color:#999'>���</span>"%>
          </td>
          <td class="splittd" style="text-align:center">
              <%# GetConfirmInfo(Convert.ToInt32(Eval("Id")),Convert.ToInt32(Eval("iszb")),Convert.ToInt32(Eval("status")),Convert.ToString(Eval("username"))) %>
          </td>
      </tr>  

     </ItemTemplate>
     <FooterTemplate>
         <tr class="tdbg" style="display:<%# bool.Parse((Repeater1.Items.Count==0).ToString())?"":"none"%>">
                <td class="splittd" style="text-align:center" colspan="10">
                 ��û�в����κε���Ʒ���ۣ�
                </td>
           </tr> 
      </table>
     </FooterTemplate>
    </asp:Repeater>
    
   <br />
    
     <KS:Page ID="Page1" runat="server" />
     
   <br />
   
</asp:Panel>


    <asp:Panel ID="Panel1" runat="server" Visible="false">

      <script>
          function checkSubmitForm() {
              <%if (dr["producttype"].ToString().Equals("0")){%>
              if ($("#<%=this.TxtRealName.ClientID%>").val() == '') {
                  KesionJS.Alert("�������ռ��ˣ�", '$("#<%=this.TxtRealName.ClientID%>").focus()');
                  return false;
              }
              if ($("#<%=this.TxtMobile.ClientID%>").val() == '') {
                  KesionJS.Alert("��������ϵ�绰��", '$("#<%=this.TxtMobile.ClientID%>").focus()');
                  return false;
              }
              if ($("#<%=this.TxtAddress.ClientID%>").val() == '') {
                  KesionJS.Alert("�������ռ���ַ��", '$("#<%=this.TxtAddress.ClientID%>").focus()');
                  return false;
              }
              <%}%>
              return true;
          }
      </script>
      <table  cellspacing="1" cellpadding="3" class="border" width="100%" align="center" border="0">
	   <tr class="title">
         <td colspan="2"> ���۽���ȷ��</td>
        </tr>
        <tr class="tdbg">
         <td class="lefttd">��Ʒ���ƣ�</td>
         <td><%=dr["title"].ToString()%></td>
        </tr>
        <tr class="tdbg">
         <td class="lefttd">�� �� �ˣ�</td>
         <td><asp:Label ID="LabJingJiaUserName" runat="server"></asp:Label></td>
        </tr>
        <tr class="tdbg">
         <td class="lefttd">����ʱ�䣺</td>
         <td><asp:Label ID="LabJingJiaAddDate" runat="server"></asp:Label></td>
        </tr>
        <tr class="tdbg">
         <td class="lefttd">���ü۸�</td>
         <td><asp:Label ID="LabJingJiaPrice" runat="server"></asp:Label>Ԫ</td>
        </tr>
        <tr class="tdbg">
         <td class="lefttd">����֧����</td>
         <td><asp:Label ID="LabPayMoney" runat="server"></asp:Label>Ԫ</td>
        </tr>
        <tr class="tdbg">
         <td class="lefttd">ȷ��״̬��</td>
         <td><asp:Label ID="LabStatus" runat="server"></asp:Label></td>
        </tr>
        <tbody id="AddressInput" runat="server">
             <tr class="title">
             <td colspan="2">�ջ���Ϣ</td>
            </tr>
            <tr class="tdbg"> 
             <td class="lefttd">�� �� �ˣ�</td>
             <td><asp:TextBox ID="TxtRealName" CssClass="textbox" runat="server" MaxLength="20" /></td>
            </tr>
            <tr class="tdbg">
             <td class="lefttd">��ϵ�绰��</td>
             <td><asp:TextBox ID="TxtMobile" CssClass="textbox" runat="server" MaxLength="20"/></td>
            </tr>
            <tr class="tdbg">
             <td class="lefttd">�ջ���ַ��</td>
             <td><asp:TextBox ID="TxtAddress" CssClass="textbox" runat="server" MaxLength="200"/></td>
            </tr>
            <tr class="tdbg">
             <td class="lefttd">�������룺</td>
             <td><asp:TextBox ID="TxtZipCode" CssClass="textbox" runat="server" MaxLength="10"/></td>
            </tr>
        </tbody>
           <tbody id="AddressShow" runat="server">
             <tr class="title">
             <td colspan="2">�ջ���Ϣ</td>
            </tr>
            <tr class="tdbg"> 
             <td class="lefttd">�� �� �ˣ�</td>
             <td><asp:Label ID="LabRealName" runat="server" /></td>
            </tr>
            <tr class="tdbg">
             <td class="lefttd">��ϵ�绰��</td>
             <td><asp:Label ID="LabMobile" runat="server" /></td>
            </tr>
            <tr class="tdbg">
             <td class="lefttd">�ջ���ַ��</td>
             <td><asp:Label ID="LabAddress" runat="server" /></td>
            </tr>
            <tr class="tdbg">
             <td class="lefttd">�������룺</td>
             <td><asp:Label ID="LabZipCode" runat="server" /></td>
            </tr>
        </tbody>
      </table>
        <div style="text-align:left;padding:20px;padding-left:120px;"��id="showDoButton" runat="server">
            <asp:HiddenField ID="HidAskId" runat="server" Value="0" />
            <asp:Button ID="BtnConfirm" Text="ȷ�Ͻ���" OnClientClick="return(checkSubmitForm())" CssClass="button" runat="server" OnClick="BtnConfirm_Click" />
            <asp:Button ID="BtnCancel" Text="�ܾ�����" CssClass="button" runat="server" OnClientClick="return(confirm('��ܰ��ʾ���ܾ����ף�������ʧ��֤��,ȷ�ϲ�����'));" OnClick="BtnCancel_Click" />
            <input type="button" class="button" value="ȡ������" onclick="history.back()" />
        </div>
   </asp:Panel>

</asp:Content>