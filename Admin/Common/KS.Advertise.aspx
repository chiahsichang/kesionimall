<%@ Page Language="C#" ValidateRequest="false"  MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="True" Inherits="Kesion.NET.WebSite.Admin_Advertise" Title="广告条管理" Codebehind="KS.Advertise.aspx.cs" %>
<asp:Content ID="Content1" ContentPlaceHolderID="KSContent" Runat="Server">
    <asp:Panel ID="listPanel" runat="server" Width="100%">
        <div id="manage_top" class="menu_top_fixed">
         <ul>
           <li id='p1'><asp:LinkButton ID="addads" runat="server" OnClick="addads_Click"><b></b>添加广告条</asp:LinkButton></li>
           <li id='p4'><asp:LinkButton ID="editads" runat="server" OnClick="editads_Click"><b></b>编辑广告条</asp:LinkButton></li>
           <li id='p3'><asp:LinkButton ID="delads" runat="server" OnClick="delads_Click"><b></b>删除广告条</asp:LinkButton></li></ul>
       </div> 
       <div class="menu_top_fixed_height"></div>  

    <KS:KSGV  ID="list" CssClass="CTable" runat="server" EmptyDataText="还没有添加任何的广告位!" GridLines="None" Width="99%" AutoGenerateColumns="False" OnRowDataBound="list_RowDataBound" OnRowCommand="list_RowCommand"  OnRowEditing="list_RowEditing" OnRowDeleting="list_RowDeleting" OnRowCreated="list_RowCreated">
       <Columns>
            <asp:TemplateField HeaderText="选择">
                <ItemStyle HorizontalAlign="Center"  Width="40px"/>
                <ItemTemplate>
                <input type="checkbox"  name="ids" id="ids" value="<%#Eval("adid") %>" />
                </ItemTemplate>
            </asp:TemplateField>

            <asp:TemplateField HeaderText="状态">
              <itemstyle width="30px" horizontalalign="Center"/>
              <itemtemplate>
                   <a href="?action=status&adid=<%#Eval("adid")%>" <%# Convert.ToString(Eval("status"))=="0"?"class='no' title='暂停'":"class='ok' title='正常'" %>></a>
              </itemtemplate>
            </asp:TemplateField>

            <asp:BoundField DataField="Title" HeaderText="广告条名称" />

            <asp:TemplateField HeaderText="归属广告位">
                    <itemstyle horizontalalign="Center" Width="200px" />
                    <itemtemplate>
                    <%# GetBoardName(Convert.ToString(Eval("boardId"))) %>
              </itemtemplate>
            </asp:TemplateField>


            <asp:BoundField DataField="adtype" HeaderText="广告类型" >
            <itemstyle horizontalalign="Center" width="80px" />
            </asp:BoundField>
            <asp:BoundField DataField="showtype" HeaderText="显示方式">
                <itemstyle horizontalalign="Center" width="100px" />
            </asp:BoundField>
            <asp:TemplateField HeaderText="开始日期/过期日期">
                    <itemstyle horizontalalign="Center" />
                    <itemtemplate>
                     <%# GetTimeStr(Convert.ToString(Eval("begindate")),Convert.ToString(Eval("expiredate")),Convert.ToInt32(Eval("timelimit"))) %>
                    <asp:Label runat="server" id="Label1"></asp:Label>
              </itemtemplate>
            </asp:TemplateField>
            
            <asp:TemplateField HeaderText="累计点击">
                    <itemstyle horizontalalign="Center" />
                    <itemtemplate>
                     <a href="#" onclick="parent.openWin('查看广告条被点击详情','Common/KS.AdIplist.aspx?adID=<%#Eval("adid") %>',false);return false;" title="查看点击详情"><%# Eval("clicks") %> 次</a>
              </itemtemplate>
            </asp:TemplateField>

             <asp:TemplateField HeaderText="编辑">
              <itemstyle width="30px" horizontalalign="Center"/>
              <itemtemplate>
                <asp:LinkButton runat="server"  ToolTip="编辑" CssClass="edit" CommandName="Edit" CausesValidation="False" id="LinkButton1"></asp:LinkButton>
              </itemtemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="删除">
              <itemstyle width="30px" horizontalalign="Center"/>
              <itemtemplate>
               <asp:LinkButton runat="server"  ToolTip="删除" CssClass="delete" CommandName="Delete" CausesValidation="False" id="LinkButtonDel"></asp:LinkButton>
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
    <KS:TopNav ID="TopNav1" runat="server" Text="增加广告" />
    <table width="99%" align="center" border="0" cellpadding="1" cellspacing="1" class="CTable"> 
        <tr>
            <td align="right" class="lefttd" height="30" style="width: 198px">
                <strong>广告状态：</strong></td>
            <td class="righttd">
                <asp:RadioButtonList ID="Status" runat="server" RepeatDirection="Horizontal">
                    <asp:ListItem Selected="True" Value="1">正常</asp:ListItem>
                    <asp:ListItem Value="0">关闭</asp:ListItem>
                </asp:RadioButtonList></td>
        </tr>
         <tr>
            <td align="right" class="lefttd" height="30" style="width: 198px">
                <strong>启用时间限制：</strong></td>
            <td class="righttd">
               <input type="radio" id="TimeLimitTrue" name="TimeLimit" onclick="jQuery('#TimeArea').show();" runat="server" value="1" />启用
              <input type="radio" id="TimeLimitFalse" checked name="TimeLimit" onclick="jQuery('#TimeArea').hide();" runat="server" value="0" />不启用

            </td>
        </tr>          <tr>
            <td class="lefttd" height="30" align="right" style="width: 198px"><b>广告名称：</b></td>
            <td class="righttd">
                &nbsp;<asp:TextBox  CssClass="textbox" ID="TxtTitle" runat="server" Width="300px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TxtTitle"
                    ErrorMessage="请填写广告名称" Display="Dynamic"></asp:RequiredFieldValidator>
                    <span class="tips">识别辨认不同广告条用，不在广告中显示。</span></td>
          </tr>
