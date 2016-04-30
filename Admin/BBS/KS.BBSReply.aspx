<%@ Page Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.Admin_BBSReply" Title="��˻���ظ�����" Codebehind="KS.BBSReply.aspx.cs" %>
<%@ Import Namespace="Kesion.Cache" %>
<%@ Import Namespace="Kesion.Publics" %>
<%@ Import Namespace="Kesion.HtmlTags" %>
<asp:Content ID="Content1" ContentPlaceHolderID="KSContent" Runat="Server">
    <asp:Panel ID="ListPanel" runat="server" Width="100%">
    <div id="manage_top" class="toptitle menu_top_fixed" style="text-align:left">
    <span style="float:right;padding-right:10px">
            <select name="board" onchange="location.href='?boardId='+this.value;">
                  <option value="0">==���������ظ�==</option>
                  <%=MyCache.GetCacheBoardOption(Utils.StrToInt(KSCMS.S("boardId"))) %>
              </select>
          </span>
    
    ��˻���Ļظ�
     ��ǰ���ݱ�<asp:DropDownList ID="DrpPostTable" runat="server"></asp:DropDownList>
    </div>  
    <div class="menu_top_fixed_height"></div> 
    <script>
        function changeTable(v) {
            location.href = "KS.BBSReply.Aspx?showType=<%=KSCMS.S("showType")%>&postTable=" + v;
        }
    </script>    
        

        <div class="message">
        ��ǰλ�ã�<asp:Label ID="LabNav" runat="server"></asp:Label>
        </div>
       
       
 <div class="tabs_header">
    <ul class="tabs">
    <li<%=KSCMS.S("showType")==""||KSCMS.S("showType")=="0"?" class='active'":string.Empty %>>
        <a href="KS.BBSReply.Aspx?showType=0&<%=UtilsQueryParam.Get("showType")%>"><span>���лظ�</span></a></li>
    <li<%=KSCMS.S("showType")=="1"?" class='active'":string.Empty %>>
        <a href="KS.BBSReply.Aspx?showType=1&<%=UtilsQueryParam.Get("showType") %>">
        <span>δ��˵Ļظ�</span></a></li>
    <li<%=KSCMS.S("showType")=="2"?" class='active'":string.Empty %>>
        <a href="KS.BBSReply.Aspx?showType=2&<%=UtilsQueryParam.Get("showType")%>">
        <span>����˵Ļظ�</span></a></li>

    
    </ul></div><KS:ksgv id="list" cssclass="CTable" runat="server" AutoGenerateColumns="False" 
            EmptyDataText="û���κλظ�!" PagerType="CustomNumeric" Width="99%" 
            GridLines="None" OnRowCommand="List_RowCommand" 
            OnRowCreated="List_RowCreated" onrowdatabound="list_RowDataBound">
        <Columns>
         <asp:TemplateField HeaderText="ѡ��">
                <itemstyle horizontalalign="Center" Height="30px" width="30px" />
                <itemtemplate>
                <input type="checkbox"  name="ids" id="ids" value="<%#Eval("postid") %>" /></itemtemplate></asp:TemplateField>
            
            <asp:TemplateField HeaderText="״̬">
              <itemstyle width="30px" horizontalalign="Center"/>
              <itemtemplate>
                   <a href="?action=verify&postTable=<%=postTable %>&ids=<%# Eval("postId") %>" <%# Convert.ToString(Eval("verify"))=="0"?"class='no' title='δ���'":"class='ok' title='�����'" %>></a>
              </itemtemplate>
            </asp:TemplateField>
            
            <asp:TemplateField HeaderText="����">
                <itemtemplate>
                <a href="<%#BasicField.GetClubShowUrl(Utils.StrToInt(Eval("topicid"))) %>" target="_blank"><%# Utils.CutStr(Convert.ToString(Eval("Topic")),40) %></a>
                </itemtemplate>
                
                </asp:TemplateField>
                
                <asp:TemplateField HeaderText="�ظ�">
                <itemstyle horizontalalign="Left" />
                <itemtemplate>
                <%# Utils.CutStr(Convert.ToString(Eval("Content")), 30)%>
                </itemtemplate>
            </asp:TemplateField>
            <asp:BoundField HeaderText="�ش���" DataField="username">
                <itemstyle verticalalign="Middle"  horizontalalign="Center"/>
            </asp:BoundField>
            <asp:BoundField HeaderText="�ش�ʱ��" DataField="adddate">
                <itemstyle verticalalign="Middle"  horizontalalign="Center"/>
            </asp:BoundField>

                <asp:TemplateField HeaderText="״̬">
                <itemstyle horizontalalign="Center" />
                <itemtemplate>
                <a href="?action=verify&ids=<%# Eval("postId") %>">
                <%#Convert.ToString(Eval("verify"))=="1"?"<span style='color:green'>�����</span>":"<span style='color:red'>δ���</span>" %></a>
                </itemtemplate></asp:TemplateField>
                
                <asp:TemplateField HeaderText="���������">
                <itemstyle horizontalalign="Center" />
             <itemtemplate>
             <asp:LinkButton runat="server" commandargument=<%#Eval("postid") %> commandname="modify"><img src="../../admin/images/Edit.gif" border="0" title="�޸�" />�޸�</asp:LinkButton><asp:LinkButton runat="server" id="delete" commandargument=<%#Eval("postid") %> commandname="del"><img src="../../admin/images/del.gif" border="0" title="ɾ��" />ɾ��</asp:LinkButton></itemtemplate></asp:TemplateField></Columns><HeaderStyle CssClass="CTitle" />
        <EmptyDataRowStyle CssClass="emptycss" />
    </KS:ksgv>
    
        <asp:Panel ID="Panel2" runat="server" Height="30px" Width="741px">
          <div style="margin-top:8px"></div>
            &nbsp;&nbsp;<input type="checkbox" name="chkall" id="chkall" onclick="CheckAll(this.form);"/><label for="chkall">ȫ��ѡ��</label>
            
           &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="button" value="ɾ����¼" onmouseover="this.className='button_on';" onmouseout="this.className='button';" class="button" onclick="if (GetIDS('del')){this.form.action='?action=del';this.form.submit()}" />
           
            <asp:Button 
                ID="BtnVerify" runat="server" Text="�������" CssClass="button" 
                onclick="BtnVerify_Click"/> <asp:Button ID="BtnUnVerity" runat="server" CssClass="button" 
             Text="ȡ�����" onclick="BtnUnVerity_Click"/>
      </asp:Panel>
      
            
     <KS:Page ID="Page1" runat="server" />
    
    
     <div class="message">
