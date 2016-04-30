function checkSocialToken(obj,apiid) {
    jQuery.ajax({
                type: "POST",
                url: "../../plus/ajaxs.ashx",
                data: "a=checkToken&apiid=" + apiid,
                success: function (data) {
                    if (data == 'false') {
                        obj.checked = false;
						switch(apiid){
							case "sina":
                              KesionJS.Alert('未授权或是授权失效，请重新登录获取新浪微博授权！', "top.openWin('登录新浪微博获取授权信息', '../../user/api/sina/login.aspx?tokenfrom=admin', false)");
						    break;
							case "qq":
                              KesionJS.Alert('未授权或是授权失效，请重新登录获取QQ登录授权！', "top.openWin('登录QQ获取授权信息', '../../user/api/qq/login.aspx?tokenfrom=admin', false)");
						    break;
						}
                       
                    } else {
                       // obj.checked = true;
                        
                    }
                }
     });

}