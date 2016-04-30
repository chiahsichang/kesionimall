<%@ Page Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.Admin_Field" Title="字段管理" CodeBehind="KS.Field.aspx.cs" %>
<%@ Import Namespace="Kesion.Publics"%>
<%@ Import Namespace="Kesion.Cache"%>
<%@ Import Namespace="Kesion.BLL"%>
<%@ Import Namespace="System.Data"%>
<asp:Content ID="Content1" ContentPlaceHolderID="KSContent" Runat="Server">
    <asp:Panel ID="listPanel" runat="server" Width="100%">
      <div id="manage_top" class="menu_top_fixed">
        <ul>
        <li id='p1'><asp:LinkButton ID="addbutton" runat="server" OnClick="addbutton_Click"><b></b>新增字段</asp:LinkButton></li>
        <li id='p5'><asp:LinkButton ID="LinkButton3" runat="server" OnClick="LinkButton3_Click"><b></b>字段分组</asp:LinkButton></li>
        <li id='p9'><asp:LinkButton ID="LinkButton2" runat="server" OnClick="LinkButton2_Click"><b></b>回上一级</asp:LinkButton></li>
        </ul>
        <div id="gos">当前管理的模型：<asp:Label ID="LabCurrModel" runat="server" Text="Label"></asp:Label></div>
      </div>     
       <div class="menu_top_fixed_height"></div>    
    <div>


        <div class="tabs_header">
            <ul class="tabs">
               <%=FieldGroupStr%>
            </ul>
       </div>

        <KS:OrderJS ID="OrderJS1" runat="server" />
        <KS:KSGV ID="FieldListView" runat="server" AutoGenerateColumns="False" DataKeyNames="FieldID" GridLines="None"
            OnRowDataBound="FieldListView_RowDataBound" EmptyDataText="没有字段！" PagerType="CustomNumeric" Width="99%" CssClass="CTable" EnableTheming="True" OnRowCommand="FieldListView_RowCommand">
            <Columns>
                <asp:TemplateField HeaderText="排序">
                    <itemstyle width="60px" horizontalalign="Center"  />
                    <headerstyle height="18px"/>
                    <itemtemplate>
                     <asp:DropDownList id="orderid" datasource="<%#bindorder() %>" runat="server"></asp:DropDownList>
                    </itemtemplate>
                </asp:TemplateField>
                  <asp:BoundField DataField="FieldAlias" HeaderText="字段别名">
                    <itemstyle width="100px" />
                </asp:BoundField>

                <asp:BoundField DataField="Name" HeaderText="字段名称">
                    <itemstyle width="100px" ForeColor="#999999" horizontalalign="Center" />
                </asp:BoundField>

             
              
                <asp:BoundField DataField="FieldLevel" HeaderText="级别">
                    <itemstyle width="60px" horizontalalign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="FieldType" HeaderText="字段类型">
                    <itemstyle horizontalalign="Center" width="118px" />
                </asp:BoundField>


           <asp:TemplateField HeaderText="录入项">
              <itemstyle width="30px" horizontalalign="Center"/>
              <itemtemplate>
                   <a href="?action=InputItem&Channelid=<%=__ChannelID %>&name=<%#Eval("name")%>" <%# Convert.ToString(Eval("InputItem"))=="0"?"class='no' title='否'":"class='ok' title='是'" %>></a>
              </itemtemplate>
            </asp:TemplateField> 

           <asp:TemplateField HeaderText="投稿项">
              <itemstyle width="30px" horizontalalign="Center"/>
              <itemtemplate>
                   <a href="?action=ContributionItem&Channelid=<%=__ChannelID %>&name=<%#Eval("name")%>" <%# Convert.ToString(Eval("ContributionItem"))=="0"?"class='no' title='否'":"class='ok' title='是'" %>></a>
              </itemtemplate>
            </asp:TemplateField> 

         <asp:TemplateField HeaderText="采集项">
              <itemstyle width="30px" horizontalalign="Center"/>
              <itemtemplate>
                   <a href="?action=CollectItem&Channelid=<%=__ChannelID %>&name=<%#Eval("name")%>" <%# Convert.ToString(Eval("CollectItem"))=="0"?"class='no' title='否'":"class='ok' title='是'" %>></a>
              </itemtemplate>
            </asp:TemplateField> 

             <asp:TemplateField HeaderText="必填项">
              <itemstyle width="30px" horizontalalign="Center"/>
              <itemtemplate>
                   <a href="?action=MustFillItem&Channelid=<%=__ChannelID %>&name=<%#Eval("name")%>" <%# Convert.ToString(Eval("MustFillItem"))=="0"?"class='no' title='否'":"class='ok' title='是'" %>></a>
              </itemtemplate>
            </asp:TemplateField>

                           <asp:TemplateField HeaderText="管理项">
              <itemstyle width="30px" horizontalalign="Center"/>
              <itemtemplate>
                   <a href="?action=ManageItem&Channelid=<%=__ChannelID %>&name=<%#Eval("name")%>" <%# Convert.ToString(Eval("ManageItem"))=="1"?"class='ok' title='是'":"class='no' title='否'" %>></a>
              </itemtemplate>
            </asp:TemplateField> 

             <asp:TemplateField HeaderText="状态">
              <itemstyle width="30px" horizontalalign="Center"/>
              <itemtemplate>
                   <a href="?action=Disabled&Channelid=<%=__ChannelID %>&name=<%#Eval("name")%>" <%# Convert.ToString(Eval("Disabled"))=="false"?"class='no' title='禁用'":"class='ok' title='正常'" %>></a>
              </itemtemplate>
            </asp:TemplateField>


            <asp:TemplateField HeaderText="编辑">
              <itemstyle width="30px" horizontalalign="Center"/>
              <itemtemplate>
                     <asp:LinkButton ID="LinkButton1" ToolTip="编辑" CssClass="edit" runat="server" commandargument=<%#Eval("Name") %> commandname="modify"></asp:LinkButton>
              </itemtemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="删除">
              <itemstyle width="30px" horizontalalign="Center"/>
              <itemtemplate>
                     <asp:LinkButton runat="server" CssClass="delete" ToolTip="删除" id="delete" commandargument=<%#Eval("name") %> commandname="del"></asp:LinkButton>
              </itemtemplate>
            </asp:TemplateField>

                
            </Columns>
            <HeaderStyle CssClass="CTitle" />
        </KS:KSGV>
        <br />
        <asp:Panel ID="Panel1" runat="server" Height="30px">
            <asp:Button ID="Button1" runat="server" Text="批量保存字段排序" OnClick="Button1_Click1" />&nbsp;<asp:Button
                ID="Button2" runat="server" Text="预览模型" /><br />
            </asp:Panel>
        &nbsp;
        </div>
     </asp:Panel>
    
    <asp:Panel ID="addPanel" runat="server" Width="100%" Visible="false">
    <script>
        function ShowArea() {
           var v = parseInt(jQuery("#<%=this.FieldType.ClientID %> :radio[checked]").val());
           if (v==12){
            jQuery("#ParentIDArea").show();
           }else{
            jQuery("#ParentIDArea").hide();
           }
           if (v==2||v==3){
           jQuery("#HeightArea").show();}
           else{
           jQuery("#HeightArea").hide();}
           if (v==10|| v==11){
           jQuery("#FileArea").show()}
           else{
           jQuery("#FileArea").hide();}
           if(v==4||v==5||v==6||v==12){
           jQuery("#ListArea").show();}
           else{
           jQuery("#ListArea").hide();}
           if (v==5||v==6){
           jQuery("#WidthArea").hide();}
           else{
           jQuery("#WidthArea").show();}
           if(v==6){
           jQuery("#CheckTips").show();}
           else{
               jQuery("#CheckTips").hide();
           }
           if(v==3){
            jQuery("#ToolbarArea").show();}
            else{
            jQuery("#ToolbarArea").hide();}
        }
        function CheckForm() {
            var fileName = $("#<%=FieldName.ClientID%>").val();
            if (fileName == '') {
                KesionJS.Alert('请输入字段名称！', "jQuery('#<%=this.FieldName.ClientID %>').focus()");
                return false;
            } else {
                var reg = /[a-zA-Z]+\w{2,}/;
                var r = fileName.match(reg);
                if (r == null) {
                    KesionJS.Alert('字段名称必须以字母开头,后面跟字母、数字或下划线的任意组合,且必须大于等于3个字符！', "jQuery('#<%=this.FieldName.ClientID %>').focus()");
                    return false;
                }
            }    
            if ($("#<%=FieldAlias.ClientID%>").val() == '') {
                KesionJS.Alert('请输入字段别名！', "jQuery('#<%=this.FieldAlias.ClientID %>').focus()");
                return false;
            }
            return true;
        }
    </script>


        <KS:TopNav ID="TopNav1" runat="server" Text="添加新字段" />
         <table width="99%" align="center" border="0" cellpadding="1" cellspacing="1" class="CTable"> 
             <tr>
                 <td align="right" class="lefttd" height="30" style="width: 198px">
                     <strong>所属模型：</strong></td>
                 <td class="righttd"><asp:Label ID="Label1" runat="server" ForeColor="Red" Text="Label"></asp:Label></td>
             </tr>
             <tr>
                 <td align="right" class="lefttd" height="30" style="width: 198px">
                     <strong>所属分组：</strong></td>
                 <td class="righttd">
                     <asp:DropDownList ID="DrpFieldGroupID" Width="250px" runat="server"></asp:DropDownList>
                 </td>
             </tr>
            
            <tr>
                <td align="right" class="lefttd" height="30" style="width: 198px">
                    <strong>字段名称：</strong></td>
                <td class="righttd">
                    <asp:TextBox CssClass="textbox" ID="FieldName" runat="server"></asp:TextBox>
                    <span style="color: #ff0066">*</span> 
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="FieldName"
                        ErrorMessage="请输入名称" Display="Dynamic"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="FieldName"
                        Display="Dynamic" ErrorMessage="必须以字母开头,后面跟字母、数字或下划线的任意组合,且必须大于等于3个字符" ValidationExpression="[a-zA-Z]+\w{2,}"></asp:RegularExpressionValidator><br />
                    字段名称以字母、数字、和下划线组成,并且只能以字母开头.在模板页的调用格式：<span style="color: #ff0066">{KS.Field.</span><span id="Fields" style="color: #ff0066">字段名称</span><span style="color: #ff0066">}</span></td>
            </tr>
             <tr>
                 <td align="right" class="lefttd" style="width: 198px; height: 30px;">
                     <strong>字段别名：</strong></td>
                 <td class="righttd" style="height: 30px">
                     <asp:TextBox CssClass="textbox" ID="FieldAlias" runat="server"></asp:TextBox>
                     <span style="color: #ff0066">*<asp:RequiredFieldValidator ID="RequiredFieldValidator2"
                         runat="server" ControlToValidate="FieldAlias" ErrorMessage="请输入字段别名"></asp:RequiredFieldValidator><br />
                     </span>如:你的姓名，联系方式等等</td>
             </tr>
             <tr>
                 <td align="right" class="lefttd" style="width: 198px; height: 30px">
                     <strong>字段录入提示：</strong></td>
                 <td class="righttd" style="height: 30px">
                     <asp:TextBox CssClass="textbox" ID="Tips" runat="server" Height="37px" TextMode="MultiLine" Width="230px"></asp:TextBox>
                     显示在录入框旁边的提示信息</td>
             </tr>
             <tr>
                 <td align="right" class="lefttd" style="width: 198px; height: 30px">
                     <strong>字段类型：</strong></td>
                 <td class="righttd" style="height: 30px">
                     <asp:RadioButtonList ID="FieldLevel" runat="server" Enabled="false" RepeatDirection="Horizontal">
                         <asp:ListItem Value="0">系统字段</asp:ListItem>
                         <asp:ListItem Selected="True" Value="1">自定义</asp:ListItem>
                     </asp:RadioButtonList></td>
             </tr>
             <tr>
                 <td align="right" class="lefttd" style="width: 198px; height: 30px">
                     <strong>字段类型：</strong></td>
                 <td class="righttd" style="height: 30px">
                     <asp:RadioButtonList ID="FieldType" runat="server" RepeatColumns="4" RepeatDirection="Horizontal">
                         <asp:ListItem Selected="True" Value="1">单行文本</asp:ListItem>
                         <asp:ListItem Value="2">多行文本(不支持HTML)</asp:ListItem>
                         <asp:ListItem Value="3">多行文本(支持HTML)</asp:ListItem>
                         <asp:ListItem Value="4">下拉选项</asp:ListItem>
                         <asp:ListItem Value="5">单选框</asp:ListItem>
                         <asp:ListItem Value="6">复选框</asp:ListItem>
                         <asp:ListItem Value="7">日期时间</asp:ListItem>
                         <asp:ListItem Value="8">数字（Int）</asp:ListItem>
                         <asp:ListItem Value="13">小数字（Float）</asp:ListItem>
                         <asp:ListItem Value="14">货币（Money）</asp:ListItem>
                         <asp:ListItem Value="9">电子邮箱</asp:ListItem>
                         <asp:ListItem Value="10">图片</asp:ListItem>
                         <asp:ListItem Value="11">文件</asp:ListItem>
                         <asp:ListItem Value="12" style="color:blue">联动下拉列表</asp:ListItem>
                     </asp:RadioButtonList></td>
             </tr>
             <tr>
                 <td align="right" class="lefttd" style="width: 198px; height: 30px">
                     <strong>默 认 值：</strong></td>
                 <td class="righttd" style="height: 30px">
                     <asp:TextBox CssClass="textbox" ID="DefaultValue" runat="server"></asp:TextBox> <span id="CheckTips" style="color: #ff0033;display:none;">多个默认选项，请用项英文逗号","隔开</span>
                     <asp:Label ID="LabDefaultValueTips" runat="server"></asp:Label>
                     </td>
             </tr>
             <tbody id="ToolbarArea" style="display:none">
                 <tr>
                     <td align="right" class="lefttd" style="width: 198px; height: 30px">
                         <strong>编辑器类型：</strong></td>
                     <td class="righttd" style="height: 30px">
                         <asp:DropDownList ID="Toolbar" runat="server">
                             <asp:ListItem Value="Basic" Selected="True">简洁型编辑器</asp:ListItem>
                             <asp:ListItem Value="Content">标准型编辑器</asp:ListItem>
                             <asp:ListItem Value="Full">增强型编辑器</asp:ListItem>
                         </asp:DropDownList></td>
                 </tr>
               </tbody>
             <tbody id="WidthArea">
             <tr>
                 <td align="right" class="lefttd" style="width: 198px; height: 30px">
                     <strong>显示的宽度：</strong></td>
                 <td class="righttd" style="height: 30px">
                     <asp:TextBox CssClass="textbox" ID="Width" runat="server" Width="44px">160</asp:TextBox>
                     px&nbsp; <span style="color: #ff0066">例如：200px<asp:RegularExpressionValidator ID="RegularExpressionValidator2"
                         runat="server" ControlToValidate="Width" ErrorMessage="请填写数字" ValidationExpression="\d*"></asp:RegularExpressionValidator></span></td>
             </tr>
             </tbody>
             <tbody id="HeightArea" style="display:none">
             <tr>
                 <td align="right" class="lefttd" style="width: 198px; height: 30px">
                     <strong>显示的高度：</strong></td>
                 <td class="righttd" style="height: 30px">
                     <asp:TextBox CssClass="textbox" ID="Height" runat="server" Width="44px">100</asp:TextBox>
                     px&nbsp; <span style="color: #ff0066">例如：200px<asp:RegularExpressionValidator ID="RegularExpressionValidator3"
                         runat="server" ControlToValidate="Height" ErrorMessage="请填写数字" ValidationExpression="\d*"></asp:RegularExpressionValidator></span></td>
             </tr>
             </tbody>
             <tbody id="ParentIDArea" style="display:none">
              <tr>
                <td align="right" class="lefttd" style="width: 198px; height: 39px">
                         <strong>所属父级字段：<br />
                         </strong><span style="color: #0000ff">不选择表示一级联动字段<br />
 不能指定为下级联动字段</span></td>
                     <td class="righttd" style="height: 39px">
                       <asp:DropDownList ID="DrpParentFieldID" runat="server">
                        <asp:ListItem Value="0">--作为一级联动--</asp:ListItem>
             
                       </asp:DropDownList>
                     </td>
                 </tr>
             </tbody>
             <tbody id="ListArea" style="display:none">
                 <tr>
                     <td align="right" class="lefttd" style="width: 198px; height: 39px">
                         <strong>列表选项：<br />
                         </strong><span style="color: #0000ff">每一行为一个列表选项</span>
                     <br />
                     如果值和显示项不同可以用<span style="color:Red">|</span>隔开
