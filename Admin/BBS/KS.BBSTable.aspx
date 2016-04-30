<%@ Page Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.Admin_BBS_Table" Title="论坛数据表管理" Codebehind="KS.BBSTable.aspx.cs" %>
<asp:Content ID="Content1" ContentPlaceHolderID="KSContent" Runat="Server">

<asp:Panel ID="ListPannel" runat="server" Width="100%">
<div id="manage_top" class="toptitle menu_top_fixed" style="text-align:left">论坛数据表管理  <a href="?action=Add">添加新数据表</a></div>
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
        <asp:GridView ID="RankList" cssclass="CTable"  runat="server" AutoGenerateColumns="False" EmptyDataText="还没有添加论坛数据表!"
        GridLines="None" OnRowDataBound="List_RowDataBound"
        Width="99%" OnRowCommand="RankList_RowCommand" OnRowCreated="RankList_RowCreated">
        <EmptyDataRowStyle CssClass="emptycss" />
        <Columns>
            
            
             <asp:TemplateField HeaderText="数据表ID" InsertVisible="False">   
            <ItemStyle HorizontalAlign="Center" Width="60px" />                    
                <ItemTemplate>    
                    <%# Eval("TableId") %> 
                    <asp:HiddenField ID="HidIsSys" runat="server" Value='<%# Eval("IsSys") %>' />      
                </ItemTemplate>             
            </asp:TemplateField> 
            
            <asp:TemplateField HeaderText="数据表名称">
            <ItemStyle HorizontalAlign="Center" />
            <ItemTemplate>
              <asp:TextBox CssClass="textbox" Width="250" ID="TxtTitle" Text='<%#Eval("Title") %>' runat="server"></asp:TextBox>
             </ItemTemplate>
            </asp:TemplateField>           
            <asp:TemplateField HeaderText="数据表">
            <ItemStyle  HorizontalAlign="Left" />
            <ItemTemplate>
              <%# Eval("TableName") %>
             </ItemTemplate> 
            </asp:TemplateField>
            
            <asp:TemplateField HeaderText="类型">
            <ItemStyle HorizontalAlign="Center" />
            <ItemTemplate>
              <%#Convert.ToString(Eval("issys"))=="1"?"<span style='color:#999'>系统表</span>":"<span style='color:green'>自建表</span>" %>
             </ItemTemplate> 
            </asp:TemplateField>
            <asp:TemplateField HeaderText="数据量">
            <ItemStyle HorizontalAlign="Center" />
            <ItemTemplate>
              <span style="color:Red"><%# getRecoredNum(Convert.ToString(Eval("tableName")))%> 条</span>
             </ItemTemplate> 
            </asp:TemplateField>
           <asp:TemplateField HeaderText="是否默认">
            <ItemStyle HorizontalAlign="Center" />
            <ItemTemplate>
            <asp:RadioButton ID="RdbIsDefault" runat="server" />
            <asp:HiddenField ID="HidIsDefault" runat="server" Value='<%# Eval("IsDefault") %>' />
             </ItemTemplate> 
            </asp:TemplateField>
              <asp:TemplateField HeaderText="删除">
                       <itemstyle horizontalalign="Center" width="25"/>
                        <itemtemplate>
                <asp:LinkButton ID="lkbDelete" CssClass="delete" ToolTip="删除" CommandName="dodel" CommandArgument='<%#Eval("TableId") %>' runat="server"></asp:LinkButton>
                        </itemtemplate>
               </asp:TemplateField>

           

        </Columns>
        <HeaderStyle CssClass="CTitle" />
    </asp:GridView>
    
    <div style="display:none">

     <KS:Page ID="Page1" runat="server" /></div>
    <br />
    <KS:Foot ID="Foot1" runat="server" OnSubmit="Foot1_Submit" CancelButtonVisible="false" SubmitButtonText="批量保存(0)" />
    <br />
     <script type="text/javascript">
         showtips('<span class="state"><strong>说明：</strong><br /></span>1、数据表中选中的为当前论坛所使用来保存回复数据的表，一般情况下每个表中的数据越少问题的详情页显示速度越快，当您上列单个数据表中的数据有超过几万的记录时不妨新添一个数据表来保存回答数据,您会发现论坛速度快很多很多;<br/>2、以免出错，当前正在使用的数据表、已有记录的数据表或是系统自带数据表不允许删除。');
	 </script>

</asp:Panel>

<asp:Panel ID="PanAdd" runat="server" Visible="false">
<KS:TopNav ID="TopNav1" runat="server" Text="添加问答数据表" />
        <table width="99%" style="margin:0 auto;" border="0" cellpadding="1" cellspacing="1" class="CTable"> 
          <tr>
            <td class="lefttd" height="30" align="right" style="width: 198px"><b>数据表别名：</b></td>
            <td class="righttd">
                &nbsp;<asp:TextBox CssClass="textbox" ID="TxtTitle" runat="server"></asp:TextBox> <font color=#ff0000>*</font>
              </td>
          </tr>
          <tr>
            <td class="lefttd" height="30" align="right" style="width: 198px"><b>数据表名称：</b></td>
            <td class="righttd">
                &nbsp;KS_BBS<asp:TextBox CssClass="textbox" ID="TxtTableName" Text="" Width="120" runat="server"></asp:TextBox> <font color=#ff0000>*</font>
                <span class="tips">提示：自定义表系统会自动加上KS_BBS开头。</span>
              </td>
          </tr>
          <tr>
            <td class="lefttd" height="30" align="right" style="width: 198px"><b>设置为默认：</b></td>
            <td class="righttd">
                &nbsp;
                <asp:RadioButtonList ID="RdbIsDefault" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow">
                 <asp:ListItem Value="1" Selected>是</asp:ListItem>
                 <asp:ListItem Value="0">否</asp:ListItem>
                </asp:RadioButtonList>
              </td>
          </tr>
         

       </table>
 <br />
    <KS:Foot ID="Foot2" runat="server" OnSubmit="Foot2_Submit" SubmitButtonText="确定保存(0)" />
</asp:Panel>



</asp:Content>

