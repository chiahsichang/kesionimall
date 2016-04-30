<%@ Page Language="C#" MasterPageFile="~/Admin/MasterPage.master" EnableEventValidation="false"  AutoEventWireup="true" Inherits="Kesion.NET.WebSite.Admin.Shop.Admin_ShopGroupBuy" Title="�Ź�����" Codebehind="KS.ShopGroupBuy.aspx.cs" %>
<%@ Import Namespace="Kesion.Publics"%>
<%@ Import Namespace="Kesion.APPCode"%>
<%@ Import Namespace="Kesion.Cache"%>
<asp:Content ID="Content1" ContentPlaceHolderID="KSContent" Runat="Server">
     <asp:Panel ID="TaskList" runat="server" Width="100%">
      <div id="manage_top" class="menu_top_fixed">
        <ul>
           <li id='p1'><asp:LinkButton ID="addTask" runat="server" OnClick="addTask_Click"><b></b>����Ź���Ʒ</asp:LinkButton></li>
           <li id='p5'><a href="KS.ShopGroupBuyClass.aspx"><b></b>�Ź��������</a></li>
           <li id='p4'><asp:LinkButton ID="editTask" runat="server" OnClick="editTask_Click"><b></b>�༭�Ź���Ʒ</asp:LinkButton></li>
           <li id='p3'><asp:LinkButton ID="delTask" runat="server" OnClick="delTask_Click"><b></b>ɾ���Ź���Ʒ</asp:LinkButton></li>
        </ul>
      </div>   
     <div class="menu_top_fixed_height"></div> 
      
<div class="tabs_header">
    <ul class="tabs">
    <li<%=KSCMS.S("flag")==""?" class='active'":string.Empty %>><a href="KS.ShopGroupBuy.aspx"><span>�����Ź�</span></a></li>
    <li<%=KSCMS.S("flag")=="1"?" class='active'":string.Empty %>><a href="KS.ShopGroupBuy.aspx?flag=1"><span>�����е��Ź�</span></a></li>
    <li<%=KSCMS.S("flag")=="2"?" class='active'":string.Empty %>><a href="KS.ShopGroupBuy.aspx?flag=2"><span>�ѽ������Ź�</span></a></li>
    <li<%=KSCMS.S("flag")=="3"?" class='active'":string.Empty %>><a href="KS.ShopGroupBuy.aspx?flag=3"><span>δ��˵��Ź�</span></a></li>
   <%if (MyCache.GetShopCommonConfig(41)=="1"){ %>
    <li<%=KSCMS.S("flag")=="4"?" class='active'":string.Empty %>><a href="KS.ShopGroupBuy.aspx?flag=4"><span>�����̼ҷ������Ź�</span></a></li>
    <%} %>
    <li<%=KSCMS.S("flag")=="5"?" class='active'":string.Empty %>><a href="KS.ShopGroupBuy.aspx?flag=5"><span>�������10�����Ź�</span></a></li>
    </ul>
