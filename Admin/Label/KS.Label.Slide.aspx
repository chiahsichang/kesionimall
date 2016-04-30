<%@ Page Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.Admin_Label_FunLabel_Slide" Title="Untitled Page" Codebehind="KS.Label.Slide.aspx.cs" %>
<%@ Register Src="~/control/LabelJS.ascx" TagName="LabelJS" TagPrefix="uc1" %>
<%@ Import Namespace="Kesion.Cache"%>
<%@ Import Namespace="Kesion.BLL"%>

<asp:Content ID="Content1" ContentPlaceHolderID="KSContent" Runat="Server">
<uc1:LabelJS ID="LabelJS1" runat="server"/>
<script type="text/javascript">
  function checkform()
  {
   if (jQuery("#<%=this.LabelName.ClientID%>").val()=="")
   {
   KesionJS.Alert('�������ǩ����!',"jQuery('#<%=this.LabelName.ClientID%>').focus();");
   return false;

}

var slidestyle = jQuery("#SlideStype").val();

   var childclass=0;
   if (jQuery('#<%=this.ChildClass.ClientID %>')[0].checked) childclass=1;
   var recommends=0;
   
   
   var classid='';
	jQuery("#classid1 option:selected").each(function(){
		if (jQuery(this).val()!='0' && jQuery(this).val()!='-1')
			if (classid=='') 
				 classid=jQuery(this).val() 
			else
				 classid+=","+jQuery(this).val();
		})
   if (classid=='') classid='0';
   if (jQuery("#classid1 option:selected").val() == "-1") classid = "-1";

   var str='{KS:Label Type="Slide"'
          + ' ChannelID="'+jQuery("#<%=this.ChannelID.ClientID %> option:selected").val()+'"'
          + ' ClassID="'+classid+'"'
          + ' ChildClass="'+childclass+'"'
          + ' SpecialID="'+jQuery("#specialid1 option:selected").val()+'"'
          + ' SlideStyle="' + slidestyle + '"'
          + ' TxtHeight="' + jQuery("#<%=this.TxtHeight.ClientID%>").val() + '"'
          + ' wrap="' + jQuery('#<%=this.wrap.ClientID %>').val() + '"'
          + ' auto="' + jQuery('#<%=this.auto.ClientID %>').val() + '"'
          + ' Num="' + jQuery('#<%=this.Num.ClientID %>').val() + '"'
          + ' Width="'+jQuery('#<%=this.Width.ClientID %>').val()+'"'
          + ' Height="'+jQuery('#<%=this.Height.ClientID %>').val()+'"'
          + ' trigger="' + jQuery("#<%=this.trigger.ClientID %>").val() + '"'
          + ' TitleLen="' + jQuery('#<%=this.TitleLen.ClientID %>').val() + '"'
          + ' IntroLen="' + jQuery('#<%=this.TxtIntroLen.ClientID %>').val() + '"'
          + ' LinkTarget="' + jQuery('#<%=this.LinkTarget.ClientID %>').val() + '"'
          + ' Order="'+jQuery('#<%=this.Order.ClientID %>').val()+'"'
          +'}{/KS:Label}';
          
   jQuery("#<%=this.LabelContent.ClientID %>").val(str);
   return true;
}

</script>

