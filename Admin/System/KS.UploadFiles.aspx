<%@ Page Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.Admin_UploadFiles"  Title="�ϴ��ļ�����" Codebehind="KS.UploadFiles.aspx.cs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="KSContent" Runat="Server">
        <div id="manage_top" class="menu_top_fixed">
           <ul>
            <li id='p3'><asp:LinkButton ID="delall" runat="server" OnClick="delall_Click"><b></b>���������ϴ��ļ�</asp:LinkButton></li>
            <li id='p3'><asp:LinkButton ID="delFolder" runat="server" onclick="delFolder_Click"><b></b>һ��ɾ�����ļ���</asp:LinkButton></li>
            <li id='p3'><asp:LinkButton ID="LinkButton1" runat="server" 
                 onclick="LinkButton1_Click"><b></b>һ��ɾ��Thumbs.db�ļ�</asp:LinkButton></li>
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
              <td height="30" class="righttd">��ǰĿ¼:<asp:Label ID="LabCurrDir" runat="server"></asp:Label>&nbsp;&nbsp;&nbsp;&nbsp;ռ�ô�С:<asp:Label ID="LabSite" runat="server" ForeColor="red"></asp:Label></td>
              <td class="righttd"><a href="?dir=<%=_parentDir %>">��������һ��Ŀ¼</a></td>
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
                  ��Ŀ¼��û���κ��ļ���
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
                    <asp:Label ID="Label7" runat="server" Text="��ǰҳ��Ϊ��"></asp:Label>
                    <asp:TextBox ID="labPage" runat="server" AutoPostBack="True" OnTextChanged="labPage_TextChanged"
                        Text="1" Width="30px"></asp:TextBox>
                    &nbsp; &nbsp;
                    <asp:Label ID="Label6" runat="server" Text="��ҳ����"></asp:Label><asp:Label ID="labBackPage"
                        runat="server"></asp:Label>
                    ҳ ÿҳ��ʾ��<asp:Label ID="labperpagenum" runat="server" Text="Label"></asp:Label>
                    ��
                    <asp:LinkButton ID="lnkbtnOne" runat="server" Font-Underline="False" ForeColor="Red"
                        OnClick="lnkbtnOne_Click">��һҳ</asp:LinkButton>
                    <asp:LinkButton ID="lnkbtnUp" runat="server" Font-Underline="False" ForeColor="Red"
                        OnClick="lnkbtnUp_Click">��һҳ</asp:LinkButton>
                    <asp:LinkButton ID="lnkbtnNext" runat="server" Font-Underline="False" ForeColor="Red"
                        OnClick="lnkbtnNext_Click">��һҳ</asp:LinkButton>&nbsp;
                    <asp:LinkButton ID="lnkbtnBack" runat="server" Font-Underline="False" ForeColor="Red"
                        OnClick="lnkbtnBack_Click">���һҳ</asp:LinkButton>
                    &nbsp;
                </td>
            </tr>
        </table>
            
        
            &nbsp;&nbsp;&nbsp;
             <input type="checkbox" name="chkall" id="chkall" onclick="CheckAll(this.form);"/><label for="chkall">ȫ��ѡ��</label>&nbsp;
            <asp:Button ID="BtnDelSelectFile" runat="server" OnClick="BtnDelSelectFile_Click"
                Text="ɾ��ѡ�е��ļ�" CssClass="button" />
            <asp:Button ID="BtnDeleteAllFile" runat="server" OnClick="BtnDeleteAllFile_Click"
                Text="ɾ����Ŀ¼�����ļ�" CssClass="button" />&nbsp;<asp:Button ID="BtnDelFolderAndFile" runat="server"  Text="ɾ����Ŀ¼�����ļ��к��ļ�" OnClick="BtnDelFolderAndFile_Click" CssClass="button" />
            <asp:Button ID="BtnDelEmptyFolder" runat="server" Text="ɾ�����ļ���" OnClick="delFolder_Click" CssClass="button" />
            
            <div style="text-align:center;margin-top:20px">
            
                <asp:Button ID="BtnClearAll" runat="server" Text="һ��������������ļ�" OnClientClick="return(confirm('�˲���������,ȷ��һ�����������ļ���?'))" OnClick="BtnCleanAll_Click" CssClass="button"/>
            </div>
            
            </asp:Panel>
            
            <asp:Panel ID="Panel2" runat="server" Visible="false" Width="100%">
            <table border="0" width="99%" align="center" class="CTable">
             <tr>
              <td class="righttd"><br>&nbsp;&nbsp;�١������վ��ʹ��һ��ʱ��󣬾ͻ�����������������ļ���������˷����Ŀռ䣬���Զ���ʹ�ñ����ܽ�������<br><br>&nbsp;&nbsp;�ڡ��ϴ�Ŀ¼ͳһ����ΪUploadFiles,�˹��ܽ���UpLoadFilesĿ¼ִ�������ܣ�ִ�б�����ǰ�����ȱ��������ϴ�Ŀ¼��������ɾ�����뾡��ѡ���·�����<br><br>&nbsp;&nbsp;�ۡ�����ϴ��ļ��ܶ࣬�������ݿ����Ϣ���϶ִ࣬�б�������Ҫ�ķ��൱����ʱ�䣬���ڷ�������ʱִ�б�������<br><br></td>
             </tr>
             <tr>
              <td height="30px" class="righttd">
                   <strong>��Ŀ¼�����</strong>
                  <asp:DropDownList ID="DrpFolder" runat="server">
                  </asp:DropDownList>&nbsp;
                  <asp:Button ID="BtnClean" OnClientClick="return(confirm('�˲���������,ȷ����ѡ����Ŀ¼����������?'))" runat="server" Text="ɾ��ѡ�е��ļ�" OnClick="BtnClean_Click" CssClass="button" />
                  <asp:Button ID="BtnCleanAll" OnClientClick="return(confirm('�˲���������,ȷ��һ�����������ļ���?'))" runat="server" Text="һ������������õ��ļ�" OnClick="BtnCleanAll_Click" CssClass="button" /></td>
             </tr>
            </table>
            </asp:Panel>
    <br />
    <br />
</asp:Content>
