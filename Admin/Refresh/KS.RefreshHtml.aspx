<%@ Page Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.Admin_Refresh_RefreshHtml" Title="Untitled Page" Codebehind="KS.RefreshHtml.aspx.cs" %>
<%@ Register Src="~/control/refresh/RefreshTopControl.ascx" TagName="RefreshTopNav" TagPrefix="uc1" %>
<%@ Import Namespace="Kesion.Cache" %>
<%@ Import Namespace="Kesion.Publics" %>
<asp:Content ID="Content1" ContentPlaceHolderID="KSContent" Runat="Server">
<uc1:RefreshTopNav ID="RefreshTopNavS1" runat="server"/>

 <!--    <KS:TopNav ID="TopNav1" runat="server" Text="���ɾ�̬ҳ����" />-->
        <asp:Panel ID="Panel1" runat="server" Width="100%">
           
           <div style="padding-left:5px"><asp:DropDownList ID="S_ChannelID" runat="server" style="width:200px">
          <asp:ListItem Value="0">---ѡ��Ҫ������ģ��---</asp:ListItem>
          </asp:DropDownList> <font color=red>Tips:������ģ�ͷ���������ȡ�ø��õ������ٶ�</font>
          </div>
          <table width="99%" align="center" border="0" cellpadding="1" cellspacing="1" class="CTable"> 
                <tr>
                    <td align="right" colspan="2" height="25" style="text-align: center">
                        <strong>
                     ��������ҳ��̬HTML����</strong></td>
                </tr>
                <tr>
                    <td align="right" class="lefttd" rowspan="6" style="width: 270px; text-align: center">
                        <b>��ѡ��Ҫ��������Ŀ<br />
                </b>
                <span style="color:mediumblue">
                    ��û��ѡ���κ���Ŀʱ����ʾ��������Ŀ��ɸѡ���������ļ�¼��������HTML����</span>&nbsp;

                    <Select style="WIDTH: 200px; HEIGHT: 218px;" multiple name="ClassID">
                    <%if (MyCache.GetCacheModel(ChannelID, 4) == "4")
                      {
                          Response.Write(MyCache.GetShopClassOptionList(ChannelID));
                      }
                      else
                      {
                          Response.Write(MyCache.GetClassOptionList(ChannelID));
                      }
                        %>
                </select>
                
                    <br />
                    <span style="color: #ff0066">��ʾ��</span><span style="color: #ff0000">��ס"CTRL"��"Shift"�����Խ��ж�ѡ<br />
                       </span></td>
                    <td class="righttd" valign="top" height="45" >
                        <strong>����ѡ��<br />
                        </strong><asp:RadioButtonList ID="RefreshTF" runat="server" RepeatDirection="Horizontal">
                                <asp:ListItem Value="0" Selected="True">����������Ŀ</asp:ListItem>
                                <asp:ListItem Value="1">������δ���ɹ�HTML����Ŀ</asp:ListItem>
                            </asp:RadioButtonList><span style="color: #0000cd"></span></td>
                </tr>
              <tr>
                <td class="righttd" height="45">
                    &nbsp;�ٷ���������ӵ�<asp:TextBox CssClass="textbox" ID="NewNum" runat="server" Width="43px">50</asp:TextBox>
                    <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>&nbsp;
                    <asp:Button ID="Button1" runat="server" Text="����>>" CssClass="button" OnClick="Button1_Click" /></td>
              </tr>
                <tr>
                    <td class="righttd" style="height: 84px">
                        &nbsp;�ڰ�ID�ŷ�������<asp:TextBox CssClass="textbox" ID="StartID" runat="server" Width="120px">1</asp:TextBox>��<asp:TextBox
                             CssClass="textbox" ID="EndID" runat="server" Width="120px">100</asp:TextBox>
                        <asp:Button ID="Button2" runat="server" Text="����>>" CssClass="button" OnClick="Button2_Click" /></td>
                </tr>
                <tr>
                    <td class="righttd" height="45">
					    <table width="100%">
						 <tr><td width="80">&nbsp;�۰����ڷ���</td>
						 <td width="220" style="line-height:32px;">��ʼ���ڣ�<asp:TextBox  CssClass="textbox Wdate" ID="StartDate" runat="server" onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'});" Width="150px"></asp:TextBox>
                           <br/>
                        �������ڣ�<asp:TextBox  CssClass="textbox Wdate" ID="EndDate" runat="server" onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'});" Width="150px"></asp:TextBox>
						 </td>
						 <td align="left"><asp:Button ID="Button3" runat="server" Text="����>>" CssClass="button" OnClick="Button3_Click" /></td>
						 </tr>
						 </table>
						 </td>
                </tr>
                <tr>
                    <td class="righttd" height="45">
                        &nbsp;�ܷ�����ѡ��Ŀ��<asp:Label ID="Label2" runat="server" Text="Label"></asp:Label>
                        <asp:Button ID="Button4" runat="server" Text="����ѡ����Ŀ����Ŀ>>" CssClass="button" OnClick="Button4_Click" /></td>
                </tr>
            <tr>
                <td class="righttd" height="45">
                    &nbsp;�ݲ�����Ŀ��������<asp:Label ID="Label3" runat="server" Text="Label"></asp:Label>
                    <asp:Button ID="RefreshAllItemButton" CssClass="button" runat="server" Text="��������>>" OnClick="RefreshAllItemButton_Click" /></td>
            </tr>
            <%if (MyCache.GetCacheModel(ChannelID, 4) == "4"){
                  Response.Write("<tbody style='display:none'>");
              }else{
                  Response.Write("<tbody>");
              }%>
                <tr>
                    <td align="right"  colspan="2" height="25" style="text-align: center">
                        <strong>������Ŀҳ��̬HTML����</strong></td>
                </tr>
                <tr>
                    <td align="right" class="lefttd" style="width: 270px; text-align: center;" rowspan="2">
                        <strong>��ѡ��Ҫ��������Ŀ<br />
                        </strong><span style="color: #0000cd">��û��ѡ���κ���Ŀʱ��������������Ŀ<br />
                        </span>
                        <Select style="WIDTH: 200px; HEIGHT: 180px" multiple size=2 name="ClassID">
                            <%=MyCache.GetClassOptionList(ChannelID) %>
                        </select>
                        <br />
                        <span style="color: #ff0000">��ʾ��</span><span style="color: #ff0000">��ס"CTRL"��"Shift"�����Խ��ж�ѡ</span></td>
                    <td class="righttd" rowspan="2">
                       <input type="radio" name="fsotype" value="1" id="fsotype1" /><label for="fsotype1">����ÿ����Ŀ���б��ҳ<font color=red>����ռ����Դ��</font></label><br />
                       
                       <input type="radio" name="fsotype" value="2" checked="CHECKED" id="fsotype2"/><label for="fsotype2">����������ÿ���б�ҳ��ǰ<asp:TextBox ID="FsoListNum"
                          CssClass="textbox" style="text-align:center"  runat="server" Width="35px">3</asp:TextBox>ҳ</label>
                        &nbsp;<br />
                        <br />
                        &nbsp;<asp:Button ID="Button5" runat="server" Text="������Ŀ����>>" CssClass="button" OnClick="Button5_Click" />
                        <br />
                        <br />
                        </td>
                </tr>
                </tbody>
          </table>
        </asp:Panel>
        
       
    
</asp:Content>

