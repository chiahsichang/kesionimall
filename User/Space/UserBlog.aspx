<%@ Page Title="" Language="C#" MasterPageFile="~/User/User.master" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.User_UserBlog" Codebehind="UserBlog.aspx.cs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="KSContent" Runat="Server">
    <asp:Panel runat="server" ID="MainPanel">
        <table width="98%" border="0" align="center" cellpadding="3" cellspacing="1" style="font-size:14px;">
            <tr class="title">
                 <td colspan="3"> 我的博文管理</td>
                </tr>
            <tr>
                 <td colspan="3" style=" background:#eee; border:1px solid #ccc; height:30px; line-height:30px; ">　<a href="UserBlog.aspx?action=writingBlog" >写博文</a>　<a href="UserBlog.aspx?action=addClass">增加专栏分类</a></td>
                </tr>

        </table>
        <div style="height:20px;"></div>


        <asp:Panel ID="Panel1" runat="server">
    <div class="tabs_header">
        <ul class="tabs">
        <li<%=Kesion.Publics.KSCMS.S("showType")==""?" class='puton'":string.Empty %>><a href="UserBlog.Aspx"><span>所有记录</span></a></li>
        <li<%=Kesion.Publics.KSCMS.S("showType")=="1"?" class='puton'":string.Empty %>><a href="UserBlog.Aspx?showType=1"><span>未审核的记录</span></a></li>
        <li<%=Kesion.Publics.KSCMS.S("showType")=="2"?" class='puton'":string.Empty %>><a href="UserBlog.Aspx?showType=2"><span>已审核的记录</span></a></li>
        </ul>
    </div>

    <KS:KSGV runat="server" CssClass="border" ID="blogList" AutoGenerateColumns="false" EmptyDataText="没有找到任何博文记录!" PagerType="CustomNumeric" Width="99%" HorizontalAlign="center" GridLines="None" OnRowDataBound="List_RowDataBound"  OnRowCommand="List_RowCommand" >
            
            <Columns>

            <asp:BoundField HeaderText="编号" ItemStyle-CssClass="splittd" DataField="BlogID" >
                <ItemStyle HorizontalAlign="Center" Width="60px" />
            </asp:BoundField>

                <asp:TemplateField HeaderText="标题" ItemStyle-CssClass="splittd" HeaderStyle-HorizontalAlign="center">
                    <ItemTemplate>
                        <a href="<%#GetBlogUrl(Eval("userid").ToString(),Eval("BlogID").ToString()) %>" target="_blank"><%# Eval("title") %></a>
                        <br />
                       <span class="tips"> 时间：<%# Eval("AddDate") %></span>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="状态" ItemStyle-CssClass="splittd" ItemStyle-HorizontalAlign="Center">
                    <ItemTemplate>
                        <%# Eval("Status").ToString() == "1"? "已审核":"<span style='color:red;'>未审核</span>" %>
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:BoundField HeaderText="分类" DataField="ClassName" >
                <itemstyle  CssClass="splittd" horizontalalign="Center" />
            </asp:BoundField>
            
            <asp:TemplateField HeaderText="↓管理操作">
                <itemstyle CssClass="splittd" horizontalalign="Center" />
             <itemtemplate>

             <asp:LinkButton ID="LinkButton10" runat="server" commandargument=<%#Eval("BlogID") %> commandname="modifyBlog">修改</asp:LinkButton> &nbsp;&nbsp;
             <asp:LinkButton runat="server" id="LinkButton11" commandargument=<%#Eval("BlogID") %> commandname="delBlog">删除</asp:LinkButton>
            </itemtemplate>
           
            </asp:TemplateField>
            
        </Columns>
       
        <RowStyle CssClass="tdbg" />
       <EmptyDataRowStyle CssClass="emptycss" />
        <HeaderStyle CssClass="title" />
        </KS:KSGV>

        <asp:Panel ID="Panel2" runat="server" Height="30px" Width="100%">

           
               <table cellpadding="0" cellspacing="0" style="width: 100%;margin-top:10px">
                <tr>
                    <td style="height: 25px">&nbsp; </td>
                    <td style="font-size: 9pt; height: 25px; text-align: right">
                            <KS:Page ID="BlogPages" runat="server" />
                    </td>
                </tr>
            </table>
    </asp:Panel>
