<%@ Page Language="C#" enableEventValidation="false" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.Admin_SelectTemplate" Codebehind="KS.SelectTemplate.aspx.cs" %>
<%@ Import Namespace="Kesion.Publics" %>
<!DOCTYPE HTML>
<HTML>
<head runat="server">
    <link href="../../admin/images/style.CSS" rel="stylesheet" type="text/css" />
    <script src="../../ks_inc/jquery.js" type="text/javascript"></script>
    <script src="../../KS_Inc/Kesion.Common.js" type="text/javascript"></script>
<meta http-equiv="pragma" content="no-cache"> 
    <title>选择模板</title>
</head>
<body topmargin="0" leftmargin="0" class="righttd" <%=string.IsNullOrEmpty(KSCMS.S("action"))?@" scroll=""no""":string.Empty %>>

    <asp:Panel ID="ParentPannel" runat="server" width="100%">
    <form id="form1" runat="server">
    <table border="0" cellpadding="0" cellspacing="0" width="100%" height="100%"> 
    <tr>
    <td height="25">
        <asp:DropDownList ID="FolderSelectList" style='width:100%;' runat="server" onchange="ChangeFolder(this.value);">
        </asp:DropDownList>
    </td>
    </tr>
    <tr>
    <td>
      <iframe runat="server" id="FolderList" width='100%' height='380' frameborder='1' src='KS.SelectTemplate.aspx?Action=filelist' scrolling="yes"></iframe>
    </td>
    </tr>
    <tr class="ctitle">
    <td height="35" align="center">
    <input type="button" value="确定(O)" class="button" accesskey="o" onClick='SelectFile();'/>&nbsp;&nbsp;
    <input onClick='winClose();' class="button" type='button' name='Submit3' value='取消(C)' accesskey="C">
    </td></tr>
    <tr>
      <td clospan=2 style="text-align:left">Tips:双击返回选中的模板。</td>
    </tr>
    </table>
    </form>
    <script language='JavaScript'>
    function winClose() {
            try {
                top.box.close();
            } catch (e) {
                window.close();
            }
        } 
    function ChangeFolder(CurrPath)
    {    
    frames["FolderList"].location='KS.SelectTemplate.aspx?Action=filelist&CurrPath='+CurrPath;
    }
    function SelectFile(file)
    {   
        if (file != '')
        {
            var templatedir = jQuery("#FolderSelectList").val();
            if (templatedir.substring(templatedir.length - 1) != "/") templatedir += "/";
           templatedir=templatedir.replace("<%=_MainTemplatePath%>","{$TemplateDir}");
            var rstr = templatedir + file;
           <%if (KSCMS.S("fieldID")!=""){ %>
              top.frames["main"].document.getElementById("<%=KSCMS.S("fieldID") %>").value=rstr;
              top.box.close();
              <%}else{ %>
            window.returnValue=rstr;        
            window.close();  
            <%} %>  
        }    
        else        
        KesionJS.Alert('操作提示:<br/><br/>请先选择模板文件!')
    }
    window.onunload=SetReturnValue;
    function SetReturnValue()
    {    
    if (typeof(window.returnValue)!='string') window.returnValue='';
    }
    </script>
    </asp:Panel>
    
    <asp:panel ID="listpannel" runat="server">
        <asp:Repeater ID="dlPubInfo" runat="server">
        <HeaderTemplate>
                <table width="100%" class="CTable" border="0" cellpadding="1" cellspacing="1">
                 <tr class="CTitle">
                 <th height="25"> 名 称</th>
                 <th align="center" style="width:10%">类 型</th>
                 <th align="center" style="width:10%">大 小</th>
                 <th align="center" style="width:28%">修改时间</th>
                 </tr>
              </HeaderTemplate>
              <ItemTemplate>   
                <tr>
                 <td>
                    <span class="<%# Eval("TypeName", "{0}")=="目录"?"folder":"doc_1" %>"></span><%# GetName(Container.ItemIndex,Eval("TypeName", "{0}"),Eval("Name", "{0}")) %>
                 </td>
                 <td align="center"><%# DataBinder.Eval(Container,"DataItem.TypeName")%></td>
                 <td align="center"><%# DataBinder.Eval(Container, "DataItem.Size")%></td>
                 <td align="center"><%# DataBinder.Eval(Container,"DataItem.time")%></td>
                </tr>
              
              </FONT>   
              </ItemTemplate>  
              <FooterTemplate>
              </table>
              </FooterTemplate> 
        </asp:Repeater>
        <SCRIPT language=JavaScript>
        var CurrPath='<%=_CurrPath %>';
        function OpenFolder(Path)
        {
            var SubmitPath = '';
            if (CurrPath == '/')
                SubmitPath = CurrPath + Path;
            else
                SubmitPath = CurrPath + '/' + Path;
            SubmitPath = SubmitPath.replace("//", "/");
            if (SubmitPath.substring(SubmitPath.length - 1) != "/") SubmitPath += "/";
            AddFolderList(SubmitPath);
          location.href='KS.SelectTemplate.aspx?Action=filelist&CurrPath='+escape(SubmitPath);
         
        }
        function AddFolderList(LabelContent){
            if (!SearchOptionExists(LabelContent)) {
                jQuery('#FolderSelectList', parent.document).append("<option selected value='" + LabelContent + "'>" + LabelContent + "</option>");
            }
        }
        function SearchOptionExists(SearchText) {
            var b = false;
            if (SearchText.substring(SearchText.length - 1) != "/") SearchText += "/";
            jQuery('#FolderSelectList option', parent.document).each(function() {
                if (jQuery(this).text() == SearchText) {
                    jQuery(this).attr("selected", "true");
                    b = true;
                    return;
                }
            });
            return b;
     }


         </SCRIPT>
     </asp:panel>

    
</body>
</html>
