<%@ Page Language="C#" ValidateRequest="false" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.Admin_Class" Title="栏目管理" Codebehind="KS.Class.aspx.cs" %>
<%@ Import Namespace="Kesion.Cache" %>
<%@ Import Namespace="Kesion.Publics" %>
<asp:Content ID="Content1" ContentPlaceHolderID="KSContent" Runat="Server">
         
     <asp:Panel ID="ClassList" runat="server" Width="100%">
     <div id="manage_top" class="menu_top_fixed">
       <ul>
        <span style="float:right;">
          <asp:DropDownList ID="DropChannelID" runat="server" style="WIDTH: 150px;">
           <asp:ListItem Value="0">--按模型查看--</asp:ListItem>
          </asp:DropDownList>
        </span>

         <li id='p1'><asp:LinkButton ID="addbutton" runat="server" OnClick="lbtaddmodel_Click"><b></b>添加栏目</asp:LinkButton></li>
         <li id='p3'><asp:LinkButton ID="delbutton" runat="server" OnClientClick="if (GetIDS('del')){return true}else{return false}" onclick="BtnDelete_Click"><b></b>删除栏目</asp:LinkButton></li>
         <li id='p5'><asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click"><b></b>一级排序</asp:LinkButton></li>
          <li id='p7'><asp:LinkButton ID="LinkButton2" runat="server" OnClick="LinkButton2_Click"><b></b>N 级排序</asp:LinkButton></li>
         <li id='p14'><asp:LinkButton ID="attribbutton" runat="server" OnClick="attribbutton_Click"><b></b>批量设置</asp:LinkButton></li>
         <li id='p11'><a href="KS.ClassMerge.Aspx?from=<%=KSCMS.S("from") %>"><b></b>栏目合并</a></li>
         <li id='p2'><a href="KS.ClassMove.Aspx?from=<%=KSCMS.S("from") %>"><b></b>移动文档</a></li>
         <li id='p10'><asp:LinkButton ToolTip="一键更新文档数" ID="LinkButton3" runat="server" onclick="LinkButton3_Click"><b></b>一键更新</asp:LinkButton></li>
         <li id='p10'><asp:LinkButton ToolTip="一键修正栏目排序" ID="LinkButton4" runat="server" OnClick="LinkButton4_Click"><b></b>修正排序</asp:LinkButton></li>

            <%if (from!="shop"){ %>
         <li id='p15'><a href="javascript:;" onclick="refreshClass()"><b></b>批量生成HTML</a></li>
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
            top.openWin("生成静态HTML操作", "refresh/KS.RefreshHtml.aspx?action=refreshClass&classid=" + sid, false, 600, 250);
        } else {
            KesionJS.Alert("请选择要发布的栏目！");
        }
    }
    function ExtSub(ID,event) {

        //阻止冒泡调用parent
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
                <th width="50">栏目ID</th>
               <th scope="col"  width="600" style="text-align:left">栏目名称 (<a class="tips" style="font-weight:normal" href="KS.Class.aspx?flag=showall&<%=UtilsQueryParam.Get("flag") %>">展开</a>)</th>
              
               <%if (KSCMS.S("from").Equals("shop")){ %>
                <th scope="col">商品规格</th>
               <%} %>
               <th scope="col">序号</th>
               <th scope="col" width="35">编辑</th>
               <th scope="col" width="35">删除</th>
               <th scope="col" width="35">清空</th>
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
                <a <%# Convert.ToInt16(Eval("classtype")) == 1?" style='color:#999;'":" style='display:none'" %> href="KS.Class.Aspx?action=add&parentid=<%# Eval("classid") %><%=urlParam %>">添加子栏目</a>
                <a href='<%# GetClassUrl(Convert.ToInt32(Eval("ClassID"))) %>'target="_blank" style="color:#999">预览</a>
                <a <%# Convert.ToInt16(Eval("classtype")) == 3?" ":" style='display:none'"%> href='KS.SinglePage.aspx?classid=<%# Eval("ClassID") %>' style="color:#999">编辑内容</a>
               </span>

               </td>
           <%if (KSCMS.S("from").Equals("shop")){ %>
               <td class="Ctd" align="center"><span class="tips"><%# GetProSpecialName(Utils.StrToInt(Eval("ProSpecialID")))%></span></td>
           <%} %>
             <td class="Ctd" align="center"><%# Container.ItemIndex + 1 + (CurrPage - 1) * PageSize%></td>
             <td class="Ctd" align="center"><a class="edit" title="编辑" href="KS.Class.Aspx?action=edit&classid=<%# Eval("classid") %><%=urlParam %>"></a></td>
             <td class="Ctd" align="center"><a  class="delete" title="删除栏目" href="KS.Class.Aspx?Action=del&Ids=<%# Eval("classid") %><%=urlParam %>" onclick="return(confirm('此操作不可逆，确定删除栏目吗?'));"></a></td>
             <td class="Ctd" align="center"><a  class="del" title="清空栏目数据" href='KS.Class.Aspx?Action=delinfo&Ids=<%# Eval("classid") %><%=urlParam %>' onclick="return(confirm('清空栏目将把栏目（包括子栏目）的所有文档删除！确定要清空此栏目吗？'));"></a></td>

            </tr>
          </ItemTemplate>
          <FooterTemplate>
           <tr style="display:<%# bool.Parse((list.Items.Count==0).ToString())?"":"none"%>">
                <td class="Ctd" style="text-align:center" colspan="10">
                 <asp:LinkButton ID="addbutton" runat="server" OnClick="lbtaddmodel_Click" > 还没有添加任何分类，点此添加分类&raquo;</asp:LinkButton>
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
                      jQuery('#<%=this.ClassTemplate.ClientID %>').val('{$TemplateDir}/'+val+'/栏目页.html');
                      jQuery('#<%=this.ContentTemplate.ClientID %>').val('{$TemplateDir}/'+val+'/内容页.html');
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
	            KesionJS.Alert('请输入栏目名称！', "jQuery('#<%=this.ClassName.ClientID %>').focus()");
	           return false;
	         }else if (jQuery("#AddType")[0].checked==true&&jQuery('#<%=this.TxtMoreClassName.ClientID %>').val()==''){
          	   KesionJS.Alert('请按格式输入栏目名称和英文名称！', "jQuery('#<%=this.TxtMoreClassName.ClientID %>').focus()");
	           return false;
             }else if (jQuery("#AddType")[0].checked==true&&jQuery('#<%=this.TxtMoreClassName.ClientID %>').val().indexOf('|')==-1){
          	   KesionJS.Alert('请按格式输入栏目名称和英文名称,格式为：栏目中文名称|栏目英文名称！', "jQuery('#<%=this.TxtMoreClassName.ClientID %>').focus()");
	           return false;
             }
	       if (jQuery('#<%=this.ChannelID.ClientID %>').val() == '0') {
	           KesionJS.Alert('请选择绑定的模型！', "jQuery('#<%=this.ChannelID.ClientID %>').focus()");
	           return false;
	       }
	       var classtype = jQuery("#<%=this.ClassType.ClientID%> :radio[checked]").val();
	           
	      if (classtype==1){
                     
                   
                     if (jQuery('#<%=this.ClassEname.ClientID %>').val()=='' && jQuery("#AddType")[0].checked==false)
                      {
                       KesionJS.Alert('请输入栏目英文名称！',"jQuery('#<%=this.ClassEname.ClientID %>').focus()");
                       return false;}
                     if (jQuery('#<%=this.ClassTemplate.ClientID %>').val()=='')
                      {
                       KesionJS.Alert('请绑定栏目模板！',"jQuery('#<%=this.ClassTemplate.ClientID %>').focus()");
                       return false;
                      }
                     if(jQuery('#<%=this.ContentTemplate.ClientID %>').val()=='')
                      {
                       KesionJS.Alert('<%=KSCMS.GetInstallDir() %>',1,'请绑定内容页模板！',"jQuery('#<%=this.ContentTemplate.ClientID %>').focus()");
                       return false;
                      }
                     }
                   else if(classtype==2&&(jQuery('#<%=this.LinkUrl.ClientID %>').val()==''||jQuery('#<%=this.LinkUrl.ClientID %>').val()=='http://')){
                    KesionJS.Alert('请输入外部频道链接地址！',"jQuery('#<%=this.LinkUrl.ClientID %>').focus()");
                    return false;}
                   else if(classtype==3){
                    if (jQuery('#<%=this.SingleFname.ClientID %>').val()==''){
                    KesionJS.Alert('请输入单页生成文件名！',"jQuery('#<%=this.SingleFname.ClientID %>').focus()");
                    return false;
                }
                
                    if (jQuery('#<%=this.ClassTemplate.ClientID %>').val()=='')
                      {
                       KesionJS.Alert('请绑定栏目模板！',"jQuery('#<%=this.ClassTemplate.ClientID %>').focus()");
                       return false;
                      }
                }
	         
	        }
	        //-->
	    </script>
	    

        <KS:TopNav ID="TopNav1" runat="server" Text="添加新栏目" />
        
       	<div class="tab-page" id="ClassPanel">
         <script type="text/javascript">
           var tabPane1 = new WebFXTabPane( document.getElementById( "ClassPanel" ), 1 )
         </script>
             
		 <div class="tab-page" id="tab0">
		  <h2 class="tab">基本信息</h2>
			<script type="text/javascript">
						 tabPane1.addTabPage( document.getElementById( "tab0" ) );
			</script>
			
             <table width="100%" border="0" cellpadding="1" cellspacing="1" class="CTable">
				   <tr>
                       <td align="right" class="lefttd" style="width: 200px; height: 37px;"><strong>
                           所属栏目：</strong>
                         </td>
                         <td  class="righttd" style="height: 37px">
                             <asp:DropDownList ID="ParentID" runat="server">
                             <asp:ListItem Value="0">-无（作为一级栏目）-</asp:ListItem>
                             </asp:DropDownList>&nbsp;
                             <span id="ParentIDMessage" runat="server"></span>
                             <span class="tips">不能指定为外部频道或单页栏目</span>
                       </td>
                     </tr>
                     
                     
                     
              <tr>
                    <td class="lefttd" height="30" align="right" > <strong> 栏目名称：</strong></td>
                    <td class="righttd">
                     <span id="AddOne">
                        <asp:TextBox CssClass="textbox" ID="ClassName" runat="server"></asp:TextBox>
                        <span class="red">*</span>
                        <span class="tips">请输入栏目的中文名称，如新闻中心。</span>
                     </span>
                     
                     <label style="<%=KSCMS.S("action")=="edit"?"display:none;":"" %>font-weight:bold;color:Green"><input onclick="CheckAddMode()" type="checkbox" name="AddType" id="AddType" value="1" />切换到批量添加模式</label>
                     <div id="AddMore" style="display:none">
                      <font color=red>录入格式:栏目中文名称|英文名称,说明每行一个</font><br />
                      <asp:TextBox Text="栏目名称1|英文名称1" ID="TxtMoreClassName" runat="server" CssClass="textbox textarea" TextMode="MultiLine" Width="480px" Height="150px"></asp:TextBox>
                         <a class="textarea_min" href="javascript:zoomtextarea(-2,'<%=this.TxtMoreClassName.ClientID %>');"></a>
                         <a class="textarea_max" href="javascript:zoomtextarea(2,'<%=this.TxtMoreClassName.ClientID %>');"></a>  

                     </div>
                    
                    </td>
                  </tr>

                  <tr id="AddEOne">
                    <td  class="lefttd" align="right" style="height: 48px"><strong>栏目类型：</strong><br />
                     </td>
                    <td  class="righttd" style="height: 48px">
                       
                         <asp:RadioButtonList ID="ClassType" runat="server" RepeatDirection="Horizontal" OnSelectedIndexChanged="ClassType_SelectedIndexChanged">
                            <asp:ListItem Value="1">系统栏目</asp:ListItem>
                            <asp:ListItem Value="2">外部栏目</asp:ListItem>
                            <asp:ListItem Value="3">单页面</asp:ListItem>
                        </asp:RadioButtonList>
                        <span class="tips">类型添加后就不能更改，请慎重选择</span>
						<div id="ShowOutArea" runat="server" style="display:none">
						链接地址：<asp:TextBox CssClass="textbox" ID="LinkUrl" runat="server" Width="248px">http://</asp:TextBox>
						</div>
						<div id="ShowSingleArea" runat="server" style="display:none">
                        <asp:DropDownList ID="DrpSinglePageHtml" runat="server" Visible="false">
                         <asp:ListItem Value="1">单页面不启用生成HTML功能</asp:ListItem>
                         <asp:ListItem Value="3">单页面启用生成静态HTML功能</asp:ListItem>
                        </asp:DropDownList>
						 <div>生成的单页文件名：<asp:TextBox CssClass="textbox" ID="SingleFname" runat="server"></asp:TextBox><font color=red>如 about.html,intro.html等</font></div>
                         <div class="tips">单页面生成路径为：模型设置的总生成路径+单页文件名。</div>
						</div>
						<div id="ShowEnameArea" runat="server">
                        英文名称：<asp:TextBox CssClass="textbox" ID="ClassEname" runat="server" onblur="CheckEnglishStr(this,'栏目的英文名称')"></asp:TextBox>&nbsp;<span style="color: #ff0000">*只能填写英文和数字的组合,不能带\/：*？“ &lt; &gt; | 等特殊符号</span>
						</div>
                       
						</td>
                  </tr>
                  <tr id="ModelArea">
                       <td align="right" class="lefttd" style="height: 37px;"><strong> 绑定模型：</strong></td>
                         <td class="righttd" style="height: 37px">
                             <asp:DropDownList ID="ChannelID" runat="server">
                             <asp:ListItem Value="0">--选择隶属模型--</asp:ListItem>
                             </asp:DropDownList>&nbsp;
                             <span id="Span1" runat="server"><a href="../Model/KS.Model.aspx">管理系统模型</a></span>
                       </td>
                     </tr>
                 
                  <tr<%=KSCMS.S("from").Equals("shop")?"":" style='display:none'" %>>
                       <td align="right" class="lefttd" style="height: 37px;"><strong> 绑定商品规格组：</strong></td>
                         <td class="righttd">
                             <asp:DropDownList ID="DrpProSpecialID" runat="server">
                             <asp:ListItem Value="0">--选择绑定的商品规格--</asp:ListItem>
                             </asp:DropDownList>&nbsp;
                            
                       </td>
                     </tr>

                   
                <tr id="IntroArea">
                    <td align="right"  class="lefttd" style="height: 50px;">
                        <strong>栏目介绍：</strong><br />
                       </td>
                    <td  class="righttd" style="height: 50px">
                        <asp:TextBox CssClass="textbox textarea" ID="ClassIntro" runat="server" rows="2" TextMode="MultiLine" Width="480px" Height="60px"></asp:TextBox>
                        <a class="textarea_min" href="javascript:zoomtextarea(-2,'<%=this.ClassIntro.ClientID %>');"></a>
                         <a class="textarea_max" href="javascript:zoomtextarea(2,'<%=this.ClassIntro.ClientID %>');"></a>  
                        <br />
                         <span class="tips">用于在栏目页的介绍信息，支持HTML</span>
                        </td>
                  </tr>
                  <tr>
                    <td  height="30" class="lefttd" align="right" >
                        <strong>栏目图片：</strong><br />
                       </td>
                    <td class="righttd">
                        <table cellspacing="0" cellpadding="0"><tr><td><asp:TextBox CssClass="textbox" ID="ClassImg" runat="server" Width="480px"></asp:TextBox>&nbsp;<input type="button" class="button" onclick="SelectFiles('<%=this.ClassImg.ClientID %>    ',0);" value="选择图片"></td>
                            <td style="padding-left:4px;padding-top:12px;"> <%=Kesion.APPCode.UploadAPI.EchoUpload("classpic",this.ClassImg.ClientID) %></td>
                               </tr></table>
                         <span class="tips">用于在栏目页显示指定的图片</span>

                    </td>
              </tr>
         <tbody id="ClassTemplateArea">
              <tr>
                <td align="right" class="lefttd">
                    <strong>WEB版栏目模板：</strong></td>
                <td class="righttd" style="height: 30px">
                    <asp:TextBox CssClass="textbox" ID="ClassTemplate" runat="server" Width="480px"></asp:TextBox>
                    <input type="button" class="button" onmouseover="this.className='button_on';" onmouseout="this.className='button';" value="选择模板..." onClick="SelectTemplate('<%=this.ClassTemplate.ClientID %>');"/></td>
            </tr>
              <tr<%=MyCache.GetCacheConfig(72)=="0"?" style='display:none'":"" %>>
                <td align="right" class="lefttd">
                    <strong>手机版栏目模板：</strong></td>
                <td class="righttd" style="height: 30px">
                    <asp:TextBox ID="TxtClass3GTemplate" runat="server" CssClass="textbox" 
                        Width="480px"></asp:TextBox>
                    <input class="button" 
                        onClick="SelectTemplate('<%=this.TxtClass3GTemplate.ClientID %>');" 
                        onmouseout="this.className='button';" onmouseover="this.className='button_on';" 
                        type="button" value="选择模板..." /></td>
              </tr>
            </tbody>
           <tbody id="ContentTemplateArea">
            <tr>
                <td align="right" class="lefttd">
                    <strong>WEB版内容页模板：</strong></td>
                <td class="righttd" style="height: 30px">
                    <asp:TextBox CssClass="textbox" ID="ContentTemplate" runat="server" Width="480px"></asp:TextBox>
                    <input type="button"  class="button" onmouseover="this.className='button_on';" onmouseout="this.className='button';" value="选择模板..." onClick="SelectTemplate('<%=this.ContentTemplate.ClientID %>');"/>
                    <asp:CheckBox  ID="CkbUpdateTemplate" runat="server" Text="同步更新已添加的内容页模板" Checked="true" />     
               </td>
            </tr>
               <tr<%=MyCache.GetCacheConfig(72)=="0"?" style='display:none'":"" %>>
                <td align="right" class="lefttd">
                    <strong>手机版内容页模板：</strong></td>
                <td class="righttd" style="height: 30px">
                    <asp:TextBox ID="TxtContent3GTemplate" runat="server" CssClass="textbox" 
                        Width="480px"></asp:TextBox>
                    <input class="button" 
                        onClick="SelectTemplate('<%=this.TxtContent3GTemplate.ClientID %>');" 
                        onmouseout="this.className='button';" onmouseover="this.className='button_on';" 
                        type="button" value="选择模板..." />
                    <asp:CheckBox ID="CkbUpdate3GTemplate" runat="server" Checked="true" 
                        Text="同步更新已添加的内容页模板" />     
               </td>
               </tr>
            </tbody>
          </table>	

        </div>
      
		 <div class="tab-page" id="tab1">
		  <h2 class="tab">栏目选项</h2>
			<script type="text/javascript">
						 tabPane1.addTabPage( document.getElementById( "tab1" ) );
			</script>
			
              <table width="100%" border="0" cellpadding="1" cellspacing="1" class="CTable">
                  <tr>
                      <td align="right" class="lefttd" height="30" style="width: 227px">
                          <strong>本栏目是否在顶部导航中显示</strong>：</td>
                      <td class="righttd">
                          <asp:RadioButtonList ID="ShowInTop" runat="server" RepeatDirection="Horizontal">
                              <asp:ListItem Selected="True" Value="1">显示</asp:ListItem>
                              <asp:ListItem Value="0">不显示</asp:ListItem>
                          </asp:RadioButtonList></td>
                  </tr>
                   <tr<%=MyCache.GetCacheConfig(72)=="0"?" style='display:none'":"" %>>
                      <td align="right" class="lefttd" height="30" style="width: 227px">
                          <strong>本栏目在手机版栏目导航里显示</strong>：</td>
                      <td class="righttd">
                          <asp:RadioButtonList ID="RdbShowOn3G" runat="server" RepeatDirection="Horizontal">
                              <asp:ListItem Selected="True" Value="1">显示</asp:ListItem>
                              <asp:ListItem Value="0">不显示</asp:ListItem>
                          </asp:RadioButtonList></td>
                   </tr>
                  <tr>
                      <td align="right" class="lefttd" height="30" style="width: 227px">
                          <strong>本栏目是否在循环栏目中显示</strong>：</td>
                      <td class="righttd">
                          <asp:RadioButtonList ID="ShowInCir" runat="server" RepeatDirection="Horizontal">
                              <asp:ListItem Selected="True" Value="1">显示</asp:ListItem>
                              <asp:ListItem Value="0">不显示</asp:ListItem>
                          </asp:RadioButtonList></td>
                  </tr>
                  <tbody id="wnoshow">
                  <tr id="domainarea" runat="server">
                      <td align="right" class="lefttd" height="30" style="width: 227px">
                          <strong>绑定域名<font color="#ff0000">(子域名)</font>： </strong></td>
                      <td class="righttd">
                          <asp:TextBox CssClass="textbox" ID="ClassDomain" runat="server" Width="378px"></asp:TextBox>
                          <br /><span class="tips">如：http://news.kesion.com，后面不能加"/"，此功能只对一级栏目有效。</span>
                      </td>
                  </tr>
                  <tr>
                    <td  height="30" align="right"  class="lefttd" style="width: 227px">
                        <strong>栏目META关键词</strong>：<br />
                       </td>
                    <td class="righttd">
                        <asp:TextBox CssClass="textbox textarea" ID="MetaKeyWord" runat="server" Rows="3" TextMode="MultiLine" Width="378px" Height="80px"></asp:TextBox>
                        <a class="textarea_min" href="javascript:zoomtextarea(-2,'<%=this.MetaKeyWord.ClientID %>');">
                         </a>
                         <a class="textarea_max" href="javascript:zoomtextarea(2,'<%=this.MetaKeyWord.ClientID %>');">
                          </a><br />  
                         <span class="tips">针对搜索引擎设置的关键词</span>
                        </td>
                  </tr>
                  <tr>
                         <td align="right"  class="lefttd" style="height: 76px; width: 227px;">
                             <strong>栏目META网页描述：<br />
                             </strong></td>
                         <td  class="righttd" style="height: 76px">
                             <asp:TextBox CssClass="textbox textarea" ID="MetaDescript" runat="server" rows="3" TextMode="MultiLine" Width="376px" Height="80px"></asp:TextBox>
                               <a class="textarea_min" href="javascript:zoomtextarea(-2,'<%=this.MetaDescript.ClientID %>');"> </a>
                               <a class="textarea_max" href="javascript:zoomtextarea(2,'<%=this.MetaDescript.ClientID %>');"></a>  
                             <br />
                             <span class="tips">针对搜索引擎设置的网页描述</span>
                        </td>
                  </tr>
                </tbody>  
                     </table> 
			
			
        </div>
        
		 <div class="tab-page" id="tab2">
		  <h2 class="tab">生成选项</h2>
			<script type="text/javascript">
						 tabPane1.addTabPage( document.getElementById( "tab2" ) );
			</script>
			
            <table width="100%" border="0" cellpadding="1" cellspacing="1" class="CTable">
              <tr>           
                 <td height='30' align='right' class='lefttd' style="width: 199px"><strong>生成选项：</strong><br /><font color="#ff0000">一旦设定不建议更改，否则可能要花费一些时间来更新信息URL链接。</font></td>
               <td height='28' class="righttd">
                   <asp:RadioButtonList ID="CreateHtmlFlag" runat="server">
                       <asp:ListItem Value="1" Selected>本栏目不启用生成静态HTML功能（可<a href='../System/KS.ReWriteRule.aspx' style='color:green;text-decoration:underline'>点此设置</a>启用伪静态）</asp:ListItem>
                       <asp:ListItem Value="2">仅启用内容页生成静态HTML功能</asp:ListItem>
                       <asp:ListItem Value="3">内容页及栏目页都启用生成静态HTML功能</asp:ListItem>
                   </asp:RadioButtonList>
                   
                   <div class="tips">&nbsp;TIPS：栏目模板若放上筛选标签，请选择栏目页不启用生成静态HTML。否则可能无法实现筛选功能。</div>
                   </td>
             </tr>
                <tr>
                    <td align="right" class="lefttd" height="30" style="width: 199px">
                        <strong>自动生成选项：</strong>
                        <br /><font color=red>设定＂添加/编辑＂内容时自动生成静态HTML的页面</font>
                        </td>
                    <td class="righttd" height="28">
                        <asp:RadioButtonList ID="AutoCreateType" runat="server">
                            <asp:ListItem Value="1">不自动生成（需要手工生成）</asp:ListItem>
                            <asp:ListItem Value="2">仅生成内容页(与之关联的栏目页等需要手工生成)</asp:ListItem>
                            <asp:ListItem Value="3" Selected="True">自动生成内容页和所属的栏目页&lt;font color=red&gt;（推荐）&lt;/font&gt;</asp:ListItem>
                            <asp:ListItem Value="4">自动生成内容页和所属的栏目页及关联的父栏目页</asp:ListItem>
                            <asp:ListItem Value="5">自动生成内容页和网站首页</asp:ListItem>
                            <asp:ListItem Value="6">自动生成内容页和所关联的栏目页及网站首页</asp:ListItem>
                            
                        </asp:RadioButtonList></td>
                </tr>
                <tr id="fsoclassindx" runat="server">
                    <td align="right" class="lefttd" height="30" style="width: 199px">
                        <strong>生成的栏目首页文件：</strong></td>
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
                        <strong>内容页生成路径规则：</strong>
                      <br />
                        可用标签：{$ClassDir},{$Year},{$Month},{$Day},{$Hour},{$Minute},{$Second}
                    </td>
                    <td class="righttd" height="28">
                        <asp:TextBox CssClass="textbox" ID="CreateInfoPath" runat="server" Text="{$ClassDir}/" Width="283px"></asp:TextBox>必须与＂/＂结束<br />
                        <select name='SelectInfoFsoPath' onchange="if (this.value!=''){jQuery('#<%=this.CreateInfoPath.ClientID %>').val(this.value);}">
                            <option value=''>--快速选择内容路径规则--</option>
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
                        <strong>内容页生成文件名规则：</strong>
                        <br />
                        可用标签：{$InfoID},{$Year},{$Month},{$Day},{$Hour},{$Minute},{$Second},{$RE}</td>
                    <td class="righttd" height="28">
                        <asp:TextBox CssClass="textbox" ID="CretaeInfoFname" runat="server" Text="{$InfoID}.html" Width="283px"></asp:TextBox><br />
                        <select name='SelectInfoName' onchange="if (this.value!=''){jQuery('#<%=this.CretaeInfoFname.ClientID %>').val(this.value);}">
                            <option value=''>--快速选择文件名规则--</option>
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
		  <h2 class="tab" style="display:none">收费选项</h2>
        <%}else{ %>
		  <h2 class="tab">收费选项</h2>
		 <%} %>
			<script type="text/javascript">
						 tabPane1.addTabPage( document.getElementById( "tab3" ) );
			</script>
          <table width="100%"  border="0" cellpadding="1" cellspacing="1" class="CTable">
              <tr>
                  <td align="right" class="lefttd" height="30" style="width: 227px">
                      <strong>浏览/查看权限：<br />
                      </strong><span style="color: #ff0000">提示：非开放栏目，请不要启用生成静态Html</span></td>
                  <td class="righttd">
                      <asp:RadioButtonList ID="ClassPurview" runat="server">
                          <asp:ListItem Selected="True" Value="0">开放栏目  &lt;font color=red&gt;任何人（包括游客）可以浏览和查看此栏目下的信息。&lt;/font&gt;</asp:ListItem>
                          <asp:ListItem Value="1">半开放栏目  &lt;font color=red&gt;任何人（包括游客）都可以浏览。游客不可查看，其他会员根据会员组的栏目权限设置决定是否可以查看。&lt;/font&gt;</asp:ListItem>
                          <asp:ListItem Value="2">认证栏目  &lt;font color=red&gt;游客不能浏览和查看，其他会员根据会员组的栏目权限设置决定是否可以浏览和查看。&lt;/font&gt;</asp:ListItem>
                      </asp:RadioButtonList></td>
              </tr>
                  <tr>
                      <td align="right" class="lefttd" height="30" style="width: 227px">
                          <strong>允许查看此栏目下信息的会员组：</strong>
                          <br />
                          <font color=blue>如果栏目是“认证栏目”，请在此设置允许查看此栏目下信息的会员组,如果在信息中设置了查看权限，则以信息中的权限设置优先</font>
                          </td>
                      <td class="righttd" ID="ViewGroupIDArea" runat="server">
                          </td>
                  </tr>
              
              <tr>
                  <td align="right" class="lefttd" height="30" style="width: 227px">
                      <strong>默认阅读信息所需点数：<br />
                      </strong><span style="color: #0000ff">如果在信息中设置了阅读点数，则以信息中的点数设置优先</span></td>
                  <td class="righttd">
                      &nbsp;<asp:TextBox CssClass="textbox" ID="DefaultReadPoint" Text="0" style="text-align:center" runat="server" Width="55px"></asp:TextBox>
                      免费阅读请设为 "<font color="red">0</font>"，否则有权限的会员阅读该栏目下的信息时将消耗相应点数，游客将无法阅读。</td>
              </tr>
              <tr>
                  <td align="right" class="lefttd" height="30" style="width: 227px">
                      <strong>默认阅读信息重复收费：<br />
                      </strong><font color="blue">如果在信息中设置了此选项，则以信息中的设置优先</font></td>
                  <td class="righttd">
                      <asp:RadioButtonList ID="DefaultChargeType" runat="server">
                          <asp:ListItem Value="0" Selected=True>不重复收费(如果信息需扣点数才能查看，建议使用)</asp:ListItem>
                          <asp:ListItem Value="1">距离上次收费时间&lt;input class=textbox type=&quot;text&quot; style=&quot;width:50px;text-align:center;&quot; value=&quot;12&quot; name=&quot;DefaultPitchTime&quot; size=&quot;5&quot;&gt;  小时后重新收费</asp:ListItem>
                          <asp:ListItem Value="2">会员重复阅信息&lt;input class=textbox type=&quot;text&quot; style=&quot;width:50px;text-align:center;&quot; value=&quot;10&quot; name=&quot;DefaultReadTimes&quot; size=&quot;5&quot;&gt;   页次后重新收费</asp:ListItem>
                          <asp:ListItem Value="3">上述两者都满足时重新收费</asp:ListItem>
                          <asp:ListItem Value="4">上述两者任一个满足时就重新收费</asp:ListItem>
                          <asp:ListItem Value="5">每阅读一页次就重复收费一次（建议不要使用,多页信息将扣多次点数）</asp:ListItem>
                      </asp:RadioButtonList></td>
              </tr>
              <tr>
                  <td align="right" class="lefttd" height="30" style="width: 227px">
                      <strong>默认分成比例：<br />
                      </strong></td>
                  <td class="righttd">
                      &nbsp;<asp:TextBox CssClass="textbox" ID="DefaultDividePercent" style="text-align:center" Text="0" runat="server" Width="46px"></asp:TextBox>
                      %  <span class="tips">会员在此栏目下添加内容时，该内容默认的分成比例</span></td>
              </tr>
         </table>  			
			
        </div>
        
		 <div class="tab-page" id="tab4">
		  <h2 class="tab">发表选项</h2>
			<script type="text/javascript">
						 tabPane1.addTabPage( document.getElementById( "tab4" ) );
			</script>
			
 <table width="100%" border="0" cellpadding="1" cellspacing="1" class="CTable">
                     <tr>
                      <td align="right" class="lefttd" height="30" style="width: 227px">
                          <strong>允许在本栏目发布文档</strong>：
                          <br /><span style="color:Blue">如果该栏目不是终级栏目，建议设置为不允许在本栏目下发表！</span>
                          </td>
                      <td class="righttd">
                       <asp:RadioButtonList ID="RdbPubFlag" runat="server" RepeatDirection="Horizontal">
                         <asp:ListItem Value="0">不允许</asp:ListItem>
                         <asp:ListItem Value="1" Selected>允许</asp:ListItem>
                       </asp:RadioButtonList>
                      </td>
                     </tr>
                     <tr>
                      <td align="right" class="lefttd" height="30" style="width: 227px">
                          <strong>本栏目是否允许投稿</strong>：</td>
                      <td class="righttd">
                          <asp:RadioButtonList ID="AllowPubInfo" runat="server" RepeatDirection="Vertical">
                              <asp:ListItem Value="0">①不允许</asp:ListItem>
                              <asp:ListItem Selected="True" Value="1">②完全开放投稿(<font color=blue>包括游客</font>)</asp:ListItem>
                              <asp:ListItem Value="2">③只开放会员投稿(<font color=red>游客除外</font>)</asp:ListItem>
                              <asp:ListItem Value="3">④只开放指定的会员组投稿</asp:ListItem>
                          </asp:RadioButtonList></td>
                  </tr>
                  <tr>
                  <td align="right" class="lefttd" height="30" style="width: 227px">
                      <strong>允许此栏目下投稿的会员组：</strong>
                      <br />
                      <font color="blue">如果该栏目允许投稿选择上面第④种时，请在此设置允许在此栏目下投稿的会员组</font>
                  </td>
                  <td class="righttd" ID="PubGroupIDArea" runat="server">
                  </td>
              </tr>
              <tr>
                      <td align="right" class="lefttd" style="width: 227px;height:30px">
                          <strong>在此栏目发表评论奖励</strong>：<br />
                         </td>
                      <td class="righttd">
                         <asp:TextBox ID="TxtCmtAddScore" CssClass="textbox" Text="0" style="text-align:center" runat="server" Width="37px"></asp:TextBox>积分（为0时不奖励）<span class="tips">只有通过审核的的评论才奖励,建议设置奖励积分的情况，设置评论需要后台审核才显示。</span>
                      </td>
              </tr>
              <tr>
                      <td align="right" class="lefttd" style="width: 227px;height:30px">
                          <strong>会员投稿奖励</strong>：<br />
                          <span style="color: #ff0033">在会员中心发布信息，并通过审核后的奖励措施</span></td>
                      <td class="righttd">
                          <span style="display:none">会员每发表一条信息，可以得到<asp:TextBox ID="PubAddMoney" Text="0" style="text-align:center" runat="server" Width="37px"></asp:TextBox>元人民币（为0时不奖励）<span class="tips">只有通过后台审核的才增加</span><br /></span>
                          会员每发表一条信息，可以得到<asp:TextBox CssClass="textbox" ID="PubAddPoint" Text="0" style="text-align:center" runat="server" Width="37px"></asp:TextBox><%=MyCache.GetCacheConfig(50) %><%=MyCache.GetCacheConfig(49) %>（为0时不奖励）<span class="tips">只有通过后台审核的才增加</span><br />
                          会员每发表一条信息，可以得到<asp:TextBox CssClass="textbox" ID="PubAddScore" Text="0" style="text-align:center" runat="server" Width="37px"></asp:TextBox>分积分（为0时不奖励）<span class="tips">只有通过后台审核的才增加</span><br />
                      </td>
              </tr>
               <tr>
                  <td align="right" class="lefttd" height="30" style="width: 227px">
                      <strong>点分享按钮赠送积分：<br />
                      </strong></td>
                  <td class="righttd">
                      &nbsp;<asp:TextBox CssClass="textbox" Text="0" ID="TxtShareAddScore" style="text-align:center" runat="server" Width="46px"></asp:TextBox>
                      分
                      <span class="tips">一旦会员点击分享按钮就会赠送积分。
                      <br />
                      分享按钮上需加上脚本：onclick="return(addScore({KS:Field:ClassID},{KS:Field:InfoID}))"
                      <br />如：
                     &lt;A onclick="return(addScore({KS:Field:ClassID},{KS:Field:InfoID}));" class=bshare-qzone title=分享到QQ空间>&lt;/A>


                      </span>
                      </td>
              </tr>
              <tr>
                    <td align="right" class="lefttd" style="width:227px;height:30px"><strong>允许管理此栏目的普通管理员</strong></td>
                    <td class="righttd">
                        <asp:CheckBoxList ID="CkbAdminPurview" runat="server" RepeatColumns="5" RepeatDirection="Horizontal">
                        </asp:CheckBoxList>
                    </td>
              </tr>   
         </table>  			
        </div>
        
		 <div class="tab-page" id="tab5">
		  <h2 class="tab">自设内容</h2>
			<script type="text/javascript">
						 tabPane1.addTabPage( document.getElementById( "tab5" ) );
			</script>
			
 <table width="100%" border="0" cellpadding="1" cellspacing="1" class="CTable">
         <tr>           
             <td height='30' align='right' width='210' class='lefttd'><strong>自设内容数：</strong></td>
           <td height='28' class="righttd">
              &nbsp;<select name="ClassDefine_Num" id="ClassDefine_Num" onChange="setFileFileds(this.value)"><option value="1" selected>1</option><option value="2">2</option><option value="3">3</option><option value="4">4</option><option value="5">5</option><option value="6">6</option><option value="7">7</option><option value="8">8</option><option value="9">9</option><option value="10">10</option><option value="11">11</option><option value="12">12</option><option value="13">13</option><option value="14">14</option><option value="15">15</option><option value="16">16</option><option value="17">17</option><option value="18">18</option><option value="19">19</option><option value="20">20</option> </select>             </td>
         </tr>
         
         <%for (int i = 1; i <= 20; i++)
           {
           %>
           <tbody id="define<%=i %>" style="display:none">
         <tr>           
          <td height='30' align='right' width='210' class='lefttd'><strong>自设内容<%=i %>：</strong><br> <font color=blue>在栏目模板页插入{$GetClassDefineContent<%=i %>} 调用</font>
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