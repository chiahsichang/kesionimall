<%@ Page Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.Admin_Label_Label" Title="Untitled Page" Codebehind="KS.Label.aspx.cs" %>
<%@ Import Namespace="Kesion.Publics" %>
<%@ Import Namespace="Kesion.Cache" %>
<asp:Content ID="Content1" ContentPlaceHolderID="KSContent" Runat="Server">
<script type="text/javascript">
    function addclass(parentid,classid)
   {  
     parent.openWin("��ǩĿ¼����","label/KS.LabelClass.aspx?parentid="+parentid+"&classid="+classid+"&classtype=<%=LabelType %>",true,620,350);
    } 
    function label(title,url)
    {  
      parent.openWin(title,'label/'+url,true);
    } 
    function labelclone(labelid)
    {
     parent.openWin("��¡��ǩ","label/KS.LabelClone.aspx?labelid="+labelid,true,600,190);
    }
    function LabelMove() {
        var sid = GetMyIds();
        GetIDS();
        if (sid != null){
            parent.openWin("��ǩ�����ƶ�", "Label/KS.LabelMove.aspx?Ids=" + sid + "&LabelType=<%=LabelType %>", true,500, 360);
        }
        return false;
    }
    
    function GetMyIds() {
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
        return sid;
    }
    function edit(id,type,labelflag)
    {
      if (type==0){
       addclass(<%=ClassID %>,id);
      }
      else
      {
        switch (labelflag)
        {
           case 1:
             label("�޸��б�ʽ��ǩ����","KS.Label.List.aspx?labelid="+id);
             break;
           case 2:
             label("�޸Ļõ�Ƭ��ǩ����","KS.Label.Slide.aspx?labelid="+id);
             break;
           case 3:
             label("�޸�����������ǩ����","KS.Label.RollsPic.aspx?labelid="+id);
             break;
           case 4:
             label("�޸������Ϣ��ǩ����","KS.Label.Related.aspx?labelid="+id);
             break;
           case 7:
             location.href='KS.Label.Link.aspx?labelid='+id;
             break;
           case 8:
             label("�޸�λ�õ�����ǩ����","KS.Label.Navigation.aspx?labelid="+id);
             break;
           case 20:
             location.href='KS.Label.SpecialList.aspx?labelid='+id;
             break;
           case 21:
             label("�޸�ѭ����Ŀר���б��ǩ����","KS.Label.LoopSpecialList.aspx?labelid="+id);
             break;
           case 22:
             location.href='KS.Label.ViewHistoryList.aspx?labelid='+id;
             break;
           case 23:
             location.href='KS.Label.SpecialClassList.aspx?labelid='+id;
             break;
           case 24:
             location.href='KS.Label.SpecialPage.aspx?labelid='+id;
             break;
            case 25:
                location.href='KS.Label.Announce.aspx?labelid='+id;
                break;
            case 26:
                location.href='KS.Label.IRelated.aspx?labelid='+id;
                break;
            case 50:
             location.href='KS.Label.BlogArticle.aspx?labelid='+id;
             break;
           case 51:
                location.href='KS.Label.BlogAlbum.aspx?labelid='+id;
                break;
            case 52:
                location.href='KS.Label.BlogVisitors.aspx?labelid='+id;
                break;
            case 53:
                location.href='KS.Label.BlogComment.aspx?labelid='+id;
                break;
            case 54:
                location.href='KS.Label.BlogMessage.aspx?labelid='+id;
                break;
            case 55:
                location.href='KS.Label.Blog.aspx?labelid='+id;
                break;
           case 10:
             location.href='KS.Label.Intelligent.aspx?labelid='+id;
             break;
           case 11:
             location.href='KS.Label.LoopClass.aspx?labelid='+id;
             break;
           case 12:
             location.href='KS.Label.Page.aspx?labelid='+id;
             break;
           case 13:
             location.href='KS.Label.ProList.aspx?labelid='+id;
             break;
           case 14:
             location.href='KS.Label.ProLimitBuyList.aspx?labelid='+id;
             break;
           case 17:
             location.href='KS.Label.ProBrandList.aspx?labelid='+id;
             break;
           case 18:
             location.href='KS.Label.ProLimitBuyItemList.aspx?labelid='+id;
             break;
           case 19:
             location.href='KS.Label.ProGroupBuyList.aspx?labelid='+id;
             break;
           case 15:
             location.href='KS.Label.SQL.aspx?labeltype=<%=LabelType %>&labelid='+id;
             break;
           case 16:
             location.href='KS.Label.Class.aspx?labeltype=<%=LabelType %>&labelid='+id;
             break;
           case 200:
             location.href='KS.Label.SJList.aspx?labeltype=<%=LabelType %>&labelid='+id;
             break;
           case 201:
             location.href='KS.Label.SJReviews.aspx?labeltype=<%=LabelType %>&labelid='+id;
             break;
           case 202:
             location.href='KS.Label.AskList.aspx?labeltype=<%=LabelType %>&labelid='+id;
             break;
           case 203:
             location.href='KS.Label.SJClass.aspx?labeltype=<%=LabelType %>&labelid='+id;
             break;
           case 204:
             location.href='KS.Label.AskClass.aspx?labeltype=<%=LabelType %>&labelid='+id;
             break;
           case 205:
             location.href='KS.Label.AskZJList.aspx?labeltype=<%=LabelType %>&labelid='+id;
             break;
           case 100:
             location.href='KS.Label.Var.aspx?labelid='+id;
             break;
             
        }
       
      } 
    }
   </script>
