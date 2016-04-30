<%@ Page Language="C#" MasterPageFile="~/Admin/MasterPage.master" EnableEventValidation="false"  AutoEventWireup="true" Inherits="Kesion.NET.WebSite.Admin.Shop.Admin_ShopJingJiaPro" Title="竞价商品管理" Codebehind="KS.ShopJingJiaPro.aspx.cs" %>
<%@ Import Namespace="Kesion.Publics"%>
<%@ Import Namespace="Kesion.APPCode"%>
<%@ Import Namespace="Kesion.Cache"%>
<asp:Content ID="Content1" ContentPlaceHolderID="KSContent" Runat="Server">
     <asp:Panel ID="TaskList" runat="server" Width="100%">
         <script type="text/javascript">
             function addPro() {
                 top.openWin("添加竞价商品", "Shop/KS.ShopAddLimitPro.aspx?addtype=jingjia", false, 400, 200);
             }

          </script>
      <div id="manage_top" class="menu_top_fixed">
        <ul>
           <li id='p1'><asp:LinkButton ID="addTask" runat="server" OnClientClick="addPro()"><b></b>添加竞价商品</asp:LinkButton></li>
           <li id='p3'><asp:LinkButton ID="delTask" runat="server" OnClick="delTask_Click"><b></b>删除竞价商品</asp:LinkButton></li>
        </ul>
          
      </div>   
     <div class="menu_top_fixed_height"></div> 
      
<div class="tabs_header">
    <ul class="tabs">
    <li<%=KSCMS.S("flag")==""?" class='active'":string.Empty %>><a href="KS.ShopJingJiaPro.aspx"><span>所有竞价商品</span></a></li>
    <li<%=KSCMS.S("flag")=="1"?" class='active'":string.Empty %>><a href="KS.ShopJingJiaPro.aspx?flag=1"><span>进行中</span></a></li>
    <li<%=KSCMS.S("flag")=="2"?" class='active'":string.Empty %>><a href="KS.ShopJingJiaPro.aspx?flag=2"><span>已结束</span></a></li>
    </ul>