</div>
      

  <KS:KSGV ID="list" cssclass="CTable" runat="server" AutoGenerateColumns="False" Width="99%" 
             EmptyDataText="û������κ��Ź���Ʒ!" GridLines="None" OnRowDataBound="list_RowDataBound" 
             OnRowCommand="list_RowCommand" OnRowCreated="list_RowCreated" 
             AllowPaging="false"  >
          <Columns>
              <asp:TemplateField HeaderText="ѡ��">
                <itemstyle horizontalalign="Center" width="40px" />
                <itemtemplate>
                    <input type="checkbox"  name="ids" id="ids" value='<%#Eval("id") %>' />
                </itemtemplate>
              </asp:TemplateField>
               
             <asp:TemplateField HeaderText="�Ź���Ʒ����">
             <itemstyle VerticalAlign="Top" />
             <itemtemplate>
             <img width="35" height="35" onerror="this.src='<%=MyCache.GetCacheShopConfig(9) %>';" src='<%# Eval("PhotoUrl") %>' style="border:1px solid #efefef;padding:2px;margin:2px;" align="left" />
             <a href='<%# Kesion.HtmlTags.BasicField.GetGroupBuyUrl(Convert.ToInt16(Eval("id"))) %>' title='<%# Eval("subject") %>' target="_blank"><%# Utils.CutStr(Convert.ToString(Eval("subject")),60) %></a>
             <%# Convert.ToInt16(Eval("recommend"))==1?"<span style='color:green'>��</span>":string.Empty %>
             <br />
             <span class="tips">[��������<%# getSellNum(1, Convert.ToInt16(Eval("id")))%> <%# string.IsNullOrEmpty(Convert.ToString(Eval("unit")))?"��":Eval("unit") %>���Ѹ���<span style='color:green'><%# getSellNum(2,Convert.ToInt16(Eval("id"))) %></span> <%# string.IsNullOrEmpty(Convert.ToString(Eval("unit")))?"��":Eval("unit") %>��δ����<span style='color:Red'><%# getSellNum(3,Convert.ToInt16(Eval("id"))) %></span> <%# string.IsNullOrEmpty(Convert.ToString(Eval("unit")))?"��":Eval("unit") %>] </span>

             [<a href="#" onclick="parent.openWin('�鿴��Ʒ[<%# Utils.CutStr(Convert.ToString(Eval("subject")),60) %>]��������','Shop/KS.ShopGroupBuySell.aspx?proID=<%# Eval("id") %>',false);return false;"><span class="tips">��������</span></a>]
             <span class="tips">[��棺<%# Utils.StrToInt(Eval("Amount")) %> <%# string.IsNullOrEmpty(Convert.ToString(Eval("unit")))?"��":Eval("unit") %>]</span>
             </itemtemplate>
             </asp:TemplateField> 
              <asp:TemplateField HeaderText="¼��">
             <itemstyle horizontalalign="Center" />
             <itemtemplate>
                 <%# Eval("inputer") %>
             </itemtemplate>
             </asp:TemplateField>
             <asp:TemplateField HeaderText="ԭ��">
             <itemstyle horizontalalign="Center" />
             <itemtemplate>
             <span style='color:#999999;text-decoration:line-through;'><%=MyCache.GetCurrencySymbol %><%# Public.ReturnShopPrice(Utils.StrToDecimal(Eval("price_original")))%><%=MyCache.GetCurrencyUnit %></span>
             </itemtemplate>
             </asp:TemplateField>
             <asp:TemplateField HeaderText="�Ź���">
             <itemstyle horizontalalign="Center" />
             <itemtemplate>
             <span style='color:brown;font-size:14px'><%=MyCache.GetCurrencySymbol %><%# Public.ReturnShopPrice(Utils.StrToDecimal(Eval("Price")))%><%=MyCache.GetCurrencyUnit %></span>
             </itemtemplate>
             </asp:TemplateField>
             
             <asp:TemplateField HeaderText="ʱ������">
             <itemstyle horizontalalign="Center"/>
             <itemtemplate>
             <span class="tips">
             <%# Convert.ToString(Eval("BeginDate")) + "<br/>��<br/>" + Convert.ToString(Eval("EndDate"))%></span>
             </itemtemplate>
             </asp:TemplateField>
             
             
             <asp:TemplateField HeaderText="״̬">
             <itemstyle horizontalalign="Center" width="55"/>
             <itemtemplate>
             <%# GetGroupBuyStatus(Convert.ToInt16(Eval("endtf")), Convert.ToInt16(Eval("locked")), Convert.ToDateTime(Eval("begindate")), Convert.ToDateTime(Eval("enddate")))%>
             </itemtemplate>
             </asp:TemplateField>

          <asp:TemplateField HeaderText="�༭">
              <itemstyle width="30px" horizontalalign="Center"/>
              <itemtemplate>
                <asp:LinkButton ID="LinkButton1" ToolTip="�༭" CssClass="edit" runat="server" commandargument=<%# Eval("id") %> commandname="modify"></asp:LinkButton>
              </itemtemplate>
            </asp:TemplateField>

              <asp:TemplateField HeaderText="ɾ��">
              <itemstyle width="30px" horizontalalign="Center"/>
              <itemtemplate>
             <asp:LinkButton runat="server" CssClass="delete" ToolTip="ɾ��" id="delete" commandargument=<%#Eval("id") %> commandname="del"></asp:LinkButton>
              </itemtemplate>
            </asp:TemplateField>

             
            <asp:TemplateField HeaderText="���������">
                <itemstyle horizontalalign="Center" />
             <itemtemplate>
             <asp:LinkButton ID="BtnLock" runat="server" CommandArgument=<%#Eval("id") %>  CommandName="locked"></asp:LinkButton>
             <asp:LinkButton ID="BtnEnd" runat="server" CommandArgument=<%#Eval("id") %>  CommandName="endtf"></asp:LinkButton>
               </itemtemplate>
            </asp:TemplateField>
          </Columns>
            <HeaderStyle CssClass="CTitle" />
            <EmptyDataRowStyle CssClass="emptycss" />
      </KS:KSGV>
      <asp:Panel ID="Panel1" runat="server">
              <div style="height:5px;overflow:hidden;"></div>
            &nbsp;&nbsp;&nbsp;&nbsp;<input type="checkbox" name="chkall" id="chkall" onclick="CheckAll(this.form);"/><label for="chkall">ȫ��ѡ��</label>
           &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="button" value="ɾ��ѡ�е���Ʒ" onmouseover="this.className='button_on';" onmouseout="this.className='button';" class="button" onclick="if (GetIDS('del')){this.form.action='?action=del';this.form.submit()}" id="Button1" />
 <asp:Button ID="BtnRecommend" runat="server" Text="�����Ƽ�" CssClass="button" 
                  onclick="BtnRecommend_Click" />&nbsp;
 <asp:Button ID="BtnUnRecommend" runat="server" Text="����ȡ���Ƽ�" CssClass="button" 
                  onclick="BtnUnRecommend_Click" />
    </asp:Panel> 
    
    <KS:Page ID="Page1" runat="server" />
    
    <div class="message">
    
<strong>�����Ź���Ʒ��</strong><asp:DropDownList ID="DrpTJ" runat="server">
     <asp:ListItem Value="1" Selected="True">��Ʒ����</asp:ListItem>
     <asp:ListItem Value="2">�̼����ƣ���Ա����)</asp:ListItem>
    </asp:DropDownList> <asp:TextBox runat="server" ID="TxtKeyWord" CssClass="textbox" /> 

    <asp:Button ID="BtnSearch" runat="server" CssClass="button" Text="��ʼ����" 
            onclick="BtnSearch_Click"  />
        </div>
        
    </asp:Panel>
    
    <asp:Panel ID="TaskManage" runat="server" Width="100%" Visible="false">
    
        <KS:TopNav ID="TopNav1" runat="server" />
        <table width="99%" align="center" border="0" cellpadding="1" cellspacing="1" class="CTable"> 
          <tr>
            <td class="lefttd" height="30" align="right" style="width: 109px"><strong>�Ź���Ʒ���ƣ�</strong></td>
            <td class="righttd" style="width: 487px">
                &nbsp;<asp:TextBox  CssClass="textbox" Width="300px" ID="TxtTitle" runat="server"></asp:TextBox> 
                &nbsp;��Ʒ��λ��<asp:TextBox ID="TxtUnit" runat="server" style="text-align:center" Width="30px" CssClass="textbox"></asp:TextBox><=
                <asp:DropDownList ID="DrpSelectUnit" runat="server" AutoPostBack="false"></asp:DropDownList><br />
                <span class="tips">����ԭ��3288<%=MyCache.GetCurrencyUnit%>�Ļ�ɴ��1239<%=MyCache.GetCurrencyUnit%>�������Ź���</span>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TxtTitle"
                    ErrorMessage="�������Ź���Ʒ����!"></asp:RequiredFieldValidator>
            </td>
              <td class="righttd" rowspan="8" align="center" style="width:130px">
               <asp:Image ID="ImgPic" runat="server" Width="100" ImageUrl="../../sysimg/nopic.gif" />
                </td>
          </tr>
          
          <tr>
                <td align="right" class="lefttd" height="30" style="width: 109px"><strong>�Ź���Ʒ���ࣺ</strong></td>
                <td class="righttd" style="width: 487px">
                 &nbsp;<asp:DropDownList ID="DrpBigClassID" runat="server">
                 </asp:DropDownList>   
                <select name="ClassID" id="ClassID">
                 <option value="0">--ѡ��С��--</option>
                </select>   
                </td>
            </tr>
            <tr>
                 <td align="right" class="lefttd" style="width: 109px; height: 30px">
                     <strong>�����ͼƬ��</strong></td>
                 <td class="righttd" style="height: 30px; width: 487px;">
                     <table cellspacing="0" cellpadding="0">
                         <tr><td>&nbsp;<asp:TextBox CssClass="textbox" ID="TxtBigPhoto" runat="server" width="250px"></asp:TextBox>&nbsp;<input type="button" class="button" onclick="SelectFiles('<%=this.TxtBigPhoto.ClientID %>',4,'<%=this.ImgPic.ClientID %>');" value="ѡ��ͼƬ"></td>
                            <td style="padding-left:4px;padding-top:12px;"> <%=Kesion.APPCode.UploadAPI.EchoUpload("classpic",this.TxtBigPhoto.ClientID) %></td>
                    </tr></table>

                 </td>
             </tr>
            <tr>
                 <td align="right" class="lefttd" style="width: 109px; height: 30px">
                     <strong>����СͼƬ��</strong></td>
                 <td class="righttd" style="height: 30px; width: 487px;">
                     <table cellspacing="0" cellpadding="0">
                         <tr><td>&nbsp;<asp:TextBox CssClass="textbox" ID="TxtPhotoUrl" runat="server" width="250px"></asp:TextBox>&nbsp;<input type="button" class="button" onclick="SelectFiles('<%=this.TxtPhotoUrl.ClientID %>',4,'<%=this.TxtPhotoUrl.ClientID %>');" value="ѡ��ͼƬ"></td>
                            <td style="padding-left:4px;padding-top:12px;"> <%=Kesion.APPCode.UploadAPI.EchoUpload("classpic",this.TxtPhotoUrl.ClientID) %></td>
                    </tr></table>
                 </td>
             </tr>
            <tr>
                <td align="right" class="lefttd" height="30" style="width: 109px">
                 <strong>�Ź�ʱ�����ƣ�</strong>
                </td>
                <td class="righttd" style="width: 487px">
                 <script>                     isHour = 1;</script>
                 &nbsp;<asp:TextBox  CssClass="textbox" ID="TxtBeginTime" onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'});" runat="server"></asp:TextBox> �� <asp:TextBox CssClass="textbox" onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'});" ID="TxtEndTime" runat="server"></asp:TextBox>
                </td>
            </tr>
             <tr>
                 <td align="right" class="lefttd" style="width: 109px; height: 30px">
                   <strong>�������ã�</strong></td>
                 <td class="righttd" style="height: 30px">
                  <asp:DropDownList ID="DrpProvinceID" runat="server">
                  
                  </asp:DropDownList>
                  <select name="CityID" id="CityID">
                   <option value="0">--ѡ�����--</option>
                  </select>
                  �ٶȵ�ͼ���꣺<asp:TextBox ID="TxtMapMarker" runat="server" CssClass="textbox" Width="150px" />
                     &nbsp;</td>
             </tr>
            <tr>
                <td align="right" class="lefttd" height="30" style="width: 109px">
                 <strong>���ѷ�ʽ��</strong>
                </td>
                <td class="righttd">
                    <asp:RadioButtonList ID="RdbShowDelivery" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow">
                        <asp:ListItem Value="1">��Ҫ�ͻ�</asp:ListItem>
                        <asp:ListItem Value="0" Selected="True">ƾ��֤������</asp:ListItem>
                    </asp:RadioButtonList>
                </td>
            </tr>

           <tr>
                             <td align="right" class="lefttd" style="width: 109px; height: 30px">
                                 <strong>�������ã�</strong></td>
                             <td class="righttd" style="height: 30px">
                                 <asp:CheckBox ID="CkbRecommend" runat="server" Text="�Ƽ�" />
                                 <asp:CheckBox ID="CkbLocked" runat="server" Text="δ���" />
                                 <asp:CheckBox ID="CkbEndTF" runat="server" Text="�ѽ���" />
                                 <asp:CheckBox ID="CkbCleanCart" runat="server" Checked="" Text="��չ��ﳵ" Visible="false" />
                                 <asp:CheckBox ID="CkbShowPayMent" runat="server" Checked="" Text="��ʾ֧����ʽ" />
                             </td>
            </tr>
                         <tr>
                 <td align="right" class="lefttd" style="width: 109px; height: 30px">
                     <strong>�۸����ã�</strong></td>
                 <td class="righttd" style="height: 30px" colspan="2">
                 ԭ�ۣ�<asp:TextBox onKeyPress= "return regInput(this,/^\d*\.?\d{0,2}$/,String.fromCharCode(event.keyCode))" onpaste="return regInput(this,/^\d*\.?\d{0,2}$/,window.clipboardData.getData('Text'))" ondrop="return regInput(this,    /^\d*\.?\d{0,2}$/,event.dataTransfer.getData('Text'))" CssClass="textbox" ID="TxtPrice_Original" runat="server" width="50px" style="text-align:center"></asp:TextBox><%=MyCache.GetCurrencyUnit%>
                 �ۿۣ�<asp:TextBox onKeyPress= "return regInput(this,/^\d*\.?\d{0,2}$/,String.fromCharCode(event.keyCode))" onpaste="return regInput(this,/^\d*\.?\d{0,2}$/,window.clipboardData.getData('Text'))" ondrop="return regInput(this,    /^\d*\.?\d{0,2}$/,event.dataTransfer.getData('Text'))" onChange="getprice(this.value);"  CssClass="textbox" ID="TxtDiscount" runat="server" width="50px" style="text-align:center"></asp:TextBox>��
                 �Ź��ۣ�<asp:TextBox onKeyPress= "return regInput(this,/^\d*\.?\d{0,2}$/,String.fromCharCode(event.keyCode))" onpaste="return regInput(this,/^\d*\.?\d{0,2}$/,window.clipboardData.getData('Text'))" ondrop="return regInput(this,    /^\d*\.?\d{0,2}$/,event.dataTransfer.getData('Text'))" CssClass="textbox" ID="TxtPrice" runat="server" width="50px" style="text-align:center"></asp:TextBox><%=MyCache.GetCurrencyUnit%>
                 ������<asp:TextBox CssClass="textbox" onKeyPress= "return regInput(this,/^\d*\.?\d{0,2}$/,String.fromCharCode(event.keyCode))" onpaste="return regInput(this,/^\d*\.?\d{0,2}$/,window.clipboardData.getData('Text'))" ondrop="return regInput(this,    /^\d*\.?\d{0,2}$/,event.dataTransfer.getData('Text'))" ID="TxtWeight" runat="server" width="50px" Text="0" style="text-align:center"></asp:TextBox>KG
                 <span class="tips">�����˷��õ�,����������0��</span>
                 
                  </td>
             </tr>
             <tr>
                 <td align="right" class="lefttd" style="width: 109px; height: 30px">
                     <strong>�������ã�</strong></td>
                 <td class="righttd" style="height: 30px" colspan="2">
                 ���������<asp:TextBox Text="0" CssClass="textbox" ID="TxtMinNum" runat="server" width="50px" style="text-align:center"></asp:TextBox>��
                 ÿ�����ƹ���<asp:TextBox Text="1" CssClass="textbox" ID="TxtLimitBuyNum" runat="server" width="50px" style="text-align:center"></asp:TextBox>��
                 <span class="tips">������������0��</span>
                 ��ʼ�����ۣ�<asp:TextBox CssClass="textbox" Text="0" ID="TxtHasSellNum" runat="server" width="50px" style="text-align:center"></asp:TextBox>��
                 <span class="tips">�����õġ�</span>
                 ��棺<asp:TextBox CssClass="textbox" Text="1000" ID="TxtAmount" runat="server" Width="50px" style="text-align:center"></asp:TextBox>��
                 ��汨����<asp:TextBox CssClass="textbox" Text="0" ID="TxtAmountNum" runat="server" Width="50px" style="text-align:center"></asp:TextBox>�� <span class="tips">Ϊ��0����������</span>
                  </td>
             </tr>
             <tr>
              <td class="lefttd" align="right"><strong>�տ��˺ţ�</strong></td>
              <td class="righttd">
                  <asp:DropDownList ID="DrpPayID" runat="server">
                  </asp:DropDownList>
         </td>
      </tr>
            <tr>
                <td align="right" class="lefttd" height="30" style="width: 109px">
                 <strong>�������飺</strong>
                </td>
                <td class="righttd" colspan="2">
                    <asp:TextBox  ID="TxtIntro" TextMode="multiLine" style="width:90%;height:200px" runat="server"></asp:TextBox>
                    <% Kesion.APPCode.EditorAPI.EchoEditor("editor", this.TxtIntro.ClientID, "Basic");%>
                </td>
            </tr>
            <tr>
                <td align="right" class="lefttd" height="30" style="width: 109px">
                 <strong>�������㣺</strong>
                </td>
                <td class="righttd" colspan="2">
                    <asp:TextBox  ID="TxtHighlights" TextMode="multiLine" style="width:90%;height:120px" runat="server"></asp:TextBox>
                    <% Kesion.APPCode.EditorAPI.EchoEditor("editor1", this.TxtHighlights.ClientID, "Basic",0,false,true,false,false);%>
                   
                 <div class="tips">Tips����Ҫ������Ʒ������,�������ա�</div>
                </td>
            </tr>
            <tr>
                <td align="right" class="lefttd" height="30" style="width: 109px">
                 <strong>�Ź����ϣ�</strong>
                </td>
                <td class="righttd" colspan="2">
                    <asp:TextBox ID="TxtProtection" TextMode="multiLine" style="width:90%;height:120px" runat="server"></asp:TextBox>
              <% Kesion.APPCode.EditorAPI.EchoEditor("editor2", this.TxtProtection.ClientID, "Basic",0,false,true,false,false);%>

                </td>
            </tr>
            <tr>
                <td align="right" class="lefttd" height="30" style="width: 109px">
                 <strong>��ܰ��ʾ��</strong>
                </td>
                <td class="righttd" colspan="2">
                    <asp:TextBox  ID="TxtNotes" TextMode="multiLine" style="width:90%;height:120px" runat="server"></asp:TextBox>
              <% Kesion.APPCode.EditorAPI.EchoEditor("editor3", this.TxtNotes.ClientID, "Basic",0,false,true,false,false);%>

                </td>
            </tr>
             

             


             <tr>
                 <td align="right" class="lefttd" style="height: 30px; width: 109px;">
                     <strong>����μ��Ź���Ȩ�ޣ�</strong></td>
                 <td class="righttd" style="height: 30px" colspan="2">
                 
                  <asp:RadioButtonList ID="RdbAllowBMFlag" runat="server">
                   <asp:ListItem Value="0" Selected>���������˱����μ�,�����ο�</asp:ListItem>
                   <asp:ListItem Value="1">ֻ�����Ա�����μ�</asp:ListItem>
                   <asp:ListItem Value="2">ֻ����ָ���Ļ�Ա�鱨���μ� </asp:ListItem>
                  </asp:RadioButtonList>
                 </td>
             </tr>
             <tbody id="groups">
             <tr>
                 <td align="right" class="lefttd" style="height: 30px; width: 109px;">
                     <strong>����μ��Ź��Ļ�Ա�飺</strong></td>
                 <td class="righttd" style="height: 30px" colspan="2">
                  <div ID="GroupPanel" runat="server"></div>
                 </td>
             </tr>
             
             </tbody>
             
             
             <tr>
                 <td align="right" class="lefttd" style=" height: 30px; width: 109px;">
                   <strong>�������ӣ�</strong></td>
                 <td class="righttd" style="height: 30px" colspan="2">
                 &nbsp;<asp:TextBox ID="TxtChangesUrl" runat="server" CssClass="textbox" Width="380" />
                 <br />
                 <span class="tips">����������빺�����ӣ����û�����ʱ����ת�������ط��������Ա����ǵ��̳�����ȥ���򣩡�</span>
                 </td>
             </tr>

          
            <tr>
                <td align="right" class="lefttd" style=" height: 30px; width: 109px;">
                    <strong>��ģ�壺</strong></td>
                <td class="righttd" colspan="2" style="height: 30px">
                    &nbsp;<asp:TextBox ID="TxtTemplateFile" runat="server" CssClass="textbox" 
                        Text="{$TemplateDir}/�̳�ϵͳ/�Ź�����ҳ.html" width="250px"></asp:TextBox>
                    &nbsp;<input class="button" 
                        onclick="SelectTemplate('<%=this.TxtTemplateFile.ClientID %>');" type="button" 
                        value="ѡ��ģ��"> <span class="tips">��������ֱ�Ӷ��̳��������ͨ��ģ�塣</span> </input></td>
            </tr>
            <tr>
                <td align="right" class="lefttd" style=" height: 30px; width: 109px;">
                    <strong>¼��Ա��</strong></td>
                <td class="righttd" colspan="2" style="height: 30px">
                    &nbsp;<asp:TextBox ID="TxtInputer" runat="server" CssClass="textbox" 
                        Text="" width="250px"></asp:TextBox>
                   <span class="tips">�󶨷������û�����</span> </input></td>
            </tr>

          
        </table>
        <script>
             var classId=<%=smallClassID %>;
             var cityId=<%=cityId %>;
             function getClass() {
                                var parentId = jQuery("#<%=this.DrpBigClassID.ClientID %> option:selected").val();
                                jQuery('#ajaxmsg', window.parent.document).toggle();
                                jQuery.ajax({
                                    type: "POST",
                                    url: "../../plus/Ajaxs.ashx",
                                    data: "classid="+classId+"&parentid=" + parentId + "&a=groupbuyclassoption",
                                    success: function(data) {
                                        jQuery('#ajaxmsg', window.parent.document).toggle();
                                        jQuery("#ClassID").empty().append('<option value="0">--ѡ��С��--</option>').append(data);
                                    }
                                });
             }
             function getCity(){
                                var provinceId = jQuery("#<%=this.DrpProvinceID.ClientID %> option:selected").val();
                                jQuery('#ajaxmsg', window.parent.document).toggle();
                                jQuery.ajax({
                                    type: "POST",
                                    url: "../../plus/Ajaxs.ashx",
                                    data: "cityId="+cityId+"&provinceId=" + provinceId + "&a=groupbuycityoption",
                                    success: function(data) {
                                        jQuery('#ajaxmsg', window.parent.document).toggle();
                                        jQuery("#CityID").empty().append('<option value="0">--ѡ�����--</option>').append(data);
                                    }
                                });
              }

            jQuery(document).ready(function() {
                ShowGroup();
                getClass();
                getCity();
            });
            function regInput(obj, reg, inputStr) {
                var docSel = document.selection.createRange()
                if (docSel.parentElement().tagName != "INPUT") return false
                oSel = docSel.duplicate()
                oSel.text = ""
                var srcRange = obj.createTextRange()
                oSel.setEndPoint("StartToStart", srcRange)
                var str = oSel.text + inputStr + srcRange.text.substr(oSel.text.length)
                return reg.test(str)
            }
            function getprice(discount) {
                if (parseFloat(discount) > 10) {
                    alert('�ۿ۲��ܴ���10��');
                    jQuery("#<%=this.TxtDiscount.ClientID %>").val(10);
                    return false;
                }
                var Price_Original = jQuery("#<%=this.TxtPrice_Original.ClientID %>").val();
                if (Price_Original == '' || isNaN(Price_Original)) { Price_Original = 0; }
                jQuery("#<%=this.TxtPrice.ClientID %>").val(Math.round(Price_Original * (discount / 10)));
   
            }
            function ShowGroup() {
                var checkrad = jQuery("#<%=this.RdbAllowBMFlag.ClientID %> :radio[checked]").val();
                if (checkrad == 2) {
                    jQuery("#groups").show();
                } else {
                jQuery("#groups").hide();
                }
            }
            function getUnit(v) {
                jQuery("#<%=this.TxtUnit.ClientID %>").val(v);
            }
            function CheckForm() {
                if (jQuery("#<%=this.TxtTitle.ClientID %>").val() == '') {
                    KesionJS.Alert("�������Ź���Ʒ���ƣ�", 'jQuery("#<%=this.TxtTitle.ClientID %>").focus()');
                    return false;
                }
                if (jQuery("#ClassID option:selected").val() == '0') {
                    KesionJS.Alert("��ѡ���Ź����࣡", 'jQuery("#ClassID").focus()');
                    return false;
                }
                if (jQuery("#<%=this.TxtBigPhoto.ClientID %>").val() == '') {
                    KesionJS.Alert("���ϴ��Ź������ͼ��", 'jQuery("#<%=this.TxtBigPhoto.ClientID %>").focus()');
                    return false;
                }
                if (jQuery("#<%=this.TxtPhotoUrl.ClientID %>").val() == '') {
                    KesionJS.Alert("���ϴ��Ź�����Сͼ��", 'jQuery("#<%=this.TxtPhotoUrl.ClientID %>").focus()');
                    return false;
                }
                if (jQuery("#<%=this.TxtPrice_Original.ClientID %>").val() == '') {
                    KesionJS.Alert("��������Ʒԭ�ۣ�", 'jQuery("#<%=this.TxtPrice_Original.ClientID %>").focus()');
                    return false;
                }
                if (jQuery("#<%=this.TxtDiscount.ClientID %>").val() == '') {
                    KesionJS.Alert("��������Ʒ�ۿۣ�", 'jQuery("#<%=this.TxtDiscount.ClientID %>").focus()');
                    return false;
                }
                if (parseFloat(jQuery("#<%=this.TxtDiscount.ClientID %>").val()) > 10) {
                    KesionJS.Alert("�ۿ۲��ܴ���10��", 'jQuery("#<%=this.TxtDiscount.ClientID %>").focus()');
                    return false;
                }
                if (jQuery("#<%=this.TxtPrice.ClientID %>").val() == '') {
                    KesionJS.Alert("�������Ź��ۣ�", 'jQuery("#<%=this.TxtPrice.ClientID %>").focus()');
                    return false;
                }
                return true;
            }
        </script>
      <br />
      <KS:Foot ID="Foot1" runat="server" OnSubmit="Foot1_Submit" />
    </asp:Panel>
    
</asp:Content>