正确格式如：<span style="color:Red">男</span> 或 <span style="color:Red">0|男</span>    
                     </td>
                     <td class="righttd" style="height: 39px">
                         <asp:TextBox ID="Options" runat="server" Height="87px" TextMode="MultiLine" Width="219px"></asp:TextBox></td>
                 </tr>
             </tbody>
             <tbody id="FileArea" style="display:none">
             <tr>
                 <td align="right" class="lefttd" style="width: 198px; height: 39px">
                     <strong>允许上传的文件类型：</strong></td>
                 <td class="righttd" style="height: 39px">
                     <asp:TextBox CssClass="textbox" ID="AllowFileExt" runat="server" Width="212px"></asp:TextBox>
                     多个扩展名请用＂|＂隔开</td>
             </tr>
             <tr>
                 <td align="right" class="lefttd" style="width: 198px; height: 30px">
                     <strong>允许上传的文件大小：</strong></td>
                 <td class="righttd" style="height: 30px">
                     <asp:TextBox CssClass="textbox" ID="MaxFileSize" runat="server" Width="41px"></asp:TextBox>
                     KB&nbsp; <span style="color: #ff0000">*</span> <span style="color: blue">提示：1 KB = 1024
                         Byte，1 MB = 1024 KB<span> </span></span>
                 </td>
             </tr>
             </tbody>
             <tr>
                 <td align="right" class="lefttd" style="width: 198px; height: 30px">
                     <strong>字段属性：</strong></td>
                 <td class="righttd" style="height: 30px">
                     <asp:CheckBoxList ID="FieldAtrrib" runat="server" RepeatDirection="Horizontal">
                         <asp:ListItem Selected="True" Value="1">录入项</asp:ListItem>
                         <asp:ListItem Selected="True" Value="2">投稿项</asp:ListItem>
                         <asp:ListItem Value="3">采集项</asp:ListItem>
                         <asp:ListItem Value="4">搜索项</asp:ListItem>
                         <asp:ListItem Value="5">必填项(显示*)</asp:ListItem>
                         <asp:ListItem Value="6">后台管理项</asp:ListItem>
                     </asp:CheckBoxList></td>
             </tr>
             <tr>
                 <td align="right" class="lefttd" style="width: 198px; height: 30px">
                     <strong>字段状态：<br />
                     </strong><span style="color: #0000ff">只有正常状态的字段才可以使用</span></td>
                 <td class="righttd" style="height: 30px">
                     <asp:RadioButtonList ID="Enabled" runat="server" RepeatDirection="Horizontal">
                         <asp:ListItem Selected="True" Value="1">正常</asp:ListItem>
                         <asp:ListItem Value="0">禁用</asp:ListItem>
                     </asp:RadioButtonList></td>
             </tr>
        </table>
        <br />
        <KS:Foot ID="Foot1" runat="server" OnSubmit="Foot1_Submit" SubmitButtonText="确定添加(0)" />
    
    </asp:Panel>


    

  </asp:Content>