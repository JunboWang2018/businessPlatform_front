<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml"><head>
   <meta http-equiv="pragma" content="no-cache">
   <meta http-equiv="cache-control" content="no-cache">
   <meta http-equiv="expires" content="0">
   <meta name="format-detection" content="telephone=no">
   <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
   <meta name="format-detection" content="telephone=no">
   <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link rel="stylesheet" type="text/css" href="/businessPlatform/css/jquery.alerts.css" />
	<link rel="stylesheet" type="text/css" href="/businessPlatform/css/head.css" />
	<link rel="stylesheet" type="text/css" href="/businessPlatform/css/cart.css">
	<link rel="stylesheet" type="text/css" href="/businessPlatform/css/common.css" />
	<script type="text/javascript" src="/businessPlatform/js/lib/jquery-1.5.1.min.js"></script>
	<script type="text/javascript" src="/businessPlatform/js/lib/jquery.price_format.2.0.min.js"></script>
	<script type="text/javascript" src="/businessPlatform/js/lib/jquery.alerts.js"></script>
	<script type="text/javascript" src="/businessPlatform/js/cart.js"></script>
	 <script type="text/javascript" src="/businessPlatform/js/cookie.js"></script>
	<script type="text/javascript" src="/businessPlatform/js/shadow.js"></script>
	<script type="text/javascript" src="/businessPlatform/js/common.js"></script>
	<script type="text/javascript">
        $("#sAll").click(function(){
            if ($("#sAll").prop('checked')) {
                alert(1);
                $("[name='cart_list']").attr("checked",'true');
			} else {
                $("[name='cart_list']").attr("checked",'false');
			}

        });
	</script>
   <title>我的购物车</title>
<body> 
<jsp:include page="../commons/header.jsp" />
<div class="cartMain">
	<div class="cartHead">
		<h3 class="cartMy">我的购物车</h3>
		<div class="clear"></div>
	</div>
	<div class="cartMain">
      <div class="cartThead">
		  <div class="tCol tCheckbox"><input name="acart_list_check" id="sAll" type="checkbox"> 全选</div>
		  <div class="tCol tProdNumber">商品编号</div>
		  <div class="tCol tProdName">商品名称</div>
		  <div class="tCol tPrice">单价</div>
		  <div class="tCol tQuantity">数量</div>
		  <div class="tCol tSubtotal">小计</div>
		  <div class="tCol tOperator">操作</div>
      </div>
      <div class="cartTbody">
		<div class="cartColumnhd">
			<div class="cartCheckbox">
				优选商品
			</div>
		</div>
		<div class="cartList youxuan" id="all_putong">
		<div style="margin: 20px; text-align: center; display: none;" id="danjianload"></div>
		<div id="danjian">
			<div class="cartItem">
				<c:forEach items="${cartList}" var="cart">
				<c:set var="totalPrice"  value="${totalPrice}"/>
				<div class="cartPInfo" id="danjian-0-229363">
					<div class="clearit">
						<div class="pItem pCheckbox">
							<input name="cart_list" class="putong" value="${cart.productDo.number}" type="checkbox"/>
						</div>
						<div class="pItem pProdNumber">
							<div class="cart_pname">
								<div>
									<a target="_blank" href="/businessPlatform/data/product/selectProdInfo?number=${cart.productDo.number}">${cart.productDo.number}</a>
								</div>
								<div class="cdzg">产地直供</div>
							</div>
						</div>
						<div class="pItem tProdName">
							<div class="cart_pimg">
								<a target="_blank" title="${cart.productDo.name}" href="/businessPlatform/data/product/selectProdInfo?number=${cart.productDo.number}">
								<img src="http://localhost:8081/businessPlatformManage/prodImage/${cart.productDo.imageMain}" style="width: 60px;height: 60px;"/>
								</a>
							</div>
							<div class="cart_pname">
								<div>
								<a target="_blank" href="/businessPlatform/data/product/selectProdInfo?number=${cart.productDo.number}">${cart.productDo.name}</a>
								</div>
							</div>
						</div>
						<div class="pItem pPrice">
							<div style="position: relative;">
								<strong>¥${cart.productDo.price}</strong>
							</div>
						</div>
						<div class="pItem pQuantity">
							<div class="cartAmount">
								<span>${cart.cartDo.quantity}</span>
							</div>
						</div>
						<div class="pItem pSubtotal">
							<span id="total_price" class="totalprice">¥<fmt:formatNumber value="${cart.cartDo.quantity * cart.productDo.price}" maxFractionDigits="2" minFractionDigits="2" groupingUsed="true"/></span>
						</div>
						<div class="pItem pOperator">
							<a id="cartDel" href="/businessPlatform/data/cart/deleteCart?prodNumber=${cart.productDo.number}">删除</a>
						</div>
					</div>
		</div>
		</c:forEach>
		</div>
	</div>
	</div>
	
	</div>
      <div class="cartOrderCount" id="orderCount">
        <div class="cartButtons">
          <input type="button" value="清空购物车" onclick="window.location.href='/businessPlatform/data/cart/deleteCart'" class="cartclear">
        </div>
        <div class="cartTotalItem">
          <span id="all_shopePrice">（不含运费）</span>&nbsp;&nbsp;&nbsp;&nbsp;商品总计：
          <span class="cartPrice" id="allMoney2">¥<fmt:formatNumber value="${totalPrice}" maxFractionDigits="2" minFractionDigits="2" groupingUsed="true"/>
          </span>
        </div>
      </div>
      <div class="cartJsuan">
         <input onclick="javascript:document.location.href=getRootPath() + '/'" class="goshop" value="继续购物" type="button">
         <input onclick="generOrder()" class="jiesuan youxuan" value="提交订单" type="button">
      </div>
    </div>
</div>
<!-- footer start -->
<jsp:include page="../commons/footer.jsp" />
<!-- footer end -->

</html>