<%@ Page Language="C#" ValidateRequest="false"  MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="True" Inherits="Kesion.NET.WebSite.Admin_Advertise" Title="���������" Codebehind="KS.Advertise.aspx.cs" %>
<asp:Content ID="Content1" ContentPlaceHolderID="KSContent" Runat="Server">
    <asp:Panel ID="listPanel" runat="server" Width="100%">
        <div id="manage_top" class="menu_top_fixed">
         <ul>
           <li id='p1'><asp:LinkButton ID="addads" runat="server" OnClick="addads_Click"><b></b>��ӹ����</asp:LinkButton></li>
           <li id='p4'><asp:LinkButton ID="editads" runat="server" OnClick="editads_Click"><b></b>�༭�����</asp:LinkButton></li>
           <li id='p3'><asp:LinkButton ID="delads" runat="server" OnClick="delads_Click"><b></b>ɾ�������</asp:LinkButton></li></ul>
       </div> 
       <div class="menu_top_fixed_height"></div>  

    <KS:KSGV  ID="list" CssClass="CTable" runat="server" EmptyDataText="��û������κεĹ��λ!" GridLines="None" Width="99%" AutoGenerateColumns="False" OnRowDataBound="list_RowDataBound" OnRowCommand="list_RowCommand"  OnRowEditing="list_RowEditing" OnRowDeleting="list_RowDeleting" OnRowCreated="list_RowCreated">
       <Columns>
            <asp:TemplateField HeaderText="ѡ��">
                <ItemStyle HorizontalAlign="Center"  Width="40px"/>
                <ItemTemplate>
                <input type="checkbox"  name="ids" id="ids" value="<%#Eval("adid") %>" />
                </ItemTemplate>
            </asp:TemplateField>

            <asp:TemplateField HeaderText="״̬">
              <itemstyle width="30px" horizontalalign="Center"/>
              <itemtemplate>
                   <a href="?action=status&adid=<%#Eval("adid")%>" <%# Convert.ToString(Eval("status"))=="0"?"class='no' title='��ͣ'":"class='ok' title='����'" %>></a>
              </itemtemplate>
            </asp:TemplateField>

            <asp:BoundField DataField="Title" HeaderText="���������" />

            <asp:TemplateField HeaderText="�������λ">
                    <itemstyle horizontalalign="Center" Width="200px" />
                    <itemtemplate>
                    <%# GetBoardName(Convert.ToString(Eval("boardId"))) %>
              </itemtemplate>
            </asp:TemplateField>


            <asp:BoundField DataField="adtype" HeaderText="�������" >
            <itemstyle horizontalalign="Center" width="80px" />
            </asp:BoundField>
            <asp:BoundField DataField="showtype" HeaderText="��ʾ��ʽ">
                <itemstyle horizontalalign="Center" width="100px" />
            </asp:BoundField>
            <asp:TemplateField HeaderText="��ʼ����/��������">
                    <itemstyle horizontalalign="Center" />
                    <itemtemplate>
                     <%# GetTimeStr(Convert.ToString(Eval("begindate")),Convert.ToString(Eval("expiredate")),Convert.ToInt32(Eval("timelimit"))) %>
                    <asp:Label runat="server" id="Label1"></asp:Label>
              </itemtemplate>
            </asp:TemplateField>
            
            <asp:TemplateField HeaderText="�ۼƵ��">
                    <itemstyle horizontalalign="Center" />
                    <itemtemplate>
                     <a href="#" onclick="parent.openWin('�鿴��������������','Common/KS.AdIplist.aspx?adID=<%#Eval("adid") %>',false);return false;" title="�鿴�������"><%# Eval("clicks") %> ��</a>
              </itemtemplate>
            </asp:TemplateField>

             <asp:TemplateField HeaderText="�༭">
              <itemstyle width="30px" horizontalalign="Center"/>
              <itemtemplate>
                <asp:LinkButton runat="server"  ToolTip="�༭" CssClass="edit" CommandName="Edit" CausesValidation="False" id="LinkButton1"></asp:LinkButton>
              </itemtemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="ɾ��">
              <itemstyle width="30px" horizontalalign="Center"/>
              <itemtemplate>
               <asp:LinkButton runat="server"  ToolTip="ɾ��" CssClass="delete" CommandName="Delete" CausesValidation="False" id="LinkButtonDel"></asp:LinkButton>
              </itemtemplate>
            </asp:TemplateField>

        </Columns>
        <HeaderStyle CssClass="CTitle" />
            <EmptyDataRowStyle CssClass="emptycss" />
        </KS:KSGV>
       <KS:Page ID="Page1" runat="server" />

    </asp:Panel>
    
    <asp:Panel ID="addPanel" runat="server" Width="100%" Visible="false">

   <script type="text/javascript">
      function Get_AD_Area(val)
       {
           jQuery('#<%=this.ShowType.ClientID %>').attr("disabled", true);
         switch (parseInt(val))
         {
           case 1:
           jQuery("#txtarea").show();
           jQuery("#picarea").hide();
           jQuery("#flasharea").hide();
           jQuery("#codearea").hide();
           break;
           case 2:
           jQuery("#txtarea").hide();
           jQuery("#picarea").show();
           jQuery("#flasharea").hide();
           jQuery("#codearea").hide();
           jQuery('#<%=this.ShowType.ClientID %>').attr("disabled", false);
           break;
           case 3:
           jQuery("#txtarea").hide();
           jQuery("#picarea").hide();
           jQuery("#flasharea").show();
           jQuery("#codearea").hide();
           jQuery('#<%=this.ShowType.ClientID %>').attr("disabled", false);

           break;
            case 4:
            case 5:
           jQuery("#txtarea").hide();
           jQuery("#picarea").hide();
           jQuery("#flasharea").hide();
           jQuery("#codearea").show();
           
           break;
         }
          if (parseInt(val)==4){
              $("#iframearea").show();
          }else{
              $("#iframearea").hide();
          }
         
       }
   
   </script>
    <KS:TopNav ID="TopNav1" runat="server" Text="���ӹ��" />
    <table width="99%" align="center" border="0" cellpadding="1" cellspacing="1" class="CTable"> 
        <tr>
            <td align="right" class="lefttd" height="30" style="width: 198px">
                <strong>���״̬��</strong></td>
            <td class="righttd">
                <asp:RadioButtonList ID="Status" runat="server" RepeatDirection="Horizontal">
                    <asp:ListItem Selected="True" Value="1">����</asp:ListItem>
                    <asp:ListItem Value="0">�ر�</asp:ListItem>
                </asp:RadioButtonList></td>
        </tr>
         <tr>
            <td align="right" class="lefttd" height="30" style="width: 198px">
                <strong>����ʱ�����ƣ�</strong></td>
            <td class="righttd">
               <input type="radio" id="TimeLimitTrue" name="TimeLimit" onclick="jQuery('#TimeArea').show();" runat="server" value="1" />����
              <input type="radio" id="TimeLimitFalse" checked name="TimeLimit" onclick="jQuery('#TimeArea').hide();" runat="server" value="0" />������

            </td>
        </tr>          <tr>
            <td class="lefttd" height="30" align="right" style="width: 198px"><b>������ƣ�</b></td>
            <td class="righttd">
                &nbsp;<asp:TextBox  CssClass="textbox" ID="TxtTitle" runat="server" Width="300px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TxtTitle"
                    ErrorMessage="����д�������" Display="Dynamic"></asp:RequiredFieldValidator>
                    <span class="tips">ʶ����ϲ�ͬ������ã����ڹ������ʾ��</span></td>
          </tr>
