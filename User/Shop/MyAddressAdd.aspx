<%@ Page Language="C#" MasterPageFile="~/User/CssFrame.master" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.User_MyAddressAdd" Title="Untitled Page" Codebehind="MyAddressAdd.aspx.cs" %>
<%@ Import Namespace="Kesion.Cache" %>
<%@ Import Namespace="Kesion.Publics" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <script>
        $(function () {
            $("#ProvinceID").change(function () {
                $("#showselectarea").html(jQuery("#ProvinceID option:selected").get(0).text);
            });
            $("#CityID").change(function () {
                $("#showselectarea").html(jQuery("#ProvinceID option:selected").get(0).text + jQuery("#CityID option:selected").get(0).text);
            });
            $("#CountyID").change(function () {
                $("#showselectarea").html(jQuery("#ProvinceID option:selected").get(0).text + jQuery("#CityID option:selected").get(0).text + jQuery("#CountyID option:selected").get(0).text);
            });

        });

        function checkform() {
            var provinceid = jQuery("#ProvinceID option:selected").val();
            if (provinceid == '') {
                $.dialog.alert('请选择收货地区!');
                return false;
            }
            var cityid = jQuery("#CityID option:selected").val();
            if (cityid == '') {
                $.dialog.alert('请选择收货城市!');
                return false;
            }


            var countyid = 0;
            if (jQuery("#CountyID")[0]) {
                countyid = jQuery("#CountyID option:selected").val();
            }
            var address = jQuery("#<%=this.TxtAddress.ClientID %>").val();
            if (address == '') {
                $.dialog.alert('请输入收货地址!', function() {
                jQuery("#<%=this.TxtAddress.ClientID %>").focus();
                });
                return false;
            }
            var zipcode = jQuery("#<%=this.TxtZipCode.ClientID %>").val();
            if (zipcode == '') {
                $.dialog.alert('请输入邮政编码!', function() {
                jQuery("#<%=this.TxtZipCode.ClientID %>").focus();
                });
                return false;
            }
            var realname = jQuery("#<%=this.TxtRealName.ClientID %>").val();
            if (realname == '') {
                $.dialog.alert('请输入收货人姓名!', function() {
                jQuery("#<%=this.TxtRealName.ClientID %>").focus();
                });
                return false;
            }
            var tel = jQuery("#<%=this.TxtTel.ClientID %>").val();
            var mobile = jQuery("#<%=this.TxtMobile.ClientID %>").val();
            if (tel == '' && mobile == '') {
                $.dialog.alert('固定电话或手机至少要填一项!', function () {
                    jQuery("#<%=this.TxtMobile.ClientID %>").focus();
                });
                return false;
            }
            var title = jQuery("#<%=this.TxtTitle.ClientID %>").val();
            if (title == '') {
                $.dialog.alert('请设置一个地址别名!', function () {
                    jQuery("#<%=this.TxtTitle.ClientID %>").focus();
                });
                return false;
            }
            return true;
        }
    </script>
   <table width="98%" align="center" border="0" cellpadding="1" cellspacing="1" class="border"> 
    <tr class="title1">
     <td colspan=5>
     <%=KSCMS.S("action") == "modify" ? "修改" : "添加"%>收货地址</td>
    </tr>
             
            <tr class="tdbg">
                <td align="right" class="lefttd" height="30" >收货地址：</td>
                <td class="righttd">
                  <script src="../../plus/area.aspx?pid=<%=proid %>&cityid=<%=cityid %>&countyid=<%=countyid %>"></script>
                </td>
            </tr>
            <tr class="tdbg">
                <td align="right" class="lefttd" height="30">地　　址：</td>
                <td class="righttd"><span id="showselectarea"><%=addStr%></span>
                    <asp:TextBox CssClass="textbox" ID="TxtAddress" runat="server"></asp:TextBox>
                     <span style="color:Red">*</span>
                     <span class="tips">只需填街道地址及门牌号</span>
                    </td>
            
            </tr>
            <tr class="tdbg">
                <td align="right" class="lefttd" height="30">邮政编码：</td>
                <td class="righttd">
                 <asp:TextBox CssClass="textbox" ID="TxtZipCode" runat="server"></asp:TextBox><span style="color:Red">&nbsp;*</span>
               </td>
            </tr>
            <tr class="tdbg">
                <td align="right" class="lefttd" height="30" >收 货 人：</td>
                <td class="righttd">
                 <asp:TextBox CssClass="textbox" ID="TxtRealName" runat="server"></asp:TextBox><span style="color:Red">&nbsp;*</span>
                 <span class="tips">请填写真实姓名，以免延误收货</span>
               </td>
            </tr>
            <tr class="tdbg">
                <td align="right" class="lefttd" height="30">手机号码：</td>
                <td class="righttd">
                  <asp:TextBox CssClass="textbox" ID="TxtMobile" runat="server"></asp:TextBox> &nbsp;或固定电话 <asp:TextBox CssClass="textbox" ID="TxtTel" runat="server"></asp:TextBox>
               <span class="tips">手机和电话至少填写一项</span></td>
            </tr>

             
            <tr class="tdbg">
                <td align="right" class="lefttd" height="30">电子邮箱：</td>
                <td class="righttd">
                 <asp:TextBox CssClass="textbox" ID="TxtEmail" runat="server"></asp:TextBox>
                 <span class="tips">为了方便跟踪订单状态通知,建议输入您的常用邮箱</span>
               </td>
            </tr>
            <tr class="tdbg">
                <td align="right" class="lefttd" height="30">地址别名：</td>
                <td class="righttd">
                 <asp:TextBox CssClass="textbox" ID="TxtTitle" runat="server"></asp:TextBox>
                 <span class="tips">设置一个易记的名称，如：“送到家里”、“送到公司”等。</span>
               </td>
            </tr>
            <tr class="tdbg">
                <td align="right" class="lefttd" height="30">设置为默认：</td>
                <td class="righttd">
                 <asp:CheckBox ID="CkbIsDefault" runat="server" Text="默认收货地址" />
               </td>
            </tr>
             
        </table>
        <asp:HiddenField ID="HidID" runat="server" Value="0" />
              <div style="text-align:center"><asp:Button ID="Button1" 
                      OnClientClick="return(checkform())" CssClass="button" runat="server" 
                      Text="OK,提交" onclick="Button1_Click" />&nbsp;<input type="reset" class="button" value="重新录入" /></div>

</asp:Content>

