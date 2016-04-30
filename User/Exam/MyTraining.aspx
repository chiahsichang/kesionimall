<%@ Page Title="" Language="C#" MasterPageFile="~/User/User.master" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.User_MyTraining" Codebehind="MyTraining.aspx.cs" %>
<%@ Import Namespace="Kesion.Cache" %>
<%@ Import Namespace="Kesion.Publics" %>
<%@ Import Namespace="Kesion.BLL" %>

<asp:Content ID="Content1" ContentPlaceHolderID="KSContent" Runat="Server">



<asp:Panel ID="PanList" runat="server">

   
   <div style="padding:5px;color:#fff;border:0px;font-size:20px;font-weight:bold;background:url(../images/usertu6.gif);"><img src="../images/friends.png" align="middle" />我定制的练习考场</div>
    <asp:Repeater ID="Repeater1" runat="server">
    <HeaderTemplate>
         <table id="tablist" width="99%" border="0" align="center" cellpadding="2" cellspacing="1" class="border">
    </HeaderTemplate>
    <ItemTemplate>
      <tr class="tdbg">
          <td class="splittd" align="center" width="180" height="160">
           <div style="width:100px;padding:10px;background:#efefef"><img alt="<%# Eval("classname") %>"  src="<%# getClassImg(Convert.ToString(Eval("classbasicinfo"))) %>" onerror="this.src='../../<%=MyCache.GetSJCacheConfig(1) %>/images/shijuan.jpg';" width="80"/></div>
          </td>

          <td class="splittd" style="line-height:25px">
           <span style='font-size:28px;font-weight:bold'><%# Eval("classname") %></span>
          <br /><span class="tips">开通时间：<%# Utils.FormatHumanizedTime(Convert.ToDateTime(Eval("AddDate"))) %>共有试卷：<span style="color:Red"><%# DataFactory.GetOnlyValue("select count(1) from KS_SJ Where ClassID in(" + Kesion.HtmlTags.Function.GetSJCategoryChildID(Utils.StrToInt(Eval("classid"))) + ") and realtest=0")%></span>份 共有试题：<span style="color:Red"><%# DataFactory.GetOnlyValue("select count(1) from KS_SJTK Where ClassID in(" + Kesion.HtmlTags.Function.GetSJCategoryChildID(Utils.StrToInt(Eval("classid"))) + ") and isrnd=1")%></span>题</span> 
          <br /><a href="javascript:" class="tips" onclick="KesionJS.Confirm('确定删除您定制的考场吗？','location.href=\'?action=del&id=<%# Eval("ID") %>\';','')">删除</a>
          </td>

          <td class="splittd" align="center">
           <a href='MyTrainingSJ.aspx?classid=<%#Eval("classid") %>'>
           <img src="../../<%=MyCache.GetSJCacheConfig(1) %>/images/lx.jpg" title="进入考场"  />
           </a>
           <br />
           <a href="MyTraining.aspx?action=rnd&classid=<%#Eval("classid") %>">           
           <img src="../../<%=MyCache.GetSJCacheConfig(1) %>/images/rndexam.jpg" title="随机强化练习"  />
             </a>
           </td>

      </tr>  

     </ItemTemplate>
     <FooterTemplate>
         <tr class="tdbg" style="display:<%# bool.Parse((Repeater1.Items.Count==0).ToString())?"":"none"%>">
                <td class="splittd" style="text-align:center" colspan="10">
                  您还没有定制练习考场，<a href="?action=open">点此开通</a>！
                </td>
           </tr> 
      </table>
     </FooterTemplate>
    </asp:Repeater>
    
   <br />
  <KS:Page ID="Page1" runat="server" />
</asp:Panel>

<asp:Panel ID="OpenTrainingPannel" runat="server" Visible="false" Width="100%">

