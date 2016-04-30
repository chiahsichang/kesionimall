<%@ Page Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.Admin_RecycleBin" Title="����վ����" Codebehind="KS.RecycleBin.aspx.cs" %>
<%@ Import Namespace="Kesion.Cache" %>
<%@ Import Namespace="Kesion.BLL" %>
<%@ Import Namespace="Kesion.Publics"%>
<asp:Content ID="Content1" ContentPlaceHolderID="KSContent" Runat="Server">
<body>
<script type="text/javascript">
 <!--
   jQuery(document).ready(function(){
     jQuery("body").keydown(function()
     {
        if (event.ctrlKey)
		  switch  (event.keyCode)
		  {      
		  }
     });
   });

function GetMyIds() {
    var sid = null;
    for (var i = 0; i < document.getElementsByName("ids").length; i++) {
        var KS = document.getElementsByName("ids")[i];
        if (KS.checked == true) {
            if (sid == null)
                sid = KS.value;
            else
                sid += "," + KS.value;
        }
    }
    return sid;
 }
    function ContentAddSpecial(){
        var sid = GetMyIds();
        if (sid!=null) parent.openWin("<%=itemName %>����ר��","Content/KS.ContentAddSpecial.aspx?ContentID="+sid+"&ChannelID=<%=ChannelID%>",false,300,360);
    } 
 function ContentSetAttribute(){
      var sid = GetMyIds();
	  if (sid!=null)  parent.openWin("��������<%=itemName %>����","Content/KS.ContentBatch.Aspx?ContentID="+sid+"&ChannelID=<%=ChannelID %>",true);

}
function RefreshItem() {
    var sid = GetMyIds();
    if (sid != null) parent.openWin("��������<%=itemName %>HTML����", "Refresh/KS.RefreshHtml.Aspx?ChannelID=<%=ChannelID %>&refreshtype=itemids&action=content&ids=" + sid, false,650,250);
}
function ContentMove() {
    var sid = GetMyIds();
    if (sid != null) parent.openWin("<%=itemName %>�����ƶ�", "Content/KS.ClassMove.aspx?ContentID=" + sid + "&ChannelID=<%=ChannelID%>", true, 600, 360);

}
function keyWordFocus() {
    if (jQuery("#<%=this.KeyWord.ClientID %>").val() == '������ؼ��֣�') {
        jQuery("#<%=this.KeyWord.ClientID %>").val('');
    }
}
function keyWordBlur() {
    if (jQuery("#<%=this.KeyWord.ClientID %>").val() == '') {
        jQuery("#<%=this.KeyWord.ClientID %>").val('������ؼ��֣�');
    }
}

  //-->    
