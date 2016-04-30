<%@ Page Language="C#" ValidateRequest="false" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.Admin_FormCode" Title="���������" Codebehind="KS.FormCode.aspx.cs" %>
<asp:Content ID="Content1" ContentPlaceHolderID="KSContent" Runat="Server">

    <asp:Panel ID="listPanel" runat="server" Width="100%">
        <KS:TopNav ID="TopNav2" runat="server" Text="���������" />
    
        <KS:KSGV ID="list" cssclass="CTable" runat='server' AutoGenerateColumns="False" GridLines="None" OnRowDataBound="list_RowDataBound" PagerType="CustomNumeric" Width="99%" AllowPaging="True" EmptyDataText="û�н�����Ŀ" OnPageIndexChanging="list_PageIndexChanging" OnRowCommand="list_RowCommand">
            <Columns>
                <asp:BoundField DataField="Formid" HeaderText="��ID">
                    <itemstyle horizontalalign="Center" width="50px" />
                </asp:BoundField>
                <asp:BoundField DataField="subject" HeaderText="��Ŀ����">
                    <itemstyle width="100px" />
                </asp:BoundField>
                <asp:BoundField DataField="codetype" HeaderText="���÷�ʽ">
                    <itemstyle horizontalalign="Center" width="80px" />
                </asp:BoundField>
                <asp:TemplateField HeaderText="���ô���">
                 <itemstyle horizontalalign="Center" />
                 <itemtemplate>
                  <asp:TextBox runat="server" id="code" TextMode="MultiLine" height="60px" width="360px"></asp:TextBox>
                 
</itemtemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="���ӵ���">
                 <itemstyle horizontalalign="Center" />
                 <itemtemplate>
                  <asp:TextBox runat="server" id="linkcode" TextMode="MultiLine" height="60px" width="360px"></asp:TextBox>
                 
</itemtemplate>
                </asp:TemplateField>
                 <asp:TemplateField HeaderText="������HTML">
                 <itemstyle horizontalalign="Center" width="90px" />
                 <itemtemplate>
                   <asp:LinkButton runat="server" id="create" commandargument=<%#Eval("formid") %> commandname="create">����</asp:LinkButton>
                 
</itemtemplate>
                </asp:TemplateField>
            </Columns>
            <HeaderStyle CssClass="CTitle" />
            <PagerSettings LastPageImageUrl="../../sysimg/page/btnLast.gif" LastPageText="���һҳ" NextPageImageUrl="../../sysimg/page/btnNext.gif"
                NextPageText="��һҳ" FirstPageImageUrl="../../sysimg/page/btnFirst.gif" PreviousPageImageUrl="../../sysimg/page/btnPrev.gif" Mode="NextPreviousFirstLast" />
            <PagerStyle CssClass="Page" HorizontalAlign="Right" />
            <EmptyDataRowStyle CssClass="emptycss" />
        </KS:KSGV>
        <br />
        
        <script type="text/javascript">
		showtips('<span style="color: #ff0066" class="state"><strong>˵����</strong><br /></span>ÿ����Ҳ�����ö�̬��ʽ���ã��������ֹ����ɣ���̬���õĸ�ʽ���£�<br />&nbsp; &nbsp; <strong>Javascript�����</strong>���ø�ʽΪ&lt;script src="/plus/form.aspx?formid=<font color=red>{0}</font>"&gt;&lt;/script&gt;&nbsp;<br />&nbsp; &nbsp;<strong> ����ҳ�������</strong>���ø�ʽΪ&lt;iframe src="/plus/form.aspx?formid=<font color=red>{0}</font>"&nbsp; frameborder="0" width="<font color=red>{1}</font>" height="<font color=red>{2}</font>" scrolling="no"&gt;&lt;/frame&gt;<br />���У�<span style="color: #ff0000">{0}</span>��ʾ����ID��,<span style="color: #ff0000">{1}<span style="color: #666666">��ʾ</span></span>Iframe��<span style="color: #ff0000">{2}<span style="color: #666666">��ʾ</span></span>Iframe��');
		</script>
        
        
    </asp:Panel>
    
    
<asp:Panel ID="CreatePanel" runat="server" Width="100%" Visible="false">
    <KS:TopNav ID="TopNav1" runat="server" Text="���������ɲ���" />
 <table width="100%" border="0" cellpadding="1" cellspacing="1" class="CTable"> 
          <tr>
            <td class="lefttd" height="30" align="right" style="width: 146px"><b>��Ŀ���ƣ�</b></td>
            <td class="righttd">
                <asp:Label ID="LabSubject" runat="server" Text="Label" ForeColor="Red"></asp:Label>
                </td>
          </tr>
     <tr>
         <td align="right" class="lefttd" height="30" style="width: 146px">
             <strong>�����룺</strong></td>
         <td class="righttd">
             <asp:TextBox CssClass="textbox" ID="TxtCode" runat="server" Height="300px" TextMode="MultiLine" Width="98%"></asp:TextBox></td>
     </tr>
     <tr>
         <td align="right" class="lefttd" height="30" style="width: 146px">
             <strong>����·����</strong></td>
         <td class="righttd">
             <asp:TextBox CssClass="textbox" ID="TxtFileName" runat="server" Width="301px"></asp:TextBox></td>
     </tr>
 </table>
    <br />
    <KS:Foot ID="Foot1" runat="server" SubmitButtonText="ȷ������(0)" OnSubmit="Foot1_Submit" />
</asp:Panel>

</asp:Content>

