<%@ Page Language="C#" ValidateRequest="false" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.Admin_Template" Title="模板管理" Codebehind="KS.Template.aspx.cs" %>
<asp:Content ID="Content1" ContentPlaceHolderID="KSContent" Runat="Server">
 <div id="manage_top" class="menu_top_fixed">
<ul>
      <li id='p1'><a href="#" onclick="addtemplate();return false;" title="创建一个空模板"><b></b>新建模板</a></li>
      <li id='p5'><a href="#" onclick="uptemplate();return false;"><b></b>上传模板</a></li>
      <li id='p6'><a href="KS.Template.aspx"><b></b>回主目录</a></li>
      <li id='p9'><a href="?Action=sublist&currpath=<%=_PreFolder %>"><b></b>回上一级</a></li></ul>
 </div>
 <div class="menu_top_fixed_height"></div>  
<script>
    function uptemplate()
   {  
      parent.openWin("上传模板文件","Label/KS.TemplateUp.aspx?currpath=<%=_CurrPath %>",true,620,260);
    } 
    function addtemplate()
   {  
      parent.openWin("创建模板文件","Label/KS.TemplateAdd.aspx?currpath=<%=_CurrPath %>",true,620,220);
    } 
    function insertlabel(title,url,width,height,scroll)
    {
        if (pos == null) { alert('请先定位插入位置!'); return false; }
     parent.openWin(title,url,false,width,height);
    }
    function insertparamlabel(title,url,width,height,scroll) {
        top.box.close();
        parent.openWin(title, url, false, width, height);
      
    }

    var pos = null;
    function setPos() {
        if (document.all) {
            jQuery("#<%=this.FileContent.ClientID %>").focus();
            pos = document.selection.createRange();
        } else {
            pos = jQuery("#<%=this.FileContent.ClientID %>")[0].selectionStart;
        }
    }

    function InsertLabel(Val)
    {
        if (pos == null) { alert('请先定位插入位置!'); return false; }
        if (document.all) {
            pos.text = Val;
        } else {
            var obj = jQuery("#<%=this.FileContent.ClientID %>");
            var lstr = obj.val().substring(0, pos);
            var rstr = obj.val().substring(pos);
            obj.val(lstr + Val + rstr);
        }

      top.box.close();
      return false;
     }
   </script>
    <table style="display:none" width="100%" border="0" cellpadding="1" cellspacing="1" class="CTable">
         <tr>
         <td height="25" width="70" class="righttd"><strong>当前目录：</strong></td>
         <td style="width: 491px" class="righttd">
         <div id="Pathlist" runat="server"></div>
         </td>
             <td style="text-align: center">
                 <a href="KS.Template.aspx"><span style="color: #ff0000; text-decoration: underline">←回主目录</span></a>&nbsp;&nbsp; <a href="?Action=sublist&currpath=<%=_PreFolder %>"><font
                     color="#ff0000"><span style="text-decoration: underline">↑上一目录</span></font></a></td>
         </tr>
         </table>
    
    
        <asp:Panel ID="mainlist" runat="server" Width="100%">
            <KS:KSGV ID="dlPubInfo" cssclass="CTable" runat='server' OnRowDataBound="dlPubInfo_RowDataBound" PagerType="CustomNumeric"  Width="99%" AutoGenerateColumns="False" GridLines="None" OnRowCommand="dlPubInfo_RowCommand" OnRowCreated="dlPubInfo_RowCreated">
                <Columns>
                    <asp:TemplateField HeaderText="模板名称">
                        <itemtemplate>
                        <%#GetImg(Eval("TypeName", "{0}"))%><%# GetName(Eval("TypeName", "{0}"), Eval("Name", "{0}"))%>
                        </itemtemplate>
                    </asp:TemplateField>

                     <asp:TemplateField HeaderText="类型">
                      <itemstyle horizontalalign="Center"/>
                      <itemtemplate>
                      <span class="tips"><%# Eval("TypeName")%></span>
                      </itemtemplate>
                    </asp:TemplateField>
                     <asp:TemplateField HeaderText="大小">
                      <itemstyle horizontalalign="Center"/>
                      <itemtemplate>
                      <span class="tips"><%# Eval("Size") %></span>
                      </itemtemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="修改时间">
                      <itemstyle horizontalalign="Center"/>
                      <itemtemplate>
                      <span class="tips"><%# Eval("Time") %></span>
                      </itemtemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="编辑">
                      <itemstyle width="30px" horizontalalign="Center"/>
                      <itemtemplate>
                         <%# Eval("TypeName") == "目录" ? "---" : "<a href='?action=txtedit&currpath=" + Server.UrlEncode(ParentPath) + "&filename=" + Server.UrlEncode(Eval("name").ToString()) + "' class='edit'>编辑</a>"%>
                             <asp:LinkButton Visible="false" ID="LinkTxtEdit" CssClass="edit" ToolTip="文本编辑" CommandArgument='<%# Eval("Name", "{0}")%>' CommandName="txtedit" runat="server"></asp:LinkButton>
                      </itemtemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="删除">
                      <itemstyle width="30px" horizontalalign="Center"/>
                      <itemtemplate>
                     <asp:LinkButton ID="LinkDelButton" CssClass="delete" ToolTip="删除" CommandArgument='<%# Eval("TypeName", "{0}")+"|"+Eval("Name", "{0}")%>' CommandName="del" runat="server"></asp:LinkButton>
                      </itemtemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="重命名">
                        <itemstyle width="40px" horizontalalign="Center" />
                    <itemtemplate>
                    <a class="rename" href="javascript:void(0)"  title="重命名" onclick="javascript:edit('<%#Eval("Name", "{0}")%>');return false;"></a>  
                     <span style="display:none"> <asp:LinkButton ID="LinkViewEdit" Text="可视化编辑" CommandArgument='<%# Eval("Name", "{0}")%>' CommandName="viewedit" runat="server"></asp:LinkButton></span>
                    
