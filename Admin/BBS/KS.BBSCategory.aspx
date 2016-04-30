<%@ Page Language="C#" ValidateRequest="false" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.Admin_BBSClass" Title="��̳�������" Codebehind="KS.BBSCategory.aspx.cs" %>
<%@ Import Namespace="Kesion.Cache" %>
<%@ Import Namespace="Kesion.Publics" %>
<asp:Content ID="Content1" ContentPlaceHolderID="KSContent" Runat="Server">
         
     <asp:Panel ID="ClassList" runat="server" Width="100%">
     <div id="manage_top" class="menu_top_fixed">
       <ul>
         <li id='p1'><asp:LinkButton ID="addbutton" runat="server" OnClick="lbtaddmodel_Click"><b></b>�����̳����</asp:LinkButton></li>
         <li id='p3'><asp:LinkButton ID="delbutton" runat="server" OnClientClick="if (GetIDS('del')){return true}else{return false}" onclick="BtnDelete_Click"><b></b>ɾ������</asp:LinkButton></li>
         <li id='p5'><asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click"><b></b>һ����������</asp:LinkButton></li>
         <li id='p7'><asp:LinkButton ID="LinkButton2" runat="server" OnClick="LinkButton2_Click"><b></b>N����������</asp:LinkButton></li>
      <li id='p6'><asp:LinkButton ID="LinkButton3" runat="server"  onclick="LinkButton3_Click"><b></b>һ���ؼư���������</asp:LinkButton></li> </ul>
     </div>
     <div class="menu_top_fixed_height"></div>   
 <script type="text/javascript">
