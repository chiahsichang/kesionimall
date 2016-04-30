<%@ Page Language="C#" ValidateRequest="false" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.Admin_Class" Title="��Ŀ����" Codebehind="KS.Class.aspx.cs" %>
<%@ Import Namespace="Kesion.Cache" %>
<%@ Import Namespace="Kesion.Publics" %>
<asp:Content ID="Content1" ContentPlaceHolderID="KSContent" Runat="Server">
         
     <asp:Panel ID="ClassList" runat="server" Width="100%">
     <div id="manage_top" class="menu_top_fixed">
       <ul>
        <span style="float:right;">
          <asp:DropDownList ID="DropChannelID" runat="server" style="WIDTH: 150px;">
           <asp:ListItem Value="0">--��ģ�Ͳ鿴--</asp:ListItem>
          </asp:DropDownList>
        </span>

         <li id='p1'><asp:LinkButton ID="addbutton" runat="server" OnClick="lbtaddmodel_Click"><b></b>�����Ŀ</asp:LinkButton></li>
         <li id='p3'><asp:LinkButton ID="delbutton" runat="server" OnClientClick="if (GetIDS('del')){return true}else{return false}" onclick="BtnDelete_Click"><b></b>ɾ����Ŀ</asp:LinkButton></li>
         <li id='p5'><asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click"><b></b>һ������</asp:LinkButton></li>
          <li id='p7'><asp:LinkButton ID="LinkButton2" runat="server" OnClick="LinkButton2_Click"><b></b>N ������</asp:LinkButton></li>
         <li id='p14'><asp:LinkButton ID="attribbutton" runat="server" OnClick="attribbutton_Click"><b></b>��������</asp:LinkButton></li>
         <li id='p11'><a href="KS.ClassMerge.Aspx?from=<%=KSCMS.S("from") %>"><b></b>��Ŀ�ϲ�</a></li>
         <li id='p2'><a href="KS.ClassMove.Aspx?from=<%=KSCMS.S("from") %>"><b></b>�ƶ��ĵ�</a></li>
         <li id='p10'><asp:LinkButton ToolTip="һ�������ĵ���" ID="LinkButton3" runat="server" onclick="LinkButton3_Click"><b></b>һ������</asp:LinkButton></li>
         <li id='p10'><asp:LinkButton ToolTip="һ��������Ŀ����" ID="LinkButton4" runat="server" OnClick="LinkButton4_Click"><b></b>��������</asp:LinkButton></li>

            <%if (from!="shop"){ %>
         <li id='p15'><a href="javascript:;" onclick="refreshClass()"><b></b>��������HTML</a></li>
            <%} %>

       </ul>
     </div>
     <div class="menu_top_fixed_height"></div>
