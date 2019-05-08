<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
        "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="pragma" content="no-cache">
        <meta http-equiv="Cache-Control" content="no-cache,must-revalidate">
        <title>注册-个人用户</title>
        <link rel="stylesheet" type="text/css" href="/businessPlatform/css/headerfooter.css" />
        <link rel="stylesheet" type="text/css" href="/businessPlatform/css/jquery.alerts.css" />
        <link rel="stylesheet" type="text/css" href="/businessPlatform/css/headerfooterindex.css" />
        <script type="text/javascript" src="/businessPlatform/js/lib/jquery-1.5.1.min.js"></script>
        <script type="text/javascript" src="/businessPlatform/js/lib/jquery.cookie.js"></script>
        <script type="text/javascript" src="/businessPlatform/js/passport.common.js?v20140531"></script>
        <script type="text/javascript" src="/businessPlatform/js/lib/jquery.alerts.js"></script>
        <script type="text/javascript" src="/businessPlatform/js/png.js?v20140521"></script>
    </head>
    <body>
		<!-- header -->
		<div class="header">
			<a href="/businessPlatform/"><img src="/businessPlatform/images/logo.png" border="0" /><span>欢迎注册</span></a>
		</div>

		<!--mainStart-->
        <link rel="stylesheet" type="text/css" href="/businessPlatform/css/register.css?v20140432" />
        <script type="text/javascript" src="/businessPlatform/js/allMail.js?v20140430"></script>
        <script type="text/javascript" src="/businessPlatform/js/register.js?v20150122"></script>
        <!-- reg_main -->
        <div class="tabBox clear">
            <span class="reg_hide reg_show regMr5" id="regper">个人用户</span>
            <div class="login">已有账号，立即 <a href="/businessPlatform/view/user/toLogin">登录</a></div>
        </div>
        <!--个人用户-->
        <div class="reg_main reg_border regTab" id="perDiv">
            <ul class="individualUserBg">
                <form id="regForm_mod" name="regForm_mod" method="post"  >

                    <li class="regMb30">
                        <label><font>*</font> 账户名：</label>
                    <span class="regM defaultBorder">
                        <input id="username" name="username"  class="regInput" type="text" onfocus="showtip('regName','userMamErr',8);" onblur="ckmem();" autocomplete="off" maxlength="80"/>
                        <em></em>
                    </span>
                        <span class="regInput" id="userMamErr"></span>
                    </li>
                    <div node-type="layer" class="accountSearch" style="display:none;" id="person_mail"></div>
                    <li>
                        <label><font>*</font> 登录密码：</label>
                    <span class="regM defaultBorder">
                        <input id="password" name="password" class="regInput" autocomplete="off" type="password" onfocus="showPwdtip('password','passwordErr',2);"  onkeyup="ckpwd(0,1);" onblur="ckpwd(0,0);"/>
                        <em ></em>
                    </span>
                        <span class="regInput" id="passwordErr"></span>
                    </li>
                    <li class="safetyLayer regPl191" id="pwdStrong">
                        <font style="font-size:12px;">安全程度：</font><em class="default">弱</em><em class="default">中</em><em class="default">强</em>
                    </li>
                    <li class="regMb30">
                        <label><font>*</font> 确认密码：</label>
                    <span class="regM defaultBorder">
                        <input id="pwdRepeat" name="password2" autocomplete="off" class="regInput" type="password" onfocus="showtip('password2','password2Err',3);" onblur="ckpwd2();"/>
                        <em></em>
                    </span>
                        <span class="regInput" id="password2Err"></span>
                    </li>
                    <li class="register regPl88 regMt10" id="sub_per" style="margin-left:29px">
                        <input type="hidden" id="tjuid" name="tjuid" value="">
                        <a href="javascript:void(0);" class="registerNow" id="reg_per_data" onclick="REGISTER.reg()">立即注册</a>
                    </li>
                    <br /><br />
                </form>
            </ul>
            <div class="ui-reg-tip"><a href="https://www.baidu.com" target="_blank">了解更多>></a></div>
        </div>

        <!--mainOver-->

		<!--footerStart-->
		<div class="footer">
			<p>
                Copyright© XX电商平台 XX BUSINESS PLATFORM 版权所有<br />
			</p>
		</div>
		<!-- /footer -->

	</body>
</html>
