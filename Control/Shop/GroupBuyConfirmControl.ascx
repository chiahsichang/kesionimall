<%@ Control Language="C#" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.Shop.GroupBuyConfirmControl" Codebehind="GroupBuyConfirmControl.ascx.cs" %>
<%@ Import Namespace="Kesion.Cache"%>

<asp:Panel ID="Panel1" runat="server">
<table class="border" cellSpacing=1 cellPadding=2 width="99%" align="center" border=0>
    <tr class="Title" align=middle>
      <td colSpan=2 height=25><B>�Ź�������ȷ��</B></td>
    </tr>
    <tr class=tdbg>
      <td align=right width="15%"  height="30" class="lefttd">�Ź���Ʒ���ƣ�</td>
      <td><asp:Label ID="LabTitle" runat="server"></asp:Label>
         <asp:HiddenField ID="HidInfo" Value="0" runat="server" />

      </td>
        
    </tr>
    <tr class=tdbg>
      <td align=right width="15%"  height="30" class="lefttd">�����ţ�</td>
      <td><%=dr["orderid"].ToString() %></td>
        
    </tr>
    <tr class=tdbg>
      <td align=right width="15%" height="30" class="lefttd">�ֻ����룺</td>
      <td><%=dr["mobile"].ToString() %></td>
        
    </tr>
    <tr class=tdbg>
      <td align=right width="15%"  class="lefttd">��֤�룺</td>
      <td>
          <asp:TextBox ID="TxtVerifyCode" runat="server" CssClass="textbox" />
          <span class="tips">�������������ṩ����֤�롣</span>
      </td>
    </tr>
    <tr class=tdbg>
      <td align=right width="15%"  class="lefttd" height="30">���ѣ�</td>
      <td>
         ���ô���<span style="color:red"><asp:Label ID="LabTimes" runat="server">0</asp:Label></span>��
          
          ��������
          <asp:DropDownList ID="DrpTimes" runat="server">
          </asp:DropDownList>
          ��

      </td>
    </tr>
    <tr class=tdbg>
      <td align=right width="15%"  class="lefttd">��ע��</td>
      <td>
          <asp:TextBox ID="TxtRemark" TextMode="MultiLine" Width="200px" Height="50px" Text="����" runat="server" CssClass="textbox" />
      </td>
    </tr>

    <tr class=tdbg align=middle>
      <td colSpan=2 height=30>
      <asp:Button ID="BtnSave" runat="server" Text="ȷ������" CssClass="button" OnClick="BtnSave_Click" />
 &nbsp;
        <Input class=button onclick="history.back();" type=button value=ȡ������ name=Submit></td>
    </tr>
  </table>
</asp:Panel>


<asp:Panel ID="Panel2" runat="server">
    <div style="margin:15px"><B>����[<span style="color:Red"><%=dr["orderid"].ToString() %></span>]��������ϸ��</B>
        ����<span style="color:Red"><%=times %></span>�Σ�������<span style="color:green"><%=hasTimes %></span>�Ρ�

    </div>
    <asp:Repeater ID="Repeater1" runat="server" >
          <HeaderTemplate>
            <table class="border" cellSpacing=1 cellPadding=2 width="99%" align="center" border=0>
                <tr align="center" class="title">
        	    <td align="center">����ʱ��</td>
               <td  align="center">������</td>
        	    <td  align="center">�ֻ���</td>
        	    <td align="center">¼��</td>
                <td align="center" width="110">���Ѵ���</td>
	            <td align="center">��ע</td>
              </tr>

          </HeaderTemplate>
           <ItemTemplate>
           <tr class="tdbg">
              <td class="splittd" align="center"><%# Eval("Adddate") %> </td>
              <td class="splittd" align="center"><%# Eval("orderid") %></td>
              <td class="splittd">
              <%# Eval("mobile") %>
              </td>
              <td class="splittd" align="center"><%# Eval("username") %></td>
              <td class="splittd" align="center"><%# Eval("times") %>��
              </td>
             
              <td class="splittd" style="width:180px;word-break:break-all">
              <%# Eval("Remark") %>
              </td>
           </tr>     
           </ItemTemplate>

         <FooterTemplate>
             <tr class="tdbg" style="display:<%# bool.Parse((Repeater1.Items.Count==0).ToString())?"":"none"%>">
                <td class="splittd" style="text-align:center" colspan="7">
                  ��û��������ϸ��¼!
                </td>
               </tr> 
            </table>
        </FooterTemplate>
    </asp:Repeater>

    <div style="text-align:center;margin:20px;">
        <input type="button" class="button" value=" ���� " onclick="location.href = 'MyGroupBuyOrder.aspx';" />

    </div>
</asp:Panel>