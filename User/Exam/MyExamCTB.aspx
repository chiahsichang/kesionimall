<%@ Page Language="C#" MasterPageFile="~/User/User.master" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.MyExamCTB" Title="Untitled Page" Codebehind="MyExamCTB.aspx.cs" %>
<%@ Import Namespace="Kesion.Cache" %>
<%@ Import Namespace="Kesion.Publics" %>
<asp:Content ID="Content1" ContentPlaceHolderID="KSContent" Runat="Server">
<script src="../../<%=MyCache.GetSJCacheConfig(1) %>/exam.js"></script>
<style>
.anstext{border:0px;border-bottom:1px solid #333;width:100px;padding-left:10px;}
.anstable{border:#E5E5E5 1px solid;padding:1px;}
.anstable split. td{background:#FAFAFA;font-size:12px;padding-left:12px;}
.anstable .t{background:#DBE9F6;height:28px;line-height:28px;}
.anstable .t td{font-size:12px;padding-left:12px;padding-right:12px;}

.stborder{ border:1px solid #CCC;padding:10px;}
.stborderover{ border:2px solid green;padding:9px;background:#f1f1f1;}
.dtclass{text-align:left;padding:10px;border:1px solid #cccccc;background:#efefef;font-size:14px;font-weight:bold;}
.dtclass span{font-size:12px;font-weight:normal;color:#999;}
.sjlist .xttitleclass{text-align:left;font-size:14px;padding-bottom:8px; border-bottom:1px dashed #CCCCCC;}
.sjlist .xttitleclass .xihao{font-size:16px;color:#0099CC}
.sjlist .xtcontentclass{text-align:left;}
.sjlist .xtdaanclass{text-align:left;}
.sjlist .sttj{margin:20px;margin-left:0px;}
.sjlist .sttj .ctb{color:green}
.sjlist .sttj .dtctb{color:red}
.sjlist .tips{font-size:12px;color:#999}
.zgtgftitle{border:1px solid #ccc;height:40px;line-height:40px;font-size:14px;font-weight:bold;background:#f1f1f1;}
.zgtgftitle span{color:red;}
.zgtgftips{color:green;}
.zgtgftips .fs{color:#ff6600;}
.kgtgftips .fs{color:#ff6600;}

.media{width:300px;display:block;word-break:break-all;float:right;padding-top:10px;}
.media .mediabtn{margin:5px;padding-left:40px}
.media .mediabtn span{cursor:pointer;color:#ff6600;font-size:14px}
.media .mediatxt{padding:10px;display:none;border:1px solid #ff6600;}
.explainbox{height:50px;padding:6px;background:#FFFBD8;margin:0 auto;margin-bottom:5px;border:1px solid #F9C943;text-align:center;}
.explainbox table{width:200px;}
.explainbox .r{float:left;margin-right:40px}
.explainbox .l{float:left}
.explainbox a{color:#ff6600}
</style>
<asp:Panel ID="PanList" runat="server">
<div class="toptips">
    &nbsp;&nbsp;<%=ItemName %>���� <asp:Label ID="Lab_Total_Info" runat="server" Text=""></asp:Label> ������
 </div>
    <asp:Repeater ID="Repeater1" runat="server">
    <HeaderTemplate>
         <table id="tablist" width="98%" border="0" align="center" cellpadding="2" cellspacing="1" class="border">
      <tr align="center" class="title">
        	<td width="50" align="center">ѡ��</td>
        	<td  align="center"> ��Ŀ����</td>
            <td width="100" align="center">����ʱ��</td>
            <td width="125" align="center">����</td>
        </tr>
    </HeaderTemplate>
    <ItemTemplate>
      <tr class="tdbg">
          <td class="splittd" align="center"><input type="checkbox" name="ids" value="<%#Eval("ID") %>" /></td>
          <td class="splittd"> 
           <strong><%# Container.ItemIndex + 1 + (CurrPage - 1) * PageSize%>����Ŀ:<%# ReplaceTMNR(Convert.ToString(DataBinder.Eval(Container.DataItem, "Title")), Convert.ToInt16(Eval("id")))%> </strong><div style='height:6px;overflow:hidden'></div> 
 <%# ReplaceTMNR(Convert.ToString(DataBinder.Eval(Container.DataItem, "TMNR")),Convert.ToInt16(Eval("id")))%>
          </td>
         
          <td class="splittd" align="center" nowrap><%# Utils.FormatHumanizedTime(Convert.ToDateTime(Eval("AddDate")))%></td>
          <td class="splittd" align="center">
           <div class="bt"><a href='?action=Detail&id=<%#Eval("TMID") %>'>����</a></div>
           <div class="bt"><a onclick="return(confirm('ȷ���Ƴ���'));" href='?action=Cancel&ids=<%#Eval("ID") %>'>ȡ ��</a></div>
           </td>

      </tr>  

     </ItemTemplate>
     <FooterTemplate>
               <tr class="tdbg" style="display:<%# bool.Parse((Repeater1.Items.Count==0).ToString())?"":"none"%>">
                <td class="splittd" style="text-align:center" colspan="4">
                  û�м�¼��
                </td>
     </tr> 

    </table>
     </FooterTemplate>
    </asp:Repeater>
    
    &nbsp;&nbsp;<input type="checkbox" name="chkall" id="chkall" onclick="CheckAll(this.form);"/>ȫѡ  <asp:Button CssClass="button" ID="ButtonRemove" runat="server" Text="�� ��" OnClick="ButtonRemove_Click"/>
   <br />
    
     <KS:Page ID="Page1" runat="server" />
</asp:Panel>

<asp:Panel ID="PanDetail" runat="server" Visible="false">
  <script>
      dir = "../../<%=MyCache.GetSJCacheConfig(1) %>/";
      fromuser = 1;
  </script>
   <table id="tablist" width="98%" border="0" align="center" cellpadding="2" cellspacing="1" class="border">
      <tr class="title">
      <td>�鿴��������</td>
      </tr>
      <tr>
       <td>
          <asp:Label ID="LabContent" runat="server"></asp:Label>
      </td>
     </tr>
    </table>
  <div style="margin:20px;text-align:center">
     
      <input type="button" class="button" value="������һҳ" onclick="history.back();" />
  </div>
</asp:Panel>
</asp:Content>