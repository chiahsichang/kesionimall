<%@ Page Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.Admin_DataReplace" Title="���ݿ��ֶ��滻" Codebehind="KS.DataReplace.aspx.cs" %>
<asp:Content ID="Content1" ContentPlaceHolderID="KSContent" Runat="Server">

<asp:Panel ID="Step1" runat="server">
    <KS:TopNav ID="TopNav1" runat="server" Text="���ݿ��ֶ��滻" />

 <script>
     function showType() {
         var checkrad = jQuery("#<%=this.RdbReplaceType.ClientID %> :radio[checked]").val();
         if (checkrad == "0") {
             jQuery("#Type1").show();
             jQuery("#Type2").hide();
             jQuery("#newstr").html("�� �� �ɣ�");
         } else if (checkrad == "1") {
             jQuery("#Type1").hide();
             jQuery("#Type2").show();
             jQuery("#newstr").html("�� �� �ɣ�");
         } else {
         jQuery("#Type1").hide();
         jQuery("#Type2").hide();
         jQuery("#newstr").html("�� �� �ɣ�");
     }
     }
 </script>
 <div class="tab-page" id="replacePanel">
         <script type="text/javascript">
             var tabPane1 = new WebFXTabPane(document.getElementById("replacePanel"), 1)
         </script>
             
		<div class="tab-page" id="tab0">
		  <h2 class="tab">�ֶ��滻</h2>
			<script type="text/javascript">
						 tabPane1.addTabPage( document.getElementById( "tab0" ) );
			</script>
 <table width="99%"  border="0" cellpadding="1" cellspacing="1" class="CTable"> 
          <tr>
            <td class="lefttd" height="30" align="right" style="width: 198px"><b>���ݱ�����</b></td>
            <td class="righttd">&nbsp;<asp:DropDownList ID="DrpTable" AutoPostBack="true" runat="server" 
                    onselectedindexchanged="DrpTable_SelectedIndexChanged"></asp:DropDownList>
                    
                    �ֶ����ƣ�<asp:DropDownList ID="DrpField" runat="server">
            <asp:ListItem Value="0">---��ѡ���ֶ�---</asp:ListItem>
            </asp:DropDownList>
                    
                    </td>
          </tr>
          <tr>
            <td class="lefttd" height="30" align="right" style="width: 198px"><b>SQL������</b></td>
            <td class="righttd">&nbsp;<asp:TextBox ID="TxtSQL" runat="server" CssClass="textbox" />
            <span class="tips">�������գ������밴�˸�ʽ���룬�磺 Where inputer='admin'</span>
            </td>
          </tr>
        <tr>
            <td align="right" class="lefttd" height="30" style="width: 198px">
            <b>�滻ģʽ��</b>
            </td>
            <td class="righttd">
                &nbsp;<asp:RadioButtonList ID="RdbReplaceType" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow">
                 <asp:ListItem Value="0" Selected>��ģʽ</asp:ListItem>
                 <asp:ListItem Value="1">�߼�ģʽ</asp:ListItem>
                 <asp:ListItem Value="2">��ֵģʽ</asp:ListItem>
                </asp:RadioButtonList></td>
        </tr>
        <tbody id="Type1">
        <tr>
            <td align="right" class="lefttd" height="30" style="width: 198px">
            <b>�� �� ����</b>
            </td>
            <td class="righttd">
                &nbsp;<asp:TextBox CssClass="textbox" ID="TxtStr1" TextMode="MultiLine" Width="304px" runat="server" Height="60px"></asp:TextBox><font color=red>*</font></td>
        </tr>
        <tr>
            <td align="right" class="lefttd" height="30" style="width: 198px">
            <b>���ִ�Сд��</b>
            </td>
            <td class="righttd">
                &nbsp;<asp:RadioButtonList ID="RdbIsCase" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow">
                 <asp:ListItem Value="0" Selected>������</asp:ListItem> 
                 <asp:ListItem Value="1">����</asp:ListItem>
                </asp:RadioButtonList></td>
        </tr> 
        </tbody>
        <tbody id="Type2" style="display:none">
        <tr>
            <td align="right" class="lefttd" height="30" style="width: 198px">
            <b>�ַ���ʼ��</b>
            </td>
            <td class="righttd">
                &nbsp;<asp:TextBox CssClass="textbox" ID="TxtStr11" TextMode="MultiLine" Width="304px" runat="server" Height="40px"></asp:TextBox><font color=red>*</font></td>
        </tr>
        <tr>
            <td align="right" class="lefttd" height="30" style="width: 198px">
            <b>�ַ�������</b>
            </td>
            <td class="righttd">
                &nbsp;<asp:TextBox CssClass="textbox" ID="TxtStr12" TextMode="MultiLine" Width="304px" runat="server" Height="40px"></asp:TextBox><font color=red>*</font></td>
        </tr>
        </tbody>
         <tr>
            <td align="right" class="lefttd" height="30" style="width: 198px">
            <b id="newstr">�� �� �ɣ�</b>
            </td>
            <td class="righttd">
                &nbsp;<asp:TextBox CssClass="textbox" ID="TxtStr2" TextMode="MultiLine" Width="304px" runat="server" Height="60px"></asp:TextBox></td>
        </tr>
        <tr>
        <td align="right" class="lefttd" height="40" style="width: 198px"></td>
        <td  class="righttd" >	
          &nbsp;<asp:Button ID="BtnSubmit" runat="server" CssClass="button" Text="��ʼ�滻(0)" OnClick="Foot1_Submit" />