function ExtSub(ID,event) {//��ֹð�ݵ���parent
    var e = (event) ? event : window.event;
    if (window.event) {//IE
        e.cancelBubble = true;
    } else { //FF
        e.stopPropagation();
    }
    if (jQuery('#C'+ID).attr('class')=="tree_Close")
    {       
        jQuery('#C'+ID).attr('class','tree_Open');
        if ($(".CTable").find("tr[attr*=',"+ID+",']").length>0){
            $(".CTable").find("tr[attr*=',"+ID+",']").show();
        }else{
            jQuery('#ajaxmsg',window.parent.document).toggle();
            jQuery.ajax({
                type: "POST",
                url: "KS.BBSCategory.aspx",
                data: "parentid="+ID+"&action=ExtSub",
                success: function (data) {
                    jQuery('#ajaxmsg',window.parent.document).toggle();
                    jQuery("#sub"+ID).after(data);
                    //jQuery("#sub"+ID).html(data);
                }
            });
        }
    }
    else{
        $(".CTable").find("tr[attr*=',"+ID+",']").hide();
        jQuery('#C'+ID).attr('class','tree_Close');
    }
}
</script>
 

      <asp:Repeater ID="list" runat="server">
          <HeaderTemplate>
           <table width="99%" align="center" cellpadding="0" cellspacing="0" class="CTable">
           <tr class="CTitle">
				<th scope="col"><input type="checkbox" name="chkall" onclick="CheckBox(this.checked);" for="chkall"/></th>
				<th scope="col">����ID</th>
                <th scope="col" style="text-align:left">��������(<a class="tips" style="font-weight:normal" href="KS.BBSCategory.aspx?action=showall">չ��</a>)</th>
				<th>������</th>
				<th scope="col">���</th>
                <th scope="col">�������</th>
			</tr>
          </HeaderTemplate>
          <ItemTemplate>
            <tr id='sub<%#Eval("BoardID") %>'  onmouseover="jQuery('#a<%# Eval("BoardID") %>').show();this.className='CtrMouseOver'" onmouseout="jQuery('#a<%# Eval("BoardID") %>').hide();this.className='CtrMouseOut'" onclick="chk(this)">
             <td class="Ctd" style="text-align:center;width:30px;"><input type="checkbox" name="ids" value='<%#Eval("BoardID")%>' /></td>
             <td class="Ctd" style="text-align:center;width:50px;"><%# Eval("BoardID") %></td>
             <td class="Ctd" style="height:30px;width:450px;">
                <%if (KSCMS.S("Action") != "showall")
               { %>
             <a href="javascript:void(0)" onclick='ExtSub("<%# Eval("BoardID") %>",event);' style='text-decoration:none'><%# getClassName(Convert.ToInt32(Eval("BoardID")),Eval("BoardName", "{0}"), Convert.ToInt16(Eval("child")), Convert.ToInt16(Eval("NextID")), Convert.ToInt16(Eval("depth", "{0}")), 1)%></a><%}
               else
               { %><%# getClassName(Convert.ToInt32(Eval("BoardID")),Eval("BoardName", "{0}"), Convert.ToInt16(Eval("child")), Convert.ToInt16(Eval("NextID")), Convert.ToInt16(Eval("depth", "{0}")), 1)%><%} %>
                   <span id="a<%# Eval("BoardID") %>" style="display:none;padding-left:20px">
                <a style="color:#999" href="KS.BBSCategory.Aspx?action=add&parentid=<%# Eval("BoardID") %>">����Ӱ���</a>
               </span>
               </td>
             <td class="Ctd" align="center" >
              ���⣺<%# Eval("TopicNum") %>���ӣ�<%#Eval("postNum") %></td>
             <td class="Ctd" align="center" style="width:50px;"><%# Container.ItemIndex + 1 + (CurrPage - 1) * PageSize%></td>
             <td class="Ctd" align="center">
              <a href="KS.BBSCategory.Aspx?action=edit&BoardID=<%# Eval("BoardID") %>">�༭</a>
              <a href="KS.BBSCategory.Aspx?Action=del&Ids=<%# Eval("BoardID") %>" onclick="return(confirm('ɾ�����棬ͬʱɾ���ð����µ��ʴ𣬴˲��������棬ȷ��ɾ��������?'));">ɾ��</a>
              <a href='<%# GetClassUrl(Convert.ToInt16(Eval("BoardID"))) %>'target="_blank">Ԥ��</a>
             </td>
            </tr>
            <tr>
             <td colspan="5"></td>
            </tr>
          </ItemTemplate>
          <FooterTemplate>
               <tr style="display:<%# bool.Parse((list.Items.Count==0).ToString())?"":"none"%>">
                <td class="Ctd" style="text-align:center" colspan="5">
                 <asp:LinkButton ID="addbutton" runat="server" OnClick="lbtaddmodel_Click"> ��û������κΰ��棬�����Ӱ���&raquo;</asp:LinkButton>
                </td>
               </tr> 
          </table>
          </FooterTemplate>
         </asp:Repeater>
         
          <KS:Page ID="Page1" runat="server" />
         <!--
          <br />
        <script type="text/javascript">
            showtips('<span class="state"><strong>����˵����</strong><br /></span>��ʹ�ñ�ǩ{$GetBBSCategory}��ǰ̨ģ����ó���̳���档');
		</script>
         -->
        </asp:Panel> 
        
        <asp:Panel ID="ClassAdd" runat="server" Width="100%">
        <script>
	        function setFileFileds(num){    
             for(var i=1,str="";i<=20;i++){
	            jQuery("#define" + i).css("display","none");
              }
             for(var i=1,str="";i<=num;i++){	jQuery("#define" + i).css("display","");
                 }
            }

            function CheckAddMode() {
                if (jQuery("#AddType")[0].checked == true) {
                    jQuery("#AddOne").hide();
                    jQuery("#AddMore").show();
                } else {
                    jQuery("#AddOne").show();
                    jQuery("#AddMore").hide();
                }
            }

            function CheckForm() {
                if (jQuery('#<%=this.BoardName.ClientID %>').val() == '' && jQuery("#AddType")[0].checked == false) {
                    KesionJS.Alert('��������̳�������ƣ�', "jQuery('#<%=this.BoardName.ClientID %>').focus()");
                    return false;
                } else if (jQuery("#AddType")[0].checked == true && jQuery('#<%=this.TxtMoreBoardName.ClientID %>').val() == '') {
                    KesionJS.Alert('�밴��ʽ������̳��������,һ�б�ʾһ�����棡', "jQuery('#<%=this.TxtMoreBoardName.ClientID %>').focus()");
                    return false;
                }
            }
            function showPurview(){
                var checkrad=jQuery("#<%=this.RdbVisitorView.ClientID%> :radio[checked]").val();
                if (checkrad=="1"){
                    jQuery("#showpurview").hide();
                }else{
                    jQuery("#showpurview").show();
                }
            }
            $(document).ready(function(){
                showPurview();
            });
	    </script>
	    

        <KS:TopNav ID="TopNav1" runat="server" Text="�������̳����" />
        <br />
        
        
       	<div class="tab-page" id="BBSClassPanel">
         <script type="text/javascript">
             var tabPane1 = new WebFXTabPane(document.getElementById("BBSClassPanel"), 1)
         </script>
             
		 <div class="tab-page" id="tab0">
		  <h2 class="tab">������Ϣ</h2>
			<script type="text/javascript">
						 tabPane1.addTabPage( document.getElementById( "tab0" ) );
			</script>
			
             <table width="100%" border="0" cellpadding="1" cellspacing="1" class="CTable">
				   <tr>
                       <td align="right" class="lefttd" style=" height: 37px;"><strong>
                           �������棺</strong><br>
                         </td>
                         <td class="righttd" style="height: 37px">
                             <asp:DropDownList ID="ParentID" runat="server">
                             <asp:ListItem Value="0">-�ޣ���Ϊһ�����棩-</asp:ListItem>
                             </asp:DropDownList>&nbsp;
                             <span id="ParentIDMessage" runat="server"></span>
                       </td>
                     </tr>
                     
                     
                     
                    <tr>
                    <td class="lefttd" height="30" align="right" style="width: 145px">
                        <strong> �������ƣ�</strong></td>
                    <td class="righttd">
                       <span id="AddOne">
                        <asp:TextBox CssClass="textbox" ID="BoardName" runat="server"></asp:TextBox>
                        <span class="tips">*������������ƣ��磺��н������Ҿ������</span>
                       </span>
                        <label style="<%=KSCMS.S("action")=="edit"?"display:none;":"" %>font-weight:bold;color:Green"><input onclick="CheckAddMode()" type="checkbox" name="AddType" id="AddType" value="1" />�л����������ģʽ</label>
                       <div id="AddMore" style="display:none">
                          <font color=red>һ�д���һ������</font><br />
                          <asp:TextBox Text="��������1" ID="TxtMoreBoardName" runat="server" CssClass="textbox" TextMode="MultiLine" Width="250px" Height="150px"></asp:TextBox>
                         </div>
                         </td>
                  </tr>



                <tr id="IntroArea">
                    <td align="right"  class="lefttd" style=" height: 50px;">
                        <strong>������ܣ�</strong><br />
                        </td>
                    <td  class="righttd" style="height: 50px">
                        <asp:TextBox CssClass="textbox textarea" ID="TxtIntro" runat="server" rows="6" TextMode="MultiLine" Width="383px" Height="80px"></asp:TextBox>
                         <a class="textarea_min" href="javascript:zoomtextarea(-5,'<%=this.TxtIntro.ClientID %>');"></a>
                         <a class="textarea_max" href="javascript:zoomtextarea(5,'<%=this.TxtIntro.ClientID %>');"></a>
                          <br />
                          <font class='tips'>��Ҫ���ܰ�����Ϣ��������255���ַ���</font> 
                        </td>
                  </tr>
                  <tr>
                    <td  height="30" class="lefttd" align="right">
                        <strong>����ͼ�꣺</strong></td>
                    <td class="righttd">
                        <asp:TextBox CssClass="textbox" ID="TxtICO" runat="server" Width="380px"></asp:TextBox>&nbsp;<input type="button" class="button" onclick="SelectFiles('<%=this.TxtICO.ClientID %>',101);" value="ѡ��ͼƬ">
                        <br />
                        <font class='tips'>�����ڰ���ҳ��ʾָ����ͼƬ</font>
                        </td>
                 </tr>
              
               <tr>
                    <td  height="30" class="lefttd" align="right" style="width: 155px">
                        <strong>������</strong></td>
                    <td class="righttd">
                        <asp:TextBox CssClass="textbox" ID="TxtBoardMaster" runat="server" Width="380px"></asp:TextBox>&nbsp;
                        <font class='tips'>�����������Ӣ�Ķ��Ÿ�����</font>
                        </td>
                 </tr>
              
                <tr>
                    <td  height="30" class="lefttd" align="right" style="width: 155px">
                        <strong>�������б����û��棺</strong></td>
                    <td class="righttd">
                        �б�ҳǰ<asp:TextBox Text="0" CssClass="textbox" ID="TxtCacheNum" runat="server" style="text-align:center" Width="50px"></asp:TextBox>ҳ���û��� 
                        <span class="tips">tips:�������ò�����100ҳ�����á�0�������û��档</span>
                        </td>
                 </tr>
                 <tr>
                    <td  height="30" class="lefttd" align="right" style="width: 155px">
                        <strong>�������ҳ��ʽ��</strong></td>
                    <td class="righttd">
                      <asp:RadioButtonList ID="RdbPageType" runat="server" RepeatLayout="Flow" RepeatDirection="Horizontal">
                          <asp:ListItem Value="0">��ͨ��ҳ</asp:ListItem>
                          <asp:ListItem Value="1" Selected="True">����������</asp:ListItem>
                      </asp:RadioButtonList>    
                    </td>
                 </tr>
                <tr>
                    <td  height="30" class="lefttd" align="right" style="width: 155px">
                        <strong>��ҳ���ã�</strong></td>
                    <td class="righttd">
                        ÿҳ����<asp:TextBox Text="0" CssClass="textbox" ID="TxtRollTopicPageNum" runat="server" style="text-align:center" Width="50px"></asp:TextBox>������
                        ������ϸҳÿҳ����<asp:TextBox Text="0" CssClass="textbox" ID="TxtRollReplyPageNum" runat="server" style="text-align:center" Width="50px"></asp:TextBox>���ظ�
                        </td>
                 </tr>
                <tr>
                    <td  height="30" class="lefttd" align="right" style="width: 155px">
                        <strong>�������ã�</strong></td>
                    <td class="righttd">
                        ���������<asp:TextBox Text="0" CssClass="textbox" ID="TxtHotTopicHits" runat="server" style="text-align:center" Width="50px"></asp:TextBox>���һظ�������<asp:TextBox Text="0" CssClass="textbox" ID="TxtHotReplyHits" runat="server" style="text-align:center" Width="50px"></asp:TextBox>¥ʱ�Զ�תΪ����
                        </td>
                 </tr>
                  
              
          </table>	

        </div>

      <div class="tab-page" id="post">
		  <h2 class="tab">����Ȩ��</h2>
			<script type="text/javascript">
			    tabPane1.addTabPage(document.getElementById("post"));
			</script>
			
           <table width="100%" border="0" cellpadding="1" cellspacing="1" class="CTable">
                   <tr>
                    <td  height="30" align="right"  class="lefttd" style="width: 145px">
                        <strong>���û�ע��</strong>��<br />
                      </td>
                    <td class="righttd">
                        <asp:TextBox  ID="Txt1" style="text-align:center" Text="20" CssClass="textbox" runat="server"  Width="50px"></asp:TextBox>���Ӻ�ſ����ڱ����淢��
                        </td>
                   </tr>
                 <tr>
                    <td  height="30" align="right"  class="lefttd" style="width: 145px">
                        <strong>�Ƿ������ο����</strong>��<br />
                      </td>
                    <td class="righttd">
                         <asp:RadioButtonList ID="RdbVisitorView" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow">
                             <asp:ListItem Value="1" Selected="True">����</asp:ListItem>
                             <asp:ListItem Value="0">������</asp:ListItem>
                         </asp:RadioButtonList>
                    </td>
                   </tr>
               <tbody id="showpurview">
                 <tr>
                    <td  height="30" align="right"  class="lefttd" style="width: 145px">
                        <strong>���Ȩ����Ȩ</strong>��<br />
                      </td>
                    <td class="righttd">
                        <strong>1�����ƻ�Ա��:(�������벻Ҫ��ѡ) </strong><br />
                        <asp:Label ID="LabGroupID" runat="server" Text=""></asp:Label>
                        <strong>2����֤��Ա</strong><br />
                        <asp:TextBox ID="TxtUserNames" runat="server" CssClass="textbox" Width="600" Height="100" TextMode="MultiLine"></asp:TextBox>
                        <br /> <span class="tips">�����Ա����鿴������Ӣ�Ķ��Ÿ�����</span>
                        <!--<br />
                        <strong>3����Ч������</strong><br />
                        <asp:RadioButtonList ID="RdbLimitValidDays" runat="Server">
                            <asp:ListItem Value="0" Selected="True">��������Ч������</asp:ListItem>
                            <asp:ListItem Value="1">��Ч���û����������</asp:ListItem>
                            <asp:ListItem Value="2">��Ч���û�����Ҫ�������������һ�����������</asp:ListItem>
                        </asp:RadioButtonList>    -->
                    </td>
                   </tr>
               </tbody>
                 <tr>
                    <td  height="30" align="right"  class="lefttd" style="width: 145px">
                        <strong>�Ƿ������ϴ�����</strong>��<br />
                      </td>
                    <td class="righttd">
                         <asp:RadioButtonList ID="RdbUpload" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow">
                             <asp:ListItem Value="1" Selected="True">����</asp:ListItem>
                             <asp:ListItem Value="0">������</asp:ListItem>
                         </asp:RadioButtonList>
                    </td>
                   </tr>

                 <tr>
                     <td  height="30" align="right"  class="lefttd" style="width: 145px">
                        <strong>����������</strong>��<br />
                      </td>
                    <td class="righttd">
                        һ����ÿ����Ա���ֻ�ܷ���
                        <asp:TextBox ID="Txt2" Text="0" style="text-align:center" runat="server" CssClass="textbox" Width="50px"></asp:TextBox>
                        ������ ��������������
                        <asp:TextBox ID="Txt3" Text="0" style="text-align:center" runat="server" CssClass="textbox" Width="50px"></asp:TextBox>
                        ���� �������ʱ��
                        <asp:TextBox ID="Txt4" Text="0" style="text-align:center" runat="server" CssClass="textbox" Width="50px"></asp:TextBox>
                        �� 
                        <span class="tips">�����������롰0����</span> 
                        <br />
                        ����ʱ���
                        <asp:TextBox ID="Txt5" Text="0" style="text-align:center" runat="server" CssClass="textbox" Width="50px"></asp:TextBox>
                         -
                       <asp:TextBox ID="Txt6" Text="0" style="text-align:center" runat="server" CssClass="textbox" Width="50px"></asp:TextBox>
                         �㲻�ܷ��� <span class="tips">�����������롰0����</span> 
                    </td>

                 </tr>

                   </table>
             </div>
        
        <div class="tab-page" id="score">
		  <h2 class="tab">���ֹ���</h2>
			<script type="text/javascript">
			    tabPane1.addTabPage(document.getElementById("score"));
			</script>
			
             <table width="100%" border="0"  cellpadding="1" cellspacing="1" class="CTable">
            <tr>
                    <td  height="30" align="right"  class="lefttd" style="width: 145px">
                        <strong>������</strong>��<br />
                      </td>
                    <td class="righttd">
                         ���� <asp:TextBox ID="TxtScore1" style="text-align:center" Text="0" runat="server" CssClass="textbox" Width="50px"></asp:TextBox>�� 
                        <span class="tips">���ͻ��������á�0��</span>
                    </td>
                   </tr>
            <tr>
                    <td  height="30" align="right" class="lefttd" style="width: 145px">
                        <strong>����ظ�</strong>��<br />
                      </td>
                    <td class="righttd">
                        ����
                          <asp:TextBox ID="TxtScore2"  style="text-align:center" Text="0" runat="server" CssClass="textbox" Width="50px"></asp:TextBox>�� 
                         <span class="tips">���ͻ��������á�0���������Դ�Ļ���ظ����ӻ��֡�</span>
                    </td>
                   </tr>
            <tr>
                    <td  height="30" align="right"  class="lefttd" style="width: 145px">
                        <strong>���þ���</strong>��<br />
                      </td>
                    <td class="righttd">
                        ����
                          <asp:TextBox ID="TxtScore3" style="text-align:center" Text="0" runat="server" CssClass="textbox" Width="50px"></asp:TextBox>�� 
                         <span class="tips">���ͻ��������á�0��</span>
                    </td>
                   </tr>
             <tr>
                    <td  height="30" align="right"  class="lefttd" style="width: 145px">
                        <strong>���ð����ö�</strong>��<br />
                      </td>
                    <td class="righttd">
                        ����
                          <asp:TextBox ID="TxtScore4" style="text-align:center" Text="0" runat="server" CssClass="textbox" Width="50px"></asp:TextBox>�� 
                         <span class="tips">���ͻ��������á�0��</span>
                    </td>
                   </tr>
             <tr>
                    <td  height="30" align="right"  class="lefttd" style="width: 145px">
                        <strong>�������ö�</strong>��<br />
                      </td>
                    <td class="righttd">
                        ����
                          <asp:TextBox ID="TxtScore5" style="text-align:center" Text="0" runat="server" CssClass="textbox" Width="50px"></asp:TextBox>�� 
                         <span class="tips">���ͻ��������á�0��</span>
                    </td>
                   </tr>
            <tr>
                    <td  height="30" align="right"  class="lefttd" style="width: 145px">
                        <strong>���ⱻɾ��</strong>��<br />
                      </td>
                    <td class="righttd">
                          �۳�
                          <asp:TextBox ID="TxtScore6"  style="text-align:center" Text="0" runat="server" CssClass="textbox" Width="50px"></asp:TextBox>�� 
                         <span class="tips">���۳����������á�0��</span>
                    </td>
                   </tr>
            <tr>
                    <td  height="30" align="right"  class="lefttd" style="width: 145px">
                        <strong>�ظ���ɾ��</strong>��<br />
                      </td>
                    <td class="righttd">
                          �۳�
                          <asp:TextBox ID="TxtScore7" style="text-align:center" Text="0" runat="server" CssClass="textbox" Width="50px"></asp:TextBox>�� 
                         <span class="tips">���۳����������á�0��</span>
                    </td>
                   </tr>
            
           </table>
        </div>
            

       <div class="tab-page" id="rules">
		  <h2 class="tab">������</h2>
			<script type="text/javascript">
			    tabPane1.addTabPage(document.getElementById("rules"));
			</script>
			
             <table width="100%" border="0"  cellpadding="1" cellspacing="1" class="CTable">
            <tr>
                    <td  height="30" align="right"  class="lefttd" style="width: 145px">
                        <strong>���</strong>��<br />
                      </td>
                    <td class="righttd">
                        <asp:TextBox  ID="TxtBoardRules" runat="server" Rows="3" TextMode="MultiLine" Height="350" Width="800px"></asp:TextBox>
                       <%Kesion.APPCode.EditorAPI.EchoEditor("editor", this.TxtBoardRules.ClientID, "Basic", 0, false, true); %>
                        </td>
                  </tr>
                 
                   </table>
             </div>
		
        <div class="tab-page" id="seooption">
		  <h2 class="tab">SEOѡ��</h2>
			<script type="text/javascript">
			    tabPane1.addTabPage(document.getElementById("seooption"));
			</script>
			
             <table width="100%" border="0"  cellpadding="1" cellspacing="1" class="CTable">
            <tr>
                    <td  height="30" align="right"  class="lefttd" style="width: 145px">
                        <strong>����META�ؼ���</strong>��<br />
                        <span style="color: #0000ff">��������������õĹؼ���</span>
                        

                    </td>
                    <td class="righttd">
                        <asp:TextBox CssClass="textbox textarea" ID="MetaKeyWord" runat="server" Rows="3" TextMode="MultiLine" Width="378px" Height="100px"></asp:TextBox>
                         <a class="textarea_min" href="javascript:zoomtextarea(-5,'<%=this.MetaKeyWord.ClientID %>');"></a>
                         <a class="textarea_max" href="javascript:zoomtextarea(5,'<%=this.MetaKeyWord.ClientID %>');"></a>
						 <br/>
						 <span class="tips">����ҳ���ñ�ǩ��{$GetBBSBoardMetaKeyWords}</span>
                        </td>
                  </tr>
                  <tr>
                         <td align="right"  class="lefttd" style="height: 76px; width: 145px;">
                             <strong>����META��ҳ������<br />
                             </strong><span style="color: #0000ff">��������������õ���ҳ����</span> </td>
                         <td  class="righttd" style="height: 76px">
                             <asp:TextBox CssClass="textbox textarea" ID="MetaDescript" runat="server" rows="3" TextMode="MultiLine" Width="376px" Height="100px"></asp:TextBox>
                                <a class="textarea_min" href="javascript:zoomtextarea(-5,'<%=this.MetaDescript.ClientID %>');"></a>
                         <a class="textarea_max" href="javascript:zoomtextarea(5,'<%=this.MetaDescript.ClientID %>');"></a>
						  <br/><span class="tips">����ҳ���ñ�ǩ��{$GetBBSBoardDescript}</span>
                        </td>
                  </tr>
                   </table>
             </div>
		
		

      
      <div style="clear:both;text-align:center"><br />
          <KS:Foot ID="Foot1" runat="server" OnSubmit="SaveButton_Click" />
      </div>
        </asp:Panel>
   </asp:Content>