<div style="padding:5px;color:#fff;border:0px;font-size:20px;font-weight:bold;background:url(../images/usertu6.gif);">
<strong><img alt="" src="../images/tag.png" align="middle" />请选择要开通的练习频道</strong>
</div>
<br />
<br />

 <asp:Repeater ID="Repeater2" runat="server">
    <HeaderTemplate>
        <div class="list">
        <ul>
    </HeaderTemplate>
    <ItemTemplate>
      <tr class="tdbg">
         
           <%if (classId != 0)
             { %>
              <li style="text-align:center;float:left;width:220px;height:190px;">
             <div style="margin:0 auto;width:100px;padding:10px;background:#efefef">
           <img alt="<%# Eval("ClassName") %>" src="<%# getClassImg(Convert.ToString(Eval("classbasicinfo"))) %>" onerror="this.src='../../<%=MyCache.GetSJCacheConfig(1) %>/images/shijuan.jpg';" width="100" height="110"/>
           </div>
           <strong><%# Eval("classname") %></strong>
             <div>
             <input <%# getOpenStatus(Convert.ToInt16(Eval("classid")))?" disabled value='已 开 通'":" value='我要开通'" %> type="button" class="button" onclick="location.href='?action=myopen&classid=<%# Eval("classid") %>';" />
             </div>
             </li>
           <%}
             else
             { %>
              <li style="text-align:center;float:left;width:220px;height:180px;">
             <div style="margin:0 auto;width:100px;padding:10px;background:#efefef">
           <a href="?action=open&classid=<%# Eval("classid") %>" title="点击选择频道"><img alt="<%# Eval("ClassName") %>" src="<%# getClassImg(Convert.ToString(Eval("classbasicinfo"))) %>" onerror="this.src='../../<%=MyCache.GetSJCacheConfig(1) %>/images/shijuan.jpg';" width="100" height="110"/>
           </a>
           </div>
           <strong><%# Eval("classname") %></strong>
            </li>  
           <%} %>
     </ItemTemplate>
     <FooterTemplate>
        </ul>
        </div>
         <div style="display:<%# bool.Parse((Repeater2.Items.Count==0).ToString())?"":"none"%>">
                  没有练习频道可供选择！
         </div> 
     </FooterTemplate>
    </asp:Repeater>
   <br />
</asp:Panel>



<asp:Panel ID="RndPanel" runat="server" Visible="false" Width="100%">

