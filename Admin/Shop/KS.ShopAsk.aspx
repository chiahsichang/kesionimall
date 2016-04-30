<%@ Page Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.Admin.Shop.Admin_ShopAsk" Title="商品咨询回复管理" Codebehind="KS.ShopAsk.aspx.cs" %>
<%@ Import Namespace="Kesion.Cache" %>
<%@ Import Namespace="Kesion.Publics" %>
<asp:Content ID="Content1" ContentPlaceHolderID="KSContent" Runat="Server">
<div id="manage_top" class="menu_top_fixed">
 &nbsp;&nbsp;<strong>搜索=></strong>
    <asp:DropDownList ID="DrpSearchType" runat="server">
     <asp:ListItem Value="3">商品名称</asp:ListItem>
     <asp:ListItem Value="1">用户名称</asp:ListItem>
     <asp:ListItem Value="2">咨询内容</asp:ListItem>
    </asp:DropDownList>
    <asp:TextBox ID="TxtKey"  CssClass="textbox" runat="server" Width="100px"></asp:TextBox> 
<asp:Button ID="Button1"
        runat="server" Text=" 查 找 " CssClass="button" OnClick="Button1_Click" />
</div> 
<div class="menu_top_fixed_height"></div>
<div class="tabs_header">
    <ul class="tabs">
        <li<%=KSCMS.S("logtype")==""?" class='active'":string.Empty %>><a href="KS.ShopAsk.aspx"><span>所有记录</span></a></li>
        <li<%=KSCMS.S("logtype")=="2"?" class='active'":string.Empty %>><a href="KS.ShopAsk.aspx?logType=2"><span style='color:Red;font-weight:bold'>未审核</span></a></li>
        <li<%=KSCMS.S("logtype")=="1"?" class='active'":string.Empty %>><a href="KS.ShopAsk.aspx?logType=1"><span>已审核</span></a></li>
        <li<%=KSCMS.S("logtype")=="3"?" class='active'":string.Empty %>><a href="KS.ShopAsk.aspx?logType=3"><span>未回复</span></a></li>
        <li<%=KSCMS.S("logtype")=="4"?" class='active'":string.Empty %>><a href="KS.ShopAsk.aspx?logType=4"><span>已回复</span></a></li>
    </ul>
