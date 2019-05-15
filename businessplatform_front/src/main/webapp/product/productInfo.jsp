<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <title>${prodQo.productDo.name}</title>
        <script>

            var _SF_CFG = {
            www_url:'http://www.e3mall.cn',
                m_url:'http://m.e3mall.cn',
                productId: "${prodQo.productDo.number}",
                number: 1600229585,
                minBuy: 1,
                maxBuy: 99,
                presell:false,
                presellId:0,
                parentId: 0,
                commentPage: 1,
                sdPage: 1,
                oneCategoryId: 6,
                twoCategoryId: 7321,
                threeCategoryId: 7331,
                sfprice: 0,
                price:0,
                warehouse: 0,
                homeurl: 'http://home.e3mall.cn',
                staticurl: 'http://i.e3mall.cn/html',
                passporturl: 'https://passport.e3mall.cn',
                businessModel: 3,
            commentType : 0
        };
        </script>

        <script src="/businessPlatform/js/lib/jquery-1.5.1.min.js" type="text/javascript"></script>
        <script src="/businessPlatform/js/lib/jquery.alerts.js" type="text/javascript"></script>
        <script src="/businessPlatform/js/common.js" type="text/javascript"></script>
        <script src="/businessPlatform/js/cart.js" type="text/javascript"></script>
        <script src="/businessPlatform/js/order.js" type="text/javascript"></script>
        <script src="/businessPlatform/js/cloud-zoom.1.0.2.min.js" type="text/javascript"></script>
        <script src="/businessPlatform/js/lib/jquery.thickbox.js" type="text/javascript"></script>
        <script src="/businessPlatform/js/goods.js" type="text/javascript"></script>
        <script src="/businessPlatform/js/NewVersion.js" type="text/javascript"></script>
        <script src="/businessPlatform/js/png.js" type="text/javascript"></script>
        <script src="/businessPlatform/js/qiangGouPro.js" type="text/javascript"></script>
        <script src="/businessPlatform/js/lib/jquery.cookie.js" type="text/javascript"></script>
        <script src='/businessPlatform/js/lib/jquery.lazyload.js' type='text/javascript'></script>
        <script type="text/javascript" src="/businessPlatform/js/lib/jquery.qrcode.js"></script>
        <script type="text/javascript" src="/businessPlatform/js/qrcode.js"></script>
        <script type="text/javascript" src="/businessPlatform/js/cookie.js"></script>
        <script type="text/javascript" src="/businessPlatform/js/shadow.js"></script>
        <script src="/businessPlatform/js/product.js" type="text/javascript"></script>
        <link rel="stylesheet" type="text/css" href="/businessPlatform/css/base_w1200.css">
        <link rel="stylesheet" type="text/css" href="/businessPlatform/css/product.css">
        <link rel="stylesheet" type="text/css" href="/businessPlatform/css/jquery.alerts.css" />
        <link rel="stylesheet" type="text/css" href="/businessPlatform/css/common.css" />
        <script type="text/javascript">
            $(function () {
                //计算倒计时秒数
                var prodCreateDate = new Date("${prodQo.auctionInfoDo.createTime}").getTime();
                var currentMillis = new Date().getTime();
                var times = Math.floor((prodCreateDate + ${prodQo.auctionInfoDo.deadline} * 1000 - currentMillis) / 1000);
                timeDown(times);
            });
        </script>
    </head>
    <body >
    <!-- header start -->
    <jsp:include page="../commons/header.jsp" />
    <!-- header end -->
    <jsp:include page="../commons/mainmenu.jsp" />
    <div class="linknav"><div class="breadcrumb"><strong><a href="/businessPlatform/data/product/selectProdList?typeCode=${prodType.code}">${prodQo.prodTypeName}</a></strong></div></div>
    <div class="pWrap">
        <div class="productIntro">
            <div class="pItems">
                <div class="pItemsMain">
                    <div class="pItemsName">
                        <div class="cm">
                            <h1 id="base_name-sf">${prodQo.productDo.name}</h1><br></br>
                          <%--  <strong id="adword-sf" title="" class="">${item.sellPoint }</strong>--%>
                        </div>
                    </div>
                    <div class="pItemsPrice" id="price-sf">
                        <div class="priceBox">
                            <c:if test="${prodQo.productDo.saleWayCode == 'AUCTI'}">
                                <span class="dt">当前最高价：</span><span class="rmb">￥</span>
                                <strong class="price"><fmt:formatNumber groupingUsed="false" maxFractionDigits="2" minFractionDigits="2" value="${prodQo.maxAuctionPrice}"/></strong>
                                <div style='margin: 10px 0 10px 0;'>倒计时:&nbsp; <span id='countDown' style='color: white'></span></div>
                            </c:if>
                            <c:if test="${prodQo.productDo.saleWayCode != 'AUCTI'}">
                                <span class="dt">优选价：</span><span class="rmb">￥</span>
                                <strong class="price"><fmt:formatNumber groupingUsed="false" maxFractionDigits="2" minFractionDigits="2" value="${prodQo.productDo.price}"/></strong>
                            </c:if>
                        </div>
                        <div class="boxWb"></div><div id="productStamp" class="productStamp_1"></div></div>
                    <div class="clear"></div>
                    <div id="presell-info-sf" class="pItemBook" style="display:none"></div>
                    <div class="pItemsPromo" id="promotion-sf" style="display:none"></div>
                    <span class="dt">库存数量：${prodQo.productDo.quantity}</span>
                    <br/>
                    <div class="pItemsStock">
                        <div class="dt">送至：</div>
                        <div class="dd">
                            <div id="regionSf">
                                <div class="" id="store-selector">
                                    <div class="text">
                                        <div title="北京昌平区回龙观镇">北京昌平区回龙观镇</div>
                                        <b></b>
                                    </div>
                                    <div onclick="$('#store-selector').removeClass('hover')" class="close"></div>
                                </div>
                            </div>
                            <div class="pItemsPrompt" id="time-sf">原产地直供，发货后预计<strong>2-5天</strong>内为您送达</div>
                        </div>
                        <span class="clear"></span>
                    </div>
                    <div class="pItemsChoose">
                        <div class="chooseType">
                            <ul id="fatherson-sf"></ul>
                            <span class="clear"></span>
                        </div>
                        <div class="chooseBtns" id="buy-btn-sf">

                            <c:if test="${prodQo.productDo.saleWayCode == 'AUCTI' && prodQo.productDo.sellStatus != 0 && prodQo.productDo.isActive == 1}">
                                <div class="pAmount">
                                    <span><input type="text" id="auction_price" class="text" value="${prodQo.maxAuctionPrice + prodQo.auctionInfoDo.addPrice}"></span>
                                </div>
                                <div class="pBtn" id="cart-add-btn-sf"><a onclick="addAuctionRecord('${prodQo.productDo.number}')"><b></b>出价</a></div>
                                <span>最低出价：<span id="min_auction_price">${prodQo.maxAuctionPrice + prodQo.auctionInfoDo.addPrice}</span></span>
                            </c:if>
                            <c:if test="${prodQo.productDo.saleWayCode != 'AUCTI' && prodQo.productDo.sellStatus != 0 && prodQo.productDo.isActive == 1}">
                                <div class="pAmount">
                                    <span><input type="text" id="number_${prodQo.productDo.number}" class="text" value="1"></span>
                                    <span>
                                        <a href="javascript:;" id="add-sell-num" class="p-add">+</a>
                                        <a href="javascript:;" id="reduce-sell-num" class="p-reduce disable">-</a>
                                    </span>
                                </div>
                                <div class="pBtn" id="cart-add-btn-sf"><a onclick="cartAdd('${prodQo.productDo.number}')"><b></b>加入购物车</a></div>
                                <div class="pBtn quickBuy" id="quickBuy" title="快速下单，直达填写订单页面"><a onclick="prodInfoBuy('${prodQo.productDo.number}');">一键购买</a></div>
                            </c:if>
                            <c:if test="${prodQo.productDo.sellStatus == 0 && prodQo.productDo.isActive == 1}">
                                <div class="pBtn" id="cart-add-btn-sf"><a  style="color: #5e5e5e" onclick="cartAdd(${prodQo.productDo.number}, 0, 1, 0, 1, this);"><b></b>已售罄</a></div>
                            </c:if>
                            <div class="yj_time" id="sendTime">预计发货时间：<br>2014-02-28 08:59</div>
                            <span class="clear"></span>
                        </div>
                        <div class="finalBuy" id="finalbuy-sf" style="display:none"></div>
                    </div>
                </div>
            <div class="pView">
                                    <div id="pView">
                    <div id="zoom-jpg" class="jqzoom">
                    <img alt="" width="330" height="330" src="http://localhost:8081/businessPlatformManage/prodImage/${prodQo.productDo.imageMain}"/>
                    </div>
                    <div id="pic-list">
                        <a href="javascript:void(0);" class="btn-control disabled" id="btn-forward"><b></b></a>
                        <a href="javascript:void(0);" class="btn-control disabled" id="btn-backward"><b></b></a>
                    </div>
                </div>
            </div>

            </div>
            <div class="pItemsSide">
                    <div class="sideWrap">
                        <div class="points">
                            <ul id="points-sf">
                                <li><img src="/businessPlatform/images/productInfo/productattr4.png"></li>
                                <li class="has_poptip attr3"><img src="/businessPlatform/images/productInfo/productattr3.png"></li>
                                <li><img src="/businessPlatform/images/productInfo/productattr2.png"></li>
                            </ul>
                        </div>
                                                    </div>
                    <div class="pdetail">
                        <ul>
                            <li>品牌：<span><a href="http://www.e3mall.cn/pinpai/7331-10863.html" title="XX电商平台出品" target="_blank">XX电商平台出品</a></span></li>
                            <li>产地：<span><a href="/food/7331-0-45-0-0-2-0-0-0-0-0.html" title="中国" target="_blank">中国</a></span></li>
                            <li>库存数量：${prodQo.productDo.quantity }</li>
                            <li>商品编号：${prodQo.productDo.number }</li>
                            <li class="card-pay">
                                <span class="card-pay-left">优选卡</span>
                                <span class="card-pay-right">支持优选卡支付</span>
                            </li>
                        </ul>
                        <div class="pDeclare">
                            <div class="nosupport"><b></b>本品不支持无理由退换货</div>
                        </div>
                    </div>
                </div>
            <span class="clear"></span>
        </div>
    </div><div class="pWrap">
        <div class="main-box">
            <div id="package"></div>
            <div class="pDetail">
                <ul class="pTab">
                    <li class="curr" pcont-target="div-detail"><a title="商品详情" href="javascript:void(0);">商品介绍</a></li>
                                    <li pcont-target="div-comment"><a title="用户评价" href="javascript:void(0);">评价<b>(<font class="comment-total-sf">0</font>)</b></a></li>
                                </ul>
                <div id="add-cart-r-btn-sf" class="p-btn"><a href="javascript:void(0);" data_url="http://p02.e3mall.cn/2016/1600229585/thumb_1600229585_1_1.jpg" pid="${prodQo.productDo.number}">加入购物车</a></div>
            </div>
            <div class="clear" id="flow-layer-sf"></div>
            <div class="pCont cpjs_box" id="div-detail">
                <ul class="cpjs_list">
                    <li><strong>保质期：</strong>60（天）</li>
                    <li><strong>库存数量：</strong>${prodQo.productDo.quantity}</li>
                    <li><strong>销售价格：</strong>${prodQo.productDo.price}</li>
                    <li><strong>产地：</strong>中国</li>
                </ul>
                <div
                    style="background-color: #f5f5f5; padding: 4px 20px 4px 0; line-height: 20px; overflow: hidden; zoom: 1;">
                    <span style="float: left; width: 100px; text-align: right; padding-right: 6px; margin-right: 6px;">温馨提示：</span>
                    <span style="display: block; overflow: hidden; zoom: 1;">
                        XX电商平台所售商品均经过严格的供应商资质审查、商品审查、入库全检、出货全检流程。
                        由于部分商品存在更换包装、不同批次、不同生产日期、不同生产工厂等情况，
                        导致商品实物与图片存在微小差异，因此请您以收到的商品实物为准，
                        同时我们会尽量做到及时更新，由此给您带来不便敬请谅解，谢谢！
                    </span>
                </div>
                <div class="pJiucuo">
                    如果您发现商品信息存在问题，<a target="_blank"
                        href="http://www.e3mall.cn/ProductCorrection/ProductCorrection/pId/${prodQo.productDo.number}"
                        rel="nofollow">欢迎纠错</a>
                </div>
                <div class="product_info">${prodQo.productDo.description}</div>
            </div>
               <%-- <div class="pCont" id="div-comment">
                <div class="commentList" id="commandp">
                    <div class="pt">
                        <h3 class="pTop">用户评价</h3>
                        <div class="commDetail">
                            <div class="pScore">好评度<strong><font id="user-comment-sf">100</font><span>%</span></strong></div>
                            <div class="pPercent" id="sorce-star-sf"><dl><dt>好评</dt><dd class="pBar"><div style="width:100px;"></div></dd><dd>100%</dd></dl><dl><dt>中评</dt><dd class="pBar"><div style="width:0px;"></div></dd><dd>0%</dd></dl><dl><dt>差评</dt><dd class="pBar"><div style="width:0px;"></div></dd><dd>0%</dd></dl></div>
                            <div class="pBtns">
                                <div>购买过商品，参与评价晒单，可获得积分哦~~</div>
                                <div>
                                    <a class="pbtn2" href="javascript:Goods.gotoPl()" rel="nofollow">马上评价</a><span class="showMore"><a target="_blank" href="http://www.e3mall.cn/html/article/140/133.html" rel="nofollow">[如何获取积分]</a></span>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="commentAll" id="comment-filter-sf">
                      <h3 class="curr"><a href="javascript:;" data-type="0">全部评价<font>(0)</font></a></h3>
                      <h3><a href="javascript:;" data-type="1">好评<font>(0)</font></a></h3>
                      <h3><a href="javascript:;" data-type="2">中评<font>(0)</font></a></h3>
                      <h3><a href="javascript:;" data-type="3">差评<font>(0)</font></a></h3>
                      <h3><a href="javascript:;" data-type="4">有晒单<font>(0)</font></a></h3>
                    </div>
                    <div id="have-none-comments" style="padding-left:10px;">还木有评价额，快抢沙发吧！</div><ul class="pComment" id="comment-lists-sf"></ul>
                    <div class="plpage">
                        <div class="showAll" style="display: none;"><a target="_blank" href="/reviewlist/0/${item.id}">[查看全部评价]</a></div>
                        <div class="pages" id="comment-ajax-page-sf"><span class="prev disabled"><b class="prevarr"></b>上一页</span><span class="current">1</span><span class="next disabled">下一页<b class="nextarr"></b></span></div>
                    </div>
                </div>
                <div class="clear2"></div>
            </div>--%>
            <div class="clear2"></div>
            <div class="l-recommend proRomm" id="recommend-by-view-sf" style="display:none"></div>
        </div>
        <div class="left-box">
                <div id="brandCon" class="catlist" style="">
                    <h2 class="t">相关品牌</h2>
                    <ul class="pClass">
                        <li><a target="_blank"
                            href="http://www.e3mall.cn/pinpai/7331-10949.html#sfbest_item_1600229585_brand_1"
                            title="半岛月饼">半岛月饼</a><a target="_blank"
                            href="http://www.e3mall.cn/pinpai/7331-3342.html#sfbest_item_1600229585_brand_2"
                            title="元朗荣华">元朗荣华</a><a target="_blank"
                            href="http://www.e3mall.cn/pinpai/7331-2241.html#sfbest_item_1600229585_brand_3"
                            title="奇华">奇华</a><a target="_blank"
                            href="http://www.e3mall.cn/pinpai/7331-6626.html#sfbest_item_1600229585_brand_4"
                            title="迪士尼">迪士尼</a><a target="_blank"
                            href="http://www.e3mall.cn/pinpai/7331-10805.html#sfbest_item_1600229585_brand_5"
                            title="宜芝多">宜芝多</a><a target="_blank"
                            href="http://www.e3mall.cn/pinpai/7331-9347.html#sfbest_item_1600229585_brand_6"
                            title="日田食品">日田食品</a><a target="_blank"
                            href="http://www.e3mall.cn/pinpai/7331-10765.html#sfbest_item_1600229585_brand_7"
                            title="欧美香" style="display: none;">欧美香</a><a target="_blank"
                            href="http://www.e3mall.cn/pinpai/7331-10853.html#sfbest_item_1600229585_brand_8"
                            title="零食多" style="display: none;">零食多</a><a target="_blank"
                            href="http://www.e3mall.cn/pinpai/7331-10863.html#sfbest_item_1600229585_brand_9"
                            title="我是花吃" style="display: none;">我是花吃</a><a target="_blank"
                            href="http://www.e3mall.cn/pinpai/7331-2696.html#sfbest_item_1600229585_brand_10"
                            title="史努比 Snoopy" style="display: none;">史努比 Snoopy</a><a
                            target="_blank"
                            href="http://www.e3mall.cn/pinpai/7331-3662.html#sfbest_item_1600229585_brand_11"
                            title="郭元益" style="display: none;">郭元益</a><a target="_blank"
                            href="http://www.e3mall.cn/pinpai/7331-4986.html#sfbest_item_1600229585_brand_12"
                            title="佳宁娜" style="display: none;">佳宁娜</a></li>
                    </ul>
                    <span class="clickShow"><b class="hide"></b></span>
                </div>
                <div class="l-recommend" id="saletop-sf" style="display:none"></div>
            <div class="l-recommend" id="viewBuyDiv" style="display: none;">
                <div class="ct"><h2>浏览此商品的顾客还买了</h2></div>
                <div class="cm">
                    <ul class="l-buy" id="viewbuy-sf"></ul>
                </div>
            </div>
            <div class="l-recommend">
                <div class="ct"><h2>购买此商品的顾客还买了</h2></div>
                <div class="cm">
                    <ul class="l-buy" id="buyrebuy-sf"><li><div class="p-img"><a target="_blank" href="#"><img src="http://localhost:8081/businessPlatformManage/prodImage/PROD1079616325_1.jpg"></a></div><div class="title-a"><a target="_blank" href="/businessPlatform/data/product/selectProdInfo?number=PROD1079616325">农家散养纯土鸡蛋新鲜农村自养 天然柴鸡蛋笨鸡蛋草鸡蛋40枚包邮</a></div><div class="title-b">【下单后3天发货】请以实物为准</div><div class="p-price">￥46.9</div></li></ul>
                </div>
            </div>
            <div class="l-recommend">
                <div class="ct"><h2>浏览此商品的顾客还浏览了</h2></div>
                <div class="cm">
                    <ul class="l-buy" id="browserbrowse-sf"><li><div class="p-img"><a target="_blank" href="#"><img src="http://localhost:8081/businessPlatformManage/prodImage/PROD1635865388_1.jpg"></a></div><div class="title-a"><a target="_blank" href="/businessPlatform/data/product/selectProdInfo?number=PROD1635865388">吖眯鸡胸肉健身即食代餐食品轻食高蛋白常温低脂代餐鸡胸</a></div><div class="title-b">【下单后3天发货】请以实物为准</div><div class="p-price">￥57.5</div></li></ul>
                </div>
            </div>
        </div>
        <div class="clear"></div>
    </div>
    <div class="clear1"></div>
    <jsp:include page="../commons/footer.jsp" />
    </body>
</html>