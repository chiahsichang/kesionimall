<%@ Page Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="True" Inherits="Kesion.NET.WebSite.Admin_ShopPromotions" Title="全场促销设置" Codebehind="KS.ShopPromotions.aspx.cs" %>
<%@ Import Namespace="Kesion.Cache" %>
<asp:Content ID="Content1" ContentPlaceHolderID="KSContent" Runat="Server">
    <KS:topnav id="TopNav1" runat="server" text="商城系统全场促销方案配置"></KS:topnav>
    
    
<div class="tab-page" id="ShopConfigPanel">


             <table  width="100%" border="0" cellpadding="1" cellspacing="1" class="CTable"> 
                 <tr>
                    <td class="lefttd" align="right" style="height:30px;width: 198px"><b>是否开启促销：</b></td>
                    <td class="righttd">
                     &nbsp;
                        <asp:RadioButtonList ID="RdbIsCX" onclick="showcx()" runat="server" RepeatLayout="Flow" RepeatDirection="Horizontal">
                            <asp:ListItem Value="0" Selected="True">不启用</asp:ListItem>
                            <asp:ListItem Value="1">启用</asp:ListItem>
                        </asp:RadioButtonList>
                    </td>
                 </tr>
                 <tr id="cxarea">
                    <td class="lefttd" align="right" style="height:30px;width: 198px"><b>设置促销方案：</b></td>
                    <td class="righttd">
                     &nbsp;
                         <script>
                            
                             function addcx(){
                                var i=parseInt($("#cxnum").val())+1;
                                var str="<strong>方案"+i+"：</strong>在本商城购买满<input type='text' name='cxmoney"+i+"' class='textbox' style='text-align:center;width:50px'/><%=MyCache.GetCurrencyUnit%>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;减免<input type='text' name='jmmoney"+i+"' class='textbox' style='text-align:center;width:50px'/><%=MyCache.GetCurrencyUnit%><br/>";
                                $("#showcxfa").append(str);
                                $("#cxnum").val(i);
                            }
                            function showcx() {
                                if (jQuery("#<%=this.RdbIsCX.ClientID%> :radio[checked]").val() == "1") {
                                    jQuery("#cxarea").show();
                                    if ($("#showcxfa").html().length<10){
                                        addcx();
                                    }
                                } else {
                                    jQuery("#cxarea").hide();
                                }
                            }
                             jQuery(document).ready(function () {
                                 showcx();
                             });

                        </script>
                        <input type="button" onclick="addcx()" value="添加一个方案" class="button" />
                        <input type="hidden" name="cxnum" id="cxnum" value="0" />
                       <div id="showcxfa" class="message"></div>
                        
                        <div style="margin-top:10px;font-weight:bold;color:#777">设置说明：</div>
                        <div class="tips">
                            1、 删除某个方案， 请将购买满金额留空即可;<br />
                            2、 请按金额从小到大填写，如：<br />
                            购买满100<%=MyCache.GetCurrencyUnit%>，减免20<%=MyCache.GetCurrencyUnit%>；<br />
                            购买满300<%=MyCache.GetCurrencyUnit%>，减免80<%=MyCache.GetCurrencyUnit%>；<br />
                            购买满500<%=MyCache.GetCurrencyUnit%>，减免120<%=MyCache.GetCurrencyUnit%>；<br />
                            购买满1000<%=MyCache.GetCurrencyUnit%>，减免300<%=MyCache.GetCurrencyUnit%>；<br />

                        </div>
                    </td>
                 </tr>
    </table>

    
    
    
    
    <br />
    <br style="clear:both" />
        <br />
    <KS:Foot runat="server" CancelButtonEnabled="false" ID="Foot1" OnSubmit="Foot1_Submit"/>
    <KS:Tips ID="Tips1" runat="server" ImagePath="../../admin/images/" />

</asp:Content>