</script>

		 
   <div id="manage_top" class="toptitle menu_top_fixed" style="text-align:left">
    <span style="float:right"><select name="classid" style="width:150px" OnChange="location.href='KS.RecycleBin.Aspx?classid='+this.value;">
                <option value=0>������ת����Ŀ...</option>
                <%=ClassManage.GetClassOptionByPurview(Convert.ToInt16(ChannelID),ClassID.ToString())%>
               </select>  </span>    
   
   ����վ����[����<span style="color:Red"><%=totalNum%></span>ƪ�ĵ�]</div>
   <div class="menu_top_fixed_height"></div>
          
 <div class="message">
          <table border="0" cellpadding="0" cellspacing="0" width="100%">
              <tr>
               <td style="height: 23px">
                  <b>����������</b> <asp:TextBox onfocus="keyWordFocus();" onblur="keyWordBlur();" style="color:#ccc" Text="������ؼ��֣�" CssClass="textbox"  ID="KeyWord" runat="server"></asp:TextBox>&nbsp;������
                   <asp:DropDownList ID="Condition" runat="server">
                      <asp:ListItem Value="1">����</asp:ListItem>
                      <asp:ListItem Value="2">¼����</asp:ListItem>
                      <asp:ListItem Value="3">����</asp:ListItem>
                   </asp:DropDownList>
                   <asp:Button ID="Button4" runat="server" CssClass="button" Text="��ʼ����" OnClick="Button4_Click" /></td>
               <td  align="center" style="height: 23px">
               <b>�鿴ѡ�</b> <asp:CheckBoxList ID="Attribute" runat="server" RepeatLayout="Flow" RepeatDirection="Horizontal" AutoPostBack="True" OnSelectedIndexChanged="Arrtibute_SelectedIndexChanged">
                    <asp:ListItem Value="1">�Ƽ�</asp:ListItem>
                    <asp:ListItem Value="2">�ȵ�</asp:ListItem>
                    <asp:ListItem Value="3">����</asp:ListItem>
                    <asp:ListItem Value="4">ͷ��</asp:ListItem>
                    <asp:ListItem Value="5">����</asp:ListItem>
                    <asp:ListItem Value="6">�õ�</asp:ListItem>
                </asp:CheckBoxList>
               </td>
               </tr>
               </table>
 </div>


    <KS:KSGV ID="List" cssclass="CTable" runat="server" AutoGenerateColumns="False" PagerType="CustomNumeric"
        Width="99%" OnRowCommand="list_RowCommand" EmptyDataText="����վ��û���ĵ�!" HorizontalAlign="Center" OnRowDataBound="list_RowDataBound" GridLines="None" OnRowCreated="List_RowCreated">
        <Columns>
            <asp:TemplateField HeaderText="ѡ��">
                <ItemStyle HorizontalAlign="Center"  Width="35px"/>
                <ItemTemplate>
                <input type="checkbox"  name="ids" value="<%#Eval("Infoid") %>" />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="InfoID" HeaderText="ID��" >
                <itemstyle horizontalalign="Center" width="40px" />
            </asp:BoundField>
            <asp:TemplateField HeaderText="����">
                <itemtemplate>
                    <span class="Recyc"></span>
                [<%# MyCache.GetCacheClass(Convert.ToInt32(Eval("classid")),1) %>]
                 <a href="../../model/view.aspx?m_id=<%#Eval("ChannelID")%>&id=<%#Eval("InfoID") %>" target="_blank" title='<%# Eval("Title") %>'><%# Utils.CutStr(Convert.ToString(Eval("Title")),50) %></a>
                </itemtemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="Inputer" HeaderText="¼����">
            <itemstyle horizontalalign="Center" />
            </asp:BoundField>
            <asp:BoundField DataField="AddDate" HtmlEncode="False" DataFormatString="{0:d}" HeaderText="���ʱ��">
            <itemstyle horizontalalign="Center"/>
            </asp:BoundField>
            <asp:BoundField DataField="Hits" HeaderText="�����">
            <itemstyle horizontalalign="Center"  />
            </asp:BoundField>
            <asp:BoundField DataField="attribute" HeaderText="����">
            <itemstyle horizontalalign="Center" />
            </asp:BoundField>
            <asp:BoundField DataField="verify" HeaderText="״̬">
            <itemstyle horizontalalign="Center" />
            </asp:BoundField>
            <asp:BoundField DataField="ChannelID" HeaderText="ģ��ID">
            </asp:BoundField>

            
            <asp:TemplateField HeaderText="��ԭ">
            <itemstyle horizontalalign="Center" />
            <itemtemplate>
              <asp:LinkButton ID="backBtn" CssClass="backBtn" title="��ԭ" runat="server" CommandArgument=<%#Eval("Infoid") %>  CommandName="recyclebinback">��ԭ</asp:LinkButton>
            </itemtemplate>
            </asp:TemplateField>
             <asp:TemplateField HeaderText="����ɾ��">
                 <itemstyle horizontalalign="Center" width="25"/>
                 <itemtemplate>
              <a href="javascript:;" class="delete" title="����ɾ��" onClick="KesionJS.Confirm('ȷ������ɾ����?','location.href=\'<%=KSCMS.GetInstallDir()+MyCache.GetCacheConfig(4) %>/content/KS.RecycleBin.aspx?action=del&channelid=<%=ChannelID %>&classid=<%=ClassID %>&page=<%=CurrPage %>&ids=<%# Eval("InfoID") %>\';','');"></a>
                 </itemtemplate>
            </asp:TemplateField>

        </Columns>
        <EmptyDataRowStyle CssClass="emptycss" />
        <HeaderStyle CssClass="CTitle" />
    </KS:KSGV>
    
    <asp:Panel ID="Panel1" runat="server" Height="30px">
          <div style="margin-top:8px"></div>
            &nbsp;&nbsp;<input type="checkbox" name="chkall" id="chkall" onClick="CheckAll(this.form);"/><label for="chkall">ȫ��ѡ��</label>
            
            <input type="button" value="����ɾ��" onMouseOver="this.className='button_on';" onMouseOut="this.className='button';" class="button" onClick="if (GetIDS('del')){ this.form.action='?action=del';this.form.submit()}" />
             
          <asp:Button ID="Button1" runat="server" Text="������ԭ" onclick="Button1_Click1" />&nbsp;
            <input type="button" value="һ�����" onMouseOver="this.className='button_on';" onMouseOut="this.className='button';" class="button" onClick="KesionJS.Confirm('�˲��������棬ȷ��һ����ջ���վ��������ĵ���?','location.href=\'<%=KSCMS.GetInstallDir()+MyCache.GetCacheConfig(4) %>/content/KS.RecycleBin.aspx?action=delall\';','');"/>
            
   </asp:Panel>
        


         <KS:Page ID="Page1" runat="server" />
        
        <script type="text/javascript">
		showtips('<span class="state"><strong>˵����</strong><br /></span>1�������еĸ���壺<font color=blue>��</font>---�Ƽ���<font color=red>��</font>---���ţ�<font color=#ff6600>��</font>---���ʣ�ͷ---ͷ����<font color=red>��</font>---������<font color=brown>��</font>---�õƣ�<font color=green>��</font>---�������ۡ�<br />2����ԭ�������վ���������ɾ�̬HTML���ܣ�����ǰ̨ҳ�����·�������һ�Ρ�');
		</script>
</asp:Content>

