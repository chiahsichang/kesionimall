<%@ Page Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.Admin_ClassMove" Title="栏目文档移动" Codebehind="KS.ClassMove.aspx.cs" %>
<%@ Import Namespace="Kesion.BLL" %>
<%@ Import Namespace="Kesion.Cache" %>
<%@ Import Namespace="Kesion.Publics" %>
<asp:Content ID="Content1" ContentPlaceHolderID="KSContent" Runat="Server">
 <%if (string.IsNullOrEmpty(KSCMS.S("ContentID"))){ %>
    <KS:TopNav ID="TopNav1" runat="server" Text="移动栏目文档" />
    <%} %>
    
        <script type="text/javascript">
            function Check() {
        <%if (string.IsNullOrEmpty(KSCMS.S("ContentID")))
        { %>
           if(jQuery("#ClassID option:selected").val()==undefined){
            KesionJS.Alert('请选择要移动的栏目!',null);
            return false;
        }
        <%}else{ %>
        if(jQuery("#ContentID").val()==''){
            KesionJS.Alert('您没有输入要移动的文档ID!',null);
            return false;
        }
        <%} %>

        if (jQuery("#TargetClassID option:selected").val() == undefined) {
            KesionJS.Alert('请选择目标栏目!',null);
            return false;
           }           
           return (confirm('此操作不可逆，确认操作吗？'));
         }
        </script>
        <%if (string.IsNullOrEmpty(KSCMS.S("ContentID"))){ %>
        <script type="text/javascript">
            showtips('<span class="state"><strong>注意事项：</strong><br /></span>所有操作不可逆，请慎重操作！！！<br>只能在同一个模型的栏目文档进行移动操作<br>移动后建议执行一下[<a href="KS.Class.aspx?from=<%=from %>&action=total">一键更新栏目文档数</a>]。');
		</script>
        <%} %>

    <table align="center" width="98%" border="0" cellpadding="1" cellspacing="1" class="CTable">
                <tr<%=string.IsNullOrEmpty(KSCMS.S("ContentID"))?"":" style='display:none'" %>>
                <td style="width: 120px; text-align: right;" class="lefttd">
                    <strong>选择要操作的模型</strong>
                <td colspan=3 class="righttd">
                    <asp:DropDownList ID="DropChannelID" runat="server">
                       <asp:ListItem Value="0">-选择模型-</asp:ListItem>
                    </asp:DropDownList>
                </td>
                </tr>
                 <tr>
                 <td style="width: 100px; text-align: right;" class="lefttd" ><strong><%=string.IsNullOrEmpty(KSCMS.S("ContentID")) ? "将栏目文档" : "将文档ID号"%></strong></td>
                 <td class="righttd" style="width: 280px">
                 <%if (string.IsNullOrEmpty(KSCMS.S("ContentID")))
                   { %>
                   <select multiple="multiple" size='12' style="WIDTH: 241px; " id="ClassID" name="ClassID">
                      <%= ClassManage.GetClassOptionByPurview(ChannelID,"0")%>
                    </select>
                 <%}
                   else
                   { %>   
                   <input typoe="text" name="ContentID" id="ContentID" value="<%=KSCMS.S("ContentID") %>" class="textbox" />
                    <%} %>
                    </td>
                 <td class="lefttd" style="width: 94px; text-align: right"><strong>移动到栏目</strong></td>
                 <td class="righttd"><select size='12'  style="WIDTH: 242px;" name="TargetClassID" id="TargetClassID">
                      <%=ClassManage.GetClassOptionByPurview(ChannelID,"0")%>
                    </select></td>
                 </tr>
    </table>
    <br />
     <%if (string.IsNullOrEmpty(KSCMS.S("ContentID")))
       { %>
    <KS:Foot ID="Foot1" runat="server" SubmitButtonText="确定移动(0)" OnSubmit="Foot1_Submit" />
    <%}
       else
       { %>
       <div style="text-align:center">
       <asp:Button ID="BtnSave" runat="server" Text="确定移动" CssClass="button" 
        onclick="BtnSave_Click" />
       <asp:Button ID="BtnCancel" runat="server" Text="取消关闭" CssClass="button" OnClientClick="top.box.close()" />
       </div>
    <%} %>
    <br />
</asp:Content>

