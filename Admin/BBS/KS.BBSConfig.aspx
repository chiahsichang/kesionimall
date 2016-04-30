<%@ Page Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.Admin_BBSConfig" Title="΢����ϵͳ��������" Codebehind="KS.BBSConfig.aspx.cs" %>
<asp:Content ID="Content1" ContentPlaceHolderID="KSContent" Runat="Server">
    <KS:topnav id="TopNav1" runat="server" text="΢����ϵͳƵ����������"></KS:topnav>
    
    
		<div class="tab-page" id="SystemBBSPanel">
         <script type="text/javascript">
           var tabPane1 = new WebFXTabPane( document.getElementById( "SystemBBSPanel" ), 1 )
         </script>
             
		 <div class="tab-page" id="tab0">
		  <h2 class="tab">��������</h2>
			<script type="text/javascript">
						 tabPane1.addTabPage( document.getElementById( "tab0" ) );
			</script>
			
    <table id="tbs" width="100%" border="0" cellpadding="1" cellspacing="1" class="CTable"> 
         <tr>
             <td class="lefttd" height="30" align="right" style="width: 198px"><b>΢����Ƶ��״̬��</b></td>
                <td class="righttd">
                   <asp:RadioButtonList ID="BBSStatus" runat="server" RepeatDirection="horizontal">
                    <asp:ListItem Value="0">�ر�</asp:ListItem>
                    <asp:ListItem Value="1" Selected>����</asp:ListItem>
                    </asp:RadioButtonList>
                </td>
         </tr>
          <tr>
            <td align="right" class="lefttd" height="30" style="width: 198px">
                <strong>΢����Ƶ�����ƣ�</strong></td>
            <td class="righttd">
                <asp:TextBox CssClass="textbox" ID="TxtBBSName" runat="server"></asp:TextBox>
                <span class="tips">��΢����Ƶ����</span></td>
        </tr>
        <tr>
            <td align="right" class="lefttd" height="30" style="width: 198px">
                <strong>ǰ̨��װĿ¼��</strong></td>
            <td class="righttd">
                <asp:TextBox CssClass="textbox" ID="BBSInstallDir" runat="server"></asp:TextBox>
                <span class="tips">��Club��BBS��</span></td>
        </tr>
        <tr>
            <td align="right" class="lefttd" height="30" style="width: 198px">
                <strong>�󶨶���������</strong></td>
            <td class="righttd">
                <asp:TextBox CssClass="textbox" ID="TxtBBSDomain" runat="server"></asp:TextBox>
              <span class="tips">�磺http://bbs.kesion.com�����治�ܼ�"/"��û�а󶨶������������ա�</span>
                </td>
        </tr>
        
        <tr>
            <td align="right" class="lefttd" height="30" style="width: 198px">
                <strong>����/�ظ�������ã�</strong></td>
            <td class="righttd">
                <asp:CheckBox ID="CkbBBSPubVerifyTF" runat="server" Text=" ��������Ҫ���" />
                <asp:CheckBox ID="CkbBBSReplyVerifyTF" runat="server" Text="�ظ�������Ҫ���" />
            </td>
        </tr>

        <tr>
            <td align="right" class="lefttd" height="30" style="width: 198px">
                <strong>����/�ظ�ɾ�����ã�</strong></td>
            <td class="righttd">
                <asp:CheckBox ID="CkbBBSDelTopic" runat="server" Text="����ɾ���Լ��Ļ���" />
                <asp:CheckBox ID="CkbBBSDelReply" runat="server" Text="����ɾ���Լ��Ļظ�" />
            </td>
        </tr>

        
        <tr>
            <td align="right" class="lefttd" height="30" style="width: 198px">
                <strong>�Ƿ������οͷ����⣺</strong></td>
            <td class="righttd">
                <asp:RadioButtonList ID="BBSVisitorTF" runat="server" RepeatDirection="horizontal">
                <asp:ListItem Value="0">���������飩</asp:ListItem>
                <asp:ListItem Value="1">����</asp:ListItem>
                </asp:RadioButtonList></td>
        </tr>
        <tr>
            <td align="right" class="lefttd" height="30" style="width: 198px">
                <strong>�Ƿ������οͻظ����⣺</strong></td>
            <td class="righttd">
                <asp:RadioButtonList ID="BBSReplyVisitorTF" runat="server" RepeatDirection="horizontal">
                <asp:ListItem Value="0">���������飩</asp:ListItem>
                <asp:ListItem Value="1">����</asp:ListItem>
                </asp:RadioButtonList></td>
        </tr>
       

        <tr>
            <td align="right" class="lefttd" height="30" style="width: 198px">
                <strong>���Իظ��Լ������⣺</strong></td>
            <td class="righttd">
                <asp:RadioButtonList ID="BBSAnswerOwnQuestion" runat="server" RepeatDirection="horizontal">
                <asp:ListItem Value="0">������</asp:ListItem>
                <asp:ListItem Value="1">�������飩</asp:ListItem>
                </asp:RadioButtonList></td>
        </tr>
        <tr>
            <td align="right" class="lefttd" height="30" style="width: 198px">
                <strong>�������������ƣ�</strong></td>
            <td class="righttd">
                 
                 <strong>�����⣺</strong>
                ����<asp:TextBox ID="TxtTopicMinLen" style="text-align:center" CssClass="textbox" runat="server" Text="10" Width="50"></asp:TextBox>����
                ���<asp:TextBox ID="TxtTopicMaxLen" style="text-align:center" CssClass="textbox" runat="server" Text="500" Width="50"></asp:TextBox>����<span class="tips">(���ܳ���4000���ַ�����������500)</span>
                <br />
               <strong>�ظ����⣺</strong>
                ����<asp:TextBox ID="TxtReplyMinLen" style="text-align:center" CssClass="textbox" runat="server" Text="10" Width="50"></asp:TextBox>����
                ���<asp:TextBox ID="TxtReplyMaxLen" style="text-align:center" CssClass="textbox" runat="server" Text="500" Width="50"></asp:TextBox>����<span class="tips">(���ܳ���4000���ַ�����������500)</span>
           </td>
        </tr>
        <tr style="display:none">
            <td align="right" class="lefttd" height="30" style="width: 198px">
                <strong>�������ϴ����ã�</strong></td>
            <td class="righttd">
                <asp:CheckBox ID="CkbUploadPic" runat="server"  Text="�����ϴ�ͼƬ" />
                <asp:CheckBox ID="CkbUploadVideo" runat="server"  Text="�����ϴ���Ƶ" />
                <asp:CheckBox ID="CkbUploadAnnex" runat="server"  Text="�����ϴ�����" /><br />
                �����ϴ���ͼƬ���ͣ�<asp:TextBox ID="TxtAllowUploadPicType" CssClass="textbox" runat="server" Text="gif|jpg" /><span class="tips">�����չ�������ϴ�����Ӣ�Ķ��š�,��������</span><br />
                �����ϴ���ͼƬ��С��<asp:TextBox ID="TxtAllowUploadPicSize" CssClass="textbox" runat="server" Text="1024" />KB <span class="tips">�������ò�����2M��</span><br />
                �����ϴ�����Ƶ���ͣ�<asp:TextBox ID="TxtAllowUpoadVideoType" CssClass="textbox" runat="server" Text="flv|mp4" /><span class="tips">��������Ϊflv��mp4��</span><br />
                �����ϴ�����Ƶ��С��<asp:TextBox ID="TxtAllowUploadVideoSize" runat="server" CssClass="textbox" Text="10" />MB <span class="tips">�������ò�����10MB��</span><br />
                �����ϴ��ĸ������ͣ�<asp:TextBox ID="TxtAllowUploadAnnexType" CssClass="textbox" runat="server" Text="doc|rar" /><span class="tips">��������ͨ�õĸ�ʽ����rar��doc�ȣ������չ�������ϴ�����Ӣ�Ķ��š�,����������</span><br />
                �����ϴ��ĸ�����С��<asp:TextBox ID="TxtAllowUploadAnnexSize" runat="server" CssClass="textbox" Text="5" />MB <span class="tips">�������ò�����5MB��</span>

           </td>
        </tr>

      
         </table>
    </div>
         
         
		 <div class="tab-page" id="tab2">
		  <h2 class="tab">ģ���</h2>
			<script type="text/javascript">
			    tabPane1.addTabPage(document.getElementById("tab2"));
			</script>
             <table width="100%"  border="0" cellpadding="1" cellspacing="1" class="CTable"> 
          
         <tr>
             <td class="lefttd" height="30" align="right" style="width: 198px"><b>΢������ҳģ�壺</b>
             </td>
                <td class="righttd">
                    &nbsp;<asp:TextBox CssClass="textbox" ID="BBSIndexTemplate" runat="server" Width="297px"></asp:TextBox>
                    <input type="button" class="button" onMouseOver="this.className='button_on';" onMouseOut="this.className='button';" value="ѡ��ģ��..." onClick="SelectTemplate('<%=this.BBSIndexTemplate.ClientID%>');"/>
                </td>
         </tr>
          
         <tr>
             <td class="lefttd" height="30" align="right" style="width: 198px"><b>΢��������ģ�壺</b>
             </td>
                <td class="righttd">
                    &nbsp;<asp:TextBox CssClass="textbox" ID="BBSListTemplate" runat="server" Width="297px"></asp:TextBox>
                    <input type="button" class="button" onMouseOver="this.className='button_on';" onMouseOut="this.className='button';" value="ѡ��ģ��..." onClick="SelectTemplate('<%=this.BBSListTemplate.ClientID%>');"/>
                   <!-- <a href="../../<%=this.BBSInstallDir.Text %>/list.aspx" style="color:green" target="_blank">Ԥ��</a>-->
                </td>
         </tr>
        <tr>
             <td class="lefttd" height="30" align="right" style="width: 198px"><b>�Ӱ����б�ģ�壺</b>
           
             </td>
                <td class="righttd">
                    &nbsp;<asp:TextBox CssClass="textbox" ID="TxtBBSSubBoardTemplate" runat="server" Width="297px"></asp:TextBox>
                    <input type="button" class="button" onMouseOver="this.className='button_on';" onMouseOut="this.className='button';" value="ѡ��ģ��..." onClick="SelectTemplate('<%=this.TxtBBSSubBoardTemplate.ClientID%>    ');"/>

                </td>
         </tr>
          
         <tr>
             <td class="lefttd" height="30" align="right" style="width: 198px"><b>������ϸҳģ�壺</b>
             </td>
                <td class="righttd">
                    &nbsp;<asp:TextBox CssClass="textbox" ID="BBSContentTemplate" runat="server" Width="297px"></asp:TextBox>
                    <input type="button" class="button" onMouseOver="this.className='button_on';" onMouseOut="this.className='button';" value="ѡ��ģ��..." onClick="SelectTemplate('<%=this.BBSContentTemplate.ClientID%>');"/>
                </td>
         </tr>
         
         <tr>
             <td class="lefttd" height="30" align="right" style="width: 198px"><b>������ģ�壺</b>
             </td>
                <td class="righttd">
                    &nbsp;<asp:TextBox CssClass="textbox" ID="TxtBBSTemplate" runat="server" Width="297px"></asp:TextBox>
                    <input type="button" class="button" onMouseOver="this.className='button_on';" onMouseOut="this.className='button';" value="ѡ��ģ��..." onClick="SelectTemplate('<%=this.TxtBBSTemplate.ClientID%>');"/>
                </td>
         </tr>

       
          
    </table>
    </div>
         
		 <div class="tab-page" id="tab1">
		  <h2 class="tab">SEOѡ��</h2>
			<script type="text/javascript">
			    tabPane1.addTabPage(document.getElementById("tab1"));
			</script>
             <table width="100%"  border="0" cellpadding="1" cellspacing="1" class="CTable"> 
                              <tr>
                                <td  height="30" align="right" class="lefttd" style="width: 198px">
                                    <b>΢����Ƶ�����⣺</b></td>
                                <td class="righttd"><asp:TextBox ID="TxtBBSSeoTitle" runat="server" CssClass="textbox" Width="450px"></asp:TextBox>
                               <br /><span class="tips">��ҳ����ͨ�������������ע���ص�</span> </td>
                              </tr>

                             <tr>
                                 <td align="right" class="lefttd" height="30" style="width: 198px"><strong>΢����Ƶ��META�ؼ��ʣ�
                                     </strong>
                                 </td>
                                 <td class="righttd"><asp:TextBox ID="TxtBBSSeoKeywords" runat="server" TextMode="MultiLine" Columns="70" Rows="8" Width="450px"></asp:TextBox>
                                <a class="textarea_min" href="javascript:zoomtextarea(-2,'<%=this.TxtBBSSeoKeywords.ClientID %>');"> </a>
                               <a class="textarea_max" href="javascript:zoomtextarea(2,'<%=this.TxtBBSSeoKeywords.ClientID %>');"></a>  
                                   <br />
                                     <span class="tips">
                                     ��������������õ���ҳ�ؼ���,����ؼ�������,�ŷָ�
                                     </span>
                                 </td>
                             </tr>
                             <tr>
                                 <td align="right" class="lefttd" height="30" style="width: 198px">
                                     <div>
                                         <strong>΢����Ƶ��META��ҳ������</strong></div>
                                     </td>
                                 <td class="righttd"><asp:TextBox ID="TxtBBSSeoDescript" runat="server" TextMode="MultiLine" Columns="70" Rows="8" Width="450px"></asp:TextBox>
                                <a class="textarea_min" href="javascript:zoomtextarea(-2,'<%=this.TxtBBSSeoDescript.ClientID %>');"> </a>
                               <a class="textarea_max" href="javascript:zoomtextarea(2,'<%=this.TxtBBSSeoDescript.ClientID %>');"></a>  
                               <br /><span class="tips">��������������õ���ҳ����,�����������,�ŷָ�&nbsp;</span></td>
                             </tr>
              </table>

         </div>
         
    <br /><br style="clear:both" />
        <br />
    <KS:Foot runat="server" CancelButtonVisible="false" ID="Foot1" OnSubmit="Foot1_Submit"/>
    <KS:Tips ID="Tips1" runat="server" ImagePath="../../admin/images/tipsico/" />

</asp:Content>