<div style="padding:5px;color:#fff;border:0px;font-size:20px;font-weight:bold;background:url(../images/usertu6.gif);">
<strong><img alt="" src="../images/tag.png" align="middle" />强化练习</strong>
</div>
<br />
<br />
<script>
    var limitTotalTMS=100; //限制总抽题数
    jQuery(document).ready(function(){
      if (parseInt($("#<%=this.TxtTM1.ClientID %>").val())>parseInt($("#n0").html())){
       $("#<%=this.TxtTM1.ClientID %>").val($("#n0").html());
      }
      if (parseInt($("#<%=this.TxtTM2.ClientID %>").val())>parseInt($("#n1").html())){
       $("#<%=this.TxtTM2.ClientID %>").val($("#n1").html());
      }
      if (parseInt($("#<%=this.TxtTM3.ClientID %>").val())>parseInt($("#n2").html())){
       $("#<%=this.TxtTM3.ClientID %>").val($("#n2").html());
      }
      if (parseInt($("#<%=this.TxtTM4.ClientID %>").val())>parseInt($("#n3").html())){
       $("#<%=this.TxtTM4.ClientID %>").val($("#n3").html());
      }
        if (parseInt($("#<%=this.TxtTM5.ClientID %>").val())>parseInt($("#n4").html())){
            $("#<%=this.TxtTM5.ClientID %>").val($("#n4").html());
      }
        if (parseInt($("#<%=this.TxtTM6.ClientID %>").val())>parseInt($("#n5").html())){
            $("#<%=this.TxtTM6.ClientID %>").val($("#n5").html());
      }
        if (parseInt($("#<%=this.TxtTM7.ClientID %>").val())>parseInt($("#n6").html())){
            $("#<%=this.TxtTM7.ClientID %>").val($("#n6").html());
      }
    });
    function getTMS(v) {
        var tm1=$("#<%=this.TxtTM1.ClientID %>");
        var tm2=$("#<%=this.TxtTM2.ClientID %>");
        var tm3=$("#<%=this.TxtTM3.ClientID %>");
        var tm4=$("#<%=this.TxtTM4.ClientID %>");
        var tm5=$("#<%=this.TxtTM5.ClientID %>");
        var tm6=$("#<%=this.TxtTM6.ClientID %>");
        var tm7=$("#<%=this.TxtTM7.ClientID %>");

        jQuery.get('MyTraining.aspx', {rnd:Math.random(), action: "gettms", classId:<%=classId %>,knowledgeId: v }, function (d) { 
        var darr=d.split('|');
         for(var i=0;i<7;i++)
         {
             jQuery("#n"+i).html(darr[i]);
             if (darr[i]>10){
                 eval("tm"+(i+1)).val(10);
             }else{
                 eval("tm"+(i+1)).val(darr[i]);
             }
             if (darr[i]==0){
                 $("#show"+i).hide();
             }else{
                 $("#show"+i).show();
             }
         }
         
    });
    }
    function checkTm(){
        $("#aspnetForm").attr("target","hidframe");
      if ($("#<%=this.TxtTitle.ClientID %>").val()==''){
        KesionJS.Alert("练习名称必须输入！",'$("#<%=this.TxtTitle.ClientID %>").focus()');
        return false;
      }
      if ($("#<%=this.TxtTime.ClientID %>").val()==''){
        KesionJS.Alert("做题时长必须输入！",'$("#<%=this.TxtTime.ClientID %>").focus()');
        return false;
      }
      var tm1=parseInt($("#<%=this.TxtTM1.ClientID %>").val());
      var tm2=parseInt($("#<%=this.TxtTM2.ClientID %>").val());
      var tm3=parseInt($("#<%=this.TxtTM3.ClientID %>").val());
      var tm4=parseInt($("#<%=this.TxtTM4.ClientID %>").val());
      var tm5=parseInt($("#<%=this.TxtTM5.ClientID %>").val());
      var tm6=parseInt($("#<%=this.TxtTM6.ClientID %>").val());
      var tm7=parseInt($("#<%=this.TxtTM7.ClientID %>").val());
        if (tm2>parseInt($("#n1").html())){
        KesionJS.Alert("单选题最多只能选"+$("#n1").html()+"题！",'$("#<%=this.TxtTM2.ClientID %>").focus()');
        return false;
      }
      if (tm3>parseInt($("#n2").html())){
        KesionJS.Alert("多选题最多只能选"+$("#n2").html()+"题！",'$("#<%=this.TxtTM3.ClientID %>").focus()');
        return false;
      }
      if (tm4>parseInt($("#n3").html())){
        KesionJS.Alert("判断题最多只能选"+$("#n3").html()+"题！",'$("#<%=this.TxtTM4.ClientID %>").focus()');
        return false;
      }
        if (tm5>parseInt($("#n4").html())){
            KesionJS.Alert("填空题最多只能选"+$("#n4").html()+"题！",'$("#<%=this.TxtTM5.ClientID %>").focus()');
          return false;
      }
        if (tm6>parseInt($("#n5").html())){
            KesionJS.Alert("阅读分析题最多只能选"+$("#n5").html()+"题！",'$("#<%=this.TxtTM6.ClientID %>").focus()');
          return false;
      }
        if (tm7>parseInt($("#n6").html())){
            KesionJS.Alert("会计分录题最多只能选"+$("#n6").html()+"题！",'$("#<%=this.TxtTM7.ClientID %>").focus()');
          return false;
      }
      if (tm1>parseInt($("#n0").html())){
        KesionJS.Alert("主观题最多只能选"+$("#n0").html()+"题！",'$("#<%=this.TxtTM1.ClientID %>").focus()');
        return false;
      }
      if (tm1+tm2+tm3+tm4+tm5+tm6+tm7>limitTotalTMS){
        KesionJS.Alert("系统限制每次只能抽"+limitTotalTMS+"题！",'');
        return false;
      }

    }
    $(document).ready(function(){
        getTMS(0);
    });
