<%@ Page Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.Admin_DataReplace" Title="数据库字段替换" Codebehind="KS.DataReplace.aspx.cs" %>
<asp:Content ID="Content1" ContentPlaceHolderID="KSContent" Runat="Server">

<asp:Panel ID="Step1" runat="server">
    <KS:TopNav ID="TopNav1" runat="server" Text="数据库字段替换" />

 <script>
     function showType() {
         var checkrad = jQuery("#<%=this.RdbReplaceType.ClientID %> :radio[checked]").val();
         if (checkrad == "0") {
             jQuery("#Type1").show();
             jQuery("#Type2").hide();
             jQuery("#newstr").html("替 换 成：");
         } else if (checkrad == "1") {
             jQuery("#Type1").hide();
             jQuery("#Type2").show();
             jQuery("#newstr").html("替 换 成：");
         } else {
         jQuery("#Type1").hide();
         jQuery("#Type2").hide();
         jQuery("#newstr").html("修 改 成：");
     }
     }
 </script>
 <div class="tab-page" id="replacePanel">
         <script type="text/javascript">
             var tabPane1 = new WebFXTabPane(document.getElementById("replacePanel"), 1)
         </script>
             
		<div class="tab-page" id="tab0">
		  <h2 class="tab">字段替换</h2>
			<script type="text/javascript">
						 tabPane1.addTabPage( document.getElementById( "tab0" ) );
			</script>
 <table width="99%"  border="0" cellpadding="1" cellspacing="1" class="CTable"> 
          <tr>
            <td class="lefttd" height="30" align="right" style="width: 198px"><b>数据表名：</b></td>
            <td class="righttd">&nbsp;<asp:DropDownList ID="DrpTable" AutoPostBack="true" runat="server" 
                    onselectedindexchanged="DrpTable_SelectedIndexChanged"></asp:DropDownList>
                    
                    字段名称：<asp:DropDownList ID="DrpField" runat="server">
            <asp:ListItem Value="0">---请选择字段---</asp:ListItem>
            </asp:DropDownList>
                    
                    </td>
          </tr>
          <tr>
            <td class="lefttd" height="30" align="right" style="width: 198px"><b>SQL条件：</b></td>
            <td class="righttd">&nbsp;<asp:TextBox ID="TxtSQL" runat="server" CssClass="textbox" />
            <span class="tips">可以留空，否则请按此格式输入，如： Where inputer='admin'</span>
            </td>
          </tr>
        <tr>
            <td align="right" class="lefttd" height="30" style="width: 198px">
            <b>替换模式：</b>
            </td>
            <td class="righttd">
                &nbsp;<asp:RadioButtonList ID="RdbReplaceType" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow">
                 <asp:ListItem Value="0" Selected>简单模式</asp:ListItem>
                 <asp:ListItem Value="1">高级模式</asp:ListItem>
                 <asp:ListItem Value="2">赋值模式</asp:ListItem>
                </asp:RadioButtonList></td>
        </tr>
        <tbody id="Type1">
        <tr>
            <td align="right" class="lefttd" height="30" style="width: 198px">
            <b>将 字 符：</b>
            </td>
            <td class="righttd">
                &nbsp;<asp:TextBox CssClass="textbox" ID="TxtStr1" TextMode="MultiLine" Width="304px" runat="server" Height="60px"></asp:TextBox><font color=red>*</font></td>
        </tr>
        <tr>
            <td align="right" class="lefttd" height="30" style="width: 198px">
            <b>区分大小写：</b>
            </td>
            <td class="righttd">
                &nbsp;<asp:RadioButtonList ID="RdbIsCase" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow">
                 <asp:ListItem Value="0" Selected>不区分</asp:ListItem> 
                 <asp:ListItem Value="1">区分</asp:ListItem>
                </asp:RadioButtonList></td>
        </tr> 
        </tbody>
        <tbody id="Type2" style="display:none">
        <tr>
            <td align="right" class="lefttd" height="30" style="width: 198px">
            <b>字符开始：</b>
            </td>
            <td class="righttd">
                &nbsp;<asp:TextBox CssClass="textbox" ID="TxtStr11" TextMode="MultiLine" Width="304px" runat="server" Height="40px"></asp:TextBox><font color=red>*</font></td>
        </tr>
        <tr>
            <td align="right" class="lefttd" height="30" style="width: 198px">
            <b>字符结束：</b>
            </td>
            <td class="righttd">
                &nbsp;<asp:TextBox CssClass="textbox" ID="TxtStr12" TextMode="MultiLine" Width="304px" runat="server" Height="40px"></asp:TextBox><font color=red>*</font></td>
        </tr>
        </tbody>
         <tr>
            <td align="right" class="lefttd" height="30" style="width: 198px">
            <b id="newstr">替 换 成：</b>
            </td>
            <td class="righttd">
                &nbsp;<asp:TextBox CssClass="textbox" ID="TxtStr2" TextMode="MultiLine" Width="304px" runat="server" Height="60px"></asp:TextBox></td>
        </tr>
        <tr>
        <td align="right" class="lefttd" height="40" style="width: 198px"></td>
        <td  class="righttd" >	
          &nbsp;<asp:Button ID="BtnSubmit" runat="server" CssClass="button" Text="开始替换(0)" OnClick="Foot1_Submit" />
</td></tr>
      </table>
      
    </div>
    
    
		 <div class="tab-page" id="annexReplace">
		  <h2 class="tab">附件地址替换</h2>
			<script type="text/javascript">
			    tabPane1.addTabPage(document.getElementById("annexReplace"));
			</script>
             <table width="99%" border="0" cellpadding="1" cellspacing="1" class="CTable"> 
                   <tr>
                    <td align="right" class="lefttd" height="30" style="width: 198px">
                    <b>将 字 符：</b>
                    </td>
                    <td class="righttd">
                        &nbsp;<asp:TextBox CssClass="textbox" ID="TxtAnnexStr1" TextMode="MultiLine" Width="304px" runat="server" Height="60px"></asp:TextBox><font color=red>*</font></td>
                </tr>
                <tr>
                    <td align="right" class="lefttd" height="30" style="width: 198px">
                    <b id="B1">替 换 成：</b>
                    </td>
                    <td class="righttd">
                        &nbsp;<asp:TextBox CssClass="textbox" ID="TxtAnnexStr2" TextMode="MultiLine" Width="304px" runat="server" Height="60px"></asp:TextBox></td>
                </tr>
                    <tr>
                    <td align="right" class="lefttd" height="40" style="width: 198px"></td>
                    <td  class="righttd" >	
                      &nbsp;<asp:Button ID="Button1" runat="server" CssClass="button" Text="开始替换(0)" 
                            onclick="Button1_Click" />
            </td></tr>
            </table>
         </div>
    </div>
      
		
</asp:Panel>
      <div style="margin-top:20px;clear:both"></div>
      <script type="text/javascript">
          showtips('<span class="state"><strong>注意事项：</strong><br /></span>1、执行操作前，建议先备份数据库文件。<br /> 2、本操作的更新时间视您数据的多少以及服务器（或本地机器）的配置决定，如果数据很多，更新可能很慢，在这过程千万不能刷新页面或关闭浏览器，如果出现超时或者错误提示，请使用备份数据重新进行操作；<br/>3、附件地址替换功能一般用于网站域名更换时才使用，将所有涉及图片的字段的原域名替换为新的域名，要替换的附件字段可以打开config/AnnexField.config文件增加或删除。使用前请先备份好您的数据库，如果您对此不太了解请慎用！！！<br />');
	 </script>   

</asp:Content>

