<%@ Page Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.Admin_ClassMerge" Title="��Ŀ�ϲ�" Codebehind="KS.ClassMerge.aspx.cs" %>
<%@ Import Namespace="Kesion.BLL" %>
<%@ Import Namespace="Kesion.Cache" %>
<asp:Content ID="Content1" ContentPlaceHolderID="KSContent" Runat="Server">
    <KS:TopNav ID="TopNav1" cssclass="CTable" runat="server" Text="�ϲ���Ŀ����" />
    
        <script type="text/javascript">
         function Check()
         {
           if(jQuery("#ClassID").val()==0){
            KesionJS.Alert('��ѡ�񱻺ϲ�����Ŀ!',null);
            return false;
           }
           if(jQuery("#TargetClassID").val()==0){
            KesionJS.Alert('��ѡ�񱻺ϲ�����Ŀ!',null);
            return false;
           }           
           if (jQuery("#ClassID").val()==jQuery("#TargetClassID").val())
           {
            KesionJS.Alert('�Բ��𣬲�����ͬһ����Ŀ�ڽ��в���!',null);
            return false;
           }
           if (jQuery("#ClassID option:selected").get(0).text.indexOf('��')>0||jQuery("#TargetClassID option:selected").get(0).text.indexOf('��')>0)
           {
            KesionJS.Alert('�Բ��𣬲���ѡ���ⲿ��Ŀ!',null);
             return false;
           }
           if (jQuery("#ClassID option:selected").get(0).text.indexOf('��')>0||jQuery("#TargetClassID option:selected").get(0).text.indexOf('��')>0)
           {
             KesionJS.Alert('�Բ��𣬲���ѡ��ҳ��Ŀ!',null);
             return false;
           }
           return (confirm('�˲��������棬ȷ�ϲ�����'));
         }
        </script>
        <script type="text/javascript">
		showtips('<span class="state"><strong>ע�����</strong><br /></span>���в��������棬�����ز���������<br>ֻ����ͬһ��ģ�͵���Ŀ���кϲ�����<br>������ͬһ����Ŀ�ڽ��в��������ܽ�һ����Ŀ�ϲ�����������Ŀ�С�Ŀ����Ŀ�в��ܺ�������Ŀ��<br />���ܶ��ⲿ��Ŀ��ҳ��Ŀ���кϲ�����<br />�ϲ�������ָ������Ŀ�����߰�����������Ŀ������ɾ�����������ݽ�ת�Ƶ�Ŀ����Ŀ�С�');
		</script>

    <table align="center" width="98%" border="0" cellpadding="1" cellspacing="1" class="CTable">
                <tr>
                <td style="width: 120px; text-align: right;" class="lefttd">
                    <strong>ѡ��Ҫ������ģ��</strong>
                <td colspan=3 class="righttd"><asp:DropDownList ID="DropChannelID" runat="server">
                    </asp:DropDownList>
                </td>
                </tr>
                 <tr>
                 <td style="width: 100px; text-align: right;" class="lefttd" ><strong>����Ŀ</strong></td>
                 <td class="righttd" style="width: 280px"><select size='8' style="WIDTH: 241px; " id="ClassID" name="ClassID">
                   <option value=0 selected="selected">-��ѡ�񱻺ϲ���Ŀ-</option>
                      <%=from=="shop"? MyCache.GetShopClassOptionList(ChannelID):MyCache.GetClassOptionList(ChannelID) %>
                    </select></td>
                 <td class="lefttd" style="width: 94px; text-align: right"><strong>�ϲ�����Ŀ</strong></td>
                 <td class="righttd"><select size='8' style="WIDTH: 242px;" name="TargetClassID" id="TargetClassID">
                 <option value=0 selected="selected">-��ѡ��Ŀ����Ŀ-</option>
                      <%=from=="shop"? MyCache.GetShopClassOptionList(ChannelID):MyCache.GetClassOptionList(ChannelID) %>
                    </select></td>
                 </tr>
    </table>
    <br />
    <KS:Foot ID="Foot1" runat="server" SubmitButtonText="ȷ���ϲ�(0)" OnSubmit="Foot1_Submit" />
    
    <br />
</asp:Content>

