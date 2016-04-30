<%@ Page Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.Admin_Label_GetFieldParam" Title="Untitled Page" Codebehind="KS.GetFieldParam.aspx.cs" %>
<asp:Content ID="Content1" ContentPlaceHolderID="KSContent" Runat="Server">
<script type="text/javascript">
function checkform()
{
    <%if (m_fieldname.ToLower().Equals("adddate")||fieldtype.Equals("System.DateTime"))
    { %>
    var dbname="{$Field(" + jQuery("#<%=this.FieldName.ClientID %>").val() + ",date,"+jQuery("#Datemb").val()+","+jQuery("#days").val()+","+jQuery("#color").val()+")}";
    <%}
    else if ((m_fieldname.ToLower().Equals("id") || m_fieldname.ToLower().Equals("infoid") || m_fieldname.ToLower().Equals("classid")))
     {
      %>
      for (var i=0;i<document.all.outype.length;i++)
            if (document.all.outype[i].checked)
                var outype=document.all.outype[i].value;
      var dbname="{$Field(" + jQuery("#<%=this.FieldName.ClientID %>").val() + ",url,0,"+outype+","+jQuery("#rewritename").val()+")}";
     <%}
    else
    {%>
    var dbname="{$Field(" + jQuery("#<%=this.FieldName.ClientID %>").val() + ",text,"+jQuery("#CatNum").val()+","+jQuery("#CatType").val()+","+jQuery("#OutSplit option:selected").val()+","+jQuery("#<%=this.TxtNullChar.ClientID%>").val()+")}";
    <%} %>
    
    parent.frames["main"].InsertValue(dbname);
    parent.box.close();
    //window.returnValue=dbname;
    //window.close();

}

</script>
<table style="margin-top:2px" border="0" cellpadding="1" cellspacing="1" width="100%">
<tr>
 <td class="righttd" style="text-align: right; width: 91px;"><strong>字段名称：</strong></td>
 <td class="righttd">
     <asp:TextBox ID="FieldName" CssClass="textbox" runat="server" ReadOnly="true"></asp:TextBox>
 </td>
</tr>
  <tbody id="datearea" runat="server" visible="false">
    <tr>
        <td class="righttd" style="height:30px;text-align: right; width: 91px;">
            <strong>输出格式：</strong></td>
        <td class="righttd">
            <input name='Datemb' type='text' class="textbox" id='Datemb' size='20' value="YY-MM-DD">
		<br/>
		<font color=red>说明：Y4或YY表示四位的年份，Y2两位年份， 　MM:月 　DD:日<br>
		hh:时　 mm:分　 ss:秒</font>
            <br />
            <input name="days" id="days" style="text-align:center;width:30px" value="3" class="textbox" />天内日期加
            <select name="color" id="color">
                <option value="red">红</option>
                <option value="yellow">黄</option>
                <option value="blue">蓝</option>
                <option value="green">绿</option>
                <option value="brown">褐</option>
                <option value="black">黑</option>
                <option value="white">白</option>
                <option value="gray">灰</option>
            </select><br />
            <font color="red">不加颜色，请留空或是填“0”。</font>
            </td>
    </tr>
  </tbody>
    <tbody id="idarea" runat="server" visible="false">
    <tr>
        <td class="righttd" style="height:30px;text-align: right; width: 91px;">
            <strong>输出格式：</strong></td>
        <td class="righttd">
            
            <%if (m_fieldname.ToLower()=="classid") 
              {%>
              <Input type='radio' name='outype' value=1 onclick="$('#rr').hide();"> 栏目名称带链接<br />
              <input type="radio" name='outype' value=2 onclick="$('#rr').hide();"> 栏目名称不带链接<br />
            <%}
              else
              { %>
              <Input type='radio' name='outype' value=1 onclick="$('#rr').hide();"> ID+链接<br />
              <Input type='radio' name='outype' value=2 onclick="$('#rr').hide();"> 标题+链接<br />
               

              <%} %>
            <Input type='radio' name='outype' value='3' checked onclick="$('#rr').hide();"> 
            对象Url <br />
            <Input type='radio' name='outype' value='4' onclick="$('#rr').hide();"> 
            字段值<br />
            <Input type='radio' name='outype' value='5' onclick="$('#rr').show();"> 
            Rewrite（URL）<br />
            <div style="display:none" id="rr">
            <input type="text" name="rewritename" class="textbox" id="rewritename" />
                </div>
            </td>
    </tr>
  </tbody>
  <tbody id="stringarea" runat="server">
    <tr>
        <td class="righttd" style="height:30px;text-align: right; width: 91px;">
            <strong>输出长度：</strong></td>
        <td class="righttd">
            <input name='CatNum' type='text' class="textbox" id='CatNum' size='3' value="0" style="width:50px;">
            <font color='#FF0000'>为0不截断，数字则保留小数位。</font></td>
    </tr>
    <tr>
        <td class="righttd" style="height:29px;text-align: right; width: 91px;">
            <strong>截断显示：</strong></td>
        <td class="righttd" style="height: 29px">
            <Input name='CatType' type='text' id='CatType' class="textbox" value='...' size="3">
            <br/><font color='#FF0000'>为0则不显示任何标志</font></td>
    </tr>
    <tr>
        <td class="righttd" style="height:30px;text-align: right; width: 91px;">
            <strong>过滤处理：</strong></td>
        <td class="righttd">
           <select name='OutSplit' id='OutSplit'><option value='0'>解析HTML标记</option><option value='1'>不解析HTML标记</option><option value='2' selected>过滤HTML标记</option></select></td>
    </tr>
    <tr>
        <td class="righttd" style="height:30px;text-align: right; width: 91px;">
            <strong>为空时输出：</strong></td>
        <td class="righttd">
           <asp:TextBox ID="TxtNullChar" CssClass="textbox" runat="server"></asp:TextBox>
    </tr>
    </tbody>
<tr>
 <td colspan="2" align="center" class="righttd" height="35">
  <input type="button" value="确定插入" class="button" onclick="checkform()" />&nbsp;
  <input type="button" value="关闭取消" class="button" onclick="parent.box.close();" />
 </td>
</tr>

</table>
</asp:Content>