</div>

   <asp:Panel ID="ListPannel" runat="server">
        <KS:KSGV ID="LogDeliveryView" cssclass="CTable" runat="server" AutoGenerateColumns="False" 
            DataKeyNames="FieldID" GridLines="None"
            OnRowDataBound="FieldListView_RowDataBound" Width="99%" 
            EnableTheming="True"  EmptyDataText="没有找到任何商品咨询回复记录!" 
            onrowcommand="LogDeliveryView_RowCommand">
            <Columns>
               <asp:TemplateField HeaderText="选择">
                <itemstyle horizontalalign="Center" width="40px" />
                <itemtemplate>
                    <input type="checkbox"  name="ids" id="ids" value="<%#Eval("id") %>" />
               </itemtemplate>
              </asp:TemplateField>
                
                 <asp:TemplateField HeaderText="商品名称">
                  <itemstyle horizontalalign="Left"  />
                 <ItemTemplate>
                <a href="../../model/view.aspx?m_id=<%# Eval("channelid") %>&id=<%# Eval("infoid") %>" target="_blank" title="<%# Eval("title") %>"><%# Utils.CutStr(Convert.ToString(Eval("title")),50) %></a>
                 </ItemTemplate>  
                </asp:TemplateField>
                
                 <asp:TemplateField HeaderText="咨询内容">
                  <itemstyle horizontalalign="Left"  />
                 <ItemTemplate>
                 <%# Utils.CutStr(Convert.ToString(Eval("Content")),60) %>
                 </ItemTemplate>  
                </asp:TemplateField>


                <asp:BoundField DataField="UserName" HeaderText="咨询人">
                  <itemstyle horizontalalign="Center" width="50px" />
                </asp:BoundField>
                
                <asp:BoundField DataField="AddDate" HeaderText="时间">
                <itemstyle horizontalalign="Center" width="100px" />
                </asp:BoundField>
              
             
                
                <asp:TemplateField HeaderText="状态">
                <itemstyle horizontalalign="Center" />
             <itemtemplate>
                <%# Convert.ToString(Eval("status"))=="1"?"<span style='color:green'>已审核</span>":"<span style='color:red'>未审核</span>" %>
                <%# Convert.ToString(Eval("isreply"))=="1"?"<span style='color:green'>已回复</span>":"<span style='color:red'>未回复</span>" %>
               </itemtemplate>
            </asp:TemplateField>
 
                <asp:TemplateField HeaderText="↓操作">
                <itemstyle horizontalalign="Center" />
             <itemtemplate>
             <asp:LinkButton runat="server" id="showBtn" CssClass="showBtn" title="查看/回复" commandargument=<%#Eval("id") %> commandname="show"></asp:LinkButton>
               </itemtemplate>
            </asp:TemplateField>
            </Columns>
            <HeaderStyle CssClass="CTitle" />
            <EmptyDataRowStyle CssClass="emptycss" />
        </KS:KSGV>
        <br />
 <KS:Page ID="Page1" runat="server" />
         <asp:Panel ID="Panel1" runat="server" Height="30px">
              <div style="margin-top:5px;overflow:hidden;"></div>
            &nbsp;&nbsp;<input type="checkbox" name="chkall" id="chkall" onclick="CheckAll(this.form);"/><label for="chkall">全部选中</label>
             <input type="button" value="删除选中的咨询回复" onmouseover="this.className='button_on';" onmouseout="this.className='button';" class="button" onclick="if (GetIDS('del')){this.form.action='?action=del';this.form.submit()}" />
            &nbsp;&nbsp;<asp:Button
                ID="Button2" runat="server" CssClass="button" Text="批量审核咨询回复" onclick="Button2_Click"  />
          <asp:Button ID="Button3" runat="server" CssClass="button" Text="批量取消审核" onclick="Button3_Click" /></asp:Panel>   

         <br />
        <script type="text/javascript">
		showtips('<span class="state"><strong>说明：</strong><br /></span>对商品的咨询内容进行审核，删除及回复等操作!');
		</script>
		</asp:Panel>
		
		<asp:Panel runat="server" ID="showPannel" Visible="false">
		
		 <table width="99%" align="center" border="0" cellpadding="1" cellspacing="1" class="CTable"> 
		   
          
		    <tr>
                 <td align="right" class="lefttd" style="width: 109px; height: 30px"><strong>咨询的商品：</strong></td>
                 <td class="righttd" style="height: 30px;"><%=dr["title"].ToString() %>
                 </td>
             </tr>
		    <tr>
                 <td align="right" class="lefttd" style="width: 109px; height: 30px"><strong>咨询人：</strong></td>
                 <td class="righttd" style="height: 30px;"><%=dr["UserName"].ToString() %>
                 </td>
             </tr>
		    <tr>
                 <td align="right" class="lefttd" style="width: 109px; height: 30px"><strong>咨询时间：</strong></td>
                 <td class="righttd" style="height: 30px;"><%=dr["AddDate"].ToString()%>
                 </td>
             </tr>
		    <tr>
                 <td align="right" class="lefttd" style="width: 109px; height: 30px"><strong>咨询内容：</strong></td>
                 <td class="righttd" style="height: 30px;"><%=dr["Content"].ToString().Replace("\n","<br/>")%>
                 </td>
             </tr>
             <tr>
                 <td align="right" class="lefttd" style="width: 109px; height: 30px"><strong>是否回复：</strong></td>
                 <td class="righttd" style="height: 30px;">
                 <%if (dr["isReply"].ToString() == "1")
                   {
                       Response.Write("<span style='color:green'>已答复</span>");
                   }
                   else
                   {
                       Response.Write("<span style='color:red'>未答复</span>");
                   }     
                  %>
                 </td>
             </tr>
		    <tr>
                 <td align="right" class="lefttd" style="width: 109px; height: 30px"><strong>回复内容：</strong></td>
                 <td class="righttd" style="height: 30px;">

                 <asp:TextBox ID="TxtReplyContent" Width="90%" Height="100" TextMode="MultiLine" runat="server"></asp:TextBox>
                 </td>
             </tr>
		    <tr>
                 <td align="right" class="lefttd" style="width: 109px; height: 30px"><strong>回复人：</strong></td>
                 <td class="righttd" style="height: 30px;">

                 <asp:TextBox ID="TxtReplyUser" CssClass="textbox" runat="server"></asp:TextBox>
                 </td>
             </tr>
		    <tr>
                 <td align="right" class="lefttd" style="width: 109px; height: 30px"><strong>回复时间：</strong></td>
                 <td class="righttd" style="height: 30px;">

                 <asp:TextBox ID="TxtReplyDate" CssClass="textbox" runat="server"  onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'});"></asp:TextBox>
                 <span class="tips">日期格式：年-月-日 时:分:秒 </span>
                 </td>
             </tr>
		   
		    <tr>
                 <td align="right" class="lefttd" style="width: 109px; height: 30px"><strong>状态：</strong></td>
                 <td class="righttd" style="height: 30px;">
                  <asp:RadioButtonList ID="RdbStatus" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow">
                   <asp:ListItem Value="0">未审核</asp:ListItem>
                   <asp:ListItem Value="1">已审核</asp:ListItem>
                  </asp:RadioButtonList>
                 </td>
             </tr>
            
		 </table>

         <div style="margin-top:20px;text-align:center">
          <asp:HiddenField ID="HidAskId" runat="server" />
          <asp:Button Text="提交回复" runat="server" ID="BtnSubmit" CssClass="button" 
                 onclick="BtnSubmit_Click" />
          <input type="button" name="backBtn" class="button" value=" 返 回 " onclick="history.back()" />
         </div>

		</asp:Panel>


  </asp:Content>