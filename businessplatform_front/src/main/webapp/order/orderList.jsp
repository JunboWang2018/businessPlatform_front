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
	<link rel="stylesheet" type="text/css" href="/businessPlatform/css/order.css">
	<link rel="stylesheet" type="text/css" href="/businessPlatform/css/common.css" />
	<script type="text/javascript" src="/businessPlatform/js/lib/jquery-1.5.1.min.js"></script>
	<script type="text/javascript" src="/businessPlatform/js/lib/jquery.price_format.2.0.min.js"></script>
	<script type="text/javascript" src="/businessPlatform/js/lib/jquery.alerts.js"></script>
	<script type="text/javascript" src="/businessPlatform/js/order.js"></script>
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
   <title>我的订单</title>
<body> 
<jsp:include page="../commons/header.jsp" />
<div class="orderMain">
	<div class="orderHead">
		<h3 class="orderMy">我的订单</h3>
		<div class="clear"></div>
	</div>
	<div class="orderMain">
      <div class="orderThead">
		  <div class="tOrderCol tCheckbox"><input name="acart_list_check" id="sAll" type="checkbox"> 全选</div>
		  <div class="tOrderCol tOrderNumber">订单编号</div>
		  <div class="tOrderCol tProdName">商品名称</div>
		  <div class="tOrderCol tPrice">单价</div>
		  <div class="tOrderCol tQuantity">数量</div>
		  <div class="tOrderCol tSubtotal">小计</div>
		  <div class="tOrderCol tDealTime">下单时间</div>
		  <div class="tOrderCol tOperator">操作</div>
      </div>
      <div class="cartTbody">
		<div class="orderColumnhd">
			<div class="orderCheckbox">
				优选商品
			</div>
		</div>
		<div <%--class="cartList youxuan"--%> id="all_putong">
		<div style="margin: 20px; text-align: center; display: none;" id="danjianload"></div>
		<div id="danjian">
			<div <%--class="cartItem"--%>>
				<c:forEach items="${orderList}" var="order">
				<c:set var="totalPrice"  value="${totalPrice}"/>
				<div class="orderPInfo" id="danjian-0-229363">
					<div class="clearit">
						<div class="pOrderItem pCheckbox">
							<input name="cart_list" class="putong" value="${order.orderDo.orderNumber}" type="checkbox"/>
						</div>
						<div class="pOrderItem pOrderNumber">
							<div class="cart_pname">
								<div>
									<a target="_blank" href="javascript:void(0)">${order.orderDo.orderNumber}</a>
								</div>
							</div>
						</div>
						<div class="pOrderItem tProdName">
							<%--<div class="cart_pimg">
								<a target="_blank" title="${order.productDo.name}" href="/businessPlatform/data/product/selectProdInfo?number=${order.productDo.number}">
								<img src="/businessPlatform/prodImage/${order.productDo.imageMain}" style="width: 60px;height: 60px;"/>
								</a>
							</div>--%>
							<div class="cart_pname">
								<div>
								<a target="_blank" href="/businessPlatform/data/product/selectProdInfo?number=${order.productDo.number}">${order.productDo.name}</a>
								</div>
							</div>
						</div>
						<div class="pOrderItem pPrice">
							<div style="position: relative;">
								<strong>¥${order.productDo.price}</strong>
							</div>
						</div>
						<div class="pOrderItem pQuantity">
							<div class="cartAmount">
								<span>${order.orderDo.quantity}</span>
							</div>
						</div>
						<div class="pOrderItem pSubtotal">
							<span id="total_price" class="totalprice">¥<fmt:formatNumber value="${order.orderDo.quantity * order.productDo.price}" maxFractionDigits="2" minFractionDigits="2" groupingUsed="true"/></span>
						</div>
						<div class="pOrderItem pDealTime">
							<span id="dealTime" class="totalprice">${order.orderDo.dealTime}</span>
						</div>
						<div class="pOrderItem pOperator">
							<a id="cartDel" href="javascript:void(0)" onclick="deleteOrder('${order.orderDo.orderNumber}')">取消订单</a>
						</div>
					</div>
		</div>
		</c:forEach>
		</div>
	</div>
	</div>
	
	</div>
      <div class="orderCount" id="orderCount">
        <div class="orderButtons">
          <input type="button" value="取消所有订单" onclick="deleteAllOrder()" class="orderclear">
        </div>
        <div class="orderTotalItem">
          <span id="all_shopePrice">（不含运费）</span>&nbsp;&nbsp;&nbsp;&nbsp;商品总计：
          <span class="orderPrice" id="allMoney2">¥<fmt:formatNumber value="${totalPrice}" maxFractionDigits="2" minFractionDigits="2" groupingUsed="true"/>
          </span>
        </div>
      </div>
      <div class="orderJsuan">
         <input onclick="javascript:document.location.href=getRootPath() + '/'" class="goshop" value="继续购物" type="button">
         <input onclick="" class="jiesuan youxuan" value="去支付" type="button">
      </div>
    </div>
</div>
<!-- footer start -->
<jsp:include page="../commons/footer.jsp" />
<!-- footer end -->
</body>
</html>