<div id="manage_top" class="menu_top_fixed">
<ul>
      <li id='p1'>
      <a href="#" onclick="addclass(<%=ClassID %>,0);return false;" title="������ǩ����"><b></b>�½�����</a></li>
      <%if (LabelType==4) 
        {%>
      <li id='p8'><a href="KS.Label.Var.aspx?LabelType=<%=LabelType %>&ClassID=<%=ClassID %>"><b></b>�½���ǩ</a></li>
        <%
        }
        else if(LabelType==3)
        {%>
      <li id='p8'><a href="KS.Label.SQL.aspx?LabelType=<%=LabelType %>&ClassID=<%=ClassID %>"><b></b>�½���ǩ</a></li>
        <%}
        else
        { %>
      <li id='p8'><a href="javascript:void(0);" onMouseOver="jQuery('#lbtype').css('display','');"><b></b>�½���ǩ<span style="background:url('../../admin/images/list.png') center no-repeat;">&nbsp;&nbsp;</span></a></li>
      <%} %>
      <li id="p3"><asp:LinkButton ID="delLabel" runat="server" Text="ɾ����ǩ" OnClick="DelButton_Click" OnClientClick="return(GetIDS());"><b></b>ɾ����ǩ</asp:LinkButton></li>
      <li id="p3"><a href="KS.Label.Clear.aspx"><b></b>������ñ�ǩ</a></li>
      <li id="p2"><asp:LinkButton ID="moveLabel" runat="server" Text="�ƶ���ǩ" OnClientClick="return(LabelMove())"><b></b>�ƶ���ǩ</asp:LinkButton></li>
      <li id='p9'><a href="?LabelType=<%=LabelType %>&ClassID=<%=ParentID %>"><b></b>����һ��</a></li></ul>
  </div>
  <div class="menu_top_fixed_height"></div> 
  <%if (LabelType == 2)
    { %>
  <style>
  .labellist{width:450px;overflow:auto;}
  .labellist div{width:150px;height:25px;float:left}
  .labellist li{clear:both}
  </style>
  <%}
    else
    {%>
    <style>
  .labellist{width:140px}
  </style>
  <%} %>
<div style="position:relative; z-index:400">
<div id="lbtype" style="position:absolute;left:80px; top:-16px;display:none" onMouseOver="jQuery('#lbtype').show();"  onmouseout="jQuery('#lbtype').hide();">
<div class="labellist" style="background-color: #f0f9fe; border-right-width: 1px;border-bottom-width: 1px;border-left-width: 1px;border-right-style: solid; border-bottom-style: solid;	border-left-style: solid;	border-right-color: #BCDBF8;border-bottom-color: #BCDBF8;border-left-color: #BCDBF8;padding: 0px 0px 5px 0px;  filter:alpha(opacity=85);">

