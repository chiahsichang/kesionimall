<%@ Page Title="相册管理" Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.Admin_BlogPhotoComment" Codebehind="KS.BlogPhotoComment.aspx.cs" %>
<%@ Import Namespace="Kesion.Publics"%>
<asp:Content ID="Content1" ContentPlaceHolderID="KSContent" Runat="Server">

    <asp:Panel ID="listPanel" runat="server">
<div id="manage_top">
       <p style="text-align:center;font-weight:bold;">相册评论管理</p>
</div> 
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
                  <b>快速搜索：</b> <asp:TextBox onfocus="keyWordFocus();" onblur="keyWordBlur();" style="color:#ccc" Text="请输入关键字！" CssClass="textbox" Height="12px" ID="txtKeyWord" runat="server"></asp:TextBox>&nbsp;条件：
                   <asp:DropDownList ID="dropSearch" runat="server">
                      <asp:ListItem Value="0">评论标题</asp:ListItem>
                      <asp:ListItem Value="1">评论内容</asp:ListItem>
                       <asp:ListItem Value="2">评论者</asp:ListItem>
                   </asp:DropDownList>
                   <asp:Button ID="Button4" runat="server" CssClass="button" Text="开始搜索" OnClick="Button4_Click" /></td>
               
               </tr>
           </table>
 </div>




<asp:Panel ID="Panel1" runat="server">
    <div class="tabs_header">
        <ul class="tabs">
        <li<%=KSCMS.S("showType")==""?" class='active'":string.Empty %>><a href="KS.BlogComment.Aspx"><span>所有记录</span></a></li>
        <li<%=KSCMS.S("showType")=="1"?" class='active'":string.Empty %>><a href="KS.BlogComment.Aspx?showType=1"><span>未审核的记录</span></a></li>
        <li<%=KSCMS.S("showType")=="2"?" class='active'":string.Empty %>><a href="KS.BlogComment.Aspx?showType=2"><span>已审核的记录</span></a></li>
        </ul>
    </div>

    <KS:ksgv id="List" runat="server" AutoGenerateColumns="False" EmptyDataText="无记录" PagerType="CustomNumeric" Width="99%" HorizontalAlign="center" GridLines="None" OnRowDataBound="List_RowDataBound" OnRowCommand="List_RowCommand" OnRowCreated="List_RowCreated" >
            <Columns>
                <asp:TemplateField HeaderText="选择">
                <itemstyle horizontalalign="Center" width="50px" />
                
                    <itemtemplate>
                    <input type="checkbox"  name="ids" id="ids" value="<%#Eval("ID") %>" />
            
                    </itemtemplate>

                </asp:TemplateField>

                <asp:BoundField HeaderText="ID号" DataField="ID" >
                    <ItemStyle HorizontalAlign=Center Width="80" />
                </asp:BoundField>


                <asp:TemplateField HeaderText="标题" ItemStyle-Width="400" ItemStyle-HorizontalAlign="Left" HeaderStyle-HorizontalAlign="Left" >
                    <ItemTemplate>
                        <%# (bool)string.IsNullOrEmpty(Eval("Title").ToString())? "(无)": "<a href='"+KSCMS.GetInstallDir()+"space/?"+Eval("UserId")+"/album/photo/"+Eval("LogID")+"' target='_blank'>"+Eval("Title")+"</a>"%>
                    </ItemTemplate>
                </asp:TemplateField>



                <asp:BoundField HeaderText="评论时间" DataField="AddTime" >
                    <itemstyle width="200px" horizontalalign="Center" />
                </asp:BoundField>

                <asp:TemplateField HeaderText="状态" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="80">
                    <ItemTemplate>
                        <%# Eval("Flag").ToString() == "1" ?"已审核":"<span style='color:red;'>未审核</span>" %>
                    </ItemTemplate>
                </asp:TemplateField>

            
                <asp:TemplateField HeaderText="↓管理操作">
                    <itemstyle width="300px" horizontalalign="Center" />
                 <itemtemplate>

                 <asp:LinkButton ID="LinkButton2" runat="server" commandargument=<%#Eval("ID") %> commandname="detail"><img src="../../admin/images/Edit.gif" border="0" title="查看" />查看</asp:LinkButton> &nbsp;&nbsp;
                 <asp:LinkButton ID="LinkButton1" runat="server" commandargument=<%#Eval("ID") %> commandname="check">审核</asp:LinkButton> &nbsp;&nbsp;
                 <asp:LinkButton runat="server" id="delete" commandargument=<%#Eval("ID") %> commandname="del"><img src="../../admin/images/del.gif" border="0" title="删除" />删除</asp:LinkButton>
                
            
            
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
            
                    
                <asp:Button ID="Button2" OnClientClick="return(confirm('确定删除吗?'))" class="button" runat="server" Text="批量删除" OnClick="DelButton_Click" />
                <asp:Button ID="Button3" class="button" runat="server" Text="批量审核" OnClick="VerifyButton_Click" />
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

<asp:Panel runat="server" ID="Mdatil" Visible="false">
        <table border="0" align="center"  width="97%" style="float:left;">

              <tr style="border:1px solid #ccc;">

               
                <td width="100" style="text-align:right;">用户：</td>
                <td style="background:#FBFBFB;padding:10px;border: #efefef 1px dotted;text-align:center"><label runat="server" id="labSender"></label></td>
                

              
            </tr>
            <tr style="border:1px solid #ccc;">

               
                <td width="100" style="text-align:right;">评论主题</td>
                <td style="background:#FBFBFB;padding:10px;border: #efefef 1px dotted;text-align:center"><label runat="server" id="labTitle"></label></td>
                

              
            </tr>
            <tr><td width="100" style="text-align:center;height:200px;border:1px solid #ccc;" colspan="2"><label runat="server" id="labText"></label></td></tr>


          </table>
        <p style="text-align:center;"><asp:Button ID="Button1" runat="server" class="button" text=" 返 回 " OnClick="Unnamed1_Click" /></p>
    </asp:Panel>








</asp:Panel>


</asp:Content>

