<%@ Page Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.Admin_BBSReply" Title="审核话题回复管理" Codebehind="KS.BBSReply.aspx.cs" %>
<%@ Import Namespace="Kesion.Cache" %>
<%@ Import Namespace="Kesion.Publics" %>
<%@ Import Namespace="Kesion.HtmlTags" %>
<asp:Content ID="Content1" ContentPlaceHolderID="KSContent" Runat="Server">
    <asp:Panel ID="ListPanel" runat="server" Width="100%">
    <div id="manage_top" class="toptitle menu_top_fixed" style="text-align:left">
    <span style="float:right;padding-right:10px">
            <select name="board" onchange="location.href='?boardId='+this.value;">
                  <option value="0">==按版块浏览回复==</option>
                  <%=MyCache.GetCacheBoardOption(Utils.StrToInt(KSCMS.S("boardId"))) %>
              </select>
          </span>
    
    审核话题的回复
     当前数据表：<asp:DropDownList ID="DrpPostTable" runat="server"></asp:DropDownList>
    </div>  
    <div class="menu_top_fixed_height"></div> 
    <script>
        function changeTable(v) {
            location.href = "KS.BBSReply.Aspx?showType=<%=KSCMS.S("showType")%>&postTable=" + v;
        }
    </script>    
        

        <div class="message">
        当前位置：<asp:Label ID="LabNav" runat="server"></asp:Label>
        </div>
       
       
 <div class="tabs_header">
    <ul class="tabs">
    <li<%=KSCMS.S("showType")==""||KSCMS.S("showType")=="0"?" class='active'":string.Empty %>>
        <a href="KS.BBSReply.Aspx?showType=0&<%=UtilsQueryParam.Get("showType")%>"><span>所有回复</span></a></li>
    <li<%=KSCMS.S("showType")=="1"?" class='active'":string.Empty %>>
        <a href="KS.BBSReply.Aspx?showType=1&<%=UtilsQueryParam.Get("showType") %>">
        <span>未审核的回复</span></a></li>
    <li<%=KSCMS.S("showType")=="2"?" class='active'":string.Empty %>>
        <a href="KS.BBSReply.Aspx?showType=2&<%=UtilsQueryParam.Get("showType")%>">
        <span>已审核的回复</span></a></li>

    
    </ul></div><KS:ksgv id="list" cssclass="CTable" runat="server" AutoGenerateColumns="False" 
            EmptyDataText="没有任何回复!" PagerType="CustomNumeric" Width="99%" 
            GridLines="None" OnRowCommand="List_RowCommand" 
            OnRowCreated="List_RowCreated" onrowdatabound="list_RowDataBound">
        <Columns>
         <asp:TemplateField HeaderText="选择">
                <itemstyle horizontalalign="Center" Height="30px" width="30px" />
                <itemtemplate>
                <input type="checkbox"  name="ids" id="ids" value="<%#Eval("postid") %>" /></itemtemplate></asp:TemplateField>
            
            <asp:TemplateField HeaderText="状态">
              <itemstyle width="30px" horizontalalign="Center"/>
              <itemtemplate>
                   <a href="?action=verify&postTable=<%=postTable %>&ids=<%# Eval("postId") %>" <%# Convert.ToString(Eval("verify"))=="0"?"class='no' title='未审核'":"class='ok' title='已审核'" %>></a>
              </itemtemplate>
            </asp:TemplateField>
            
            <asp:TemplateField HeaderText="话题">
                <itemtemplate>
                <a href="<%#BasicField.GetClubShowUrl(Utils.StrToInt(Eval("topicid"))) %>" target="_blank"><%# Utils.CutStr(Convert.ToString(Eval("Topic")),40) %></a>
                </itemtemplate>
                
                </asp:TemplateField>
                
                <asp:TemplateField HeaderText="回复">
                <itemstyle horizontalalign="Left" />
                <itemtemplate>
                <%# Utils.CutStr(Convert.ToString(Eval("Content")), 30)%>
                </itemtemplate>
            </asp:TemplateField>
            <asp:BoundField HeaderText="回答者" DataField="username">
                <itemstyle verticalalign="Middle"  horizontalalign="Center"/>
            </asp:BoundField>
            <asp:BoundField HeaderText="回答时间" DataField="adddate">
                <itemstyle verticalalign="Middle"  horizontalalign="Center"/>
            </asp:BoundField>

                <asp:TemplateField HeaderText="状态">
                <itemstyle horizontalalign="Center" />
                <itemtemplate>
                <a href="?action=verify&ids=<%# Eval("postId") %>">
                <%#Convert.ToString(Eval("verify"))=="1"?"<span style='color:green'>已审核</span>":"<span style='color:red'>未审核</span>" %></a>
                </itemtemplate></asp:TemplateField>
                
                <asp:TemplateField HeaderText="↓管理操作">
                <itemstyle horizontalalign="Center" />
             <itemtemplate>
             <asp:LinkButton runat="server" commandargument=<%#Eval("postid") %> commandname="modify"><img src="../../admin/images/Edit.gif" border="0" title="修改" />修改</asp:LinkButton><asp:LinkButton runat="server" id="delete" commandargument=<%#Eval("postid") %> commandname="del"><img src="../../admin/images/del.gif" border="0" title="删除" />删除</asp:LinkButton></itemtemplate></asp:TemplateField></Columns><HeaderStyle CssClass="CTitle" />
        <EmptyDataRowStyle CssClass="emptycss" />
    </KS:ksgv>
    
        <asp:Panel ID="Panel2" runat="server" Height="30px" Width="741px">
          <div style="margin-top:8px"></div>
            &nbsp;&nbsp;<input type="checkbox" name="chkall" id="chkall" onclick="CheckAll(this.form);"/><label for="chkall">全部选中</label>
            
           &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="button" value="删除记录" onmouseover="this.className='button_on';" onmouseout="this.className='button';" class="button" onclick="if (GetIDS('del')){this.form.action='?action=del';this.form.submit()}" />
           
            <asp:Button 
                ID="BtnVerify" runat="server" Text="批量审核" CssClass="button" 
                onclick="BtnVerify_Click"/> <asp:Button ID="BtnUnVerity" runat="server" CssClass="button" 
             Text="取消审核" onclick="BtnUnVerity_Click"/>
      </asp:Panel>
      
            
     <KS:Page ID="Page1" runat="server" />
    
    
     <div class="message">
