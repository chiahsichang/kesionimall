<%@ Page Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.Admin_RewriteRule" Title="Untitled Page" Codebehind="KS.RewriteRule.aspx.cs" %>
<asp:Content ID="Content1" ContentPlaceHolderID="KSContent" Runat="Server">
    <asp:Panel ID="listPanel" runat="server" Width="100%">
       <KS:TopNav ID="TopNav2" runat="server" Text="伪静态规则管理" />
        <script type="text/javascript">
 <!--

            function setExt(v) {
                if (v == '') return;
                jQuery("#<%=this.TxtRwriteExtension.ClientID %>").val(v);
            }
       //-->
	</script>
       <table width="99%"  border="0" cellpadding="1" cellspacing="1" class="CTable" style="border-bottom:none"> 
            <tr>
               <td class="lefttd" align="right" style="width:98px"><b>伪静态扩展名：</b></td>
               <td class="righttd">
                  &nbsp;<asp:TextBox ID="TxtRwriteExtension" runat="server" CssClass="textbox" Width="40px" /> <=
                                                         <asp:DropDownList ID="DrpExtension" runat="server" onchange="setExt(this.value);">
                                                           <asp:ListItem Value="">--快速选择--</asp:ListItem>
                                                            <asp:ListItem>.aspx</asp:ListItem>
                                                            <asp:ListItem>.htm</asp:ListItem>
                                                            <asp:ListItem>.html</asp:ListItem>
                                                            <asp:ListItem>.shtm</asp:ListItem>
                                                            <asp:ListItem>.shtml</asp:ListItem>
                                                            <asp:ListItem>/</asp:ListItem>
                                                        </asp:DropDownList>
                  <span class="tips">下面伪静态规则中用标签[ext]代替扩展名。</span>  
                    <span style="float:right"><asp:Button ID="Button3" CssClass="button" runat="server" Text="添加新规则" 
                onclick="Button2_Click"/></span>                                  
                  </td>
             </tr>
        </table>
       
        <KS:KSGV ID="list"  cssclass="CTable" runat="server" Width="99%" AutoGenerateColumns="False" EmptyDataText="暂无伪静态规则!" GridLines="None" OnRowDataBound="list_RowDataBound" PagerType="CustomNumeric" OnRowCommand="list_RowCommand" OnRowCreated="list_RowCreated">
            <Columns>
             <asp:BoundField HeaderText="ID" DataField="ID">
                    <ItemStyle HorizontalAlign="Center" Width="40px" />
                </asp:BoundField>
            <asp:TemplateField HeaderText="启用">
                <ItemStyle HorizontalAlign="Center" />
                <ItemTemplate>
              <asp:HiddenField ID="Hidissys" Value='<%# Eval("issys") %>' runat="server" />
              <asp:HiddenField ID="HidID" Value='<%# Eval("id") %>' runat="server" />
              <asp:HiddenField ID="Hidenable" Value='<%# Eval("enable") %>' runat="server" />

                 <asp:CheckBox ID="CkbEnable" runat="server" />
                 </ItemTemplate>
            </asp:TemplateField>  
                
                
            <asp:TemplateField HeaderText="规则名称">
                <ItemStyle HorizontalAlign="Center" />
                <ItemTemplate>
                  <asp:TextBox CssClass="textbox"  Width="100px" ID="TxtText" Text='<%#Eval("text") %>' runat="server"></asp:TextBox>
                 </ItemTemplate>
            </asp:TemplateField>  
            <asp:TemplateField HeaderText="伪静态正则表达式">
                <ItemStyle HorizontalAlign="Center" />
                <ItemTemplate>
                  <asp:TextBox CssClass="textbox" Width="180px" ID="Txtpattern" Text='<%#Eval("pattern") %>' runat="server"></asp:TextBox>
                 </ItemTemplate>
            </asp:TemplateField>  
            <asp:TemplateField HeaderText="被重写的地址">
                <ItemStyle HorizontalAlign="Center" />
                <ItemTemplate>
                  <asp:TextBox CssClass="textbox" Width="180px" ID="Txtpage" Text='<%#Eval("page") %>' runat="server"></asp:TextBox>
                 </ItemTemplate>
            </asp:TemplateField>  
            <asp:TemplateField HeaderText="前台URL规则">
                <ItemStyle HorizontalAlign="Center" />
                <ItemTemplate>
                  <asp:TextBox CssClass="textbox" Width="180px" ID="Txturlrule" Text='<%#Eval("urlrule") %>' runat="server"></asp:TextBox>
                 </ItemTemplate>
            </asp:TemplateField>  
                
                <asp:TemplateField HeaderText="删除">
                <itemstyle horizontalalign="Center" width="25"/>
                <itemtemplate>
                  <asp:LinkButton runat="server" CssClass="delete" id="delete" commandargument=<%#Eval("id") %> commandname="del"></asp:LinkButton>
               </itemtemplate>
             </asp:TemplateField>

           
            </Columns>
           
            <PagerStyle CssClass="Page" HorizontalAlign="Right" />
            <HeaderStyle CssClass="CTitle" />
            <EmptyDataRowStyle CssClass="emptycss" />
      </KS:KSGV>
      
     <br />
     <asp:Panel ID="Panel1" runat="server" Height="30px" Width="739px">
            &nbsp;&nbsp;<asp:Button ID="Button1" CssClass="button" runat="server" Text="批量保存伪静态规则" 
                onclick="Button1_Click" />&nbsp;
            <asp:Button ID="Button2" CssClass="button" runat="server" Text="添加新规则" 
                onclick="Button2_Click"/>&nbsp;<br />
      </asp:Panel>
     
     
        <br />
        <script type="text/javascript">
            showtips('<span class="state"><strong>说明：</strong><br /></span>1、如果您对伪静态规则不了解，上面的配置建议不要做修改；<br/>2、扩展名为非.aspx时， 需要服务器IIS里配置，右键打开属性对话框→【主目录】标签→【配置】→【添加】可执行文件路径:C:\\WINDOWS\\Microsoft.NET\\Framework\\v2.0.50727\\aspnet_isapi.dll 扩展名如.html，【确认文件是否存在】的勾请去掉；<br/>2、扩展名为“/”时（即无扩展名），IIS6设置方法同上，扩展名设置为“.*” 。IIS7的设置方法为，处理程序映射，添加通配符脚本脚本映射，可执行文件为“%windir%\Microsoft.NET\Framework\v2.0.50727\aspnet_isapi.dll”。');
		</script>

    </asp:Panel>
    
    <asp:Panel ID="addPanel" runat="server" Width="100%" Visible="false">
        <KS:TopNav ID="TopNav1" runat="server" Text="添加伪静态规则" />
        <table width="100%" border="0" cellpadding="1" cellspacing="1" class="CTable"> 
          <tr>
            <td class="lefttd" height="30" align="right" style="width: 198px"><b>规则名称：</b></td>
            <td class="righttd">
                &nbsp;<asp:TextBox CssClass="textbox" ID="TxtText" runat="server"></asp:TextBox> <font color=#ff0000>*</font>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" Display="Dynamic" runat="server" ControlToValidate="TxtText"
                    ErrorMessage="请输入规则名称!"></asp:RequiredFieldValidator></td>
          </tr>    
            <tr>
                <td align="right" class="lefttd" height="30" style="width: 198px">
                    <strong>伪静态正则表达式：</strong></td>
                <td class="righttd">
                     &nbsp;<asp:TextBox CssClass="textbox" ID="TxtPattern" runat="server"></asp:TextBox> <font color=#ff0000>*</font>
                <span class="tips">如：list/(\d+)[ext]</span><asp:RequiredFieldValidator ID="RequiredFieldValidator2"  Display="Dynamic" runat="server" ControlToValidate="TxtPattern"
                    ErrorMessage="伪静态正则表达式!"></asp:RequiredFieldValidator>
                    </td>
            </tr>
            <tr>
                <td align="right" class="lefttd" height="30" style="width: 198px">
                    <strong>被重写的地址：</strong></td>
                <td class="righttd">
                     &nbsp;<asp:TextBox CssClass="textbox" ID="TxtPage" runat="server"></asp:TextBox> <font color=#ff0000>*</font>
                <span class="tips">如：model/list.aspx?id=$1</span> <asp:RequiredFieldValidator ID="RequiredFieldValidator3"  Display="Dynamic" runat="server" ControlToValidate="TxtPage"
                    ErrorMessage="实际链接表达式!"></asp:RequiredFieldValidator>
                    
                    </td>
            </tr>
            <tr>
                <td align="right" class="lefttd" height="30" style="width: 198px">
                    <strong>前台URL规则：</strong></td>
                <td class="righttd">
                     &nbsp;<asp:TextBox CssClass="textbox" ID="TxtUrlRule" runat="server"></asp:TextBox> 
                    <span class="tips">如：list/{$id}[ext]</span>
               </td>
            </tr>
            <tr>
                <td align="right" class="lefttd" height="30" style="width: 198px">
                    <strong>是否启用：</strong></td>
                <td class="righttd">
                     &nbsp;<asp:RadioButtonList ID="RdbEnable" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow">
                         <asp:ListItem Value="true" Selected="True">启用</asp:ListItem>
                         <asp:ListItem Value="false">不启用</asp:ListItem>
                           </asp:RadioButtonList>
               </td>
            </tr>
            
        </table>
        <br />
        <KS:Foot ID="Foot1" runat="server" OnSubmit="Foot1_Submit" />
    </asp:Panel>
 
 
</asp:Content>

