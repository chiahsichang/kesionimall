<%@ Page Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.Admin_CollectItemStep3" Title="采集项目管理" Codebehind="KS.CollectItemStep3.aspx.cs" %>
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
   alert('恭喜,测试通过!');
   jQuery('#'+resultshow).show();
   jQuery('#'+resulttxt).val(obj);}
   else{
    alert('没有截取到数据,测试失败!');
   }
 }
 </script>
            <KS:TopNav ID="TopNav3" runat="server" Text="添加采集第三步" />
             <table width="99%" align="center" border="0" cellpadding="2" cellspacing="1" class="CTable">
             <tr class="tdbg">
              <td height="30" align="left">
              &nbsp;<strong>截取的链接地址：</strong><asp:DropDownList AutoPostBack="false" ID="DrpLinkList" runat="server">
                  </asp:DropDownList>
    
    <asp:Button ID="BtnGetCode" CssClass="button" runat="server" Text="获取代码" OnClick="BtnGetCode_Click" />
                  <asp:Button CssClass="button" ID="BtnTurnUrl" runat="server" Text="访问" OnClick="BtnTurnUrl_Click"/>
    
    </td>
              <td align="left" style="width: 250px">
                  <asp:RadioButtonList ID="RbtShowCode" runat="server" RepeatDirection="horizontal" OnSelectedIndexChanged="RbtShowCode_SelectedIndexChanged" AutoPostBack="True">
                  <asp:ListItem Value="0">显示代码窗口</asp:ListItem>
                  <asp:ListItem Value="1" Selected="true">关闭代码窗口</asp:ListItem>
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
                       <strong><%#Eval("FieldAlias")%>：</strong>
                    </td>
                    <td align="left">
                        <table border="0" width="100%">
                        <tr>
                         <td align="left" width="200">
                       <asp:RadioButtonList ID="rdbRules" OnSelectedIndexChanged="rdbRules_SelectedIndexChanged" AutoPostBack="true" runat="server" RepeatDirection="Horizontal">
                        <asp:ListItem Value="0" Selected="True">不作设置</asp:ListItem>
                        <asp:ListItem Value="1">设置标签</asp:ListItem>
                        <asp:ListItem Value="2">指定值</asp:ListItem>
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
                      <strong><font color=blue>设置标签：</font></strong>        
                      <br />
                    <asp:Button runat="server" CssClass="button" Text="截取测试" ID="BtnTestRule" OnClick="BtnTestRule_Click" />

                    </td>
                    <td>
                     <table border="0" width="100%">
                     <tr>
                      <td Width="230">
                       <%#Eval("FieldAlias")%>开始标记：
                        <asp:TextBox ID="StartTag" Width="230px" TextMode="multiLine" runat="server"></asp:TextBox>
                        <br />
                        <%#Eval("FieldAlias")%>结束标记：
                        <asp:TextBox ID="EndTag" Width="230px" TextMode="multiLine" runat="server"></asp:TextBox>
                       
                        <asp:Panel ID="PageSetting" runat="server" Visible="false" style="padding:10px;background:#ffffee;margin:5px 2px;border:1px #f9c943 solid">
                         <strong>正文分页设置：</strong><asp:RadioButtonList ID="RdbPageType" OnSelectedIndexChanged="RdbPageType_SelectedIndexChanged" AutoPostBack="true" runat="server" RepeatDirection="Horizontal" RepeatLayout="flow">
                                        <asp:ListItem Value="0" Selected="True">不作设置</asp:ListItem>
                                        <asp:ListItem Value="1">设置标签</asp:ListItem>
                                        </asp:RadioButtonList>
                         <asp:Panel ID="PageTag" runat="server" Visible="false">
                          分页开始标记：<asp:TextBox ID="PageBeginTag" TextMode="multiLine" runat="server" Width="210px"></asp:TextBox><br />
                          分页结束标记：<asp:TextBox ID="PageEndTag" TextMode="multiLine" runat="server" Width="210px"></asp:TextBox><br />
                          链接开始标记：<asp:TextBox ID="PageLinkBeginTag" TextMode="multiLine" runat="server"  Width="210px"></asp:TextBox><br />
                          链接结束标记：<asp:TextBox ID="PageLinkEndTag" TextMode="multiLine" runat="server"  Width="210px"></asp:TextBox><br />
                         </asp:Panel>
                        </asp:Panel>
                        
                        
                      </td>
                     
                      <td width="110" align="center">
                          <strong>过滤HTML标记</strong> 
                          <asp:ListBox ID="LtbRemoveHtmlTag" Height="120px" Width="110px" runat="server" SelectionMode="Multiple">
                          <asp:ListItem Value="Iframe">过滤Iframe标记</asp:ListItem>
                          <asp:ListItem Value="Object">过滤Object标记</asp:ListItem>
                          <asp:ListItem Value="Script">过滤Script标记</asp:ListItem>
                          <asp:ListItem Value="Div">过滤Div标记</asp:ListItem>
                          <asp:ListItem Value="Style">过滤Style标记</asp:ListItem>
                          <asp:ListItem Value="Table">过滤Table标记</asp:ListItem>
                          <asp:ListItem Value="Span">过滤Span标记</asp:ListItem>
                          <asp:ListItem Value="Img">过滤Img标记</asp:ListItem>
                          <asp:ListItem Value="Font">过滤Font标记</asp:ListItem>
                          <asp:ListItem Value="A">过滤A标记</asp:ListItem>
                          <asp:ListItem Value="Html">过滤HTML标记</asp:ListItem>
                          </asp:ListBox>
                          <asp:LinkButton ID="LkbUnSelect" runat="server" ForeColor="Blue">取消选中</asp:LinkButton>
                      </td>
                      <td width="100" align="center">
                       <strong>选择过滤设置</strong><br />
                       <asp:ListBox ID="LtbFilterItem" Height="120px" Width="130px" runat="server" SelectionMode="multiple">
                       
                       </asp:ListBox>
                      </td>
                      
                       
                      <td id="ShowResult" runat="server" style="display:none" align="center">
                      
                       <strong><%#Eval("FieldAlias")%>测试结果：</strong><br />
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
        <KS:Foot ID="Foot3" runat="server" OnSubmit="Foot3_Submit" SubmitButtonText="下一步(0)" />

</asp:Content>