</asp:Panel>








    </asp:Panel>

    


    <asp:Panel runat="server" ID="BlogClassPanel" Visible="false">
        <table  cellspacing="1" cellpadding="3" class="border" width="98%" align="center" border="0">
	                   <tr class="title">
                            <td colspan="2"> 创 建 专 栏 </td>
                          </tr>
                
                            <script type="text/javascript">
                            function CheckForm1() {
                                if (jQuery("#<%=this.txtClassName.ClientID %>").val() == '') {
                                    KesionJS.Alert('请填写专栏名称!', 'jQuery("#<%=this.txtClassName.ClientID %>").focus()');
	                            return false
                                }
                                if (!is_number(jQuery("#<%=this.txtOrderID.ClientID %>").val()) || jQuery("#<%=this.txtOrderID.ClientID %>").val() == '') {
                                    KesionJS.Alert('专栏序号请填写有数数字！', 'jQuery("#<%=this.txtOrderID.ClientID %>").focus()');
                                    return false;
                                }
                                if (jQuery("#<%=this.textDescript.ClientID %>").val() == '') {
                                    KesionJS.Alert('请填写专栏描述！', 'jQuery("#<%=this.textDescript.ClientID %>").focus()');
	                                return false;
                                }
    
                                return true;

                            }

                            </script>

                          <tr class="tdbg">
                            <td  class="lefttd">专栏名称：</td>
                            <td><asp:TextBox ID="txtClassName" CssClass="textbox"   runat="server" MaxLength="100"></asp:TextBox><span class="tips">分类的名称。</span><span style="color: red">*</span></td>
                          </tr>
              
                          <tr class="tdbg">
                            <td class="lefttd"> 专栏序号：</td>
                            <td><asp:TextBox ID="txtOrderID" CssClass="textbox" runat="server" MaxLength="20"></asp:TextBox><span class="tips">排序</span>
                            <span style="color: red">* 
                                </span></td>
                          </tr>
                          <tr class="tdbg">
                            <td class="lefttd">专栏描述：</td>
                            <td><textarea runat="server" id="textDescript" style="width:500px; height:100px;"></textarea><span style="color: red">* 
                                  </span></td>
                          </tr>
                          
						<tr class="tdbg">
                            <td class="lefttd" height="40">&nbsp;</td>
                            <td>
                                &nbsp; &nbsp;&nbsp;<asp:Button OnClientClick="return(CheckForm1());" ID="Button1" CssClass="button" runat="server" OnClick="Button1_Click"
                                    Text="OK!确定保存" />
                                &nbsp; &nbsp; &nbsp;
                              <input type="button" onclick="history.go(-1)" class="button" value=" 返 回 " /></td>
                        </tr>


                        <tr class="title">
                            <td colspan="2"> 已有的专栏列表 </td>
                          </tr>
            </table>
        <KS:ksgv id="List" runat="server" CssClass="border" AutoGenerateColumns="False" EmptyDataText="没有找任何专栏列表!" PagerType="CustomNumeric" Width="99%" HorizontalAlign="center" GridLines="None"  OnRowDataBound="List_RowDataBound" OnRowCommand="List_RowCommand" OnRowCreated="List_RowCreated">
        <Columns>

            <asp:BoundField HeaderText="编号ID" ItemStyle-CssClass="splittd" DataField="classid" >
                <ItemStyle HorizontalAlign=Center Width="200" />
            </asp:BoundField>
            <asp:BoundField HeaderText="专栏名称" ItemStyle-CssClass="splittd" DataField="classname" >
                <itemstyle width="480px" horizontalalign="Center" />
            </asp:BoundField>
            <asp:BoundField HeaderText="专栏序号" ItemStyle-CssClass="splittd" DataField="orderid" >
                <itemstyle width="200px" horizontalalign="Center" />
            </asp:BoundField>
            
            <asp:TemplateField ItemStyle-CssClass="splittd" HeaderText="↓管理操作">
                <itemstyle width="300px" horizontalalign="Center" />
             <itemtemplate>

             <asp:LinkButton ID="LinkButton1" runat="server" commandargument=<%#Eval("classid") %> commandname="modify">修改</asp:LinkButton> &nbsp;&nbsp;
             <asp:LinkButton runat="server" id="delete" commandargument=<%#Eval("classid") %> commandname="del">删除</asp:LinkButton>
