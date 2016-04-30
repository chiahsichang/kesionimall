<%@ Page Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.Admin_ShopGroupBuyClass" Title="Untitled Page" Codebehind="KS.ShopGroupBuyClass.aspx.cs" %>
<asp:Content ID="Content1" ContentPlaceHolderID="KSContent" Runat="Server">
 <div id="manage_top">
         <ul>
           <li id='p1'><asp:LinkButton ID="addserver" runat="server" OnClick="addserver_Click"><b></b>添加团购分类</asp:LinkButton></li>
           <li id='p5'><asp:LinkButton ID="editserver" runat="server" CausesValidation="False" OnClick="editserver_Click"><b></b>团购分类排序</asp:LinkButton></li>
           <li id='p5'><asp:LinkButton ID="LinkButton2" runat="server" 
                   CausesValidation="False" onclick="LinkButton2_Click"><b></b>一键重计各个分类下的商品</asp:LinkButton></li>
           <li id='p9'><asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" OnClick="LinkButton1_Click"><b></b>回上一级</asp:LinkButton></li></ul>
        </div>  
         <div class="menu_top_fixed_height"></div>

    <asp:Panel ID="Panel1" runat="server" Width="100%">
    
      <KS:KSGV ID="list" CssClass="CTable" runat="server" AutoGenerateColumns="False" PagerType="CustomNumeric" align="center" Width="99%" EmptyDataText="没有添加任何团购分类" GridLines="None" OnRowDataBound="list_RowDataBound" OnRowCommand="list_RowCommand" OnRowCreated="list_RowCreated" PageSize="20">
          <Columns>
          <asp:TemplateField HeaderText="选择">
                <ItemStyle HorizontalAlign="Center"  Width="40px"/>
                <ItemTemplate>
                <input type="checkbox"  name="ids" id="ids" value="<%#Eval("classid") %>" />
             </ItemTemplate>
                </asp:TemplateField>
              <asp:BoundField DataField="parentid" HeaderText="父ID">
                  <itemstyle horizontalalign="Center" width="50px" />
              </asp:BoundField>
              <asp:TemplateField HeaderText="团购分类名称">
                  <itemtemplate>
                    <%# GetServerName(Convert.ToInt16(Eval("parentid")),Convert.ToString(Eval("ClassName")),Convert.ToString(Eval("child")))%>
                    <%# Convert.ToInt16(Eval("islock"))==1?"<span style='color:red'>锁</span>":string.Empty %>
                  </itemtemplate>
              </asp:TemplateField>
              <asp:TemplateField HeaderText="排序">
                  <itemtemplate>

                <table border="0" cellpadding="0" cellspacing="0" align="center">
                <tr>
                <td style="width: 50%" nowrap>
                
                       <asp:DropDownList ID="DropUpOrder" runat="server" AutoPostBack="False">
                          <asp:ListItem Selected="True" Value="0">↑向上</asp:ListItem>
                         </asp:DropDownList>&nbsp;<asp:Button runat="server" ID="UpButton" onmouseover="this.className='button_on';" onmouseout="this.className='button';" class="button" Text="移动" commandname="uporder" commandargument=<%#Eval("orders") %>></asp:Button>

              </td>
              <td style="width: 50%">
               <asp:DropDownList ID="DropDownOrder" runat="server" AutoPostBack="False">
                  <asp:ListItem Selected="True" Value="0">↓向下</asp:ListItem>
               </asp:DropDownList>&nbsp;<asp:Button ID="DownButton" onmouseover="this.className='button_on';" onmouseout="this.className='button';" class="button" Text="移动" commandname="downorder" commandargument=<%#Eval("orders") %> runat="server" />
            </td>
            </table>
            
                <asp:TextBox runat="server" text='<%#Eval("rootid") %>' id='rootid' style='display:none'></asp:TextBox>
                <asp:TextBox runat="server" text='<%#Eval("ClassID") %>' id='ClassID' style='display:none'></asp:TextBox>
            
                </itemtemplate>
              </asp:TemplateField>
               <asp:BoundField DataField="orders" HeaderText="orders">
                  <itemstyle horizontalalign="Center" width="40px" />
              </asp:BoundField>

              <asp:TemplateField HeaderText="↓管理操作">
                <itemstyle width="150px" horizontalalign="Center" />
             <itemtemplate>
             <div style="text-align:right">
             <asp:LinkButton runat="server" id="addsub" commandargument='<%#Eval("ClassID") %>' commandname="addsub">添加子分类</asp:LinkButton>
             <asp:LinkButton runat="server" commandargument=<%#Eval("ClassID") %> commandname="modify">修改</asp:LinkButton>
             <asp:LinkButton runat="server" id="delete" commandargument=<%#Eval("ClassID") %> commandname="del">删除</asp:LinkButton>
             <a href="../../shop/groupbuyindex.aspx?<%# Convert.ToInt16(Eval("parentid"))==0?"pid-"+Eval("classid"):"pid-"+ Eval("parentid") +",classid-"+ Eval("classid") %>" target="_blank">预览</a>
            </div>