<strong>搜索回答：</strong><asp:TextBox runat="server" ID="TxtKeyWord" CssClass="textbox" /> 
</asp:DropDownList>
    <asp:Button ID="BtnSearch" runat="server" CssClass="button" Text="开始搜索" 
            onclick="BtnSearch_Click"  />
        </div>

</asp:Panel>


     
    <asp:Panel ID="AddPanel" runat="server"  Width="100%" Visible="false">
    <KS:TopNav ID="TopNav1" runat="server" Text="修改回答" />
    
  <table width="100%" align="center" border="0" cellpadding="1" cellspacing="1" class="CTable"> 


        <tr>
            <td align="right" class="lefttd" height="30" style="width: 102px">
                <strong>回答：</strong></td>
                <td class="righttd">&nbsp;<asp:TextBox ID="TxtContent" TextMode="MultiLine" CssClass="textbox" Width="600px" Height="200px" runat="server"></asp:TextBox></td>
        </tr>
        <tr>
            <td align="right" class="lefttd" height="30" style="width: 102px">
                <strong>状态：</strong></td>
                <td class="righttd">&nbsp;
                <asp:RadioButtonList ID="RdbVerify" runat="server" RepeatLayout="Flow" RepeatDirection="Horizontal">
                 <asp:ListItem Value="0">未审核</asp:ListItem>
                 <asp:ListItem Value="1">已审核</asp:ListItem>
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
                    KesionJS.Alert('回答必须输入!', "jQuery('#<%=this.TxtContent.ClientID %>').focus()");
                    return false;
                }
                return true;
            }

    </script>
</asp:Content>
