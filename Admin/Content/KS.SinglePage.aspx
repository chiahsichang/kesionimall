<%@ Page Language="C#" ValidateRequest="false" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.Admin_SinglePage" Title="��ҳ�����" Codebehind="KS.SinglePage.aspx.cs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="KSContent" Runat="Server">

      <asp:Panel runat="server" ID="add" Width="100%" >  
          <KS:TopNav ID="TopNav1" runat="server" />
        <table width="100%" border="0" cellpadding="1" cellspacing="1" class="CTable"> 
          <tr>
            <td class="lefttd" height="30" align="right" style="width: 151px"><b>��ҳ�����ƣ�</b></td>
            <td class="righttd">
            <input type="hidden" name="backurl" value="KS.SinglePage.aspx?channelid=1&classid=<%=ClassID %>" />
                &nbsp;<asp:TextBox ID="TxtTitle" Width="300px" CssClass="textbox" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TxtTitle"
                    ErrorMessage="����д��ҳ������!"></asp:RequiredFieldValidator></td>
          </tr>
            
            <tr>
                <td align="right" class="lefttd" height="30" style="width: 151px">
                    <strong>��ҳ��ͼƬ��</strong></td>
                <td class="righttd">
                    &nbsp;<asp:TextBox ID="PhotoUrl" Width="300px" CssClass="textbox" runat="server"></asp:TextBox>&nbsp;<input type="button" class="button" onclick="SelectFiles('<%=this.PhotoUrl.ClientID %>',0);" value="ѡ��ͼƬ"></td>
            </tr>
            <tr>
                <td align="right" class="lefttd" height="30" style="width: 151px">
                    <strong>����ʱ�䣺</strong></td>
                <td class="righttd">
                    &nbsp;<asp:TextBox ID="AddDate" Width="300px" CssClass="textbox Wdate" onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'});" runat="server"></asp:TextBox>
                    </td>
            </tr>

            <tr>
                <td align="right" class="lefttd" height="30" style="width: 151px">
                    <strong>��ҳ�����ݣ�</strong>
                    <br /> ʹ�ñ�ǩ��<font color=green>{$GetClassIntro}</font>�����á�
                    </td>
                <td class="righttd">
                <textarea name="content" id="content" runat="server" style="width:95%;height:280px;"></textarea>
                  <%
                         Kesion.APPCode.EditorAPI.EchoEditor("editor", this.content.ClientID, "Common", 0, false, true);    
                  %> 
                </td>
            </tr>
          </table>
          <br />
              <KS:Foot ID="CopyRight1" runat="server" SubmitButtonText="ȷ������(0)" OnSubmit="CopyRight1_Submit"/>
          
          </asp:Panel>
</asp:Content>