<tbody id="TimeArea" style="display:none">
            <tr>
                <td align="right" class="lefttd" height="30" style="width: 198px">
                    <strong>��Чʱ�䣺</strong></td>
                <td class="righttd"><script>isHour=1;</script>
                    <asp:TextBox CssClass="textbox Wdate" ID="BeginDate" runat="server" Width="300px" onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'});"></asp:TextBox> 
                    <span class="tips">��ʽ��XXXX-XX-XX</span></td>
            </tr>
            <tr>
                <td align="right" class="lefttd" height="30" style="width: 198px">
                    <strong>����ʱ�䣺</strong></td>
                <td class="righttd">
                    <asp:TextBox CssClass="textbox Wdate" ID="ExpireDate" runat="server" Width="300px" onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'});"></asp:TextBox>
                    <span class="tips">��ʽ��XXXX-XX-XX</span></td>
            </tr>
           </tbody>
	   <tr>
            <td align="right" class="lefttd" style="width: 198px; height: 30px">
                <strong>�������λ��</strong></td>
            <td class="righttd" style="height: 30px">&nbsp;<asp:ListBox ID="BoardID" runat="server" SelectionMode="Multiple" style="width:300px;height:120px;"></asp:ListBox>
                <span class="tips">Tips:һ����������Թ���������λ����Ctrl�����Զ�ѡ��</span>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="BoardID"
                    Display="Dynamic" ErrorMessage="������ӹ��λ"></asp:RequiredFieldValidator></td>
        </tr>
        <tr>
            <td align="right" class="lefttd" height="30" style="width: 198px">
                <strong>������ͣ�</strong></td>
            <td class="righttd">&nbsp;<asp:DropDownList ID="ADType" runat="server">
            <asp:ListItem Value="1">����</asp:ListItem>
                <asp:ListItem Selected="True" Value="2">ͼƬ</asp:ListItem>
                <asp:ListItem Value="3">flash</asp:ListItem>
                <asp:ListItem Value="4">����(iframe���)</asp:ListItem>
                <asp:ListItem Value="5">����(document.write���)</asp:ListItem>
            </asp:DropDownList>
            
            </td>
        </tr>
        <tr>
            <td align="right" class="lefttd" height="30" style="width: 198px">
                <strong>��ʾ��ʽ��</strong></td>
            <td class="righttd"><asp:RadioButtonList ID="ShowType" runat="server" RepeatDirection="Horizontal">
                <asp:ListItem Value="1" Selected="True">��ͨ���</asp:ListItem>
                <asp:ListItem Value="2">����</asp:ListItem>
                <asp:ListItem Value="3">Ʈ��</asp:ListItem>
                <asp:ListItem Value="4">����</asp:ListItem>
            </asp:RadioButtonList></td>
        </tr>
        <tr>
            <td align="right" class="lefttd" style="width: 198px; height: 30px;">
                <strong>�������ã�</strong></td>
            <td class="righttd" style="height: 30px">
                &nbsp;���ӵ�ַ<asp:TextBox  CssClass="textbox" ID="LinkUrl" runat="server" Width="227px"></asp:TextBox><span class="tips">��flash�����Ч,ֻչʾ�����ӵĹ��������</span><br />
                &nbsp;������ʾ<asp:TextBox  CssClass="textbox" ID="LinkTips" runat="server" Width="227px"></asp:TextBox><br />
                &nbsp;����Ŀ��<asp:DropDownList ID="LinkTarget" runat="server">
                    <asp:ListItem Selected="True" Value="1">�´���</asp:ListItem>
                    <asp:ListItem Value="2">ԭ����</asp:ListItem>
                </asp:DropDownList></td>
        </tr>
        <tbody id="txtarea" style="display:none">
        <tr>
            <td align="right" class="lefttd" height="30" style="width: 198px">
                <strong>�������ݣ�</strong></td>
            <td class="righttd">
                &nbsp;<asp:TextBox  CssClass="textbox" ID="TxtContent" runat="server" Width="227px"></asp:TextBox></td>
        </tr>
        </tbody>
        <tbody id="picarea">
        <tr>
            <td align="right" class="lefttd" style="width: 198px; height: 30px;">
                <strong>ͼƬ��ַ��</strong></td>
            <td class="righttd" style="height: 30px">
                &nbsp;<asp:TextBox  CssClass="textbox" ID="PicUrl" runat="server" Width="227px"></asp:TextBox>  &nbsp;<input type="button" class="button" onclick="SelectFiles('<%=this.PicUrl.ClientID %>',4);" value="ѡ��ͼƬ"></td>
        </tr>
        <tr>
            <td align="right" class="lefttd" style="width: 198px; height: 30px">
                <strong>ͼƬ�ߴ磺</strong></td>
            <td class="righttd" style="height: 30px">
                &nbsp;��<asp:TextBox style="text-align:center"  CssClass="textbox" ID="PicWidth" runat="server" Width="34px">0</asp:TextBox>
                px &nbsp;
                &nbsp; ��<asp:TextBox style="text-align:center"  CssClass="textbox" ID="PicHeight" runat="server" Width="31px">0</asp:TextBox>
                px&nbsp; <span class="tips">����ʾ��ʽΪ����ʱ���óߴ�Ϊ�����Ĵ�С��</span></td>
        </tr>
        </tbody>
        <tbody id="flasharea" style="display:none">
        <tr>
            <td align="right" class="lefttd" height="30" style="width: 198px">
                <strong>Flash��ַ��</strong></td>
            <td class="righttd">
                &nbsp;<asp:TextBox  CssClass="textbox" ID="FlashUrl" runat="server" Width="227px"></asp:TextBox>&nbsp;<input type="button" class="button" onclick="SelectFiles('<%=this.FlashUrl.ClientID %>',4);" value="ѡ��Flash"></td>
        </tr>
        <tr>
            <td align="right" class="lefttd" height="30" style="width: 198px">
                <strong>Flash�ߴ磺</strong></td>
            <td class="righttd">
                &nbsp;��<asp:TextBox  CssClass="textbox" ID="FlashWidth" runat="server" Width="34px">0</asp:TextBox>px &nbsp;
                &nbsp; ��<asp:TextBox  CssClass="textbox" ID="FlashHeight" runat="server" Width="31px">0</asp:TextBox>px&nbsp;
                <span class="tips">����ʾ��ʽΪ����ʱ���óߴ�Ϊ�����Ĵ�С��</span></td>
        </tr>
        </tbody>


        <tbody id="codearea" style="display:none">
        <tr>
            <td align="right" class="lefttd" height="30" style="width: 198px">
                <strong>�����룺</strong><br /><font color=#ff0000>֧��HTML����</font></td>
            <td class="righttd">
                <asp:TextBox  CssClass="textbox textarea" ID="ADCode" runat="server" Rows="5" TextMode="MultiLine" Width="460px" Height="100px"></asp:TextBox>
                  <a class="textarea_min" href="javascript:zoomtextarea(-5,'<%=this.ADCode.ClientID %>');"></a>
                  <a class="textarea_max" href="javascript:zoomtextarea(5,'<%=this.ADCode.ClientID %>');"></a>
                </td>
        </tr>
            <tr id="iframearea">
                <td align="right" class="lefttd" height="30" style="width: 198px">
                    <strong>Iframe���ڴ�С��</strong></td>
                <td class="righttd">
                    &nbsp;��<asp:TextBox  CssClass="textbox" ID="iframeWidth" runat="server" Width="34px">100</asp:TextBox>px
                    &nbsp; &nbsp; ��<asp:TextBox  CssClass="textbox" ID="iframeHeight" runat="server" Width="31px">100</asp:TextBox>px</td>
            </tr>
                </tbody>
        

         <tr>
            <td align="right" class="lefttd" style="width: 198px; height: 30px;">
                <strong>��¼���IP��</strong></td>
            <td class="righttd" style="height: 30px">
                &nbsp;
                <asp:RadioButtonList ID="RdbRecordClickIP" runat="server" RepeatLayout="Flow" RepeatDirection="Horizontal">
                <asp:ListItem Value="1" Selected="True">��¼</asp:ListItem>
                <asp:ListItem Value="0">����¼</asp:ListItem>
                </asp:RadioButtonList>
                <span class="tips">TIPS�����ü�¼���IP�������Բ鿴������ĵ�����顣</span>
                </td>
        </tr>
         <tr>
            <td align="right" class="lefttd" style="width: 198px; height: 30px;">
                <strong>�������ͻ��֣�</strong></td>
            <td class="righttd" style="height: 30px">
                &nbsp;
               ��Աÿ��
               <asp:TextBox ID="TxtClickAddScorePerTime" Text="0" runat="server" CssClass="textbox" style="width:40px;text-align:center"/>
               Сʱ������������
               <asp:TextBox ID="TxtClickScore" Text="0" runat="server" CssClass="textbox" style="width:40px;text-align:center"/>
�ֻ��֡�
<span class="tips">TIPS:ʱ������Ϊ��0����ʾ���ܵ�����ٴΣ����ֶ�ֻ����һ�Σ������õ������ͻ��֣� �뽫����������Ϊ��0����</span>
                </td>
        </tr>


     </table>
        <br />
        <KS:Foot ID="Foot1" runat="server" OnSubmit="Foot1_Submit" />
    
    </asp:Panel>
    
</asp:Content>