</itemtemplate>
                    
                    </asp:TemplateField>
                </Columns>
                <EmptyDataRowStyle CssClass="emptycss" />
                <HeaderStyle CssClass="CTitle" />
                <EmptyDataTemplate>
                 该目录下没有模板，点此<a href="#" onclick="addtemplate();return false;" title="创建一个空模板">新建模板</a>
                </EmptyDataTemplate>
            </KS:KSGV>
        
        
             
              <script type="text/javascript">
               function edit(FolderName)
               {var ReturnValue='';
               ReturnValue=prompt('修改的名称：',FolderName);
			   if ((ReturnValue!='') && (ReturnValue!=null) && (ReturnValue!=FolderName)) location.href='?action=rename&currpath=<%=ParentPath %>&oldname='+FolderName+'&newname='+ReturnValue;
               }
              </script>

              </asp:Panel>
              
        <asp:Panel ID="addlist" Visible="false" runat="server" Width="100%">
        <table width="100%" border="0" cellpadding="1" cellspacing="1" class="CTable">
           <tr class="ctr">
           <td align="right" class="CLeftTitle" style="width: 73px">
               <strong>文 件 名：</strong></td>
           <td>
               <asp:TextBox ID="FileName" CssClass="textbox" runat="server" Width="366px"></asp:TextBox></td>
           </tr>
           <tr class="ctr">
            <td align="right" class="CLeftTitle" style="width: 73px"><strong>标签列表：</strong></td>
            <td height="35">
            <div class="labels">
             <ul>
               <li><a href="#" onclick="insertlabel('插入网站公用标签','Label/KS.LabelCommon.aspx',780,500,'auto');return false;">公用标签</a></li>
               <li><a href="#" onclick="insertlabel('入门级标签','Label/KS.LabelFun.aspx?LabelType=1',780,500,'auto');return false;">入门级标签</a></li>
               <li><a href="#" onclick="insertlabel('中级标签','Label/KS.LabelFun.aspx?LabelType=2',780,500,'auto');return false;">中级标签</a></li>
               <li><a href="#" onclick="insertlabel('中级标签','Label/KS.LabelFun.aspx?LabelType=3',780,500,'auto');return false;">高级标签</a></li>
               <li><a href="#" onclick="insertlabel('插入内容页标签','Label/KS.LabelContent.aspx',780,500,'auto');return false;">内容页标签</a></li>
               <li><a href="#" onclick="insertlabel('插入专题系统标签','Label/KS.LabelSpecial.aspx',780,500,'auto');return false;">专题系统标签</a></li>
               <!--<li><a href="#" onclick="insertlabel('插入B2B内容页标签','Label/KS.Labelb2BContent.aspx',660,400,'auto');return false;">b2b内容页标签</a></li>-->
             </ul>
            </div>
            
            </td>
           </tr>
            <tr class="ctr">
                <td style="height: 208px" colspan="2">
                    <div id="txtarea" runat="server">
                    <script>
		            function show_ln(txt_ln,txt_main){
			            var txt_ln  = document.getElementById(txt_ln);
			            var txt_main  = document.getElementById(txt_main);
			            txt_ln.scrollTop = txt_main.scrollTop;
			            while(txt_ln.scrollTop != txt_main.scrollTop)
			            {
				            txt_ln.value += (i++) + '\n';
				            txt_ln.scrollTop = txt_main.scrollTop;
			            }
			            return;
		            }
		            </script>
		            <table border="0" width="100%" cellpadding="0" cellspacing="0">
		             <tr>
		             <td width="20" valign="top">
		             <textarea runat="server" id='txt_ln' name='rollContent' cols='6' style='overflow:hidden;height:400px;background-color:highlight;border-right:0px;text-align:right;font-family: tahoma;font-size:12px;font-weight:bold;color:highlighttext;cursor:default;' readonly></textarea>
		             </td>
		             <td valign="top">
		             <asp:TextBox ID="FileContent" onclick="setPos()" onkeyup="setPos()" runat="server" Height="398px" TextMode="MultiLine" Width="98%"></asp:TextBox>
                    </td>
		             </tr>
		            </table>
                    </div>
                    <div id="viewarea" runat="server">
                    </div>
                    
                    </td>
            </tr>
           </table>
           <div align="center">
              <asp:TextBox ID="ActionType" runat="server"></asp:TextBox>
              <br />
               <KS:Foot ID="Foot1" runat="server" OnSubmit="SaveButton_Click" />
        </div>
        </asp:Panel>
        
        
    
    <asp:Panel ID="uppannel" runat="server" Width="100%" Visible="false">
    
    

    </asp:Panel>
</asp:content>