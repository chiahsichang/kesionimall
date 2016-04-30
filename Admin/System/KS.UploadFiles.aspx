<%@ Page Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.Admin_UploadFiles"  Title="上传文件管理" Codebehind="KS.UploadFiles.aspx.cs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="KSContent" Runat="Server">
        <div id="manage_top" class="menu_top_fixed">
           <ul>
            <li id='p3'><asp:LinkButton ID="delall" runat="server" OnClick="delall_Click"><b></b>清理无用上传文件</asp:LinkButton></li>
            <li id='p3'><asp:LinkButton ID="delFolder" runat="server" onclick="delFolder_Click"><b></b>一键删除空文件夹</asp:LinkButton></li>
            <li id='p3'><asp:LinkButton ID="LinkButton1" runat="server" 
                 onclick="LinkButton1_Click"><b></b>一键删除Thumbs.db文件</asp:LinkButton></li>
           </ul>      
        </div>  
        <div class="menu_top_fixed_height"></div>      
        <asp:Panel ID="Panel1"  cssclass="CTable" runat="server" Width="100%">
        
            <asp:DataList ID="DataList1"  runat="server" RepeatColumns="6" Width="100%"  HorizontalAlign="Center" >
                <ItemTemplate>
                 <span class="folder"></span><a href='?Dir=<%# Server.UrlEncode(_path+Convert.ToString(Eval("Name"))) %>'><%# Eval("Name") %></a>
                </ItemTemplate>
                <ItemStyle />
            </asp:DataList>
            <table border="0" width="99%" align="center">
             <tr>
              <td height="30" class="righttd">当前目录:<asp:Label ID="LabCurrDir" runat="server"></asp:Label>&nbsp;&nbsp;&nbsp;&nbsp;占用大小:<asp:Label ID="LabSite" runat="server" ForeColor="red"></asp:Label></td>
              <td class="righttd"><a href="?dir=<%=_parentDir %>">↑返回上一层目录</a></td>
             </tr>
            </table>
            
            
            <asp:DataList ID="DataList2" runat="server" RepeatColumns="4" Width="99%" CssClass="lefttd" HorizontalAlign="Center" CellPadding="1" CellSpacing="1" >
                <HeaderTemplate>
                </HeaderTemplate>
                
                <ItemTemplate>
                 <%# GetItem(Convert.ToString(Eval("Name")), Convert.ToString(Eval("TypeName")), Convert.ToString(Eval("size")), Convert.ToString(Eval("time")))%>                
                </ItemTemplate>
                <FooterTemplate>
                  <table width="100%">
                  <tr>
			       <td style="padding:10px;height:50px;background-color:White;border-color:#E0E0E0;border-style:Solid;display:<%# bool.Parse((DataList2.Items.Count==0).ToString())?"":"none"%>">
                  该目录下没有任何文件！
                  </td>
                  </tr>
                  </table>
                </FooterTemplate>
                <ItemStyle CssClass="lefttd" BackColor="White" BorderColor="#E0E0E0" BorderStyle="Solid" />
            </asp:DataList>
           <table cellpadding="0" cellspacing="0" style="width: 100%;margin-top:10px">
            <tr>
                <td style="height: 25px">&nbsp;
                    
                    </td>
                <td style="font-size: 9pt; height: 25px; text-align: right">
                    <asp:Label ID="Label7" runat="server" Text="当前页码为："></asp:Label>
                    <asp:TextBox ID="labPage" runat="server" AutoPostBack="True" OnTextChanged="labPage_TextChanged"
                        Text="1" Width="30px"></asp:TextBox>
                    &nbsp; &nbsp;
                    <asp:Label ID="Label6" runat="server" Text="总页数："></asp:Label><asp:Label ID="labBackPage"
                        runat="server"></asp:Label>
                    页 每页显示：<asp:Label ID="labperpagenum" runat="server" Text="Label"></asp:Label>
                    条
                    <asp:LinkButton ID="lnkbtnOne" runat="server" Font-Underline="False" ForeColor="Red"
                        OnClick="lnkbtnOne_Click">第一页</asp:LinkButton>
                    <asp:LinkButton ID="lnkbtnUp" runat="server" Font-Underline="False" ForeColor="Red"
                        OnClick="lnkbtnUp_Click">上一页</asp:LinkButton>
                    <asp:LinkButton ID="lnkbtnNext" runat="server" Font-Underline="False" ForeColor="Red"
                        OnClick="lnkbtnNext_Click">下一页</asp:LinkButton>&nbsp;
                    <asp:LinkButton ID="lnkbtnBack" runat="server" Font-Underline="False" ForeColor="Red"
                        OnClick="lnkbtnBack_Click">最后一页</asp:LinkButton>
                    &nbsp;
                </td>
            </tr>
        </table>
            
        
            &nbsp;&nbsp;&nbsp;
             <input type="checkbox" name="chkall" id="chkall" onclick="CheckAll(this.form);"/><label for="chkall">全部选中</label>&nbsp;
            <asp:Button ID="BtnDelSelectFile" runat="server" OnClick="BtnDelSelectFile_Click"
                Text="删除选中的文件" CssClass="button" />
            <asp:Button ID="BtnDeleteAllFile" runat="server" OnClick="BtnDeleteAllFile_Click"
                Text="删除本目录所有文件" CssClass="button" />&nbsp;<asp:Button ID="BtnDelFolderAndFile" runat="server"  Text="删除本目录所有文件夹和文件" OnClick="BtnDelFolderAndFile_Click" CssClass="button" />
            <asp:Button ID="BtnDelEmptyFolder" runat="server" Text="删除空文件夹" OnClick="delFolder_Click" CssClass="button" />
            
            <div style="text-align:center;margin-top:20px">
            
                <asp:Button ID="BtnClearAll" runat="server" Text="一键清除所有垃圾文件" OnClientClick="return(confirm('此操作不可逆,确定一键清理无用文件吗?'))" OnClick="BtnCleanAll_Click" CssClass="button"/>
            </div>
            
            </asp:Panel>
            
            <asp:Panel ID="Panel2" runat="server" Visible="false" Width="100%">
            <table border="0" width="99%" align="center" class="CTable">
             <tr>
              <td class="righttd"><br>&nbsp;&nbsp;①、你的网站在使用一段时间后，就会产生大量无用垃圾文件。如果怕浪费您的空间，可以定期使用本功能进行清理；<br><br>&nbsp;&nbsp;②、上传目录统一命名为UploadFiles,此功能仅对UpLoadFiles目录执行清理功能，执行本操作前建议先备份您的上传目录，以免误删除。请尽量选择按月份清理；<br><br>&nbsp;&nbsp;③、如果上传文件很多，或者数据库的信息量较多，执行本操作需要耗费相当长的时间，请在访问量少时执行本操作。<br><br></td>
             </tr>
             <tr>
              <td height="30px" class="righttd">
                   <strong>按目录清除：</strong>
                  <asp:DropDownList ID="DrpFolder" runat="server">
                  </asp:DropDownList>&nbsp;
                  <asp:Button ID="BtnClean" OnClientClick="return(confirm('此操作不可逆,确定对选定的目录进行清理吗?'))" runat="server" Text="删除选中的文件" OnClick="BtnClean_Click" CssClass="button" />
                  <asp:Button ID="BtnCleanAll" OnClientClick="return(confirm('此操作不可逆,确定一键清理无用文件吗?'))" runat="server" Text="一键清除所有无用的文件" OnClick="BtnCleanAll_Click" CssClass="button" /></td>
             </tr>
            </table>
            </asp:Panel>
    <br />
    <br />
</asp:Content>