</td></tr>
      </table>
      
    </div>
    
    
		 <div class="tab-page" id="annexReplace">
		  <h2 class="tab">������ַ�滻</h2>
			<script type="text/javascript">
			    tabPane1.addTabPage(document.getElementById("annexReplace"));
			</script>
             <table width="99%" border="0" cellpadding="1" cellspacing="1" class="CTable"> 
                   <tr>
                    <td align="right" class="lefttd" height="30" style="width: 198px">
                    <b>�� �� ����</b>
                    </td>
                    <td class="righttd">
                        &nbsp;<asp:TextBox CssClass="textbox" ID="TxtAnnexStr1" TextMode="MultiLine" Width="304px" runat="server" Height="60px"></asp:TextBox><font color=red>*</font></td>
                </tr>
                <tr>
                    <td align="right" class="lefttd" height="30" style="width: 198px">
                    <b id="B1">�� �� �ɣ�</b>
                    </td>
                    <td class="righttd">
                        &nbsp;<asp:TextBox CssClass="textbox" ID="TxtAnnexStr2" TextMode="MultiLine" Width="304px" runat="server" Height="60px"></asp:TextBox></td>
                </tr>
                    <tr>
                    <td align="right" class="lefttd" height="40" style="width: 198px"></td>
                    <td  class="righttd" >	
                      &nbsp;<asp:Button ID="Button1" runat="server" CssClass="button" Text="��ʼ�滻(0)" 
                            onclick="Button1_Click" />
            </td></tr>
            </table>
         </div>
    </div>
      
		
</asp:Panel>
      <div style="margin-top:20px;clear:both"></div>
      <script type="text/javascript">
          showtips('<span class="state"><strong>ע�����</strong><br /></span>1��ִ�в���ǰ�������ȱ������ݿ��ļ���<br /> 2���������ĸ���ʱ���������ݵĶ����Լ����������򱾵ػ����������þ�����������ݺܶ࣬���¿��ܺ������������ǧ����ˢ��ҳ���ر��������������ֳ�ʱ���ߴ�����ʾ����ʹ�ñ����������½��в�����<br/>3��������ַ�滻����һ��������վ��������ʱ��ʹ�ã��������漰ͼƬ���ֶε�ԭ�����滻Ϊ�µ�������Ҫ�滻�ĸ����ֶο��Դ�config/AnnexField.config�ļ����ӻ�ɾ����ʹ��ǰ���ȱ��ݺ��������ݿ⣬������Դ˲�̫�˽������ã�����<br />');
	 </script>   

</asp:Content>