<script src="../../ks_inc/myFocus/myfocus-2.0.4.min.js"></script>

		<div id="view" style="position:absolute; top:70px; right:20px;cursor:pointer; text-align:center">
		<div style="background-color:#000; color:#fff; line-height:20px; text-align:center"  onclick="jQuery('#view').hide()">�õ�Ԥ�� ��˹ر�</div>
			<div id="focus_box">
			<div id="focus">
			<div class="loading"></div>
			 <div class="pic"><!--ͼƬ�б�-->
				<ul>
			<li><a href="http://www.kesion.com" target="_blank" title="����1"><img width="250" height="220" src="../../ks_inc/myfocus/Images/1.jpg" thumb="" alt="����1" text="���1" /></a></li>
			<li><a href="http://www.kesion.com" target="_blank" title="����2"><img width="250" height="220" src="../../ks_inc/myfocus/Images/2.jpg" thumb="" alt="����2" text="���2" /></a></li>
			<li><a href="http://www.kesion.com" target="_blank" title="����3"><img width="250" height="220" src="../../ks_inc/myfocus/Images/3.jpg" thumb="" alt="����3" text="���3" /></a></li>
			<li><a href="http://www.kesion.com" target="_blank" title="����4"><img width="250" height="220" src="../../ks_inc/myfocus/Images/4.jpg" thumb="" alt="����4" text="���4" /></a></li>
			<li><a href="http://www.kesion.com" target="_blank" title="����5"><img width="250" height="220" src="../../ks_inc/myfocus/Images/5.jpg" thumb="" alt="����5" text="���5" /></a></li>
				</ul>
			</div>
			</div>
             </div>

		
		</div>

        <script>
            jQuery(document).ready(function () {
                GetClassOption();
                jQuery("#view").mousedown(function (event) {
                    var offset = jQuery("#view").offset();
                    x1 = event.clientX - offset.left;
                    y1 = event.clientY - offset.top;
                    jQuery("#view").mousemove(function (event) {
                        jQuery("#view").css("left", (event.clientX - x1) + "px");
                        jQuery("#view").css("top", (event.clientY - y1) + "px");
                    });

                    jQuery("#view").mouseup(function (event) {
                        jQuery("#view").unbind("mousemove");
                    });

                });
                myFocus.set({ id: 'focus', pattern: 'mF_taobao2010', loadIMGTimeout: 0, width: 250, height: 220 });
            });

            var $id = function (id) { return document.getElementById(id) };
            var oriHtml = $id('focus_box').innerHTML;
            function resetHTML() {//��ԭ

                $id('focus_box').innerHTML = oriHtml;
                var css = document.getElementsByTagName('style')[0];
                //alert(css);
                css.parentNode.removeChild(css);
            }

            function changeSlide(v) {
                resetHTML();
                jQuery('#view').show();
                myFocus.set({ id: 'focus', pattern: v, loadIMGTimeout: 0, width: 250, height: 220 });

            }
      </script>




    <table style="margin:6px" width="98%" align="center" cellpadding="1" cellspacing="1" class="CTable">
        <tr>
            <td class="lefttd" style="height: 30px; text-align: right">
                <strong>��ǩ���ƣ�</strong></td>
            <td runat="server" class="righttd" style="height: 30px; text-align: left">
                <span style="color: #000066">{KS_</span><asp:TextBox CssClass="noborder" ID="LabelName" runat="server" Width="126px"></asp:TextBox><span style="color: #000066"> } * ���ø�ʽ��{KS_��ǩ����}</span><asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="LabelName"
                    Display="Dynamic" ErrorMessage="��ǩ���Ʊ�������"></asp:RequiredFieldValidator></td>
        </tr>
    <tr>
     <td class="lefttd" style="text-align: right; height: 30px;">
         <strong>��ǩĿ¼��</strong></td>
     <td class="righttd" style="text-align: left; height: 30px;"><span  id="classidarea" runat="server"></span><font color=red> ��ѡ���ǩ����Ŀ¼���Ա��պ�����ǩ</font></td>
    </tr>
    </table>
        <table style="margin:6px" width="98%" align="center" cellpadding="1" cellspacing="1" class="CTable">
        <tr>
            <td class="lefttd" style="height: 30px; text-align: right">
                <strong>�õ���ʽ��</strong></td>
            <td runat="server" class="righttd" style="height: 30px; text-align: left">
              <select name="SlideStyle" id="SlideStype" onchange="changeSlide(this.value)">
              <option value="mF_fscreen_tb"<%=SlideStyle=="mF_fscreen_tb"?" selected":"" %>>mF_fscreen_tb</option> 
              <option value="mF_YSlider"<%=SlideStyle=="mF_YSlider"?" selected":"" %>>mF_YSlider</option>
               <option value="mF_luluJQ"<%=SlideStyle=="mF_luluJQ"?" selected":"" %>>mF_luluJQ</option>
               <option value="mF_51xflash"<%=SlideStyle=="mF_51xflash"?" selected":"" %>>mF_51xflash</option> 
               <option value="mF_expo2010"<%=SlideStyle=="mF_expo2010"?" selected":"" %>>mF_expo2010</option> 
               <option value="mF_games_tb"<%=SlideStyle=="mF_games_tb"?" selected":"" %>>mF_games_tb</option>
               <option value="mF_ladyQ"<%=SlideStyle=="mF_ladyQ"?" selected":"" %>>mF_ladyQ</option> 
                <option value="mF_liquid"<%=SlideStyle=="mF_liquid"?" selected":"" %>>mF_liquid</option> 
                <option value="mF_liuzg"<%=SlideStyle=="mF_liuzg"?" selected":"" %>>mF_liuzg</option> 
                <option value="mF_pithy_tb"<%=SlideStyle=="mF_pithy_tb"?" selected":"" %>>mF_pithy_tb</option>
                <option value="mF_qiyi"<%=SlideStyle=="mF_qiyi"?" selected":"" %>>mF_qiyi</option>
                <option value="mF_quwan"<%=SlideStyle=="mF_quwan"?" selected":"" %>>mF_quwan</option>
                <option value="mF_rapoo"<%=SlideStyle=="mF_rapoo"?" selected":"" %>>mF_rapoo</option>
                <option value="mF_sohusports"<%=SlideStyle=="mF_sohusports"?" selected":"" %>>mF_sohusports</option> 
                <option value="mF_taobao2010"<%=SlideStyle=="mF_taobao2010"?" selected":"" %>>mF_taobao2010</option>
                <option value="mF_taobaomall"<%=SlideStyle=="mF_taobaomall"?" selected":"" %>>mF_taobaomall</option>
                <option value="mF_tbhuabao"<%=SlideStyle=="mF_tbhuabao"?" selected":"" %>>mF_tbhuabao</option>
                <option value="mF_pconline"<%=SlideStyle=="mF_pconline"?" selected":"" %>>mF_pconline</option>
                <option value="mF_peijianmall"<%=SlideStyle=="mF_peijianmall"?" selected":"" %>>mF_peijianmall</option>
                <option value="mF_classicHC"<%=SlideStyle=="mF_classicHC"?" selected":"" %>>mF_classicHC</option>
                <option value="mF_classicHB"<%=SlideStyle=="mF_classicHB"?" selected":"" %>>mF_classicHB</option>
                <option value="mF_slide3D"<%=SlideStyle=="mF_slide3D"?" selected":"" %>>mF_slide3D</option>
                <option value="mF_kiki"<%=SlideStyle=="mF_kiki"?" selected":"" %>>mF_kiki</option>
                <option style="color:#f00;" value="mF_fancy"<%=SlideStyle=="mF_fancy"?" selected":"" %>>mF_fancy</option>
                <option style="color:#f00;" value="mF_dleung"<%=SlideStyle=="mF_dleung"?" selected":"" %>>mF_dleung</option>
                <option style="color:#f00;" value="mF_kdui"<%=SlideStyle=="mF_kdui"?" selected":"" %>>mF_kdui</option>
                <option style="color:#f00;" value="mF_shutters"<%=SlideStyle=="mF_shutters"?" selected":"" %>>mF_shutters</option>
              </select>
              
              <span class="tips">ѡ��õ���ʽ���ұ߿���Ԥ����</span>
                    </td>
        </tr>
            <tr>
                <td class="lefttd" style="height: 30px; text-align: right">
                    <strong>����ģ�ͣ�</strong></td>
                <td runat="server" class="righttd" style="height: 30px; text-align: left">

                      <asp:DropDownList ID="ChannelID" runat="server">
                      <asp:ListItem Value="0">--��ָ��ģ��--</asp:ListItem>
                      </asp:DropDownList>
                    &nbsp; <strong>��ѯ������</strong><asp:TextBox CssClass="textbox" style="text-align:center" ID="Num" runat="server" Width="41px">5</asp:TextBox>��&nbsp;
                </td>
            </tr>
            <tr>
                <td class="lefttd" style="height: 30px; text-align: right">
                    <strong>������Ŀ��</strong></td>
                <td runat="server" class="righttd" style="height: 30px; text-align: left">
                    <table border="0" cellpadding="0" cellspacing="0">
                     <tr>
                      <td><select name="classid1" id="classid1" multiple="multiple" size="3" style="width: 120px">
                      <option value="0">-��ָ����Ŀ-</option><option value="-1" style="color:red">��ǰ��Ŀͨ��</option>
                      </select> 
                     </td>
                      <td>
                      <strong>&nbsp; ����ר�⣺</strong>
                      </td>
                      <td>
                       <select name="specialid1" id="specialid1" style="width: 120px">
                       <option value=''>-��ָ��ר��-</option><option value="-1" style="color:red">��ǰר��ͨ��</option>
                       <%=BaseFun.GetSpecialOption("0") %>
                       </select><br />
                       <asp:CheckBox ID="ChildClass" runat="server" Checked="true" Text="�����г�����Ŀ��Ϣ" />
                      </td>
                  
                     </tr>
                    </table>

                </td>
            </tr>
            <tr>
                <td class="lefttd" style="height: 30px; text-align: right">
                    <strong>����ʽ��</strong></td>
                <td runat="server" class="righttd" style="height: 30px; text-align: left">
                    <asp:DropDownList ID="Order" runat="server">
                    <asp:ListItem Value="i.infoid desc">�Զ�ID����</asp:ListItem>
                    <asp:ListItem Value="i.infoid asc">�Զ�ID����</asp:ListItem>
                    <asp:ListItem Value="i.adddate desc">����ʱ�併��</asp:ListItem>
                    <asp:ListItem Value="i.adddate ast">����ʱ������</asp:ListItem>
                    <asp:ListItem Value="i.hits desc">�����������</asp:ListItem>
                    <asp:ListItem Value="i.hits asc">�����������</asp:ListItem>
                    <asp:ListItem Value="i.hitsbymonth desc">�����������</asp:ListItem>
                    <asp:ListItem Value="i.hitsbymonth asc">�����������</asp:ListItem>
                    <asp:ListItem Value="i.hitsbyweek desc">�����������</asp:ListItem>
                    <asp:ListItem Value="i.hitsbyweek asc">�����������</asp:ListItem>
                    <asp:ListItem Value="i.hitsbyday desc">�����������</asp:ListItem>
                    <asp:ListItem Value="i.hitsbyday asc">�����������</asp:ListItem>
                    <asp:ListItem Value="newid()">�����ʾ</asp:ListItem>
                      </asp:DropDownList>&nbsp; <span style="color: #ff0033">�������������ӵ���ʾ����ǰ�棬��ѡ���Զ�ID����</span></td>
            </tr>
            <tr>
                <td class="lefttd" style="height: 30px; text-align: right">
                    <strong>��С���ã�</strong></td>
                <td runat="server" class="righttd" style="height: 30px; text-align: left">
                    ��<asp:TextBox CssClass="textbox" ID="Width" runat="server" Width="69px">300</asp:TextBox>px&nbsp;
                    ��<asp:TextBox CssClass="textbox" ID="Height" runat="server" Width="69px">300</asp:TextBox>px</td>
            </tr>
            <tr>
                <td class="lefttd" style="height: 30px; text-align: right">
                    <strong>�����л�ģʽ��</strong></td>
                <td id="Td4" runat="server" class="righttd" 
                    style="height: 30px; text-align: left">
                    <asp:DropDownList ID="trigger" runat="server">
                        <asp:ListItem Selected="True" Value="click">click[�����]</asp:ListItem>
                        <asp:ListItem Value="mouseover">mouseover[�����ͣ]</asp:ListItem>
                    </asp:DropDownList>
                    
                <strong>���ֲ�߶ȣ�</strong><asp:TextBox ID="TxtHeight" runat="server" Width="50px" CssClass="textbox" />(��λ����),0��ʾ�������ֲ�,ʡ�����û�'default'��ΪĬ�ϸ߶ȡ�
                </td>
            </tr>
            <tr>
                <td class="lefttd" style="height: 30px; text-align: right">
                    <strong>�Ƿ����߿�(�еĻ�)��</strong></td>
                <td class="righttd" style="height: 30px; text-align: left">
                 <asp:DropDownList runat="server" ID="wrap">
                  <asp:ListItem Value="true">��</asp:ListItem>
                  <asp:ListItem Value="false">��</asp:ListItem>
                 </asp:DropDownList>
                 
                 <strong>�Ƿ��Զ�����</strong>
                 <asp:DropDownList runat="server" ID="auto">
                 <asp:ListItem Value="true">��</asp:ListItem>
                  <asp:ListItem Value="false">��</asp:ListItem>
                 </asp:DropDownList>
                 </td>
            </tr>
            <tr>
                <td class="lefttd" style="height: 30px; text-align: right">
                    <strong>����������</strong></td>
                <td id="Td2" runat="server" class="righttd" 
                    style="height: 30px; text-align: left">
                    <asp:TextBox  CssClass="textbox" style="text-align:center" ID="TitleLen" runat="server" Width="69px">30</asp:TextBox>
                    ���������<asp:TextBox  CssClass="textbox" style="text-align:center" ID="TxtIntroLen" runat="server" Width="69px">200</asp:TextBox>
                    <font color=red>1��������2���ַ�</font></td>
            </tr>
            <tr>
                <td class="lefttd" style="height: 30px; text-align: right">
                    <strong>����Ŀ�꣺</strong></td>
                <td id="Td3" runat="server" class="righttd" 
                    style="height: 30px; text-align: left">
                    <asp:DropDownList ID="LinkTarget" runat="server">
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem>_blank</asp:ListItem>
                    <asp:ListItem>_parent</asp:ListItem>
                    <asp:ListItem>_top</asp:ListItem>
                    <asp:ListItem>_self</asp:ListItem>
                    </asp:DropDownList></td>
            </tr>
      </table>
     <div style="text-align:center">
         <asp:TextBox ID="LabelContent" runat="server"></asp:TextBox>
     <asp:Button ID="Button1" CssClass="button" runat="server" Text="ȷ������(O)" AccessKey="O" OnClick="Button1_Click"/>
           <input type="button" class="button" onclick="javascript:parent.box.close();" accesskey="C" value="�ر�ȡ��(C)" /><br />
     </div>

</asp:Content>
