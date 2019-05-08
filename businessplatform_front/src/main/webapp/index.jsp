<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ page session="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<meta http-equiv="Cache-Control" content="no-transform">
	<meta http-equiv="Cache-Control" content="no-siteapp">
    <title>XX电商平台-生鲜食品,特色农产品,粮油,酒水,休闲食品</title>
    <meta name="Keywords" content="XX电商平台-生鲜食品,特色农产品,粮油,酒水,休闲食品">
    <meta name="Description" content="XX电商平台-生鲜食品,特色农产品,粮油,酒水,休闲食品">
    <link rel="dns-prefetch" href="//pic.e3mall.cn">
    <meta property="wb:webmaster" content="3a008ad947166307">
    <link rel="stylesheet" type="text/css" href="/businessPlatform/css/base_w1200.css?v=2016071333">
    <link rel="stylesheet" type="text/css" href="/businessPlatform/css/index.css?v=2016071312">
	<script type="text/javascript" src="/businessPlatform/js/lib/jquery-1.5.1.min.js"></script>
	<script type="text/javascript" src="/businessPlatform/js/global_index.js"></script>
	<script type="text/javascript" src="/businessPlatform/js/cart.js"></script>
	<script src="/businessPlatform/js/common.js?v=20160713" type="text/javascript"></script>
	<style id="style-1-cropbar-clipper">/* Copyright 2014 Evernote Corporation. All rights reserved. */
		.en-markup-crop-options {
			top: 18px !important;
			left: 50% !important;
			margin-left: -100px !important;
			width: 200px !important;
			border: 2px rgba(255,255,255,.38) solid !important;
			border-radius: 4px !important;
		}

		.en-markup-crop-options div div:first-of-type {
			margin-left: 0px !important;
		}
	</style>
</head>
<body>
	<!-- header start -->
	<jsp:include page="commons/header.jsp" />
	<jsp:include page="commons/indexMainmenu.jsp" />
	<!-- header end -->
	<!----row1------->
	<div class="slide_show" id="slide_show">
		<div class="indexW">
			<div id="index_slide" class="slide_wrap">
				<ol>
					<c:forEach items="${indexRecommendProdList}" var="prod" varStatus="status">
						<li>
							<a name="sfbest_hp_hp_focus_${prod.number}" class="fore_pic trackref" href="/businessPlatform/data/product/selectProdInfo?number=${prod.number}" target="_blank">
								<img id="lunbo_1" alt="${prod.name}"	src="http://localhost:8081/businessPlatform/prodImage/${prod.imageMain}">
							</a>
						</li>
					</c:forEach>
				</ol>
			</div>
			<div class="rSide">
				<a name="sfbest_hp_hp_focus_right-ad1" class="a-img r-img1 trackref" href="/html/activity/1472440858.html" target="_blank">
					<img alt="8.30-9.5 月饼" src="/businessPlatform/images/html/ddf3f66b114f3a3bfbbe0b47693cdbf0.jpg">
					<div class="rmask"></div>
				</a>
				<a name="sfbest_hp_hp_focus_right-ad2" class="a-img r-img2 trackref" href="/html/activity/1472471068.html" target="_blank">
					<img s="" alt="8.30-9.5" src="/businessPlatform/images/html/51e357022c1f826f13211222831a4b13.jpg">
					<div class="rmask"></div>
				</a>


				<a name="sfbest_hp_hp_focus_right-ad3" class="a-img r-img3 trackref" href="/html/activity/1473011294.html" target="_blank">
					<img alt="9.5中秋菜谱" src="/businessPlatform/images/html/838abc2055e36f423701de255bbc9914.jpg">
					<div class="rmask"></div>
				</a>
			</div>
		</div>
		<ul class="none" id="lunboNum">
			<c:forEach items="${indexRecommendProdList }" varStatus="status">
				<li class="<c:if test="${status.index==0 }">cur</c:if>">${status.index+1 }</li>
			</c:forEach>
		</ul>
		<div class="indexbg" id="indexbg">
			<dl style="left: -1903px;">
				<%--<dd style="width: 1903px; background: rgb(20, 16, 13);"></dd>
				<dd style="width: 1903px; background: rgb(119, 96, 86);"></dd>
				<dd style="width: 1903px; background: rgb(17, 12, 55);"></dd>
				<dd style="width: 1903px; background: rgb(239, 244, 248);"></dd>
				<dd style="width: 1903px; background: rgb(231, 32, 37);"></dd>
				<dd style="width: 1903px; background: rgb(128, 29, 92);"></dd>
				<dd style="width: 1903px; background: rgb(117, 144, 1);"></dd>
				<dd style="width: 1903px; background: rgb(253, 213, 29);"></dd>--%>
			</dl>
		</div>
	</div>
	<!----row1 end------->
	<!--楼层 start-->
	<div class="indexW mt2 full_ad" style="width:1190px;padding-left:10px;">
		<a name="sfbest_hp_hp_banner_1" class="trackref" href="/html/activity/1472461333.html" target="_blank">
			<img alt="8.30-9.5" class="lazy" src="/businessPlatform/images/goods/8f42d6d2deead3da7d50c8a702a3c939.jpg" style="display: inline;">
		</a>
	</div>
	<div class="indexW mt2 ie6 fresh">
		<div class="category">
		<ul class="mTitle">
			<li>
				<div class="cir"></div>
				<h2>
					<em></em>
					<a name="sfbest_hp_hp_floor1_floor-category1" class="trackref" href="/fresh/52-0-0-0-0-2-0-0-0-0-0.html" target="_blank">水果</a>&nbsp;&nbsp;<a name="sfbest_hp_hp_floor1_floor-category2" class="trackref" href="/fresh/55-0-0-0-0-2-0-0-0-0-0.html" target="_blank">蔬菜</a>
				</h2>
			</li>
		</ul>
		<div class="lCont">
			<a name="sfbest_hp_hp_floor1_left-ad" class="trackref" href="/html/activity/1472459562.html" target="_blank">
				<img alt="8.30-9.5" class="lazy" src="/businessPlatform/images/goods/26336113289bf7273823080488a9d200.jpg" style="display: inline;">
			</a>
		</div>
	</div>
		<div class="sfRight">
		  <div class="subCont">
					<ul class="pList" id="floor-gap-1">
						<c:forEach items="${indexRecommendProdList }" var="prod">
							<li class="price_list1" eid="l_218031_7_297" goods="218031" id="cx_l_${prod.number}">
								<div class="pImg">
									<a
											href="/businessPlatform/data/product/selectProdInfo?number=${prod.number}"
											target="_blank" title="${prod.name}">
										<img class="lazy" src="http://localhost:8081/businessPlatform/prodImage/${prod.imageMain}" style="display: block;">
									</a>
									<div class="gBtn p-btn">
										<a pid="218031"
										   data_url="/businessPlatform/images/goods/160x160.jpg"
										   href="javascript:void(0);" onclick="cartIndex('${prod.number}', 1)" indexflag="1">加入购物车</a>
									</div>
								</div>
								<div class="title-a">
									<a
											href="/businessPlatform/data/product/selectProdInfo?number=${prod.number}"
											target="_blank" title="${prod.name}">${prod.name}</a>
								</div>
								<div class="price" id="priceL_l_${prod.number}">
									<b>￥${prod.price}</b>
								</div>
							</li>
						</c:forEach>
					</ul>
				</div>
	  </div>
	  <!----天天生鲜 -->
		<span class="clr"></span>
	</div>
	<!--楼层 end -->

	<!-- footer start -->
	<jsp:include page="commons/footer.jsp" />
	<!-- footer end -->
</body>
</html>