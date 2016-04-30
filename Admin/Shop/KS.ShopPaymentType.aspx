<%@ Page Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.Admin.Shop.Admin_ShopPayemntType" Title="支付方式管理" Codebehind="KS.ShopPaymentType.aspx.cs" %>
<%@ Import Namespace="Kesion.Publics" %>
<asp:Content ID="Content1" ContentPlaceHolderID="KSContent" Runat="Server">
    <asp:Panel ID="listPanel" runat="server" Width="100%">
      <div id="manage_top" class="menu_top_fixed">
        <ul>
        <li id='p1'><asp:LinkButton ID="addbutton" runat="server" OnClick="addbutton_Click"><b></b>新增支付方式</asp:LinkButton></li>
        
        <li id='p4'><asp:LinkButton ID="editbutton" runat="server" OnClick="editTask_Click"><b></b>编辑支付方式</asp:LinkButton></li>
        <li id='p3'><asp:LinkButton ID="delbutton" runat="server" OnClick="delTask_Click"><b></b>删除支付方式</asp:LinkButton></li>
        </ul>
      </div>     
 <div class="menu_top_fixed_height"></div>
    <div>
        <KS:OrderJS ID="OrderJS1" runat="server" />
        <KS:KSGV ID="PaymentListView" cssclass="CTable" runat="server" AutoGenerateColumns="False" DataKeyNames="FieldID" GridLines="None"
            OnRowDataBound="FieldListView_RowDataBound" PagerType="CustomNumeric" Width="99%" EnableTheming="True" OnRowCommand="FieldListView_RowCommand" EmptyDataText="您还没有添加任何支付方式,请<a href='?action=add'>点此添加</a>!">
            <Columns>
                <asp:TemplateField HeaderText="选择">
                <itemstyle horizontalalign="Center" width="50px" />
                <itemtemplate>
                    <input type="checkbox"  name="ids" id="ids" value="<%#Eval("TypeID") %>" />
                </itemtemplate>
              </asp:TemplateField>
                <asp:TemplateField HeaderText="排序">
                    <itemtemplate>
                     <asp:HiddenField runat="server" id="hidTypeID" value='<%#Eval("TypeID") %>'></asp:HiddenField>
                     <asp:DropDownList id="orderid" datasource="<%#bindorder() %>" runat="server"></asp:DropDownList>
                     