<tbody id="TimeArea" style="display:none">
            <tr>
                <td align="right" class="lefttd" height="30" style="width: 198px">
                    <strong>生效时间：</strong></td>
                <td class="righttd"><script>isHour=1;</script>
                    <asp:TextBox CssClass="textbox Wdate" ID="BeginDate" runat="server" Width="300px" onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'});"></asp:TextBox> 
                    <span class="tips">格式：XXXX-XX-XX</span></td>
            </tr>
            <tr>
                <td align="right" class="lefttd" height="30" style="width: 198px">
                    <strong>过期时间：</strong></td>
                <td class="righttd">
                    <asp:TextBox CssClass="textbox Wdate" ID="ExpireDate" runat="server" Width="300px" onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'});"></asp:TextBox>
                    <span class="tips">格式：XXXX-XX-XX</span></td>
            </tr>
           </tbody>
	   <tr>
            <td align="right" class="lefttd" style="width: 198px; height: 30px">
                <strong>归属广告位：</strong></td>
            <td class="righttd" style="height: 30px">&nbsp;<asp:ListBox ID="BoardID" runat="server" SelectionMode="Multiple" style="width:300px;height:120px;"></asp:ListBox>
                <span class="tips">Tips:一个广告条可以归属多个广告位，按Ctrl键可以多选。</span>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="BoardID"
                    Display="Dynamic" ErrorMessage="请先添加广告位"></asp:RequiredFieldValidator></td>
        </tr>
        <tr>
            <td align="right" class="lefttd" height="30" style="width: 198px">
                <strong>广告类型：</strong></td>
            <td class="righttd">&nbsp;<asp:DropDownList ID="ADType" runat="server">
            <asp:ListItem Value="1">文字</asp:ListItem>
                <asp:ListItem Selected="True" Value="2">图片</asp:ListItem>
                <asp:ListItem Value="3">flash</asp:ListItem>
                <asp:ListItem Value="4">代码(iframe输出)</asp:ListItem>
                <asp:ListItem Value="5">代码(document.write输出)</asp:ListItem>
            </asp:DropDownList>
            
            </td>
        </tr>
        <tr>
            <td align="right" class="lefttd" height="30" style="width: 198px">
                <strong>显示方式：</strong></td>
            <td class="righttd"><asp:RadioButtonList ID="ShowType" runat="server" RepeatDirection="Horizontal">
                <asp:ListItem Value="1" Selected="True">普通广告</asp:ListItem>
                <asp:ListItem Value="2">对联</asp:ListItem>
                <asp:ListItem Value="3">飘浮</asp:ListItem>
                <asp:ListItem Value="4">弹窗</asp:ListItem>
            </asp:RadioButtonList></td>
        </tr>
        <tr>
            <td align="right" class="lefttd" style="width: 198px; height: 30px;">
                <strong>链接设置：</strong></td>
            <td class="righttd" style="height: 30px">
                &nbsp;链接地址<asp:TextBox  CssClass="textbox" ID="LinkUrl" runat="server" Width="227px"></asp:TextBox><span class="tips">对flash广告无效,只展示不链接的广告请留空</span><br />
                &nbsp;链接提示<asp:TextBox  CssClass="textbox" ID="LinkTips" runat="server" Width="227px"></asp:TextBox><br />
                &nbsp;链接目标<asp:DropDownList ID="LinkTarget" runat="server">
                    <asp:ListItem Selected="True" Value="1">新窗口</asp:ListItem>
                    <asp:ListItem Value="2">原窗口</asp:ListItem>
                </asp:DropDownList></td>
        </tr>
        <tbody id="txtarea" style="display:none">
        <tr>
            <td align="right" class="lefttd" height="30" style="width: 198px">
                <strong>文字内容：</strong></td>
            <td class="righttd">
                &nbsp;<asp:TextBox  CssClass="textbox" ID="TxtContent" runat="server" Width="227px"></asp:TextBox></td>
        </tr>
        </tbody>
        <tbody id="picarea">
        <tr>
            <td align="right" class="lefttd" style="width: 198px; height: 30px;">
                <strong>图片地址：</strong></td>
            <td class="righttd" style="height: 30px">
                &nbsp;<asp:TextBox  CssClass="textbox" ID="PicUrl" runat="server" Width="227px"></asp:TextBox>  &nbsp;<input type="button" class="button" onclick="SelectFiles('<%=this.PicUrl.ClientID %>',4);" value="选择图片"></td>
        </tr>
        <tr>
            <td align="right" class="lefttd" style="width: 198px; height: 30px">
                <strong>图片尺寸：</strong></td>
            <td class="righttd" style="height: 30px">
                &nbsp;宽<asp:TextBox style="text-align:center"  CssClass="textbox" ID="PicWidth" runat="server" Width="34px">0</asp:TextBox>
                px &nbsp;
                &nbsp; 高<asp:TextBox style="text-align:center"  CssClass="textbox" ID="PicHeight" runat="server" Width="31px">0</asp:TextBox>
                px&nbsp; <span class="tips">（显示方式为弹窗时，该尺寸为弹窗的大小）</span></td>
        </tr>
        </tbody>
        <tbody id="flasharea" style="display:none">
        <tr>
            <td align="right" class="lefttd" height="30" style="width: 198px">
                <strong>Flash地址：</strong></td>
            <td class="righttd">
                &nbsp;<asp:TextBox  CssClass="textbox" ID="FlashUrl" runat="server" Width="227px"></asp:TextBox>&nbsp;<input type="button" class="button" onclick="SelectFiles('<%=this.FlashUrl.ClientID %>',4);" value="选择Flash"></td>
        </tr>
        <tr>
            <td align="right" class="lefttd" height="30" style="width: 198px">
                <strong>Flash尺寸：</strong></td>
            <td class="righttd">
                &nbsp;宽<asp:TextBox  CssClass="textbox" ID="FlashWidth" runat="server" Width="34px">0</asp:TextBox>px &nbsp;
                &nbsp; 高<asp:TextBox  CssClass="textbox" ID="FlashHeight" runat="server" Width="31px">0</asp:TextBox>px&nbsp;
                <span class="tips">（显示方式为弹窗时，该尺寸为弹窗的大小）</span></td>
        </tr>
        </tbody>


        <tbody id="codearea" style="display:none">
        <tr>
            <td align="right" class="lefttd" height="30" style="width: 198px">
                <strong>广告代码：</strong><br /><font color=#ff0000>支持HTML代码</font></td>
            <td class="righttd">
                <asp:TextBox  CssClass="textbox textarea" ID="ADCode" runat="server" Rows="5" TextMode="MultiLine" Width="460px" Height="100px"></asp:TextBox>
                  <a class="textarea_min" href="javascript:zoomtextarea(-5,'<%=this.ADCode.ClientID %>');"></a>
                  <a class="textarea_max" href="javascript:zoomtextarea(5,'<%=this.ADCode.ClientID %>');"></a>
                </td>
        </tr>
            <tr id="iframearea">
                <td align="right" class="lefttd" height="30" style="width: 198px">
                    <strong>Iframe窗口大小：</strong></td>
                <td class="righttd">
                    &nbsp;宽<asp:TextBox  CssClass="textbox" ID="iframeWidth" runat="server" Width="34px">100</asp:TextBox>px
                    &nbsp; &nbsp; 高<asp:TextBox  CssClass="textbox" ID="iframeHeight" runat="server" Width="31px">100</asp:TextBox>px</td>
            </tr>
                </tbody>
        

         <tr>
            <td align="right" class="lefttd" style="width: 198px; height: 30px;">
                <strong>记录点击IP：</strong></td>
            <td class="righttd" style="height: 30px">
                &nbsp;
                <asp:RadioButtonList ID="RdbRecordClickIP" runat="server" RepeatLayout="Flow" RepeatDirection="Horizontal">
                <asp:ListItem Value="1" Selected="True">记录</asp:ListItem>
                <asp:ListItem Value="0">不记录</asp:ListItem>
                </asp:RadioButtonList>
                <span class="tips">TIPS：启用记录点击IP，将可以查看广告条的点击详情。</span>
                </td>
        </tr>
         <tr>
            <td align="right" class="lefttd" style="width: 198px; height: 30px;">
                <strong>点广告赠送积分：</strong></td>
            <td class="righttd" style="height: 30px">
                &nbsp;
               会员每隔
               <asp:TextBox ID="TxtClickAddScorePerTime" Text="0" runat="server" CssClass="textbox" style="width:40px;text-align:center"/>
               小时，点击广告赠送
               <asp:TextBox ID="TxtClickScore" Text="0" runat="server" CssClass="textbox" style="width:40px;text-align:center"/>
分积分。
<span class="tips">TIPS:时间设置为“0”表示不管点击多少次，积分都只赠送一次，不启用点广告赠送积分， 请将积分数设置为“0”。</span>
                </td>
        </tr>


     </table>
        <br />
        <KS:Foot ID="Foot1" runat="server" OnSubmit="Foot1_Submit" />
    
    </asp:Panel>
    
</asp:Content>

