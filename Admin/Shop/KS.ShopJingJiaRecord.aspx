<%@ Page Language="C#" MasterPageFile="~/Admin/MasterPage.master" EnableEventValidation="false"  AutoEventWireup="true" Inherits="Kesion.NET.WebSite.Admin.Shop.Admin_ShopJingJiaRecord" Title="竞价商品管理" Codebehind="KS.ShopJingJiaRecord.aspx.cs" %>
<%@ Import Namespace="Kesion.Publics"%>
<%@ Import Namespace="Kesion.APPCode"%>
<%@ Import Namespace="Kesion.Cache"%>
<asp:Content ID="Content1" ContentPlaceHolderID="KSContent" Runat="Server">
  
   <asp:Panel ID="PanelRecord" runat="server" Visible="true">
        <KS:TopNav ID="TopNav1" runat="server" Text="查看竞价记录" />
       <script>
           function ShowAddress(id) {
               parent.openWin("查看送货信息", "Shop/KS.ShopJingJiaRecord.Aspx?askID=" + id + "&Action=ShowAddress", true);
           }

       </script>
  <KS:KSGV ID="JingJiaRecord" runat="server" cssclass="CTable" AutoGenerateColumns="False" Width="99%" 
             EmptyDataText="没有找到任何竞价记录!" GridLines="None" OnRowDataBound="JingJiaRecord_RowDataBound"
             AllowPaging="false">
          <Columns>
              <asp:TemplateField HeaderText="ID">
                <itemstyle horizontalalign="Center" width="40px" />
                <itemtemplate>
                   <%# (currPage-1)*pagesize+Container.DataItemIndex+1%>
                </itemtemplate>
              </asp:TemplateField>
               
             <asp:TemplateField HeaderText="出价者">
             <itemstyle VerticalAlign="Top" />
             <itemtemplate><%# Eval("username") %>  </itemtemplate>
             </asp:TemplateField> 
             <asp:TemplateField HeaderText="出价IP">
             <itemstyle VerticalAlign="Top" />
             <itemtemplate><%# Eval("UserIP") %>  </itemtemplate>
             </asp:TemplateField> 
             <asp:TemplateField HeaderText="出价时间">
             <itemstyle horizontalalign="Center" />
             <itemtemplate>
                 <%# Eval("AddDate") %>
             </itemtemplate>
             </asp:TemplateField>            
               <asp:TemplateField HeaderText="出价(元)">
             <itemstyle horizontalalign="Center" />
             <itemtemplate>
                 <%# Kesion.APPCode.Public.ReturnShopPrice(Convert.ToDecimal(Eval("Money"))) %>
             </itemtemplate>
             </asp:TemplateField>
             <asp:TemplateField HeaderText="状态">
             <itemstyle horizontalalign="Center" />
             <itemtemplate>
                <%# (currPage-1)*pagesize+Container.DataItemIndex+1<=num?"<font color=green>得标</font>":"<span class='tips'>落后</span>" %>
             </itemtemplate>
             </asp:TemplateField>
             <asp:TemplateField HeaderText="客户确认">
             <itemstyle horizontalalign="Center" />
             <itemtemplate>
                <%# Convert.ToString(Eval("status"))=="1"?"<font color=green>已确认</font>":(Convert.ToString(Eval("status"))=="2"?"<span class='tips'>拒绝交易</span>":(Convert.ToString(Eval("iszb"))=="1"?"<span style='color:red'>未确认</span>":"-")) %>
             </itemtemplate>
             </asp:TemplateField>
              <asp:TemplateField HeaderText="邮寄信息">
             <itemstyle horizontalalign="Center" />
             <itemtemplate>
                 <a href="javascript:;" <%# Convert.ToString(Eval("status"))!="1"?" style='display:none'":string.Empty %> onclick="ShowAddress(<%# Eval("ID") %>)">查看</a>
             </itemtemplate>
             </asp:TemplateField>
          </Columns>
            <HeaderStyle CssClass="CTitle" />
            <EmptyDataRowStyle CssClass="emptycss" />
      </KS:KSGV>

    
    <KS:Page ID="Page1" runat="server" />

           <div class="message">
    
   <strong>搜索竞价者：</strong> <asp:TextBox runat="server" ID="TxtKeyWord" CssClass="textbox" /> 

    <asp:Button ID="BtnSearch" runat="server" CssClass="button" Text="开始搜索" 
            onclick="BtnSearch_Click"  />
        </div>

   </asp:Panel>



    <asp:Panel ID="PanelShow" runat="server" Width="100%" Visible="false">
         <KS:TopNav ID="TopNav2" runat="server" Text="查看送货信息" />
        <table width="99%" align="center" border="0" cellpadding="1" cellspacing="1" class="CTable"> 
          <tr>
            <td class="lefttd" height="30" align="right" style="width: 109px"><strong>收货人：</strong></td>
            <td class="righttd">
                &nbsp;<%=dr["RealName"].ToString() %>
            </td>
          </tr>
          <tr>
            <td class="lefttd" height="30" align="right" style="width: 109px"><strong>收货地址：</strong></td>
            <td class="righttd">
                &nbsp;<%=dr["Address"].ToString() %>
            </td>
          </tr>
          <tr>
            <td class="lefttd" height="30" align="right" style="width: 109px"><strong>收货电话：</strong></td>
            <td class="righttd">
                 &nbsp;<%=dr["Mobile"].ToString() %>
            </td>
          </tr>
          <tr>
            <td class="lefttd" height="30" align="right" style="width: 109px"><strong>收货邮编：</strong></td>
            <td class="righttd">
                &nbsp;<%=dr["zipcode"].ToString() %>
            </td>
          </tr>
        </table>
        <br />
        <br />

    </asp:Panel>

    
</asp:Content>

