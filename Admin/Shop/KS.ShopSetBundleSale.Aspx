<%@ Page Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.Admin.Shop.Admin_ShopSetBundleSale" Title="�����������ۼ۸�" Codebehind="KS.ShopSetBundleSale.Aspx.cs" %>
<asp:Content ID="Content1" ContentPlaceHolderID="KSContent" Runat="Server">
 <body scroll="no">
 <script type="text/javascript">
	function regInput(obj, reg, inputStr)
	{
					var docSel = document.selection.createRange()
					if (docSel.parentElement().tagName != "INPUT")    return false
					oSel = docSel.duplicate()
					oSel.text = ""
					var srcRange = obj.createTextRange()
					oSel.setEndPoint("StartToStart", srcRange)
					var str = oSel.text + inputStr + srcRange.text.substr(oSel.text.length)
					return reg.test(str)
	}
	function addIn(){
		    var title=jQuery("#<%=this.HidTitle.ClientID %>").val();
	        var proid = jQuery("#<%=this.HidInfoID.ClientID %>").val();
	        var attrid = jQuery("#<%=this.HidAttrID.ClientID %>").val();
	        var kbprice = jQuery("#<%=this.KBPrice.ClientID%>").val();
		   top.frames["main"].updateKBXS(proid+"@@@"+attrid+"@@@"+kbprice+"@@@"+title);
	 }
 </script>
  <table  width="100%" cellpadding="1" cellspacing="1" class="CTable">
            <tr>
                <td class="lefttd" style="text-align: right"><strong>��Ʒ���ƣ�</strong></td>
                <td class="righttd" colspan="2" style=" text-align: left">
                    <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label></td>
            </tr>
            <tr>
                <td class="lefttd" style="text-align: right"><strong>�� �� �ۣ�</strong></td>
                <td class="righttd" colspan="2" style="text-align: left">
                    ��<asp:Label ID="Label2" runat="server" Text="Label"></asp:Label> Ԫ</td>
            </tr>
            <tr>
                <td class="lefttd" style="text-align: right;color:Red"><strong>�� Ա �ۣ�</strong></td>
                <td class="righttd" colspan="2" style=" text-align: left;color:Red">
                    ��<asp:Label ID="Label3" runat="server" Text="Label"></asp:Label> Ԫ</td>
            </tr>

            <tr>
                <td class="lefttd" style="text-align: right"><strong>�������ۼۣ�</strong></td>
                <td class="righttd" colspan="2" style=" text-align: left">
                 <asp:TextBox ID="KBPrice" CssClass="textbox" runat="server" value="0" style="text-align:center;width:50px" onKeyPress= "return regInput(this,/^\d*\.?\d{0,2}$/,String.fromCharCode(event.keyCode))" onpaste="return regInput(this,/^\d*\.?\d{0,2}$/,window.clipboardData.getData('Text'))" ondrop="return regInput(this,    /^\d*\.?\d{0,2}$/,event.dataTransfer.getData('Text'))"/> Ԫ 
                </td>
            </tr>
            
      </table>
     <div style="padding-left:150px;margin-top:20px;">
      <asp:HiddenField ID="HidTitle" runat="server" />
      <asp:HiddenField ID="HidInfoID" runat="server" />
      <asp:HiddenField ID="HidAttrID" runat="server" />
      <input type="button" value="ȷ������" onclick="addIn()" class="button" />
     </div>
      <br />

</asp:Content>
