<%@ Page Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.Admin_UserField" Title="字段管理" Codebehind="KS.UserField.aspx.cs" %>
<asp:Content ID="Content1" ContentPlaceHolderID="KSContent" Runat="Server">
    <asp:Panel ID="listPanel" runat="server" Width="100%">
      <div id="manage_top">
        <li id='p1'><asp:LinkButton ID="addbutton" runat="server" OnClick="addbutton_Click">新增字段</asp:LinkButton></li><li id='p7'><asp:LinkButton ID="LinkButton1" runat="server">导出到Excel</asp:LinkButton></li><li id='p9'><asp:LinkButton ID="LinkButton2" runat="server" OnClick="LinkButton2_Click">回上一级</asp:LinkButton></li><div id="gos">当前管理的模型：<asp:Label ID="LabCurrModel" runat="server" Text="Label"></asp:Label></div>
      </div>     

    <div>
        <KS:OrderJS ID="OrderJS1" runat="server" />
        <KS:KSGV ID="FieldListView" runat="server" AutoGenerateColumns="False" DataKeyNames="FieldID" GridLines="None"
            OnRowDataBound="FieldListView_RowDataBound" PagerType="CustomNumeric" Width="99%" EnableTheming="True" OnRowCommand="FieldListView_RowCommand">
            <Columns>
                <asp:TemplateField HeaderText="排序">
                    <itemtemplate>
                  <asp:DropDownList id="orderid" datasource="<%#bindorder() %>" runat="server"></asp:DropDownList>
                    
                    
</itemtemplate>
                    <headerstyle height="18px"/>
                    <itemstyle width="60px" horizontalalign="Center"  />
                </asp:TemplateField>
                  <asp:BoundField DataField="FieldAlias" HeaderText="字段别名">
                    <itemstyle width="100px" />
                </asp:BoundField>
                <asp:BoundField DataField="Name" HeaderText="字段名称">
                <itemstyle width="100px" horizontalalign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="FieldLevel" HeaderText="级别">
                    <itemstyle width="60px" horizontalalign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="FieldType" HeaderText="字段类型">
                    <itemstyle horizontalalign="Center" width="118px" />
                </asp:BoundField>
                <asp:BoundField DataField="InputItem" HeaderText="录入项">
                    <itemstyle horizontalalign="Center" width="50px" />
                </asp:BoundField>
                <asp:BoundField DataField="ContributionItem" HeaderText="投稿项">
                    <itemstyle horizontalalign="Center" width="50px" />
                </asp:BoundField>
                <asp:BoundField DataField="CollectItem" HeaderText="采集项">
                    <itemstyle horizontalalign="Center" width="50px" />
                </asp:BoundField>
                <asp:BoundField DataField="MustFillItem" HeaderText="必填项">
                    <itemstyle horizontalalign="Center" width="50px" />
                </asp:BoundField>
                 <asp:BoundField DataField="disabled" HeaderText="是否启用">
                    <itemstyle horizontalalign="Center" width="70px" />
                </asp:BoundField>

                <asp:TemplateField HeaderText="管理操作">
                <itemtemplate>
                     <asp:LinkButton runat="server" commandargument=<%#Eval("Name") %> commandname="modify">修改</asp:LinkButton>
                     <asp:LinkButton runat="server" id="delete" commandargument=<%#Eval("name") %> commandname="del">删除</asp:LinkButton>
                     <asp:LinkButton runat="server" id="preview" commandargument=<%#Eval("name") %> commandname="preview">预览</asp:LinkButton>
                
