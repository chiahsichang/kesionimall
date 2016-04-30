<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="PKManageListControl.ascx.cs" Inherits="Kesion.NET.WebSite.PKManageList" %>
 <div id="manage_top" class="menu_top_fixed">
       <ul>
           <li id='p1'><asp:LinkButton ID="addPKButton" runat="server" OnClick="addPKButton_Click"><b></b>添加PK主题</asp:LinkButton></li>
           <li id='p4'><asp:LinkButton ID="editPKButton" runat="server" OnClick="editPKButton_Click"><b></b>编辑PK主题</asp:LinkButton></li>
           <li id='p3'><asp:LinkButton ID="delPKButton" runat="server" OnClick="delPKButton_Click"><b></b>删除PK主题</asp:LinkButton></li></ul>
    </div> 
    <div class="menu_top_fixed_height"></div>  
       <asp:GridView ID="grvList" cssclass="CTable" runat="server" AutoGenerateColumns="False" GridLines="None"  Width="99%" OnRowDataBound="GridView1_RowDataBound" OnRowCommand="grvList_RowCommand" EmptyDataText="没有添加任何PK主题!">
       <HeaderStyle CssClass="CTitle" />
        <EmptyDataRowStyle CssClass="emptycss" />
           <Columns>
            <asp:TemplateField HeaderText="选择">
                <itemstyle horizontalalign="Center" width="50px" />
                <itemtemplate>
                 <input type="checkbox"  name="ids" id="ids" value="<%#Eval("pkid") %>" />
                </itemtemplate>
               </asp:TemplateField>
               <asp:TemplateField HeaderText="状态">
              <itemstyle width="30px" horizontalalign="Center"/>
              <itemtemplate>
                   <a href="?flag=status&pkid=<%#Eval("pkID")%>" <%# Convert.ToString(Eval("status"))=="0"?"class='no' title='锁定'":"class='ok' title='正常'" %>></a>
              </itemtemplate>
            </asp:TemplateField>

               <asp:TemplateField HeaderText="PK主题">
                <ItemTemplate>
                <a href='../../plus/pk/pk.aspx?id=<%#Eval("pkid") %>' title="预览" target="_blank"><%# Eval("Title") %> <%# GetPkNews(Convert.ToInt16(Eval("pkid")))%></a>
                </ItemTemplate>
               </asp:TemplateField>

               <asp:TemplateField HeaderText="得票情况">
                <ItemTemplate>
                 <span class="tips">
                 正方:<span style="color:Red"><%#Eval("zfvotes") %></span>票 反方:<span style="color:Red"><%#Eval("ffvotes") %></span>票 三方:<span style="color:Red"><%#Eval("sfvotes") %></span>票
                </span></ItemTemplate>
               </asp:TemplateField>

                <asp:TemplateField HeaderText="结束时间">
                <ItemTemplate>
                <span class="tips"><%# Eval("enddate") %></span>
                </ItemTemplate>
               </asp:TemplateField>

               <asp:TemplateField HeaderText="编辑">
                       <itemstyle horizontalalign="Center" width="25px"/>
                        <itemtemplate>
                  <asp:HiddenField ID="hidTimeLimit" runat="server" Value='<%# Eval("TimeLimit") %>' />
                 <asp:LinkButton ID="LKBModify" CssClass="edit" ToolTip="编辑" runat="server" commandargument='<%#Eval("pkid") %>' commandname="modify"></asp:LinkButton>
                        </itemtemplate>
                    </asp:TemplateField>
               <asp:TemplateField HeaderText="删除">
                  <itemstyle horizontalalign="Center" width="25px"/>
                  <ItemTemplate>
                 <asp:LinkButton CssClass="delete" ToolTip="删除" runat="server" id="LKBDelete" commandargument='<%#Eval("pkid") %>' commandname="del"></asp:LinkButton>
                 </ItemTemplate>
               </asp:TemplateField>
           </Columns>
     </asp:GridView>
      &nbsp;&nbsp;<input type="checkbox" name="chkall" id="chkall" onclick="CheckAll(this.form);"/><label for="chkall">全部选中</label>
    <input type="button" value="删除选中的PK主题" onmouseover="this.className='button_on';" onmouseout="this.className='button';" class="button" onclick="if (GetIDS('del')){this.form.action='?flag=del';this.form.submit()}" />
     <KS:Page ID="Page1" runat="server" />