<%@ Page Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.Admin_JS_Var" Title="�Զ��徲̬��̬JS����" Codebehind="KS.JS.Var.aspx.cs" %>
<asp:Content ID="Content1" ContentPlaceHolderID="KSContent" Runat="Server">
<KS:TopNav runat="server" Text="�����Զ��徲̬��ǩ" ID="TopNav1" />
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
                <strong>JS ���ƣ�</strong></td>
            <td id="Td2" runat="server" class="righttd" style="height: 30px; text-align: left">
                <span style="color: #000066">{JS_</span><asp:TextBox CssClass="noborder" ID="JSName" runat="server" Width="212px"></asp:TextBox><span style="color: #000066"> } * </span><asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="JSName"
                    Display="Dynamic" ErrorMessage="JS���Ʊ�������"></asp:RequiredFieldValidator></td>
        </tr>
         <tr>
     <td class="lefttd" style="text-align: right; height: 30px;">
         <strong>�������ࣺ</strong></td>
     <td class="righttd" style="text-align: left; height: 30px;"><span  id="classidarea" runat="server"></span><font color=red> ��ѡ���ǩ����Ŀ¼���Ա��պ�����ǩ</font></td>
    </tr>
    <tr>
        <td class="lefttd" style="height: 30px; text-align: right">
            <strong>JS�ļ�����</strong></td>
        <td class="righttd" style="height: 30px; text-align: left">
            <asp:TextBox CssClass="textbox" ID="JSFileName" runat="server" Width="229px"></asp:TextBox>
            *��news.js,hot.js��<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="JSFileName"
                Display="Dynamic" ErrorMessage="���ɵ�JS�ļ����Ʊ�������"></asp:RequiredFieldValidator></td>
    </tr>
    <tr>
        <td class="lefttd" style="height: 30px; text-align: right">
            <strong>��Ҫ˵����</strong></td>
        <td class="righttd" style="height: 30px; text-align: left">
            <asp:TextBox ID="Note" runat="server" Height="60px" TextMode="MultiLine" Width="90%"></asp:TextBox></td>
    </tr>
     <tr class="ctr">
            <td class="lefttd" style="text-align: right; height: 30px;"><strong>��ǩ�б�</strong></td>
            <td height="35" class="righttd">
            <div class="labels">
             <ul>
               <li><a href="#" onclick="insertlabel('������վ���ñ�ǩ','Label/KS.LabelCommon.aspx',660,400,'auto');return false;">���ñ�ǩ</a></li><li><a href="#" onclick="insertlabel('���ż���ǩ','Label/KS.LabelFun.aspx?LabelType=1',660,400,'auto');return false;">���ż���ǩ</a></li><li><a href="#" onclick="insertlabel('�м���ǩ','Label/KS.LabelFun.aspx?LabelType=2',660,400,'auto');return false;">�м���ǩ</a></li><li><a href="#" onclick="insertlabel('�м���ǩ','Label/KS.LabelFun.aspx?LabelType=3',660,400,'auto');return false;">�߼�SQL��ǩ</a></li></ul>
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
            <strong>JS ���ݣ�</strong>
            <br />
            
           <br />  <font color=red>֧��<b>��ͨ����</b>�ĸ��ֱ�ǩ�������ű�ǩ���м���ǩ���߼�SQL��ǩ�ȡ�</font>
             <br /><font color=blue><b>��ͨ�����ǩ��</b>ָ���ǲ���Ҫ���ݵ�ǰ��ĿID����ǰ��ϢID�����ı�ǩ����λ�õ���������ҳ��ǩ����ǩ����ʱѡ��ǵ�ǰ��Ŀͨ�õı�ǩ��
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

