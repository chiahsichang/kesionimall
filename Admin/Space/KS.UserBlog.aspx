<%@ Page Title="博文管理" Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.Admin_UserBlog" Codebehind="KS.UserBlog.aspx.cs" %>
<%@ Import Namespace="Kesion.Publics"%>
<asp:Content ID="Content1" ContentPlaceHolderID="KSContent" Runat="Server">

    <asp:Panel ID="listPanel" runat="server">
<div id="manage_top" class="menu_top_fixed">
       <ul>
           <li id='p2'><asp:LinkButton ID="addclassbutton" runat="server" OnClick="addclassbutton_Click1" ><b></b>日志管理</asp:LinkButton></li>
           <li id='p19'><asp:LinkButton ID="editclassbutton" runat="server" OnClick="editclassbutton_Click" ><b></b>日志评论</asp:LinkButton></li>
           <li id='p1'>
           <asp:LinkButton ID="delclassbutton" runat="server" 
               onclick="delclassbutton_Click" ><b></b>博文分类</asp:LinkButton></li></ul>
</div> 
 <div class="menu_top_fixed_height"></div>  
        
<script type="text/javascript">
 <!--
    jQuery(document).ready(function () {
        jQuery("body").keydown(function () {
            if (event.ctrlKey)
                switch (event.keyCode) {
                }
        });
    });

    function ContentAddSpecial() {
        var sid = null;
        for (var i = 0; i < document.getElementsByName("ids").length; i++) {
            var KS = document.getElementsByName("ids")[i];
            if (KS.checked == true) {
                if (sid == null)
                    sid = KS.value;
                else
                    sid += "," + KS.value;
            }
        }
    }
    function ContentSetAttribute() {
        var sid = null;
        for (var i = 0; i < document.getElementsByName("ids").length; i++) {
            var KS = document.getElementsByName("ids")[i];
            if (KS.checked == true) {
                if (sid == null)
                    sid = KS.value;
                else
                    sid += "," + KS.value;
            }
        }


    }
    function keyWordFocus() {
        if (jQuery("#<%=this.txtKeyWord.ClientID %>").val() == '请输入关键字！') {
         jQuery("#<%=this.txtKeyWord.ClientID %>").val('');
     }
 }
 function keyWordBlur() {
     if (jQuery("#<%=this.txtKeyWord.ClientID %>").val() == '') {
        jQuery("#<%=this.txtKeyWord.ClientID %>").val('请输入关键字！');
    }
}
//-->    
</script>
 <div class="message">
          <table border="0" cellpadding="0" cellspacing="0" width="100%">
              <tr>
               <td style="height: 23px">
                  <b>快速搜索：</b> <asp:TextBox onfocus="keyWordFocus();" onblur="keyWordBlur();" style="color:#ccc" Text="请输入关键字！" CssClass="textbox" ID="txtKeyWord" runat="server"></asp:TextBox>&nbsp;条件：
                   <asp:DropDownList ID="dropSearch" runat="server">
                      <asp:ListItem Value="1">标题</asp:ListItem>
                      <asp:ListItem Value="2">创建者</asp:ListItem>
                   </asp:DropDownList>
                   <asp:Button ID="Button6" runat="server" CssClass="button" Text="开始搜索" OnClick="Button4_Click" /></td>
               
               </tr>
           </table>
 </div>

    <div class="tabs_header">
        <ul class="tabs">
        <li<%=KSCMS.S("showType")==""?" class='active'":string.Empty %>><a href="KS.UserBlog.Aspx"><span>所有记录</span></a></li>
        <li<%=KSCMS.S("showType")=="1"?" class='active'":string.Empty %>><a href="KS.UserBlog.Aspx?showType=1"><span>未审核的记录</span></a></li>
        <li<%=KSCMS.S("showType")=="2"?" class='active'":string.Empty %>><a href="KS.UserBlog.Aspx?showType=2"><span>已审核的记录</span></a></li>
        </ul>
    </div>

    <KS:ksgv id="List" cssclass="CTable" runat="server" AutoGenerateColumns="False" EmptyDataText="没有博文记录!" PagerType="CustomNumeric" Width="99%" HorizontalAlign="center" GridLines="None" OnRowDataBound="List_RowDataBound" OnRowCommand="List_RowCommand" OnRowCreated="List_RowCreated" >
            <Columns>
                <asp:TemplateField HeaderText="选择">
                <itemstyle horizontalalign="Center" width="50px" />
                
                    <itemtemplate>
                    <input type="checkbox"  name="ids" id="ids" value="<%#Eval("BlogID") %>" />
            
                    </itemtemplate>

                </asp:TemplateField>

                <asp:BoundField HeaderText="ID号" DataField="BlogID" >
                    <ItemStyle HorizontalAlign=Center />
                </asp:BoundField>

                <asp:TemplateField HeaderText="标题" HeaderStyle-HorizontalAlign="center" >
                    <ItemTemplate>
                        <a href="<%=KSCMS.GetInstallDir() %>space/?<%# Eval("UserID") %>/blog/archive/<%# Eval("BlogID") %>" target="_blank"><%# Eval("title") %></a>
                    </ItemTemplate>
                </asp:TemplateField>


                <asp:BoundField HeaderText="创建者" DataField="UserName" >
                    <itemstyle width="50px" horizontalalign="Center" />
                </asp:BoundField>
                <asp:BoundField HeaderText="创建时间" DataField="AddDate" >
                    <itemstyle width="200px" horizontalalign="Center" />
                </asp:BoundField>


             <asp:TemplateField HeaderText="状态">
              <itemstyle width="30px" horizontalalign="Center"/>
              <itemtemplate>
                   <a href="?action=verify&blogid=<%#Eval("blogID")%>" <%# Convert.ToString(Eval("status"))=="0"?"class='no' title='未审核'":"class='ok' title='已审核'" %>></a>
              </itemtemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="推荐">
              <itemstyle width="30px" horizontalalign="Center"/>
              <itemtemplate>
                   <a href="?action=recommend&blogid=<%#Eval("blogID")%>" <%# Convert.ToString(Eval("Best"))=="0"?"class='no' title='否'":"class='ok' title='是'" %>></a>
              </itemtemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="热门">
              <itemstyle width="30px" horizontalalign="Center"/>
              <itemtemplate>
                   <a href="?action=hot&blogid=<%#Eval("blogID")%>" <%# Convert.ToString(Eval("hot"))=="0"?"class='no' title='否'":"class='ok' title='是'" %>></a>
              </itemtemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="置顶">
              <itemstyle width="30px" Height="30px" horizontalalign="Center"/>
              <itemtemplate>
                   <a href="?action=Toplist&blogid=<%#Eval("blogID")%>" <%# Convert.ToString(Eval("Toplist"))=="0"?"class='no' title='否'":"class='ok' title='是'" %>></a>
              </itemtemplate>
            </asp:TemplateField>

               
            
              <asp:TemplateField HeaderText="编辑">
                       <itemstyle horizontalalign="Center" width="25px"/>
                        <itemtemplate>
                 <asp:LinkButton ID="LinkButton1" CssClass="edit" ToolTip="修改" runat="server" commandargument=<%#Eval("BlogID") %> commandname="modify"></asp:LinkButton> </itemtemplate>
              </asp:TemplateField>
            
                <asp:TemplateField HeaderText="删除">
                    <itemstyle width="25px" horizontalalign="Center" />
                 <itemtemplate>
                 <asp:LinkButton CssClass="delete" ToolTip="删除" runat="server" id="delete" commandargument=<%#Eval("BlogID") %> commandname="del"></asp:LinkButton>
                </itemtemplate>
           
                </asp:TemplateField>
            </Columns>
            <HeaderStyle CssClass="CTitle" />
                <PagerStyle CssClass="Page" HorizontalAlign="Right" />
                <EmptyDataRowStyle CssClass="emptycss" />
        </KS:ksgv>

        <asp:Panel ID="Panel2" runat="server" Height="30px" Width="741px">
              <div style="margin-top:5px;overflow:hidden;"></div>
            &nbsp;&nbsp;<input type="checkbox" name="chkall" id="chkall" onclick="CheckAll(this.form);"/><label for="chkall">全部选中</label>
            
                    
                <asp:Button ID="Button4" OnClientClick="return(confirm('确定删除吗?'))" class="button" runat="server" Text="批量删除" OnClick="DelButton_Click" />
                <asp:Button ID="Button1" class="button" runat="server" Text="批量审核" OnClick="VerifyButton_Click" />
                    <asp:Button ID="Button3" class="button" runat="server" Text="批量推荐" OnClick="BestButton_Click" />
                    <asp:Button ID="Button5" class="button" runat="server" Text="批量热门" OnClick="HotButton_Click" />
            <asp:Button ID="VerifyButton" class="button" runat="server" Text="批量置顶" OnClick="TopButton_Click" />
           </asp:Panel>

        <asp:Panel ID="Panel1" runat="server" Height="30px" Width="100%">

           
               <table cellpadding="0" cellspacing="0" style="width: 100%;margin-top:10px">
                <tr>
                    <td style="height: 25px">&nbsp; </td>
                    <td style="font-size: 9pt; height: 25px; text-align: right">
                            <KS:Page ID="Page1" runat="server" />
                    </td>
                </tr>
            </table>
    </asp:Panel>
