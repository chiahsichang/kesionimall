<%@ Page Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.Admin_Label_Param" Title="Untitled Page" Codebehind="KS.Label.Param.aspx.cs" %>
<asp:Content ID="Content1" ContentPlaceHolderID="KSContent" Runat="Server">
<style type="text/css">
.t{margin-top;8px;margin-left:8px;font-weight:bold;color:Blue}
.c{margin-left:8px;margin-right:8px;margin-bottom:8px;padding:5px;border:1px dashed #CC9900;background:#FCFEF1}
.cs{}
.cs ul{margin-left:30px;}
.cs li{LIST-STYLE-IMAGE: url(../../admin/images/plus.gif);}
</style>

    <KS:TopNav ID="TopNav1" runat="server" Text="����ǩ����˵��" />
    
    
    
    <script type="text/javascript">
            showtips('<span class="state"><strong>˵����</strong><br /></span><br/>����������ں�̨����ǩ�ٵ��ã������Ը������±�ǩ����˵����ֱ����ģ����ͨ�����´����ʽ������Ҫ�����ݡ�');
		</script>
    
    <table style="margin-top:6px" width="99%"  cellpadding="1" cellspacing="1" class="CTable">
        <tr>
            <td class="righttd" style="height: 30px; text-align: center"> <strong>ͨ�ñ�ǩ</strong></td>
        </tr>
       <tr>
            <td class="righttd" style="height: 30px; text-align: left">
                <strong>�����ݱ��в�ѯ����һ��ֵ</strong>
                <br />
                <div class="t">��ʽ��</div>
                 <div class="c">{=Execute(Ҫ��ѯ��SQL���)}</div>
                <div class="t">ʾ����</div>
                <div class="cs">
                 &nbsp;&nbsp;&nbsp;&nbsp;��1��{=Execute("select count(1) from KS_User")} �����ر�վ��Ա����<br />
                 &nbsp;&nbsp;&nbsp;&nbsp;��2��{=Execute("select count(1) from KS_InfoList")} �����ر�վ�ĵ�����<br />
                </div>
         </td>
      </tr>
      
       <tr>
            <td class="righttd" style="height: 30px; text-align: center"> <strong>���ż���ǩ</strong></td>
        </tr>
        <tr>
            <td class="righttd" style="height: 30px; text-align: left">
                <strong>1���б�ʽ��ǩ</strong>
                <br />
                <div class="t">��ʽ��</div>
                <div class="c">
                    {KS:Label type="list" PrintStyle="1" Ajax="0"
                            ChannelID="1" ClassID="-1" Num="3" LinkTarget="_blank" SpecialID="0" DateStyle="YY��MM��DD�� mm:ss" NavType="1"
                                                    NavStr="n.gif" ShowClassName="1" ChildClass="1"
                                                    ClassLink="1" ShowNewPic="1" ShowHotPic="1"
                                                    Order="I.InfoId desc" TitleCss="t"
                Recommends
                                                    ="1" Hot="1" splendid="1" slide="1" strip="1" rolls="1" TitleLen="20"
                                                    }{/KS:Label}
                  </div>
                  <div class="t">����˵����</div>
                  <div class="cs">
                   <ul>
                  <li><span>Type (*)</span>            ��ǩ���� list ˵��Ϊ�б�ʽ��ǩ</li>
                  <li><span>PrintStyle</span>        �����ʽ 1 table 2 ��LI��ʽ���</li>
                  <li>Ajax     �Ƿ�AJAX���  1 �� 0��</li>
                  <li>ChannelID       ģ��ID��</li>
                  <li>ClassID          ��ĿID��ȡֵΪ0����ʾ��ָ����Ŀ ȡֵΪ-1����ʾ��ǰ��Ŀͨ�ã����ID�Զ��Ÿ��� </li>
                  <li>ChildClass       �б��Ƿ��������Ŀ��ȡ1������Ŀ��ϢҲ�г���ȡ0Ϊ���г�</li>
                  <li>SpecialID        ר��ID,ȡֵΪ0,��ʾ��ָ��ר�� ȡ-1��ʾ��ȡר��ͨ��</li>
                  <li>Recommend      �Ƿ��Ƽ� 1�� 0����</li>
                  <li>Hot             �Ƿ��ȵ� 1��0����</li>
                  <li>Splendid         �Ƿ񾫲� 1��0����</li>
                  <li>Slide            �Ƿ�õ� 1��0����</li>
                  <li>Strip            �Ƿ�ͷ�� 1�� 0����</li>
                  <li>Rolls            �Ƿ���� 1��0����</li>
                  <li>Order            ����ʽ �� I.Infoid desc  Ĭ��Ϊ I.Infoid desc</li>
                  <li>Num             ��ѯ��¼����Ĭ��Ϊ10��</li>
                  <li>Col              ��ʾ�����У�Ĭ��Ϊ1��</li>
                  <li>LinkTarget        ����Ŀ��  ��_blank _parent _top</li>
                  <li>NavType          �������� 1ͼƬ 0����</li>
                  <li>NavStr            �������ֻ�ͼƬ��ַ����NavStr="/images/nav.gif"��NavStr="*"</li>
                  <li>DateStyle         ������ʽ �� YY��MM��DD��<br />��ǩ˵����Y4��YY��ʾ��λ����ݣ�MM��ʾ�·ݣ�DD��ʾ�գ�hhСʱ mm���� ss��</li>
                  <li>ShowClassName    ��ʾ��Ŀ����  ȡ1��ʾ��ȡ0����ʾ</li>
                  <li>ClassLink         ��Ŀ�����Ƿ������ ȡ1������ ȡ0�������� Ĭ��Ϊ������</li>
                  <li>TitleLen            ��������������ָ���������Զ��ض�</li>
                  <li>TitleCss            ������ʽ</li>
                  <li>MoreStr            �����־</li>
                  <li>ShowNewPic       ��ʾ����ͼ��</li>
                  <li>ShowHotPic        ��ʾ����ͼ�� </li>
                   </ul>
                  </div>
                  
               </td>
        </tr>
        <tr>
            <td class="righttd" style="height: 30px; text-align: left">
                <strong>2����������ͼƬ��ǩ</strong>
                <br />
                <div class="t">��ʽ��</div>
                <div class="c">
                    {KS:Label type="RollsPic" ChannelID="1" specialid="0" classid="0" ChildClass="0" Num="10" width="150" height="200" direction="down" showtitle="1" titlelen="10" titlecss="tcs" piccss="sss" linktarget="_blank" Speed="30"  PicWidth="130" PicHeight="90" order="I.Infoid desc"}{/KS:Label}
                  </div>
                  <div class="t">����˵����</div>
                  <div class="cs">
                   <ul>
                       <li>Type (*)         ��ǩ���� rollspic ��������ͼƬ��ǩ</li>
                       <li>ChannelID       ģ��ID,Ĭ��Ϊ1</li>
                       <li>ClassID         ��ĿID��ȡֵΪ0����ʾ��ָ����Ŀ ȡֵΪ-1����ʾ��ǰ��Ŀͨ�ã����ID�Զ��Ÿ��� </li>
                       <li>ChildClass      �б��Ƿ��������Ŀ��ȡ1������Ŀ��ϢҲ�г���ȡ0Ϊ���г�</li>
                       <li>SpecialID        ר��ID,ȡֵΪ0,��ʾ��ָ��ר�� ȡ-1��ʾ��ȡר��ͨ��</li>
                       <li>Direction       ��������ȡֵ��Χup ���� down���� left ���� right����</li>
                       <li>Num           ��ѯ��¼����Ĭ��Ϊ10��</li>
                       <li>Width          �������</li>
                       <li>Height          �����߶�</li>
                       <li>ShowTitle      �Ƿ���ʾ���ƣ�1��0��</li>
                       <li>TitleLen        ��������</li>
                       <li>TitleCss        ������ʽ</li>
                       <li>PicCss         ͼƬ��ʽ</li>
                       <li>LinkTarget      ����Ŀ��</li>
                       <li>PicWidth       ͼƬ���</li>
                       <li>PicHeight       ͼƬ�߶�</li>
                       <li>Speed          �����ٶ�</li>
                       <li>Order          ����ʽ �� I.Infoid desc  Ĭ��Ϊ I.Infoid desc</li>
                   </ul>
                  </div>
             </td>
        </tr>
        <tr>
            <td class="righttd" style="height: 30px; text-align: left">
                <strong>3���õ�Ƭ��ǩ</strong>
                <br />
                <div class="t">��ʽ��</div>
                <div class="c">
{KS:Label type="Slide" slidestyle="3" ChannelID="1" specialid="0" classid="0" ChildClass="0" titlelen="10" linktarget="_blank" width="520" height="200" showtitle="1" ClassID="0" Num="10" order="I.Infoid desc"}{/KS:Label}
                  </div>
                  <div class="t">����˵����</div>
                  <div class="cs">
                   <ul>
                       <li>Type (*)         ��ǩ���� slide �õ�Ƭ��ǩ</li>
                       <li>ChannelID       ģ��ID,Ĭ��Ϊ1</li>
                       <li>ClassID         ��ĿID��ȡֵΪ0����ʾ��ָ����Ŀ ȡֵΪ-1����ʾ��ǰ��Ŀͨ�ã����ID�Զ��Ÿ��� </li>
                       <li>ChildClass      �б��Ƿ��������Ŀ��ȡ1������Ŀ��ϢҲ�г���ȡ0Ϊ���г�</li>
                       <li>SpecialID       ר��ID,ȡֵΪ0,��ʾ��ָ��ר�� ȡ-1��ʾ��ȡר��ͨ��</li>
                       <li>Num           ��ѯ��¼����Ĭ��Ϊ10��</li>
                       <li>SlideStyle       �õ�Ƭ��ʽ 0��ͨ�õ� 1flash��ʽһ2 flash��ʽ��3 flash��ʽ��</li>
                       <li>Width           �������</li>
                       <li>Height          �����߶�</li>
                       <li>ShowTitle       �Ƿ���ʾ���� 1�ǣ�0��</li>
                       <li>TitleLen         ���ⳤ�� </li>
                       <li>LinkTarget       ����Ŀ��</li>
                       <li>Order           ����ʽ Ĭ�� I.Infoid desc</li>
                   </ul>
                  </div>
             </td>
        </tr>
        <tr>
            <td class="righttd" style="height: 30px; text-align: left">
                <strong>4��λ�õ�����ǩ</strong>
                <br />
                <div class="t">��ʽ��</div>
                <div class="c">
                    {KS:Label type="Navigation" NavTag=" >> " startNav="������λ�ã�"}{/KS:Label}
                  </div>
                  <div class="t">����˵����</div>
                  <div class="cs">
                   <ul>
                       <li>Type (*)         ��ǩ���� navigation ˵��Ϊλ�õ�����ǩ</li>
                       <li>NavTag         �����ָ���</li>
                       <li>StartNav        ��ʼ��־</li>
                   </ul>
                  </div>
             </td>
        </tr>
        <tr>
            <td class="righttd" style="height: 30px; text-align: center"> <strong>�м���ǩ</strong></td>
        </tr>
        <tr>
            <td class="righttd" style="height: 30px; text-align: left">
                <strong>1�������б�ʽ��ǩ</strong>
                <br />
                <div class="t">��ʽ��</div>
                <div class="c">
{KS:Label type="Ilist" Ajax="0" ChannelID="1" ClassID="-1" Num="3" SpecialID="0"  ChildClass="1" SQLCondition=""  Order="I.Infoid desc"  Recommends ="1" Hot="1" splendid="1" slide="1" strip="1" rolls="1"  HasPic="0"}
<br />
<font color=red>innertext<br />
</font>{/KS:Label}
                  </div>
                  <div class="t">����˵����</div>
                  <div class="cs">
                   <ul>
                       <li>Type (*)         ��ǩ���� list ˵��Ϊ�б�ʽ��ǩ</li>
                       <li>Ajax       �Ƿ�AJAX��� 1 �� 0�� </li>
                       <li>ChannelID       ģ��ID��</li>
                       <li>ClassID          ��ĿID��ȡֵΪ-1����ʾ��ǰ��Ŀͨ�ã����ID�Զ��Ÿ��� </li>
                       <li>ChildClass       �б��Ƿ��������Ŀ��ȡ1������Ŀ��ϢҲ�г���ȡ0Ϊ���г�</li>
                       <li>SQLCondition  ����SQL���� �����գ��� and i.inputer='admin' </li>
                       <li>SpecialID        ר��ID,ȡֵΪ0,��ʾ��ָ��ר�� ȡ-1��ʾ��ȡר��ͨ��</li>
                       <li>Recommend      �Ƿ��Ƽ� 1�� 0����</li>
                       <li>Hot             �Ƿ��ȵ� 1��0����</li>
                       <li>Splendid         �Ƿ񾫲� 1��0����</li>
                       <li>Slide            �Ƿ�õ� 1��0����</li>
                       <li>Strip            �Ƿ�ͷ�� 1�� 0����</li>
                       <li>Rolls            �Ƿ���� 1��0����</li>
                       <li>HasPic           ����ʾ��ͼƬ 1��0����</li>
                       <li>Order            ����ʽ �� I.Infoid desc  Ĭ��Ϊ I.Infoid desc</li>
                       <li>Num             ��ѯ��¼����Ĭ��Ϊ10��</li>
                       <li>Innertext          ������¼ѭ������ʽ(����ֶα�ǩʹ��)</li>
                   </ul>
                  </div>
             </td>
        </tr>
        <tr>
            <td class="righttd" style="height: 30px; text-align: left">
                <strong>2������ѭ����Ŀ�б��ǩ</strong>
                <br />
                <div class="t">��ʽ��</div>
                <div class="c">
{KS:Label type="LClass" Ajax="0" ClassID="-1" SpecialID="0" ChildClass="1" SQLCondition="" Order="I.Infoid desc" Recommends ="1" Hot="1" splendid="1" slide="1" strip="1" rolls="1"  HasPic="0" EmptyText="����Ŀ��û����Ϣ"}     
       <br />
          <font color=red>
          &nbsp;&nbsp;[KS:List]<br />
           &nbsp;&nbsp;&nbsp;&nbsp; [!��looplist--]<br />
          &nbsp;&nbsp;[/KS:List]<br />
          </font>
{/KS:Label}


             </div>
                  <div class="t">����˵����</div>
                  <div class="cs">
                   <ul>
                       <li>Type (*)            ��ǩ���� LClass ˵��Ϊѭ����Ŀ�б��ǩ</li>
                       <li>Ajax       �Ƿ�AJAX��� 1 �� 0�� </li>
                       <li>ClassID          ��ĿID��ȡֵΪ-1����ʾ��ǰ��Ŀͨ�ã����ID�Զ��Ÿ��� </li>
                       <li>EmptyText       ��Ŀ��û�м�¼ʱ��ʾ��Ϣ��</li>
                       <li>ChildClass       �б��Ƿ��������Ŀ��ȡ1������Ŀ��ϢҲ�г���ȡ0Ϊ���г�</li>
                       <li>SQLCondition  ����SQL���� �����գ��� and i.inputer='admin' </li>
                       <li>SpecialID        ר��ID,ȡֵΪ0,��ʾ��ָ��ר�� ȡ-1��ʾ��ȡר��ͨ��</li>
                       <li>Recommend      �Ƿ��Ƽ� 1�� 0����</li>
                       <li>Hot             �Ƿ��ȵ� 1��0����</li>
                       <li>Splendid         �Ƿ񾫲� 1��0����</li>
                       <li>Slide            �Ƿ�õ� 1��0����</li>
                       <li>Strip            �Ƿ�ͷ�� 1�� 0����</li>
                       <li>Rolls            �Ƿ���� 1��0����</li>
                       <li>HasPic           ����ʾ��ͼƬ 1��0����</li>
                       <li>Order            ����ʽ �� I.Infoid desc  Ĭ��Ϊ I.Infoid desc</li>
                       <br /><br />
                       
                       
                       �б��ʽ[!��looplist--]��<br /><font color=red>
                         &nbsp;&nbsp;[loop times="n"]<br />
                           &nbsp;&nbsp;&nbsp;&nbsp;Innertext<br />
                        &nbsp;&nbsp; [/loop]<br />
                         &nbsp;&nbsp;[loop times="n+1"]<br />
                         &nbsp;&nbsp; ����<br />
                          </font>
                        ����˵����<br />
                       	[Loop] [/loop]         ѭ���ԣ�����Ƕ�׵����Գ��ֶ�ԡ�<br />
                       	Times            ѭ������ n>=0<br />
                       	Innertext          ������¼ѭ������ʽ(����ֶα�ǩʹ��)><br />

                   </ul>
                  </div>
             </td>
        </tr>
        <tr>
            <td class="righttd" style="height: 30px; text-align: left">
                <strong>3�������ռ���ҳ�б��ǩ</strong>
                <br />
                <div class="t">��ʽ��</div>
                <div class="c">
{KS:Label type="Page" Ajax="1" PageStyle="1" HasPic="1" ChildClass="0"  Order="I.Infoid desc"  EmptyText="����Ŀ��û��������Ϣ��"}
 <br />
   <font color=red>
      &nbsp;&nbsp;[Loop times="2"]<br />
    &nbsp;&nbsp;&nbsp;&nbsp;InnerText<br />
    &nbsp;&nbsp;[/Loop]<br />
     &nbsp;&nbsp; [KS.PageStr]<br />    </font>
    {/KS:Label}<br />

                  </div>
                  <div class="t">����˵����</div>
                  <div class="cs">
                   <ul>
                       <li>Type (*)         ��ǩ���� Page ˵��Ϊ��ҳ�б��ǩ</li>
                        <li>Ajax       �Ƿ�AJAX��� 1 �� 0�� </li>
                       <li>PageStyle        ��ҳ��ʽ</li>
                       <li>HasPic          ֻ��ʾ��ͼƬ�ļ�¼</li>
                       <li>ChildClass       ��ʾ����Ŀ�ļ�¼1�� 0 ��</li>
                       <li>Order           ����ʽ</li>
                       <li>EmptyText       ��Ŀ��û����Ϣʱ����ʾ��Ϣ</li>
                       <br /><br />

ѭ���Բ�����<br />
?	[Loop] [/loop]         ѭ���ԣ�����Ƕ�׵����Գ��ֶ�ԡ�<br />
?	Times            ѭ������ n>=0<br />
?	Innertext          ������¼ѭ������ʽ(����ֶα�ǩʹ��)<br />


                   </ul>
                  </div>
             </td>
        </tr>
           
         <tr>
            <td class="righttd" style="height: 30px; text-align: center"> <strong>�߼�SQL��ǩ</strong></td>
        </tr>
                <tr>
            <td class="righttd" style="height: 30px; text-align: left">
                <br />
                <div class="t">��ʽ��</div>
                <div class="c">
{KS:Label type="ISQL" LabelSourceType="0" ConnectionString="�����ַ�" SQL="SQL��ѯ���" LabelType="0" Ajax="0" PageStyle="1" ItemName="ƪ" LabelParam="��ǩ����" EmptyText="����Ŀ��û��������Ϣ��"}
 <br />
   <font color=red>
      &nbsp;&nbsp;[Loop times="n"]<br />
    &nbsp;&nbsp;&nbsp;&nbsp;InnerText<br />
    &nbsp;&nbsp;[/Loop]<br />
   </font>
    {/KS:Label}<br />

                  </div>
                  <div class="t">����˵����</div>
                  <div class="cs">
                   <ul>
                       <li>Type (*)         ��ǩ���� ISQL ˵��Ϊ�߼�SQL��ǩ</li>
                       <li>LabelSourceType  ��ǩ����Դ 0 ��ϵͳ����Դ(Ĭ��) 1�ⲿAccess����Դ 2�ⲿSQL����Դ 3�ⲿODBC����Դ 4 �ⲿOracle����Դ 5�ⲿExcel����Դ6�ⲿOLE����Դ</li>
                       <li>ConnectionString  ����Դ�����ַ���</li>
                       <li>SQL             ��ǩSQL��ѯ���</li>
                       <li>LabelType        ��ǩ���� 0����ǩ  1��ҳ��ǩ</li>
                       <li>LabelParam       ��ǩ���������������"|"���� �磺��ѯ����|������Ŀ�����γɿ��ñ�ǩ[KS:Param(0],[KS:Param(1)]....</li>
                        <li>Ajax       �Ƿ�AJAX��� 1 �� 0�� </li>
                       <li>PageStyle        ��ҳ��ʽ</li>
                       <li>ItemName        ��ҳ��Ŀ��λ��ƪ��������</li>
                       <li>EmptyText       ��Ŀ��û����Ϣʱ����ʾ��Ϣ</li>
                       <br /><br />

ѭ���Բ�����<br />
?	[Loop] [/loop]         ѭ���ԣ�����Ƕ�׵����Գ��ֶ�ԡ�<br />
?	Times            ѭ������ n>=0<br />
?	Innertext          ������¼ѭ������ʽ(����ֶα�ǩʹ��)<br />


                   </ul>
                  </div>
             </td>
        </tr>

    </table>
    
</asp:Content>

