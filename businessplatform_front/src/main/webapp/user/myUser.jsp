<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=gb2312"/>
		<title>我的账号</title>
		   <link rel="stylesheet" type="text/css" href="/businessPlatform/css/jquery.alerts.css" />
		<link rel="stylesheet" type="text/css" href="/businessPlatform/css/headerfooterindex.css" />
		<link rel="stylesheet" type="text/css" href="/businessPlatform/css/myUser.css" />
		<script type="text/javascript" src="/businessPlatform/js/lib/jquery-1.5.1.min.js"></script>
		<script type="text/javascript" src="/businessPlatform/js/lib/jquery.cookie.js"></script>
		<script type="text/javascript" src="/businessPlatform/js/lib/jquery.alerts.js"></script>
		<script type="text/javascript" src="/businessPlatform/js/png.js"></script>
		<script type="text/javascript" src="/businessPlatform/js/login.js"></script>
		<script type="text/javascript" src="/businessPlatform/js/capsLock.js"></script>
		<script type="text/javascript" src="/businessPlatform/js/myUser.js"></script>
	</head>
	<body>
		<!-- header -->
		<div class="header">
			<a href="/businessPlatform/"><img src="/businessPlatform/images/logo.png" border="0"><span>我的账号</span></a>
		</div>
		<!-- myUser_main -->
		<div class="myUser_main clear">
			<!-- myUserInfo -->
			<div class="myUserInfo">
				<div class="myUserInfo_box clear">
					<ul class="myUserInfo_nav">
						<li class="curr" mark="sfbest"><em></em>我的账号信息</li>
					</ul>

					<div class="myUserInfo_con">
						<ul>
							<form id="form_myUserInfo" method="post">
								<li>
									<span class="title">用户名：<font style="padding-left:20px" class="error_line" color="#ff0000"></font></span>
									<span class="border" style="position:relative">
										<input class="new-input1 new-color" tabindex="1" data-clear-btn="true" id="username" value="${userInfo.username}" size="25" readonly="readonly" autocomplete="off" htmlescape="true">
										 <em class="icon1" id="usernamelogo"></em>
									</span>
								</li>
								<li>
									<span class="title">积分：<font style="padding-left:20px" class="error_line" color="#ff0000"></font></span>
									<span class="border" style="position:relative">
										<input class="new-input1 new-color" tabindex="1" data-clear-btn="true" id="score" value="${userInfo.score}" size="25" readonly="readonly" autocomplete="off" htmlescape="true">
									</span>
								</li>
								<li>
									<span class="title">账户余额：<font style="padding-left:20px" class="error_line" color="#ff0000"></font></span>
									<span class="border" style="position:relative">
										<input class="new-input1 new-color" tabindex="1" data-clear-btn="true" id="balance" value="${userInfo.balance}" size="25" readonly="readonly" autocomplete="off" htmlescape="true">
									</span>
								</li>
								<li>
									<span class="title">收货地址：(格式：地址-联系方式-收件人姓名，多个地址用英文逗号分隔)<font style="padding-left:20px" class="error_line" color="#ff0000"></font></span>
									<span class="border" style="position:relative">
										<input class="new-input1 new-color" tabindex="1" data-clear-btn="true" id="address" value="${userInfo.address}" size="25" autocomplete="off" htmlescape="true">
									</span>
								</li>
								<li class="m-t5" id="btn_save_modify">
									<a href="javascript:void(0)" id="save_modify" class="myUserInfo_btn" onclick="modifyUserInfo()">保存修改</a>
									<a href="javascript:void(0)" id="recharge" class="myUserInfo_btn" style="margin-left: 20px">充值</a>
								</li>
							</form>
						</ul>
					</div>
				</div>
			</div>
			<!-- /myUserInfo -->
			<!-- resetPassword -->
			<div class="myUserInfo" style="margin-top: 30px;">
				<div class="myUserInfo_box clear">
					<ul class="myUserInfo_nav">
						<li class="curr" mark="sfbest"><em></em>修改密码</li>
					</ul>

					<div class="myUserInfo_con">
						<ul>
							<form id="form_resetPassword" method="post">
								<li class="m-t12">
									<span class="title">新密码：</span>
									<span class="border" style="position:relative">
										<input id="newPWD" name="password" class="required" tabindex="2" type="password" value="" autocomplete="off">
										<em class="icon2" id="passwordlogo"></em>
										<span style="position: absolute; font-size: 14px; left: 5px; top: 9px;display:none;" class="sfbest_password_place">密码</span>
									</span>
								</li>
								<li class="m-t12">
									<span class="title">确认密码：</span>
									<span class="border" style="position:relative">
										<input id="surePWD" name="password" class="required" tabindex="2" type="password" value="" autocomplete="off">
										<em class="icon2"></em>
									</span>
								</li>
								<li class="m-t5" id="btn_sub">
									<a href="javascript:void(0)" id="modifyPWD" class="myUserInfo_btn" onclick="modifyPassword()">修改密码</a>
								</li>
							</form>
						</ul>
					</div>
				</div>
			</div>
			<!-- /resetPassword -->
		</div>
		<!-- /myUser_main -->
		<div class="footer">
			<p>
				Copyright© XX电商平台 XX BUSINESS PLATFORM 版权所有<br>
			</p>
		</div>
		<!-- /footer -->
	</body>
</html>