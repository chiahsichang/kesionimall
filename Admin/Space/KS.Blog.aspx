<%@ Page Title="个人空间管理" Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.Admin_User_Blog" Codebehind="KS.Blog.aspx.cs" %>
<%@ Import Namespace="Kesion.Publics"%>
<asp:Content ID="Content1" ContentPlaceHolderID="KSContent" Runat="Server">

<div  id="manage_top" class="menu_top_fixed">
       <ul>
           <li id='p2'><asp:LinkButton ID="addclassbutton" runat="server" OnClick="addclassbutton_Click1" ><b></b>空间管理</asp:LinkButton></li>
           <li id='p5'><asp:LinkButton ID="editclassbutton" runat="server" OnClick="editclassbutton_Click" ><b></b>模板管理</asp:LinkButton></li>
           <li id='p1'><asp:LinkButton ID="delclassbutton" runat="server" 
               onclick="delclassbutton_Click" ><b></b>空间分类</asp:LinkButton></li></ul>
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

<asp:Panel ID="listPanel" runat="server">
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
        <li<%=KSCMS.S("showType")==""?" class='active'":string.Empty %>><a href="KS.Blog.Aspx"><span>所有记录</span></a></li>
        <li<%=KSCMS.S("showType")=="1"?" class='active'":string.Empty %>><a href="KS.Blog.Aspx?showType=1"><span>未审核的记录</span></a></li>
        <li<%=KSCMS.S("showType")=="2"?" class='active'":string.Empty %>><a href="KS.Blog.Aspx?showType=2"><span>已审核的记录</span></a></li>
        </ul>
    </div>

    <KS:ksgv id="List" cssclass="CTable" runat="server" AutoGenerateColumns="False" EmptyDataText="没有空间记录!" PagerType="CustomNumeric" Width="99%" GridLines="None" OnRowDataBound="List_RowDataBound" OnRowCommand="List_RowCommand" OnRowCreated="List_RowCreated" >
            <Columns>
                <asp:TemplateField HeaderText="选择">
                <itemstyle horizontalalign="Center" width="50px" />
                
                    <itemtemplate>
                    <input type="checkbox"  name="ids" id="ids" value="<%#Eval("BlogID") %>" />
            
                    </itemtemplate>

                </asp:TemplateField>

                <asp:BoundField HeaderText="ID号" DataField="BlogID" ItemStyle-Width="50" >
                    <ItemStyle HorizontalAlign=Center />
                </asp:BoundField>

                <asp:TemplateField HeaderText="站点名称" HeaderStyle-HorizontalAlign="center" >
                    <ItemTemplate>
                        <a href="<%=KSCMS.GetInstallDir() %>space/?<%# Eval("UserID") %>" target="_blank" style="display:block; height:30px; line-height:30px;" ><img src="<%# (Kesion.HtmlTags.Function.FileOrDirectoryIFExist(Eval("Logo").ToString()))? Eval("Logo") : Kesion.Cache.MyCache.GetCacheConfig(5) + Kesion.Cache.MyCache.GetCacheConfig(0) + "/SysImg/nopic.gif" %>" width="30" height="30" style="border:none;" /> <%# Eval("BlogName") %></a>
                    </ItemTemplate>
                </asp:TemplateField>


                <asp:BoundField HeaderText="创建者" DataField="UserName" >
                    <itemstyle width="80px" horizontalalign="Center" />
                </asp:BoundField>
                <asp:BoundField HeaderText="创建时间" DataField="AddDate" >
                    <itemstyle width="150px" horizontalalign="Center" />
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
              <itemstyle width="30px" horizontalalign="Center"/>
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
                    <asp:Button ID="Button2" class="button" runat="server" Text="批量推荐" OnClick="BestButton_Click" />
                    <asp:Button ID="Button3" class="button" runat="server" Text="批量热门" OnClick="HotButton_Click" />
                    <asp:Button ID="VerifyButton" class="button" runat="server" Text="批量置顶" OnClick="TopButton_Click" />
           </asp:Panel>

       <KS:Page ID="Page1" runat="server" />
</asp:Panel>

