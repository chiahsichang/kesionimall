<%@ Page Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.Admin_LabelMove" Title="��ǩ�ƶ�" Codebehind="KS.LabelMove.aspx.cs" %>
<%@ Import Namespace="Kesion.BLL" %>
<%@ Import Namespace="Kesion.Cache" %>
<%@ Import Namespace="Kesion.Publics" %>
<asp:Content ID="Content1" ContentPlaceHolderID="KSContent" Runat="Server">

        <script type="text/javascript">
            function Check() {
                if(jQuery("#ContentID").val()==''){
                    KesionJS.Alert('��û������Ҫ�ƶ����ĵ�ID!',null);
                    return false;
                }

                if (jQuery("#TargetClassID option:selected").val() == undefined) {
                    KesionJS.Alert('��ѡ��Ŀ����Ŀ!',null);
                    return false;
                }
                return true;
         }
        </script>
        

    <table align="center" width="98%" border="0" cellpadding="1" cellspacing="1" class="CTable">
                 <tr>
                 <td class="lefttd" style="width: 94px; text-align: right"><strong>�ƶ�������</strong></td>
                 <td class="righttd">
                      <input typoe="text" style="display:none;" name="ContentID" id="ContentID" value="<%=KSCMS.S("Ids") %>" class="textbox" />
                     <select size='15'  style="WIDTH: 242px;" name="TargetClassID" id="TargetClassID">
                      <%=BaseFun.ReturnLabelFolderTree("", Utils.StrToInt(KSCMS.S("LabelType")))%>
                    </select></td>
                 </tr>
    </table>
    <br />

       <div style="text-align:center">
       <asp:Button ID="BtnSave" runat="server" Text="ȷ���ƶ�" OnClientClick="return(Check());" CssClass="button"  onclick="BtnSave_Click" />
       <asp:Button ID="BtnCancel" runat="server" Text="ȡ���ر�" CssClass="button" OnClientClick="top.box.close()" />
       </div>
    <br />
</asp:Content>

