<%@ Page Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.Admin_BBS_Table" Title="��̳���ݱ����" Codebehind="KS.BBSTable.aspx.cs" %>
<asp:Content ID="Content1" ContentPlaceHolderID="KSContent" Runat="Server">

<asp:Panel ID="ListPannel" runat="server" Width="100%">
<div id="manage_top" class="toptitle menu_top_fixed" style="text-align:left">��̳���ݱ����  <a href="?action=Add">��������ݱ�</a></div>
<div class="menu_top_fixed_height"></div> 
<script type="text/javascript">
    function setRadio(nowRadio) {
        var myForm, objRadio;
        myForm = document.forms[0];
        for (var i = 0; i < myForm.length; i++) {
            if (myForm.elements[i].type == "radio") {
                objRadio = myForm.elements[i];
                if (objRadio != nowRadio && objRadio.name.indexOf("RankList") > -1 && objRadio.name.indexOf("RdbIsDefault") > -1) {
                    if (objRadio.checked) {
                        objRadio.checked = false;
                    }
                }
            }
        }
    }
 </script>
        <asp:GridView ID="RankList" cssclass="CTable"  runat="server" AutoGenerateColumns="False" EmptyDataText="��û�������̳���ݱ�!"
        GridLines="None" OnRowDataBound="List_RowDataBound"
        Width="99%" OnRowCommand="RankList_RowCommand" OnRowCreated="RankList_RowCreated">
        <EmptyDataRowStyle CssClass="emptycss" />
        <Columns>
            
            
             <asp:TemplateField HeaderText="���ݱ�ID" InsertVisible="False">   
            <ItemStyle HorizontalAlign="Center" Width="60px" />                    
                <ItemTemplate>    
                    <%# Eval("TableId") %> 
                    <asp:HiddenField ID="HidIsSys" runat="server" Value='<%# Eval("IsSys") %>' />      
                </ItemTemplate>             
            </asp:TemplateField> 
            
            <asp:TemplateField HeaderText="���ݱ�����">
            <ItemStyle HorizontalAlign="Center" />
            <ItemTemplate>
              <asp:TextBox CssClass="textbox" Width="250" ID="TxtTitle" Text='<%#Eval("Title") %>' runat="server"></asp:TextBox>
             </ItemTemplate>
            </asp:TemplateField>           
            <asp:TemplateField HeaderText="���ݱ�">
            <ItemStyle  HorizontalAlign="Left" />
            <ItemTemplate>
              <%# Eval("TableName") %>
             </ItemTemplate> 
            </asp:TemplateField>
            
            <asp:TemplateField HeaderText="����">
            <ItemStyle HorizontalAlign="Center" />
            <ItemTemplate>
              <%#Convert.ToString(Eval("issys"))=="1"?"<span style='color:#999'>ϵͳ��</span>":"<span style='color:green'>�Խ���</span>" %>
             </ItemTemplate> 
            </asp:TemplateField>
            <asp:TemplateField HeaderText="������">
            <ItemStyle HorizontalAlign="Center" />
            <ItemTemplate>
              <span style="color:Red"><%# getRecoredNum(Convert.ToString(Eval("tableName")))%> ��</span>
             </ItemTemplate> 
            </asp:TemplateField>
           <asp:TemplateField HeaderText="�Ƿ�Ĭ��">
            <ItemStyle HorizontalAlign="Center" />
            <ItemTemplate>
            <asp:RadioButton ID="RdbIsDefault" runat="server" />
            <asp:HiddenField ID="HidIsDefault" runat="server" Value='<%# Eval("IsDefault") %>' />
             </ItemTemplate> 
            </asp:TemplateField>
              <asp:TemplateField HeaderText="ɾ��">
                       <itemstyle horizontalalign="Center" width="25"/>
                        <itemtemplate>
                <asp:LinkButton ID="lkbDelete" CssClass="delete" ToolTip="ɾ��" CommandName="dodel" CommandArgument='<%#Eval("TableId") %>' runat="server"></asp:LinkButton>
                        </itemtemplate>
               </asp:TemplateField>

           

        </Columns>
        <HeaderStyle CssClass="CTitle" />
    </asp:GridView>
    
    <div style="display:none">

     <KS:Page ID="Page1" runat="server" /></div>
    <br />
    <KS:Foot ID="Foot1" runat="server" OnSubmit="Foot1_Submit" CancelButtonVisible="false" SubmitButtonText="��������(0)" />
    <br />
     <script type="text/javascript">
         showtips('<span class="state"><strong>˵����</strong><br /></span>1�����ݱ���ѡ�е�Ϊ��ǰ��̳��ʹ��������ظ����ݵı�һ�������ÿ�����е�����Խ�����������ҳ��ʾ�ٶ�Խ�죬�������е������ݱ��е������г�������ļ�¼ʱ��������һ�����ݱ�������ش�����,���ᷢ����̳�ٶȿ�ܶ�ܶ�;<br/>2�����������ǰ����ʹ�õ����ݱ����м�¼�����ݱ����ϵͳ�Դ����ݱ�����ɾ����');
	 </script>

</asp:Panel>

<asp:Panel ID="PanAdd" runat="server" Visible="false">
<KS:TopNav ID="TopNav1" runat="server" Text="����ʴ����ݱ�" />
        <table width="99%" style="margin:0 auto;" border="0" cellpadding="1" cellspacing="1" class="CTable"> 
          <tr>
            <td class="lefttd" height="30" align="right" style="width: 198px"><b>���ݱ������</b></td>
            <td class="righttd">
                &nbsp;<asp:TextBox CssClass="textbox" ID="TxtTitle" runat="server"></asp:TextBox> <font color=#ff0000>*</font>
              </td>
          </tr>
          <tr>
            <td class="lefttd" height="30" align="right" style="width: 198px"><b>���ݱ����ƣ�</b></td>
            <td class="righttd">
                &nbsp;KS_BBS<asp:TextBox CssClass="textbox" ID="TxtTableName" Text="" Width="120" runat="server"></asp:TextBox> <font color=#ff0000>*</font>
                <span class="tips">��ʾ���Զ����ϵͳ���Զ�����KS_BBS��ͷ��</span>
              </td>
          </tr>
          <tr>
            <td class="lefttd" height="30" align="right" style="width: 198px"><b>����ΪĬ�ϣ�</b></td>
            <td class="righttd">
                &nbsp;
                <asp:RadioButtonList ID="RdbIsDefault" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow">
                 <asp:ListItem Value="1" Selected>��</asp:ListItem>
                 <asp:ListItem Value="0">��</asp:ListItem>
                </asp:RadioButtonList>
              </td>
          </tr>
         

       </table>
 <br />
    <KS:Foot ID="Foot2" runat="server" OnSubmit="Foot2_Submit" SubmitButtonText="ȷ������(0)" />
</asp:Panel>



</asp:Content>

