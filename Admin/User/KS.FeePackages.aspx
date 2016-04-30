<%@ Page Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true"  Inherits="Kesion.NET.WebSite.Admin_UserFeePackages" Title="Untitled Page" Codebehind="KS.FeePackages.aspx.cs" %>
<%@ Import Namespace="Kesion.Cache"%>
<asp:Content ID="Content1" ContentPlaceHolderID="KSContent" Runat="Server">
    <asp:Panel ID="ListPanel" runat="server" Width="100%">
        <div id="manage_top" class="menu_top_fixed">
       <ul>
           <li id='p1'><asp:LinkButton ID="addclassbutton" runat="server" OnClick="addclassbutton_Click"><b></b>添加收费套餐</asp:LinkButton></li>
           <li id='p4'><asp:LinkButton ID="editclassbutton" runat="server" OnClick="editclassbutton_Click"><b></b>编辑收费套餐</asp:LinkButton></li>
           <li id='p3'><asp:LinkButton ID="delclassbutton" runat="server" OnClick="delclassbutton_Click"><b></b>删除收费套餐</asp:LinkButton></li></ul>
    </div>  
 <div class="menu_top_fixed_height"></div>  
        <KS:KSGV ID="List" cssclass="CTable" runat="server" GridLines="None" AutoGenerateColumns="False" EmptyDataText="没有添加任何收费套餐" PagerType="CustomNumeric" Width="99%" OnRowDataBound="List_RowDataBound" OnRowCreated="List_RowCreated" OnRowCommand="List_RowCommand" HorizontalAlign="Center">
            <Columns>
             <asp:TemplateField HeaderText="选择">
                <itemtemplate>
                <input type="checkbox"  name="ids" id="ids" value="<%#Eval("id") %>" />
                </itemtemplate>
                <itemstyle horizontalalign="Center" Height="30px" width="50px" />
            </asp:TemplateField>
                <asp:BoundField DataField="id" HeaderText="ID" Visible="false">
                    <itemstyle horizontalalign="Center" width="25px" />
                </asp:BoundField>

                <asp:TemplateField HeaderText="状态">
                  <itemstyle width="30px" horizontalalign="Center"/>
                  <itemtemplate>
                       <a href="?action=status&id=<%#Eval("id")%>" <%# Convert.ToString(Eval("status"))=="1"?"class='ok' title='正常销售'":"class='no' title='停止销售'" %>></a>
                  </itemtemplate>
                </asp:TemplateField>

                <asp:BoundField DataField="title" HeaderText="收费套餐名称">
                    <itemstyle width="120px" />
                </asp:BoundField>

                 <asp:TemplateField HeaderText="简要说明">
                  <itemstyle />
                  <itemtemplate>
                   <span class="tips"><%# Eval("descript") %></span>
                  </itemtemplate>
                </asp:TemplateField>
                 <asp:TemplateField HeaderText="销售价">
                    <itemtemplate>
                     <%=MyCache.GetCurrencySymbol %><%# Kesion.APPCode.Public.ReturnShopPrice(Convert.ToString(Eval("price"))) %><%=MyCache.GetCurrencyUnit %>
                    </itemtemplate>
                    <itemstyle horizontalalign="Center" width="80px" />
                </asp:TemplateField>
               
               
                <asp:TemplateField HeaderText="已销售份数">
                    <itemtemplate>
                     <%# GetUserNum(Convert.ToInt32(Eval("ID"))) %>
                    </itemtemplate>
                    <itemstyle horizontalalign="Center" width="80px" />
                </asp:TemplateField>

                 <asp:TemplateField HeaderText="编辑">
                  <itemstyle horizontalalign="Center" width="25px"/>
                  <itemtemplate>
                     <asp:LinkButton CssClass="edit" ToolTip="编辑" ID="LinkButton1" runat="server" commandargument=<%#Eval("id") %> commandname="modify"></asp:LinkButton>
                  </itemtemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="删除">
                    <itemtemplate>
                         <asp:LinkButton CssClass="delete" ToolTip="删除" runat="server" id="delete" commandargument=<%#Eval("id") %> commandname="del"></asp:LinkButton>
                    </itemtemplate>
                    <itemstyle horizontalalign="Center" width="25px" />
                </asp:TemplateField>
            </Columns>
            <EmptyDataRowStyle CssClass="emptycss" />
        <HeaderStyle CssClass="CTitle" />
        </KS:KSGV>
        
        <KS:Page ID="Page1" runat="server" />
    </asp:Panel>
    
    
    
    <asp:Panel ID="AddPanel" runat="server" Width="100%" Visible="false">
        <KS:TopNav ID="TopNav1" runat="server" Text="新增收费套餐" />

      <table width="99%" align="center" border="0" cellpadding="1" cellspacing="1" class="CTable"> 
          <tr>
            <td class="lefttd" height="30" align="right" style="width: 158px"><b>收费套餐名称：</b></td>
            <td class="righttd">
                &nbsp;<asp:TextBox CssClass="textbox" ID="TxtTitle" runat="server" Width="268px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TxtTitle"
                    ErrorMessage="请填写收费套餐名称!" Display="Dynamic"></asp:RequiredFieldValidator></td>
          </tr>
          <tr>
              <td align="right" class="lefttd" height="30" style="width: 158px">
                  <strong>套餐简要介绍：</strong></td>
              <td class="righttd">
                  &nbsp;<asp:TextBox CssClass="textbox" ID="TxtDescript" runat="server" Height="89px" TextMode="MultiLine" Width="325px"></asp:TextBox></td>
          </tr>
          <tr>
              <td align="right" class="lefttd" height="30" style="width: 158px">
                  <strong>此套餐售价：</strong></td>
              <td class="righttd">
              &nbsp;<asp:TextBox ID="TxtPrice" runat="server" CssClass="textbox" Text="100" Width="50px" style="text-align:center"></asp:TextBox> <%=MyCache.GetCurrencyUnit %></td>
          </tr>
          <tr>
              <td align="right" class="lefttd" height="30" style="width: 158px">
                  <strong>此套餐有效天数：</strong></td>
              <td class="righttd">
              &nbsp;<asp:TextBox ID="TxtDays" runat="server" Text="30" CssClass="textbox" Width="50px" style="text-align:center"></asp:TextBox> 天</td>
          </tr>
          <tr>
              <td align="right" class="lefttd" height="30" style="width: 158px">
                  <strong>用户组购买折扣：</strong></td>
              <td class="righttd">
                  
               <asp:Label ID="LabGroup" runat="server"></asp:Label>    
              </td>
          </tr>
        
          <tr>
                  <td align="right" class="lefttd" style="width: 158px; height: 30px">
                      <strong>套餐状态：</strong></td>
                  <td class="righttd" style="height: 30px">
                      <asp:RadioButtonList ID="RdbStatus" runat="server" RepeatDirection="Horizontal">
                       <asp:ListItem Value="1" Selected="True">正常销售</asp:ListItem>
                       <asp:ListItem Value="0">停止销售</asp:ListItem>
                   </asp:RadioButtonList></td>
              </tr>
          <tr>
                  <td align="right" class="lefttd" style="width: 158px; height: 30px">
                      <strong>权限设置：</strong></td>
                  <td class="righttd" style="height: 30px">
                      <asp:RadioButtonList ID="RdbLimit" runat="server">
                       <asp:ListItem Value="1" Selected="True">在有效期内可以查看所有需要收费的内容</asp:ListItem>
                       <asp:ListItem Value="0">按模块设置权限</asp:ListItem>
                   </asp:RadioButtonList>
                   
                   
                   <table border="0" id="purview" runat="server" cellpadding="2" cellspacing="3">
                    <tr>
                     <td>
                      <strong>内容模型权限：</strong>
                     </td>
                     <td>
                      <asp:RadioButtonList ID="RdbContentTF" runat="server">
                       <asp:ListItem Value="0">无权限</asp:ListItem>
                       <asp:ListItem Value="1" Selected="True">拥有所有权限</asp:ListItem>
                       <asp:ListItem Value="2">指定有权限查看的栏目</asp:ListItem>
                      </asp:RadioButtonList>
                     
                     </td>
                    
                      <td>
                      
                      
                  <div style="border: 5px solid #E7E7E7;" id="contentclass" runat="server"> 
                        <strong>详细指定栏目权限</strong>
                        <table border="0" cellspacing="0" cellpadding="0">
                          <tr> 
                            <td>
                             <select name="classid" id="classid" multiple="multiple" size="10" style="width: 300px">
                               <%=MyCache.GetClassOptionList(0)%>
                              </select> 
                              
                              <div class="tips">
                              可以按CTRL或Shift键多选。
                              </div>
                              
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
                              </script>
                            </td>
                          </tr>
                          
                         </table>
                         
                    </div>
                      
                      </td>
                    </tr>
                    
                    <tr>
                     <td>
                      <strong>考试系统权限：</strong>
                     </td>
                     <td>
                      <asp:RadioButtonList ID="RdbExamTF" runat="server">
                      <asp:ListItem Value="0">无权限</asp:ListItem>
                       <asp:ListItem Value="1" Selected="True">拥有所有权限</asp:ListItem>
                       <asp:ListItem Value="2">指定有权限查看的栏目</asp:ListItem>
                      </asp:RadioButtonList>
                     
                     </td>
                    <td>
                      
                     
                  <div style="border: 5px solid #E7E7E7;" id="examclass" runat="server"> 
                   <strong>详细指定栏目权限</strong>
                        <table border="0" cellspacing="0" cellpadding="0">
                          <tr> 
                            <td>
                             <asp:ListBox ID="LstSJClassID" Rows="10" runat="server" style="width:300px" SelectionMode="Multiple">
                </asp:ListBox> <div class="tips">
                              可以按CTRL或Shift键多选。
                              </div>
                            </td>
                          </tr>
                          
                         </table>
                        
                    </div>
                      
                      </td>
                    </tr>
                   
                   </table>
                   
                   
                   
                   
                   </td>
              </tr>


               
          
               
               
       </table>
       
       <script type="text/javascript">
           function showpurview() {
               var checkrad = jQuery("#<%=this.RdbLimit.ClientID %> :radio[checked]").val();
               if (checkrad == "1") {
                   jQuery("#<%=this.purview.ClientID%>").hide();
               } else {
               jQuery("#<%=this.purview.ClientID%>").show();
               }
           }
           function showcontentclass() {
               var checkrad = jQuery("#<%=this.RdbContentTF.ClientID %> :radio[checked]").val();
               if (checkrad == "2") {
                   jQuery("#<%=this.contentclass.ClientID%>").show();
               } else {
               jQuery("#<%=this.contentclass.ClientID%>").hide();
               }
           }
           function showexamclass() {
               var checkrad = jQuery("#<%=this.RdbExamTF.ClientID %> :radio[checked]").val();
               if (checkrad == "2") {
                   jQuery("#<%=this.examclass.ClientID%>").show(); 
               } else {
               jQuery("#<%=this.examclass.ClientID%>").hide();
               }
           }

           jQuery(document).ready(function() {
               showpurview();
               showcontentclass();
               showexamclass();
           });
	</script>
        <br />
        <KS:Foot ID="Foot1" runat="server" OnSubmit="Foot1_Submit" />
    </asp:Panel>
</asp:Content>

