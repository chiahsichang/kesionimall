<%@ Page Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.Admin.Shop.Admin_ShopInvoiceInfo" Title="发票信息管理" Codebehind="KS.ShopInvoiceInfo.aspx.cs" %>
<%@ Import Namespace="Kesion.Cache" %>
<asp:Content ID="Content1" ContentPlaceHolderID="KSContent" Runat="Server">
    <asp:Panel ID="listPanel" runat="server" Width="100%">
      <div id="manage_top" class="menu_top_fixed">
        <ul>   

            <span style="float:right">
             &nbsp;&nbsp;<strong>搜索=></strong>
    <asp:DropDownList ID="DrpSearchType" runat="server">
     <asp:ListItem Value="1">用户名</asp:ListItem>
     <asp:ListItem Value="2">公司名称</asp:ListItem>
    </asp:DropDownList>
    <asp:TextBox ID="TxtKey"  CssClass="textbox" runat="server" Width="100px"></asp:TextBox> 
<asp:Button ID="Button2" runat="server" Text=" 查 找 " CssClass="button" OnClick="Button2_Click" />
            </span>
        <li id='p4'><asp:LinkButton ID="editbutton" runat="server" OnClick="editTask_Click"><b></b>编辑发票信息</asp:LinkButton></li>
        <li id='p3'><asp:LinkButton ID="delbutton" runat="server" OnClick="delTask_Click"><b></b>删除发票信息</asp:LinkButton></li>


        </ul> 
      </div>     
      <div class="menu_top_fixed_height"></div>
    <div>
        <KS:KSGV ID="InvoiceListView" cssclass="CTable" runat="server" AutoGenerateColumns="False" DataKeyNames="FieldID" GridLines="None"
            OnRowDataBound="FieldListView_RowDataBound" PagerType="CustomNumeric" Width="99%" EnableTheming="True" OnRowCommand="FieldListView_RowCommand" EmptyDataText="没有找到任何发票信息!">
            <Columns>
                <asp:TemplateField HeaderText="选择">
                <itemstyle horizontalalign="Center" width="50px" />
                <itemtemplate>
                    <input type="checkbox"  name="ids" id="ids" value="<%#Eval("InvoiceID") %>" />
                </itemtemplate>
              </asp:TemplateField>
                
                <asp:BoundField DataField="UserName" HeaderText="用户名">
                </asp:BoundField>
               <asp:TemplateField HeaderText="发票开具方式">
                  <itemstyle  width="120px" HorizontalAlign="Center" />
                <ItemTemplate>
                  <%# (Convert.ToInt16(Eval("InvoiceType").ToString())==1 || Convert.ToInt16(Eval("TitleType").ToString())==1)?"增值税发票":"普通发票（纸质）" %>
                </ItemTemplate>  
                </asp:TemplateField>
                
                 <asp:TemplateField HeaderText="抬头类型">
                   <itemstyle  width="120px" HorizontalAlign="Center" />
                <ItemTemplate>
                  <%# (Convert.ToInt16(Eval("InvoiceType").ToString())==1 || Convert.ToInt16(Eval("TitleType").ToString())==1)?"单位":"个人" %>
                </ItemTemplate>  
                </asp:TemplateField>
                 <asp:TemplateField HeaderText="抬头内容">
                  <itemstyle />
                <ItemTemplate>
                  <%# (Convert.ToInt16(Eval("InvoiceType").ToString())==1 || Convert.ToInt16(Eval("TitleType").ToString())==1)?Eval("CompanyName"):"-" %>
                </ItemTemplate>  
                </asp:TemplateField>

          <asp:TemplateField HeaderText="编辑">
              <itemstyle width="30px" horizontalalign="Center"/>
              <itemtemplate>
                     <asp:LinkButton ID="LinkButton1" CssClass="edit" ToolTip="编辑" runat="server" commandargument=<%#Eval("InvoiceID") %> commandname="modify"></asp:LinkButton>
              </itemtemplate>
            </asp:TemplateField>
             
            <asp:TemplateField HeaderText="删除">
                <itemstyle horizontalalign="Center" width="30px"/>
               <itemtemplate>
                     <asp:LinkButton runat="server" CssClass="delete" ToolTip="删除" id="delete" commandargument=<%#Eval("InvoiceID") %> commandname="del"></asp:LinkButton>
               </itemtemplate>
            </asp:TemplateField>

                
              
            </Columns>
            <HeaderStyle CssClass="CTitle" />
            <EmptyDataRowStyle CssClass="emptycss" />
        </KS:KSGV>
        <br />
        <asp:Panel ID="Panel1" runat="server" Height="30px" Width="739px">
            &nbsp;&nbsp;&nbsp;&nbsp;<input type="checkbox" name="chkall" id="chkall" onclick="CheckAll(this.form);"/><label for="chkall">全部选中</label>
            <asp:Button ID="Button1" runat="server" Text="批量删除发票信息" OnClick="Button1_Click" />&nbsp;<br />
            </asp:Panel>
        &nbsp;
        </div>
        
         <KS:Page ID="Page1" runat="server" />
          <br />
        <script type="text/javascript">
		showtips('<span class="state"><strong>说明：</strong><br /></span>这里管理的是客户的自己添加的发票信息,您可以在此进行编辑,删除操作!');
		</script>
     </asp:Panel>
    
    <asp:Panel ID="addPanel" runat="server" Width="100%" Visible="false">
    <script type="text/javascript">
       function CheckForm()
	        {
	         if(jQuery('#<%=this.TxtCompanyName.ClientID %>').val()==''){
	            KesionJS.Alert('请输入发票抬头！',null);
	           return false;
	         }
	   }

        $(function () {
            $("#ProvinceID").change(function () {
                $("#showselectarea").html(jQuery("#ProvinceID option:selected").get(0).text);
            });
            $("#CityID").change(function () {
                $("#showselectarea").html(jQuery("#ProvinceID option:selected").get(0).text + jQuery("#CityID option:selected").get(0).text);
            });
            $("#CountyID").change(function () {
                $("#showselectarea").html(jQuery("#ProvinceID option:selected").get(0).text + jQuery("#CityID option:selected").get(0).text + jQuery("#CountyID option:selected").get(0).text);
            });

            initialPanel();

        });
        function initialPanel() {
            if (jQuery("#<%=this.RdbInvoiceType.ClientID%> :radio[checked]").val() == "0") {
                if (jQuery("#<%=this.RdbTitleType.ClientID%> :radio[checked]").val() == "0") {
                    $("#showCompanyName").hide();
                }
                $("#showZZSFB").hide();
                $("#showTitleType").show();
            } else {
                $("#showZZSFB").show();
                $("#showTitleType").hide();
                $("#showCompanyName").show();
            }
        }
	 
    </script>
        <KS:TopNav ID="TopNav1" runat="server" Text="修改发票信息" />
         <table width="100%" border="0" cellpadding="1" cellspacing="1" class="CTable"> 
            <tr>
                <td align="right" class="lefttd" height="30" style="width: 198px">
                    <strong>发票开具方式：</strong></td>
                <td class="righttd">
                <asp:RadioButtonList ID="RdbInvoiceType" runat="server" RepeatLayout="Flow" RepeatDirection="Horizontal">
                    <asp:ListItem Value="0" Selected="True">普通发票（纸质）</asp:ListItem>
                    <asp:ListItem Value="1">增值税发票</asp:ListItem>
                </asp:RadioButtonList>

                </td>
            </tr>
            <tr id="showTitleType">
                <td align="right" class="lefttd" height="30" style="width: 198px">
                    <strong>发票抬头：</strong></td>
                <td class="righttd">
                <asp:RadioButtonList ID="RdbTitleType" runat="server" RepeatLayout="Flow" RepeatDirection="Horizontal">
                    <asp:ListItem Value="0" Selected="True">个人</asp:ListItem>
                    <asp:ListItem Value="1">单位</asp:ListItem>
                </asp:RadioButtonList>

                </td>
            </tr>
            <tr id="showCompanyName">
                <td align="right" class="lefttd" height="30" style="width: 198px">
                    <strong>单位名称：</strong></td>
                <td class="righttd">
                    <asp:TextBox ID="TxtCompanyName" CssClass="textbox" runat="server"></asp:TextBox>
                     <span style="color:Red">*</span>
                    </td>
            
            </tr>
            <tbody id="showZZSFB">
            <tr>
                <td align="right" class="lefttd" height="30" style="width: 198px">
                    <strong>纳税人识别号：</strong></td>
                <td class="righttd">
                 <asp:TextBox ID="TxtNSRSBH" CssClass="textbox" runat="server"></asp:TextBox><span style="color:Red">*</span>
               </td>
            </tr>
            <tr>
                <td align="right" class="lefttd" height="30" style="width: 198px">
                    <strong>注册地址：</strong></td>
                <td class="righttd">
                 <asp:TextBox ID="TxtAddress" CssClass="textbox" runat="server"></asp:TextBox><span style="color:Red">*</span>
               </td>
            </tr>
            <tr>
                <td align="right" class="lefttd" height="30" style="width: 198px">
                    <strong>注册电话：</strong></td>
                <td class="righttd">
                 <asp:TextBox ID="TxtTel" CssClass="textbox" runat="server"></asp:TextBox>
               </td>
            </tr>
            <tr>
                <td align="right" class="lefttd" height="30" style="width: 198px">
                    <strong>开户银行：</strong></td>
                <td class="righttd">
                 <asp:TextBox ID="TxtBank" CssClass="textbox" runat="server"></asp:TextBox>
               </td>
            </tr>
             
            <tr>
                <td align="right" class="lefttd" height="30" style="width: 198px">
                    <strong>银行帐户：</strong></td>
                <td class="righttd">
                 <asp:TextBox ID="TxtBankNum" CssClass="textbox" runat="server"></asp:TextBox>
               </td>
            </tr>
            <tr>
                <td align="right" class="lefttd" height="30" style="width: 198px">
                    <strong>收票人姓名：</strong></td>
                <td class="righttd">
                 <asp:TextBox ID="TxtContactMan" CssClass="textbox" runat="server"></asp:TextBox>
               </td>
            </tr>
            <tr>
                <td align="right" class="lefttd" height="30" style="width: 198px">
                    <strong>收票人手机：</strong></td>
                <td class="righttd">
                 <asp:TextBox ID="TxtMobile" CssClass="textbox" runat="server"></asp:TextBox>
               </td>
            </tr>
               <tr>
                <td align="right" class="lefttd" height="30" style="width: 198px">
                    <strong>收票人地区：</strong></td>
                <td class="righttd">
                <script src="../../plus/area.aspx?pid=<%=proid %>&cityid=<%=cityid %>&countyid=<%=countyid %>"></script>
               </td>
            </tr>
            <tr>
                <td align="right" class="lefttd" height="30" style="width: 198px">
                    <strong>收票人地址：</strong></td>
                <td class="righttd">
                  <span id="showselectarea"><%=addStr %></span>
                 <asp:TextBox ID="TxtContactAddress" CssClass="textbox" runat="server"></asp:TextBox>
               </td>
            </tr>
                </tbody>
        </table>
        <br />
        <KS:Foot ID="Foot1" runat="server" OnSubmit="Foot1_Submit" SubmitButtonText="确定修改(0)" />
    
    </asp:Panel>
    

  </asp:Content>