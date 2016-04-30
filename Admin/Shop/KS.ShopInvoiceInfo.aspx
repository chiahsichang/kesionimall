<%@ Page Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.Admin.Shop.Admin_ShopInvoiceInfo" Title="��Ʊ��Ϣ����" Codebehind="KS.ShopInvoiceInfo.aspx.cs" %>
<%@ Import Namespace="Kesion.Cache" %>
<asp:Content ID="Content1" ContentPlaceHolderID="KSContent" Runat="Server">
    <asp:Panel ID="listPanel" runat="server" Width="100%">
      <div id="manage_top" class="menu_top_fixed">
        <ul>   

            <span style="float:right">
             &nbsp;&nbsp;<strong>����=></strong>
    <asp:DropDownList ID="DrpSearchType" runat="server">
     <asp:ListItem Value="1">�û���</asp:ListItem>
     <asp:ListItem Value="2">��˾����</asp:ListItem>
    </asp:DropDownList>
    <asp:TextBox ID="TxtKey"  CssClass="textbox" runat="server" Width="100px"></asp:TextBox> 
<asp:Button ID="Button2" runat="server" Text=" �� �� " CssClass="button" OnClick="Button2_Click" />
            </span>
        <li id='p4'><asp:LinkButton ID="editbutton" runat="server" OnClick="editTask_Click"><b></b>�༭��Ʊ��Ϣ</asp:LinkButton></li>
        <li id='p3'><asp:LinkButton ID="delbutton" runat="server" OnClick="delTask_Click"><b></b>ɾ����Ʊ��Ϣ</asp:LinkButton></li>


        </ul> 
      </div>     
      <div class="menu_top_fixed_height"></div>
    <div>
        <KS:KSGV ID="InvoiceListView" cssclass="CTable" runat="server" AutoGenerateColumns="False" DataKeyNames="FieldID" GridLines="None"
            OnRowDataBound="FieldListView_RowDataBound" PagerType="CustomNumeric" Width="99%" EnableTheming="True" OnRowCommand="FieldListView_RowCommand" EmptyDataText="û���ҵ��κη�Ʊ��Ϣ!">
            <Columns>
                <asp:TemplateField HeaderText="ѡ��">
                <itemstyle horizontalalign="Center" width="50px" />
                <itemtemplate>
                    <input type="checkbox"  name="ids" id="ids" value="<%#Eval("InvoiceID") %>" />
                </itemtemplate>
              </asp:TemplateField>
                
                <asp:BoundField DataField="UserName" HeaderText="�û���">
                </asp:BoundField>
               <asp:TemplateField HeaderText="��Ʊ���߷�ʽ">
                  <itemstyle  width="120px" HorizontalAlign="Center" />
                <ItemTemplate>
                  <%# (Convert.ToInt16(Eval("InvoiceType").ToString())==1 || Convert.ToInt16(Eval("TitleType").ToString())==1)?"��ֵ˰��Ʊ":"��ͨ��Ʊ��ֽ�ʣ�" %>
                </ItemTemplate>  
                </asp:TemplateField>
                
                 <asp:TemplateField HeaderText="̧ͷ����">
                   <itemstyle  width="120px" HorizontalAlign="Center" />
                <ItemTemplate>
                  <%# (Convert.ToInt16(Eval("InvoiceType").ToString())==1 || Convert.ToInt16(Eval("TitleType").ToString())==1)?"��λ":"����" %>
                </ItemTemplate>  
                </asp:TemplateField>
                 <asp:TemplateField HeaderText="̧ͷ����">
                  <itemstyle />
                <ItemTemplate>
                  <%# (Convert.ToInt16(Eval("InvoiceType").ToString())==1 || Convert.ToInt16(Eval("TitleType").ToString())==1)?Eval("CompanyName"):"-" %>
                </ItemTemplate>  
                </asp:TemplateField>

          <asp:TemplateField HeaderText="�༭">
              <itemstyle width="30px" horizontalalign="Center"/>
              <itemtemplate>
                     <asp:LinkButton ID="LinkButton1" CssClass="edit" ToolTip="�༭" runat="server" commandargument=<%#Eval("InvoiceID") %> commandname="modify"></asp:LinkButton>
              </itemtemplate>
            </asp:TemplateField>
             
            <asp:TemplateField HeaderText="ɾ��">
                <itemstyle horizontalalign="Center" width="30px"/>
               <itemtemplate>
                     <asp:LinkButton runat="server" CssClass="delete" ToolTip="ɾ��" id="delete" commandargument=<%#Eval("InvoiceID") %> commandname="del"></asp:LinkButton>
               </itemtemplate>
            </asp:TemplateField>

                
              
            </Columns>
            <HeaderStyle CssClass="CTitle" />
            <EmptyDataRowStyle CssClass="emptycss" />
        </KS:KSGV>
        <br />
        <asp:Panel ID="Panel1" runat="server" Height="30px" Width="739px">
            &nbsp;&nbsp;&nbsp;&nbsp;<input type="checkbox" name="chkall" id="chkall" onclick="CheckAll(this.form);"/><label for="chkall">ȫ��ѡ��</label>
            <asp:Button ID="Button1" runat="server" Text="����ɾ����Ʊ��Ϣ" OnClick="Button1_Click" />&nbsp;<br />
            </asp:Panel>
        &nbsp;
        </div>
        
         <KS:Page ID="Page1" runat="server" />
          <br />
        <script type="text/javascript">
		showtips('<span class="state"><strong>˵����</strong><br /></span>���������ǿͻ����Լ���ӵķ�Ʊ��Ϣ,�������ڴ˽��б༭,ɾ������!');
		</script>
     </asp:Panel>
    
    <asp:Panel ID="addPanel" runat="server" Width="100%" Visible="false">
    <script type="text/javascript">
       function CheckForm()
	        {
	         if(jQuery('#<%=this.TxtCompanyName.ClientID %>').val()==''){
	            KesionJS.Alert('�����뷢Ʊ̧ͷ��',null);
	           return false;
	         }
	   }

        $(function () {
            $("#ProvinceID").change(function () {
                $("#showselectarea").html(jQuery("#ProvinceID option:selected").get(0).text);
            });
            $("#CityID").change(function () {
                $("#showselectarea").html(jQuery("#ProvinceID option:selected").get(0).text + jQuery("#CityID option:selected").get(0).text);
            });
            $("#CountyID").change(function () {
                $("#showselectarea").html(jQuery("#ProvinceID option:selected").get(0).text + jQuery("#CityID option:selected").get(0).text + jQuery("#CountyID option:selected").get(0).text);
            });

            initialPanel();

        });
        function initialPanel() {
            if (jQuery("#<%=this.RdbInvoiceType.ClientID%> :radio[checked]").val() == "0") {
                if (jQuery("#<%=this.RdbTitleType.ClientID%> :radio[checked]").val() == "0") {
                    $("#showCompanyName").hide();
                }
                $("#showZZSFB").hide();
                $("#showTitleType").show();
            } else {
                $("#showZZSFB").show();
                $("#showTitleType").hide();
                $("#showCompanyName").show();
            }
        }
	 
    </script>
        <KS:TopNav ID="TopNav1" runat="server" Text="�޸ķ�Ʊ��Ϣ" />
         <table width="100%" border="0" cellpadding="1" cellspacing="1" class="CTable"> 
            <tr>
                <td align="right" class="lefttd" height="30" style="width: 198px">
                    <strong>��Ʊ���߷�ʽ��</strong></td>
                <td class="righttd">
                <asp:RadioButtonList ID="RdbInvoiceType" runat="server" RepeatLayout="Flow" RepeatDirection="Horizontal">
                    <asp:ListItem Value="0" Selected="True">��ͨ��Ʊ��ֽ�ʣ�</asp:ListItem>
                    <asp:ListItem Value="1">��ֵ˰��Ʊ</asp:ListItem>
                </asp:RadioButtonList>

                </td>
            </tr>
            <tr id="showTitleType">
                <td align="right" class="lefttd" height="30" style="width: 198px">
                    <strong>��Ʊ̧ͷ��</strong></td>
                <td class="righttd">
                <asp:RadioButtonList ID="RdbTitleType" runat="server" RepeatLayout="Flow" RepeatDirection="Horizontal">
                    <asp:ListItem Value="0" Selected="True">����</asp:ListItem>
                    <asp:ListItem Value="1">��λ</asp:ListItem>
                </asp:RadioButtonList>

                </td>
            </tr>
            <tr id="showCompanyName">
                <td align="right" class="lefttd" height="30" style="width: 198px">
                    <strong>��λ���ƣ�</strong></td>
                <td class="righttd">
                    <asp:TextBox ID="TxtCompanyName" CssClass="textbox" runat="server"></asp:TextBox>
                     <span style="color:Red">*</span>
                    </td>
            
            </tr>
            <tbody id="showZZSFB">
            <tr>
                <td align="right" class="lefttd" height="30" style="width: 198px">
                    <strong>��˰��ʶ��ţ�</strong></td>
                <td class="righttd">
                 <asp:TextBox ID="TxtNSRSBH" CssClass="textbox" runat="server"></asp:TextBox><span style="color:Red">*</span>
               </td>
            </tr>
            <tr>
                <td align="right" class="lefttd" height="30" style="width: 198px">
                    <strong>ע���ַ��</strong></td>
                <td class="righttd">
                 <asp:TextBox ID="TxtAddress" CssClass="textbox" runat="server"></asp:TextBox><span style="color:Red">*</span>
               </td>
            </tr>
            <tr>
                <td align="right" class="lefttd" height="30" style="width: 198px">
                    <strong>ע��绰��</strong></td>
                <td class="righttd">
                 <asp:TextBox ID="TxtTel" CssClass="textbox" runat="server"></asp:TextBox>
               </td>
            </tr>
            <tr>
                <td align="right" class="lefttd" height="30" style="width: 198px">
                    <strong>�������У�</strong></td>
                <td class="righttd">
                 <asp:TextBox ID="TxtBank" CssClass="textbox" runat="server"></asp:TextBox>
               </td>
            </tr>
             
            <tr>
                <td align="right" class="lefttd" height="30" style="width: 198px">
                    <strong>�����ʻ���</strong></td>
                <td class="righttd">
                 <asp:TextBox ID="TxtBankNum" CssClass="textbox" runat="server"></asp:TextBox>
               </td>
            </tr>
            <tr>
                <td align="right" class="lefttd" height="30" style="width: 198px">
                    <strong>��Ʊ��������</strong></td>
                <td class="righttd">
                 <asp:TextBox ID="TxtContactMan" CssClass="textbox" runat="server"></asp:TextBox>
               </td>
            </tr>
            <tr>
                <td align="right" class="lefttd" height="30" style="width: 198px">
                    <strong>��Ʊ���ֻ���</strong></td>
                <td class="righttd">
                 <asp:TextBox ID="TxtMobile" CssClass="textbox" runat="server"></asp:TextBox>
               </td>
            </tr>
               <tr>
                <td align="right" class="lefttd" height="30" style="width: 198px">
                    <strong>��Ʊ�˵�����</strong></td>
                <td class="righttd">
                <script src="../../plus/area.aspx?pid=<%=proid %>&cityid=<%=cityid %>&countyid=<%=countyid %>"></script>
               </td>
            </tr>
            <tr>
                <td align="right" class="lefttd" height="30" style="width: 198px">
                    <strong>��Ʊ�˵�ַ��</strong></td>
                <td class="righttd">
                  <span id="showselectarea"><%=addStr %></span>
                 <asp:TextBox ID="TxtContactAddress" CssClass="textbox" runat="server"></asp:TextBox>
               </td>
            </tr>
                </tbody>
        </table>
        <br />
        <KS:Foot ID="Foot1" runat="server" OnSubmit="Foot1_Submit" SubmitButtonText="ȷ���޸�(0)" />
    
    </asp:Panel>
    

  </asp:Content>