</script>

 <table  cellspacing="1" cellpadding="3" class="border" width="98%" align="center" border="0">
	  <tr class="title">
        <td colspan="2"> 配置练习规则 </td>
      </tr>
       <tr class="tdbg">
           <td  class="lefttd" style="height:30px;width: 88px">练习名称：</td>
            <td>
            <asp:TextBox ID="TxtTitle" runat="server" Width="200px" CssClass="textbox"></asp:TextBox>
            <span class="tips"> 请为您的练习取个名称，方便在答题记录中查找 </span>
           </td>
       </tr>
       <tr class="tdbg">
           <td  class="lefttd" style="height:30px;width: 88px">选择知识点：</td>
            <td>
            <asp:DropDownList ID="DrpKnowledge" runat="server">
            </asp:DropDownList>
            <span class="tips"> 可以针对某个知识点进行练习 </span>
           </td>
       </tr>
       <tr class="tdbg">
           <td  class="lefttd" style="height:30px;width: 88px">做题时长：</td>
            <td>
            <asp:TextBox ID="TxtTime" runat="server" Width="50"  Text="60" CssClass="textbox" style="text-align:center"/>
            分钟
           </td>
       </tr>
        <tr class="title">
        <td colspan="2"> 题    型：<span class="tips">(如果您不希望做某种题型，请在选题数值框内填0) </span></td>
      </tr>
       <tr class="tdbg" id="show1" style="display:none">
           <td  class="lefttd" style="width: 88px">单选题：</td>
            <td style="font-size:14px;">
           共 <span id="n1">0</span> 题，选<asp:TextBox ID="TxtTM2" style="text-align:center" runat="server" Width="40px" Text="10" CssClass="textbox" />题
           </td>
       </tr>
       <tr class="tdbg" id="show2" style="display:none">
           <td  class="lefttd" style="width: 88px">多选题：</td>
            <td style="font-size:14px;">
           共 <span id="n2">0</span> 题，选<asp:TextBox ID="TxtTM3" style="text-align:center" runat="server" Width="40px" Text="10" CssClass="textbox" />题
           </td>
       </tr>
       <tr class="tdbg" id="show3" style="display:none">
           <td  class="lefttd" style="width: 88px">判断题：</td>
            <td style="font-size:14px;">
           共 <span id="n3">0</span> 题，选<asp:TextBox ID="TxtTM4" style="text-align:center" runat="server" Width="40px" Text="10" CssClass="textbox" />题
           </td>
       </tr>
       <tr class="tdbg" id="show4" style="display:none">
           <td  class="lefttd" style="width: 88px">填空题：</td>
            <td style="font-size:14px;">
           共 <span id="n4">0</span> 题，选<asp:TextBox ID="TxtTM5" style="text-align:center" runat="server" Width="40px" Text="10" CssClass="textbox" />题
           </td>
       </tr>
       <tr class="tdbg" id="show0" style="display:none">
           <td  class="lefttd" style="width: 88px">主观题：</td>
           <td style="font-size:14px;">
           共 <span id="n0">0</span> 题，选<asp:TextBox ID="TxtTM1" style="text-align:center" runat="server" Width="40px" Text="10" CssClass="textbox" />题
           </td>
       </tr>
       <tr class="tdbg" id="show5" style="display:none">
           <td  class="lefttd" style="width: 88px">阅读分析：</td>
           <td style="font-size:14px;">
           共 <span id="n5">0</span> 题，选<asp:TextBox ID="TxtTM6" style="text-align:center" runat="server" Width="40px" Text="10" CssClass="textbox" />题
           </td>
       </tr>
       <tr class="tdbg" id="show6" style="display:none">
           <td  class="lefttd" style="width: 88px">会计分录题：</td>
           <td style="font-size:14px;">
           共 <span id="n6">0</span> 题，选<asp:TextBox ID="TxtTM7" style="text-align:center" runat="server" Width="40px" Text="10" CssClass="textbox" />题
           </td>
       </tr>

</table>

 <div style="text-align:center;margin:20px">
   <asp:Button ID="BtnTraining" runat="server" OnClientClick="return(checkTm());" Text="开始练习" CssClass="button" 
         onclick="BtnTraining_Click" />
 </div>
</asp:Panel>

</asp:Content>
