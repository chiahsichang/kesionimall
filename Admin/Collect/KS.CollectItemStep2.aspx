<%@ Page Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.Admin_CollectItemStep2" Title="�ɼ���Ŀ����" Codebehind="KS.CollectItemStep2.aspx.cs" %>
<asp:Content ID="Content1" ContentPlaceHolderID="KSContent" Runat="Server">
            <KS:TopNav ID="TopNav2" runat="server" Text="��Ӳɼ��ڶ���" />
            
      <script language="javascript" type="text/javascript">
      CheckForm=function(){
      if(jQuery('#<%=this.ListStartTag.ClientID %>').val()==''){
       alert('�������б�ʼ���!');
       jQuery('#<%=this.ListStartTag.ClientID %>').focus();
       return false;
      }
      if(jQuery('#<%=this.ListEndTag.ClientID %>').val()==''){
      alert('�������б�������!');
      jQuery('#<%=this.ListEndTag.ClientID %>').focus();
      return false;
      }
       if(jQuery('#<%=this.LinkStartTag.ClientID %>').val()==''){
       alert('�������б����ӿ�ʼ���!');
       jQuery('#<%=this.LinkStartTag.ClientID %>').focus();
       return false;
      }
      if(jQuery('#<%=this.LinkEndTag.ClientID %>').val()==''){
      alert('�������б����ӽ������!');
      jQuery('#<%=this.LinkEndTag.ClientID %>').focus();
      return false;
      }
      return true;
      }
      TestPageList=function(){
      if(jQuery('#<%=this.ListStartTag.ClientID %>').val()==''){
       alert('�������б�ʼ���!');
       jQuery('#<%=this.ListStartTag.ClientID %>').focus();
       return false;
      }
      if(jQuery('#<%=this.ListEndTag.ClientID %>').val()==''){
      alert('�������б�������!');
      jQuery('#<%=this.ListEndTag.ClientID %>').focus();
      return false;
      }
	  jQuery.ajax({url:'../../plus/ajaxs.ashx',cache:false,data:'a=testcollectlist&url='+escape('<%=__itemInfo.CollectUrl%>')+'&encoding=<%=__itemInfo.Encoding %>&liststarttag='+escape(jQuery('#<%=this.ListStartTag.ClientID %>').val())+'&listendtag='+escape(jQuery('#<%=this.ListEndTag.ClientID %>').val()),success:function(d){
	   TestListBack(d);
	  }
	  });
	  return false;
      }
      TestListBack=function(obj){
       if(obj==null||obj==''){
       alert('����ʧ�ܣ�û�н�ȡ�����ݣ������ԣ�');
       }
       else{
       alert('��ϲ���б��ȡ����ͨ����');
       jQuery('#<%=this.CodeText.ClientID %>').val(obj);
       }
      }
      TestListLink=function(){
       if (CheckForm()==true){
	    jQuery.ajax({url:'../../plus/ajaxs.ashx',cache:false,data:'a=testcollectlistlink&url='+escape('<%=__itemInfo.CollectUrl%>')+'&encoding=<%=__itemInfo.Encoding %>&liststarttag='+escape(jQuery('#<%=this.ListStartTag.ClientID %>').val())+'&listendtag='+escape(jQuery('#<%=this.ListEndTag.ClientID %>').val())+'&linkstarttag='+escape(jQuery('#<%=this.LinkStartTag.ClientID %>').val())+'&linkendtag='+escape(jQuery('#<%=this.LinkEndTag.ClientID %>').val()),success:function(d){
	   TestLinkBack(d);
	  }
	  });
	   
      }
      return false;
      }
      TestLinkBack=function(obj){
       if (obj==null||obj==''){
       alert('����ʧ�ܣ�û�н�ȡ���б����ӣ������ԣ�');
       }else{
       alert('��ϲ���б����Ӳ���ͨ����');
         jQuery('#<%=this.CodeText.ClientID %>').val(obj);
       }
       
       
      }
      
      
      </script>
        <table width="99%" align="center" border="0" cellpadding="1" cellspacing="1" class="CTable"> 

        <tr>
            <td align="right" class="lefttd" height="30" style="width: 276px">
               <table border="0" width="100%">
               <tr>
                <td class="lefttd" align="left">
                  <table border="0" width="100%">
                  <tr>
                  
                  <td nowrap align="right">
                  <strong>�б����ã�</strong>
                      <br /><br />
                      <asp:Button CssClass="button" ID="TextListButton" runat="server" Text="�����б�" />
                  </td>
                  <td>
                    <font color=green>��ʼ���</font>
                    <asp:TextBox CssClass="textbox" ID="ListStartTag" runat="server" TextMode="multiLine" Height="50px" Width="180px"></asp:TextBox>
                     <font color=green>�������</font>
                    <asp:TextBox CssClass="textbox" ID="ListEndTag" runat="server" TextMode="multiLine" Height="50px" Width="180px"></asp:TextBox>

                  </td>
                  </tr>
                  
                  </table>

                </td>
 
               <tr>
                <td class="lefttd" align="left">
                <table border="0" width="100%">
                  <tr>
                  
                  <td nowrap align="right">
                  <strong>�������ã�</strong>
                      <br /><br />
                      <asp:Button CssClass="button" ID="TestLinkButton" runat="server" Text="��������"/>
                  </td>
                  <td>
                    <font color=green>��ʼ���</font>
                    <asp:TextBox CssClass="textbox" ID="LinkStartTag" runat="server" TextMode="multiLine" Height="50px" Width="180px"></asp:TextBox>
                     <font color=green>�������</font>
                    <asp:TextBox CssClass="textbox" ID="LinkEndTag" runat="server" TextMode="multiLine" Height="50px" Width="180px"></asp:TextBox>

                  </td>
                  </tr>
                  
                  </table>
                </td>
               </tr>
                <tr>
                <td class="lefttd"  align="left">
                  <strong>��ҳ���ã�</strong>
                    <asp:RadioButtonList ID="ListPageType" runat="server" RepeatDirection="Horizontal" Width="141%" OnSelectedIndexChanged="ListPageType_SelectedIndexChanged" AutoPostBack="True">
                    <asp:ListItem Value="0" Selected=True>����ҳ</asp:ListItem>
                    <asp:ListItem Value="1">��������</asp:ListItem>
                    <asp:ListItem Value="2">�ֶ�����</asp:ListItem>
                    </asp:RadioButtonList>
                </td>
               </tr>
               <tr visible="false" runat="server" id="PageSetting">
                <td align="left">
                  <strong>�����������ã�</strong>
                    <br />
                    <font color=blue>ԭ�ַ�����</font>
                    <asp:TextBox CssClass="textbox" ID="ListPageUrl" runat="server" Width="90%"></asp:TextBox>
                    <div>
                    �磺http://����/list.asp?page={$ID}
                    </div>
                    <font color=blue>���ɷ�Χ��</font><br />
                    <asp:TextBox CssClass="textbox" ID="ListPageStartID" runat="server" Text="1" Width="50px"></asp:TextBox>TO<asp:TextBox CssClass="textbox" ID="ListPageEndID" runat="server" Width="50PX">10</asp:TextBox>
                </td>
               </tr>
               <tr visible="false" runat="server" id="PageList">
                <td align="center">
                  <asp:TextBox TextMode="multiLine" Width="260px" Height="80" runat="server" ID="PageListUrl"></asp:TextBox>
                  <br /><font color=blue>˵��:һ���б�ҳ��Ӧһ�С�</font>
                </td>
               </tr>
 
               </table>
                </td>
                  <td class="righttd" valign="top">
                    <strong>�ɼ�Ŀ��URL��</strong><asp:Label ID="laburl" runat=server></asp:Label>
                      <asp:Button ID="Button1" runat="server" Text="��ȡԴ��" CssClass="button" OnClick="Button1_Click" />
                      <strong>�����Ŀ��</strong><asp:Label ID="LabClassName2" runat="server" Text="Label"></asp:Label>
                      (ClassID:<asp:Label ID="LabClassID2" runat="server" Text="Label"></asp:Label>)
                    <asp:TextBox ID="CodeText" runat="server" TextMode="multiLine" Width="530px" Height="400px"></asp:TextBox>

             
                </td>
        </tr>
       </table>
        <br />
        <KS:Foot ID="Foot2" runat="server" OnSubmit="Foot2_Submit" SubmitButtonText="��һ��(0)" />

</asp:Content>
