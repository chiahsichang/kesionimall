<%@ Page Title="" Language="C#" MasterPageFile="User.master" AutoEventWireup="true" CodeBehind="User.aspx.cs" Inherits="Kesion.NET.WebSite._3G.User" %>
<%@ Import Namespace="Kesion.BLL" %>
<asp:Content ID="Content1" ContentPlaceHolderID="KSContent" runat="server">
              <div class="userleft">
			  	<div class="userleftbg"></div><img src="<%=__info.UserFace %>" width="80" onerror="this.src='../sysimg/face/boy.jpg'"/>
			</div>	
			 <div class="userright">
						
							<div class="username"><%=__info.UserName %><a href="UserLoginOut.aspx" onClick="return(confirm('确定退出吗？'));">[退出]</a></div>
							
					
                       
							<div class="userjbie"><%=UserGroupManage.GetUserGroupInfo(__info.GroupID).GroupName%></div>
							
							<label>姓&nbsp;&nbsp;&nbsp;&nbsp;名：</label>
							<%=__info.RealName %>
						
						<br />
							<label>性&nbsp;&nbsp;&nbsp;&nbsp;别：</label>
							<%=__info.Sex %>
						
						<br />
							<label>电子邮件：</label>
							<%=__info.Email %>
						
						<br />
							<label>手机号码：</label>
							<%=__info.Mobile %>
						
						<br />
							<label>资&nbsp;&nbsp;&nbsp;&nbsp;金：</label>
							<%=__info.Money %>  元
						
						<br />
							<label>点&nbsp;&nbsp;&nbsp;&nbsp;券：</label>
							<%=__info.Point %> 个
						
						<br />
							<label>总&nbsp;积&nbsp;分：</label>
							<%=__info.Score %>  分
						
						<br />
							<label>已用积分：</label>
							<%=__info.ScoreHasUse %> 分
						
						<br />
							<label>可用积分：</label>
							<%=__info.Score-__info.ScoreHasUse %> 分
					</div>
				<div class="clear"></div>
</asp:Content>