</itemtemplate>
           
            </asp:TemplateField>
        </Columns>
        <HeaderStyle CssClass="title" />
        <RowStyle CssClass="tdbg" />
            <PagerStyle CssClass="Page" HorizontalAlign="Right" />
            <EmptyDataRowStyle CssClass="emptycss" />
    </KS:ksgv>

        <table cellpadding="0" cellspacing="0" style="width: 100%;margin-top:10px">
            <tr>
                <td style="height: 25px">&nbsp; </td>
                <td style="font-size: 9pt; height: 25px; text-align: right">
                        <KS:Page ID="ClassPages" runat="server" />
                </td>
            </tr>
        </table>

    </asp:Panel>


<asp:Panel runat="server" ID="BlogPanel" Visible="false">
 <% Kesion.APPCode.EditorAPI.EchoHead();%>
<table  cellspacing="1" cellpadding="3" class="border" width="98%" align="center" border="0">
	    <tr class="title">
            <td colspan="2"> 创 建 博 文 </td>
            </tr>

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

                return true;

            }
                 function insertHTMLToEditor(codeStr) {
                     editor.execCommand('insertHtml', codeStr);
                 }
            function GetKeyTags() {
                var text = escape(jQuery("#<%=this.txtBlogName.ClientID %>").val());
                if (text != '') {
                    jQuery("#<%=this.txtTags.ClientID %>").val('请稍等,系统正在自动获取tags...').attr("disabled", true);
                    jQuery.get("../../plus/ajaxs.ashx", { a: "GetTags", text: text },
				      function (data) { jQuery("#<%=this.txtTags.ClientID %>").val(unescape(data)).attr("disabled", false); });
                } else { KesionJS.Alert('对不起,请先输入标题!', "jQuery('#<%=this.txtBlogName.ClientID %>').focus();"); }
            }


            </script>

            <tr class="tdbg">
            <td  class="lefttd">博文分类：</td>
            <td>
                <asp:DropDownList runat="server"  CssClass="textbox" ID="dropBlogClass"></asp:DropDownList>
                <span style="color: red">*</span></td>
            </tr>
            <tr class="tdbg">
            <td  class="lefttd">用户专栏：</td>
            <td>
                <asp:DropDownList runat="server"  CssClass="textbox" ID="dropUserBlogClass"></asp:DropDownList> <a href="UserBlog.aspx?action=addClass" style="font-size:13px; color:red;">增加专栏</a>
                <span style="color: red">*</span></td>
            </tr>
                            
              
            <tr class="tdbg">
            <td class="lefttd"> 博文标题：</td>
            <td><asp:TextBox ID="txtBlogName"  CssClass="textbox"  runat="server" Width="400" MaxLength="255"></asp:TextBox><span class="tips">排序</span>
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
            <td><asp:TextBox ID="txtTags" CssClass="textbox" runat="server" Width="300" MaxLength="255"></asp:TextBox><a href="javascript:;" onclick="GetKeyTags()">自动获取TAG</a><span class="tips">多个Tags请以空格分隔</span>
            <span style="color: red">* 
                </span></td>
            </tr>

            <asp:HiddenField runat="server" ID="hidclassid" Value="0" />
            <asp:HiddenField runat="server" ID="modify" Value="0" />

            <tr class="tdbg">
            <td class="lefttd">博文内容：</td>
            <td>
                
                <asp:TextBox ID="textContent" TextMode="multiLine" style="width:650px;height:300px" runat="server"></asp:TextBox>
                <%
                    Kesion.APPCode.EditorAPI.EchoEditor("editor", textContent.ClientID, "Common", 0, false, true, true, false);    
               %>
                  </td>
            </tr>

            <tr class="tdbg" runat="server" id="uploadfile" style="display:none;">
            <td class="lefttd"> 上传附件：</td>
            <td>

            <iframe id='upiframe' name='upiframe' src='../include/UploadAttachment.aspx?ChannelID=19999' frameborder=0 scrolling=no width='620' height='24'></iframe>

               
            </td>
            </tr>
    

            <tr class="tdbg">
            <td class="lefttd"> 查看密码：</td>
            <td><asp:TextBox ID="txtPassWord" CssClass="textbox" runat="server" Width="200"></asp:TextBox><span class="tips">不设置密码留空</span>
            <span style="color: red">
                </span></td>
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