<asp:Panel runat="server" ID="editPanel" Visible="false">
    <KS:TopNav ID="TopNav1" runat="server" Text="修改" />
        <script type="text/javascript">
            function checkform() {

                if ($("#<%=this.txtBlogName.ClientID %>").val() == '') {
                    $.dialog.alert('请输入空间名称!', function () {
                        $("#<%=this.txtBlogName.ClientID %>").focus();
            });
            return false;

        }
        if ($("#<%=this.dropBlogClass.ClientID %> option:selected").val() == '0') {
                    $.dialog.alert('请选择分类!', function () {
                        $("#<%=this.dropBlogClass.ClientID %>").focus();
            });
            return false;

        }
        if ($("#<%=this.textDescript.ClientID %>").val() == '') {
                    $.dialog.alert('请填写你的站点描述!', function () {
                        $("#<%=this.textDescript.ClientID %>").focus();
            });
            return false;

        }
        if ($("#<%=this.textAnnounce.ClientID %>").val() == '') {
                    $.dialog.alert('请填写你的站点公告!', function () {
                        $("#<%=this.textAnnounce.ClientID %>").focus();
            });
            return false;
        }
        if (isNaN($("#<%=this.txtContentLen.ClientID %>").val())) {
                    $.dialog.alert('请填写新鲜事!未填写正确，列表每页显示多少条！', function () {
                        $("#<%=this.txtContentLen.ClientID %>").focus();
            });
            return false;
        }
        if (isNaN($("#<%=this.txtListBlogNum.ClientID %>").val())) {
                    $.dialog.alert('请填写显示博文!未填写正确，首页显示博文多少篇！', function () {
                        $("#<%=this.txtListBlogNum.ClientID %>").focus();
            });
            return false;
        }
        if (isNaN($("#<%=this.txtListGuestNum.ClientID %>").val())) {
                    $.dialog.alert('请填写显示回复!未填写正确，首页显示回复多少条！', function () {
                        $("#<%=this.txtListGuestNum.ClientID %>").focus();
            });
            return false;
        }
        if (isNaN($("#<%=this.txtListLogNum.ClientID %>").val())) {
                    $.dialog.alert('请填写博文列表!未填写正确，列表页显示博文多少篇！', function () {
                        $("#<%=this.txtListLogNum.ClientID %>").focus();
            });
            return false;
        }
        if (isNaN($("#<%=this.txtListReplayNum.ClientID %>").val())) {
                    $.dialog.alert('请填写显示留言!未填写正确，首页显示留言多少条！', function () {
                        $("#<%=this.txtListReplayNum.ClientID %>").focus();
            });
            return false;
        }



    }

       </script>
    <table width="99%" align="center" border="0" cellpadding="1" cellspacing="1" class="CTable"> 
          <tr>
            <td class="lefttd" height="30" align="right" style="width: 150px"><b>空间名称：</b></td>
            <td class="righttd">
                <asp:TextBox  CssClass="textbox" ID="txtBlogName" runat="server" Width="268px"></asp:TextBox>
            </td>
          </tr>
        <tr>

            <td align="right" class="lefttd" height="30" style="width: 150px"><b>空间分类：</b></td>
            <td class="righttd">
                <asp:DropDownList ID="dropBlogClass" runat="server"></asp:DropDownList>
            </td>
       </tr>

        <tr>

            <td align="right" class="lefttd" height="30" style="width: 150px"><b>站点描述：</b></td>
            <td class="righttd">
               <textarea runat="server" id="textDescript" style="width:500px; height:100px;"></textarea>
            </td>
       </tr>

        <tr>

            <td align="right" class="lefttd" height="30" style="width: 150px"><b>空间公告：</b></td>
            <td class="righttd">
               <textarea runat="server" id="textAnnounce" style="width:500px; height:100px;"></textarea>
            </td>
       </tr>

        <tr style="display:none;">
            <td class="lefttd" height="30" align="right" style="width: 150px"><b>新 鲜 事：</b></td>
            <td class="righttd">
                <asp:TextBox  CssClass="textbox" ID="txtContentLen" runat="server" Width="168px"></asp:TextBox>指空间新鲜事列表页里，每页显示新鲜事条数。 
            </td>
          </tr>

        <tr style="display:none;">
            <td class="lefttd" height="30" align="right" style="width: 150px"><b>显示博文：</b></td>
            <td class="righttd">
                <asp:TextBox  CssClass="textbox" ID="txtListBlogNum" runat="server" Width="168px"></asp:TextBox>空间首页显示博文条数。
            </td>
          </tr>

        <tr style="display:none;">
            <td class="lefttd" height="30" align="right" style="width: 150px"><b>博文列表：</b></td>
            <td class="righttd">
                <asp:TextBox  CssClass="textbox" ID="txtListLogNum" runat="server" Width="168px"></asp:TextBox>空间首页显示最新博文篇数。 
            </td>
          </tr>

        <tr style="display:none;">
            <td class="lefttd" height="30" align="right" style="width: 150px"><b>显示回复：</b></td>
            <td class="righttd">
                <asp:TextBox  CssClass="textbox" ID="txtListReplayNum" runat="server" Width="168px"></asp:TextBox>空间首页显示最新回复条数。 
            </td>
          </tr>

        <tr style="display:none;">
            <td class="lefttd" height="30" align="right" style="width: 150px"><b>显示留言：</b></td>
            <td class="righttd">
                <asp:TextBox  CssClass="textbox" ID="txtListGuestNum" runat="server" Width="168px"></asp:TextBox>空间首页显示最新留言条数。 
            </td>
          </tr>
        <asp:HiddenField ID="blogid" runat="server" />


                <tr class="tdbg" >
             <td class="lefttd" height="30" align="right" style="width: 150px"><b>Logo地址：</b></td>
              <td>
              

                  &nbsp;<asp:TextBox ID="txtLogo" CssClass="textbox" runat="server" Width="300px"></asp:TextBox>
                &nbsp;<input type="button" class="button" onclick="SelectFiles('<%=this.txtLogo.ClientID%>    ', 2);" value="选择图片" />
              
		  　    <div class="ar_r_t"><div class="ar_l_t"><div class="ar_r_b"><div class="ar_l_b"><img id="blogLogo" userface="" src="<%=avatar %>" style="height:140px;width:130px;border-width:0px;" /></div></div></div></div>
            </tr>

        <tr>
            <td class="lefttd" height="30" align="right" style="width: 150px"><b>是否审核：</b></td>
            <td class="righttd">
                <asp:CheckBox runat="server" ID="chkStatus" Text="是否审核" />
            </td>
          </tr>
  
      </table>
      <br />
        <KS:Foot ID="Foot1" runat="server"  OnSubmit="Foot1_Submit" />

</asp:Panel>


</asp:Content>

