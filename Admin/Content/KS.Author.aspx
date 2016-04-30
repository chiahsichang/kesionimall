<%@ Page Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.Admin_Author" Title="Untitled Page" Codebehind="KS.Author.aspx.cs" %>
<asp:Content ID="Content1" ContentPlaceHolderID="KSContent" Runat="Server">
    <asp:Panel ID="listPanel" runat="server" Width="100%">
    <div id="manage_top" class="menu_top_fixed">
         <ul>
           <li id='p1'><asp:LinkButton ID="addauthor" runat="server" OnClick="addauthor_Click"><b></b>添加作者</asp:LinkButton></li><li id='p4'><asp:LinkButton ID="editauthor" runat="server" OnClick="editauthor_Click"><b></b>编辑作者</asp:LinkButton></li><li id='p3'><asp:LinkButton ID="delauthor" runat="server" OnClick="delauthor_Click"><b></b>删除作者</asp:LinkButton></li>
           </ul>
   </div>  
<div class="menu_top_fixed_height"></div> 
      <KS:KSGV ID="list" cssclass="CTable" runat="server" AutoGenerateColumns="False"  Width="99%" EmptyDataText="没有添加任何作者" GridLines="None" OnRowDataBound="list_RowDataBound" OnRowCommand="list_RowCommand" OnRowCreated="list_RowCreated" AllowPaging="False">
          <Columns>
               <asp:TemplateField HeaderText="&lt;input type='checkbox' name='chkall' id='chkall' onClick='CheckAll(this.form);'/&gt;">
                <ItemStyle HorizontalAlign="Center"  Width="30px"/>
                <ItemTemplate>
                <input type="checkbox"  name="ids" id="ids" value="<%#Eval("authorid") %>" />
                </ItemTemplate>
                </asp:TemplateField>
              <asp:BoundField DataField="authorname" HeaderText="作者姓名" />
              <asp:BoundField DataField="sex" HeaderText="性别" >
                  <itemstyle horizontalalign="Center" width="50px" />
              </asp:BoundField>
              <asp:BoundField DataField="workunits" HeaderText="工作单位" >
                  <itemstyle horizontalalign="Center" />
              </asp:BoundField>
              <asp:BoundField DataField="address" HeaderText="联系地址" >
                  <itemstyle horizontalalign="Center" />
              </asp:BoundField>
              <asp:BoundField DataField="telphone" HeaderText="电话" >
                  <itemstyle horizontalalign="Center" width="80px" />
              </asp:BoundField>
              <asp:BoundField DataField="QQ" HeaderText="QQ" >
                  <itemstyle horizontalalign="Center" width="60px" />
              </asp:BoundField>

               <asp:TemplateField HeaderText="编辑">
                    <itemstyle width="30px" horizontalalign="Center"/>
                       <itemtemplate>
             <asp:LinkButton ID="LinkButton1" CssClass="edit" ToolTip="编辑" runat="server" commandargument=<%#Eval("authorid") %> commandname="modify"></asp:LinkButton>
                    </itemtemplate>
                </asp:TemplateField>
            <asp:TemplateField HeaderText="删除">
                    <itemstyle width="30px" horizontalalign="Center"/>
                       <itemtemplate>
             <asp:LinkButton runat="server" CssClass="delete" ToolTip="删除" id="delete" commandargument=<%#Eval("authorid") %> commandname="del"></asp:LinkButton>
                    </itemtemplate>
                </asp:TemplateField>


          </Columns>
            <HeaderStyle CssClass="CTitle" />
            <EmptyDataRowStyle CssClass="emptycss" />
      </KS:KSGV>
      

    
        <KS:Page ID="Page1" runat="server" />
            

    </asp:Panel>
    
     <asp:Panel ID="addPanel" runat="server" Width="100%" Visible="false">
     <KS:TopNav ID="TopNav1" runat="server" Text="添加作者" />
        <table width="99%" style="margin:0 auto;" border="0" cellpadding="1" cellspacing="1" class="CTable"> 
          <tr>
            <td class="lefttd" height="30" align="right"><b>作者姓名：</b></td>
            <td class="righttd">
                &nbsp;<asp:TextBox CssClass="textbox" ID="AutherName" runat="server"></asp:TextBox> <font color=#ff0000>*</font>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="AutherName"
                    ErrorMessage="请输入作者姓名!"></asp:RequiredFieldValidator></td>
          </tr>
            <tr>
                <td align="right" class="lefttd" height="30">
                    <strong>作者性别：</strong></td>
                <td class="righttd">
                    <asp:RadioButtonList ID="Sex" runat="server" RepeatDirection="Horizontal">
                        <asp:ListItem Selected="True" Value="男">男</asp:ListItem>
                        <asp:ListItem Value="女">女</asp:ListItem>
                    </asp:RadioButtonList></td>
            </tr>
            <tr>
                <td align="right" class="lefttd" height="30">
                    <strong>出生日期：</strong></td>
                <td class="righttd">
                    &nbsp;<asp:TextBox CssClass="textbox Wdate" ID="Birthday" onClick="WdatePicker()" runat="server"></asp:TextBox>
                     
                    </td>
            </tr>
            <tr>
                <td align="right" class="lefttd" height="30">
                    <strong>工作单位：</strong></td>
                <td class="righttd">
                    &nbsp;<asp:TextBox CssClass="textbox" ID="WorkUnits" runat="server" Width="350px"></asp:TextBox>
                    <span class="tips">本站特约作者所在的工作单位</span></td>
            </tr>
            <tr>
                <td align="right" class="lefttd" height="30">
                    <strong>联系地址：</strong></td>
                <td class="righttd">
                    &nbsp;<asp:TextBox CssClass="textbox" ID="Address" runat="server" Width="350px"></asp:TextBox>
                    <span class="tips">本站特约作者的联系地址</span></td>
            </tr>
            <tr>
                <td align="right" class="lefttd" height="30">
                    <strong>联系电话：</strong></td>
                <td class="righttd">
                    &nbsp;<asp:TextBox CssClass="textbox" ID="Telphone" runat="server" Width="350px"></asp:TextBox>
                    <span class="tips">格式：XXX-XXXXXXX</span></td>
            </tr>
            <tr>
                <td align="right" class="lefttd" height="30">
                    <strong>邮政编码：</strong></td>
                <td class="righttd">
                   &nbsp;<asp:TextBox CssClass="textbox" ID="ZipCode" runat="server" Width="66px"></asp:TextBox>
                    6位的邮编<asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server"
                        ControlToValidate="ZipCode" ErrorMessage="RegularExpressionValidator" ValidationExpression="\d{6}">邮政编码不正确</asp:RegularExpressionValidator></td>
            </tr>
            <tr>
                <td align="right" class="lefttd" height="30">
                    <strong>电子邮箱：</strong></td>
                <td class="righttd">
                    &nbsp;<asp:TextBox CssClass="textbox" ID="Email" runat="server"></asp:TextBox>
                    <span class="tips">常用的电子邮箱</span><asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server"
                        ControlToValidate="Email" ErrorMessage="电子邮箱不正确!" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator></td>
            </tr>
            <tr>
                <td align="right" class="lefttd" height="30">
                    <strong>联系ＱＱ：</strong></td>
                <td class="righttd">
                    &nbsp;<asp:TextBox CssClass="textbox" ID="QQ" runat="server" Width="149px"></asp:TextBox>&nbsp;</td>
            </tr>
            <tr>
                <td align="right" class="lefttd" height="30">
                    <strong>个人主页：</strong></td>
                <td class="righttd">
                   &nbsp;<asp:TextBox CssClass="textbox" ID="HomePage" runat="server" Width="350px">http://</asp:TextBox></td>
            </tr>
            <tr>
                <td align="right" class="lefttd" height="30">
                    <strong>个人简历：</strong></td>
                <td class="righttd">
                   &nbsp;<asp:TextBox CssClass="textbox textarea" ID="Resume" runat="server" Height="76px" TextMode="MultiLine" Width="350px"></asp:TextBox></td>
            </tr>
        </table>
      <br />
      <KS:Foot ID="Foot1" runat="server" OnSubmit="Foot1_Submit" />
    </asp:Panel>

</asp:Content>

