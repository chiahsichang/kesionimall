<%@ Page Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="True" Inherits="Kesion.NET.WebSite.Admin_BlogConfig" Title="�ռ䲩�Ͳ�������" Codebehind="KS.BlogConfig.aspx.cs" %>
<asp:Content ID="Content1" ContentPlaceHolderID="KSContent" Runat="Server">
    <KS:topnav id="TopNav1" runat="server" text="�ռ䲩�Ͳ�������"></KS:topnav>
    
    
		<div class="tab-page" id="SystemSpacePanel">
         <script type="text/javascript">
             var tabPane1 = new WebFXTabPane(document.getElementById("SystemSpacePanel"), 1)
         </script>
             
		 <div class="tab-page" id="tab0">
		  <h2 class="tab">��������</h2>
			<script type="text/javascript">
						 tabPane1.addTabPage( document.getElementById( "tab0" ) );
			</script>
			
    <table id="tbs" width="100%" border="0" cellpadding="1" cellspacing="1" class="CTable"> 
         <tr>
             <td class="lefttd" height="30" align="right" style="width: 198px"><b>�ռ�״̬��</b></td>
                <td class="righttd">
                   <asp:RadioButtonList ID="BlogStatus" runat="server" RepeatDirection="horizontal">
                    <asp:ListItem Value="0">�ر�</asp:ListItem>
                    <asp:ListItem Value="1" Selected>����</asp:ListItem>
                    </asp:RadioButtonList>
                </td>
         </tr>
        <tr>
             <td class="lefttd" height="30" align="right" style="width: 198px"><b>��Ӫģʽ��</b></td>
                <td class="righttd">
                   <asp:RadioButtonList ID="BlogPattern" runat="server" RepeatDirection="horizontal">
                    <asp:ListItem Value="0" Selected>��̬ģʽ</asp:ListItem>
                    <asp:ListItem Value="1" >α��̬(.html)</asp:ListItem>
                    </asp:RadioButtonList>
                </td>
         </tr>
        <tbody style="display:none">
         <tr>
             <td class="lefttd" height="30" align="right" style="width: 198px" ><b>�Ƿ����ö���������</b></td>
                <td class="righttd">
                    <asp:RadioButtonList ID="BlogEnDomain" runat="server" Enabled="false" >
                    <asp:ListItem Value="0" Selected>�󶨱�վ��������</asp:ListItem>
                    <asp:ListItem Value="1">����󶨱�վ���������Ͷ�������(������������͵��ҵķ�����)</asp:ListItem>
                    </asp:RadioButtonList>
                </td>
         </tr>

        
          <tr>
            <td align="right" class="lefttd" height="30" style="width: 198px">
                <strong>�ռ���ҳ������</strong></td>
            <td class="righttd">
                <asp:TextBox CssClass="textbox" Text="space.kesion.com" ID="BlogIndexDomain" runat="server"></asp:TextBox>
                <span class="tips">��: space.kesion.com�����治�ܼ�"/"��û�а󶨶������������ա� ��</span></td>
        </tr>
        <tr>
            <td align="right" class="lefttd" height="30" style="width: 198px">
                <strong>�ռ�վ�����������</strong></td>
            <td class="righttd">
                <asp:TextBox CssClass="textbox" Text="space.kesion.com" ID="BlogSubDomain" runat="server"></asp:TextBox>
                <span class="tips">��:��������:space.kesion.com���������kesion.com </span></td>
        </tr>
        </tbody>
        
        <tr>
            <td align="right" class="lefttd" height="30" style="width: 198px">
                <strong>�Ƿ��Զ�ע����˿ռ䣺</strong></td>
            <td class="righttd">
                <asp:RadioButtonList ID="BlogAutoSpace" runat="server" RepeatDirection="horizontal">
                <asp:ListItem Value="1" Selected>��</asp:ListItem>
                <asp:ListItem Value="0">��</asp:ListItem>
                </asp:RadioButtonList></td>
        </tr>
        <tr>
            <td align="right" class="lefttd" height="30" style="width: 198px">
                <strong>����ռ��Ƿ���Ҫ��ˣ�</strong></td>
            <td class="righttd">
                <asp:RadioButtonList ID="BlogEnCheck" runat="server" RepeatLayout="Flow" RepeatDirection="Vertical">
                <asp:ListItem Value="1">����Ҫ</asp:ListItem>
                <asp:ListItem Value="0">��Ҫ</asp:ListItem>
                </asp:RadioButtonList></td>
        </tr>
        

        

        <tr>
            <td align="right" class="lefttd" height="30" style="width: 198px">
                <strong>�����Զ���ҳ����û��飺</strong></td>
            <td class="righttd">
                <div  runat="server" id="chkUserlevel">
                </div></td>
        </tr>

        <tr>
            <td align="right" class="lefttd" height="30" style="width: 198px">
                <strong>�ռ�ģ��ѡ�</strong></td>
            <td class="righttd">
                �����б���ʾ<asp:TextBox CssClass="textbox" Text="8" ID="BlogArticleList" runat="server" Width="50" Style="border:none;border-bottom:1px solid solid; text-align:center;"></asp:TextBox>��
                ����б���ʾ<asp:TextBox CssClass="textbox" Text="8" ID="BlogAlbumList" runat="server" Width="50" Style="border:none;border-bottom:1px solid solid; text-align:center;"></asp:TextBox>��
                �ļ��б���ʾ<asp:TextBox CssClass="textbox" Text="8" ID="BlogCorpusList" runat="server" Width="50" Style="border:none;border-bottom:1px solid solid; text-align:center;"></asp:TextBox>��
                �ʴ��б���ʾ<asp:TextBox CssClass="textbox" Text="8" ID="BlogAskList" runat="server" Width="50" Style="border:none;border-bottom:1px solid solid; text-align:center;"></asp:TextBox>
        </tr>
        <tr>
            <td align="right" class="lefttd" height="30" style="width: 198px">
                <strong>�ռ�LogoͼƬ���ԣ�</strong></td>
            <td class="righttd">
                �����ϴ���С<asp:TextBox CssClass="textbox" Text="1000" ID="BlogLogoSize" runat="server" Width="50" Style="border:none;border-bottom:1px solid solid; text-align:center;"></asp:TextBox>kb��
                ����ͼƬ��չ��<asp:TextBox CssClass="textbox" Text="jpg|png|gif" ID="BlogLogoExt" runat="server" Width="150" Style="border:none;border-bottom:1px solid solid; text-align:center;"></asp:TextBox>��
        </tr>
      
         </table>
    </div>
         
         
          
         
		 <div class="tab-page" id="tab3">
		  <h2 class="tab">��������</h2>
			<script type="text/javascript">
			    tabPane1.addTabPage(document.getElementById("tab3"));
			</script>
             <table width="100%"  border="0" cellpadding="1" cellspacing="1" class="CTable"> 

        <tr>
            <td align="right" class="lefttd" height="30" style="width: 198px">
                <strong>�������ƣ�</strong></td>
            <td class="righttd">
                ������־Ҫ��ﵽ<asp:TextBox CssClass="textbox" Text="0" ID="BlogArticleCredits" runat="server" Width="50" Style="border:none;border-bottom:1px solid solid; text-align:center;"></asp:TextBox>�ֻ��֣�
                �ϴ���ƬҪ��ﵽ<asp:TextBox CssClass="textbox" Text="0" ID="BlogAlbumCredits" runat="server" Width="50" Style="border:none;border-bottom:1px solid solid; text-align:center;"></asp:TextBox>�ֻ��֡�
        </tr>

          
         <tr>
             <td class="lefttd" height="30" align="right" style="width: 198px"><b>������־�Ƿ���Ҫ��ˣ�</b>
             <div style="color:green"></div>
             </td>
                <td class="righttd">
                <asp:RadioButtonList ID="BlogArticleEnCheck" runat="server" RepeatDirection="horizontal">
                <asp:ListItem Value="0" Selected>��</asp:ListItem>
                <asp:ListItem Value="1">��</asp:ListItem>
                </asp:RadioButtonList></td>
         </tr>
        <tr>
             <td class="lefttd" height="30" align="right" style="width: 198px"><b>������־�Ƿ������ϴ�������</b>
             <div style="color:green"></div>
             </td>
                <td class="righttd">
                <asp:RadioButtonList ID="BlogArticleUploadFileSwitch" runat="server" RepeatDirection="horizontal">
                <asp:ListItem Value="1" Selected>��</asp:ListItem>
                <asp:ListItem Value="0">��</asp:ListItem>
                </asp:RadioButtonList></td>
         </tr>
        <tr>
            <td align="right" class="lefttd" height="30" style="width: 198px">
                <strong>�����ϴ�����ѡ�</strong></td>
            <td class="righttd">
                �����ϴ��ĸ�����չ��<asp:TextBox CssClass="textbox" Text="gif | jpg | rar" ID="BlogArticleFileExt" runat="server" Width="100" Style="border:none;border-bottom:1px solid solid;text-align:center;"></asp:TextBox>�����չ���� |����,��gif|jpg|rar��<br />
                �����ϴ����ļ���С<asp:TextBox CssClass="textbox" Text="1000" ID="BlogArticleFileSize" runat="server" Width="50" Style="border:none;border-bottom:1px solid solid;"></asp:TextBox>KB<br />

        </tr>

        <tr>
             <td class="lefttd" height="30" align="right" style="width: 198px"><b>�����ϴ��������û��飺</b>
             <div style="color:green"></div>
             </td>
                <td class="righttd">
               <div id="GroupPanel" runat="server"></div>
                </td>
         </tr>

        <tr>
             <td class="lefttd" height="30" align="right" style="width: 198px"><b>��������Ƿ���Ҫ��ˣ�</b>
             <div style="color:green"></div>
             </td>
                <td class="righttd">
                <asp:RadioButtonList ID="BlogAlbumEnCheck" runat="server" RepeatDirection="horizontal">
                <asp:ListItem Value="0" Selected>��</asp:ListItem>
                <asp:ListItem Value="1">��</asp:ListItem>
                </asp:RadioButtonList></td>
         </tr>

         <tr>
            <td align="right" class="lefttd" height="30" style="width: 198px">
                <strong>��������ϴ��ĵ�����Ƭ��</strong></td>
            <td class="righttd">
                �����ϴ����ļ���С<asp:TextBox CssClass="textbox" ID="BlogAlbumFileSize" Text="1000" runat="server" Width="50" Style="border:none;border-bottom:1px solid solid;"></asp:TextBox>KB<br />
        </tr>


        <tr>
             <td class="lefttd" height="30" align="right" style="width: 198px"><b>�û������Ƿ���Ҫ��ˣ�</b>
             <div style="color:green"></div>
             </td>
                <td class="righttd">
                <asp:RadioButtonList ID="BlogMessageEnCheck" runat="server" RepeatDirection="horizontal">
                <asp:ListItem Value="0" Selected>��</asp:ListItem>
                <asp:ListItem Value="1">��</asp:ListItem>
                </asp:RadioButtonList></td>
         </tr>

        <tr>
             <td class="lefttd" height="30" align="right" style="width: 198px"><b>�����ο��ڿռ�������/���ԣ�</b>
             <div style="color:green"></div>
             </td>
                <td class="righttd">
                <asp:RadioButtonList ID="BlogMessageEnComment" runat="server" RepeatDirection="horizontal">
                <asp:ListItem Value="1" Selected>����</asp:ListItem>
                <asp:ListItem Value="0">������</asp:ListItem>
                </asp:RadioButtonList></td>
         </tr>
         
        </table>
      </div>
         
         
         
		 <div class="tab-page" id="tab2">
		  <h2 class="tab"  style="display:none;">ģ���</h2>
			<script type="text/javascript">
			    tabPane1.addTabPage(document.getElementById("tab2"));
			</script>
             <table width="100%"  border="0" cellpadding="1" cellspacing="1" class="CTable"> 
          
         <tr>
             <td class="lefttd" height="30" align="right" style="width: 198px"><b>Ƶ����ҳģ�壺</b>
             <div style="color:green">��Ӧ��̬ҳ��Index.aspx</div>
             </td>
                <td class="righttd">
                    &nbsp;<asp:TextBox CssClass="textbox" ID="ExamIndexTemplate" runat="server" Width="297px"></asp:TextBox>
                    <input type="button" class="button" onMouseOver="this.className='button_on';" onMouseOut="this.className='button';" value="ѡ��ģ��..." onClick="SelectTemplate('<%=this.ExamIndexTemplate.ClientID%>');"/>
                </td>
         </tr>
          
         <tr>
             <td class="lefttd" height="30" align="right" style="width: 198px"><b>�����б�ҳģ�壺</b>
             <div style="color:green">��Ӧ��̬ҳ��List.aspx</div>
             </td>
                <td class="righttd">
                    &nbsp;<asp:TextBox CssClass="textbox" ID="ExamListTemplate" runat="server" Width="297px"></asp:TextBox>
                    <input type="button" class="button" onMouseOver="this.className='button_on';" onMouseOut="this.className='button';" value="ѡ��ģ��..." onClick="SelectTemplate('<%=this.ExamListTemplate.ClientID%>');"/>
                </td>
         </tr>

          
         <tr>
             <td class="lefttd" height="30" align="right" style="width: 198px"><b>������ϸҳģ�壺</b>
             <div style="color:green">��Ӧ��̬ҳ��View.aspx</div>
             </td>
                <td class="righttd">
                    &nbsp;<asp:TextBox CssClass="textbox" ID="ExamContentTemplate" runat="server" Width="297px"></asp:TextBox>
                    <input type="button" class="button" onMouseOver="this.className='button_on';" onMouseOut="this.className='button';" value="ѡ��ģ��..." onClick="SelectTemplate('<%=this.ExamContentTemplate.ClientID%>');"/>
                </td>
         </tr>

       
          
    </table>
    </div>
         
		 <div class="tab-page" id="tab1">
		  <h2 class="tab"  style="display:none;">SEOѡ��</h2>
			<script type="text/javascript">
			    tabPane1.addTabPage(document.getElementById("tab1"));
			</script>
             <table width="100%"  border="0" cellpadding="1" cellspacing="1" class="CTable"> 
                              <tr>
                                <td  height="30" align="right" class="lefttd" style="width: 198px">
                                    <b>����Ƶ�����⣺</b><br /><font color="#ff0000">��ҳ����ͨ�������������ע���ص�,</font></td>
                                <td class="righttd">
                                    &nbsp;<asp:TextBox ID="TxtExamSeoTitle" runat="server" Columns="50" Rows="3" TextMode="MultiLine"></asp:TextBox>
                                        
                                </td>
                              </tr>

                             <tr>
                                 <td align="right" class="lefttd" height="30" style="width: 198px"><strong>����Ƶ��META�ؼ��ʣ�
                                     </strong><br />
                                     <font color="#ff0000">
                                     ��������������õ���ҳ�ؼ���,����ؼ�������,�ŷָ�
                                     </font>
                                 </td>
                                 <td class="righttd">
                                     &nbsp;<asp:TextBox ID="TxtExamSeoKeywords" runat="server" TextMode="MultiLine" Columns="50" Rows="5"></asp:TextBox>
                                 </td>
                             </tr>
                             <tr>
                                 <td align="right" class="lefttd" height="30" style="width: 198px">
                                     <div>
                                         <strong>����Ƶ��META��ҳ������</strong></div>
                                     <font color="#ff0000">��������������õ���ҳ����,�����������,�ŷָ�&nbsp;</font></td>
                                 <td class="righttd">
                                     &nbsp;<asp:TextBox ID="TxtExamSeoDescript" runat="server" TextMode="MultiLine" Columns="50" Rows="5"></asp:TextBox>
                               </td>
                             </tr>
              </table>

         </div>
         
    <br /><br style="clear:both" />
        <br />
    <KS:Foot runat="server" CancelButtonEnabled="false" ID="Foot1" OnSubmit="Foot1_Submit"/>
    <KS:Tips ID="Tips1" runat="server" ImagePath="../../admin/images/" />

</asp:Content>

