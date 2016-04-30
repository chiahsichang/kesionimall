<%@ Page Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.Admin_ClassArrtibute" Title="批量设置栏目属性" Codebehind="KS.ClassArrtibute.aspx.cs" %>
<%@ Import Namespace="Kesion.BLL" %>
<%@ Import Namespace="Kesion.Cache" %>
<%@ Import Namespace="Kesion.Publics" %>
<asp:Content ID="Content1" ContentPlaceHolderID="KSContent" Runat="Server">
    <KS:TopNav ID="TopNav1" Text="批量设置栏目属性" runat="server" />
	<script type="text/javascript">

	function CheckForm()
	{
	    var ClassList=null;
	    jQuery("#ClassID option:selected").each(function(){
			 if (ClassList==null) 
						 ClassList=jQuery(this).val() 
			  else
						 ClassList+=","+jQuery(this).val();
		})

	  if (ClassList==null)
	  {
	   KesionJS.Alert('请选择要批量设置的栏目!',null);
	   return false;
	  }
	  return true;
	}
	function SelectAll(){
	  jQuery("#ClassID option").each(function(){
	      jQuery(this).attr("selected",true);
	  });
	}
	function UnSelectAll(){
	  jQuery("#ClassID option").each(function(){
	      jQuery(this).attr("selected",false);
	  });
	}
	</script>

	<table cellspacing="1" cellpadding="2" width="100%" align="center" border="0">
    <tr class="tdbg">
      <td vAlign=top width=200>
          <asp:DropDownList ID="DropChannelID" runat="server" style="WIDTH: 196px;">
           <asp:ListItem Value="0">--请选择要设置模型--</asp:ListItem>
          </asp:DropDownList>
      <br />
<select style="WIDTH: 200px; HEIGHT: 380px" multiple size=2 name="ClassID" id="ClassID">
  <%
      string from = KSCMS.S("from");
      if (string.IsNullOrEmpty(from)) from = string.Empty;
  if (from.Equals("shop")){
      Response.Write(MyCache.GetShopClassOptionList(ChannelID));
  }else{
      Response.Write(MyCache.GetClassOptionList(ChannelID));
  } %>