</itemtemplate>
                    <headerstyle height="18px"/>
                    <itemstyle width="60px" horizontalalign="Center"  />
                </asp:TemplateField>
                  <asp:BoundField DataField="TypeName" HeaderText="名称">
                </asp:BoundField>
                <asp:BoundField DataField="TypeFlag" HeaderText="类型">
                <itemstyle width="130px" horizontalalign="Center" />
                </asp:BoundField>

                 <asp:TemplateField HeaderText="是否启用">
                  <itemstyle width="120px" horizontalalign="Center"/>
                  <itemtemplate>
                       <a href="?action=Set&fieldName=status&id=<%# Eval("TypeID") %>" <%# Convert.ToString(Eval("Status"))=="0"?"class='no' title='否'":"class='ok' title='是'" %>></a>
                  </itemtemplate>
                </asp:TemplateField> 

                 <asp:TemplateField HeaderText="是否默认">
                  <itemstyle width="120px" horizontalalign="Center"/>
                  <itemtemplate>
                       <a href="?action=Set&fieldName=IsDefault&id=<%# Eval("TypeID") %>" <%# Convert.ToString(Eval("IsDefault"))=="0"?"class='no' title='否'":"class='ok' title='是'" %>></a>
                  </itemtemplate>
                </asp:TemplateField> 

         
                 <asp:TemplateField HeaderText="备注">
                  <itemstyle horizontalalign="left" />
                <ItemTemplate>
                <span class="tips">
                  <%# Utils.ClearHtml(Eval("Intro").ToString()).Length > 50 ? Utils.ClearHtml(Eval("Intro").ToString()).Substring(0, 50) : Eval("Intro").ToString()%>
                </span>
                </ItemTemplate>
            </asp:TemplateField>

             <asp:TemplateField HeaderText="编辑">
              <itemstyle width="30px" horizontalalign="Center"/>
              <itemtemplate>
                     <asp:LinkButton ID="LinkButton1" CssClass="edit" ToolTip="编辑" runat="server" commandargument=<%#Eval("TypeID") %> commandname="modify"></asp:LinkButton>
              </itemtemplate>
            </asp:TemplateField>
             
            <asp:TemplateField HeaderText="删除">
                <itemstyle horizontalalign="Center" width="30px"/>
               <itemtemplate>
                     <asp:LinkButton runat="server" CssClass="delete" ToolTip="删除" id="delete" commandargument=<%#Eval("TypeID") %> commandname="del"></asp:LinkButton>
               </itemtemplate>
            </asp:TemplateField>

               
            </Columns>
            <HeaderStyle CssClass="CTitle" />
            <EmptyDataRowStyle CssClass="emptycss" />
        </KS:KSGV>
        <br />
        <asp:Panel ID="Panel1" runat="server" Height="30px" Width="739px">
            &nbsp;&nbsp;&nbsp;&nbsp;<input type="checkbox" name="chkall" id="chkall" onclick="CheckAll(this.form);"/><label for="chkall">全部选中</label><asp:Button ID="Button1" runat="server" Text="批量设置支付方式排序" OnClick="Button1_Click" />&nbsp;<br />
            </asp:Panel>
        &nbsp;
        </div>
     </asp:Panel>
    
    <asp:Panel ID="addPanel" runat="server" Width="100%" Visible="false">
    <script type="text/javascript">
       function CheckForm()
	        {
	         if(jQuery('#<%=this.TxtTypeName.ClientID %>').val()==''){
	            KesionJS.Alert('请输入付款方式名称！',null);
	           return false;
	         }
	   }

	   function showPayMent()
       {
          if (jQuery("#<%=this.DrpTypeFlag.ClientID%> >option:selected").val()=="0"){
           jQuery("#showPayment").show();
           }
          else{
           jQuery("#showPayment").hide();
           }
       }

    
    </script>
        <KS:TopNav ID="TopNav1" runat="server" Text="添加支付方式" />
        &nbsp;
         <table width="99%" align="center" border="0" cellpadding="1" cellspacing="1" class="CTable"> 
             
            <tr>
                <td align="right" class="lefttd" height="30" style="width: 198px">
                    <strong>付款方式名称：</strong></td>
                <td class="righttd">
                    <asp:TextBox CssClass="textbox" ID="TxtTypeName" runat="server"></asp:TextBox>
                    <span style="color: #ff0066">*</span>  如:在线支付,余额支付等。<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TxtTypeName"
                        ErrorMessage="请输入付款方式名称" Display="Dynamic"></asp:RequiredFieldValidator></td>
            </tr>
            <tr>
                <td align="right" class="lefttd" height="30" style="width: 198px">
                    <strong>类型设置：</strong></td>
                <td class="righttd">
                    &nbsp;<asp:DropDownList ID="DrpTypeFlag" runat="server" onchange="showPayMent()">
                        <asp:ListItem Value="0">在线支付</asp:ListItem>
                        <asp:ListItem Value="1">余额支付</asp:ListItem>
                        <asp:ListItem Value="2">货到付款</asp:ListItem>
                        <asp:ListItem Value="3">其它</asp:ListItem>
                    </asp:DropDownList></td>
            
            </tr>
          <tbody id="showPayment">
            <tr>
                <td align="right" class="lefttd" height="30" style="width: 198px">
                    <strong>选择支付平台：</strong></td>
                <td class="righttd"><asp:CheckBoxList ID="CkbPayemntID" runat="server" RepeatColumns="5" RepeatDirection="Horizontal">
                    </asp:CheckBoxList></td>
            </tr>
          </tbody>
             <tr>
                 <td align="right" class="lefttd" style="width: 198px; height: 30px">
                     <strong>折扣率：</strong>
                     </td>
                 <td class="righttd" style="height: 30px">
                     &nbsp;<asp:TextBox CssClass="textbox" ID="TxtDiscount" Text="100" runat="server" Width="41px"></asp:TextBox>% 采用此支付方式享受的折扣</td>
             </tr>
             <tr>
                 <td align="right" class="lefttd" style="width: 198px; height: 30px">
                     <strong>付款方式介绍：</strong></td>
                 <td class="righttd" style="height: 30px">
                 <asp:TextBox ID="Content" TextMode="multiLine" style="width:80%;height:200px;" runat="server"></asp:TextBox>
                 <% Kesion.APPCode.EditorAPI.EchoEditor("editor", this.Content.ClientID, "Basic");%>
                 </td>
             </tr>
            
             <tr>
                 <td align="right" class="lefttd" style="width: 198px; height: 30px">
                     <strong>状态： </strong></td>
                 <td class="righttd" style="height: 30px">
                     <asp:RadioButtonList ID="RdbStatus" runat="server" RepeatDirection="Horizontal">
                         <asp:ListItem Selected="True" Value="1">正常</asp:ListItem>
                         <asp:ListItem Value="0">禁用</asp:ListItem>
                     </asp:RadioButtonList></td>
             </tr>             
             <tr>
                 <td align="right" class="lefttd" style="width: 198px; height: 30px">
                     <strong>设置成默认配置方式：<br />
                     </strong></td>
                 <td class="righttd" style="height: 30px">
                    <asp:CheckBox ID="CkbIsDefault" runat="server" Text="默认" />
                     </td>
             </tr>             
             
        </table>
        <br />
        <KS:Foot ID="Foot1" runat="server" OnSubmit="Foot1_Submit" SubmitButtonText="确定添加(0)" />
    
    </asp:Panel>
    

  </asp:Content>