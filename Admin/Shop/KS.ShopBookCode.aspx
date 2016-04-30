<%@ Page Language="C#" MasterPageFile="~/Admin/MasterPage.master" EnableEventValidation="false"  AutoEventWireup="true" Inherits="Kesion.NET.WebSite.Admin.Shop.Admin_ShopBookCode" Title="预约码管理" Codebehind="KS.ShopBookCode.aspx.cs" %>
<%@ Import Namespace="Kesion.Publics"%>
<%@ Import Namespace="Kesion.APPCode"%>
<%@ Import Namespace="Kesion.Cache"%>
<asp:Content ID="Content1" ContentPlaceHolderID="KSContent" Runat="Server">
     <asp:Panel ID="TaskList" runat="server" Width="100%">
      <div id="manage_top" class="menu_top_fixed">
          <span style="float:right">
              <asp:DropDownList ID="DrpSelectType" runat="server">

              </asp:DropDownList>
          </span>
        <ul>
           <li id='p1'><asp:LinkButton ID="addTask" runat="server" OnClick="addTask_Click"><b></b>批量生成预约码</asp:LinkButton></li>
           <li id='p4'><a href="javascript:;" onclick="location.href='KS.ShopBookCodeType.aspx';"><b></b>预约码分类管理</a></li>
           <li id='p3'><asp:LinkButton ID="delTask" runat="server" OnClick="delTask_Click"><b></b>删除预约码</asp:LinkButton></li>
        </ul>
          
      </div>   
     <div class="menu_top_fixed_height"></div> 
      
<div class="tabs_header">
    <ul class="tabs">
    <li<%=KSCMS.S("flag")==""?" class='active'":string.Empty %>><a href="KS.ShopBookCode.aspx"><span>所有预约码</span></a></li>
    <li<%=KSCMS.S("flag")=="1"?" class='active'":string.Empty %>><a href="KS.ShopBookCode.aspx?flag=1"><span>未使用预约码</span></a></li>
    <li<%=KSCMS.S("flag")=="2"?" class='active'":string.Empty %>><a href="KS.ShopBookCode.aspx?flag=2"><span>已使用预约码</span></a></li>
    <li<%=KSCMS.S("flag")=="3"?" class='active'":string.Empty %>><a href="KS.ShopBookCode.aspx?flag=3"><span>作废预约码</span></a></li>
    <li<%=KSCMS.S("flag")=="4"?" class='active'":string.Empty %>><a href="KS.ShopBookCode.aspx?flag=4"><span>已被申请预约码</span></a></li>
    <li<%=KSCMS.S("flag")=="5"?" class='active'":string.Empty %>><a href="KS.ShopBookCode.aspx?flag=5"><span>未被申请预约码</span></a></li>
    </ul>
