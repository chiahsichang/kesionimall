<%@ Page Language="C#" MasterPageFile="~/User/User.master" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.User_Post" Title="Untitled Page" CodeBehind="PostInfo.aspx.cs" %>
<asp:Content ID="Content1" ContentPlaceHolderID="KSContent" Runat="Server">
    <% Kesion.APPCode.EditorAPI.EchoHead();%>


    <asp:Panel ID="Panel1" runat="server" Width="100%">
    <input type="hidden" id="classid" name="classid" value="0"/>
    <table class="border" cellspacing="2" cellpadding="1" width="96%" align="center" border=0>
      <tr class="title">
          <td align="left" colspan="2"> <strong>选择发布栏目：</strong></td>
      </tr>
      <tr>
          <td style="padding-left:5px;">
              <style>
                  #loadclass li {width:200px;float:left;}
              </style>
            <div>
                <ul id="loadclass"></ul>
            </div>
          </td>
      </tr>
      <tr>
          <td height="50" style="padding-left:5px;"><input type="button" onclick="return(checknext())"class="button" value=" 下一步 " /></td>
      </tr>
    </table>
    <script>
        $(document).ready(function () {
            loadClass(0,1);
        });
        function loadClass(id, depth) {
            jQuery.get("../plus/ajaxs.ashx", { a: "getinputclass", rnd:Math.random(),classid: id },
				  function (data) {
				      $("#loadclass").find("li").each(function () {
				          if ($(this).attr("depth")> depth) {
				              $(this).remove();
				          }
				      });
				      if (data != '') {
				          $("#loadclass").append(data);
				      }
				  });
        }
        function changeclass(id, parentid, depth) {
            $("#classid").val(id);
            loadClass(id, depth);
        }
        function checknext() {
            var classid = $("#classid").val();
            if ($("#m" + classid)[0] != undefined) {
                KesionJS.Alert("请选择您好要发布分类！");
                return false;
            }
            location.href = 'PostInfo.aspx?classId='+classid;
        }
    </script>
    </asp:Panel>

    <asp:Panel ID="Panel2" runat="server" Width="100%" Visible="false">
       <script type="text/javascript" src="<%=ResolveUrl("~/ks_inc/DatePicker/WdatePicker.js") %>"></script>
       <script>
        function GetKeyTags() {
            var text = escape(jQuery('#Title').val());
            if (text != '') {
                jQuery('#KeyTags').val('请稍等,系统正在自动获取tags...').attr("disabled", true);
                jQuery.get("../plus/ajaxs.ashx", { a: "GetTags", text: text },
				  function(data) { jQuery('#KeyTags').val(unescape(data)).attr("disabled", false); });
            } else { KesionJS.Alert('对不起,请先输入标题!',"jQuery('#Title').focus();"); }
        }
    </script>
         <KS:ModelJS ID="ModelJS1" runat="server" />
       <%if (ChannelID >= 2)
      {%>
             <script>
                 var post_params = { "username": "<%=Kesion.Publics.KSCMS.GetCookie("User","username") %>", "password": "<%=Kesion.Publics.KSCMS.GetCookie("User","password") %>", "CreateThumbs": 1, "ChannelID": 2, "AutoRename": 4, "addwatermark": "1", "fieldid": "-1", "upbyswf": 1 };
             </script>
             <%}%>
         <%=JSStr %>

        <asp:Repeater ID="RepeatFieldGroup" runat="server" OnItemDataBound="RepeatFieldGroup_ItemDataBound">
               <ItemTemplate>
                     <table class="border" cellspacing="2" cellpadding="1" width="98%" align=center border=0>
                      <tr class="title">
                         <td align="left" colspan="2"><%# Eval("GroupName") %></td>
                       </tr>

                   <asp:Repeater ID="List" runat="server">
                    <ItemTemplate>
                         <KS:UserFields ID="Fields1" ModelID='<%# ChannelID%>' ClassID='<%# ClassID%>' FieldID='<%# Eval("Name")%>' ParentFieldID='<%# Eval("ParentFieldID")%>' FieldAlias='<%# Eval("FieldAlias")%>' FieldType='<%# Eval("FieldType")%>'
                         Disabled='<%# Eval("Disabled")%>' FieldWidth='<%# Eval("FieldWidth")%>' FieldHeight='<%# Eval("FieldHeight")%>' Options='<%# Eval("options")%>'
                         Tips='<%# Eval("Tips")%>' DefaultValue='<%# Eval("DefaultValue")%>' ToolBar='<%# Eval("ToolBar")%>' ContributionItem='<%# Eval("ContributionItem") %>' MustFillItem='<%# Eval("MustFillItem")%>'  runat="server">
                         </KS:UserFields>
                 
                        </ItemTemplate>
                    <FooterTemplate>
             
                    </FooterTemplate>
                </asp:Repeater>


               </ItemTemplate>
            </asp:Repeater>

               <tr class="tdbg">
	                <td class="lefttd" style="text-align:right;">售 价：</td>
	                <td class="list_right_box">
                      <asp:TextBox ID="TxtReadPoint" runat="server" CssClass="textbox" Text="0" style="text-align:center;width:50px;" />
                        <%=Kesion.Cache.MyCache.GetCacheConfig(50) %> <span class="tips">免费阅读请设为 "<span style="color:red">0</span>"。
	                 </td>
                </tr>
         
              <tr class="tdbg">
	                <td class="lefttd" style="text-align:right;">状 态：</td>
	                <td class="list_right_box">
        <asp:RadioButtonList ID="RdbVerify" runat="server" RepeatDirection="horizontal" RepeatLayout="flow">
                         <asp:ListItem Value="0" Selected>投稿</asp:ListItem>
                         <asp:ListItem Value="2">草稿</asp:ListItem>
                        </asp:RadioButtonList>
	                 </td>
                </tr>
         </table>
   <div style="margin-top:5px;text-align:center">
   <asp:HiddenField ID="hidVerify" runat="server" Value="0" />
    <asp:Button ID="BtPostInfo" CssClass="button" runat="server" Text="OK,确定发布" OnClick="BtPostInfo_Click" />
    </div>
      </asp:Panel>  
</asp:Content>

