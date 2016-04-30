<%@ Page Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.Admin_MoodList" Title="Untitled Page" Codebehind="KS.MoodList.aspx.cs" %>
<%@ Import Namespace="Kesion.Cache"%>
<%@ Import Namespace="Kesion.Publics"%>
<asp:Content ID="Content1" ContentPlaceHolderID="KSContent" Runat="Server">
    <asp:Panel ID="listPanel" runat="server" Width="100%">
        
     <KS:TopNav ID="TopNav1" runat="server" Text="查看表态情况" />
     
      <KS:KSGV ID="list" CssClass="CTable" runat="server" Width="99%" EmptyDataText="没有任何文档被表态过!" GridLines="None" OnRowDataBound="list_RowDataBound" OnRowCommand="list_RowCommand" OnRowCreated="list_RowCreated" AutoGenerateColumns="False" PagerType="Default">
          <Columns>
               <asp:TemplateField HeaderText="选择">
                <itemtemplate>
                    <input type="checkbox"  name="ids" id="ids" value="<%#Eval("id") %>" />
                </itemtemplate>
                <itemstyle horizontalalign="Center" width="50px" />
              </asp:TemplateField>
              
               <asp:TemplateField HeaderText="信息标题">
                <itemtemplate>
                <a href="../../model/view.aspx?m_id=<%#Eval("ChannelID")%>&id=<%#Eval("InfoID") %>" target="_blank"><%#Eval("title") %></a>
                </itemtemplate>
                <itemstyle  width="350px"/>
              </asp:TemplateField>
       
      
             <asp:BoundField DataField="m0" HeaderText="m0" >
                  <itemstyle horizontalalign="Center" width="50px" />
              </asp:BoundField>
             <asp:BoundField DataField="m1" HeaderText="m1" >
                  <itemstyle horizontalalign="Center" width="50px" />
              </asp:BoundField>
             <asp:BoundField DataField="m2" HeaderText="m2" >
                  <itemstyle horizontalalign="Center" width="50px" />
              </asp:BoundField>
             <asp:BoundField DataField="m3" HeaderText="m3" >
                  <itemstyle horizontalalign="Center" width="50px" />
              </asp:BoundField>
             <asp:BoundField DataField="m4" HeaderText="m4" >
                  <itemstyle horizontalalign="Center" width="50px" />
              </asp:BoundField>
             <asp:BoundField DataField="m5" HeaderText="m5" >
                  <itemstyle horizontalalign="Center" width="50px" />
              </asp:BoundField>
             <asp:BoundField DataField="m6" HeaderText="m6" >
                  <itemstyle horizontalalign="Center" width="50px" />
              </asp:BoundField>
             <asp:BoundField DataField="m7" HeaderText="m7" >
                  <itemstyle horizontalalign="Center" width="50px" />
              </asp:BoundField>
             <asp:BoundField DataField="m8" HeaderText="m8" >
                  <itemstyle horizontalalign="Center" width="50px" />
              </asp:BoundField>
             <asp:BoundField DataField="m9" HeaderText="m9" >
                  <itemstyle horizontalalign="Center" width="50px" />
              </asp:BoundField>
             <asp:BoundField DataField="m10" HeaderText="m10" >
                  <itemstyle horizontalalign="Center" width="50px" />
              </asp:BoundField>
             <asp:BoundField DataField="m11" HeaderText="m11" >
                  <itemstyle horizontalalign="Center" width="50px" />
              </asp:BoundField>
             <asp:BoundField DataField="m12" HeaderText="m12" >
                  <itemstyle horizontalalign="Center" width="50px" />
              </asp:BoundField>
             <asp:BoundField DataField="m13" HeaderText="m13" >
                  <itemstyle horizontalalign="Center" width="50px" />
              </asp:BoundField>
             <asp:BoundField DataField="m14" HeaderText="m14" >
                  <itemstyle horizontalalign="Center" width="50px" />
              </asp:BoundField>
              <asp:TemplateField HeaderText="↓管理操作">
               <itemstyle horizontalalign="Center" width="100px" />
             <itemtemplate>
              <asp:LinkButton CssClass="delete" runat="server" id="delete" commandargument=<%#Eval("id") %> commandname="del"></asp:LinkButton>
                </itemtemplate>
            </asp:TemplateField>
          </Columns>
            <HeaderStyle CssClass="CTitle" />
            <EmptyDataRowStyle CssClass="emptycss" />
      </KS:KSGV>
      
      <asp:Panel ID="Panel1" runat="server" Height="30px" Width="741px">
              <div style="margin-top:5px;overflow:hidden;"></div>
            &nbsp;&nbsp;<label><input type="checkbox" name="chkall" id="chkall" onclick="CheckAll(this.form);"></label>
            <input type="button" value="删除选中的项目" onmouseover="this.className='button_on';" onmouseout="this.className='button';" class="button" onclick="if (GetIDS('del')){this.form.action='?action=del';this.form.submit()}" />
    
    </asp:Panel>  
    
     <KS:Page ID="Page1" runat="server" />
           

    </asp:Panel>
    
    

</asp:Content>