</div>
      

  <KS:KSGV ID="list" runat="server" cssclass="CTable" AutoGenerateColumns="False" Width="99%" 
             EmptyDataText="没有找到任何预约码!" GridLines="None" OnRowDataBound="list_RowDataBound" 
             OnRowCommand="list_RowCommand" OnRowCreated="list_RowCreated" 
             AllowPaging="false">
          <Columns>
              <asp:TemplateField HeaderText="选择">
                <itemstyle horizontalalign="Center" width="40px" />
                <itemtemplate>
                    <input type="checkbox"  name="ids" id="ids" value='<%#Eval("id") %>' />
                </itemtemplate>
              </asp:TemplateField>
               
             <asp:TemplateField HeaderText="预约码分类">
             <itemstyle VerticalAlign="Top" />
             <itemtemplate>
            <%# Eval("TypeName")%>

             </itemtemplate>
             </asp:TemplateField> 
              <asp:TemplateField HeaderText="预约码卡号">
             <itemstyle />
             <itemtemplate>
                 <%# Eval("CodeID") %>
             </itemtemplate>
             </asp:TemplateField>
             <asp:TemplateField HeaderText="生成时间">
             <itemstyle horizontalalign="Center" />
             <itemtemplate>
                 <%# Eval("AddDate") %>
             </itemtemplate>
             </asp:TemplateField>
             <asp:TemplateField HeaderText="是否使用">
             <itemstyle horizontalalign="Center" />
             <itemtemplate>
             <itemstyle horizontalalign="Center" />
                 <%# Convert.ToString(Eval("IsUsed"))=="1"?"已使用":(Convert.ToString(Eval("IsUsed"))=="2"?"<span class='tips'>作废</span>":"<span style='color:red'>未使用</span>") %>
             </itemtemplate>
             </asp:TemplateField>
             <asp:TemplateField HeaderText="使用人">
             <itemstyle horizontalalign="Center" />
             <itemtemplate>
             <itemstyle horizontalalign="Center" />
                 <%# Convert.ToString(Eval("IsUsed"))=="1"?Eval("UserName"):"-" %>
             </itemtemplate>
             </asp:TemplateField>
             <asp:TemplateField HeaderText="使用时间">
             <itemstyle horizontalalign="Center" />
             <itemtemplate>
             <itemstyle horizontalalign="Center" />
                 <%# Convert.ToString(Eval("IsUsed"))=="1"?Eval("UseTime"):"-" %>
             </itemtemplate>
             </asp:TemplateField>
             <asp:TemplateField HeaderText="城市">
             <itemstyle horizontalalign="Center" />
             <itemtemplate>
             <itemstyle horizontalalign="Center" />
                 <%# Convert.ToString(Eval("IsUsed"))=="1"?MyCache.GetAreaName(Utils.StrToInt(Convert.ToString(Eval("cityid"))),"city"):"-" %>
             </itemtemplate>
             </asp:TemplateField>

              <asp:TemplateField HeaderText="编辑">
              <itemstyle width="30px" horizontalalign="Center"/>
              <itemtemplate>
             <asp:LinkButton ID="LinkButton1" CssClass="edit" ToolTip="编辑" runat="server" commandargument=<%#Eval("id") %> commandname="modify"></asp:LinkButton>
              </itemtemplate>
             </asp:TemplateField>
             
              <asp:TemplateField HeaderText="删除">
              <itemstyle width="30px" horizontalalign="Center"/>
              <itemtemplate>
             <asp:LinkButton runat="server" CssClass="delete" ToolTip="删除" id="delete" commandargument=<%#Eval("id") %> commandname="del"></asp:LinkButton>
              </itemtemplate>
            </asp:TemplateField>

             
            <asp:TemplateField HeaderText="↓作废">
                <itemstyle horizontalalign="Center" />
             <itemtemplate>
             <asp:LinkButton ID="BtnLock" runat="server" CommandArgument=<%#Eval("id") %>  CommandName="locked"></asp:LinkButton>
               </itemtemplate>
            </asp:TemplateField>
          </Columns>
            <HeaderStyle CssClass="CTitle" />
            <EmptyDataRowStyle CssClass="emptycss" />
      </KS:KSGV>
      <asp:Panel ID="Panel1" runat="server">
              <div style="height:5px;overflow:hidden;"></div>
            &nbsp;&nbsp;&nbsp;&nbsp;<input type="checkbox" name="chkall" id="chkall" onclick="CheckAll(this.form);"/><label for="chkall">全部选中</label>
          <input type="button" value="删除选中的邀请码" onmouseover="this.className='button_on';" onmouseout="this.className='button';" class="button" onclick="if (GetIDS('del')){this.form.action='?action=del';this.form.submit()}" id="Button1" />
          <input type="button" value="打印" class="button" onclick="window.print();" />
    </asp:Panel> 
    
    <KS:Page ID="Page1" runat="server" />
    
    <div class="message">
    
   <strong>搜索预约码：</strong><asp:DropDownList ID="DrpTJ" runat="server">
     <asp:ListItem Value="0">预约码分类名称</asp:ListItem>
     <asp:ListItem Value="1" Selected="True">预约码卡号</asp:ListItem>
     <asp:ListItem Value="2">使用会员名称</asp:ListItem>
    </asp:DropDownList> <asp:TextBox runat="server" ID="TxtKeyWord" CssClass="textbox" /> 

    <asp:Button ID="BtnSearch" runat="server" CssClass="button" Text="开始搜索" 
            onclick="BtnSearch_Click"  />
        </div>
        
    </asp:Panel>
    

    <asp:Panel ID="PanelModify" runat="server" Width="100%" Visible="false">
         <KS:TopNav ID="TopNav2" runat="server" Text="修改收货信息" />
        <table width="99%" align="center" border="0" cellpadding="1" cellspacing="1" class="CTable"> 
          <tr>
            <td class="lefttd" height="30" align="right" style="width: 109px"><strong>预约码：</strong></td>
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

    <asp:Panel ID="TaskManage" runat="server" Width="100%" Visible="false">
    
        <KS:TopNav ID="TopNav1" runat="server" />
        <table width="99%" align="center" border="0" cellpadding="1" cellspacing="1" class="CTable"> 
          <tr>
            <td class="lefttd" height="30" align="right" style="width: 109px"><strong>预约码分类：</strong></td>
            <td class="righttd" style="width: 487px">
                &nbsp;<asp:DropDownList ID="DrpTypeID" runat="server">

                </asp:DropDownList>
                <span class="tips">请选择预约码所属分类。</span> <a href="KS.ShopBookCodeType.aspx">添加预约码分类</a>
                
            </td>
          </tr>
          
          <tr>
                <td align="right" class="lefttd" height="30" style="width: 109px"><strong>生成数量：</strong></td>
                <td class="righttd" style="width: 487px">
                 &nbsp;<asp:TextBox ID="TxtNum" runat="server" Text="100" CssClass="textbox" />张
                </td>
            </tr>
            <tr>
                 <td align="right" class="lefttd" style="width: 109px; height: 30px">
                     <strong>生成预约码前缀：</strong></td>
                 <td class="righttd" style="height: 30px; width: 487px;">
                 &nbsp;<asp:TextBox ID="TxtPre" runat="server" Text="yym" CssClass="textbox" /> <span class="tips">如：KS,YYM等</span>
                 </td>
             </tr>
            <tr>
                 <td align="right" class="lefttd" style="width: 109px; height: 30px">
                     <strong>生成预约码位数：</strong></td>
                 <td class="righttd" style="height: 30px; width: 487px;">
                 &nbsp;<asp:TextBox ID="TxtLen" runat="server" Text="10" CssClass="textbox" /> <span class="tips">建议设置10-15之间的数字。</span>
                 </td>
             </tr>
            <tr>
                 <td align="right" class="lefttd" style="width: 109px; height: 30px">
                     <strong>预约码构成方式：</strong></td>
                 <td class="righttd" style="height: 30px; width: 487px;">
                  <asp:RadioButtonList ID="RdbType" runat="server">
                      <asp:ListItem Value="0" Selected="True">纯数字</asp:ListItem>
                      <asp:ListItem Value="1">纯字母</asp:ListItem>
                      <asp:ListItem Value="2">数字的英文的随机组合</asp:ListItem>
                  </asp:RadioButtonList>

                 </td>
             </tr>
            <tr>
                 <td align="right" class="lefttd" style="width: 109px; height: 30px">
                     <strong>预约码生成时间：</strong></td>
                 <td class="righttd" style="height: 30px; width: 487px;">
                 &nbsp;<asp:TextBox ID="TxtAddDate" runat="server" onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'});" CssClass="textbox" />
                     <span class="tips">格式：<%=DateTime.Now.ToString() %></span>
                 </td>
             </tr>

        </table>
        <script>
             
            function CheckForm() {
                if (jQuery("#<%=this.DrpTypeID.ClientID %>").val() == '0') {
                    KesionJS.Alert("请请选择预约码所属分类！", 'jQuery("#<%=this.DrpTypeID.ClientID %>").focus()');
                    return false;
                }

                if (jQuery("#<%=this.TxtNum.ClientID %>").val() == '') {
                    KesionJS.Alert("请输入生成数量！", 'jQuery("#<%=this.TxtNum.ClientID %>").focus()');
                    return false;
                }

                return true;
            }
        </script>
      <br />
      <KS:Foot ID="Foot1" runat="server" OnSubmit="Foot1_Submit" />
    </asp:Panel>
    
</asp:Content>