</div>
      

  <KS:KSGV ID="list" runat="server" cssclass="CTable" AutoGenerateColumns="False" Width="99%" 
             EmptyDataText="没有找到任何竞价商品!" GridLines="None" OnRowDataBound="list_RowDataBound" 
             OnRowCommand="list_RowCommand" OnRowCreated="list_RowCreated" 
             AllowPaging="false">
          <Columns>
              <asp:TemplateField HeaderText="选择">
                <itemstyle horizontalalign="Center" width="40px" />
                <itemtemplate>
                    <input type="checkbox"  name="ids" id="ids" value='<%#Eval("infoid") %>' />
                </itemtemplate>
              </asp:TemplateField>
               
             <asp:TemplateField HeaderText="竞价商品分类">
             <itemstyle VerticalAlign="Top" />
             <itemtemplate><%# MyCache.GetCacheClass(Convert.ToInt32(Eval("classid")),1) %>  </itemtemplate>
             </asp:TemplateField> 
              <asp:TemplateField HeaderText="竞价商品名称">
             <itemstyle />
             <itemtemplate>
                <a title="点击预览" href="<%# Kesion.HtmlTags.BasicField.GetItemUrl(Utils.StrToInt(Eval("ChannelID")),Utils.StrToInt(Eval("InfoID"))) %>" target="_blank"><%# Utils.CutStr(Convert.ToString(Eval("Title")),60) %></a>
             </itemtemplate>
             </asp:TemplateField>
             <asp:TemplateField HeaderText="添加时间">
             <itemstyle horizontalalign="Center" />
             <itemtemplate>
                 <%# Eval("AddDate") %>
             </itemtemplate>
             </asp:TemplateField>
             <asp:TemplateField HeaderText="状态">
             <itemstyle horizontalalign="Center" />
             <itemtemplate>
             <itemstyle horizontalalign="Center" />
                 <%# Convert.ToString(Eval("IsEnd"))=="1"?"<span class='tips'>已结束</span>":"正常" %>
             </itemtemplate>
             </asp:TemplateField>
             <asp:TemplateField HeaderText="起拍价">
             <itemstyle horizontalalign="Center" />
             <itemtemplate>
             <itemstyle horizontalalign="Center" />
                 <%#　Kesion.APPCode.Public.ReturnShopPrice(Convert.ToDecimal(Eval("money"))) %>
             </itemtemplate>
             </asp:TemplateField>
             <asp:TemplateField HeaderText="当前价格">
             <itemstyle horizontalalign="Center" />
             <itemtemplate>
             <itemstyle horizontalalign="Center" />
                  <%#　Kesion.APPCode.Public.ReturnShopPrice(Convert.ToDecimal(Eval("Hightmoney"))) %>
             </itemtemplate>
             </asp:TemplateField>
             <asp:TemplateField HeaderText="竞拍次数">
             <itemstyle horizontalalign="Center" />
             <itemtemplate>
                <a title="查看竞价记录" href="KS.ShopJingJiaRecord.aspx?action=showrecord&infoid=<%# Eval("infoid") %>"><%# Eval("Times") %>次</a>
             </itemtemplate>
             </asp:TemplateField>
              <asp:TemplateField HeaderText="竞拍周期">
             <itemstyle horizontalalign="Center" />
             <itemtemplate>
                 <%# Eval("BeginDate") %>至<%# Eval("EndDate") %>
             </itemtemplate>
             </asp:TemplateField>

              <asp:TemplateField HeaderText="编辑">
              <itemstyle width="30px" horizontalalign="Center"/>
              <itemtemplate>
                  <a class="edit" title="编辑" href='KS.Shop.aspx?Action=Edit&Channelid=<%#Eval("ChannelID") %>&ID=<%#Eval("InfoID") %>'></a>
              </itemtemplate>
             </asp:TemplateField>
             
              <asp:TemplateField HeaderText="删除">
              <itemstyle width="30px" horizontalalign="Center"/>
              <itemtemplate>
             <asp:LinkButton runat="server" CssClass="delete" ToolTip="删除" id="delete" commandargument=<%#Eval("infoid") %> commandname="del"></asp:LinkButton>
              </itemtemplate>
            </asp:TemplateField>

          </Columns>
            <HeaderStyle CssClass="CTitle" />
            <EmptyDataRowStyle CssClass="emptycss" />
      </KS:KSGV>
      <asp:Panel ID="Panel1" runat="server">
         <div style="height:5px;overflow:hidden;"></div>
            &nbsp;&nbsp;<input type="checkbox" name="chkall" id="chkall" onclick="CheckAll(this.form);"/><label for="chkall">全部选中</label>
          <input type="button" value="删除选中" onmouseover="this.className='button_on';" onmouseout="this.className='button';" class="button" onclick="if (GetIDS('del')){this.form.action='?action=del';this.form.submit()}" id="Button1" />
    </asp:Panel> 
    
    <KS:Page ID="Page1" runat="server" />
    
    <div class="message">
    
   <strong>搜索竞价商品：</strong> <asp:TextBox runat="server" ID="TxtKeyWord" CssClass="textbox" /> 

    <asp:Button ID="BtnSearch" runat="server" CssClass="button" Text="开始搜索" 
            onclick="BtnSearch_Click"  />
        </div>
        
    </asp:Panel>





    

    <asp:Panel ID="PanelModify" runat="server" Width="100%" Visible="false">
         <KS:TopNav ID="TopNav2" runat="server" Text="修改收货信息" />
        <table width="99%" align="center" border="0" cellpadding="1" cellspacing="1" class="CTable"> 
          <tr>
            <td class="lefttd" height="30" align="right" style="width: 109px"><strong>竞价商品：</strong></td>
            <td class="righttd">
                &nbsp;<asp:Label ID="LabCodeID" runat="server"></asp:Label>
            </td>
          </tr>
          <tr>
            <td class="lefttd" height="30" align="right" style="width: 109px"><strong>使用地区：</strong></td>
            <td class="righttd">
                &nbsp;<asp:Label ID="LabArea" runat="server"></asp:Label>
            </td>
          </tr>
          <tr>
            <td class="lefttd" height="30" align="right" style="width: 109px"><strong>收货人：</strong></td>
            <td class="righttd">
                &nbsp;<asp:TextBox ID="TxtRealName" runat="server" CssClass="textbox" width="200"/>
            </td>
          </tr>
          <tr>
            <td class="lefttd" height="30" align="right" style="width: 109px"><strong>收货地址：</strong></td>
            <td class="righttd">
                &nbsp;<asp:TextBox ID="TxtAddress" runat="server" CssClass="textbox" width="200"/>
            </td>
          </tr>
          <tr>
            <td class="lefttd" height="30" align="right" style="width: 109px"><strong>收货电话：</strong></td>
            <td class="righttd">
                &nbsp;<asp:TextBox ID="TxtMobile" runat="server" CssClass="textbox" width="200"/>
            </td>
          </tr>
          <tr>
            <td class="lefttd" height="30" align="right" style="width: 109px"><strong>收货邮编：</strong></td>
            <td class="righttd">
                &nbsp;<asp:TextBox ID="TxtZipCode" runat="server" CssClass="textbox" width="200"/>
            </td>
          </tr>
        </table>
        <br />
        <br />
              <KS:Foot ID="Foot2" runat="server" OnSubmit="Foot2_Submit" />

    </asp:Panel>

    
</asp:Content>

