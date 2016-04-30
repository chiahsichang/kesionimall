<%@ Page Language="C#" EnableEventValidation="false"  MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.Admin.Shop.Admin_ShopBrand" Title="��ƷƷ�ƹ���" Codebehind="KS.ShopBrand.aspx.cs" %>
<%@ Import Namespace="Kesion.BLL" %>
<%@ Import Namespace="Kesion.HtmlTags" %>
<asp:Content ID="Content1" ContentPlaceHolderID="KSContent" Runat="Server">
     <asp:Panel ID="BrandList" runat="server" Width="100%">
      <div id="manage_top" class="menu_top_fixed">
        <ul>
           <li id='p1'><asp:LinkButton ID="addBrand" runat="server" OnClick="addBrand_Click"><b></b>�����ƷƷ��</asp:LinkButton></li>
           <li id='p4'><asp:LinkButton ID="editBrand" runat="server" OnClick="editBrand_Click"><b></b>�༭��ƷƷ��</asp:LinkButton></li>
           <li id='p3'><asp:LinkButton ID="delBrandBtn" runat="server" OnClick="delBrand_Click"><b></b>ɾ����ƷƷ��</asp:LinkButton></li>
           <li id='p10'><a href="?action=total"><b></b>һ���ؼ�����Ʒ���µ���Ʒ��</a></li>
        </ul>
      </div>   
      <div class="menu_top_fixed_height"></div>
       <KS:KSGV ID="list" cssclass="CTable" runat="server" AutoGenerateColumns="False" Width="99%" EmptyDataText="û������κ���ƷƷ��!" GridLines="None" OnRowDataBound="list_RowDataBound" OnRowCommand="list_RowCommand" OnRowCreated="list_RowCreated">
          <Columns>
              <asp:TemplateField HeaderText="<input type='checkbox' name='chkall' id='chkall' onclick='CheckAll(this.form);'/>">
                <itemstyle horizontalalign="Center"/>
                <itemtemplate>
                    <input type="checkbox"  name="ids" id="ids" value='<%#Eval("id") %>' />
                </itemtemplate>
              </asp:TemplateField>
             <asp:TemplateField HeaderText="Ʒ��ͼƬ">
             <itemstyle  width="80px" />
             <itemtemplate>
                   <a href="<%# BasicField.GetBrandUrl(Convert.ToInt32(Eval("id").ToString())) %>" target="_blank"><img onerror="this.src='../../sysimg/nopic.gif';" style="border:1px solid #efefef;padding:1px" src="<%# GetPhotoUrl(Convert.ToString(Eval("PhotoUrl"))) %>" width="88" height="31" /></a>
           </itemtemplate>
             </asp:TemplateField>
             <asp:TemplateField HeaderText="Ʒ������">
             <itemtemplate>
             <%# Eval("BrandName") %> 
             <%# Convert.ToInt16(Eval("Recommend"))==1?"<i style=color:red>(��)</i>":string.Empty %>
             </itemtemplate>
             </asp:TemplateField> 
             <asp:TemplateField HeaderText="�󶨷���">
             <itemstyle />
             <itemtemplate>
              <span class="tips"><%# GetBindClassList(Convert.ToInt32(Convert.ToString(Eval("id"))))%></span>
            </itemtemplate>
             </asp:TemplateField>
             <asp:TemplateField HeaderText="��Ʒ��">
             <itemstyle />
             <itemtemplate>
              <font color=red><%# Eval("num")%></font> ��
              <asp:LinkButton runat="server" id="managepro" commandargument=<%#Eval("id") %> commandname="managePro">�����Ʒ</asp:LinkButton>
            </itemtemplate>
             </asp:TemplateField>
            
             <asp:BoundField DataField="firstAlphabet" HeaderText="����ĸ">
                  <itemstyle horizontalalign="Center" width="40px" />
             </asp:BoundField>
            
            
             <asp:BoundField DataField="OrderID"  HeaderText="���">
                  <itemstyle horizontalalign="Center" width="40px" />
                </asp:BoundField>
                
           <asp:TemplateField HeaderText="�༭">
              <itemstyle width="30px" horizontalalign="Center"/>
              <itemtemplate>
             <asp:LinkButton ID="LinkButton1" CssClass="edit" ToolTip="�༭" runat="server" commandargument=<%#Eval("id") %> commandname="modify"></asp:LinkButton>
              </itemtemplate>
            </asp:TemplateField>
             
            <asp:TemplateField HeaderText="ɾ��">
                <itemstyle horizontalalign="Center" width="30px"/>
               <itemtemplate>
                <asp:LinkButton runat="server" ToolTip="ɾ��" CssClass="delete" id="delete" commandargument=<%#Eval("id") %> commandname="del"></asp:LinkButton>
               </itemtemplate>
            </asp:TemplateField>
          </Columns>
            <HeaderStyle CssClass="CTitle" />
            <EmptyDataRowStyle CssClass="emptycss" />
      </KS:KSGV>

    <KS:Page ID="Page1" runat="server" />
        
    </asp:Panel>
    
    <asp:Panel ID="BrandManage" runat="server" Width="100%" Visible="false">
    
        <KS:TopNav ID="TopNav1" runat="server" />
       
       <script>
        function CheckForm() {
            if (jQuery('#<%=this.TxtBrandName.ClientID %>').val() == '') {
                KesionJS.Alert( '��������ƷƷ�����ƣ�', "jQuery('#<%=this.TxtBrandName.ClientID %>').focus()");
                return false;
            }
            if (jQuery('#<%=this.TxtBrandEname.ClientID %>').val() == '') {
                KesionJS.Alert( '��������ƷƷ��Ӣ�����ƣ�', "jQuery('#<%=this.TxtBrandEname.ClientID %>').focus()");
                return false;
            }
        	
	        if (jQuery("#classid option:selected").val()==undefined){
	            KesionJS.Alert( '��ѡ��󶨵���Ʒ��Ŀ��', "jQuery('#classid').focus()");
	         return false;
	        }
	        if (editor.hasContents()==false){
	            KesionJS.Alert("������Ʒ�ƽ��ܣ�","editor.focus()");
	            return false;
	        }

        return true;
        }

