<%@ Page Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.Admin_CollectItemStep3" Title="�ɼ���Ŀ����" Codebehind="KS.CollectItemStep3.aspx.cs" %>
<asp:Content ID="Content1" ContentPlaceHolderID="KSContent" Runat="Server">
 <script language="javascript" type="text/javascript">
 CutTest=function(starttag,endtag,resulttxt,resultshow){
 	  jQuery.ajax({url:'../../plus/ajaxs.ashx',cache:false,data:'a=testcollectlist&url='+escape(jQuery('#<%=this.DrpLinkList.ClientID%>').val())+'&encoding=<%=__itemInfo.Encoding %>&liststarttag='+escape(jQuery('#'+starttag).val())+'&listendtag='+escape(jQuery('#'+endtag).val()),success:function(obj){
  TestListBack(obj,resulttxt,resultshow);
  }
  });
   return false;
 }
 TestListBack=function(obj,resulttxt,resultshow){
  if (obj!=null && obj!=''){
   alert('��ϲ,����ͨ��!');
   jQuery('#'+resultshow).show();
   jQuery('#'+resulttxt).val(obj);}
   else{
    alert('û�н�ȡ������,����ʧ��!');
   }
 }
 </script>
            <KS:TopNav ID="TopNav3" runat="server" Text="��Ӳɼ�������" />
             <table width="99%" align="center" border="0" cellpadding="2" cellspacing="1" class="CTable">
             <tr class="tdbg">
              <td height="30" align="left">
              &nbsp;<strong>��ȡ�����ӵ�ַ��</strong><asp:DropDownList AutoPostBack="false" ID="DrpLinkList" runat="server">
                  </asp:DropDownList>
    
    <asp:Button ID="BtnGetCode" CssClass="button" runat="server" Text="��ȡ����" OnClick="BtnGetCode_Click" />
                  <asp:Button CssClass="button" ID="BtnTurnUrl" runat="server" Text="����" OnClick="BtnTurnUrl_Click"/>
    
    </td>
              <td align="left" style="width: 250px">
                  <asp:RadioButtonList ID="RbtShowCode" runat="server" RepeatDirection="horizontal" OnSelectedIndexChanged="RbtShowCode_SelectedIndexChanged" AutoPostBack="True">
                  <asp:ListItem Value="0">��ʾ���봰��</asp:ListItem>
                  <asp:ListItem Value="1" Selected="true">�رմ��봰��</asp:ListItem>
                  </asp:RadioButtonList>
              </td>
             </tr>
             <tr class="tdbg" id="ShowCode" visible="false" runat="server">
             <td colspan="2" align="center">
                 <asp:TextBox ID="TxbCode" runat="server" TextMode="multiLine" Width="800px" Height="300px"></asp:TextBox>
             </td>
             </tr>
            </table>
    
            <br />
            
            <table width="99%" align="center" border="0" cellpadding="2" cellspacing="1" class="CTable">
        <asp:Repeater ID="CollectFieldList" runat="server">
            <HeaderTemplate>
            </HeaderTemplate>
            <ItemTemplate>
                <asp:Label ID="LblList" runat="server" Text=""></asp:Label>
                <tr class="tdbg" onmouseout="this.className='tdbg'" onmouseover="this.className='tdbgmouseover'">
                    <td class="lefttd" style="width: 120px;" align="right">
                       <strong><%#Eval("FieldAlias")%>��</strong>
                    </td>
                    <td align="left">
                        <table border="0" width="100%">
                        <tr>
                         <td align="left" width="200">
                       <asp:RadioButtonList ID="rdbRules" OnSelectedIndexChanged="rdbRules_SelectedIndexChanged" AutoPostBack="true" runat="server" RepeatDirection="Horizontal">
                        <asp:ListItem Value="0" Selected="True">��������</asp:ListItem>
                        <asp:ListItem Value="1">���ñ�ǩ</asp:ListItem>
                        <asp:ListItem Value="2">ָ��ֵ</asp:ListItem>
                        </asp:RadioButtonList>
                         </td>
                         <td align="left" runat="server" id="SetValue" visible="false"><asp:TextBox CssClass="textbox" ID="FieldValue" runat="server" Width="150px"></asp:TextBox>
                         </td>
                        </tr>
                        </table>
                        <asp:HiddenField ID="HdnFieldName" runat="server"  Value='<%#Eval("Name") %>' />
                        <asp:HiddenField ID="HdnFieldType" runat="server" />
                       
                    </td>
                </tr>
                <tr runat="server" id="SetTag" visible="false" class="tdbg" onmouseout="this.className='tdbg'" onmouseover="this.className='tdbgmouseover'">
                    <td class="lefttd" style="width: 120px;" align="right">
                      <strong><font color=blue>���ñ�ǩ��</font></strong>        
                      <br />
                    <asp:Button runat="server" CssClass="button" Text="��ȡ����" ID="BtnTestRule" OnClick="BtnTestRule_Click" />

                    </td>
                    <td>
                     <table border="0" width="100%">
                     <tr>
                      <td Width="230">
                       <%#Eval("FieldAlias")%>��ʼ��ǣ�
                        <asp:TextBox ID="StartTag" Width="230px" TextMode="multiLine" runat="server"></asp:TextBox>
                        <br />
                        <%#Eval("FieldAlias")%>������ǣ�
                        <asp:TextBox ID="EndTag" Width="230px" TextMode="multiLine" runat="server"></asp:TextBox>
                       
                        <asp:Panel ID="PageSetting" runat="server" Visible="false" style="padding:10px;background:#ffffee;margin:5px 2px;border:1px #f9c943 solid">
                         <strong>���ķ�ҳ���ã�</strong><asp:RadioButtonList ID="RdbPageType" OnSelectedIndexChanged="RdbPageType_SelectedIndexChanged" AutoPostBack="true" runat="server" RepeatDirection="Horizontal" RepeatLayout="flow">
                                        <asp:ListItem Value="0" Selected="True">��������</asp:ListItem>
                                        <asp:ListItem Value="1">���ñ�ǩ</asp:ListItem>
                                        </asp:RadioButtonList>
                         <asp:Panel ID="PageTag" runat="server" Visible="false">
                          ��ҳ��ʼ��ǣ�<asp:TextBox ID="PageBeginTag" TextMode="multiLine" runat="server" Width="210px"></asp:TextBox><br />
                          ��ҳ������ǣ�<asp:TextBox ID="PageEndTag" TextMode="multiLine" runat="server" Width="210px"></asp:TextBox><br />
                          ���ӿ�ʼ��ǣ�<asp:TextBox ID="PageLinkBeginTag" TextMode="multiLine" runat="server"  Width="210px"></asp:TextBox><br />
                          ���ӽ�����ǣ�<asp:TextBox ID="PageLinkEndTag" TextMode="multiLine" runat="server"  Width="210px"></asp:TextBox><br />
                         </asp:Panel>
                        </asp:Panel>
                        
                        
                      </td>
                     
                      <td width="110" align="center">
                          <strong>����HTML���</strong> 
                          <asp:ListBox ID="LtbRemoveHtmlTag" Height="120px" Width="110px" runat="server" SelectionMode="Multiple">
                          <asp:ListItem Value="Iframe">����Iframe���</asp:ListItem>
                          <asp:ListItem Value="Object">����Object���</asp:ListItem>
                          <asp:ListItem Value="Script">����Script���</asp:ListItem>
                          <asp:ListItem Value="Div">����Div���</asp:ListItem>
                          <asp:ListItem Value="Style">����Style���</asp:ListItem>
                          <asp:ListItem Value="Table">����Table���</asp:ListItem>
                          <asp:ListItem Value="Span">����Span���</asp:ListItem>
                          <asp:ListItem Value="Img">����Img���</asp:ListItem>
                          <asp:ListItem Value="Font">����Font���</asp:ListItem>
                          <asp:ListItem Value="A">����A���</asp:ListItem>
                          <asp:ListItem Value="Html">����HTML���</asp:ListItem>
                          </asp:ListBox>
                          <asp:LinkButton ID="LkbUnSelect" runat="server" ForeColor="Blue">ȡ��ѡ��</asp:LinkButton>
                      </td>
                      <td width="100" align="center">
                       <strong>ѡ���������</strong><br />
                       <asp:ListBox ID="LtbFilterItem" Height="120px" Width="130px" runat="server" SelectionMode="multiple">
                       
                       </asp:ListBox>
                      </td>
                      
                       
                      <td id="ShowResult" runat="server" style="display:none" align="center">
                      
                       <strong><%#Eval("FieldAlias")%>���Խ����</strong><br />
                       <asp:TextBox ID="TxtShowResult" Rows="7" Columns="20" TextMode="MultiLine" runat="server"></asp:TextBox>
                      
                      </td>
                      
                     </tr>
                     </table>
                    </td>
                </tr>
                
       

                
            </ItemTemplate>
            <FooterTemplate>
            </FooterTemplate>
        </asp:Repeater>
    </table>
        <br />
        <KS:Foot ID="Foot3" runat="server" OnSubmit="Foot3_Submit" SubmitButtonText="��һ��(0)" />

</asp:Content>
