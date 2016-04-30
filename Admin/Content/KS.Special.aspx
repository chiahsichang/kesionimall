<%@ Page Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.Admin_Special" Title="ר�����" Codebehind="KS.Special.aspx.cs" %>
<%@ Import Namespace="Kesion.Cache" %>
<asp:Content ID="Content1" ContentPlaceHolderID="KSContent" Runat="Server">
    <asp:Panel ID="listPanel" runat="server" Width="100%">
    <div id="manage_top" class="menu_top_fixed">
       <span style="float:right">
            <asp:DropDownList ID="DrpSpecialClassID" runat="server">
            </asp:DropDownList> 
       </span>
       <ul>
       <li id='p5'><asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click"><b></b>�������</asp:LinkButton></li>
       <li id='p1'><asp:LinkButton ID="addspecial" runat="server" OnClick="addButton_Click"><b></b>���ר��</asp:LinkButton></li>
       <li id='p4'><asp:LinkButton ID="editspecial" runat="server" OnClick="editspecial_Click"><b></b>�༭ר��</asp:LinkButton></li>
       <li id='p3'><asp:LinkButton ID="delspecial" runat="server" OnClick="delspecial_Click"><b></b>ɾ��ר��</asp:LinkButton></li>
       <li id='p14'><asp:LinkButton ID="recommendBtn" runat="server" OnClick="Button1_Click" OnClientClick="return(GetIDS());"><b></b>�����Ƽ�</asp:LinkButton></li>
       <li id='p13'><asp:LinkButton ID="unRecommendBtn" runat="server" OnClick="Button2_Click" OnClientClick="return(GetIDS());"><b></b>ȡ���Ƽ�</asp:LinkButton></li>
       <%if (MyCache.GetCacheConfig(46)=="1"){ %>
       <li id='p5'><a href="javascript:;" onclick="refreshHtml();" ><b></b>��������HTML</a></li>
       <%} %>
       </ul>
       </div>
      <div class="menu_top_fixed_height"></div>
        <KS:KSGV ID="list" cssclass="CTable" runat="server"  AutoGenerateColumns="False" EmptyDataText="û�д����κ�ר��!"
            GridLines="None" OnRowDataBound="list_RowDataBound" PagerType="CustomNumeric"
            Width="99%"  OnRowCommand="list_RowCommand" OnRowCreated="list_RowCreated">
            <Columns>
                <asp:TemplateField HeaderText="&lt;input type='checkbox' name='chkall' id='chkall' onClick='CheckAll(this.form);'/&gt;">
                <ItemStyle HorizontalAlign="Center"  Width="30px"/>
                <ItemTemplate>
                <input type="checkbox"  name="ids" id="ids" value="<%#Eval("specialid") %>" />
                </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="ר������">
                    <itemtemplate>
                     <span class="special"></span>
                     <a href="#" onclick="parent.openWin('�鿴ר���µ�����','Content/KS.ContentSpecial.aspx?SpecialID='+<%#Eval("specialid") %>,false, 980, 560);return false;"><%#Eval("SpecialName") %></a>
                    (<span style="color:#ff6600"><%#Eval("Total") %></span>)
                    </itemtemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="classid" HeaderText="��������" >
                    <itemstyle horizontalalign="Center" width="120px" />
                </asp:BoundField>
                <asp:BoundField DataField="adddate" HtmlEncode="False" DataFormatString="{0:d}" HeaderText="��������" >
                    <itemstyle horizontalalign="Center" width="100px" />
                </asp:BoundField>

            <asp:TemplateField HeaderText="�Ƽ�">
              <itemstyle width="30px" horizontalalign="Center"/>
              <itemtemplate>
                   <a href="?action=recommend&id=<%#Eval("SpecialID")%>" <%# Convert.ToString(Eval("recommend"))=="0"?"class='no' title='��'":"class='ok' title='��'" %>></a>
              </itemtemplate>
            </asp:TemplateField>

            <asp:TemplateField HeaderText="�޸�">
              <itemstyle width="30px" horizontalalign="Center"/>
              <itemtemplate>
                   <asp:LinkButton CssClass="edit" ID="LinkButton1" runat="server" commandargument=<%#Eval("specialid") %> commandname="modify" ToolTip="�޸�"></asp:LinkButton>
              </itemtemplate>
            </asp:TemplateField>

            <asp:TemplateField HeaderText="ɾ��">
               <itemstyle width="30px" horizontalalign="Center"/>
                    <itemtemplate>
                     <asp:LinkButton runat="server" id="delete" commandargument=<%#Eval("specialid") %> commandname="del" ToolTip="ɾ��" CssClass="delete"></asp:LinkButton>
        </itemtemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Ԥ��">
                <itemstyle width="30px" horizontalalign="Center" />
                      <itemtemplate>
                   <a class="preview" title="Ԥ��ר��" href='<%# Kesion.HtmlTags.Function.GetSpecialUrl(Convert.ToInt32(Eval("specialId")),Convert.ToInt32(Eval("SpecialPurView")),Convert.ToInt32(Eval("ReadPoint")),Convert.ToString(Eval("FsoName")),Convert.ToString(Eval("classid"))=="0"?"":MyCache.GetSpecialClass(Convert.ToInt32(Eval("classid")),2)) %>' target="_blank"></a>

</itemtemplate>

                </asp:TemplateField>
            </Columns>
            <HeaderStyle CssClass="CTitle" />
            <PagerStyle CssClass="Page" HorizontalAlign="Right" />
            <EmptyDataRowStyle CssClass="emptycss" />
        </KS:KSGV>


    
          <script>
              function refreshHtml() {
                  var sid = null;
                  for (var i = 0; i < document.getElementsByName("ids").length; i++) {
                      var KS = document.getElementsByName("ids")[i];
                      if (KS.checked == true) {
                          if (sid == null)
                              sid = KS.value;
                          else
                              sid += "," + KS.value;
                      }
                  }
                  if (sid != null) {
                      top.openWin("���ɾ�̬HTML����", "refresh/KS.RefreshSpecial.aspx?action=refreshspecial&specialid=" + sid, false, 600, 250);
                  } else {
                      KesionJS.Alert("��ѡ��Ҫ������ר�⣡");
                  }
              }
        </script>
             <KS:Page ID="Page1" runat="server" />
    <div class="message">
     <strong>����ר�⣺</strong> 
        <asp:DropDownList ID="DrpClassID" runat="server">
        </asp:DropDownList> 
        <asp:TextBox ID="TxtKeyWord" runat="server" CssClass="textbox" />
    <asp:Button ID="BtnSearch" runat="server" Text=" �� �� " CssClass="button" OnClick="BtnSearch_Click" />
   </div>

</asp:Panel>
    <asp:Panel ID="addPanel" runat="server" Width="100%" Visible="false">
            <script type="text/javascript">
            <!--
	        function setFileFileds(num){    
             for(var i=1,str="";i<=20;i++){jQuery("#define" + i).css("display","none");   }
             for(var i=1,str="";i<=num;i++){	jQuery("#define" + i).css("display","")     }
            }
            function CheckForm()
            {
             if (parseInt(jQuery('#<%=this.ClassID.ClientID %>').val())==0)
             {
             // KesionJS.Alert('��ѡ��ר���������࣡',null);
            //  return false;
             }
             if (jQuery('#<%=this.SpecialName.ClientID %>').val()=='')
             {
              KesionJS.Alert('������ר�����ƣ�',null);
              jQuery("#<%=this.SpecialName.ClientID %>").focus();
              return false;
             }
             if (jQuery('#<%=this.SpecialEname.ClientID %>').val()=='')
             {
              KesionJS.Alert('������ר��Ӣ�����ƣ�',null);
              jQuery("#<%=this.SpecialEname.ClientID %>").focus();
              return false;
             }
             if (jQuery('#<%=this.TemplateFile.ClientID %>').val()=='')
             {
              KesionJS.Alert('������ģ�壡',null);
              jQuery("#<%=this.TemplateFile.ClientID %>").focus();
              return false;
             }
             
            }
            
            function ay(obj)
            {
               if (obj.checked==true)
               {
                   var val=obj.value;
                   if (val!='')
	                {
		                if (jQuery('#<%=this.FsoNameRule.ClientID %>').val().search(val)==-1)
		                {
			                if (jQuery('#<%=this.FsoNameRule.ClientID %>').val()=='') jQuery('#<%=this.FsoNameRule.ClientID %>').val(val);
			                else jQuery('#<%=this.FsoNameRule.ClientID %>').val(jQuery('#<%=this.FsoNameRule.ClientID %>').val()+val);			
		                }
	                }
	            }
              else
               {
                 jQuery('#<%=this.FsoNameRule.ClientID %>').val(jQuery('#<%=this.FsoNameRule.ClientID %>').val().replace(obj.value,""));
               }
            }
            function ConvertPinYin(){
              var className=jQuery('#<%=this.SpecialName.ClientID %>').val();
              jQuery.get("../../plus/ajaxs.ashx",{a:"convertclassname",classname:className},function(v){
                 jQuery('#<%=this.SpecialEname.ClientID %>').val(unescape(v));
              });
            }
            
            //-->
        </script>
        <KS:TopNav ID="TopNav1" runat="server" Text="���ר��" />
        
     	<div class="tab-page" id="SpecialPanel">
         <script type="text/javascript">
           var tabPane1 = new WebFXTabPane( document.getElementById( "SpecialPanel" ), 1 )
         </script>
             
		 <div class="tab-page" id="tab0">
		  <h2 class="tab">������Ϣ</h2>
			<script type="text/javascript">
						 tabPane1.addTabPage( document.getElementById( "tab0" ) );
			</script>
    <table width="100%" border="0" cellpadding="1" cellspacing="1" class="CTable">
        <tr>
            <td align="right" class="lefttd">
                <strong>�������ࣺ</strong></td>
            <td class="righttd"><asp:DropDownList ID="ClassID" runat="server">
                <asp:ListItem Value="0">--ȫվר��--</asp:ListItem>
                </asp:DropDownList></td>
        </tr>
                   <tr>
                       <td align="right" class="lefttd">
                           <strong>ר�����ƣ�</strong></td>
                       <td class="righttd"><asp:TextBox CssClass="textbox" ID="SpecialName" runat="server" Width="500px"></asp:TextBox>
                           <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="������ר������" ControlToValidate="SpecialName"></asp:RequiredFieldValidator></td>
                   </tr>
        <tr>
            <td align="right" class="lefttd">
                <strong>ר��Ӣ�����ƣ�</strong></td>
            <td class="righttd"><asp:TextBox CssClass="textbox" ID="SpecialEname" runat="server" Width="500px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="SpecialEname"
                    ErrorMessage="������ר��Ӣ������"></asp:RequiredFieldValidator></td>
        </tr>
        <tr>
            <td align="right" class="lefttd">
                <strong>ר��ͼƬ��</strong></td>
            <td class="righttd"><asp:TextBox ID="SpecialPic" CssClass="textbox" runat="server" Width="500px"></asp:TextBox>
                &nbsp;<input type="button" class="button" onclick="SelectFiles('<%=this.SpecialPic.ClientID %>',0);" value="ѡ��ͼƬ" />
                
                
                </td>
        </tr>
        <tr>
            <td align="right" class="lefttd">
                <strong>���ʱ�䣺</strong></td>
            <td class="righttd"><asp:TextBox ID="AddDate" Width="300px" CssClass="textbox" onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'});" runat="server"></asp:TextBox>
                    <a href="#" onClick="WdatePicker({el:'<%=this.AddDate.ClientID %>',dateFmt:'yyyy-MM-dd HH:mm:ss'});return false;"><img src="../../sysimg/default/date.gif" border="0" align="absmiddle" title="ѡ������"></a>&nbsp;
                ���ڸ�ʽ��YYYY-MM-DD</td>
        </tr>
        <tr>
            <td align="right" class="lefttd">
                <strong>�Ƿ��Ƽ�ר�⣺</strong></td>
            <td class="righttd"><asp:RadioButtonList ID="Recommend" runat="server" RepeatDirection="Horizontal">
                    <asp:ListItem Value="1">��</asp:ListItem>
                    <asp:ListItem Selected="True" Value="0">��</asp:ListItem>
                </asp:RadioButtonList></td>
        </tr>
        <tr>
            <td align="right" class="lefttd">
                <strong>ר��ģ�壺</strong></td>
            <td class="righttd"><asp:TextBox ID="TemplateFile" Text="{$TemplateDir}/ר��ҳ/����ҳ.html" CssClass="textbox" runat="server" Width="500px"></asp:TextBox>
                <input type="button" class="button" onmouseover="this.className='button_on';" onmouseout="this.className='button';" value="ѡ��ģ��..." onClick="SelectTemplate('<%=this.TemplateFile.ClientID %>');"/>
                </td>
        </tr>
                <tr>
            <td align="right" class="lefttd" style="height: 44px">
                <strong>�����ļ�������</strong></td>
            <td class="righttd" style="height: 44px"><asp:TextBox ID="FsoNameRule" CssClass="textbox" Text="{$AutoID}" runat="server" Width="256px"></asp:TextBox><span id="rulearea" runat="server">��չ��:<asp:TextBox ID="FsoNameExt"
                    runat="server" CssClass="textbox" Width="42px"  Text=".html"></asp:TextBox>
                    
                 <select name='SelectExt' onchange="if (this.value!=''){jQuery('#<%=this.FsoNameExt.ClientID %>').val(this.value);}">
                            <option value=''>-����ѡ��-</option>
                            <option value='.html'>.html</option>
                            <option value='.htm'>.htm</option>
                            <option value='.shtml'>.shtml</option>
                            <option value='.shtm'>.shtm</option>
                            <option value='.aspx'>.aspx</option>
                            
                      </select>  
                    <br />
                       
                <input type="checkbox" id="DirData6" name="DirData6" value="{$AutoID}" checked="checked" onclick="jvascript:ay(this);"/>�Զ����
				<input type="checkbox" id="DirData0" name="DirData0" value="{$Year02}" onclick="jvascript:ay(this);" />��2λ
                <input type="checkbox" id="DirData1" name="DirData1" value="{$Year04}" onclick="jvascript:ay(this);" />��4λ
                <input type="checkbox" id="DirData2" name="DirData2" value="{$Month}" onclick="jvascript:ay(this);"/>��
                <input type="checkbox" id="DirData3" name="DirData3" value="{$Day}" onclick="jvascript:ay(this);"/>��
                
                <input type="checkbox" id="DirData4" name="DirData4" value="{$Hour}" onclick="jvascript:ay(this);"/>ʱ
                <input type="checkbox" id="Checkbox1" name="DirData4" value="{$Minute}" onclick="jvascript:ay(this);"/>��
                <input type="checkbox" id="DirData5" name="DirData5" value="{$Second}" onclick="jvascript:ay(this);"/>��
	            <input type="checkbox" id="DirData8" name="DirData8" value="{$RE}" onclick="jvascript:ay(this);" /> ����� 
	        </span>
                    </td>
        </tr>

        <tr>
            <td align="right" class="lefttd">
                <strong>ר����ܣ�</strong></td>
            <td class="righttd">
               <asp:TextBox ID="Content" TextMode="multiLine" style="width:99%;height:300px;" runat="server"></asp:TextBox>
                 <%
                     Kesion.APPCode.EditorAPI.EchoEditor("editor", Content.ClientID, "Common", 0, false, true);    
                  %>  

            </td>
        </tr>
      </table>			
			
	    </div>
	    
		 <div class="tab-page" id="tab1">
		  <h2 class="tab">ר��ѡ��</h2>
			<script type="text/javascript">
						 tabPane1.addTabPage( document.getElementById( "tab1" ) );
			</script>
<table width="100%" border="0" cellpadding="1" cellspacing="1" class="CTable">
            <tr>
                       <td align="right" class="lefttd">
                           <strong>ר��META�ؼ���</strong></td>
                       <td class="righttd"><asp:TextBox ID="MetaKeyWord" runat="server" Rows="7" TextMode="MultiLine" Width="382px"></asp:TextBox>
                                <a class="textarea_min" href="javascript:zoomtextarea(-2,'<%=this.MetaKeyWord.ClientID %>');"> </a>
                               <a class="textarea_max" href="javascript:zoomtextarea(2,'<%=this.MetaKeyWord.ClientID %>');"></a>  
<br />
                           <span class="tips">��������������õĹؼ���,���ñ�ǩ��{KS:Field:MetaKeyWord}</span>

                       </td>
            </tr>
          <tr>
              <td align="right" class="lefttd">
                  <strong>ר��META��ҳ������
                  </strong></td>
              <td class="righttd"><asp:TextBox ID="MetaDescript" runat="server" Rows="7" TextMode="MultiLine" Width="382px"></asp:TextBox>
                  <a class="textarea_min" href="javascript:zoomtextarea(-2,'<%=this.MetaDescript.ClientID %>');"> </a>
                   <a class="textarea_max" href="javascript:zoomtextarea(2,'<%=this.MetaDescript.ClientID %>');"></a>  
<br />
                  <span class="tips">��������������õ���ҳ����,���ñ�ǩ��{KS:Field:MetaDescript}</span>

              </td>
          </tr>
        </table>
        
			
	    </div>
	    
		 <div  class="tab-page" id="tab2">
		  <h2 style="display:none"  class="tab">�շ�ѡ��</h2>
			<script type="text/javascript">
						 tabPane1.addTabPage( document.getElementById( "tab2" ) );
			</script>
			
			<table width="100%" border="0" cellpadding="1" cellspacing="1" class="CTable">
            <tr>
                       <td align="right" class="lefttd">
                           <strong>ר�����Ȩ��</strong><span style="background-color: #f0f9fe">��</span></td>
                       <td class="righttd">
                           <asp:RadioButtonList ID="Purview" runat="server">
                               <asp:ListItem Selected="True" Value="1">���л�Ա���������</asp:ListItem>
                               <asp:ListItem Value="2">ֻ��ָ���Ļ�Ա��������</asp:ListItem>
                           </asp:RadioButtonList>
                            <div ID="GroupPanel" runat="server" Width="100%"></div>
                       </td>
            </tr>
            <tr>
                <td align="right" class="lefttd">
                    <strong>�Ķ�������</strong></td>
                <td class="righttd">
                    &nbsp;<asp:TextBox ID="ReadPoint" CssClass="textbox" runat="server" Style="text-align: center" Text="0"
                        Width="55px"></asp:TextBox><span style="color: #ff0000"> ����Ķ�����Ϊ </span>"<font color="red"><span
                            style="color: #666666; background-color: #f0f9fe">0"</span></font>��������Ȩ�޵Ļ�Ա�Ķ�����Ŀ�µ���Ϣʱ��������Ӧ�������οͽ��޷��Ķ���
                </td>
            </tr>
            <tr>
                <td align="right" class="lefttd">
                    <strong>�ظ��շѣ�</strong></td>
                <td class="righttd">
                    <asp:RadioButtonList ID="ChargeType" runat="server">
                        <asp:ListItem Selected="" Value="1">���ظ��շ�(�����Ϣ��۵������ܲ鿴������ʹ��)</asp:ListItem>
                        <asp:ListItem Value="2">�����ϴ��շ�ʱ��&lt;input class=&quot;textbox&quot; type=&quot;text&quot; style=&quot;text-align:center;&quot; value=&quot;12&quot; name=&quot;PitchTime&quot; id=&quot;PitchTime&quot; size=&quot;5&quot;&gt;  Сʱ�������շ�</asp:ListItem>
                        <asp:ListItem Value="3">��Ա�ظ�����Ϣ&lt;input class=&quot;textbox&quot; type=&quot;text&quot; style=&quot;text-align:center;&quot; value=&quot;10&quot; name=&quot;ReadTimes&quot; id=&quot;ReadTimes&quot; size=&quot;5&quot;&gt;   ҳ�κ������շ�</asp:ListItem>
                        <asp:ListItem Value="4">�������߶�����ʱ�����շ�</asp:ListItem>
                        <asp:ListItem Value="5">����������һ������ʱ�������շ�</asp:ListItem>
                        <asp:ListItem Value="6">ÿ�Ķ�һҳ�ξ��ظ��շ�һ�Σ����鲻Ҫʹ��,��ҳ��Ϣ���۶�ε�����</asp:ListItem>
                    </asp:RadioButtonList></td>
            </tr>
        </table>	
			
	    </div>
	    
		 <div class="tab-page" id="tab3">
		  <h2 class="tab">��������</h2>
			<script type="text/javascript">
						 tabPane1.addTabPage( document.getElementById( "tab3" ) );
			</script>
			
			<table width="100%" border="0" cellpadding="1" cellspacing="1" class="CTable">
         <tr>           
             <td height='30' align='right' width='210' class='lefttd'><strong>������������</strong></td>
           <td height='28' class="righttd">
              &nbsp;<select name="SpecialDefine_Num" id="SpecialDefine_Num" onChange="setFileFileds(this.value)"><option value="1" selected>1</option><option value="2">2</option><option value="3">3</option><option value="4">4</option><option value="5">5</option><option value="6">6</option><option value="7">7</option><option value="8">8</option><option value="9">9</option><option value="10">10</option><option value="11">11</option><option value="12">12</option><option value="13">13</option><option value="14">14</option><option value="15">15</option><option value="16">16</option><option value="17">17</option><option value="18">18</option><option value="19">19</option><option value="20">20</option> </select>             </td>
         </tr>
         
         <%for (int i = 1; i <= 20; i++)
           {
           %>
           <tbody id="define<%=i %>" style="display:none">
         <tr>           
          <td height='30' align='right' width='210' class='lefttd'><strong>��������<%=i %>��</strong><br> <font color=blue>��ר��ģ��ҳ����{$GetSpecialDefineContent<%=i %>} ����</font>
             </td>
             <td class="righttd">&nbsp;<textarea ID='SpecialDefineContent<%=i %>' Name='SpecialDefineContent<%=i %>' style='width:500px;height:100px'><% try
                {
                    Response.Write(param[i - 1].ToString());
                }
               catch{}%></textarea> 
                 <a class="textarea_min" href="javascript:zoomtextarea(-2,'SpecialDefineContent<%=i %>');"> </a>
                               <a class="textarea_max" href="javascript:zoomtextarea(2,'SpecialDefineContent<%=i %>');"></a>  
<br />
             </td>
         </tr>
         </tbody>
         <%} %>
         </table>
			
	    </div>
	    
  </div>

         
        
        <br />
        <KS:Foot ID="Foot1" runat="server" SubmitButtonText="ȷ�����(0)" OnSubmit="Foot1_Submit" />
    </asp:Panel>
</asp:Content>