</script>
        
        <table width="99%" align="center" border="0" cellpadding="1" cellspacing="1" class="CTable"> 
          <tr>
            <td class="lefttd" height="30" align="right" style="width: 132px"><strong>��ƷƷ�����ƣ�</strong></td>
            <td class="righttd">
                &nbsp;<asp:TextBox CssClass="textbox" ID="TxtBrandName" runat="server"></asp:TextBox> <span class="tips">�磺 ���ǣ������ֵȡ�</span>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TxtBrandName"
                    ErrorMessage="��������ƷƷ������!"></asp:RequiredFieldValidator>
            </td>
          </tr>
          <tr>
            <td class="lefttd" height="30" align="right" style="width: 132px"><strong>Ʒ��Ӣ�����ƣ�</strong></td>
            <td class="righttd">
                &nbsp;<asp:TextBox CssClass="textbox" ID="TxtBrandEname" runat="server"></asp:TextBox> <span class="tips">��: SamSung�ȡ�</span>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TxtBrandName"
                    ErrorMessage="��������ƷƷ��Ӣ������!"></asp:RequiredFieldValidator>
            </td>
          </tr>
           
            <tr>
                <td align="right" class="lefttd" height="30" style="width: 132px">
                    <strong>Ʒ������ĸ��</strong></td>
                <td class="righttd">
                   &nbsp;<asp:DropDownList ID="DrpFirstAlphabet" runat="server"></asp:DropDownList>
                   
                   </td>
            </tr>
           
            <tr>
                <td align="right" class="lefttd" height="30" style="width: 132px">
                    <strong>�� �� �ţ�</strong></td>
                <td class="righttd">
                    &nbsp;<asp:TextBox ID="TxtOrderID" Text="1"  CssClass="textbox" style="text-align:center" runat="server" Width="56px"></asp:TextBox><span style="color: #999">ֵԽС����Խǰ�档</span></td>
            </tr>
            
            

            <tr>
                <td align="right" class="lefttd" height="30" style="width: 132px">
                    <strong><span style="background-color: #f0f9fe">�󶨷���</span>��</strong></td>
                <td class="righttd">
                    &nbsp;<select name="classid" id="classid" style="width:250px" multiple="multiple" size="5">
                    <%=ClassManage.GetClassByBasicModel(4,"0") %>
                    </select>
                    <br />
                    <span style="color:Red">��Crtl��Shife��ѡ</span>
                    <% if (!string.IsNullOrEmpty(SClassID))
                        {
                        %>
                    <script>
                     function selectclassid(v) {
                            var va = v.split(',');
                            for (var i = 0; i < jQuery("#classid")[0].options.length; i++) {
                                for (var n = 0; n < va.length; n++) {
                                    if (va[n] == jQuery("#classid")[0].options[i].value) {
                                        jQuery("#classid")[0].options[i].selected = true;
                                    }
                                }
                            }
                        }
                        selectclassid('<%=SClassID %>');
                    </script>
                    <%
                        }     
                    %>
                    
                 </td>
            </tr>
            
            <tr>
                 <td align="right" class="lefttd" style="width: 132px; height: 30px">
                     <strong>��ϸ���ܣ�</strong></td>
                 <td class="righttd" style="height: 30px">
                 <asp:TextBox ID="TxtContent" TextMode="multiLine" style="width:80%;height:200px" runat="server"></asp:TextBox>
                <% Kesion.APPCode.EditorAPI.EchoEditor("editor", this.TxtContent.ClientID, "Basic");%>

                 </td>
             </tr>
            <tr>
                 <td align="right" class="lefttd" style="width: 132px; height: 30px">
                     <strong>Ʒ��ͼƬ��</strong></td>
                 <td class="righttd" style="height: 30px">
                 &nbsp;<asp:TextBox CssClass="textbox" ID="TxtPhotoUrl" runat="server" width="250px"></asp:TextBox>
          &nbsp;<input type="button" class="button" onclick="SelectFiles('<%=this.TxtPhotoUrl.ClientID %>',4);" value="ѡ��ͼƬ...">
                 </td>
             </tr>
            <tr>
                 <td align="right" class="lefttd" style="width: 132px; height: 30px">
                     <strong>Ʒ�ư�ģ�壺</strong></td>
                 <td class="righttd" style="height: 30px">
                 &nbsp;<asp:TextBox CssClass="textbox" Text="{$TemplateDir}/�̳�ϵͳ/Ʒ����ϸ.html" ID="TxtTemplateFile" runat="server" width="250px"></asp:TextBox>
          &nbsp; <input class="button" 
                        onClick="SelectTemplate('<%=this.TxtTemplateFile.ClientID %>');" 
                        onmouseout="this.className='button';" onmouseover="this.className='button_on';" 
                        type="button" value="ѡ��ģ��..." /></td>
             </tr>
            <tr>
                 <td align="right" class="lefttd" style="width: 132px; height: 30px">
                     <strong>�Ƿ��Ƽ���</strong></td>
                 <td class="righttd" style="height: 30px">
                 
                  <asp:RadioButtonList ID="RdbRecommend" runat="server" RepeatDirection="Horizontal">
                   <asp:ListItem Value="0">��</asp:ListItem>
                   <asp:ListItem Value="1">��</asp:ListItem>
                  </asp:RadioButtonList>
                 </td>
             </tr>

            
           
        </table>
      <br />
      <KS:Foot ID="Foot1" runat="server" OnSubmit="Foot1_Submit" />
      
    </asp:Panel>
    
</asp:Content>

