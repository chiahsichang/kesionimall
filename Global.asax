<%@ Application Language="C#" %>
<%@ Import Namespace="Kesion.Publics" %>
<%@ Import Namespace="Kesion.Cache" %>
<%@ Import Namespace="Kesion.APPCode" %>
<%@ Import Namespace="System.Threading" %>   
<%@ Import Namespace="System.IO" %>   
<script RunAt="server">
    private static System.Threading.Timer timer = null;


    
    void Application_Start(object sender, EventArgs e)
    {
        
        if (MyCache.GetCacheConfig(71) == "1")
        { 
          #region 定义凌晨0 点执行  
            DateTime LuckTime = DateTime.Now.AddDays(1).Date.Add(new TimeSpan(0, 0, 0));
            TimeSpan span = LuckTime - DateTime.Now;
            if (span < TimeSpan.Zero)  span = LuckTime.AddDays(1d) - DateTime.Now;
            object state = new object();
            timer = new System.Threading.Timer(
            new TimerCallback(InitialDataPerDay), state,
            span, TimeSpan.FromTicks(TimeSpan.TicksPerDay));
          #endregion
        }
       
        
    }

   

    /// <summary>
    /// 这里是指定时间执行的代码，必须是静态的。    
    /// </summary>
    public static void InitialDataPerDay(object state)
    {
        #region 每天凌晨0点执行任务
        Public.InitialDataPerDay(state);
        #endregion
    }
    
    void Session_Start(object sender, EventArgs e)
    {
        #region 获取推广人信息
        string agent = KSCMS.S("agent");
        if (!string.IsNullOrEmpty(agent))
        {
            System.Web.HttpContext.Current.Session["agent"] = agent;
        }
        #endregion
        
    }

    void Application_End(object sender, EventArgs e)
    {
        
        if (timer != null) { timer.Dispose(); }  
    }

   

    void Application_Error(object sender, EventArgs e)
    {
    }

    void Session_End(object sender, EventArgs e)
    {
        // 在会话结束时运行的代码。 
        // 注意：只有在 Web.config 文件中的 sessionstate 模式设置为 InProc 时，才会引发 Session_End 事件。
        // 如果会话模式设置为 StateServer 或 SQLServer，则不会引发该事件。
    }

    void Application_BeginRequest(object sender, EventArgs e)
    {
        //在接收到一个应用程序请求时触发。对于一个请求来说，它是第一个被触发的事件，请求一般是用户输入的一个页面请求（URL）。

        
    }
    
    
    void Application_EndRequest(object sender, EventArgs e)
    {
        //针对应用程序请求的最后一个事件。

    }
</script>