<%if (LabelType==1)
  { %>
<div style="padding-top:2px;"><span class="bullet"></span><a href="#" onclick="label('��Ϣ�б��ǩ','KS.Label.List.aspx?classid=<%=ClassID %>&labeltype=<%=LabelType %>');return false;"><b>��Ϣ�б����ǩ</b></a></div>
<div style="padding-top:2px;"><span class="bullet"></span><a href="#" onclick="label('�õ�Ƭ��ǩ','KS.Label.Slide.aspx?classid=<%=ClassID %>&labeltype=<%=LabelType %>');return false;"><b>�õ�Ƭ��ǩ</b></a></div>
<div style="padding-top:2px;"><span class="bullet"></span><a href="#" onclick="label('��������ͼƬ��ǩ','KS.Label.RollsPic.aspx?classid=<%=ClassID %>&labeltype=<%=LabelType %>');return false;"><b>��������ͼƬ��ǩ</b></a></div>
<div style="padding-top:2px;"><span class="bullet"></span><a href="#" onclick="label('�����Ϣ��ǩ','KS.Label.Related.aspx?classid=<%=ClassID %>&labeltype=<%=LabelType %>');return false;"><b>�����Ϣ��ǩ</b></a></div>
<div style="padding-top:2px;">=============</div>
<div style="padding-top:2px;"><span class="bullet"></span><a href="#" onclick="label('λ�õ�����ǩ','KS.Label.Navigation.aspx?classid=<%=ClassID %>&labeltype=<%=LabelType %>');return false;"><b>λ�õ�����ǩ</b></a></div>
<!--
<div style="padding-top:2px;">=============</div>
<div style="padding-top:2px;"><span class="bullet"></span><a href="#" onclick="label('ѭ����Ŀר���б��ǩ','KS.Label.LoopSpecialList.aspx?classid=<%=ClassID %>&labeltype=<%=LabelType %>');return false;"><b>ѭ��ר���б��ǩ</b></a></div>
-->
<%}
  else if (LabelType == 2)
  { %>
<div><span class="bullet"></span><a href="KS.Label.Intelligent.aspx?classid=<%=ClassID %>&labeltype=<%=LabelType %>"><b>�Զ����б��ǩ</b></a></div>
<div><span class="bullet"></span><a href="KS.Label.LoopCLass.aspx?classid=<%=ClassID %>&labeltype=<%=LabelType %>"><b>ѭ����Ŀ�б��ǩ</b></a></div>
<div><span class="bullet"></span><a href="KS.Label.Page.aspx?classid=<%=ClassID %>&labeltype=<%=LabelType %>"><b>�ռ���ҳ�б��ǩ</b></a></div>
<div><span class="bullet"></span><a href="KS.Label.ViewHistoryList.aspx?classid=<%=ClassID %>&labeltype=<%=LabelType %>"><b>�����������ĵ�</b></a></div>
<div><span class="bullet"></span><a href="KS.Label.IRelated.aspx?classid=<%=ClassID %>&labeltype=<%=LabelType %>"><b>����ĵ��б��ǩ</b></a></div>
<div><span class="bullet"></span><a href="KS.Label.Class.aspx?classid=<%=ClassID %>&labeltype=<%=LabelType %>"><b>��Ŀ������ǩ</b></a></div>
<div><span class="bullet"></span><a href="KS.Label.SpecialList.aspx?classid=<%=ClassID %>&labeltype=<%=LabelType %>"><b>ר���б��ǩ</b></a></div>
<div><span class="bullet"></span><a href="KS.Label.SpecialClassList.aspx?classid=<%=ClassID %>&labeltype=<%=LabelType %>"><b>ר������б��ǩ</b></a></div>
<div><span class="bullet"></span><a href="KS.Label.SpecialPage.aspx?classid=<%=ClassID %>&labeltype=<%=LabelType %>"><b>��ҳ��ʾר���б��ǩ</b></a></div>
<div><span class="bullet"></span><a href="KS.Label.Link.aspx?classid=<%=ClassID %>&labeltype=<%=LabelType %>"><b>�������ӱ�ǩ</b></a></div>
<div><span class="bullet"></span><a href="KS.Label.Announce.aspx?classid=<%=ClassID %>&labeltype=<%=LabelType %>"><b>�����б��ǩ</b></a></div>
 <%if (MyCache.GetAskCacheConfig(0) == "1")
   {%>
   <li>==================================================</li>
 <div><span class="bullet"></span><a href="KS.Label.AskClass.aspx?classid=<%=ClassID %>&labeltype=<%=LabelType %>"><b>�ʴ�����б��ǩ</b></a></div>
 <div><span class="bullet"></span><a href="KS.Label.AskList.aspx?classid=<%=ClassID %>&labeltype=<%=LabelType %>"><b>�ʴ������б��ǩ</b></a></div>
 <div><span class="bullet"></span><a href="KS.Label.AskZJList.aspx?classid=<%=ClassID %>&labeltype=<%=LabelType %>"><b>�ʴ�ר���б��ǩ</b></a></div>

 <%
     }
  if (MyCache.GetSJCacheConfig(0) == "1")
   { %>
   <li>==================================================</li>
    <div><span class="bullet"></span><a href="KS.Label.SJClass.aspx?classid=<%=ClassID %>&labeltype=<%=LabelType %>"><b>�Ծ�����б��ǩ</b></a></div>
    <div><span class="bullet"></span><a href="KS.Label.SJList.aspx?classid=<%=ClassID %>&labeltype=<%=LabelType %>"><b>�Ծ��б��ǩ</b></a></div>
    <div><span class="bullet"></span><a href="KS.Label.SJReviews.aspx?classid=<%=ClassID %>&labeltype=<%=LabelType %>"><b>�����ĵ��б��ǩ</b></a></div>
 <%}
  if (Utils.GetSysInfo("//sysinfo/model/mall").ToString().ToLower()=="true") 
{ %>
   <li>==================================================</li>
    <div><span class="bullet"></span><a href="KS.Label.ProList.aspx?classid=<%=ClassID %>&labeltype=<%=LabelType %>"><b>��Ʒ�б��ǩ</b></a></div>
    <div><span class="bullet"></span><a href="KS.Label.ProLimitBuyList.aspx?classid=<%=ClassID %>&labeltype=<%=LabelType %>"><b>������Ʒ�б��ǩ</b></a></div>
    <div><span class="bullet"></span><a href="KS.Label.ProLimitBuyItemList.aspx?classid=<%=ClassID %>&labeltype=<%=LabelType %>"><b>������Ŀ�б��ǩ</b></a></div>
    <div><span class="bullet"></span><a href="KS.Label.ProBrandList.aspx?classid=<%=ClassID %>&labeltype=<%=LabelType %>"><b>Ʒ���б��ǩ</b></a></div>
    <div><span class="bullet"></span><a href="KS.Label.ProGroupBuyList.aspx?classid=<%=ClassID %>&labeltype=<%=LabelType %>"><b>�Ź���Ʒ�б��ǩ</b></a></div>
    <div><span class="bullet"></span><a href="KS.Label.ViewHistoryList.aspx?classid=<%=ClassID %>&labeltype=<%=LabelType %>&basicType=4"><b>������������Ʒ</b></a></div>
 <%} %>

   <li>==================================================</li>
<div><span class="bullet"></span><a href="KS.Label.Blog.aspx?classid=<%=ClassID %>&labeltype=<%=LabelType %>"><b>�ռ��ǩ</b></a></div>
<div><span class="bullet"></span><a href="KS.Label.BlogArticle.aspx?classid=<%=ClassID %>&labeltype=<%=LabelType %>"><b>�����б��ǩ</b></a></div>
<div><span class="bullet"></span><a href="KS.Label.BlogAlbum.aspx?classid=<%=ClassID %>&labeltype=<%=LabelType %>"><b>����б��ǩ</b></a></div>
<div><span class="bullet"></span><a href="KS.Label.BlogVisitors.aspx?classid=<%=ClassID %>&labeltype=<%=LabelType %>"><b>�ռ�ÿͱ�ǩ</b></a></div>
<div><span class="bullet"></span><a href="KS.Label.BlogComment.aspx?classid=<%=ClassID %>&labeltype=<%=LabelType %>"><b>�ռ����۱�ǩ</b></a></div>
<div><span class="bullet"></span><a href="KS.Label.BlogMessage.aspx?classid=<%=ClassID %>&labeltype=<%=LabelType %>"><b>�ռ����Ա�ǩ</b></a></div>

<%} %>
</div>
</div>
</div>
  
 <KS:KSGV ID="List" cssclass="CTable" runat='server' AllowPaging="true" PageSize="20" 
        PagerType="CustomNumeric" Width="99%" EmptyDataText="û���ҵ���ǩ��¼��" AutoGenerateColumns="False" GridLines="None" 
        OnRowDataBound="List_RowDataBound" OnRowCommand="List_RowCommand" 
        OnRowCreated="List_RowCreated" 
        onpageindexchanging="List_PageIndexChanging" CellSpacing="1">
                <Columns>
                    <asp:BoundField HeaderText="��ǩID" DataField="classid" >
                        <itemstyle horizontalalign="Center" />
                    </asp:BoundField>

               <asp:TemplateField HeaderText="&lt;input type='checkbox' name='chkall' id='chkall' onclick='CheckAll(this.form);'/&gt;">
                        <ItemStyle HorizontalAlign="Center"  Width="35px"/>
                        <ItemTemplate>
                         <%#GetCheckBox(Convert.ToInt16(Eval("OrderID")),Convert.ToInt32(Eval("classid"))) %>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="��ǩ����">
                        <itemtemplate>
                        &nbsp;
                            <%#GetImg(Convert.ToInt16(Eval("OrderID")),LabelType)%>
                             <%#GetName(Convert.ToString(Eval("ClassName")),Convert.ToInt32(Eval("ClassID")),Convert.ToInt32(Eval("OrderID")),Convert.ToInt32(Eval("labelflag"))) %> 
                        </itemtemplate>
                    </asp:TemplateField>
                    <asp:BoundField HeaderText="�� ��" DataField="orderid" >
                        <itemstyle horizontalalign="Center" />
                    </asp:BoundField>
                    <asp:BoundField HeaderText="��ǩ����" DataField="LabelFlag" >
                        <itemstyle horizontalalign="Center" />
                    </asp:BoundField>
                    <asp:TemplateField HeaderText="����ʱ��">
                        <itemstyle horizontalalign="Center" />
                        <itemtemplate>
                         <span class="tips"><%# Utils.FormatHumanizedTime(Convert.ToDateTime(Eval("AddDate"))) %></span>
                        </itemtemplate>
                    </asp:TemplateField>


                    <asp:TemplateField HeaderText="�༭">
                       <itemstyle horizontalalign="Center" width="25px"/>
                        <itemtemplate>
                          <a href="#" class="edit" onclick="edit(<%# Eval("ClassID", "{0}")%>,<%#Eval("orderid") %>,<%#Eval("labelflag") %>);return false;" title="�༭"></a>
                        </itemtemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="ɾ��">
                       <itemstyle horizontalalign="Center" width="25"/>
                        <itemtemplate>
                         <a class="delete" href='?Action=del&id=<%#Eval("classid") %>&orderid=<%#Eval("orderid") %>&labeltype=<%=LabelType %>&ClassID=<%=ClassID %>' title="ɾ��" onclick="return(confirm('�˲��������棬ȷ��ɾ��������?'))"></a>
                        </itemtemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="��¡">
                        <itemstyle horizontalalign="Center" width="25"/>
                    <itemtemplate>
                        <a href="javascript:" onclick="labelclone(<%# Eval("classid") %>)"  title="��¡��ǩ" class="copy"></a>
                      </itemtemplate>
                    
                    </asp:TemplateField>
                </Columns>
                <PagerSettings FirstPageText="��ҳ" LastPageText="ĩҳ" Mode="NumericFirstLast" 
                    NextPageText="��һҳ" PreviousPageText="��һҳ" />
                <EmptyDataRowStyle CssClass="emptycss" />
                <PagerStyle BorderStyle="None" BorderWidth="1px" Height="40px" Wrap="True" />
                <HeaderStyle CssClass="CTitle" />
            </KS:KSGV>

        
           <br /><br />
           <div class="message">
              <strong>������ǩ��</strong><asp:TextBox runat="server" ID="TxtKeyWord" CssClass="textbox" /> 
            <asp:Button ID="BtnSearch" runat="server" CssClass="button" Text="��ʼ����" 
                           onclick="BtnSearch_Click" />
        </div>
           
</asp:Content>

