<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="PKManageListControl.ascx.cs" Inherits="Kesion.NET.WebSite.PKManageList" %>
 <div id="manage_top" class="menu_top_fixed">
       <ul>
           <li id='p1'><asp:LinkButton ID="addPKButton" runat="server" OnClick="addPKButton_Click"><b></b>���PK����</asp:LinkButton></li>
           <li id='p4'><asp:LinkButton ID="editPKButton" runat="server" OnClick="editPKButton_Click"><b></b>�༭PK����</asp:LinkButton></li>
           <li id='p3'><asp:LinkButton ID="delPKButton" runat="server" OnClick="delPKButton_Click"><b></b>ɾ��PK����</asp:LinkButton></li></ul>
    </div> 
    <div class="menu_top_fixed_height"></div>  
       <asp:GridView ID="grvList" cssclass="CTable" runat="server" AutoGenerateColumns="False" GridLines="None"  Width="99%" OnRowDataBound="GridView1_RowDataBound" OnRowCommand="grvList_RowCommand" EmptyDataText="û������κ�PK����!">
       <HeaderStyle CssClass="CTitle" />
        <EmptyDataRowStyle CssClass="emptycss" />
           <Columns>
            <asp:TemplateField HeaderText="ѡ��">
                <itemstyle horizontalalign="Center" width="50px" />
                <itemtemplate>
                 <input type="checkbox"  name="ids" id="ids" value="<%#Eval("pkid") %>" />
                </itemtemplate>
               </asp:TemplateField>
               <asp:TemplateField HeaderText="״̬">
              <itemstyle width="30px" horizontalalign="Center"/>
              <itemtemplate>
                   <a href="?flag=status&pkid=<%#Eval("pkID")%>" <%# Convert.ToString(Eval("status"))=="0"?"class='no' title='����'":"class='ok' title='����'" %>></a>
              </itemtemplate>
            </asp:TemplateField>

               <asp:TemplateField HeaderText="PK����">
                <ItemTemplate>
                <a href='../../plus/pk/pk.aspx?id=<%#Eval("pkid") %>' title="Ԥ��" target="_blank"><%# Eval("Title") %> <%# GetPkNews(Convert.ToInt16(Eval("pkid")))%></a>
                </ItemTemplate>
               </asp:TemplateField>

               <asp:TemplateField HeaderText="��Ʊ���">
                <ItemTemplate>
                 <span class="tips">
                 ����:<span style="color:Red"><%#Eval("zfvotes") %></span>Ʊ ����:<span style="color:Red"><%#Eval("ffvotes") %></span>Ʊ ����:<span style="color:Red"><%#Eval("sfvotes") %></span>Ʊ
                </span></ItemTemplate>
               </asp:TemplateField>

                <asp:TemplateField HeaderText="����ʱ��">
                <ItemTemplate>
                <span class="tips"><%# Eval("enddate") %></span>
                </ItemTemplate>
               </asp:TemplateField>

               <asp:TemplateField HeaderText="�༭">
                       <itemstyle horizontalalign="Center" width="25px"/>
                        <itemtemplate>
                  <asp:HiddenField ID="hidTimeLimit" runat="server" Value='<%# Eval("TimeLimit") %>' />
                 <asp:LinkButton ID="LKBModify" CssClass="edit" ToolTip="�༭" runat="server" commandargument='<%#Eval("pkid") %>' commandname="modify"></asp:LinkButton>
                        </itemtemplate>
                    </asp:TemplateField>
               <asp:TemplateField HeaderText="ɾ��">
                  <itemstyle horizontalalign="Center" width="25px"/>
                  <ItemTemplate>
                 <asp:LinkButton CssClass="delete" ToolTip="ɾ��" runat="server" id="LKBDelete" commandargument='<%#Eval("pkid") %>' commandname="del"></asp:LinkButton>
                 </ItemTemplate>
               </asp:TemplateField>
           </Columns>
     </asp:GridView>
      &nbsp;&nbsp;<input type="checkbox" name="chkall" id="chkall" onclick="CheckAll(this.form);"/><label for="chkall">ȫ��ѡ��</label>
    <input type="button" value="ɾ��ѡ�е�PK����" onmouseover="this.className='button_on';" onmouseout="this.className='button';" class="button" onclick="if (GetIDS('del')){this.form.action='?flag=del';this.form.submit()}" />
     <KS:Page ID="Page1" runat="server" />