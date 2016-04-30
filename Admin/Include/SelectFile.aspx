<%@ Page Language="C#" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.Admin_Include_SelectFile" Codebehind="SelectFile.aspx.cs" %>
<%@ Import Namespace="Kesion.Publics" %>
<!DOCTYPE html>
<html>
<head>
<title>选择文件</title>
<script src="../../ks_inc/jQuery.js"></script>
<script src="../../KS_Inc/Kesion.Common.js"></script>
<meta http-equiv="pragma" content="no-cache"> 
<STYLE type="text/css">
<!--
PreviewStyle {
    border: 2px outset #CCCCCC;}
    ImgOver {    cursor: default;    border-top-width: 1px;    border-right-width: 1px;    border-bottom-width: 1px;    border-left-width: 1px;    border-top-style: solid;    border-right-style: solid;    border-bottom-style: solid;    border-left-style: solid;    border-top-color: #FFFFFF;    border-right-color: #999999;    border-bottom-color: #999999;    border-left-color: #FFFFFF;} BODY   {border: 0; margin: 0; background: buttonface; cursor: default; font-family:宋体; font-size:9pt;} BUTTON {width:5em}
 TABLE  {font-family:宋体; font-size:9pt} P      {text-align:center}
-->
</STYLE>
</head>
<body leftMargin=0 class="righttd" scroll="no" style="overflow:hidden">

 <form id="form1" runat="server" enctype="multipart/form-data">
  <table cellSpacing=0 cellPadding=0 width="100%" align=center border=0>
    <tr>
      <td colSpan=2>
        <table cellSpacing=0 cellPadding=0 width="100%" border=0>
          <tr>
            <td noWrap align=center width=80>选择目录： </td>
            <td width=660>
            <asp:DropDownList ID="FolderSelectList" style='width:100%;' runat="server">
         </asp:DropDownList>
            </td>
            <td  width=279 height=26>
              <table cellSpacing=0 cellPadding=0 width="100%" border=0>
                <tr>
                  <td width=25>&nbsp;</td>
                  <td onMouseOver="this.className='ImgOver'" onMouseOut="this.className=''" width=25><img id=Img1 title=关闭预览区 onclick=ChangeViewArea(this); src="../../SysImg/FileIcon/R.gif" align=absMiddle></td>
                  <td onMouseOver="this.className='ImgOver'" onMouseOut="this.className=''" width=25><img title=返回上一级目录 onClick="frames['FolderList'].OpenParentFolder();" height=22 src="../../SysImg/FileIcon/Back.gif" width=21 align=absMiddle></td>
                  <td onMouseOver="this.className='ImgOver'" onMouseOut="this.className=''" width=25><img title=添加新目录 onClick="frames['FolderList'].AddFolderOperation();" height=17 src="../../SysImg/FileIcon/AddFolder.gif" width=19 align=absMiddle></td>
                  <td width=25>&nbsp;</td>
                  <td width=25>&nbsp;</td>
                  <td width=25>&nbsp;</td>
                  <td width=25>&nbsp;</td>
                  <td width=25>&nbsp;</td>
                </tr>
              </table>
            </td>
          </tr>
        </table>
      </td>
    </tr>
    <tr>
      <td align=center width="70%"><iframe id="FolderList" name="FolderList" src="FileList.aspx?ChannelID=<%=ChannelID %>&CurrPath=<%=UpfilesDir %>" frameBorder="1" width="100%" scrolling="yes" height="330"></iframe></td>
      <td id=ViewArea  width="30%"><iframe id="PreviewArea" src="Preview.aspx" frameBorder=1 width="100%" scrolling=yes height=330></iframe></td>
    </tr>
    <tr>
      <td colSpan=2 height=35>
        <table height="100%" cellSpacing=0 cellPadding=0 width="100%" border=0>
          <tr>
            <td width=80 height=40><strong>URL地址：</strong></td>
            <td>
              <Input style="WIDTH: 450px" class="textbox" name="FileUrl" id="FileUrl" /> 
              <Input onClick="SetFileUrl();" class="button" type="button" value=" 确 定 " name=Submit> 
             <Input onClick="winClose()" class="button" type="button" value=" 取 消 " name=Submit3>
            </td>
          </tr>
          <tr>
            <td width=80 height=40><strong>上传文件：</strong></td>
            <td>  <iframe id="upload" name="upload" src="about:blank" marginheight="0" marginwidth="0" frameborder="0" width="100%" height="30" scrolling="no"></iframe>
</td>
          </tr>
          
        </table>
      </td>

  </table>
  
 

  
  
<script type="text/JavaScript">
jQuery(document).ready(function(){
  uploadBtn("<%=UpfilesDir %>");
});
function uploadBtn(path){
    jQuery("#upload").attr("src", "UpLoad.aspx?bgcolor=F3F3F3&FieldID=-1&ChannelID=<%=ChannelID %>&CurrPath=" + path + "&UpType=UpByBar&from=selectfile");
}
function winClose(){
     try{
      top.box.close(); 
     }catch(e){
      window.close();
     }
} 
function ChangeFolder(FolderName){    
frames["FolderList"].location='FileList.aspx?CurrPath='+FolderName;}

function SetFileUrl(){    
var v=jQuery("#FileUrl").val();
if (v=='') KesionJS.Alert('请填写Url地址');    
else   
 {

    <%if (KSCMS.S("fieldID")!=""){ %>
    top.frames["main"].document.getElementById("<%=KSCMS.S("fieldID").Trim() %>").value = v;
    <%if (KSCMS.S("fieldID").ToLower()=="defaultpic"){%>
    try {
        top.frames["main"].document.getElementById("BigPhoto").value = v;
    } catch (e) {
    }
    <%}%>
    try {
        top.frames["main"].document.getElementById("show<%=KSCMS.S("fieldID")%>").style.display = '';
        top.frames["main"].document.getElementById("show<%=KSCMS.S("fieldID")%>").src = v;
    }
    catch (e) {
    }
    top.box.close();
  <%}else{%>
     window.returnValue=v;     
     window.close();    
  <%} %>
 }
}
 window.onunload=CheckReturnValue;
 function CheckReturnValue(){    
 if (typeof(window.returnValue)!='string') 
 window.returnValue='';
 }
 var displayBar=true;
 function ChangeViewArea(obj) {  
 if (displayBar) {  
 ViewArea.style.display='none';    
 displayBar=false;    
 obj.src='../../SysImg/FileIcon/L.gif';    
 obj.title='打开预览区';  } 
 else {   
 ViewArea.style.display='';    
 displayBar=true;    
 obj.src='../../SysImg/FileIcon/R.gif';    
 obj.title='关闭预览区';  }
 }
 </script>
 </body>
</form>
</html>