</itemtemplate>
            </asp:TemplateField>
             
          </Columns>
             <HeaderStyle CssClass="CTitle" />
            <EmptyDataRowStyle CssClass="emptycss" />
      </KS:KSGV>
      
      &nbsp;&nbsp;<input type="checkbox" name="chkall" id="chkall" onclick="CheckAll(this.form);"/><label for="chkall">全部选中</label>
            &nbsp;<input type="button" value="删除选中的分类" onmouseover="this.className='button_on';" onmouseout="this.className='button';" class="button" onclick="if (GetIDS('del')){this.form.action='?action=del';this.form.submit()}" />
      
      <KS:Page ID="Page1" runat="server" />
       <br />
        <script type="text/javascript">
            showtips('<span class="state"><strong>说明：</strong><br /></span>团购分类建议尽量不要删除，遵循“宁可改也不删除”的原则!');
		</script>
    </asp:Panel>

         
    <asp:Panel ID="Panel2" runat="server" Width="100%" Visible="false">
    <script language="javascript">

            function CheckForm()
            {
             if (jQuery('#<%=this.TxtClassName.ClientID%>').val()=='')
             {
                 KesionJS.Alert('请输入团购分类名称!', "jQuery('#<%=this.TxtClassName.ClientID%>').focus();");
              return false;
             }

             return true;
            }
            
        
            </script>
            <table width="99%" align="center" border="0" cellspacing="1" cellpadding="1" align=center>
             <tr>
             <td class="lefttd" align="right"><b>所属类别：</b></td>
             <td class="righttd">
              <asp:DropDownList ID="DrpParentId" runat="server">
              </asp:DropDownList>
             </td>
            </tr>
             <tr>
             <td class="lefttd" align="right"><b>团购分类名称：</b></td>
             <td class="righttd"> <asp:TextBox TextMode="MultiLine" Width="300" Height="120" CssClass="textbox" ID="TxtClassName" runat="server"></asp:TextBox>
                 <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TxtClassName"
                     ErrorMessage="请输入团购分类名称"></asp:RequiredFieldValidator>
                     
                     <div class="tips" id='tips' runat="server">
                      TIPS：可以批量输入分类，一行表示一个分类名称。
                     </div>
                     </td>
            </tr>
 
                 <tr>
                     <td align="right" class="lefttd" style="height: 30px">
                         <strong>团购分类状态：</strong></td>
                     <td class="righttd" style="height: 30px">
                         <asp:RadioButtonList ID="IsLock" runat="server" RepeatDirection="Horizontal"
                             RepeatLayout="Flow">
                             <asp:ListItem Selected="True" Value="0">正常</asp:ListItem>
                             <asp:ListItem Value="1">锁定</asp:ListItem>
                         </asp:RadioButtonList></td>
                 </tr>

             </tbody>
            </table>
            

        <br />
            <KS:Foot runat="server" ID="Foot1" OnSubmit="Foot1_Submit" />
    </asp:Panel>


</asp:Content>

