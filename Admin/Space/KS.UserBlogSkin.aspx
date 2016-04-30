<%@ Page Title="空间模板管理" Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.Admin_Space_KS_BlogSkin" Codebehind="KS.UserBlogSkin.aspx.cs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="KSContent" Runat="Server">
    <asp:Panel id="listSpan" runat="server">
     <div id="manage_top" class="menu_top_fixed">
        <ul>
           <li id='p1'><b></b><asp:LinkButton ID="addclassbutton" runat="server" OnClick="addclassbutton_Click">添加模板</asp:LinkButton></li>
           <li id='p9'><b></b><a href="javascript:;" onclick="location.href='KS.Blog.aspx';">返回</a></li>
        </ul>
    </div>  
     <div class="menu_top_fixed_height"></div>  

    <script type="text/javascript">
        var last=null;
        function single(obj)
        {
            if(last==null)    //第一次选择RadioButton时赋id值给last
            {
                last=obj.id; 
            }
            else            //第一次以后的每一次都在这运行，把上此的RadioButton.Checked=false,记下此次的obj.name
            {
                var lo=document.getElementByIdx_x(last);
                lo.checked=false;
                last=obj.name;
            }
            obj.checked="checked";   //添加checked属性，以便在上边赋值为false
        }
    </script>
    
    <KS:ksgv id="List" runat="server" CssClass="CTable" AutoGenerateColumns="False" EmptyDataText="没有找到模板目录或者模板目录为空!" PagerType="CustomNumeric" Width="99%"  GridLines="None" OnRowDataBound="List_RowDataBound" OnRowCommand="List_RowCommand" OnRowCreated="List_RowCreated" >
        <Columns>

            <asp:BoundField HeaderText="ID" DataField="SkinID" >
                <ItemStyle HorizontalAlign=Center />
            </asp:BoundField>
            <asp:BoundField HeaderText="名称" DataField="TemplateName" >
                <itemstyle width="280px" horizontalalign="Center" />
            </asp:BoundField>
            <asp:BoundField HeaderText="作者" DataField="TemplateAuthor" >
                <itemstyle width="200px" horizontalalign="Center" />
            </asp:BoundField>


              <asp:TemplateField HeaderText="类型" ItemStyle-HorizontalAlign="Center">
                <ItemTemplate>
                    <%# Convert.ToInt16(Eval("usertag"))==0?"<span style='color:red;'>系统自带</span>":"用户上传" %>
                </ItemTemplate>
            </asp:TemplateField>

            
              <asp:TemplateField HeaderText="默认模板" ItemStyle-HorizontalAlign="Center">
                <ItemTemplate>
                    <%# Convert.ToInt16(Eval("IsDefault"))==1?"<span style='color:red;'>是</span>":"否" %>
                </ItemTemplate>
            </asp:TemplateField>

             <asp:TemplateField HeaderText="编辑">
                       <itemstyle horizontalalign="Center" width="25px"/>
                         <itemtemplate>
                               <asp:LinkButton ID="LinkButton2" CssClass="edit" ToolTip="修改" runat="server" commandargument=<%#Eval("SkinID") %> commandname="modify"></asp:LinkButton>
                        </itemtemplate>
              </asp:TemplateField>
            
            <asp:TemplateField HeaderText="删除">
                <itemstyle width="25px" Height="30px" horizontalalign="Center" />
             <itemtemplate>
             <asp:LinkButton runat="server" CssClass="delete" ToolTip="删除" id="delete" commandargument=<%#Eval("SkinID") %> commandname="del"></asp:LinkButton>
            </itemtemplate>
            </asp:TemplateField>
          
        </Columns>
        <HeaderStyle CssClass="CTitle" />
            <PagerStyle CssClass="Page" HorizontalAlign="Right" />
            <EmptyDataRowStyle CssClass="emptycss" />
    </KS:ksgv>
    </asp:Panel>

    <asp:Panel ID="Panel1" runat="server" Height="30px" Width="100%">

           
           <table cellpadding="0" cellspacing="0" style="width: 100%;margin-top:10px">
            <tr>
                <td style="height: 25px">&nbsp; </td>
                <td style="font-size: 9pt; height: 25px; text-align: right">
                        <KS:Page ID="Page1" runat="server" />
                </td>
            </tr>
        </table>
</asp:Panel>


    <asp:Panel ID="editSpan" runat="server" Width="100%" Visible="false">
        <KS:TopNav ID="TopNav1" runat="server" Text="添加分类" />
        <script type="text/javascript">

       </script>

        <table width="99%" align="center" border="0" cellpadding="1" cellspacing="1" class="CTable"> 
            <tr>
            <td class="lefttd" height="30" align="right" style="width: 280px"><b>模版名称：</b></td>
            <td class="righttd">
                &nbsp;<asp:TextBox  CssClass="textbox" ID="txtTemplateName" runat="server" Width="268px"></asp:TextBox></td>
            </tr>

            <tr>
            <td class="lefttd" height="30" align="right" style="width: 280px"><b>模板作者：</b></td>
            <td class="righttd">
                &nbsp;<asp:TextBox  CssClass="textbox" ID="txtTemplateAuthor" runat="server" Width="268px"></asp:TextBox>
                </td>
           </tr>

            <tr>
            <td class="lefttd" height="30" align="right" style="width:280px"><b>预 览 图：</b></td>
            <td class="righttd">
                &nbsp;<asp:TextBox  CssClass="textbox" ID="txtTemplatePic" runat="server" Width="268px"></asp:TextBox>
                <input type="button" class="button" onMouseOver="this.className='button_on';" onMouseOut="this.className='button';" value="选择预览图..."  onClick="SelectFiles('<%=this.txtTemplatePic.ClientID%>');"/>

                </td>
          </tr>

            <tr>
            <td class="lefttd" height="30" align="right" style="width:280px"><b>请选择模板目录：</b></td>
            <td class="righttd">
                    <asp:DropDownList runat="server" ID="dropTemplateDir">
                        <asp:ListItem Value="0" Text="请选择模板风格"></asp:ListItem>
                    </asp:DropDownList>
                </td>
          </tr>



            <tr>
            <td class="lefttd" height="30" align="right" style="width: 280px"><b>允许使用本模板的用户组：</b></td>
            <td class="righttd">
                <div  runat="server" id="chkUserlevel">

                </div>
          </tr>
            <asp:HiddenField ID="modify" Value="0" runat="server" />
            <asp:HiddenField ID="skinid" Value="0" runat="server" />

            <tr>
            <td class="lefttd" height="30" align="right" style="width:280px"><b>是否默认模板：</b></td>
            <td class="righttd">&nbsp;<asp:CheckBox ID="chkIsDefault" runat="server" Text="设置默认模板" />&nbsp;&nbsp;
          </tr>
  
      </table>
      <br />
        <KS:Foot ID="Foot1"  OnSubmit="Foot1_Submit" runat="server" />

     </asp:Panel>

</asp:Content>

