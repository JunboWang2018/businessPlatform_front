<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta name="format-detection" content="telephone=no">

<link rel="stylesheet" type="text/css" href="/businessPlatform/css/head.css?v=20160713" />
<link rel="stylesheet" type="text/css" href="/businessPlatform/css/cart.css?v=20160630">
<link rel="stylesheet" type="text/css" href="/businessPlatform/css/common.css?v=201321222" />
<script type="text/javascript" src="/businessPlatform/js/lib/jquery-1.5.1.min.js?v=20160713"></script>
<title>商品已加入购物车失败</title>
</head>
<body>

    <jsp:include page="../commons/header.jsp" />
    <jsp:include page="../commons/mainmenu.jsp" />
	<!--main start-->
	<div class="cartMain">
		<div class="cartThead" style="margin: 50px 0px 50px 50px;">
			<h3 class="cartMy">您的商品加入购物车失败！</h3>
			<div class="cartJsuan">
				<input type="button" class="goshop" onclick="window.history.back();return false;" value="返回"/>
			</div>
		</div>

	</div>
	<jsp:include page="../commons/footer.jsp" />


</body>
</html>