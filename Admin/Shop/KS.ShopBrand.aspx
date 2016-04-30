<%@ Page Language="C#" EnableEventValidation="false"  MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.Admin.Shop.Admin_ShopBrand" Title="商品品牌管理" Codebehind="KS.ShopBrand.aspx.cs" %>
<%@ Import Namespace="Kesion.BLL" %>
<%@ Import Namespace="Kesion.HtmlTags" %>
<asp:Content ID="Content1" ContentPlaceHolderID="KSContent" Runat="Server">
     <asp:Panel ID="BrandList" runat="server" Width="100%">
      <div id="manage_top" class="menu_top_fixed">
        <ul>
           <li id='p1'><asp:LinkButton ID="addBrand" runat="server" OnClick="addBrand_Click"><b></b>添加商品品牌</asp:LinkButton></li>
           <li id='p4'><asp:LinkButton ID="editBrand" runat="server" OnClick="editBrand_Click"><b></b>编辑商品品牌</asp:LinkButton></li>
           <li id='p3'><asp:LinkButton ID="delBrandBtn" runat="server" OnClick="delBrand_Click"><b></b>删除商品品牌</asp:LinkButton></li>
           <li id='p10'><a href="?action=total"><b></b>一键重计所有品牌下的商品数</a></li>
        </ul>
      </div>   
      <div class="menu_top_fixed_height"></div>
       <KS:KSGV ID="list" cssclass="CTable" runat="server" AutoGenerateColumns="False" Width="99%" EmptyDataText="没有添加任何商品品牌!" GridLines="None" OnRowDataBound="list_RowDataBound" OnRowCommand="list_RowCommand" OnRowCreated="list_RowCreated">
          <Columns>
              <asp:TemplateField HeaderText="<input type='checkbox' name='chkall' id='chkall' onclick='CheckAll(this.form);'/>">
                <itemstyle horizontalalign="Center"/>
                <itemtemplate>
                    <input type="checkbox"  name="ids" id="ids" value='<%#Eval("id") %>' />
                </itemtemplate>
              </asp:TemplateField>
             <asp:TemplateField HeaderText="品牌图片">
             <itemstyle  width="80px" />
             <itemtemplate>
                   <a href="<%# BasicField.GetBrandUrl(Convert.ToInt32(Eval("id").ToString())) %>" target="_blank"><img onerror="this.src='../../sysimg/nopic.gif';" style="border:1px solid #efefef;padding:1px" src="<%# GetPhotoUrl(Convert.ToString(Eval("PhotoUrl"))) %>" width="88" height="31" /></a>
           </itemtemplate>
             </asp:TemplateField>
             <asp:TemplateField HeaderText="品牌名称">
             <itemtemplate>
             <%# Eval("BrandName") %> 
             <%# Convert.ToInt16(Eval("Recommend"))==1?"<i style=color:red>(荐)</i>":string.Empty %>
             </itemtemplate>
             </asp:TemplateField> 
             <asp:TemplateField HeaderText="绑定分类">
             <itemstyle />
             <itemtemplate>
              <span class="tips"><%# GetBindClassList(Convert.ToInt32(Convert.ToString(Eval("id"))))%></span>
            </itemtemplate>
             </asp:TemplateField>
             <asp:TemplateField HeaderText="商品数">
             <itemstyle />
             <itemtemplate>
              <font color=red><%# Eval("num")%></font> 件
              <asp:LinkButton runat="server" id="managepro" commandargument=<%#Eval("id") %> commandname="managePro">添加商品</asp:LinkButton>
            </itemtemplate>
             </asp:TemplateField>
            
             <asp:BoundField DataField="firstAlphabet" HeaderText="首字母">
                  <itemstyle horizontalalign="Center" width="40px" />
             </asp:BoundField>
            
            
             <asp:BoundField DataField="OrderID"  HeaderText="序号">
                  <itemstyle horizontalalign="Center" width="40px" />
                </asp:BoundField>
                
           <asp:TemplateField HeaderText="编辑">
              <itemstyle width="30px" horizontalalign="Center"/>
              <itemtemplate>
             <asp:LinkButton ID="LinkButton1" CssClass="edit" ToolTip="编辑" runat="server" commandargument=<%#Eval("id") %> commandname="modify"></asp:LinkButton>
              </itemtemplate>
            </asp:TemplateField>
             
            <asp:TemplateField HeaderText="删除">
                <itemstyle horizontalalign="Center" width="30px"/>
               <itemtemplate>
                <asp:LinkButton runat="server" ToolTip="删除" CssClass="delete" id="delete" commandargument=<%#Eval("id") %> commandname="del"></asp:LinkButton>
               </itemtemplate>
            </asp:TemplateField>
          </Columns>
            <HeaderStyle CssClass="CTitle" />
            <EmptyDataRowStyle CssClass="emptycss" />
      </KS:KSGV>

    <KS:Page ID="Page1" runat="server" />
        
    </asp:Panel>
    
    <asp:Panel ID="BrandManage" runat="server" Width="100%" Visible="false">
    
        <KS:TopNav ID="TopNav1" runat="server" />
       
       <script>
        function CheckForm() {
            if (jQuery('#<%=this.TxtBrandName.ClientID %>').val() == '') {
                KesionJS.Alert( '请输入商品品牌名称！', "jQuery('#<%=this.TxtBrandName.ClientID %>').focus()");
                return false;
            }
            if (jQuery('#<%=this.TxtBrandEname.ClientID %>').val() == '') {
                KesionJS.Alert( '请输入商品品牌英文名称！', "jQuery('#<%=this.TxtBrandEname.ClientID %>').focus()");
                return false;
            }
        	
	        if (jQuery("#classid option:selected").val()==undefined){
	            KesionJS.Alert( '请选择绑定的商品栏目！', "jQuery('#classid').focus()");
	         return false;
	        }
	        if (editor.hasContents()==false){
	            KesionJS.Alert("请输入品牌介绍！","editor.focus()");
	            return false;
	        }

        return true;
        }