</asp:Panel>

<asp:Panel runat="server" ID="editPanel" Visible="false">
    <KS:TopNav ID="TopNav1" runat="server" Text="修 改" />
        
    <table  cellspacing="1" cellpadding="3" class="CTable" width="100%" align="center" border="0">

             <script type="text/javascript">
                 function CheckForm2() {
                     if (jQuery("#<%=this.dropBlogClass.ClientID %>").val() == '0') {
                    KesionJS.Alert('请选择博文分类!', 'jQuery("#<%=this.dropBlogClass.ClientID %>").focus()');
                    return false
                }

                if (jQuery("#<%=this.txtBlogName.ClientID %>").val() == '') {
                    KesionJS.Alert('请填写博文标题!', 'jQuery("#<%=this.txtBlogName.ClientID %>").focus()');
                    return false
                }
                     if (editor.hasContents() == false) {
                         KesionJS.Alert('请填写博文内容!', 'editor.focus()');
                         return false
                     }
                return true;

            }

            function GetKeyTags() {
                var text = escape(jQuery("#<%=this.txtBlogName.ClientID %>").val());
                if (text != '') {
                    jQuery("#<%=this.txtTags.ClientID %>").val('请稍等,系统正在自动获取tags...').attr("disabled", true);
                    jQuery.get("../plus/ajaxs.ashx", { a: "GetTags", text: text },
				      function (data) { jQuery("#<%=this.txtTags.ClientID %>").val(unescape(data)).attr("disabled", false); });
                    } else { KesionJS.Alert('对不起,请先输入标题!', "jQuery('#<%=this.txtBlogName.ClientID %>').focus();"); }
            }


            </script>
            <style>
                .tdbg .lefttd {
                    text-align:right;
                    font-size:13px;
                    font-weight:bold;
                }
            </style>
            <tr class="tdbg">
            <td  class="lefttd">博文分类：</td>
            <td>
                <asp:DropDownList runat="server"  CssClass="textbox" ID="dropBlogClass"></asp:DropDownList>
                <span style="color: red">*</span></td>
            </tr>
            <tr class="tdbg">
            <td  class="lefttd">用户专栏：</td>
            <td>
                <asp:DropDownList runat="server"  CssClass="textbox" ID="dropUserBlogClass"></asp:DropDownList>
                <span style="color: red">*</span></td>
            </tr>
                            
              
            <tr class="tdbg">
            <td class="lefttd"> 博文标题：</td>
            <td><asp:TextBox ID="txtBlogName"  CssClass="textbox"  runat="server" Width="400"></asp:TextBox><span class="tips">排序</span>
            <span style="color: red">* 
                </span></td>
            </tr>

            <tr class="tdbg">
            <td class="lefttd"> 博文日期：</td>
            <td><asp:TextBox ID="txtAddDate" ReadOnly="true" CssClass="textbox" runat="server" Width="200"></asp:TextBox><span class="tips">博文日期</span>
            <span style="color: red">* 
                </span></td>
            </tr>

            <tr class="tdbg">
            <td class="lefttd"> Tag标签：</td>
            <td><asp:TextBox ID="txtTags" CssClass="textbox" runat="server" Width="300"></asp:TextBox><a href="javascript:;" onclick="GetKeyTags()">自动获取TAG</a><span class="tips">多个Tags请以空格分隔</span>
            <span style="color: red">* 
                </span></td>
            </tr>
            <asp:HiddenField runat="server" ID="classid" />
            <tr class="tdbg">
            <td class="lefttd">博文内容： <span style="color: red">* 
                    </span></td>
            <td>
                
                <asp:TextBox ID="textContent" TextMode="multiLine" style="width:80%;height:250px" runat="server"></asp:TextBox>
                <% Kesion.APPCode.EditorAPI.EchoEditor("editor", this.textContent.ClientID, "Basic");%>
                  
               </td>
            </tr>

            <tr class="tdbg">
            <td class="lefttd"> 查看密码：</td>
            <td><asp:TextBox ID="txtPassWord" CssClass="textbox" runat="server" Width="200"></asp:TextBox><span class="tips">不设置密码留空</span>
            <span style="color: red">
                </span></td>
            </tr>

            <tr class="tdbg">
            <td class="lefttd"> 是否审核：</td>
            <td>
                <asp:CheckBox runat="server" ID="chkStatus" Text="是否审核" />
                <asp:CheckBox runat="server" ID="chkBest" Text="是否推荐" />
                <asp:CheckBox runat="server" ID="chkTopList" Text="是否热门" />
            </td>
            </tr>

                          
		<tr class="tdbg">
            <td class="lefttd" height="40">&nbsp;</td>
            <td>
                &nbsp; &nbsp;&nbsp;<asp:Button OnClientClick="return(CheckForm2());" ID="Button2" CssClass="button" runat="server" OnClick="Button2_Click"
                    Text="OK!确定修改" />
                &nbsp; &nbsp; &nbsp;
                <input type="button" onclick="history.go(-1)" class="button" value=" 返 回 " /></td>
        </tr>
    </table>


</asp:Panel>


</asp:Content>

