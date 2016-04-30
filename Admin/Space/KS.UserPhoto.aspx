<%@ Page Title="相册管理" Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.Admin_UserPhoto" Codebehind="KS.UserPhoto.aspx.cs" %>
<%@ Import Namespace="Kesion.Publics"%>
<asp:Content ID="Content1" ContentPlaceHolderID="KSContent" Runat="Server">

    <asp:Panel ID="listPanel" runat="server">
<div id="manage_top" class="menu_top_fixed">
       <ul>
           <li id='p2'><asp:LinkButton ID="addclassbutton" runat="server" OnClick="editclassbutton_Click" ><b></b>添加相册</asp:LinkButton></li>
           <li id='p19'><asp:LinkButton ID="editclassbutton" runat="server" OnClick="addclassbutton_Click1" ><b></b>相册评论</asp:LinkButton></li>
           <li id='p1'>
           <asp:LinkButton ID="delclassbutton" runat="server" 
               onclick="delclassbutton_Click" ><b></b>相册分类</asp:LinkButton></li></ul>
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
                      <asp:ListItem Value="2">录入者</asp:ListItem>
                      <asp:ListItem Value="3">作者</asp:ListItem>
                   </asp:DropDownList>
                   <asp:Button ID="Button4" runat="server" CssClass="button" Text="开始搜索" OnClick="Button4_Click" /></td>
               
               </tr>
           </table>
 </div>




<asp:Panel ID="Panel1" runat="server">
    <div class="tabs_header">
        <ul class="tabs">
        <li<%=KSCMS.S("showType")==""?" class='active'":string.Empty %>><a href="KS.UserPhoto.Aspx"><span>所有记录</span></a></li>
        <li<%=KSCMS.S("showType")=="1"?" class='active'":string.Empty %>><a href="KS.UserPhoto.Aspx?showType=1"><span>未审核的记录</span></a></li>
        <li<%=KSCMS.S("showType")=="2"?" class='active'":string.Empty %>><a href="KS.UserPhoto.Aspx?showType=2"><span>已审核的记录</span></a></li>
        </ul>
    </div>

    <KS:ksgv id="List" cssclass="CTable" runat="server" AutoGenerateColumns="False" EmptyDataText="没有相册记录！" PagerType="CustomNumeric" Width="99%" GridLines="None" OnRowDataBound="List_RowDataBound" OnRowCommand="List_RowCommand" OnRowCreated="List_RowCreated" >
            <Columns>
                <asp:TemplateField HeaderText="选择">
                <itemstyle horizontalalign="Center" Height="30px" width="50px" />
                
                    <itemtemplate>
                    <input type="checkbox"  name="ids" id="ids" value="<%#Eval("PicID") %>" />
            
                    </itemtemplate>

                </asp:TemplateField>

                <asp:BoundField HeaderText="ID号" DataField="PicID" >
                    <ItemStyle HorizontalAlign=Center Width="80" />
                </asp:BoundField>


                <asp:TemplateField HeaderText="标题" ItemStyle-Width="400" ItemStyle-HorizontalAlign="Left">
                    <ItemTemplate>
                        <a href="<%=KSCMS.GetInstallDir() %>space/?<%#Eval("UserId") %>/album/photo/<%#Eval("PicID") %>" target="_blank"><img src="<%# Eval("PhotoUrl") %>" width="45" height="45" style="border:1px solid #ccc;padding:1px;"/><%#Eval("Title") %></a>
                    </ItemTemplate>
                </asp:TemplateField>


                <asp:BoundField HeaderText="录入者" DataField="UserName" >
                    <itemstyle width="50px" horizontalalign="Center" />
                </asp:BoundField>
                <asp:BoundField HeaderText="添加时间" DataField="AddDate" >
                    <itemstyle width="200px" horizontalalign="Center" />
                </asp:BoundField>

             <asp:TemplateField HeaderText="状态">
              <itemstyle width="30px" horizontalalign="Center"/>
              <itemtemplate>
                   <a href="?action=verify&PicID=<%#Eval("PicID")%>" <%# Convert.ToString(Eval("status"))=="0"?"class='no' title='未审核'":"class='ok' title='已审核'" %>></a>
              </itemtemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="推荐">
              <itemstyle width="30px" horizontalalign="Center"/>
              <itemtemplate>
                   <a href="?action=recommend&PicID=<%#Eval("PicID")%>" <%# Convert.ToString(Eval("Best"))=="0"?"class='no' title='否'":"class='ok' title='是'" %>></a>
              </itemtemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="热门">
              <itemstyle width="30px" horizontalalign="Center"/>
              <itemtemplate>
                   <a href="?action=hot&PicID=<%#Eval("PicID")%>" <%# Convert.ToString(Eval("hot"))=="0"?"class='no' title='否'":"class='ok' title='是'" %>></a>
              </itemtemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="置顶">
              <itemstyle width="30px" horizontalalign="Center"/>
              <itemtemplate>
                   <a href="?action=Toplist&PicID=<%#Eval("PicID")%>" <%# Convert.ToString(Eval("Toplist"))=="0"?"class='no' title='否'":"class='ok' title='是'" %>></a>
              </itemtemplate>
            </asp:TemplateField>


            <asp:TemplateField HeaderText="编辑">
                       <itemstyle horizontalalign="Center" width="25px"/>
                        <itemtemplate>
                 <asp:LinkButton CssClass="edit" ToolTip="修改" ID="LinkButton1" runat="server" commandargument=<%#Eval("PicID") %> commandname="modify"></asp:LinkButton>
                 </itemtemplate>
              </asp:TemplateField>
                <asp:TemplateField HeaderText="删除">
                    <itemstyle width="25px" horizontalalign="Center" />
                 <itemtemplate>
                 <asp:LinkButton CssClass="delete" ToolTip="删除" runat="server" id="delete" commandargument=<%#Eval("PicID") %> commandname="del"></asp:LinkButton>
    </itemtemplate>
           
                </asp:TemplateField>
            </Columns>
            <HeaderStyle CssClass="CTitle" />
                <PagerStyle CssClass="Page" HorizontalAlign="Right" />
                <EmptyDataRowStyle CssClass="emptycss" />
        </KS:ksgv>

    <asp:Panel ID="Panel3" runat="server" Height="30px" Width="741px">
              <div style="margin-top:5px;overflow:hidden;"></div>
            &nbsp;&nbsp;<input type="checkbox" name="chkall" id="chkall" onclick="CheckAll(this.form);"/><label for="chkall">全部选中</label>
            
                    
                <asp:Button ID="Button1" OnClientClick="return(confirm('确定删除吗?'))" class="button" runat="server" Text="批量删除" OnClick="DelButton_Click" />
                <asp:Button ID="Button3" class="button" runat="server" Text="批量审核" OnClick="VerifyButton_Click" />
                    <asp:Button ID="Button5" class="button" runat="server" Text="批量推荐" OnClick="BestButton_Click" />
                    <asp:Button ID="Button6" class="button" runat="server" Text="批量热门" OnClick="HotButton_Click" />
                    <asp:Button ID="VerifyButton" class="button" runat="server" Text="批量置顶" OnClick="TopButton_Click" />
           </asp:Panel>

        <asp:Panel ID="Panel2" runat="server" Height="30px" Width="100%">

           
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

</asp:Panel>


</asp:Content>