</script>
        
        <table width="99%" align="center" border="0" cellpadding="1" cellspacing="1" class="CTable"> 
          <tr>
            <td class="lefttd" height="30" align="right" style="width: 132px"><strong>商品品牌名称：</strong></td>
            <td class="righttd">
                &nbsp;<asp:TextBox CssClass="textbox" ID="TxtBrandName" runat="server"></asp:TextBox> <span class="tips">如： 三星，飞利浦等。</span>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TxtBrandName"
                    ErrorMessage="请输入商品品牌名称!"></asp:RequiredFieldValidator>
            </td>
          </tr>
          <tr>
            <td class="lefttd" height="30" align="right" style="width: 132px"><strong>品牌英文名称：</strong></td>
            <td class="righttd">
                &nbsp;<asp:TextBox CssClass="textbox" ID="TxtBrandEname" runat="server"></asp:TextBox> <span class="tips">如: SamSung等。</span>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TxtBrandName"
                    ErrorMessage="请输入商品品牌英文名称!"></asp:RequiredFieldValidator>
            </td>
          </tr>
           
            <tr>
                <td align="right" class="lefttd" height="30" style="width: 132px">
                    <strong>品牌首字母：</strong></td>
                <td class="righttd">
                   &nbsp;<asp:DropDownList ID="DrpFirstAlphabet" runat="server"></asp:DropDownList>
                   
                   </td>
            </tr>
           
            <tr>
                <td align="right" class="lefttd" height="30" style="width: 132px">
                    <strong>排 序 号：</strong></td>
                <td class="righttd">
                    &nbsp;<asp:TextBox ID="TxtOrderID" Text="1"  CssClass="textbox" style="text-align:center" runat="server" Width="56px"></asp:TextBox><span style="color: #999">值越小排在越前面。</span></td>
            </tr>
            
            

            <tr>
                <td align="right" class="lefttd" height="30" style="width: 132px">
                    <strong><span style="background-color: #f0f9fe">绑定分类</span>：</strong></td>
                <td class="righttd">
                    &nbsp;<select name="classid" id="classid" style="width:250px" multiple="multiple" size="5">
                    <%=ClassManage.GetClassByBasicModel(4,"0") %>
                    </select>
                    <br />
                    <span style="color:Red">按Crtl或Shife多选</span>
                    <% if (!string.IsNullOrEmpty(SClassID))
                        {
                        %>
                    <script>
                     function selectclassid(v) {
                            var va = v.split(',');
                            for (var i = 0; i < jQuery("#classid")[0].options.length; i++) {
                                for (var n = 0; n < va.length; n++) {
                                    if (va[n] == jQuery("#classid")[0].options[i].value) {
                                        jQuery("#classid")[0].options[i].selected = true;
                                    }
                                }
                            }
                        }
                        selectclassid('<%=SClassID %>');
                    </script>
                    <%
                        }     
                    %>
                    
                 </td>
            </tr>
            
            <tr>
                 <td align="right" class="lefttd" style="width: 132px; height: 30px">
                     <strong>详细介绍：</strong></td>
                 <td class="righttd" style="height: 30px">
                 <asp:TextBox ID="TxtContent" TextMode="multiLine" style="width:80%;height:200px" runat="server"></asp:TextBox>
                <% Kesion.APPCode.EditorAPI.EchoEditor("editor", this.TxtContent.ClientID, "Basic");%>

                 </td>
             </tr>
            <tr>
                 <td align="right" class="lefttd" style="width: 132px; height: 30px">
                     <strong>品牌图片：</strong></td>
                 <td class="righttd" style="height: 30px">
                 &nbsp;<asp:TextBox CssClass="textbox" ID="TxtPhotoUrl" runat="server" width="250px"></asp:TextBox>
          &nbsp;<input type="button" class="button" onclick="SelectFiles('<%=this.TxtPhotoUrl.ClientID %>',4);" value="选择图片...">
                 </td>
             </tr>
            <tr>
                 <td align="right" class="lefttd" style="width: 132px; height: 30px">
                     <strong>品牌绑定模板：</strong></td>
                 <td class="righttd" style="height: 30px">
                 &nbsp;<asp:TextBox CssClass="textbox" Text="{$TemplateDir}/商城系统/品牌详细.html" ID="TxtTemplateFile" runat="server" width="250px"></asp:TextBox>
          &nbsp; <input class="button" 
                        onClick="SelectTemplate('<%=this.TxtTemplateFile.ClientID %>');" 
                        onmouseout="this.className='button';" onmouseover="this.className='button_on';" 
                        type="button" value="选择模板..." /></td>
             </tr>
            <tr>
                 <td align="right" class="lefttd" style="width: 132px; height: 30px">
                     <strong>是否推荐：</strong></td>
                 <td class="righttd" style="height: 30px">
                 
                  <asp:RadioButtonList ID="RdbRecommend" runat="server" RepeatDirection="Horizontal">
                   <asp:ListItem Value="0">否</asp:ListItem>
                   <asp:ListItem Value="1">是</asp:ListItem>
                  </asp:RadioButtonList>
                 </td>
             </tr>

            
           
        </table>
      <br />
      <KS:Foot ID="Foot1" runat="server" OnSubmit="Foot1_Submit" />
      
    </asp:Panel>
    
</asp:Content>

