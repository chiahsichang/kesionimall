<%@ Page Language="C#" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.Admin_Include_FileList" Codebehind="FileList.aspx.cs" %>
<!DOCTYPE html>
<html>
<head id="Head1" runat="server">
    <link href="../../admin/images/style.css" rel="stylesheet" type="text/css" />
    <script src="../../ks_inc/jquery.js" type="text/javascript"></script>
    <script src="../../KS_Inc/Kesion.Common.js" type="text/javascript"></script>
<meta http-equiv="pragma" content="no-cache" /> 
    <title>选择文件</title>
</head>
<body>
    <form id="form1" runat="server">
        <asp:Repeater ID="dlPubInfo" runat="server">
            <HeaderTemplate>
                <table width="100%" border="0" class="CTable" cellpadding="1" cellspacing="1" style="border-left:none;border-right:none;border-bottom:none">
                 <tr class="CTitle">
                 <td height="20" nowrap="nowrap"> 名 称</th>
                 <td align="center" style="width:10%">类 型</td>
                 <td align="center" style="width:10%">大 小</td>
                 <td align="center" style="width:26%">修改时间</td>
                 <td align="center" style="width:20px">更名</td>
                 <td align="center" style="width:20px">删除</td>
                 </tr>
              </HeaderTemplate>
              <ItemTemplate>   
                <tr>
                 <td height="20" style="padding-left:5px;cursor:pointer"  class="Ctd">
                 <%# Eval("Name", "{0}") %>
                 </td>
                 <td align="center" class="Ctd"><%# DataBinder.Eval(Container,"DataItem.TypeName")%></td>
                 <td align="center" class="Ctd"><%# DataBinder.Eval(Container, "DataItem.Size")%></td>
                 <td align="center" class="Ctd"><%# DataBinder.Eval(Container,"DataItem.time")%></td>
                 <td align="center" class="Ctd">
                <%# Eval("OP1", "{0}") %>
                 </td>
                 <td align="center" class="Ctd">
                <%# Eval("OP2", "{0}") %>
                 </td>
                </tr>
              </ItemTemplate>  
              <FooterTemplate>
              </table>
              </FooterTemplate> 
        </asp:Repeater>
        </form>
        
        
        <script type="text/javascript">
        var CurrPath='<%=_CurrPath %>';
        var ParentPath='<%=_PreFolder %>';
        var CanBackFlag='<%=CanBack %>';
        var FileName='';

        function SelectFile(id) {
         if (CurrPath.substring(CurrPath.length - 1) != "/")  CurrPath = CurrPath + "/";
         parent.document.getElementById("FileUrl").value=CurrPath+jQuery("#f"+id).attr("File");
         PreviewFile(id);
         jQuery(".FolderSelectItem").each(function() {
             jQuery(this).attr("class", "FolderItem");
         });
         jQuery("#f"+id)[0].className = 'FolderSelectItem'

     }

        function SetFile(Obj)
		{
		  parent.SetFileUrl();

		}
		function PreviewFile(id) {
			var Path='';
			if (CurrPath == '/') Path = escape(CurrPath + jQuery("#f" + id).attr("File"));
			else Path = escape(CurrPath + jQuery("#f" + id).attr("File"));
			var Url='Preview.aspx?FilePath='+Path;
			parent.frames["PreviewArea"].location=Url;
		}
        function OpenFolder(Path)
        {    
        var SubmitPath='';    
        if (CurrPath=='/') 
        SubmitPath=CurrPath+Path;    
        else 
        SubmitPath=CurrPath+'/'+Path;   
        SubmitPath=SubmitPath.replace("//","/");
        if (SubmitPath.substring(SubmitPath.length - 1) != "/") SubmitPath += "/";
        location.href='FileList.aspx?ChannelID=<%=ChannelID %>&CurrPath='+SubmitPath;    
        AddFolderList(SubmitPath,SubmitPath);}
        function AddFolderList(Label, LabelContent){
            var i = 0, AddOption;
            if (!SearchOptionExists(Label)) {
                   jQuery('#FolderSelectList', parent.document).append("<option selected value='" + LabelContent + "'>" + Label + "</option>");   
            }
        }
        function SearchOptionExists(SearchText) {
            parent.uploadBtn(SearchText);
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

        function OpenParentFolder() {
            if (ParentPath.substring(ParentPath.length - 1) != "/") ParentPath += "/"; 
			if (CanBackFlag=='false') return;
			   location.href='FileList.aspx?ChannelID=<%=ChannelID %>&CurrPath='+ParentPath;
			  SearchOptionExists(ParentPath);
		}
		function AddFolderOperation()
		{
			var ReturnValue=prompt('请输入新建目录名称：','');
			if ((ReturnValue!='') && (ReturnValue!=null))
				window.location.href='FileList.aspx?ChannelID=<%=ChannelID %>&Action=AddFolder&Path='+CurrPath+'/'+ReturnValue+'&CurrPath='+CurrPath;
		}
		function DelFolderFile(flag,path)
		{
			if (path!=null) {
			   if (confirm('确定删除吗?'))
				window.location.href='?flag='+flag+'&ChannelID=<%=ChannelID %>&Action=DelFolder&Path='+path+'&CurrPath='+CurrPath;
			}
			else alert('请选择要删除的目录');
		}
		function RenameFolder(path)
		{
			if (path!=null)
			{
			    ReturnValue=prompt('修改的名称：',path);
				if ((ReturnValue!='') && (ReturnValue!=null)) window.location.href='?ChannelID=<%=ChannelID %>&Action=FolderReName&CurrPath='+CurrPath+'&OldPathName='+path+'&NewPathName='+ReturnValue;
			}
			else alert('请选择要编辑的目录');
		}
		
         </script>

    
</body>
</html>

