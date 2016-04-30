<%@ Page Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.Admin_FormItem" Title="自定义表单项" Codebehind="KS.FormItem.aspx.cs" %>
<asp:Content ID="Content1" ContentPlaceHolderID="KSContent" Runat="Server">
    <asp:Panel ID="listPanel" runat="server" Width="100%">
        <KS:OrderJS ID="OrderJS1" runat="server" />
         <div id="manage_top" class="menu_top_fixed">
              <ul>
           <li id='p1'><b></b><asp:LinkButton ID="addsubject" runat="server" OnClick="addsubject_Click">新增表单项</asp:LinkButton></li>
          <li id='p4'><b></b><asp:LinkButton ID="editsubject" runat="server" OnClick="editsubject_Click">编辑表单项</asp:LinkButton></li>
          <li id='p3'><b></b><asp:LinkButton ID="delsubject" runat="server" OnClick="delsubject_Click">删除表单项</asp:LinkButton></li>
          <li id='p9'><b></b><asp:LinkButton ID="backbutton" runat="server" OnClick="backbutton_Click">回上一级</asp:LinkButton></li><div id="go"><asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
                  </div>
           </ul>
        </div>  

        <div class="menu_top_fixed_height"></div>  

        <KS:KSGV ID="list" CssClass="CTable" runat="server" AutoGenerateColumns="False" GridLines="None" OnRowDataBound="list_RowDataBound" PagerType="CustomNumeric" Width="99%" EmptyDataText="还没有添加表单项" OnRowCommand="list_RowCommand">
            <EmptyDataRowStyle CssClass="emptycss" />
            <Columns>
            <asp:TemplateField HeaderText="选择">
                <itemstyle horizontalalign="Center" width="50px" />
                <itemtemplate>
                <input type="checkbox"  name="ids" id="ids" value="<%#Eval("name") %>" />
                </itemtemplate>
            </asp:TemplateField>
                <asp:BoundField DataField="name" HeaderText="表单项ID">
                <itemstyle horizontalalign="Center" width="80px" />
                </asp:BoundField>
                <asp:BoundField DataField="fieldname" HeaderText="表单项名称" />
                <asp:BoundField DataField="fieldtype" HeaderText="字段类型">
                    <itemstyle horizontalalign="Center" width="120px" />
                </asp:BoundField>


                <asp:TemplateField HeaderText="是否启用">
                <ItemStyle  HorizontalAlign="Center" Width="60px" />
                    <ItemTemplate>
                   <a href="javascript:;" <%# Convert.ToString(Eval("enabled"))=="0"?"class='no' title='否'":"class='ok' title='是'" %>></a>
                 </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="是否必填">
                <ItemStyle  HorizontalAlign="Center" Width="60px" />
                    <ItemTemplate>
                   <a href="javascript:;" <%# Convert.ToString(Eval("mustfill"))=="0"?"class='no' title='否'":"class='ok' title='是'" %>></a>
                 </ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="排序">
                <itemstyle horizontalalign="Center" width="80px" />
                 <itemtemplate>
                  <asp:DropDownList id="orderid" datasource="<%#bindorder() %>" runat="server"></asp:DropDownList>
                </itemtemplate>
                </asp:TemplateField>

             <asp:TemplateField HeaderText="编辑">
              <itemstyle width="30px" horizontalalign="Center"/>
              <itemtemplate>
                     <asp:LinkButton ToolTip="编辑" CssClass="edit" ID="LinkButton1"  runat="server" commandargument=<%#Eval("name") %> commandname="modify"></asp:LinkButton>
              </itemtemplate>
            </asp:TemplateField>

             <asp:TemplateField HeaderText="删除">
              <itemstyle width="30px" horizontalalign="Center"/>
              <itemtemplate>
                     <asp:LinkButton runat="server" CssClass="delete" ToolTip="删除" id="delete" commandargument=<%#Eval("name") %> commandname="del"></asp:LinkButton>
              </itemtemplate>
            </asp:TemplateField>

                 <asp:TemplateField HeaderText="预览">
                <itemstyle width="30px" horizontalalign="Center" />
                     <itemtemplate>
                     <asp:LinkButton runat="server" ToolTip="预览" CssClass="preview" id="preview" commandargument=<%#Eval("name") %> commandname="preview"></asp:LinkButton>
              </itemtemplate>
           
            </asp:TemplateField>
            </Columns>
            <HeaderStyle CssClass="CTitle" />
        </KS:KSGV>
        <asp:Panel ID="Panel1" runat="server" Width="741px">
          <div style="margin-top:5px;overflow:hidden;"></div>
            &nbsp;&nbsp;<input type="checkbox" name="chkall" id="chkall" onclick="CheckAll(this.form);"/><label for="chkall">全部选中</label>
            &nbsp;&nbsp;&nbsp;<asp:Button ID="DelButton" runat="server" Text="删除选中的表单项" OnClick="DelButton_Click"/>
              <asp:Button ID="Button1" runat="server" Text="保存排序" OnClick="Button1_Click" />
           </asp:Panel>
    </asp:Panel>
    
    <asp:Panel ID="addPanel" runat="server" Width="100%" Visible="false">
       <script language="javascript">
       function Setdisplay(s){
       if (s==3||s==4||s==5){ 
       jQuery("#OptionsArea").show();} 
       else 
       jQuery("#OptionsArea").hide();
       if (s==5){
       jQuery("#mutiltips").show();}
       else
           jQuery("#mutiltips").hide();
       if (s == 9)
           jQuery("#UploadSetting").show();
       else
           jQuery("#UploadSetting").hide();
       }
       </script>
        <KS:TopNav ID="TopNav1" runat="server" Text="添加表单项" />
        <table width="100%" border="0" cellpadding="1" cellspacing="1" class="CTable"> 
            <tr>
                <td align="right" class="lefttd" height="30" style="width: 146px">
                    <strong>表单项目：</strong></td>
                <td class="righttd">
                    <asp:Label ID="LabSubject" runat="server" Text="Label" ForeColor="Red"></asp:Label></td>
            </tr>
          <tr>
            <td class="lefttd" height="30" align="right" style="width: 146px"><b>表单项名称：</b></td>
            <td class="righttd">
                &nbsp;<asp:TextBox CssClass="textbox" ID="FieldName" runat="server" Width="210px"></asp:TextBox>
                如，你的姓名等<asp:RequiredFieldValidator ID="RequiredFieldValidator1" Display="Dynamic" runat="server" ControlToValidate="FieldName"
                    ErrorMessage="请填写表单项名称!"></asp:RequiredFieldValidator></td>
          </tr>
        <tr>
            <td align="right" class="lefttd" height="30" style="width: 146px">
                <strong>表单类型：</strong></td>
            <td class="righttd">
                &nbsp;<asp:DropDownList CssClass="select" ID="FieldType" runat="server" Width="158px">
                 <asp:ListItem Value="1">单行文本(text)</asp:ListItem>
                 <asp:ListItem Value="2">多行文本(textarea)</asp:ListItem>
                 <asp:ListItem Value="3">下拉列表(select)</asp:ListItem>
                 <asp:ListItem Value="4">单选框(radio)</asp:ListItem>
                 <asp:ListItem Value="5">复选框(checkbox)</asp:ListItem>
                 <asp:ListItem Value="6">数字(text)</asp:ListItem>
                 <asp:ListItem Value="7">日期和时间(text)</asp:ListItem>
                 <asp:ListItem Value="8">电子邮箱(text)</asp:ListItem>
                 <asp:ListItem Value="9">上传文件(text)</asp:ListItem>
                </asp:DropDownList>
                <asp:label id="labfiledtips" text="* 一旦设定就不可修改" runat="server" ForeColor="Red"></asp:label></td>
        </tr>

        <tbody id="UploadSetting" style="display:none">
          <tr>
                <td align="right" class="lefttd" height="30" style="width: 146px">
                    <strong>上传设置：</strong></td>
                <td class="righttd">
                       <strong>允许的上传的文件类型：</strong>
                    &nbsp;<asp:TextBox CssClass="textbox" ID="TxtUploadType" runat="server" Text="jpg|gif|png" Width="210px"></asp:TextBox>
                    <span class="tips">多个扩展名用“|”隔开，如jpg|gif|png等。</span>
                    <br />
                    <strong>允许的上传的文件大小：</strong>
                    &nbsp;<asp:TextBox CssClass="textbox" ID="TxtFileMaxSize" Text="1024" runat="server" Width="50px"></asp:TextBox> KB
                    <span class="tips">单个文件允许上传的大小。</span>
                    </td>
            </tr>
        </tbody>

            <tr>
                <td align="right" class="lefttd" height="30" style="width: 146px">
                    <strong>默 认 值：</strong></td>
                <td class="righttd">
                    &nbsp;<asp:TextBox CssClass="textbox" ID="DefaultValue" runat="server" Width="210px"></asp:TextBox>
                    <span id="mutiltips" style="color:Red;display:none">多个默认选项，请用英文逗号“,”隔开</span>
                    </td>
            </tr>
            <tbody id="OptionsArea" style="display:none">
            <tr>
                <td align="right" class="lefttd" height="30" style="width: 146px">
                    <strong>列表选项：<br />
                    </strong><span style="color: blue">注：每一个选项为一行</span></td>
                <td class="righttd">
                    &nbsp;<asp:TextBox ID="Options" CssClass="textbox" runat="server" Height="74px" TextMode="MultiLine" Width="217px"></asp:TextBox></td>
            </tr>
            </tbody>
            <tr>
                <td align="right" class="lefttd" height="30" style="width: 146px">
                    <strong>是否必填：</strong></td>
                <td class="righttd">
                    <asp:RadioButtonList ID="MustFill" runat="server" RepeatDirection="Horizontal">
                        <asp:ListItem Selected="True" Value="1">是</asp:ListItem>
                        <asp:ListItem Value="0">否</asp:ListItem>
                    </asp:RadioButtonList></td>
            </tr>
            <tr>
                <td align="right" class="lefttd" height="30" style="width: 146px">
                    <strong>是否启用：</strong></td>
                <td class="righttd"><asp:RadioButtonList ID="Enabeld" runat="server" RepeatDirection="Horizontal">
                    <asp:ListItem Selected="True" Value="1">启用</asp:ListItem>
                    <asp:ListItem Value="0">禁用</asp:ListItem>
                </asp:RadioButtonList></td>
            </tr>
       </table>
        <br />
        <KS:Foot ID="Foot1" runat="server" SubmitButtonText="确定添加(0)" OnSubmit="Foot1_Submit" />
    </asp:Panel>
    
    <asp:Panel ID="previewPanel" runat="server" Width="100%" Visible="false">
        <KS:TopNav ID="TopNav2" runat="server" Text="预览表单项" />
        <table width="100%" border="0" cellpadding="1" cellspacing="1" class="CTable"> 
            <tr>
                <td align="right" class="lefttd" height="30" style="width: 198px">
                    <strong>
                        <asp:Label ID="LabFieldName" runat="server" Text="Label" Font-Bold="True"></asp:Label></strong></td>
                <td class="righttd">
                    <asp:Label ID="LabFieldType" runat="server" Text="Label"></asp:Label></td>
            </tr>
        </table>
        <br />
        <KS:Foot ID="Foot2" runat="server" SubmitButtonText="我要修改(0)" OnSubmit="Foot2_Submit" />
    </asp:Panel>
    
</asp:Content>

