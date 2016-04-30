<%@ Page Language="C#" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.User_SelectFile" Codebehind="SelectFile.aspx.cs" %>
<%@ Import Namespace="Kesion.Publics" %>
<!DOCTYPE html>
<html>
<head runat="server">
    <title>选择上传文件</title>
    <link href="../images/css.CSS" rel="stylesheet" type="text/css" />
	<META HTTP-EQUIV="pragma" CONTENT="no-cache">
    <META HTTP-EQUIV="Cache-Control" CONTENT="no-cache, must-revalidate">
    <META HTTP-EQUIV="expires" CONTENT="Wed, 26 Feb 1997 08:21:57 GMT">
    <base target="_self" />
</head>
<script type="text/javascript">
    function setReturn(v)
    {
	 window.returnValue=v;
	 top.close();
}
window.onunload=CheckReturnValue;
function CheckReturnValue()
{
  if (typeof(window.returnValue)!='string') window.returnValue='';
}
</script>
<body>
    <form id="form1" runat="server">
    <div style="height:390px; overflow: auto;">
     <asp:Panel ID="Panel1" runat="server" Width="95%">
          <table border="0" width="99%" align="center">
             <tr>
              <td height="30" class="righttd">当前目录:<asp:Label ID="LabCurrDir" runat="server"></asp:Label>&nbsp;&nbsp;&nbsp;&nbsp;占用大小:<asp:Label ID="LabSite" runat="server" ForeColor="red"></asp:Label></td>
              <td class="righttd">
              &nbsp;
              <asp:Label ID="LabBack" runat="server">↑返回上一层目录</asp:Label>
               
              </td>
             </tr>
            </table>

            <asp:DataList ID="DataList1" runat="server" RepeatColumns="5" Width="99%" CssClass="lefttd" HorizontalAlign="Center" >
                <HeaderTemplate>
                </HeaderTemplate>
                
                <ItemTemplate>
                 <img src="../../admin/images/folder/folderclosed.gif" align="absmiddle" /><a href='?Dir=<%# Server.UrlEncode(_path+Convert.ToString(Eval("Name"))) %>'><%# Eval("Name") %></a>
                
                </ItemTemplate>
                <FooterTemplate>
                </FooterTemplate>
                <ItemStyle CssClass="lefttd" />
            </asp:DataList>
            
            
            <asp:DataList ID="DataList2" runat="server" RepeatColumns="3" Width="99%" CssClass="lefttd" HorizontalAlign="Center" CellPadding="1" CellSpacing="1" >
                <HeaderTemplate>
                </HeaderTemplate>
                
                <ItemTemplate>
                 <%# GetItem(Convert.ToString(Eval("Name")), Convert.ToString(Eval("TypeName")), Convert.ToString(Eval("size")), Convert.ToString(Eval("time")))%>                
                </ItemTemplate>
                <FooterTemplate>
                </FooterTemplate>
                <ItemStyle CssClass="lefttd" BackColor="White" BorderColor="#E0E0E0" BorderStyle="Solid" />
            </asp:DataList>
           <table cellpadding="0" cellspacing="0" style="width: 100%;margin-top:10px">
            <tr>
                <td style="height: 25px">&nbsp;
                    
                    </td>
                <td style="font-size: 9pt; height: 25px; text-align: right">
                    <asp:Label ID="Label7" runat="server" Text="当前页码为："></asp:Label>
                    <asp:TextBox ID="labPage" runat="server" AutoPostBack="True" OnTextChanged="labPage_TextChanged"
                        Text="1" Width="30px"></asp:TextBox>
                    &nbsp; &nbsp;
                    <asp:Label ID="Label6" runat="server" Text="总页数："></asp:Label><asp:Label ID="labBackPage"
                        runat="server"></asp:Label>
                    页 每页显示：<asp:Label ID="labperpagenum" runat="server" Text="Label"></asp:Label>
                    条
                    <asp:LinkButton ID="lnkbtnOne" runat="server" Font-Underline="False" ForeColor="Red"
                        OnClick="lnkbtnOne_Click">第一页</asp:LinkButton>
                    <asp:LinkButton ID="lnkbtnUp" runat="server" Font-Underline="False" ForeColor="Red"
                        OnClick="lnkbtnUp_Click">上一页</asp:LinkButton>
                    <asp:LinkButton ID="lnkbtnNext" runat="server" Font-Underline="False" ForeColor="Red"
                        OnClick="lnkbtnNext_Click">下一页</asp:LinkButton>&nbsp;
                    <asp:LinkButton ID="lnkbtnBack" runat="server" Font-Underline="False" ForeColor="Red"
                        OnClick="lnkbtnBack_Click">最后一页</asp:LinkButton>
                    &nbsp;
                </td>
            </tr>
        </table>
        
       </asp:Panel>
       
        
    </div>
    </form>
</body>
</html>
