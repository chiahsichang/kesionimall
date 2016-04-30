<%@ Page Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.Admin_Content_Comment" Title="Untitled Page" Codebehind="KS.Comment.aspx.cs" %>
<%@ Import Namespace="Kesion.Publics"%>
<asp:Content ID="Content1" ContentPlaceHolderID="KSContent" Runat="Server">
       <div id="manage_top" class="menu_top_fixed">
          <ul>
           <li id='p1'><asp:LinkButton ID="vbt" runat="server" OnClick="vbt_Click"><b></b>�������</asp:LinkButton></li>
           <li id='p13'><asp:LinkButton ID="cvbt" runat="server" OnClick="cvbt_Click"><b></b>ȡ�����</asp:LinkButton></li>
           <li id='p3'><asp:LinkButton ID="dbt" runat="server" OnClick="dbt_Click"><b></b>ɾ������</asp:LinkButton></li>
          
             <%if (showType == 3)
            { %>
               <li id='p1'><asp:LinkButton ID="LinkButton1" runat="server" OnClientClick="return(GetIDS());" OnClick="Button3_Click"><b></b>����������������</asp:LinkButton></li>
          <%} %>
               
           <div id='go'><asp:DropDownList ID="S_ChannelID" runat="server">
           <asp:ListItem Value="0">---��ģ������---</asp:ListItem>
              </asp:DropDownList></div>
           </ul>
       </div> 
        <div class="menu_top_fixed_height"></div> 
<div class="tabs_header">
    <ul class="tabs">
    <li<%=KSCMS.S("showType")==""?" class='active'":string.Empty %>><a href="KS.Comment.Aspx"><span>��������</span></a></li>
    <li<%=KSCMS.S("showType")=="1"?" class='active'":string.Empty %>><a href="KS.Comment.Aspx?showType=1"><span>δ��˵�����</span></a></li>
    <li<%=KSCMS.S("showType")=="2"?" class='active'":string.Empty %>><a href="KS.Comment.Aspx?showType=2"><span>����˵�����</span></a></li>
    <li<%=KSCMS.S("showType")=="3"?" class='active'":string.Empty %>><a href="KS.Comment.Aspx?showType=3"><span>���ٱ�������</span></a></li>
    </ul>
</div>
     
<KS:KSGV ID="list" cssclass="CTable" runat="server"  AutoGenerateColumns="False" PagerType="CustomNumeric" Width="99%" EmptyDataText="û���κ����ۣ�" GridLines="None" OnRowDataBound="list_RowDataBound" OnRowCommand="list_RowCommand" OnRowCreated="list_RowCreated" AllowPaging="false" >
          <Columns>
               <asp:TemplateField HeaderText="&lt;input type='checkbox' name='chkall' id='chkall' onClick='CheckAll(this.form);'/&gt;">
                <ItemStyle HorizontalAlign="Center"  Width="30px"/>
                <ItemTemplate>
                <input type="checkbox"  name="ids" id="ids" value="<%#Eval("id") %>" />
                </ItemTemplate>
                </asp:TemplateField>
              <asp:TemplateField HeaderText="��������">
                  <itemtemplate>
                    <span class="plicon"></span>
                    <span style="cursor:pointer" onmousedown='parent.openWin("�鿴��������","content/KS.CommentShow.aspx?ID="+<%# Eval("ID") %>,false);return false;'>
                    <%# CutTitle(Convert.ToString(Eval("Content")),Convert.ToString(Eval("Reports"))) %>
                    </span>
               </itemtemplate>
              </asp:TemplateField>
              <asp:BoundField DataField="UserName" HeaderText="�û��ǳ�" >
                  <itemstyle width="60px" horizontalalign="Center" />
              </asp:BoundField>
              <asp:BoundField DataField="Anonymous" HeaderText="���" >
                  <itemstyle horizontalalign="Center" width="50px" />
              </asp:BoundField>
              <asp:BoundField DataField="UserIP" HeaderText="�û�IP" >
                  <itemstyle horizontalalign="Center" width="80px" />
              </asp:BoundField>
              <asp:BoundField DataField="AddDate" HtmlEncode="False" DataFormatString="{0:d}" HeaderText="����ʱ��" >
                  <itemstyle horizontalalign="Center" width="100px" />
              </asp:BoundField>
              <asp:BoundField Visible="false" DataField="Support" HtmlEncode="False" DataFormatString="&lt;font color=red&gt;{0}&lt;/font&gt; Ʊ" HeaderText="֧��" >
                  <itemstyle horizontalalign="Center" width="60px" />
              </asp:BoundField>
               <asp:BoundField Visible="false" DataField="Opposition" HtmlEncode="False" DataFormatString="&lt;font color=ff6600&gt;{0}&lt;/font&gt; Ʊ" HeaderText="����" >
                  <itemstyle horizontalalign="Center" width="60px" />
              </asp:BoundField>


              <asp:TemplateField HeaderText="״̬">
              <itemstyle width="30px" horizontalalign="Center"/>
              <itemtemplate>
                   <a href="?action=verify&id=<%#Eval("ID")%>" <%# Convert.ToString(Eval("verify"))=="0"?"class='no' title='δ���'":"class='ok' title='�����'" %>></a>
              </itemtemplate>
            </asp:TemplateField>

              <asp:TemplateField HeaderText="�鿴">
                    <itemstyle width="30px" horizontalalign="Center"/>
                                <itemtemplate>
             <a href="#" class="preview" onclick='ShowComment(<%# Eval("ID") %>);return false;'></a>
                    </itemtemplate>
                </asp:TemplateField>
              <asp:TemplateField HeaderText="ɾ��">
                    <itemstyle width="30px" horizontalalign="Center"/>
                                <itemtemplate>
             <asp:LinkButton runat="server" id="delete" CssClass="delete" commandargument=<%#Eval("id") %> commandname="del" ToolTip="ɾ��"></asp:LinkButton>
                    </itemtemplate>
                </asp:TemplateField>


          </Columns>
            <HeaderStyle CssClass="CTitle" />
            <EmptyDataRowStyle CssClass="emptycss" />
      </KS:KSGV>

      <script>
          function ShowComment(id) {
              top.openWin('�鿴��������', 'content/KS.CommentShow.aspx?id=' + id, false, 780, 480);
          }
      </script>
  
          
          <KS:Page ID="Page1" runat="server" />
        <script type="text/javascript">
            showtips(' <span class="state"><strong>˵����</strong><br /></span>������������۽������֣���ô���ͨ����ֱ�Ӹ������˼ӻ��֣�֮ǰ���۱�ɾ������ȡ����ˣ��ͳ�ȥ�Ļ��ֽ����ܷ���!');
		</script>

          
              
</asp:Content>