<strong>�����ش�</strong><asp:TextBox runat="server" ID="TxtKeyWord" CssClass="textbox" /> 
</asp:DropDownList>
    <asp:Button ID="BtnSearch" runat="server" CssClass="button" Text="��ʼ����" 
            onclick="BtnSearch_Click"  />
        </div>

</asp:Panel>


     
    <asp:Panel ID="AddPanel" runat="server"  Width="100%" Visible="false">
    <KS:TopNav ID="TopNav1" runat="server" Text="�޸Ļش�" />
    
  <table width="100%" align="center" border="0" cellpadding="1" cellspacing="1" class="CTable"> 


        <tr>
            <td align="right" class="lefttd" height="30" style="width: 102px">
                <strong>�ش�</strong></td>
                <td class="righttd">&nbsp;<asp:TextBox ID="TxtContent" TextMode="MultiLine" CssClass="textbox" Width="600px" Height="200px" runat="server"></asp:TextBox></td>
        </tr>
        <tr>
            <td align="right" class="lefttd" height="30" style="width: 102px">
                <strong>״̬��</strong></td>
                <td class="righttd">&nbsp;
                <asp:RadioButtonList ID="RdbVerify" runat="server" RepeatLayout="Flow" RepeatDirection="Horizontal">
                 <asp:ListItem Value="0">δ���</asp:ListItem>
                 <asp:ListItem Value="1">�����</asp:ListItem>
                </asp:RadioButtonList>
                
                </td>
        </tr>
        </table>
      
      

      <div style="clear:both;text-align:center">
      <br />
        <KS:Foot ID="Foot1" runat="server" OnSubmit="Foot1_Submit" />
      
    </asp:Panel>
        <script>
            function CheckForm() {
                if (jQuery('#<%=this.TxtContent.ClientID %>').val() == '') {
                    KesionJS.Alert('�ش��������!', "jQuery('#<%=this.TxtContent.ClientID %>').focus()");
                    return false;
                }
                return true;
            }

    </script>
</asp:Content>
