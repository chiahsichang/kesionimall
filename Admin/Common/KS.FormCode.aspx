<%@ Page Language="C#" ValidateRequest="false" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.Admin_FormCode" Title="表单代码调用" Codebehind="KS.FormCode.aspx.cs" %>
<asp:Content ID="Content1" ContentPlaceHolderID="KSContent" Runat="Server">

    <asp:Panel ID="listPanel" runat="server" Width="100%">
        <KS:TopNav ID="TopNav2" runat="server" Text="表单代码调用" />
    
        <KS:KSGV ID="list" cssclass="CTable" runat='server' AutoGenerateColumns="False" GridLines="None" OnRowDataBound="list_RowDataBound" PagerType="CustomNumeric" Width="99%" AllowPaging="True" EmptyDataText="没有建表单项目" OnPageIndexChanging="list_PageIndexChanging" OnRowCommand="list_RowCommand">
            <Columns>
                <asp:BoundField DataField="Formid" HeaderText="表单ID">
                    <itemstyle horizontalalign="Center" width="50px" />
                </asp:BoundField>
                <asp:BoundField DataField="subject" HeaderText="项目名称">
                    <itemstyle width="100px" />
                </asp:BoundField>
                <asp:BoundField DataField="codetype" HeaderText="调用方式">
                    <itemstyle horizontalalign="Center" width="80px" />
                </asp:BoundField>
                <asp:TemplateField HeaderText="调用代码">
                 <itemstyle horizontalalign="Center" />
                 <itemtemplate>
                  <asp:TextBox runat="server" id="code" TextMode="MultiLine" height="60px" width="360px"></asp:TextBox>
                 
</itemtemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="链接调用">
                 <itemstyle horizontalalign="Center" />
                 <itemtemplate>
                  <asp:TextBox runat="server" id="linkcode" TextMode="MultiLine" height="60px" width="360px"></asp:TextBox>
                 
</itemtemplate>
                </asp:TemplateField>
                 <asp:TemplateField HeaderText="↓生成HTML">
                 <itemstyle horizontalalign="Center" width="90px" />
                 <itemtemplate>
                   <asp:LinkButton runat="server" id="create" commandargument=<%#Eval("formid") %> commandname="create">创建</asp:LinkButton>
                 
</itemtemplate>
                </asp:TemplateField>
            </Columns>
            <HeaderStyle CssClass="CTitle" />
            <PagerSettings LastPageImageUrl="../../sysimg/page/btnLast.gif" LastPageText="最后一页" NextPageImageUrl="../../sysimg/page/btnNext.gif"
                NextPageText="下一页" FirstPageImageUrl="../../sysimg/page/btnFirst.gif" PreviousPageImageUrl="../../sysimg/page/btnPrev.gif" Mode="NextPreviousFirstLast" />
            <PagerStyle CssClass="Page" HorizontalAlign="Right" />
            <EmptyDataRowStyle CssClass="emptycss" />
        </KS:KSGV>
        <br />
        
        <script type="text/javascript">
		showtips('<span style="color: #ff0066" class="state"><strong>说明：</strong><br /></span>每个表单也可以用动态形式调用，而无须手工生成，动态调用的格式如下：<br />&nbsp; &nbsp; <strong>Javascript输出：</strong>调用格式为&lt;script src="/plus/form.aspx?formid=<font color=red>{0}</font>"&gt;&lt;/script&gt;&nbsp;<br />&nbsp; &nbsp;<strong> 单独页面输出：</strong>调用格式为&lt;iframe src="/plus/form.aspx?formid=<font color=red>{0}</font>"&nbsp; frameborder="0" width="<font color=red>{1}</font>" height="<font color=red>{2}</font>" scrolling="no"&gt;&lt;/frame&gt;<br />其中：<span style="color: #ff0000">{0}</span>表示表单的ID号,<span style="color: #ff0000">{1}<span style="color: #666666">表示</span></span>Iframe宽，<span style="color: #ff0000">{2}<span style="color: #666666">表示</span></span>Iframe高');
		</script>
        
        
    </asp:Panel>
    
    
<asp:Panel ID="CreatePanel" runat="server" Width="100%" Visible="false">
    <KS:TopNav ID="TopNav1" runat="server" Text="表单创建生成操作" />
 <table width="100%" border="0" cellpadding="1" cellspacing="1" class="CTable"> 
          <tr>
            <td class="lefttd" height="30" align="right" style="width: 146px"><b>项目名称：</b></td>
            <td class="righttd">
                <asp:Label ID="LabSubject" runat="server" Text="Label" ForeColor="Red"></asp:Label>
                </td>
          </tr>
     <tr>
         <td align="right" class="lefttd" height="30" style="width: 146px">
             <strong>表单代码：</strong></td>
         <td class="righttd">
             <asp:TextBox CssClass="textbox" ID="TxtCode" runat="server" Height="300px" TextMode="MultiLine" Width="98%"></asp:TextBox></td>
     </tr>
     <tr>
         <td align="right" class="lefttd" height="30" style="width: 146px">
             <strong>生成路径：</strong></td>
         <td class="righttd">
             <asp:TextBox CssClass="textbox" ID="TxtFileName" runat="server" Width="301px"></asp:TextBox></td>
     </tr>
 </table>
    <br />
    <KS:Foot ID="Foot1" runat="server" SubmitButtonText="确定创建(0)" OnSubmit="Foot1_Submit" />
</asp:Panel>

</asp:Content>