<script>
    function refreshClass() {
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
            top.openWin("���ɾ�̬HTML����", "refresh/KS.RefreshHtml.aspx?action=refreshClass&classid=" + sid, false, 600, 250);
        } else {
            KesionJS.Alert("��ѡ��Ҫ��������Ŀ��");
        }
    }
    function ExtSub(ID,event) {

        //��ֹð�ݵ���parent
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
            url: "KS.Class.aspx",
            data: "parentid="+ID+"&action=ExtSub&from=<%=from %>",
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
           <table width="99%" cellpadding="0" cellspacing="0" class="CTable">
           <tr class="CTitle">
				<th scope="col" width="30">
                    <input type="checkbox" name="chkall" onclick="CheckBox(this.checked);" for="chkall"/></th>
                <th width="50">��ĿID</th>
               <th scope="col"  width="600" style="text-align:left">��Ŀ���� (<a class="tips" style="font-weight:normal" href="KS.Class.aspx?flag=showall&<%=UtilsQueryParam.Get("flag") %>">չ��</a>)</th>
              
               <%if (KSCMS.S("from").Equals("shop")){ %>
                <th scope="col">��Ʒ���</th>
               <%} %>
               <th scope="col">���</th>
               <th scope="col" width="35">�༭</th>
               <th scope="col" width="35">ɾ��</th>
               <th scope="col" width="35">���</th>
			</tr>
          </HeaderTemplate>
          <ItemTemplate>
         
            <tr id='sub<%#Eval("classid") %>' onmouseover="jQuery('#a<%# Eval("classid") %>').show();jQuery(this).addClass('CtrMouseOver');jQuery(this).removeClass('CtrMouseOut');" onmouseout="jQuery('#a<%# Eval("classid") %>').hide(); jQuery(this).addClass('CtrMouseOut');jQuery(this).removeClass('CtrMouseOver');" onclick="chk(this)">
             <td class="Ctd" style="height:30px;text-align:center;"><input type="checkbox" name="ids" value='<%#Eval("classID")%>' /></td>
             <td class="Ctd" style="height:30px;text-align:center;"><%# Eval("classid") %></td>
             <td class="Ctd">
             <%if (KSCMS.S("flag") != "showall")
               { %>
                <a href="javascript:void(0)" style="text-decoration:none" onclick='ExtSub("<%# Eval("ClassID") %>",event);'><%# getClassName(Convert.ToInt32(Eval("ClassID")),Eval("Classname", "{0}"), Convert.ToInt16(Eval("child")), Convert.ToInt16(Eval("NextID")), Convert.ToInt16(Eval("depth", "{0}")), Convert.ToInt16(Eval("ClassType", "{0}")))%></a><%}
               else
               { %><%# getClassName(Convert.ToInt32(Eval("ClassID")),Eval("Classname", "{0}"), Convert.ToInt16(Eval("child")), Convert.ToInt16(Eval("NextID")), Convert.ToInt16(Eval("depth", "{0}")), Convert.ToInt16(Eval("ClassType", "{0}")))%><%} %>
               
               <span style="display:none;padding-left:20px;" id="a<%# Eval("classid") %>">
                <a <%# Convert.ToInt16(Eval("classtype")) == 1?" style='color:#999;'":" style='display:none'" %> href="KS.Class.Aspx?action=add&parentid=<%# Eval("classid") %><%=urlParam %>">�������Ŀ</a>
                <a href='<%# GetClassUrl(Convert.ToInt32(Eval("ClassID"))) %>'target="_blank" style="color:#999">Ԥ��</a>
                <a <%# Convert.ToInt16(Eval("classtype")) == 3?" ":" style='display:none'"%> href='KS.SinglePage.aspx?classid=<%# Eval("ClassID") %>' style="color:#999">�༭����</a>
               </span>

               </td>
           <%if (KSCMS.S("from").Equals("shop")){ %>
               <td class="Ctd" align="center"><span class="tips"><%# GetProSpecialName(Utils.StrToInt(Eval("ProSpecialID")))%></span></td>
           <%} %>
             <td class="Ctd" align="center"><%# Container.ItemIndex + 1 + (CurrPage - 1) * PageSize%></td>
             <td class="Ctd" align="center"><a class="edit" title="�༭" href="KS.Class.Aspx?action=edit&classid=<%# Eval("classid") %><%=urlParam %>"></a></td>
             <td class="Ctd" align="center"><a  class="delete" title="ɾ����Ŀ" href="KS.Class.Aspx?Action=del&Ids=<%# Eval("classid") %><%=urlParam %>" onclick="return(confirm('�˲��������棬ȷ��ɾ����Ŀ��?'));"></a></td>
             <td class="Ctd" align="center"><a  class="del" title="�����Ŀ����" href='KS.Class.Aspx?Action=delinfo&Ids=<%# Eval("classid") %><%=urlParam %>' onclick="return(confirm('�����Ŀ������Ŀ����������Ŀ���������ĵ�ɾ����ȷ��Ҫ��մ���Ŀ��'));"></a></td>

            </tr>
          </ItemTemplate>
          <FooterTemplate>
           <tr style="display:<%# bool.Parse((list.Items.Count==0).ToString())?"":"none"%>">
                <td class="Ctd" style="text-align:center" colspan="10">
                 <asp:LinkButton ID="addbutton" runat="server" OnClick="lbtaddmodel_Click" > ��û������κη��࣬�����ӷ���&raquo;</asp:LinkButton>
                </td>
               </tr> 
          </table>
          </FooterTemplate>
         </asp:Repeater>

            <KS:Page ID="Page1" runat="server" />
        </asp:Panel> 
        
        <asp:Panel ID="ClassAdd" runat="server" Width="100%">
        <script type="text/javascript">
        <!--
	        function setFileFileds(num){    
             for(var i=1,str="";i<=20;i++){
	            jQuery("#define" + i).css("display","none");
             }
             for(var i=1,str="";i<=num;i++){	jQuery("#define" + i).css("display","");
                 }
            }
            function ChangeClassType(){
              var checkrad = jQuery("#<%=this.ClassType.ClientID%> :radio[checked]").val();
              SetClassType(checkrad);
            }
            function SetClassType(Val) {
               
            if (Val==1){
                   jQuery("#<%=this.ShowEnameArea.ClientID%>").css("display","");
                   jQuery("#<%=this.ShowOutArea.ClientID%>").css("display","none");
                   jQuery("#<%=this.ShowSingleArea.ClientID%>").css("display", "none");
                   jQuery("#wnoshow").show();
                   jQuery("#tab1").attr("disabled",false);
                   jQuery("#tab2").attr("disabled",false);
                   jQuery("#tab3").attr("disabled",false);
                   jQuery("#tab4").attr("disabled",false);
                   jQuery("#tab5").attr("disabled",false);
                   jQuery("#ClassTemplateArea").css("display","");
                   jQuery("#ContentTemplateArea").css("display","");
                   jQuery("#ModelArea").css("display","");
                   jQuery("#IntroArea").css("display","");
                   }
                  else if (Val==2){
                   jQuery("#<%=this.ShowEnameArea.ClientID%>").css("display","none");
                   jQuery("#<%=this.ShowOutArea.ClientID%>").css("display","");
                   jQuery("#<%=this.ShowSingleArea.ClientID%>").css("display", "none");
                   jQuery("#wnoshow").hide();
                   jQuery("#tab1").attr("disabled",false);
                   jQuery("#tab2").attr("disabled",true);
                   jQuery("#tab3").attr("disabled",true);
                   jQuery("#tab4").attr("disabled",true);
                   jQuery("#tab5").attr("disabled",true);
                   jQuery("#ClassTemplateArea").css("display","none");
                   jQuery("#ContentTemplateArea").css("display","none");
                   jQuery("#ModelArea").css("display","");
                   jQuery("#IntroArea").css("display","");
                   }
                  else{
                   jQuery("#<%=this.ShowEnameArea.ClientID%>").css("display","none");
                   jQuery("#<%=this.ShowOutArea.ClientID%>").css("display","none");
                   jQuery("#<%=this.ShowSingleArea.ClientID%>").css("display", "");
                   jQuery("#wnoshow").show();
                   jQuery("#tab1").attr("disabled",false);
                   jQuery("#tab2").attr("disabled",true);
                   jQuery("#tab3").attr("disabled",true);
                   jQuery("#tab4").attr("disabled", true);
                   jQuery("#tab5").attr("disabled", false);
                   jQuery("#ClassTemplateArea").css("display","");
                   jQuery("#ContentTemplateArea").css("display","none");
                   jQuery("#ModelArea").css("display","");
                   jQuery("#IntroArea").css("display","none");
                  }
            }
            function ConvertPinYin(){
              var className=jQuery('#<%=this.ClassName.ClientID %>').val();
              jQuery.get("../../plus/ajaxs.ashx",{a:"convertclassname",classname:className},function(v){
                 jQuery('#<%=this.ClassEname.ClientID %>').val(unescape(v));
              });
            }
            function SetTemplateDefault(){
             var modelid=jQuery('#<%=this.ChannelID.ClientID %>').val();
             if (modelid!='0'){
              jQuery.get("../../plus/ajaxs.ashx",{a:"modelename",modelid: modelid},function(val){
                     if (val!='')
                     {
                      jQuery('#<%=this.ClassTemplate.ClientID %>').val('{$TemplateDir}/'+val+'/��Ŀҳ.html');
                      jQuery('#<%=this.ContentTemplate.ClientID %>').val('{$TemplateDir}/'+val+'/����ҳ.html');
                  }
                  jQuery.get("../../plus/ajaxs.ashx", { col: 3, a: "modelename", modelid: modelid }, function (val) {
                      if (val != '') {
                          val = val.replace(/KS_U_/g, "");
                          jQuery('#<%=this.TxtClass3GTemplate.ClientID %>').val('{$TemplateDir}/3G/' + val + '/list.html');
                          jQuery('#<%=this.TxtContent3GTemplate.ClientID %>').val('{$TemplateDir}/3G/' + val + '/show.html');
                      }
                  });
              });
            }
            }
            
	       
            function CheckAddMode(){
             if (jQuery("#AddType")[0].checked==true){
               jQuery("#AddOne").hide();
               jQuery("#AddEOne").hide();
               jQuery("#AddMore").show();
             }else{
               jQuery("#AddOne").show();
               jQuery("#AddEOne").show();
               jQuery("#AddMore").hide();
             }
            }
	        function CheckForm()
	        {
             
	         if(jQuery('#<%=this.ClassName.ClientID %>').val()=='' && jQuery("#AddType")[0].checked==false){
	            KesionJS.Alert('��������Ŀ���ƣ�', "jQuery('#<%=this.ClassName.ClientID %>').focus()");
	           return false;
	         }else if (jQuery("#AddType")[0].checked==true&&jQuery('#<%=this.TxtMoreClassName.ClientID %>').val()==''){
          	   KesionJS.Alert('�밴��ʽ������Ŀ���ƺ�Ӣ�����ƣ�', "jQuery('#<%=this.TxtMoreClassName.ClientID %>').focus()");
	           return false;
             }else if (jQuery("#AddType")[0].checked==true&&jQuery('#<%=this.TxtMoreClassName.ClientID %>').val().indexOf('|')==-1){
          	   KesionJS.Alert('�밴��ʽ������Ŀ���ƺ�Ӣ������,��ʽΪ����Ŀ��������|��ĿӢ�����ƣ�', "jQuery('#<%=this.TxtMoreClassName.ClientID %>').focus()");
	           return false;
             }
	       if (jQuery('#<%=this.ChannelID.ClientID %>').val() == '0') {
	           KesionJS.Alert('��ѡ��󶨵�ģ�ͣ�', "jQuery('#<%=this.ChannelID.ClientID %>').focus()");
	           return false;
	       }
	       var classtype = jQuery("#<%=this.ClassType.ClientID%> :radio[checked]").val();
	           
	      if (classtype==1){
                     
                   
                     if (jQuery('#<%=this.ClassEname.ClientID %>').val()=='' && jQuery("#AddType")[0].checked==false)
                      {
                       KesionJS.Alert('��������ĿӢ�����ƣ�',"jQuery('#<%=this.ClassEname.ClientID %>').focus()");
                       return false;}
                     if (jQuery('#<%=this.ClassTemplate.ClientID %>').val()=='')
                      {
                       KesionJS.Alert('�����Ŀģ�壡',"jQuery('#<%=this.ClassTemplate.ClientID %>').focus()");
                       return false;
                      }
                     if(jQuery('#<%=this.ContentTemplate.ClientID %>').val()=='')
                      {
                       KesionJS.Alert('<%=KSCMS.GetInstallDir() %>',1,'�������ҳģ�壡',"jQuery('#<%=this.ContentTemplate.ClientID %>').focus()");
                       return false;
                      }
                     }
                   else if(classtype==2&&(jQuery('#<%=this.LinkUrl.ClientID %>').val()==''||jQuery('#<%=this.LinkUrl.ClientID %>').val()=='http://')){
                    KesionJS.Alert('�������ⲿƵ�����ӵ�ַ��',"jQuery('#<%=this.LinkUrl.ClientID %>').focus()");
                    return false;}
                   else if(classtype==3){
                    if (jQuery('#<%=this.SingleFname.ClientID %>').val()==''){
                    KesionJS.Alert('�����뵥ҳ�����ļ�����',"jQuery('#<%=this.SingleFname.ClientID %>').focus()");
                    return false;
                }
                
                    if (jQuery('#<%=this.ClassTemplate.ClientID %>').val()=='')
                      {
                       KesionJS.Alert('�����Ŀģ�壡',"jQuery('#<%=this.ClassTemplate.ClientID %>').focus()");
                       return false;
                      }
                }
	         
	        }
	        //-->
	    </script>
	    

        <KS:TopNav ID="TopNav1" runat="server" Text="�������Ŀ" />
        
       	<div class="tab-page" id="ClassPanel">
         <script type="text/javascript">
           var tabPane1 = new WebFXTabPane( document.getElementById( "ClassPanel" ), 1 )
         </script>
             
		 <div class="tab-page" id="tab0">
		  <h2 class="tab">������Ϣ</h2>
			<script type="text/javascript">
						 tabPane1.addTabPage( document.getElementById( "tab0" ) );
			</script>
			
             <table width="100%" border="0" cellpadding="1" cellspacing="1" class="CTable">
				   <tr>
                       <td align="right" class="lefttd" style="width: 200px; height: 37px;"><strong>
                           ������Ŀ��</strong>
                         </td>
                         <td  class="righttd" style="height: 37px">
                             <asp:DropDownList ID="ParentID" runat="server">
                             <asp:ListItem Value="0">-�ޣ���Ϊһ����Ŀ��-</asp:ListItem>
                             </asp:DropDownList>&nbsp;
                             <span id="ParentIDMessage" runat="server"></span>
                             <span class="tips">����ָ��Ϊ�ⲿƵ����ҳ��Ŀ</span>
                       </td>
                     </tr>
                     
                     
                     
              <tr>
                    <td class="lefttd" height="30" align="right" > <strong> ��Ŀ���ƣ�</strong></td>
                    <td class="righttd">
                     <span id="AddOne">
                        <asp:TextBox CssClass="textbox" ID="ClassName" runat="server"></asp:TextBox>
                        <span class="red">*</span>
                        <span class="tips">��������Ŀ���������ƣ����������ġ�</span>
                     </span>
                     
                     <label style="<%=KSCMS.S("action")=="edit"?"display:none;":"" %>font-weight:bold;color:Green"><input onclick="CheckAddMode()" type="checkbox" name="AddType" id="AddType" value="1" />�л����������ģʽ</label>
                     <div id="AddMore" style="display:none">
                      <font color=red>¼���ʽ:��Ŀ��������|Ӣ������,˵��ÿ��һ��</font><br />
                      <asp:TextBox Text="��Ŀ����1|Ӣ������1" ID="TxtMoreClassName" runat="server" CssClass="textbox textarea" TextMode="MultiLine" Width="480px" Height="150px"></asp:TextBox>
                         <a class="textarea_min" href="javascript:zoomtextarea(-2,'<%=this.TxtMoreClassName.ClientID %>');"></a>
                         <a class="textarea_max" href="javascript:zoomtextarea(2,'<%=this.TxtMoreClassName.ClientID %>');"></a>  

                     </div>
                    
                    </td>
                  </tr>

                  <tr id="AddEOne">
                    <td  class="lefttd" align="right" style="height: 48px"><strong>��Ŀ���ͣ�</strong><br />
                     </td>
                    <td  class="righttd" style="height: 48px">
                       
                         <asp:RadioButtonList ID="ClassType" runat="server" RepeatDirection="Horizontal" OnSelectedIndexChanged="ClassType_SelectedIndexChanged">
                            <asp:ListItem Value="1">ϵͳ��Ŀ</asp:ListItem>
                            <asp:ListItem Value="2">�ⲿ��Ŀ</asp:ListItem>
                            <asp:ListItem Value="3">��ҳ��</asp:ListItem>
                        </asp:RadioButtonList>
                        <span class="tips">������Ӻ�Ͳ��ܸ��ģ�������ѡ��</span>
						<div id="ShowOutArea" runat="server" style="display:none">
						���ӵ�ַ��<asp:TextBox CssClass="textbox" ID="LinkUrl" runat="server" Width="248px">http://</asp:TextBox>
						</div>
						<div id="ShowSingleArea" runat="server" style="display:none">
                        <asp:DropDownList ID="DrpSinglePageHtml" runat="server" Visible="false">
                         <asp:ListItem Value="1">��ҳ�治��������HTML����</asp:ListItem>
                         <asp:ListItem Value="3">��ҳ���������ɾ�̬HTML����</asp:ListItem>
                        </asp:DropDownList>
						 <div>���ɵĵ�ҳ�ļ�����<asp:TextBox CssClass="textbox" ID="SingleFname" runat="server"></asp:TextBox><font color=red>�� about.html,intro.html��</font></div>
                         <div class="tips">��ҳ������·��Ϊ��ģ�����õ�������·��+��ҳ�ļ�����</div>
						</div>
						<div id="ShowEnameArea" runat="server">
                        Ӣ�����ƣ�<asp:TextBox CssClass="textbox" ID="ClassEname" runat="server" onblur="CheckEnglishStr(this,'��Ŀ��Ӣ������')"></asp:TextBox>&nbsp;<span style="color: #ff0000">*ֻ����дӢ�ĺ����ֵ����,���ܴ�\/��*���� &lt; &gt; | ���������</span>
						</div>
                       
						</td>
                  </tr>
                  <tr id="ModelArea">
                       <td align="right" class="lefttd" style="height: 37px;"><strong> ��ģ�ͣ�</strong></td>
                         <td class="righttd" style="height: 37px">
                             <asp:DropDownList ID="ChannelID" runat="server">
                             <asp:ListItem Value="0">--ѡ������ģ��--</asp:ListItem>
                             </asp:DropDownList>&nbsp;
                             <span id="Span1" runat="server"><a href="../Model/KS.Model.aspx">����ϵͳģ��</a></span>
                       </td>
                     </tr>
                 
                  <tr<%=KSCMS.S("from").Equals("shop")?"":" style='display:none'" %>>
                       <td align="right" class="lefttd" style="height: 37px;"><strong> ����Ʒ����飺</strong></td>
                         <td class="righttd">
                             <asp:DropDownList ID="DrpProSpecialID" runat="server">
                             <asp:ListItem Value="0">--ѡ��󶨵���Ʒ���--</asp:ListItem>
                             </asp:DropDownList>&nbsp;
                            
                       </td>
                     </tr>

                   
                <tr id="IntroArea">
                    <td align="right"  class="lefttd" style="height: 50px;">
                        <strong>��Ŀ���ܣ�</strong><br />
                       </td>
                    <td  class="righttd" style="height: 50px">
                        <asp:TextBox CssClass="textbox textarea" ID="ClassIntro" runat="server" rows="2" TextMode="MultiLine" Width="480px" Height="60px"></asp:TextBox>
                        <a class="textarea_min" href="javascript:zoomtextarea(-2,'<%=this.ClassIntro.ClientID %>');"></a>
                         <a class="textarea_max" href="javascript:zoomtextarea(2,'<%=this.ClassIntro.ClientID %>');"></a>  
                        <br />
                         <span class="tips">��������Ŀҳ�Ľ�����Ϣ��֧��HTML</span>
                        </td>
                  </tr>
                  <tr>
                    <td  height="30" class="lefttd" align="right" >
                        <strong>��ĿͼƬ��</strong><br />
                       </td>
                    <td class="righttd">
                        <table cellspacing="0" cellpadding="0"><tr><td><asp:TextBox CssClass="textbox" ID="ClassImg" runat="server" Width="480px"></asp:TextBox>&nbsp;<input type="button" class="button" onclick="SelectFiles('<%=this.ClassImg.ClientID %>    ',0);" value="ѡ��ͼƬ"></td>
                            <td style="padding-left:4px;padding-top:12px;"> <%=Kesion.APPCode.UploadAPI.EchoUpload("classpic",this.ClassImg.ClientID) %></td>
                               </tr></table>
                         <span class="tips">��������Ŀҳ��ʾָ����ͼƬ</span>

                    </td>
              </tr>
         <tbody id="ClassTemplateArea">
              <tr>
                <td align="right" class="lefttd">
                    <strong>WEB����Ŀģ�壺</strong></td>
                <td class="righttd" style="height: 30px">
                    <asp:TextBox CssClass="textbox" ID="ClassTemplate" runat="server" Width="480px"></asp:TextBox>
                    <input type="button" class="button" onmouseover="this.className='button_on';" onmouseout="this.className='button';" value="ѡ��ģ��..." onClick="SelectTemplate('<%=this.ClassTemplate.ClientID %>');"/></td>
            </tr>
              <tr<%=MyCache.GetCacheConfig(72)=="0"?" style='display:none'":"" %>>
                <td align="right" class="lefttd">
                    <strong>�ֻ�����Ŀģ�壺</strong></td>
                <td class="righttd" style="height: 30px">
                    <asp:TextBox ID="TxtClass3GTemplate" runat="server" CssClass="textbox" 
                        Width="480px"></asp:TextBox>
                    <input class="button" 
                        onClick="SelectTemplate('<%=this.TxtClass3GTemplate.ClientID %>');" 
                        onmouseout="this.className='button';" onmouseover="this.className='button_on';" 
                        type="button" value="ѡ��ģ��..." /></td>
              </tr>
            </tbody>
           <tbody id="ContentTemplateArea">
            <tr>
                <td align="right" class="lefttd">
                    <strong>WEB������ҳģ�壺</strong></td>
                <td class="righttd" style="height: 30px">
                    <asp:TextBox CssClass="textbox" ID="ContentTemplate" runat="server" Width="480px"></asp:TextBox>
                    <input type="button"  class="button" onmouseover="this.className='button_on';" onmouseout="this.className='button';" value="ѡ��ģ��..." onClick="SelectTemplate('<%=this.ContentTemplate.ClientID %>');"/>
                    <asp:CheckBox  ID="CkbUpdateTemplate" runat="server" Text="ͬ����������ӵ�����ҳģ��" Checked="true" />     
               </td>
            </tr>
               <tr<%=MyCache.GetCacheConfig(72)=="0"?" style='display:none'":"" %>>
                <td align="right" class="lefttd">
                    <strong>�ֻ�������ҳģ�壺</strong></td>
                <td class="righttd" style="height: 30px">
                    <asp:TextBox ID="TxtContent3GTemplate" runat="server" CssClass="textbox" 
                        Width="480px"></asp:TextBox>
                    <input class="button" 
                        onClick="SelectTemplate('<%=this.TxtContent3GTemplate.ClientID %>');" 
                        onmouseout="this.className='button';" onmouseover="this.className='button_on';" 
                        type="button" value="ѡ��ģ��..." />
                    <asp:CheckBox ID="CkbUpdate3GTemplate" runat="server" Checked="true" 
                        Text="ͬ����������ӵ�����ҳģ��" />     
               </td>
               </tr>
            </tbody>
          </table>	

        </div>
      
		 <div class="tab-page" id="tab1">
		  <h2 class="tab">��Ŀѡ��</h2>
			<script type="text/javascript">
						 tabPane1.addTabPage( document.getElementById( "tab1" ) );
			</script>
			
              <table width="100%" border="0" cellpadding="1" cellspacing="1" class="CTable">
                  <tr>
                      <td align="right" class="lefttd" height="30" style="width: 227px">
                          <strong>����Ŀ�Ƿ��ڶ�����������ʾ</strong>��</td>
                      <td class="righttd">
                          <asp:RadioButtonList ID="ShowInTop" runat="server" RepeatDirection="Horizontal">
                              <asp:ListItem Selected="True" Value="1">��ʾ</asp:ListItem>
                              <asp:ListItem Value="0">����ʾ</asp:ListItem>
                          </asp:RadioButtonList></td>
                  </tr>
                   <tr<%=MyCache.GetCacheConfig(72)=="0"?" style='display:none'":"" %>>
                      <td align="right" class="lefttd" height="30" style="width: 227px">
                          <strong>����Ŀ���ֻ�����Ŀ��������ʾ</strong>��</td>
                      <td class="righttd">
                          <asp:RadioButtonList ID="RdbShowOn3G" runat="server" RepeatDirection="Horizontal">
                              <asp:ListItem Selected="True" Value="1">��ʾ</asp:ListItem>
                              <asp:ListItem Value="0">����ʾ</asp:ListItem>
                          </asp:RadioButtonList></td>
                   </tr>
                  <tr>
                      <td align="right" class="lefttd" height="30" style="width: 227px">
                          <strong>����Ŀ�Ƿ���ѭ����Ŀ����ʾ</strong>��</td>
                      <td class="righttd">
                          <asp:RadioButtonList ID="ShowInCir" runat="server" RepeatDirection="Horizontal">
                              <asp:ListItem Selected="True" Value="1">��ʾ</asp:ListItem>
                              <asp:ListItem Value="0">����ʾ</asp:ListItem>
                          </asp:RadioButtonList></td>
                  </tr>
                  <tbody id="wnoshow">
                  <tr id="domainarea" runat="server">
                      <td align="right" class="lefttd" height="30" style="width: 227px">
                          <strong>������<font color="#ff0000">(������)</font>�� </strong></td>
                      <td class="righttd">
                          <asp:TextBox CssClass="textbox" ID="ClassDomain" runat="server" Width="378px"></asp:TextBox>
                          <br /><span class="tips">�磺http://news.kesion.com�����治�ܼ�"/"���˹���ֻ��һ����Ŀ��Ч��</span>
                      </td>
                  </tr>
                  <tr>
                    <td  height="30" align="right"  class="lefttd" style="width: 227px">
                        <strong>��ĿMETA�ؼ���</strong>��<br />
                       </td>
                    <td class="righttd">
                        <asp:TextBox CssClass="textbox textarea" ID="MetaKeyWord" runat="server" Rows="3" TextMode="MultiLine" Width="378px" Height="80px"></asp:TextBox>
                        <a class="textarea_min" href="javascript:zoomtextarea(-2,'<%=this.MetaKeyWord.ClientID %>');">
                         </a>
                         <a class="textarea_max" href="javascript:zoomtextarea(2,'<%=this.MetaKeyWord.ClientID %>');">
                          </a><br />  
                         <span class="tips">��������������õĹؼ���</span>
                        </td>
                  </tr>
                  <tr>
                         <td align="right"  class="lefttd" style="height: 76px; width: 227px;">
                             <strong>��ĿMETA��ҳ������<br />
                             </strong></td>
                         <td  class="righttd" style="height: 76px">
                             <asp:TextBox CssClass="textbox textarea" ID="MetaDescript" runat="server" rows="3" TextMode="MultiLine" Width="376px" Height="80px"></asp:TextBox>
                               <a class="textarea_min" href="javascript:zoomtextarea(-2,'<%=this.MetaDescript.ClientID %>');"> </a>
                               <a class="textarea_max" href="javascript:zoomtextarea(2,'<%=this.MetaDescript.ClientID %>');"></a>  
                             <br />
                             <span class="tips">��������������õ���ҳ����</span>
                        </td>
                  </tr>
                </tbody>  
                     </table> 
			
			
        </div>
        
		 <div class="tab-page" id="tab2">
		  <h2 class="tab">����ѡ��</h2>
			<script type="text/javascript">
						 tabPane1.addTabPage( document.getElementById( "tab2" ) );
			</script>
			
            <table width="100%" border="0" cellpadding="1" cellspacing="1" class="CTable">
              <tr>           
                 <td height='30' align='right' class='lefttd' style="width: 199px"><strong>����ѡ�</strong><br /><font color="#ff0000">һ���趨��������ģ��������Ҫ����һЩʱ����������ϢURL���ӡ�</font></td>
               <td height='28' class="righttd">
                   <asp:RadioButtonList ID="CreateHtmlFlag" runat="server">
                       <asp:ListItem Value="1" Selected>����Ŀ���������ɾ�̬HTML���ܣ���<a href='../System/KS.ReWriteRule.aspx' style='color:green;text-decoration:underline'>�������</a>����α��̬��</asp:ListItem>
                       <asp:ListItem Value="2">����������ҳ���ɾ�̬HTML����</asp:ListItem>
                       <asp:ListItem Value="3">����ҳ����Ŀҳ���������ɾ�̬HTML����</asp:ListItem>
                   </asp:RadioButtonList>
                   
                   <div class="tips">&nbsp;TIPS����Ŀģ��������ɸѡ��ǩ����ѡ����Ŀҳ���������ɾ�̬HTML����������޷�ʵ��ɸѡ���ܡ�</div>
                   </td>
             </tr>
                <tr>
                    <td align="right" class="lefttd" height="30" style="width: 199px">
                        <strong>�Զ�����ѡ�</strong>
                        <br /><font color=red>�趨�����/�༭������ʱ�Զ����ɾ�̬HTML��ҳ��</font>
                        </td>
                    <td class="righttd" height="28">
                        <asp:RadioButtonList ID="AutoCreateType" runat="server">
                            <asp:ListItem Value="1">���Զ����ɣ���Ҫ�ֹ����ɣ�</asp:ListItem>
                            <asp:ListItem Value="2">����������ҳ(��֮��������Ŀҳ����Ҫ�ֹ�����)</asp:ListItem>
                            <asp:ListItem Value="3" Selected="True">�Զ���������ҳ����������Ŀҳ&lt;font color=red&gt;���Ƽ���&lt;/font&gt;</asp:ListItem>
                            <asp:ListItem Value="4">�Զ���������ҳ����������Ŀҳ�������ĸ���Ŀҳ</asp:ListItem>
                            <asp:ListItem Value="5">�Զ���������ҳ����վ��ҳ</asp:ListItem>
                            <asp:ListItem Value="6">�Զ���������ҳ������������Ŀҳ����վ��ҳ</asp:ListItem>
                            
                        </asp:RadioButtonList></td>
                </tr>
                <tr id="fsoclassindx" runat="server">
                    <td align="right" class="lefttd" height="30" style="width: 199px">
                        <strong>���ɵ���Ŀ��ҳ�ļ���</strong></td>
                    <td class="righttd" height="28">
                        <asp:TextBox CssClass="textbox" ID="ClassFsoIndex" runat="server" Width="92px" Text="index.html"></asp:TextBox>
                        <select name='SelectClassFsoIndex' onchange="jQuery('#<%=this.ClassFsoIndex.ClientID %>').val(this.value);" id='select2' class='upfile'>
                           <option value='index.html' selected="selected">index.html</option>
                           <option value='index.htm'>index.htm</option>
                           <option value='index.shtm'>index.shtm</option>
                           <option value='index.shtml'>index.shtml</option>
                           <option value='default.html'>default.html</option>
                           <option value='default.htm'>default.htm</option>
                           <option value='default.shtm'>default.shtm</option>
                           <option value='default.shtml'>default.shtml</option>
                           <option value='index.asp'>index.asp</option>
                           <option value='default.asp'>default.asp</option>
                           <option value="index.aspx" >index.aspx</option>           
                           <option value="default.aspx" >default.aspx</option>         
                           </select>
                    </td>
                </tr>
                <tr>
                    <td align="right" class="lefttd" height="30" style="width: 199px">
                        <strong>����ҳ����·������</strong>
                      <br />
                        ���ñ�ǩ��{$ClassDir},{$Year},{$Month},{$Day},{$Hour},{$Minute},{$Second}
                    </td>
                    <td class="righttd" height="28">
                        <asp:TextBox CssClass="textbox" ID="CreateInfoPath" runat="server" Text="{$ClassDir}/" Width="283px"></asp:TextBox>�����룢/������<br />
                        <select name='SelectInfoFsoPath' onchange="if (this.value!=''){jQuery('#<%=this.CreateInfoPath.ClientID %>').val(this.value);}">
                            <option value=''>--����ѡ������·������--</option>
                            <option value='{$ClassDir}/'>{$ClassDir}/</option>
                            <option value='{$ClassDir}/{$Year}-{$Month}/'>{$ClassDir}/{$Year}-{$Month}/</option>
                            <option value='{$ClassDir}/{$Year}/{$Month}/{$Day}/'>{$ClassDir}/{$Year}/{$Month}/{$Day}/</option>
                            <option value='{$Year}/{$Month}/{$Day}/'>{$Year}/{$Month}/{$Day}/</option>
                            <option value='{$Month}/{$Day}/'>{$Month}/{$Day}/</option>
                            <option value='List/{$Month}/'>List/{$Month}/</option>
  
                        </select>
                    </td>
                </tr>
                <tr>
                    <td align="right" class="lefttd" height="30" style="width: 199px">
                        <strong>����ҳ�����ļ�������</strong>
                        <br />
                        ���ñ�ǩ��{$InfoID},{$Year},{$Month},{$Day},{$Hour},{$Minute},{$Second},{$RE}</td>
                    <td class="righttd" height="28">
                        <asp:TextBox CssClass="textbox" ID="CretaeInfoFname" runat="server" Text="{$InfoID}.html" Width="283px"></asp:TextBox><br />
                        <select name='SelectInfoName' onchange="if (this.value!=''){jQuery('#<%=this.CretaeInfoFname.ClientID %>').val(this.value);}">
                            <option value=''>--����ѡ���ļ�������--</option>
                            <option value='{$InfoID}.htm'>{$InfoID}.htm</option>
                            <option value='{$InfoID}.html'>{$InfoID}.html</option>
                            <option value='{$Year}{$InfoID}.html'>{$Year}{$InfoID}.html</option>
                            <option value='{$Year}{$Month}{$InfoID}.html'>{$Year}{$Month}{$InfoID}.html</option>
                            <option value='{$RE}.html'>{$RE}.html</option>
                            <option value='{$RE}.aspx'>{$RE}.aspx</option>
                        </select>
                    </td>
                </tr>
            </table>			
			
        </div>

		 <div class="tab-page" id="tab3">
        <%if (KSCMS.S("from")=="shop"){ %>
		  <h2 class="tab" style="display:none">�շ�ѡ��</h2>
        <%}else{ %>
		  <h2 class="tab">�շ�ѡ��</h2>
		 <%} %>
			<script type="text/javascript">
						 tabPane1.addTabPage( document.getElementById( "tab3" ) );
			</script>
          <table width="100%"  border="0" cellpadding="1" cellspacing="1" class="CTable">
              <tr>
                  <td align="right" class="lefttd" height="30" style="width: 227px">
                      <strong>���/�鿴Ȩ�ޣ�<br />
                      </strong><span style="color: #ff0000">��ʾ���ǿ�����Ŀ���벻Ҫ�������ɾ�̬Html</span></td>
                  <td class="righttd">
                      <asp:RadioButtonList ID="ClassPurview" runat="server">
                          <asp:ListItem Selected="True" Value="0">������Ŀ  &lt;font color=red&gt;�κ��ˣ������οͣ���������Ͳ鿴����Ŀ�µ���Ϣ��&lt;/font&gt;</asp:ListItem>
                          <asp:ListItem Value="1">�뿪����Ŀ  &lt;font color=red&gt;�κ��ˣ������οͣ�������������οͲ��ɲ鿴��������Ա���ݻ�Ա�����ĿȨ�����þ����Ƿ���Բ鿴��&lt;/font&gt;</asp:ListItem>
                          <asp:ListItem Value="2">��֤��Ŀ  &lt;font color=red&gt;�οͲ�������Ͳ鿴��������Ա���ݻ�Ա�����ĿȨ�����þ����Ƿ��������Ͳ鿴��&lt;/font&gt;</asp:ListItem>
                      </asp:RadioButtonList></td>
              </tr>
                  <tr>
                      <td align="right" class="lefttd" height="30" style="width: 227px">
                          <strong>����鿴����Ŀ����Ϣ�Ļ�Ա�飺</strong>
                          <br />
                          <font color=blue>�����Ŀ�ǡ���֤��Ŀ�������ڴ���������鿴����Ŀ����Ϣ�Ļ�Ա��,�������Ϣ�������˲鿴Ȩ�ޣ�������Ϣ�е�Ȩ����������</font>
                          </td>
                      <td class="righttd" ID="ViewGroupIDArea" runat="server">
                          </td>
                  </tr>
              
              <tr>
                  <td align="right" class="lefttd" height="30" style="width: 227px">
                      <strong>Ĭ���Ķ���Ϣ���������<br />
                      </strong><span style="color: #0000ff">�������Ϣ���������Ķ�������������Ϣ�еĵ�����������</span></td>
                  <td class="righttd">
                      &nbsp;<asp:TextBox CssClass="textbox" ID="DefaultReadPoint" Text="0" style="text-align:center" runat="server" Width="55px"></asp:TextBox>
                      ����Ķ�����Ϊ "<font color="red">0</font>"��������Ȩ�޵Ļ�Ա�Ķ�����Ŀ�µ���Ϣʱ��������Ӧ�������οͽ��޷��Ķ���</td>
              </tr>
              <tr>
                  <td align="right" class="lefttd" height="30" style="width: 227px">
                      <strong>Ĭ���Ķ���Ϣ�ظ��շѣ�<br />
                      </strong><font color="blue">�������Ϣ�������˴�ѡ�������Ϣ�е���������</font></td>
                  <td class="righttd">
                      <asp:RadioButtonList ID="DefaultChargeType" runat="server">
                          <asp:ListItem Value="0" Selected=True>���ظ��շ�(�����Ϣ��۵������ܲ鿴������ʹ��)</asp:ListItem>
                          <asp:ListItem Value="1">�����ϴ��շ�ʱ��&lt;input class=textbox type=&quot;text&quot; style=&quot;width:50px;text-align:center;&quot; value=&quot;12&quot; name=&quot;DefaultPitchTime&quot; size=&quot;5&quot;&gt;  Сʱ�������շ�</asp:ListItem>
                          <asp:ListItem Value="2">��Ա�ظ�����Ϣ&lt;input class=textbox type=&quot;text&quot; style=&quot;width:50px;text-align:center;&quot; value=&quot;10&quot; name=&quot;DefaultReadTimes&quot; size=&quot;5&quot;&gt;   ҳ�κ������շ�</asp:ListItem>
                          <asp:ListItem Value="3">�������߶�����ʱ�����շ�</asp:ListItem>
                          <asp:ListItem Value="4">����������һ������ʱ�������շ�</asp:ListItem>
                          <asp:ListItem Value="5">ÿ�Ķ�һҳ�ξ��ظ��շ�һ�Σ����鲻Ҫʹ��,��ҳ��Ϣ���۶�ε�����</asp:ListItem>
                      </asp:RadioButtonList></td>
              </tr>
              <tr>
                  <td align="right" class="lefttd" height="30" style="width: 227px">
                      <strong>Ĭ�Ϸֳɱ�����<br />
                      </strong></td>
                  <td class="righttd">
                      &nbsp;<asp:TextBox CssClass="textbox" ID="DefaultDividePercent" style="text-align:center" Text="0" runat="server" Width="46px"></asp:TextBox>
                      %  <span class="tips">��Ա�ڴ���Ŀ���������ʱ��������Ĭ�ϵķֳɱ���</span></td>
              </tr>
         </table>  			
			
        </div>
        
		 <div class="tab-page" id="tab4">
		  <h2 class="tab">����ѡ��</h2>
			<script type="text/javascript">
						 tabPane1.addTabPage( document.getElementById( "tab4" ) );
			</script>
			
 <table width="100%" border="0" cellpadding="1" cellspacing="1" class="CTable">
                     <tr>
                      <td align="right" class="lefttd" height="30" style="width: 227px">
                          <strong>�����ڱ���Ŀ�����ĵ�</strong>��
                          <br /><span style="color:Blue">�������Ŀ�����ռ���Ŀ����������Ϊ�������ڱ���Ŀ�·���</span>
                          </td>
                      <td class="righttd">
                       <asp:RadioButtonList ID="RdbPubFlag" runat="server" RepeatDirection="Horizontal">
                         <asp:ListItem Value="0">������</asp:ListItem>
                         <asp:ListItem Value="1" Selected>����</asp:ListItem>
                       </asp:RadioButtonList>
                      </td>
                     </tr>
                     <tr>
                      <td align="right" class="lefttd" height="30" style="width: 227px">
                          <strong>����Ŀ�Ƿ�����Ͷ��</strong>��</td>
                      <td class="righttd">
                          <asp:RadioButtonList ID="AllowPubInfo" runat="server" RepeatDirection="Vertical">
                              <asp:ListItem Value="0">�ٲ�����</asp:ListItem>
                              <asp:ListItem Selected="True" Value="1">����ȫ����Ͷ��(<font color=blue>�����ο�</font>)</asp:ListItem>
                              <asp:ListItem Value="2">��ֻ���Ż�ԱͶ��(<font color=red>�οͳ���</font>)</asp:ListItem>
                              <asp:ListItem Value="3">��ֻ����ָ���Ļ�Ա��Ͷ��</asp:ListItem>
                          </asp:RadioButtonList></td>
                  </tr>
                  <tr>
                  <td align="right" class="lefttd" height="30" style="width: 227px">
                      <strong>�������Ŀ��Ͷ��Ļ�Ա�飺</strong>
                      <br />
                      <font color="blue">�������Ŀ����Ͷ��ѡ������ڢ���ʱ�����ڴ����������ڴ���Ŀ��Ͷ��Ļ�Ա��</font>
                  </td>
                  <td class="righttd" ID="PubGroupIDArea" runat="server">
                  </td>
              </tr>
              <tr>
                      <td align="right" class="lefttd" style="width: 227px;height:30px">
                          <strong>�ڴ���Ŀ�������۽���</strong>��<br />
                         </td>
                      <td class="righttd">
                         <asp:TextBox ID="TxtCmtAddScore" CssClass="textbox" Text="0" style="text-align:center" runat="server" Width="37px"></asp:TextBox>���֣�Ϊ0ʱ��������<span class="tips">ֻ��ͨ����˵ĵ����۲Ž���,�������ý������ֵ����������������Ҫ��̨��˲���ʾ��</span>
                      </td>
              </tr>
              <tr>
                      <td align="right" class="lefttd" style="width: 227px;height:30px">
                          <strong>��ԱͶ�影��</strong>��<br />
                          <span style="color: #ff0033">�ڻ�Ա���ķ�����Ϣ����ͨ����˺�Ľ�����ʩ</span></td>
                      <td class="righttd">
                          <span style="display:none">��Աÿ����һ����Ϣ�����Եõ�<asp:TextBox ID="PubAddMoney" Text="0" style="text-align:center" runat="server" Width="37px"></asp:TextBox>Ԫ����ң�Ϊ0ʱ��������<span class="tips">ֻ��ͨ����̨��˵Ĳ�����</span><br /></span>
                          ��Աÿ����һ����Ϣ�����Եõ�<asp:TextBox CssClass="textbox" ID="PubAddPoint" Text="0" style="text-align:center" runat="server" Width="37px"></asp:TextBox><%=MyCache.GetCacheConfig(50) %><%=MyCache.GetCacheConfig(49) %>��Ϊ0ʱ��������<span class="tips">ֻ��ͨ����̨��˵Ĳ�����</span><br />
                          ��Աÿ����һ����Ϣ�����Եõ�<asp:TextBox CssClass="textbox" ID="PubAddScore" Text="0" style="text-align:center" runat="server" Width="37px"></asp:TextBox>�ֻ��֣�Ϊ0ʱ��������<span class="tips">ֻ��ͨ����̨��˵Ĳ�����</span><br />
                      </td>
              </tr>
               <tr>
                  <td align="right" class="lefttd" height="30" style="width: 227px">
                      <strong>�����ť���ͻ��֣�<br />
                      </strong></td>
                  <td class="righttd">
                      &nbsp;<asp:TextBox CssClass="textbox" Text="0" ID="TxtShareAddScore" style="text-align:center" runat="server" Width="46px"></asp:TextBox>
                      ��
                      <span class="tips">һ����Ա�������ť�ͻ����ͻ��֡�
                      <br />
                      ����ť������Ͻű���onclick="return(addScore({KS:Field:ClassID},{KS:Field:InfoID}))"
                      <br />�磺
                     &lt;A onclick="return(addScore({KS:Field:ClassID},{KS:Field:InfoID}));" class=bshare-qzone title=����QQ�ռ�>&lt;/A>


                      </span>
                      </td>
              </tr>
              <tr>
                    <td align="right" class="lefttd" style="width:227px;height:30px"><strong>����������Ŀ����ͨ����Ա</strong></td>
                    <td class="righttd">
                        <asp:CheckBoxList ID="CkbAdminPurview" runat="server" RepeatColumns="5" RepeatDirection="Horizontal">
                        </asp:CheckBoxList>
                    </td>
              </tr>   
         </table>  			
        </div>
        
		 <div class="tab-page" id="tab5">
		  <h2 class="tab">��������</h2>
			<script type="text/javascript">
						 tabPane1.addTabPage( document.getElementById( "tab5" ) );
			</script>
			
 <table width="100%" border="0" cellpadding="1" cellspacing="1" class="CTable">
         <tr>           
             <td height='30' align='right' width='210' class='lefttd'><strong>������������</strong></td>
           <td height='28' class="righttd">
              &nbsp;<select name="ClassDefine_Num" id="ClassDefine_Num" onChange="setFileFileds(this.value)"><option value="1" selected>1</option><option value="2">2</option><option value="3">3</option><option value="4">4</option><option value="5">5</option><option value="6">6</option><option value="7">7</option><option value="8">8</option><option value="9">9</option><option value="10">10</option><option value="11">11</option><option value="12">12</option><option value="13">13</option><option value="14">14</option><option value="15">15</option><option value="16">16</option><option value="17">17</option><option value="18">18</option><option value="19">19</option><option value="20">20</option> </select>             </td>
         </tr>
         
         <%for (int i = 1; i <= 20; i++)
           {
           %>
           <tbody id="define<%=i %>" style="display:none">
         <tr>           
          <td height='30' align='right' width='210' class='lefttd'><strong>��������<%=i %>��</strong><br> <font color=blue>����Ŀģ��ҳ����{$GetClassDefineContent<%=i %>} ����</font>
             </td>
             <td class="righttd">&nbsp;<textarea class="textbox textarea" cols="10" id='ClassDefineContent<%=i %>' Name='ClassDefineContent<%=i %>' style='width:700px;height:100px'><% try
                {
                    Response.Write(param[i - 1].ToString());
                }
               catch{}%></textarea> 
                <a class="textarea_min" href="javascript:zoomtextarea(-5,'ClassDefineContent<%=i %>');"></a>
                <a class="textarea_max" href="javascript:zoomtextarea(5,'ClassDefineContent<%=i %>');">

             </td>
         </tr>
         </tbody>
         <%} %>
         </table>			
			
        </div>
        
       </div>

      
      <div style="clear:both;text-align:center"><br />
          <KS:Foot ID="Foot1" runat="server" OnSubmit="SaveButton_Click" />
      </div>
        </asp:Panel>
        
        
     
      
      
 </asp:Content>