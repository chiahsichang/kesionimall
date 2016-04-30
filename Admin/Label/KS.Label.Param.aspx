<%@ Page Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.Admin_Label_Param" Title="Untitled Page" Codebehind="KS.Label.Param.aspx.cs" %>
<asp:Content ID="Content1" ContentPlaceHolderID="KSContent" Runat="Server">
<style type="text/css">
.t{margin-top;8px;margin-left:8px;font-weight:bold;color:Blue}
.c{margin-left:8px;margin-right:8px;margin-bottom:8px;padding:5px;border:1px dashed #CC9900;background:#FCFEF1}
.cs{}
.cs ul{margin-left:30px;}
.cs li{LIST-STYLE-IMAGE: url(../../admin/images/plus.gif);}
</style>

    <KS:TopNav ID="TopNav1" runat="server" Text="各标签参数说明" />
    
    
    
    <script type="text/javascript">
            showtips('<span class="state"><strong>说明：</strong><br /></span><br/>如果您不想在后台建标签再调用，您可以根据以下标签参数说明，直接在模板里通过如下代码格式调用想要的内容。');
		</script>
    
    <table style="margin-top:6px" width="99%"  cellpadding="1" cellspacing="1" class="CTable">
        <tr>
            <td class="righttd" style="height: 30px; text-align: center"> <strong>通用标签</strong></td>
        </tr>
       <tr>
            <td class="righttd" style="height: 30px; text-align: left">
                <strong>从数据表中查询返回一个值</strong>
                <br />
                <div class="t">格式：</div>
                 <div class="c">{=Execute(要查询的SQL语句)}</div>
                <div class="t">示例：</div>
                <div class="cs">
                 &nbsp;&nbsp;&nbsp;&nbsp;例1：{=Execute("select count(1) from KS_User")} 将返回本站会员人数<br />
                 &nbsp;&nbsp;&nbsp;&nbsp;例2：{=Execute("select count(1) from KS_InfoList")} 将返回本站文档数量<br />
                </div>
         </td>
      </tr>
      
       <tr>
            <td class="righttd" style="height: 30px; text-align: center"> <strong>入门级标签</strong></td>
        </tr>
        <tr>
            <td class="righttd" style="height: 30px; text-align: left">
                <strong>1、列表式标签</strong>
                <br />
                <div class="t">格式：</div>
                <div class="c">
                    {KS:Label type="list" PrintStyle="1" Ajax="0"
                            ChannelID="1" ClassID="-1" Num="3" LinkTarget="_blank" SpecialID="0" DateStyle="YY年MM月DD日 mm:ss" NavType="1"
                                                    NavStr="n.gif" ShowClassName="1" ChildClass="1"
                                                    ClassLink="1" ShowNewPic="1" ShowHotPic="1"
                                                    Order="I.InfoId desc" TitleCss="t"
                Recommends
                                                    ="1" Hot="1" splendid="1" slide="1" strip="1" rolls="1" TitleLen="20"
                                                    }{/KS:Label}
                  </div>
                  <div class="t">参数说明：</div>
                  <div class="cs">
                   <ul>
                  <li><span>Type (*)</span>            标签类型 list 说明为列表式标签</li>
                  <li><span>PrintStyle</span>        输出样式 1 table 2 纯LI格式输出</li>
                  <li>Ajax     是否AJAX输出  1 是 0否</li>
                  <li>ChannelID       模型ID号</li>
                  <li>ClassID          栏目ID，取值为0，表示不指定栏目 取值为-1，表示当前栏目通用，多个ID以逗号隔开 </li>
                  <li>ChildClass       列表是否包含子栏目，取1将子栏目信息也列出，取0为不列出</li>
                  <li>SpecialID        专题ID,取值为0,表示不指定专题 取-1表示当取专题通用</li>
                  <li>Recommend      是否推荐 1是 0不限</li>
                  <li>Hot             是否热点 1是0不限</li>
                  <li>Splendid         是否精彩 1是0不限</li>
                  <li>Slide            是否幻灯 1是0不限</li>
                  <li>Strip            是否头条 1是 0不限</li>
                  <li>Rolls            是否滚动 1是0不限</li>
                  <li>Order            排序方式 如 I.Infoid desc  默认为 I.Infoid desc</li>
                  <li>Num             查询记录数，默认为10条</li>
                  <li>Col              显示多少列，默认为1列</li>
                  <li>LinkTarget        链接目标  如_blank _parent _top</li>
                  <li>NavType          导航类型 1图片 0文字</li>
                  <li>NavStr            导航文字或图片地址，如NavStr="/images/nav.gif"或NavStr="*"</li>
                  <li>DateStyle         日期样式 如 YY年MM月DD日<br />标签说明：Y4或YY表示四位的年份，MM表示月份，DD表示日，hh小时 mm分钟 ss钞</li>
                  <li>ShowClassName    显示栏目名称  取1显示，取0不显示</li>
                  <li>ClassLink         栏目名称是否加链接 取1加链接 取0不加链接 默认为加链接</li>
                  <li>TitleLen            标题字数，超过指定字数后将自动截段</li>
                  <li>TitleCss            标题样式</li>
                  <li>MoreStr            更多标志</li>
                  <li>ShowNewPic       显示最新图标</li>
                  <li>ShowHotPic        显示热门图标 </li>
                   </ul>
                  </div>
                  
               </td>
        </tr>
        <tr>
            <td class="righttd" style="height: 30px; text-align: left">
                <strong>2、连续滚动图片标签</strong>
                <br />
                <div class="t">格式：</div>
                <div class="c">
                    {KS:Label type="RollsPic" ChannelID="1" specialid="0" classid="0" ChildClass="0" Num="10" width="150" height="200" direction="down" showtitle="1" titlelen="10" titlecss="tcs" piccss="sss" linktarget="_blank" Speed="30"  PicWidth="130" PicHeight="90" order="I.Infoid desc"}{/KS:Label}
                  </div>
                  <div class="t">参数说明：</div>
                  <div class="cs">
                   <ul>
                       <li>Type (*)         标签类型 rollspic 连续滚动图片标签</li>
                       <li>ChannelID       模型ID,默认为1</li>
                       <li>ClassID         栏目ID，取值为0，表示不指定栏目 取值为-1，表示当前栏目通用，多个ID以逗号隔开 </li>
                       <li>ChildClass      列表是否包含子栏目，取1将子栏目信息也列出，取0为不列出</li>
                       <li>SpecialID        专题ID,取值为0,表示不指定专题 取-1表示当取专题通用</li>
                       <li>Direction       滚动方向，取值范围up 向上 down向下 left 向左 right向右</li>
                       <li>Num           查询记录数，默认为10条</li>
                       <li>Width          滚动宽度</li>
                       <li>Height          滚动高度</li>
                       <li>ShowTitle      是否显示名称，1是0否</li>
                       <li>TitleLen        标题字数</li>
                       <li>TitleCss        标题样式</li>
                       <li>PicCss         图片样式</li>
                       <li>LinkTarget      链接目标</li>
                       <li>PicWidth       图片宽度</li>
                       <li>PicHeight       图片高度</li>
                       <li>Speed          滚动速度</li>
                       <li>Order          排序方式 如 I.Infoid desc  默认为 I.Infoid desc</li>
                   </ul>
                  </div>
             </td>
        </tr>
        <tr>
            <td class="righttd" style="height: 30px; text-align: left">
                <strong>3、幻灯片标签</strong>
                <br />
                <div class="t">格式：</div>
                <div class="c">
{KS:Label type="Slide" slidestyle="3" ChannelID="1" specialid="0" classid="0" ChildClass="0" titlelen="10" linktarget="_blank" width="520" height="200" showtitle="1" ClassID="0" Num="10" order="I.Infoid desc"}{/KS:Label}
                  </div>
                  <div class="t">参数说明：</div>
                  <div class="cs">
                   <ul>
                       <li>Type (*)         标签类型 slide 幻灯片标签</li>
                       <li>ChannelID       模型ID,默认为1</li>
                       <li>ClassID         栏目ID，取值为0，表示不指定栏目 取值为-1，表示当前栏目通用，多个ID以逗号隔开 </li>
                       <li>ChildClass      列表是否包含子栏目，取1将子栏目信息也列出，取0为不列出</li>
                       <li>SpecialID       专题ID,取值为0,表示不指定专题 取-1表示当取专题通用</li>
                       <li>Num           查询记录数，默认为10条</li>
                       <li>SlideStyle       幻灯片样式 0普通幻灯 1flash样式一2 flash样式二3 flash样式三</li>
                       <li>Width           滚动宽度</li>
                       <li>Height          滚动高度</li>
                       <li>ShowTitle       是否显示标题 1是，0否</li>
                       <li>TitleLen         标题长度 </li>
                       <li>LinkTarget       链接目标</li>
                       <li>Order           排序方式 默认 I.Infoid desc</li>
                   </ul>
                  </div>
             </td>
        </tr>
        <tr>
            <td class="righttd" style="height: 30px; text-align: left">
                <strong>4、位置导航标签</strong>
                <br />
                <div class="t">格式：</div>
                <div class="c">
                    {KS:Label type="Navigation" NavTag=" >> " startNav="您现在位置："}{/KS:Label}
                  </div>
                  <div class="t">参数说明：</div>
                  <div class="cs">
                   <ul>
                       <li>Type (*)         标签类型 navigation 说明为位置导航标签</li>
                       <li>NavTag         导航分隔线</li>
                       <li>StartNav        开始标志</li>
                   </ul>
                  </div>
             </td>
        </tr>
        <tr>
            <td class="righttd" style="height: 30px; text-align: center"> <strong>中级标签</strong></td>
        </tr>
        <tr>
            <td class="righttd" style="height: 30px; text-align: left">
                <strong>1、智能列表式标签</strong>
                <br />
                <div class="t">格式：</div>
                <div class="c">
{KS:Label type="Ilist" Ajax="0" ChannelID="1" ClassID="-1" Num="3" SpecialID="0"  ChildClass="1" SQLCondition=""  Order="I.Infoid desc"  Recommends ="1" Hot="1" splendid="1" slide="1" strip="1" rolls="1"  HasPic="0"}
<br />
<font color=red>innertext<br />
</font>{/KS:Label}
                  </div>
                  <div class="t">参数说明：</div>
                  <div class="cs">
                   <ul>
                       <li>Type (*)         标签类型 list 说明为列表式标签</li>
                       <li>Ajax       是否AJAX输出 1 是 0否 </li>
                       <li>ChannelID       模型ID号</li>
                       <li>ClassID          栏目ID，取值为-1，表示当前栏目通用，多个ID以逗号隔开 </li>
                       <li>ChildClass       列表是否包含子栏目，取1将子栏目信息也列出，取0为不列出</li>
                       <li>SQLCondition  附加SQL条件 可留空，如 and i.inputer='admin' </li>
                       <li>SpecialID        专题ID,取值为0,表示不指定专题 取-1表示当取专题通用</li>
                       <li>Recommend      是否推荐 1是 0不限</li>
                       <li>Hot             是否热点 1是0不限</li>
                       <li>Splendid         是否精彩 1是0不限</li>
                       <li>Slide            是否幻灯 1是0不限</li>
                       <li>Strip            是否头条 1是 0不限</li>
                       <li>Rolls            是否滚动 1是0不限</li>
                       <li>HasPic           仅显示带图片 1是0不限</li>
                       <li>Order            排序方式 如 I.Infoid desc  默认为 I.Infoid desc</li>
                       <li>Num             查询记录数，默认为10条</li>
                       <li>Innertext          单条记录循环体样式(结合字段标签使用)</li>
                   </ul>
                  </div>
             </td>
        </tr>
        <tr>
            <td class="righttd" style="height: 30px; text-align: left">
                <strong>2、智能循环栏目列表标签</strong>
                <br />
                <div class="t">格式：</div>
                <div class="c">
{KS:Label type="LClass" Ajax="0" ClassID="-1" SpecialID="0" ChildClass="1" SQLCondition="" Order="I.Infoid desc" Recommends ="1" Hot="1" splendid="1" slide="1" strip="1" rolls="1"  HasPic="0" EmptyText="此栏目下没有信息"}     
       <br />
          <font color=red>
          &nbsp;&nbsp;[KS:List]<br />
           &nbsp;&nbsp;&nbsp;&nbsp; [!—looplist--]<br />
          &nbsp;&nbsp;[/KS:List]<br />
          </font>
{/KS:Label}


             </div>
                  <div class="t">参数说明：</div>
                  <div class="cs">
                   <ul>
                       <li>Type (*)            标签类型 LClass 说明为循环栏目列表标签</li>
                       <li>Ajax       是否AJAX输出 1 是 0否 </li>
                       <li>ClassID          栏目ID，取值为-1，表示当前栏目通用，多个ID以逗号隔开 </li>
                       <li>EmptyText       栏目下没有记录时提示消息！</li>
                       <li>ChildClass       列表是否包含子栏目，取1将子栏目信息也列出，取0为不列出</li>
                       <li>SQLCondition  附加SQL条件 可留空，如 and i.inputer='admin' </li>
                       <li>SpecialID        专题ID,取值为0,表示不指定专题 取-1表示当取专题通用</li>
                       <li>Recommend      是否推荐 1是 0不限</li>
                       <li>Hot             是否热点 1是0不限</li>
                       <li>Splendid         是否精彩 1是0不限</li>
                       <li>Slide            是否幻灯 1是0不限</li>
                       <li>Strip            是否头条 1是 0不限</li>
                       <li>Rolls            是否滚动 1是0不限</li>
                       <li>HasPic           仅显示带图片 1是0不限</li>
                       <li>Order            排序方式 如 I.Infoid desc  默认为 I.Infoid desc</li>
                       <br /><br />
                       
                       
                       列表格式[!—looplist--]：<br /><font color=red>
                         &nbsp;&nbsp;[loop times="n"]<br />
                           &nbsp;&nbsp;&nbsp;&nbsp;Innertext<br />
                        &nbsp;&nbsp; [/loop]<br />
                         &nbsp;&nbsp;[loop times="n+1"]<br />
                         &nbsp;&nbsp; ……<br />
                          </font>
                        参数说明：<br />
                       	[Loop] [/loop]         循环对，不能嵌套但可以出现多对。<br />
                       	Times            循环次数 n>=0<br />
                       	Innertext          单条记录循环体样式(结合字段标签使用)><br />

                   </ul>
                  </div>
             </td>
        </tr>
        <tr>
            <td class="righttd" style="height: 30px; text-align: left">
                <strong>3、智能终级分页列表标签</strong>
                <br />
                <div class="t">格式：</div>
                <div class="c">
{KS:Label type="Page" Ajax="1" PageStyle="1" HasPic="1" ChildClass="0"  Order="I.Infoid desc"  EmptyText="本栏目下没有任意信息！"}
 <br />
   <font color=red>
      &nbsp;&nbsp;[Loop times="2"]<br />
    &nbsp;&nbsp;&nbsp;&nbsp;InnerText<br />
    &nbsp;&nbsp;[/Loop]<br />
     &nbsp;&nbsp; [KS.PageStr]<br />    </font>
    {/KS:Label}<br />

                  </div>
                  <div class="t">参数说明：</div>
                  <div class="cs">
                   <ul>
                       <li>Type (*)         标签类型 Page 说明为分页列表标签</li>
                        <li>Ajax       是否AJAX输出 1 是 0否 </li>
                       <li>PageStyle        分页样式</li>
                       <li>HasPic          只显示带图片的记录</li>
                       <li>ChildClass       显示子栏目的记录1是 0 否</li>
                       <li>Order           排序方式</li>
                       <li>EmptyText       栏目下没有信息时的提示信息</li>
                       <br /><br />

循环对参数：<br />
?	[Loop] [/loop]         循环对，不能嵌套但可以出现多对。<br />
?	Times            循环次数 n>=0<br />
?	Innertext          单条记录循环体样式(结合字段标签使用)<br />


                   </ul>
                  </div>
             </td>
        </tr>
           
         <tr>
            <td class="righttd" style="height: 30px; text-align: center"> <strong>高级SQL标签</strong></td>
        </tr>
                <tr>
            <td class="righttd" style="height: 30px; text-align: left">
                <br />
                <div class="t">格式：</div>
                <div class="c">
{KS:Label type="ISQL" LabelSourceType="0" ConnectionString="连接字符" SQL="SQL查询语句" LabelType="0" Ajax="0" PageStyle="1" ItemName="篇" LabelParam="标签参数" EmptyText="本栏目下没有任意信息！"}
 <br />
   <font color=red>
      &nbsp;&nbsp;[Loop times="n"]<br />
    &nbsp;&nbsp;&nbsp;&nbsp;InnerText<br />
    &nbsp;&nbsp;[/Loop]<br />
   </font>
    {/KS:Label}<br />

                  </div>
                  <div class="t">参数说明：</div>
                  <div class="cs">
                   <ul>
                       <li>Type (*)         标签类型 ISQL 说明为高级SQL标签</li>
                       <li>LabelSourceType  标签数据源 0 本系统数据源(默认) 1外部Access数据源 2外部SQL数据源 3外部ODBC数据源 4 外部Oracle数据源 5外部Excel数据源6外部OLE数据源</li>
                       <li>ConnectionString  数据源连接字符串</li>
                       <li>SQL             标签SQL查询语句</li>
                       <li>LabelType        标签类型 0普甬标签  1分页标签</li>
                       <li>LabelParam       标签参数，多个参数用"|"隔开 如：查询条数|调用栏目，将形成可用标签[KS:Param(0],[KS:Param(1)]....</li>
                        <li>Ajax       是否AJAX输出 1 是 0否 </li>
                       <li>PageStyle        分页样式</li>
                       <li>ItemName        分页项目单位如篇，条，个</li>
                       <li>EmptyText       栏目下没有信息时的提示信息</li>
                       <br /><br />

循环对参数：<br />
?	[Loop] [/loop]         循环对，不能嵌套但可以出现多对。<br />
?	Times            循环次数 n>=0<br />
?	Innertext          单条记录循环体样式(结合字段标签使用)<br />


                   </ul>
                  </div>
             </td>
        </tr>

    </table>
    
</asp:Content>

