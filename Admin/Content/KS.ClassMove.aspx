<%@ Page Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.Admin_ClassMove" Title="��Ŀ�ĵ��ƶ�" Codebehind="KS.ClassMove.aspx.cs" %>
<%@ Import Namespace="Kesion.BLL" %>
<%@ Import Namespace="Kesion.Cache" %>
<%@ Import Namespace="Kesion.Publics" %>
<asp:Content ID="Content1" ContentPlaceHolderID="KSContent" Runat="Server">
 <%if (string.IsNullOrEmpty(KSCMS.S("ContentID"))){ %>
    <KS:TopNav ID="TopNav1" runat="server" Text="�ƶ���Ŀ�ĵ�" />
    <%} %>
    
        <script type="text/javascript">
            function Check() {
        <%if (string.IsNullOrEmpty(KSCMS.S("ContentID")))
        { %>
           if(jQuery("#ClassID option:selected").val()==undefined){
            KesionJS.Alert('��ѡ��Ҫ�ƶ�����Ŀ!',null);
            return false;
        }
        <%}else{ %>
        if(jQuery("#ContentID").val()==''){
            KesionJS.Alert('��û������Ҫ�ƶ����ĵ�ID!',null);
            return false;
        }
        <%} %>

        if (jQuery("#TargetClassID option:selected").val() == undefined) {
            KesionJS.Alert('��ѡ��Ŀ����Ŀ!',null);
            return false;
           }           
           return (confirm('�˲��������棬ȷ�ϲ�����'));
         }
        </script>
        <%if (string.IsNullOrEmpty(KSCMS.S("ContentID"))){ %>
        <script type="text/javascript">
            showtips('<span class="state"><strong>ע�����</strong><br /></span>���в��������棬�����ز���������<br>ֻ����ͬһ��ģ�͵���Ŀ�ĵ������ƶ�����<br>�ƶ�����ִ��һ��[<a href="KS.Class.aspx?from=<%=from %>&action=total">һ��������Ŀ�ĵ���</a>]��');
		</script>
        <%} %>

    <table align="center" width="98%" border="0" cellpadding="1" cellspacing="1" class="CTable">
                <tr<%=string.IsNullOrEmpty(KSCMS.S("ContentID"))?"":" style='display:none'" %>>
                <td style="width: 120px; text-align: right;" class="lefttd">
                    <strong>ѡ��Ҫ������ģ��</strong>
                <td colspan=3 class="righttd">
                    <asp:DropDownList ID="DropChannelID" runat="server">
                       <asp:ListItem Value="0">-ѡ��ģ��-</asp:ListItem>
                    </asp:DropDownList>
                </td>
                </tr>
                 <tr>
                 <td style="width: 100px; text-align: right;" class="lefttd" ><strong><%=string.IsNullOrEmpty(KSCMS.S("ContentID")) ? "����Ŀ�ĵ�" : "���ĵ�ID��"%></strong></td>
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
                 <td class="lefttd" style="width: 94px; text-align: right"><strong>�ƶ�����Ŀ</strong></td>
                 <td class="righttd"><select size='12'  style="WIDTH: 242px;" name="TargetClassID" id="TargetClassID">
                      <%=ClassManage.GetClassOptionByPurview(ChannelID,"0")%>
                    </select></td>
                 </tr>
    </table>
    <br />
     <%if (string.IsNullOrEmpty(KSCMS.S("ContentID")))
       { %>
    <KS:Foot ID="Foot1" runat="server" SubmitButtonText="ȷ���ƶ�(0)" OnSubmit="Foot1_Submit" />
    <%}
       else
       { %>
       <div style="text-align:center">
       <asp:Button ID="BtnSave" runat="server" Text="ȷ���ƶ�" CssClass="button" 
        onclick="BtnSave_Click" />
       <asp:Button ID="BtnCancel" runat="server" Text="ȡ���ر�" CssClass="button" OnClientClick="top.box.close()" />
       </div>
    <%} %>
    <br />
</asp:Content>

