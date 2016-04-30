<%@ Page Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.Admin_BBS_Rank" Title="论坛等级管理" Codebehind="KS.BBSRank.aspx.cs" %>
<asp:Content ID="Content1" ContentPlaceHolderID="KSContent" Runat="Server">

<asp:Panel ID="ListPannel" runat="server" Width="100%">
 <div id="manage_top" class="toptitle menu_top_fixed" style="text-align:left">论坛等级管理  <a href="?action=Add">添加新等级</a></div>
 <div class="menu_top_fixed_height"></div> 
        <asp:GridView ID="RankList" cssclass="CTable"  runat="server" AutoGenerateColumns="False" EmptyDataText="还没有添加论坛等级!"
        GridLines="None"  OnRowDataBound="List_RowDataBound"
        Width="99%" OnRowCommand="RankList_RowCommand" OnRowCreated="RankList_RowCreated">
        <EmptyDataRowStyle CssClass="emptycss" />
        <Columns>
            
            
             <asp:TemplateField HeaderText="等级ID" InsertVisible="False">   
            <ItemStyle HorizontalAlign="Center" Width="60px" />                    
                <ItemTemplate>    
                    <%# Eval("RankID") %> 
                    <asp:HiddenField ID="HidIsSys" runat="server" Value='<%# Eval("IsSys") %>' />      
                </ItemTemplate>             
            </asp:TemplateField> 
            
            <asp:TemplateField HeaderText="等级名称">
            <ItemStyle HorizontalAlign="Center" />
            <ItemTemplate>
              <asp:TextBox CssClass="textbox" Width="100" ID="TxtRankName" Text='<%#Eval("RankName") %>' runat="server"></asp:TextBox>
             </ItemTemplate>
            </asp:TemplateField>           
            <asp:TemplateField HeaderText="等级图标">
            <ItemStyle HorizontalAlign="Center" Width="200px" />
            <ItemTemplate>
              <asp:TextBox CssClass="textbox" ID="TxtIco"  Width="100" Text='<%#Eval("Ico") %>' runat="server"></asp:TextBox>
              <img src="../../sysimg/rank/<%# Eval("ico") %>" />
             </ItemTemplate> 
            </asp:TemplateField>
            <asp:TemplateField HeaderText="颜色值">
            <ItemStyle HorizontalAlign="Center" Width="200px" />
            <ItemTemplate>
              <asp:TextBox CssClass="textbox" ID="TxtColor"  Width="60" Text='<%#Eval("Color") %>' runat="server"></asp:TextBox>
             </ItemTemplate> 
            </asp:TemplateField>
            <asp:TemplateField HeaderText="所需积分">
            <ItemStyle HorizontalAlign="Center" />
            <ItemTemplate>
              <asp:TextBox CssClass="textbox" ID="TxtScore" Width="40" Text='<%#Eval("Score") %>' runat="server"></asp:TextBox>
             </ItemTemplate> 
            </asp:TemplateField>
            <asp:TemplateField HeaderText="主题数">
            <ItemStyle HorizontalAlign="Center" />
            <ItemTemplate>
              <asp:TextBox CssClass="textbox" ID="TxtTopicNum"  Width="40" Text='<%#Eval("TopicNum") %>' runat="server"></asp:TextBox>
             </ItemTemplate> 
            </asp:TemplateField>
            <asp:TemplateField HeaderText="回复数">
            <ItemStyle HorizontalAlign="Center" />
            <ItemTemplate>
              <asp:TextBox CssClass="textbox" ID="TxtPostNum"   Width="40" Text='<%#Eval("PostNum") %>' runat="server"></asp:TextBox>
             </ItemTemplate> 
            </asp:TemplateField>

            <asp:TemplateField HeaderText="删除">
                       <itemstyle horizontalalign="Center" width="25"/>
                        <itemtemplate>
                         <asp:LinkButton CssClass="delete" ToolTip="删除" ID="lkbDelete" CommandName="dodel" CommandArgument='<%#Eval("RankID") %>' runat="server"></asp:LinkButton>
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
               showtips('<span class="state"><strong>说明：</strong><br /></span>1、等级图标请放到/sysimg/rank/目录下；<br/>2、应该尽量不要删除已添加的等级;<br/>3、等级高的请放在最后，即按等级ID号从低都高。');
	 </script>

</asp:Panel>

<asp:Panel ID="PanAdd" runat="server" Visible="false">
<KS:TopNav ID="TopNav1" runat="server" Text="添加问答等级" />
        <table width="99%" style="margin:0 auto;" border="0" cellpadding="1" cellspacing="1" class="CTable"> 
          <tr>
            <td class="lefttd" height="30" align="right" style="width: 198px"><b>等级名称：</b></td>
            <td class="righttd">
                &nbsp;<asp:TextBox CssClass="textbox" ID="TxtRankName" runat="server"></asp:TextBox> <font color=#ff0000>*</font>
              </td>
          </tr>
          <tr>
            <td class="lefttd" height="30" align="right" style="width: 198px"><b>等级图标：</b></td>
            <td class="righttd">
                &nbsp;<asp:TextBox CssClass="textbox" ID="TxtIco" Text="rank0.gif" runat="server"></asp:TextBox> 
              </td>
          </tr>
          <tr>
            <td class="lefttd" height="30" align="right" style="width: 198px"><b>等级颜色：</b></td>
            <td class="righttd">
                &nbsp;<asp:TextBox CssClass="textbox" ID="TxtColor"  runat="server"></asp:TextBox> <span class="tips">请填写颜色值，如#666666,可以留空不填。</span>
              </td>
          </tr>
          <tr>
            <td class="lefttd" height="30" align="right" style="width: 198px"><b>升级到该等级的条件：</b></td>
            <td class="righttd">
                &nbsp;积分：<asp:TextBox CssClass="textbox" Width="50px" style="text-align:center" ID="TxtScore" Text="0" runat="server"></asp:TextBox> 
                &nbsp;问题数：<asp:TextBox CssClass="textbox" Width="50px" style="text-align:center" ID="TxtTopicNum" Text="0" runat="server"></asp:TextBox> 
                &nbsp;回答数：<asp:TextBox CssClass="textbox" Width="50px" style="text-align:center" ID="TxtPostNum" Text="0" runat="server"></asp:TextBox> 
              </td>
          </tr>

       </table>
 <br />
    <KS:Foot ID="Foot2" runat="server" OnSubmit="Foot2_Submit" SubmitButtonText="确定保存(0)" />
</asp:Panel>



</asp:Content>

