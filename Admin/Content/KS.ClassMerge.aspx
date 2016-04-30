<%@ Page Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.Admin_ClassMerge" Title="栏目合并" Codebehind="KS.ClassMerge.aspx.cs" %>
<%@ Import Namespace="Kesion.BLL" %>
<%@ Import Namespace="Kesion.Cache" %>
<asp:Content ID="Content1" ContentPlaceHolderID="KSContent" Runat="Server">
    <KS:TopNav ID="TopNav1" cssclass="CTable" runat="server" Text="合并栏目操作" />
    
        <script type="text/javascript">
         function Check()
         {
           if(jQuery("#ClassID").val()==0){
            KesionJS.Alert('请选择被合并的栏目!',null);
            return false;
           }
           if(jQuery("#TargetClassID").val()==0){
            KesionJS.Alert('请选择被合并的栏目!',null);
            return false;
           }           
           if (jQuery("#ClassID").val()==jQuery("#TargetClassID").val())
           {
            KesionJS.Alert('对不起，不能在同一个栏目内进行操作!',null);
            return false;
           }
           if (jQuery("#ClassID option:selected").get(0).text.indexOf('外')>0||jQuery("#TargetClassID option:selected").get(0).text.indexOf('外')>0)
           {
            KesionJS.Alert('对不起，不能选择外部栏目!',null);
             return false;
           }
           if (jQuery("#ClassID option:selected").get(0).text.indexOf('单')>0||jQuery("#TargetClassID option:selected").get(0).text.indexOf('单')>0)
           {
             KesionJS.Alert('对不起，不能选择单页栏目!',null);
             return false;
           }
           return (confirm('此操作不可逆，确认操作吗？'));
         }
        </script>
        <script type="text/javascript">
		showtips('<span class="state"><strong>注意事项：</strong><br /></span>所有操作不可逆，请慎重操作！！！<br>只能在同一个模型的栏目进行合并操作<br>不能在同一个栏目内进行操作，不能将一个栏目合并到其下属栏目中。目标栏目中不能含有子栏目。<br />不能对外部栏目或单页栏目进行合并操作<br />合并后您所指定的栏目（或者包括其下属栏目）将被删除，所有数据将转移到目标栏目中。');
		</script>

    <table align="center" width="98%" border="0" cellpadding="1" cellspacing="1" class="CTable">
                <tr>
                <td style="width: 120px; text-align: right;" class="lefttd">
                    <strong>选择要操作的模型</strong>
                <td colspan=3 class="righttd"><asp:DropDownList ID="DropChannelID" runat="server">
                    </asp:DropDownList>
                </td>
                </tr>
                 <tr>
                 <td style="width: 100px; text-align: right;" class="lefttd" ><strong>将栏目</strong></td>
                 <td class="righttd" style="width: 280px"><select size='8' style="WIDTH: 241px; " id="ClassID" name="ClassID">
                   <option value=0 selected="selected">-请选择被合并栏目-</option>
                      <%=from=="shop"? MyCache.GetShopClassOptionList(ChannelID):MyCache.GetClassOptionList(ChannelID) %>
                    </select></td>
                 <td class="lefttd" style="width: 94px; text-align: right"><strong>合并到栏目</strong></td>
                 <td class="righttd"><select size='8' style="WIDTH: 242px;" name="TargetClassID" id="TargetClassID">
                 <option value=0 selected="selected">-请选择目标栏目-</option>
                      <%=from=="shop"? MyCache.GetShopClassOptionList(ChannelID):MyCache.GetClassOptionList(ChannelID) %>
                    </select></td>
                 </tr>
    </table>
    <br />
    <KS:Foot ID="Foot1" runat="server" SubmitButtonText="确定合并(0)" OnSubmit="Foot1_Submit" />
    
    <br />
</asp:Content>

