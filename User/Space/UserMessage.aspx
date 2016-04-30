<%@ Page Title="" Language="C#" MasterPageFile="~/User/User.master" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.User_UserMessage" Codebehind="UserMessage.aspx.cs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="KSContent" Runat="Server">
    <asp:Panel runat="server" ID="MainPanel">
        <table width="98%" border="0" align="center" cellpadding="3" cellspacing="1" style="font-size:14px;">
            <tr class="title">
                 <td colspan="3"> <a href="UserMessage.aspx">留言管理</a>　　　<a href="UserBlogComment.aspx">博文评论管理</a>　　<a href="UserAlbumComment.aspx">相册评论管理</a></td>
                </tr>

        </table>
        <div style="height:20px;"></div>
    </asp:Panel>

    <asp:Panel ID="Panel1" runat="server" Visible="true">
    <div class="tabs_header">
        <ul class="tabs">
        <li<%=Kesion.Publics.KSCMS.S("showType")==""?" class='puton'":string.Empty %>><a href="UserMessage.Aspx"><span>所有记录</span></a></li>
        <li<%=Kesion.Publics.KSCMS.S("showType")=="1"?" class='puton'":string.Empty %>><a href="UserMessage.Aspx?showType=1"><span>未审核的记录</span></a></li>
        <li<%=Kesion.Publics.KSCMS.S("showType")=="2"?" class='puton'":string.Empty %>><a href="UserMessage.Aspx?showType=2"><span>已审核的记录</span></a></li>
        </ul>
    </div>

    <KS:ksgv id="List" runat="server" CssClass="border" AutoGenerateColumns="False" EmptyDataText="无记录" PagerType="CustomNumeric" Width="99%" HorizontalAlign="center" GridLines="None" OnRowDataBound="List_RowDataBound" OnRowCommand="List_RowCommand" OnRowCreated="List_RowCreated" >
            <Columns>
                <asp:BoundField HeaderText="ID号" ItemStyle-CssClass="splittd" DataField="ID" >
                    <ItemStyle HorizontalAlign=Center Width="80" />
                </asp:BoundField>


                <asp:TemplateField HeaderText="标题" ItemStyle-CssClass="splittd" ItemStyle-Width="400" ItemStyle-HorizontalAlign="Left"  >
                    <ItemTemplate>
                        <%# (bool)string.IsNullOrEmpty(Eval("Title").ToString())? "(无)": "<a href='"+GetBlogUrl(Eval("userid").ToString())+"' target='_blank'>"+Eval("Title")+"</a>"%>
                    </ItemTemplate>
                </asp:TemplateField>



                <asp:BoundField HeaderText="留言时间" ItemStyle-CssClass="splittd" DataField="AddDate" >
                    <itemstyle width="200px" horizontalalign="Center" />
                </asp:BoundField>

                <asp:TemplateField HeaderText="状态" ItemStyle-CssClass="splittd" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="80">
                    <ItemTemplate>
                        <%# Eval("Flag").ToString() == "1" ?"已审核":"<span style='color:red;'>未审核</span>" %>
                    </ItemTemplate>
                </asp:TemplateField>

            
                <asp:TemplateField HeaderText="↓管理操作" ItemStyle-CssClass="splittd">
                    <itemstyle width="300px" Height="30px" horizontalalign="Center" />
                 <itemtemplate>

                 <asp:LinkButton ID="LinkButton2" runat="server" commandargument=<%#Eval("ID") %> commandname="detail">查看/回复</asp:LinkButton> &nbsp;&nbsp;
                 <asp:LinkButton ID="LinkButton1" runat="server" commandargument=<%#Eval("ID") %> commandname="check">审核</asp:LinkButton> &nbsp;&nbsp;
                 <asp:LinkButton runat="server" id="delete" commandargument=<%#Eval("ID") %> commandname="del">删除</asp:LinkButton>
                 </itemtemplate>
                </asp:TemplateField>
            </Columns>
            <RowStyle CssClass="tdbg" />
        <HeaderStyle CssClass="title" />
                <EmptyDataRowStyle CssClass="emptycss" />
        </KS:ksgv>
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

               
                <td width="100" style="text-align:right;">留言主题</td>
                <td style="background:#FBFBFB;padding:10px;border: #efefef 1px dotted;text-align:center"><label runat="server" id="labTitle"></label></td>
                

              
            </tr>
            <tr><td width="100" style="text-align:center;height:200px;border:1px solid #ccc;" colspan="2"><label runat="server" id="labText"></label></td></tr>


          </table>

        <script>
            function CheckForm() {
                if ($('#<%=this.txtReplyContent.ClientID%>').val() == "") {
                    alert("请输入你的回复内容！");
                    $('#<%=this.txtReplyContent.ClientID%>').focus();
                    return false;
                } else {
                    $('#<%=this.content2.ClientID%>').val($('#<%=this.txtReplyContent.ClientID%>').val());
                }
                return true;
            }
       </script>
        <table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="comment_write_table">
            <form name="msgform" action="http://localhost:58571/space/?182/message/send" method="post" >
              <input type="hidden" value="0" runat="server" id="mid">
              <tr style="text-align:left;">
                  <td>
                      <textarea id="txtReplyContent" runat="server" class="msgtextarea" cols="70" name="Content"  rows="4" style="width:500px; color:#777;"></textarea>
  
                 </td>
              </tr>
            
          </table>
        <asp:HiddenField runat="server" ID="content2" Value="" />
        <p style="text-align:center;"><asp:Button ID="Button1" runat="server" OnClientClick="return CheckForm()" class="button" text=" 回 复 " OnClick="Unnamed2_Click" />　　 <asp:Button runat="server" class="button" text=" 返 回 " OnClick="Unnamed1_Click" /></p>
    </asp:Panel>

</asp:Content>

