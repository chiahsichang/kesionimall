<%@ Page Language="C#" EnableEventValidation="false"  MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.Admin.Shop.Admin_ShopSpecial" Title="商品规格管理" Codebehind="KS.ShopSpecial.aspx.cs" %>
<%@ Import Namespace="Kesion.BLL" %>
<asp:Content ID="Content1" ContentPlaceHolderID="KSContent" Runat="Server">
     <asp:Panel ID="SpecificationList" runat="server" Width="100%">
      <div id="manage_top" class="menu_top_fixed">
        <ul>
           <li id='p1'><asp:LinkButton ID="addSpecification" runat="server" OnClick="addSpecification_Click"><b></b>添加规格组</asp:LinkButton></li>
           <li id='p4'><asp:LinkButton ID="editSpecification" runat="server" OnClick="editSpecification_Click"><b></b>编辑</asp:LinkButton></li>
           <li id='p3'><asp:LinkButton ID="delSpecificationBtn" runat="server" OnClick="delSpecification_Click"><b></b>删除</asp:LinkButton></li>
           <li id='p8'><a href="KS.ShopSpecification.aspx"><b></b>规格属性管理</a></li>
           <li id='p5'><a href="KS.ShopSpecialBindClass.aspx"><b></b>栏目批量绑定规格组</a></li>
        </ul>
      </div>   
       <div class="menu_top_fixed_height"></div>
       <KS:KSGV ID="list" cssclass="CTable" runat="server" AutoGenerateColumns="False" Width="99%" EmptyDataText="没有添加任何商品规格组!" GridLines="None" OnRowDataBound="list_RowDataBound" OnRowCommand="list_RowCommand" OnRowCreated="list_RowCreated">
          <Columns>
              <asp:TemplateField HeaderText="<input type='checkbox' name='chkall' id='chkall' onclick='CheckAll(this.form);'/>">
                <itemstyle horizontalalign="Center" width="50px" />
                <itemtemplate>
                    <input type="checkbox"  name="ids" id="ids" value='<%#Eval("id") %>' />
                </itemtemplate>
              </asp:TemplateField>
             <asp:TemplateField HeaderText="规格组名称">
              <itemstyle Width="160px"></itemstyle>
             <itemtemplate>
             <%# Eval("Title") %> 
             </itemtemplate>
             </asp:TemplateField> 
             <asp:TemplateField HeaderText="绑定规格属性项">
             <itemstyle/>
             <itemtemplate>
             <span class="tips"><%# GetBindClassList(Convert.ToInt16(Eval("id"))) %></span>
             </itemtemplate>
             </asp:TemplateField>
             
            <asp:TemplateField HeaderText="属性排序">
              <itemstyle width="30px" horizontalalign="Center"/>
              <itemtemplate>
               <asp:LinkButton ID="LKOrder" ToolTip="属性排序" CssClass="order" runat="server" commandargument=<%#Eval("id") %> commandname="order">排序</asp:LinkButton>
              </itemtemplate>
            </asp:TemplateField>
                
            <asp:TemplateField HeaderText="编辑">
              <itemstyle width="30px" horizontalalign="Center"/>
              <itemtemplate>
               <asp:LinkButton ID="LinkButton1" CssClass="edit" ToolTip="编辑" runat="server" commandargument=<%#Eval("id") %> commandname="modify"></asp:LinkButton>
              </itemtemplate>
            </asp:TemplateField>
             
            <asp:TemplateField HeaderText="删除">
                <itemstyle horizontalalign="Center" Width="30px" />
               <itemtemplate>
                <asp:LinkButton CssClass="delete" ToolTip="删除" runat="server" id="delete" commandargument=<%#Eval("id") %> commandname="del"></asp:LinkButton>
               </itemtemplate>
            </asp:TemplateField>
          </Columns>
            <HeaderStyle CssClass="CTitle" />
            <EmptyDataRowStyle CssClass="emptycss" />
      </KS:KSGV>
       <KS:Page ID="Page1" runat="server" />
    </asp:Panel>
    
    <asp:Panel ID="SpecificationManage" runat="server" Width="100%" Visible="false">
        <KS:TopNav ID="TopNav1" runat="server" />
       <script>
        function CheckForm() {
   
	        if (jQuery('#<%=this.TxtTitle.ClientID %>').val()==''){
	            KesionJS.Alert( '请输入商品规格组名称！', "jQuery('#<%=this.TxtTitle.ClientID %>').focus()");
	          return false;
	        }
	
	        if (jQuery("#<%=this.LsbSpecialItems.ClientID%> option:selected").val()==undefined){
	            KesionJS.Alert('请选择绑定的规格属性！', "jQuery('#<%=this.LsbSpecialItems.ClientID%>').focus()");
	         return false;
        }

        return true;
        }
        </script>
        
        <table width="99%" align="center" border="0" cellpadding="1" cellspacing="1" class="CTable"> 
          <tr>
            <td class="lefttd" height="30" align="right" style="width: 198px"><strong>规格组名称：</strong></td>
            <td class="righttd"><asp:TextBox CssClass="textbox" ID="TxtTitle" runat="server"></asp:TextBox>
                <span class="tips">如:服装类规格，手机类规格等</span>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TxtTitle"
                    ErrorMessage="请输入商品规格组名称!"></asp:RequiredFieldValidator>
            </td>
          </tr>

           
            <tr>
                <td align="right" class="lefttd" height="30" style="width: 198px">
                    <strong><span style="background-color: #f0f9fe">绑定规格属性</span>：</strong></td>
                <td class="righttd">
                    <asp:ListBox ID="LsbSpecialItems" runat="server" Width="250px" Height="200px" SelectionMode="Multiple">

                    </asp:ListBox>
                    <a href="KS.ShopSpecification.aspx">管理规格属性</a>
                  
                    <br />
                    说明：<br />
                    <span class="tips">
                     1、按Crtl或Shife多选,最多只能同时绑定三个规格属性项；<br />
                     2、绑定规格属性项后，应该尽量不要再做修改了，以免影响已添加的商品规格属性；
                    </span>
                 </td>
            </tr>
            
           
		</table>
	  	   <input type='hidden' name="num" id="num" value="<%=num%>"/>
	  	   
	  	   
                </td>
            </tr>
            
           
        </table>
      <br />
      <KS:Foot ID="Foot1" runat="server" OnSubmit="Foot1_Submit" />
    </asp:Panel>


    <asp:Panel ID="PannelOrder" Visible="false" runat="server">
         <div id="manage_top" class="toptitle menu_top_fixed"><ul><li id='p9'><b></b><a href='KS.ShopSpecial.aspx'>返回</a></li> [<%=groupName %>]属性项排序</div><div class="menu_top_fixed_height"></div> 

         <KS:OrderJS ID="OrderJS1" runat="server" />
        <KS:KSGV ID="FieldListView" runat="server" AutoGenerateColumns="False" GridLines="None"
            OnRowDataBound="FieldListView_RowDataBound" EmptyDataText="没有规格属性项！" PagerType="CustomNumeric" Width="99%" CssClass="CTable" EnableTheming="True">
            <Columns>
                 <asp:BoundField DataField="ID" HeaderText="ID号">
                    <itemstyle width="50px" ForeColor="#999999" horizontalalign="Center" />
                </asp:BoundField>
                 <asp:BoundField DataField="Title" HeaderText="属性名称">
                    <itemstyle width="100px" ForeColor="#999999" horizontalalign="Center" />
                </asp:BoundField>
                <asp:TemplateField HeaderText="排序">
                    <itemstyle  horizontalalign="left"  />
                    <itemtemplate>
                     <asp:DropDownList id="orderid" datasource="<%#bindorder() %>" runat="server"></asp:DropDownList>
                    </itemtemplate>
                 </asp:TemplateField>
            </Columns>
            <HeaderStyle CssClass="CTitle" />
        </KS:KSGV>
         <div style="margin:20px;text-align:center;">
        <asp:Button ID="BtnBatchSave" runat="server" Text="批量保存排序" CssClass="button" OnClick="BtnBatchSave_Click" />
         </div>
    </asp:Panel>
    
</asp:Content>

