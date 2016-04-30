<%@ Page Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.Admin_CollectItemStep2" Title="采集项目管理" Codebehind="KS.CollectItemStep2.aspx.cs" %>
<asp:Content ID="Content1" ContentPlaceHolderID="KSContent" Runat="Server">
            <KS:TopNav ID="TopNav2" runat="server" Text="添加采集第二步" />
            
      <script language="javascript" type="text/javascript">
      CheckForm=function(){
      if(jQuery('#<%=this.ListStartTag.ClientID %>').val()==''){
       alert('请输入列表开始标记!');
       jQuery('#<%=this.ListStartTag.ClientID %>').focus();
       return false;
      }
      if(jQuery('#<%=this.ListEndTag.ClientID %>').val()==''){
      alert('请输入列表结束标记!');
      jQuery('#<%=this.ListEndTag.ClientID %>').focus();
      return false;
      }
       if(jQuery('#<%=this.LinkStartTag.ClientID %>').val()==''){
       alert('请输入列表链接开始标记!');
       jQuery('#<%=this.LinkStartTag.ClientID %>').focus();
       return false;
      }
      if(jQuery('#<%=this.LinkEndTag.ClientID %>').val()==''){
      alert('请输入列表链接结束标记!');
      jQuery('#<%=this.LinkEndTag.ClientID %>').focus();
      return false;
      }
      return true;
      }
      TestPageList=function(){
      if(jQuery('#<%=this.ListStartTag.ClientID %>').val()==''){
       alert('请输入列表开始标记!');
       jQuery('#<%=this.ListStartTag.ClientID %>').focus();
       return false;
      }
      if(jQuery('#<%=this.ListEndTag.ClientID %>').val()==''){
      alert('请输入列表结束标记!');
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
       alert('测试失败，没有截取到内容，请重试！');
       }
       else{
       alert('恭喜，列表截取测试通过！');
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
       alert('测试失败，没有截取到列表链接，请重试！');
       }else{
       alert('恭喜，列表链接测试通过！');
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
                  <strong>列表设置：</strong>
                      <br /><br />
                      <asp:Button CssClass="button" ID="TextListButton" runat="server" Text="测试列表" />
                  </td>
                  <td>
                    <font color=green>开始标记</font>
                    <asp:TextBox CssClass="textbox" ID="ListStartTag" runat="server" TextMode="multiLine" Height="50px" Width="180px"></asp:TextBox>
                     <font color=green>结束标记</font>
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
                  <strong>链接设置：</strong>
                      <br /><br />
                      <asp:Button CssClass="button" ID="TestLinkButton" runat="server" Text="测试链接"/>
                  </td>
                  <td>
                    <font color=green>开始标记</font>
                    <asp:TextBox CssClass="textbox" ID="LinkStartTag" runat="server" TextMode="multiLine" Height="50px" Width="180px"></asp:TextBox>
                     <font color=green>结束标记</font>
                    <asp:TextBox CssClass="textbox" ID="LinkEndTag" runat="server" TextMode="multiLine" Height="50px" Width="180px"></asp:TextBox>

                  </td>
                  </tr>
                  
                  </table>
                </td>
               </tr>
                <tr>
                <td class="lefttd"  align="left">
                  <strong>分页设置：</strong>
                    <asp:RadioButtonList ID="ListPageType" runat="server" RepeatDirection="Horizontal" Width="141%" OnSelectedIndexChanged="ListPageType_SelectedIndexChanged" AutoPostBack="True">
                    <asp:ListItem Value="0" Selected=True>不分页</asp:ListItem>
                    <asp:ListItem Value="1">批量生成</asp:ListItem>
                    <asp:ListItem Value="2">手动设置</asp:ListItem>
                    </asp:RadioButtonList>
                </td>
               </tr>
               <tr visible="false" runat="server" id="PageSetting">
                <td align="left">
                  <strong>批量生成设置：</strong>
                    <br />
                    <font color=blue>原字符串：</font>
                    <asp:TextBox CssClass="textbox" ID="ListPageUrl" runat="server" Width="90%"></asp:TextBox>
                    <div>
                    如：http://域名/list.asp?page={$ID}
                    </div>
                    <font color=blue>生成范围：</font><br />
                    <asp:TextBox CssClass="textbox" ID="ListPageStartID" runat="server" Text="1" Width="50px"></asp:TextBox>TO<asp:TextBox CssClass="textbox" ID="ListPageEndID" runat="server" Width="50PX">10</asp:TextBox>
                </td>
               </tr>
               <tr visible="false" runat="server" id="PageList">
                <td align="center">
                  <asp:TextBox TextMode="multiLine" Width="260px" Height="80" runat="server" ID="PageListUrl"></asp:TextBox>
                  <br /><font color=blue>说明:一个列表页对应一行。</font>
                </td>
               </tr>
 
               </table>
                </td>
                  <td class="righttd" valign="top">
                    <strong>采集目标URL：</strong><asp:Label ID="laburl" runat=server></asp:Label>
                      <asp:Button ID="Button1" runat="server" Text="获取源码" CssClass="button" OnClick="Button1_Click" />
                      <strong>入库栏目：</strong><asp:Label ID="LabClassName2" runat="server" Text="Label"></asp:Label>
                      (ClassID:<asp:Label ID="LabClassID2" runat="server" Text="Label"></asp:Label>)
                    <asp:TextBox ID="CodeText" runat="server" TextMode="multiLine" Width="530px" Height="400px"></asp:TextBox>

             
                </td>
        </tr>
       </table>
        <br />
        <KS:Foot ID="Foot2" runat="server" OnSubmit="Foot2_Submit" SubmitButtonText="下一步(0)" />

</asp:Content>