</select>
   <div align="center" style="line-height:30px;">
   <input onclick="SelectAll()" type="button" class="button" value="选定所有栏目" name="Submit" /><br />
      
   <input onclick="UnSelectAll()" type="button" value="取消选定栏目" class="button" name="Submit" />
   <br /><font color=red>提示：</font>可以按住“Shift”<br />或“Ctrl”键进行多个栏目的选择</div>
   </td>
   <td vAlign="top">
     <div class="tab-page" id="ClassAttributePanel">
         <script type="text/javascript">
           var tabPane1 = new WebFXTabPane( document.getElementById( "ClassAttributePanel" ), 1 )
         </script>
             
		 <div class="tab-page" id="tab0">
		  <h2 class="tab">基本信息</h2>
			<script type="text/javascript">
						 tabPane1.addTabPage( document.getElementById( "tab0" ) );
			</script>
        
                  <table  width="100%" border="0" cellpadding="1" cellspacing="1" class="CTable">
                    <tr<%=KSCMS.S("from").Equals("shop")?"":" style='display:none'" %>>
				    <td align='center' class='lefttd' style="width: 52px;"><asp:CheckBox ID="C13" runat="server" /></td>
					<td height='30' align='right' class='lefttd' style="width: 186px"><strong>绑定商品规格组：</strong></td>
					<td height='28' class="righttd">
                        <asp:DropDownList ID="DrpProSpecialID" runat="server"></asp:DropDownList>
                     </td>          
				  </tr>
				  <tr>
				    <td align='center' class='lefttd' style="width: 52px;"><asp:CheckBox ID="C1" runat="server" /></td>
					<td height='30' align='right' class='lefttd' style="width: 186px"><strong>栏目顶部导航：</strong></td>
					<td height='28' class="righttd">
                        <asp:RadioButtonList ID="ShowInTop" runat="server" RepeatDirection="Horizontal">
                            <asp:ListItem Selected="True" Value="1">显示</asp:ListItem>
                            <asp:ListItem Value="0">不显示</asp:ListItem>
                        </asp:RadioButtonList></td>          
				  </tr>
                  <tr<%=MyCache.GetCacheConfig(72)=="0"?" style='display:none'":"" %>>
				    <td align='center' class='lefttd' style="width: 52px;"><asp:CheckBox ID="C12" runat="server" /></td>
					<td height='30' align='right' class='lefttd' style="width: 186px"><strong>在手机版栏目导航里显示：</strong></td>
					<td height='28' class="righttd">
                        <asp:RadioButtonList ID="RdbShowOn3g" runat="server" RepeatDirection="Horizontal">
                            <asp:ListItem Selected="True" Value="1">显示</asp:ListItem>
                            <asp:ListItem Value="0">不显示</asp:ListItem>
                        </asp:RadioButtonList></td>          
				  </tr>
                      <tr>
                          <td align="center" class="lefttd" style="width: 52px; height: 30px;"><asp:CheckBox ID="C2" runat="server" /></td>
                          <td align="right" class="lefttd" style="width: 186px; height: 30px;">
                              <strong>是否在循环栏目中显示</strong><span style="background-color: #f0f9fe">：</span></td>
                          <td class="righttd" style="height: 30px">
                              <asp:RadioButtonList ID="ShowInCir" runat="server" RepeatDirection="Horizontal">
                                  <asp:ListItem Selected="True" Value="1">显示</asp:ListItem>
                                  <asp:ListItem Value="0">不显示</asp:ListItem>
                              </asp:RadioButtonList></td>
                      </tr>
                  <tbody  id="showtg" runat="server">

                    <tr>
				    <td align='center' class='lefttd' style="width: 52px"><asp:CheckBox ID="C31" runat="server" /></td>
					<td height='30' align='right' class='lefttd' style="width: 186px"><strong>栏目是否允许投稿：</strong></td>
					<td height='28' class="righttd">
                        <asp:RadioButtonList ID="RdbPubFlag" runat="server" RepeatDirection="Horizontal">
                            <asp:ListItem Value="0">不允许</asp:ListItem>
                            <asp:ListItem Value="1" Selected>允许</asp:ListItem>
                        </asp:RadioButtonList></td>          
				 </tr>


				 <tr>
				    <td align='center' class='lefttd' style="width: 52px"><asp:CheckBox ID="C3" runat="server" /></td>
					<td height='30' align='right' class='lefttd' style="width: 186px"><strong>栏目是否允许投稿：</strong></td>
					<td height='28' class="righttd">
                        <asp:RadioButtonList ID="AllowPubInfo" runat="server" RepeatDirection="Vertical">
                            <asp:ListItem Value="0">①不允许</asp:ListItem>
                              <asp:ListItem Selected="True" Value="1">②完全开放投稿(<font color=blue>包括游客</font>)</asp:ListItem>
                              <asp:ListItem Value="2">③只开放会员投稿(<font color=red>游客除外</font>)</asp:ListItem>
                              <asp:ListItem Value="3">④只开放指定的会员组投稿</asp:ListItem>
                        </asp:RadioButtonList></td>          
				 </tr>
                      <tr>
                          <td align="center" class="lefttd" style="width: 52px"><asp:CheckBox ID="C4" runat="server" /></td>
                          <td align="right" class="lefttd" height="30" style="width: 186px">
                              <strong>允许此栏目下投稿的会员组：</strong>
                              <br />
                              <font color="blue">如果该栏目允许投稿选择上面第④种时，请在此设置允许在此栏目下投稿的会员组</font></td>
                          <td class="righttd" height="28" ID="PubGroupIDArea" runat="server">
                          </td>
                      </tr>
                      <tr>
                          <td align="center" class="lefttd" style="width: 52px"><asp:CheckBox ID="C5" runat="server" /></td>
                          <td align="right" class="lefttd" height="30" style="width: 186px">
                              <strong>会员投稿奖励</strong>：<br />
                              <span style="color: #ff0033">在会员中心发布信息，并通过审核后的奖励措施</span></td>
                          <td class="righttd">
                              <span style="display:none">会员每发表一条信息，可以得到<asp:TextBox ID="PubAddMoney" CssClass="textbox" runat="server" Style="text-align: center"
                                  Text="0" Width="37px"></asp:TextBox>元人民币（为0时不奖励）只有通过后台审核的才增加<br /></span>
                              会员每发表一条信息，可以得到<asp:TextBox ID="PubAddPoint" CssClass="textbox" runat="server" Style="text-align: center"
                                  Text="0" Width="37px"></asp:TextBox>点点券（为0时不奖励）<span class="tips">只有通过后台审核的才增加</span><br />
                              会员每发表一条信息，可以得到<asp:TextBox ID="PubAddScore" CssClass="textbox" runat="server" Style="text-align: center"
                                  Text="0" Width="37px"></asp:TextBox>分积分（为0时不奖励）<span class="tips">只有通过后台审核的才增加</span><br />
                          </td>
                      </tr>
                  </tbody>
                <tr>
				    <td align='center' class='lefttd' style="width: 52px"><asp:CheckBox ID="C10" runat="server" /></td>
					<td height='30' align='right' class='lefttd' style="width: 186px"><strong>在此栏目发表评论奖励：</strong> </td>
					<td height='28' class="righttd">
					   <asp:TextBox ID="TxtCmtAddScore" CssClass="textbox" Text="0" style="text-align:center" runat="server" Width="37px"></asp:TextBox>积分(为0时不奖励)<span class="tips">只有通过审核的的评论才奖励,建议设置奖励积分的情况，设置评论需要后台审核才显示。</span>
				    </td>
				 </tr>
                <tr>
				    <td align='center' class='lefttd' style="width: 52px"><asp:CheckBox ID="C11" runat="server" /></td>
					<td height='30' align='right' class='lefttd' style="width: 186px"><strong>点分享按钮赠送积分：</strong> </td>
					<td height='28' class="righttd">
					  <asp:TextBox ID="TxtShareAddScore" Text="0" CssClass="textbox" runat="server" Style="text-align: center"
                            Width="37px"></asp:TextBox>
                        分</td>
				 </tr>


				  <tr>
				    <td align='center' class='lefttd' style="width: 52px"><asp:CheckBox ID="C6" runat="server" /></td>
					<td height='30' align='right' class='lefttd' style="width: 186px"><strong>栏目模板：</strong> </td>
					<td height='28' class="righttd">
					  <input type="text" name='ClassTemplate' class="textbox" id="ClassTemplate" size='35'/>&nbsp;<input type='button' name="Submit" class="button" value="选择模板..." onclick="SelectTemplate('ClassTemplate');" />
				    </td>
				 </tr>
                 <tr<%=MyCache.GetCacheConfig(72)=="0"?" style='display:none'":"" %>>
				    <td align='center' class='lefttd' style="width: 52px"><asp:CheckBox ID="C8" runat="server" /></td>
					<td height='30' align='right' class='lefttd' style="width: 186px"><strong>手机版栏目模板：</strong> </td>
					<td height='28' class="righttd">
					  <input type="text" name='Class3GTemplate' class="textbox" id="Class3GTemplate" size='35'/>&nbsp;<input type='button' name="Submit" class="button" value="选择模板..." onclick="SelectTemplate('Class3GTemplate');" />
				    </td>
				 </tr>
				 <tr>
				   <td align='center' class='lefttd' style="width: 52px; height: 30px;"><asp:CheckBox ID="C7" runat="server" /></td>
				   <td align='right'  class='lefttd' style="width: 186px; height: 30px;"><strong>内容页模板：</strong></td>
				   <td class="righttd" style="height: 30px">
					  <input type="text" name='ContentTemplate' class="textbox" id="ContentTemplate" size='35' />&nbsp;<input type='button' name="Submit" class="button" value="选择模板..." onclick="SelectTemplate('ContentTemplate');" />  
					  <div class="tips">
					  <asp:CheckBox ID="CkbTBMB" runat="server" Checked="true" Text="同步更新已经添加的文档" />
					  </div>
					    </td>
                  </tr> 
				  <tr<%=MyCache.GetCacheConfig(72)=="0"?" style='display:none'":"" %>>
				   <td align='center' class='lefttd' style="width: 52px; height: 30px;"><asp:CheckBox ID="C9" runat="server" /></td>
				   <td align='right'  class='lefttd' style="width: 186px; height: 30px;"><strong>手机版内容页模板：</strong></td>
				   <td class="righttd" style="height: 30px">
					  <input type="text" name='Content3GTemplate' class="textbox" id="Content3GTemplate" size='35' />&nbsp;<input type='button' name="Submit" class="button" value="选择模板..." onclick="SelectTemplate('Content3GTemplate');" />  
					  <div class="tips">
					  <asp:CheckBox ID="CkbTB3GMB" runat="server" Checked="true" Text="同步更新已经添加的文档" />
					  </div>
					    </td>
                  </tr> 
                  
                         
				 </table>
			
			
		 </div>
		 
		 <div class="tab-page" id="tab1">
		  <h2 class="tab">生成选项</h2>
			<script type="text/javascript">
						 tabPane1.addTabPage( document.getElementById( "tab1" ) );
			</script>
              <table width="100%" border="0" cellpadding="1" cellspacing="1" class="CTable">
                <tr>
				  <td align='center' class='lefttd' style="width: 50px; "><asp:CheckBox ID="F1" runat="server" /></td>
                  <td class='lefttd' align="right" style="width: 181px">
                      <strong>生成选项：<br />
                      </strong><font color="#ff0000">不勾选表示不生成静态．以下选项仅启用静态后才有效</font></td>
                  <td class='righttd'>
                      <asp:RadioButtonList ID="CreateHtmlFlag" runat="server">
                          <asp:ListItem Selected="" Value="1">本栏目不启用生成静态HTML功能</asp:ListItem>
                          <asp:ListItem Value="2">仅启用内容页生成静态HTML功能</asp:ListItem>
                          <asp:ListItem Value="3">内容页及栏目页都启用生成静态HTML功能</asp:ListItem>
                      </asp:RadioButtonList></td>
                </tr>
                  <tr>
                      <td align="center" class="lefttd" style="width: 50px">
                          <asp:CheckBox ID="F2" runat="server" /></td>
                      <td align="right" class="lefttd" style="width: 181px">
                          <strong>自动生成选项：</strong>
                          <br />
                          <font color="red">设定＂添加/编辑＂内容时自动生成静态HTML的页面</font></td>
                      <td class="righttd">
                          <asp:RadioButtonList ID="AutoCreateType" runat="server">
                              <asp:ListItem Value="1">不自动生成（需要手工生成）</asp:ListItem>
                              <asp:ListItem Selected="True" Value="2">仅生成内容页&lt;font color=red&gt;（推荐）&lt;/font&gt;</asp:ListItem>
                              <asp:ListItem Value="3">自动生成内容页和所属的栏目页</asp:ListItem>
                              <asp:ListItem Value="4">自动生成内容页和所属的栏目页及关联的父栏目页</asp:ListItem>
                              <asp:ListItem Value="5">自动生成内容页和网站首页</asp:ListItem>
                              <asp:ListItem Value="6">自动生成内容页和所关联的栏目页及网站首页</asp:ListItem>
                          </asp:RadioButtonList></td>
                  </tr>
                  <tr id="fsoclassindx" runat="server">
                      <td align="center" class="lefttd" style="width: 50px">
                          <asp:CheckBox ID="F3" runat="server" /></td>
                      <td align="right" class="lefttd" style="width: 181px">
                          <strong>生成的栏目首页文件：</strong></td>
                      <td class="righttd">
                          <asp:TextBox ID="ClassFsoIndex" CssClass="textbox" runat="server" Text="index.html" Width="92px"></asp:TextBox>
                          <select id="select2" class="upfile" name="SelectClassFsoIndex" onchange="jQuery('#<%=this.ClassFsoIndex.ClientID %>').val(this.value);">
                              <option selected="selected" value="index.html">index.html</option>
                              <option value="index.htm">index.htm</option>
                              <option value="index.shtm">index.shtm</option>
                              <option value="index.shtml">index.shtml</option>
                              <option value="default.html">default.html</option>
                              <option value="default.htm">default.htm</option>
                              <option value="default.shtm">default.shtm</option>
                              <option value="default.shtml">default.shtml</option>
                              <option value="index.asp">index.asp</option>
                              <option value="default.asp">default.asp</option>
                              <option value="index.aspx">index.aspx</option>
                              <option value="default.aspx">default.aspx</option>
                          </select>
                      </td>
                  </tr>
                  <tr>
                      <td align="center" class="lefttd" style="width: 50px">
                          <asp:CheckBox ID="F4" runat="server" /></td>
                      <td align="right" class="lefttd" style="width: 181px">
                          <strong>内容页生成路径规则：</strong>
                          <br />
                          可用标签：{$ClassDir},{$Year},{$Month},{$Day}</td>
                      <td class="righttd">
                          <asp:TextBox ID="CreateInfoPath" CssClass="textbox" runat="server" Text="{$ClassDir}/" Width="283px"></asp:TextBox>必须与＂/＂结束<br />
                          <select name="SelectInfoFsoPath" onchange="if (this.value!=''){jQuery('#<%=this.CreateInfoPath.ClientID %>').val(this.value);}">
                              <option selected="selected" value="">--快速选择内容路径规则--</option>
                              <option value="{$ClassDir}/">{$ClassDir}/</option>
                              <option value="{$ClassDir}/{$Year}-{$Month}/">{$ClassDir}/{$Year}-{$Month}/</option>
                              <option value="{$ClassDir}/{$Year}/{$Month}/{$Day}/">{$ClassDir}/{$Year}/{$Month}/{$Day}/</option>
                              <option value="{$Year}/{$Month}/{$Day}/">{$Year}/{$Month}/{$Day}/</option>
                              <option value="{$Month}/{$Day}/">{$Month}/{$Day}/</option>
                              <option value="List/{$Month}/">List/{$Month}/</option>
                          </select>
                      </td>
                  </tr>
                  <tr>
                      <td align="center" class="lefttd" style="width: 50px; height: 57px">
                          <asp:CheckBox ID="F5" runat="server" /></td>
                      <td align="right" class="lefttd" style="width: 181px; height: 57px">
                          <strong>内容页生成文件名规则：</strong>
                          <br />
                          可用标签：{$InfoID},{$Year},{$Month},{$Day},{$RE}</td>
                      <td class="righttd" style="height: 57px">
                          <asp:TextBox ID="CretaeInfoFname" CssClass="textbox" runat="server" Text="{$InfoID}.html" Width="283px"></asp:TextBox><br />
                          <select name="SelectInfoName" onchange="if (this.value!=''){jQuery('#<%=this.CretaeInfoFname.ClientID %>').val(this.value);}">
                              <option selected="selected" value="">--快速选择文件名规则--</option>
                              <option value="{$InfoID}.htm">{$InfoID}.htm</option>
                              <option value="{$InfoID}.html">{$InfoID}.html</option>
                              <option value="{$Year}{$InfoID}.html">{$Year}{$InfoID}.html</option>
                              <option value="{$Year}{$Month}{$InfoID}.html">{$Year}{$Month}{$InfoID}.html</option>
                              <option title="随机时规则" value="{$RE}.html">{$RE}.html</option>
                              <option title="随机时规则" value="{$RE}.aspx">{$RE}.aspx</option>
                          </select>
                      </td>
                  </tr>
				</table>

			
			
		 </div>
		 
		 <div class="tab-page" id="tab2">
        <%if (KSCMS.S("from")=="shop"){ %>
		  <h2 class="tab" style="display:none">收费选项</h2>
        <%}else{ %>
		  <h2 class="tab">收费选项</h2>
		 <%} %>
		 
			<script type="text/javascript">
						 tabPane1.addTabPage( document.getElementById( "tab2" ) );
			</script>
			
            <table width="100%" border="0" cellpadding="1" cellspacing="1" class="CTable">
                <tr>
				  <td align='center' class='lefttd' style="width: 50px; text-align: center;"><asp:CheckBox ID="M1" runat="server" /></td>
                  <td class='lefttd' align="right" style="width: 181px">
                      <strong>浏览/查看权限：</strong></td>
                  <td class='righttd'>
                      <asp:RadioButtonList ID="ClassPurview" runat="server">
                          <asp:ListItem Selected="True" Value="0">开放栏目  &lt;font color=red&gt;任何人（包括游客）可以浏览和查看此栏目下的信息。&lt;/font&gt;</asp:ListItem>
                          <asp:ListItem Value="1">半开放栏目  &lt;font color=red&gt;任何人（包括游客）都可以浏览。游客不可查看，其他会员根据会员组的栏目权限设置决定是否可以查看。&lt;/font&gt;</asp:ListItem>
                          <asp:ListItem Value="2">认证栏目  &lt;font color=red&gt;游客不能浏览和查看，其他会员根据会员组的栏目权限设置决定是否可以浏览和查看。&lt;/font&gt;</asp:ListItem>
                      </asp:RadioButtonList></td>
                </tr>
                <tr>
                    <td align="center" class="lefttd" style="width: 50px; text-align: center">
                        <asp:CheckBox ID="M2" runat="server" /></td>
                    <td align="right" class="lefttd" style="width: 181px">
                        <strong>允许查看此栏目下信息的会员组：</strong>
                        <br />
                        <font color="blue">如果栏目是“认证栏目”，请在此设置允许查看此栏目下信息的会员组,如果在信息中设置了查看权限，则以信息中的权限设置优先</font></td>
                    <td id="ViewGroupIDArea" class="righttd" runat="server">
                    </td>
                </tr>
                <tr>
                    <td align="center" class="lefttd" style="width: 50px; text-align: center">
                        <asp:CheckBox ID="M3" runat="server" /></td>
                    <td align="right" class="lefttd" style="width: 181px">
                        <strong>默认阅读信息所需点数：<br />
                        </strong><span style="color: #0000ff">如果在信息中设置了阅读点数，则以信息中的点数设置优先</span></td>
                    <td class="righttd">
                        <asp:TextBox ID="DefaultReadPoint" CssClass="textbox" runat="server" Style="text-align: center" Text="0"
                            Width="55px"></asp:TextBox><span style="color: #ff0000"> 免费阅读请设为 "</span><font color="red"><span
                                style="color: #666666; background-color: #f0f9fe">0</span></font>"，否则有权限的会员阅读该栏目下的信息时将消耗相应点数，游客将无法阅读。</td>
                </tr>
                <tr>
                    <td align="center" class="lefttd" style="width: 50px; text-align: center">
                        <asp:CheckBox ID="M4" runat="server" /></td>
                    <td align="right" class="lefttd" style="width: 181px">
                        <strong>默认阅读信息重复收费：<br />
                        </strong><font color="blue">如果在信息中设置了此选项，则以信息中的设置优先</font></td>
                    <td class="righttd">
                        <asp:RadioButtonList ID="DefaultChargeType" runat="server">
                            <asp:ListItem Selected="True" Value="0">不重复收费(如果信息需扣点数才能查看，建议使用)</asp:ListItem>
                            <asp:ListItem Value="1">距离上次收费时间&lt;input type=&quot;text&quot; class=&quot;textbox&quot; style=&quot;text-align:center;&quot; value=&quot;12&quot; name=&quot;DefaultPitchTime&quot; size=&quot;5&quot;&gt;  小时后重新收费</asp:ListItem>
                            <asp:ListItem Value="2">会员重复阅读信息&lt;input type=&quot;text&quot; class=&quot;textbox&quot; style=&quot;text-align:center;&quot; value=&quot;10&quot; name=&quot;DefaultReadTimes&quot; size=&quot;5&quot;&gt;   页次后重新收费</asp:ListItem>
                            <asp:ListItem Value="3">上述两者都满足时重新收费</asp:ListItem>
                            <asp:ListItem Value="4">上述两者任一个满足时就重新收费</asp:ListItem>
                            <asp:ListItem Value="5">每阅读一页次就重复收费一次（建议不要使用,多页信息将扣多次点数）</asp:ListItem>
                        </asp:RadioButtonList></td>
                </tr>
                <tr>
                    <td align="center" class="lefttd" style="width: 50px; text-align: center">
                        <asp:CheckBox ID="M5" runat="server" /></td>
                    <td align="right" class="lefttd" style="width: 181px">
                        <strong>默认分成比例：<br />
                        </strong><span style="color: #0000ff">会员在此栏目下添加内容时，该内容默认的分成比例</span></td>
                    <td class="righttd">
                        <asp:TextBox ID="DefaultDividePercent" Text="0" CssClass="textbox" runat="server" Style="text-align: center"
                            Width="46px"></asp:TextBox>
                        %</td>
                </tr>
                </table>
			
		 </div>
		 
		 
	</div>
       <div style="clear:both;"></div>
		
       <script type="text/javascript">
		showtips(' <span class="state"><strong>说明：</strong><br /></span>1、若要批量修改某个属性的值，请先选中其左侧的复选框，然后再设定属性值。<br>2、这里显示的属性值都是系统默认值，与所选栏目的已有属性无关。');
		</script>

		</td>
    </tr>
  </table>
  
    <br />
    <KS:Foot ID="Foot1" runat="server" SubmitButtonText="执行批处理(0)" OnSubmit="Foot1_Submit"/>

</asp:Content>