</itemtemplate>
                <itemstyle horizontalalign="Center" width="100px" />
                </asp:TemplateField>
            </Columns>
            <HeaderStyle CssClass="CTitle" />
        </KS:KSGV>
        <br />
        <asp:Panel ID="Panel1" runat="server" Height="30px" Width="739px">
            <asp:Button ID="Button1" runat="server" Text="批量保存字段排序" OnClick="Button1_Click1" />&nbsp;<asp:Button
                ID="Button2" runat="server" Text="预览模型" /><br />
            </asp:Panel>
        &nbsp;
        </div>
     </asp:Panel>
    
    <asp:Panel ID="addPanel" runat="server" Width="100%" Visible="false">
    <script language="javascript">
       function ShowArea()
       {
         var l;
         l=document.all.ctl00$KSContent$FieldType.length;   
         for(i=0;i<l;i++){
         if(eval('document.all.ctl00_KSContent_FieldType_'   +   i).checked)
         {
           var v=eval('document.all.ctl00_KSContent_FieldType_'   +   i).value;
           if (v=="2"||v=="3"){
           $("HeightArea").style.display="";}
           else{
           $("HeightArea").style.display="none";}
           if (v=="10"|| v=="11"){
           $("FileArea").style.display=""}
           else{
           $("FileArea").style.display="none";}
           if(v=="4"||v=="5"||v=="6"){
           $("ListArea").style.display="";}
           else{
           $("ListArea").style.display="none";}
           if (v=="5"||v=="6"){
           $("WidthArea").style.display="none";}
           else{
           $("WidthArea").style.display="";}
           if(v=="6"){
           $("CheckTips").style.display="";}
           else{
           $("CheckTips").style.display="none";}
           if(v=="3"){
            $("ToolbarArea").style.display="";}
            else{
            $("ToolbarArea").style.display="none";}
         }
        }
       }
    </script>
        <KS:TopNav ID="TopNav1" runat="server" Text="添加新字段" />
         <table width="100%" border="0" cellpadding="1" cellspacing="1" class="CTable"> 
             <tr>
                 <td align="right" class="lefttd" height="30" style="width: 198px">
                     <strong>所属模型：</strong></td>
                 <td class="righttd">
                     <asp:Label ID="Label1" runat="server" ForeColor="Red" Text="Label"></asp:Label></td>
             </tr>
            <tr>
                <td align="right" class="lefttd" height="30" style="width: 198px">
                    <strong>字段名称：</strong></td>
                <td class="righttd">
                    <asp:TextBox ID="FieldName" runat="server"></asp:TextBox>
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
                     <asp:TextBox ID="FieldAlias" runat="server"></asp:TextBox>
                     <span style="color: #ff0066">*<asp:RequiredFieldValidator ID="RequiredFieldValidator2"
                         runat="server" ControlToValidate="FieldAlias" ErrorMessage="请输入字段别名"></asp:RequiredFieldValidator><br />
                     </span>如:你的姓名，联系方式等等</td>
             </tr>
             <tr>
                 <td align="right" class="lefttd" style="width: 198px; height: 30px">
                     <strong>字段录入提示：</strong></td>
                 <td class="righttd" style="height: 30px">
                     <asp:TextBox ID="Tips" runat="server" Height="37px" TextMode="MultiLine" Width="230px"></asp:TextBox>
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
                         <asp:ListItem Value="8">数字</asp:ListItem>
                         <asp:ListItem Value="9">电子邮箱</asp:ListItem>
                         <asp:ListItem Value="10">图片</asp:ListItem>
                         <asp:ListItem Value="11">文件</asp:ListItem>
                     </asp:RadioButtonList></td>
             </tr>
             <tr>
                 <td align="right" class="lefttd" style="width: 198px; height: 30px">
                     <strong>默 认 值：</strong></td>
                 <td class="righttd" style="height: 30px">
                     <asp:TextBox ID="DefaultValue" runat="server"></asp:TextBox> <span id="CheckTips" style="color: #ff0033;display:none;">多个默认选项，请用项英文逗号","隔开</span></td>
             </tr>
             <tbody id="ToolbarArea" style="display:none">
                 <tr>
                     <td align="right" class="lefttd" style="width: 198px; height: 30px">
                         <strong>编辑器类型：</strong></td>
                     <td class="righttd" style="height: 30px">
                         <asp:DropDownList ID="Toolbar" runat="server">
                             <asp:ListItem Value="Basic" Selected="True">简洁型编辑器</asp:ListItem>
                             <asp:ListItem Value="Content">标准型编辑器</asp:ListItem>
                             <asp:ListItem Value="Default">增强型编辑器</asp:ListItem>
                         </asp:DropDownList></td>
                 </tr>
               </tbody>
             <tbody id="WidthArea">
             <tr>
                 <td align="right" class="lefttd" style="width: 198px; height: 30px">
                     <strong>显示的宽度：</strong></td>
                 <td class="righttd" style="height: 30px">
                     <asp:TextBox ID="Width" runat="server" Width="44px">160</asp:TextBox>
                     px&nbsp; <span style="color: #ff0066">例如：200px<asp:RegularExpressionValidator ID="RegularExpressionValidator2"
                         runat="server" ControlToValidate="Width" ErrorMessage="请填写数字" ValidationExpression="\d*"></asp:RegularExpressionValidator></span></td>
             </tr>
             </tbody>
             <tbody id="HeightArea" style="display:none">
             <tr>
                 <td align="right" class="lefttd" style="width: 198px; height: 30px">
                     <strong>显示的高度：</strong></td>
                 <td class="righttd" style="height: 30px">
                     <asp:TextBox ID="Height" runat="server" Width="44px">100</asp:TextBox>
                     px&nbsp; <span style="color: #ff0066">例如：200px<asp:RegularExpressionValidator ID="RegularExpressionValidator3"
                         runat="server" ControlToValidate="Height" ErrorMessage="请填写数字" ValidationExpression="\d*"></asp:RegularExpressionValidator></span></td>
             </tr>
             </tbody>
             <tbody id="ListArea" style="display:none">
                 <tr>
                     <td align="right" class="lefttd" style="width: 198px; height: 39px">
                         <strong>列表选项：<br />
                         </strong><span style="color: #0000ff">每一行为一个列表选项,值与文本之间可以用“|”隔开。如0|男,1|女,当值和文本一样时，可以省略“|”，如北京，上海等</span></td>
                     <td class="righttd" style="height: 39px">
                         <asp:TextBox ID="Options" runat="server" Height="87px" TextMode="MultiLine" Width="219px"></asp:TextBox></td>
                 </tr>
             </tbody>
             <tbody id="FileArea" style="display:none">
             <tr>
                 <td align="right" class="lefttd" style="width: 198px; height: 39px">
                     <strong>允许上传的文件类型：</strong></td>
                 <td class="righttd" style="height: 39px">
                     <asp:TextBox ID="AllowFileExt" runat="server" Width="212px"></asp:TextBox>
                     多个扩展名请用＂|＂隔开</td>
             </tr>
             <tr>
                 <td align="right" class="lefttd" style="width: 198px; height: 30px">
                     <strong>允许上传的文件大小：</strong></td>
                 <td class="righttd" style="height: 30px">
                     <asp:TextBox ID="MaxFileSize" runat="server" Width="41px"></asp:TextBox>
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