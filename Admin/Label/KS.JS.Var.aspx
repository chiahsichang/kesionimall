<%@ Page Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.Admin_JS_Var" Title="自定义静态静态JS管理" Codebehind="KS.JS.Var.aspx.cs" %>
<asp:Content ID="Content1" ContentPlaceHolderID="KSContent" Runat="Server">
<KS:TopNav runat="server" Text="创建自定义静态标签" ID="TopNav1" />
<script type="text/javascript">
    function insertlabel(title,url,width,height,scroll)
    {
      parent.openWin(title,url,false,width,height);
    }
    function insertparamlabel(title,url,width,height,scroll)
    {
      parent.openWin(title,url,false,width,height);
    }

    function InsertLabel(Val)
    {
      jQuery('#<%=this.LabelContent.ClientID %>').focus();
      var str = document.selection.createRange();
      str.text = Val; 
      top.pop.reset();      
     }
</script>
<table style="margin:6px" width="98%" align="center" cellpadding="1" cellspacing="1" class="CTable">
        <tr>
            <td class="lefttd" style="height: 30px; text-align: right">
                <strong>JS 名称：</strong></td>
            <td id="Td2" runat="server" class="righttd" style="height: 30px; text-align: left">
                <span style="color: #000066">{JS_</span><asp:TextBox CssClass="noborder" ID="JSName" runat="server" Width="212px"></asp:TextBox><span style="color: #000066"> } * </span><asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="JSName"
                    Display="Dynamic" ErrorMessage="JS名称必须输入"></asp:RequiredFieldValidator></td>
        </tr>
         <tr>
     <td class="lefttd" style="text-align: right; height: 30px;">
         <strong>所属分类：</strong></td>
     <td class="righttd" style="text-align: left; height: 30px;"><span  id="classidarea" runat="server"></span><font color=red> 请选择标签所属目录，以便日后管理标签</font></td>
    </tr>
    <tr>
        <td class="lefttd" style="height: 30px; text-align: right">
            <strong>JS文件名：</strong></td>
        <td class="righttd" style="height: 30px; text-align: left">
            <asp:TextBox CssClass="textbox" ID="JSFileName" runat="server" Width="229px"></asp:TextBox>
            *如news.js,hot.js等<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="JSFileName"
                Display="Dynamic" ErrorMessage="生成的JS文件名称必须输入"></asp:RequiredFieldValidator></td>
    </tr>
    <tr>
        <td class="lefttd" style="height: 30px; text-align: right">
            <strong>简要说明：</strong></td>
        <td class="righttd" style="height: 30px; text-align: left">
            <asp:TextBox ID="Note" runat="server" Height="60px" TextMode="MultiLine" Width="90%"></asp:TextBox></td>
    </tr>
     <tr class="ctr">
            <td class="lefttd" style="text-align: right; height: 30px;"><strong>标签列表：</strong></td>
            <td height="35" class="righttd">
            <div class="labels">
             <ul>
               <li><a href="#" onclick="insertlabel('插入网站公用标签','Label/KS.LabelCommon.aspx',660,400,'auto');return false;">公用标签</a></li><li><a href="#" onclick="insertlabel('入门级标签','Label/KS.LabelFun.aspx?LabelType=1',660,400,'auto');return false;">入门级标签</a></li><li><a href="#" onclick="insertlabel('中级标签','Label/KS.LabelFun.aspx?LabelType=2',660,400,'auto');return false;">中级标签</a></li><li><a href="#" onclick="insertlabel('中级标签','Label/KS.LabelFun.aspx?LabelType=3',660,400,'auto');return false;">高级SQL标签</a></li></ul>
            </div>
            
            </td>
           </tr>
    <tr>
        <td class="lefttd" valign="top" style="height: 30px; text-align: right">
                 <script language = 'JavaScript'>

		            function show_ln(txt_ln,txt_main){
			            var txt_ln  = document.getElementById(txt_ln);
			            var txt_main  = document.getElementById(txt_main);
			            txt_ln.scrollTop = txt_main.scrollTop;
			            while(txt_ln.scrollTop != txt_main.scrollTop)
			            {
				            txt_ln.value += (i++) + '\n';
				            txt_ln.scrollTop = txt_main.scrollTop;
			            }
			            return;
		            }
		            function editTab(){
			            
			            }
		            //-->
		            </script>
            <strong>JS 内容：</strong>
            <br />
            
           <br />  <font color=red>支持<b>非通用类</b>的各种标签，如入门标签，中级标签，高级SQL标签等。</font>
             <br /><font color=blue><b>非通用类标签：</b>指的是不需要根据当前栏目ID，当前信息ID而定的标签，如位置导航，内容页标签，标签制作时选择非当前栏目通用的标签。
            </font>

            </td>
        <td runat="server" class="righttd" style="height: 30px; text-align: left">
        

		            <table border="0" width="100%" cellpadding="0" cellspacing="0">
		             <tr>
		             <td width="20">
		               <textarea runat="server" id='txt_ln' name='rollContent' cols='6' style='overflow:hidden;height:258px;background-color:highlight;border-right:0px;text-align:right;font-family: tahoma;font-size:12px;font-weight:bold;color:highlighttext;cursor:default;' readonly></textarea>
		             </td>
		             <td valign="top">
		             <asp:TextBox ID="LabelContent" runat="server" Height="258px" TextMode="MultiLine" Width="90%"></asp:TextBox>
                    </td>
		             </tr>
		            </table>
        
        
        </td>
    </tr>
  </table>
    <KS:Foot ID="Foot1" runat="server" OnSubmit="Foot1_Submit" />
</asp:Content>

