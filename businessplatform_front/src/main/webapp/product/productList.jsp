<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Cache-Control" content="max-age=300" />
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title>${keyword} - 商品搜索</title>
            <link rel="stylesheet" type="text/css" href="/businessPlatform/css/productList.css" />
        <link rel="stylesheet" type="text/css" href="/businessPlatform/css/base_w1200.css" />
        <link rel="stylesheet" type="text/css" href="/businessPlatform/css/common.css" />
        <link rel="stylesheet" type="text/css" href="/businessPlatform/css/jquery.alerts.css" />
        <script type="text/javascript" src="/businessPlatform/js/lib/jquery-1.5.1.min.js"></script>
        <script type="text/javascript" src="/businessPlatform/js/global_index.js"></script>
    </head>
    <body>
        <!-- header start -->
        <jsp:include page="../commons/header.jsp" />
        <jsp:include page="../commons/mainmenu.jsp" />
        <!-------面包线 linknav--------->
        <div class="linknav">
            <%--<div class="schArticle">
                <a href="/article/search?keyword=%E6%9C%88%E9%A5%BC" target="_blank">找到和“<span>${query}</span>”相关的文章<span
                    id="articlenum">${totalPages }</span>篇&gt;&gt;
                </a>
            </div>--%>
            <div class="breadcrumb">
                <span>全部结果&nbsp;&gt;&nbsp;${keyword}</span>
            </div>
        </div>
        <div class="content_list">
          <div class="main-box">

           <a id="prolist-id"></a>
            <div class="r-filter">
              <div class="f-sort">
                <div class="pagin">
                </div>
                <div class="total">搜索结果中共<span>${prodTotalNumber }</span>个商品</div>
              </div>
            </div>

            <a name="prolist" id="prolist"></a>
            <div class="p-list">
              <ul class="list-all">
                 <c:forEach items="${prodQoList }" var="prodQo">
                 <li>
                    <div class="l-wrap">
                        <div class="pic">
                            <a class="trackref" href="/businessPlatform/data/product/selectProdInfo?number=${prodQo.productDo.number}" title="${prodQo.productDo.name}" target="_blank">
                                <img src="http://localhost:8081/businessPlatform/prodImage/${prodQo.productDo.imageMain}" style="display:inline"/>
                            </a>
                        </div>
                        <div class="price">
                            <span class="p-now">
                                <c:if test="${prodQo.productDo.saleWayCode != 'AUCTI'}">
                                    售价：￥<strong>${prodQo.productDo.price}</strong>
                                </c:if>
                                <c:if test="${prodQo.productDo.saleWayCode == 'AUCTI'}">
                                    当前最高价：￥<strong>${prodQo.maxAuctionPrice}</strong>
                                </c:if>
                            </span>

                        </div>
                        <div class="title-a">
                            <a class="trackref presaleSign_225865" href="/businessPlatform/data/product/selectProdInfo?number=${prodQo.productDo.number}" target="_blank">${prodQo.productDo.name}</a>
                        </div>
  <%--                      <div class="title-b" style=""><a class="trackref" href="http://localhost:8086/item/${item.id}.html" target="_blank">${sell_point }</a></div>--%>
                        <div class="comment">
                            <div class="owner_shop_list">自营</div>
                            <c:if test="${prodQo.productDo.saleWayCode == 'AUCTI'}">
                                <div class="auction_shop_list">竞拍</div>
                            </c:if>
                        </div>
                    </div>
                 </li>
                 </c:forEach>
            </ul>
              <span class="clear"></span>
            </div>

            <div class="pages">
                  </div>

          </div>
            <div class="left-box">
            <div class="catlist" id="cateall">
                <div class="ct"><h2>在结果中筛选</h2></div>
                <div class="cm">
                    <div class="catitem" style="border-top-width: 0px;">
                        <c:forEach items="${prodTypeList}" var="prodType">
                            <h3>
                                <b></b>
                                <a href="/businessPlatform/data/product/selectProdList?typeCode=${prodType.code}&name=${keyword}" class="">${prodType.name}</a>
                            </h3>
                        </c:forEach>
                    </div>
                </div>
            </div>
          </div>

          <jsp:include page="../commons/footer.jsp" />
        <script type="text/javascript" src="/businessPlatform/js/common.js?v=20160713"></script>
        <script type="text/javascript" src="/businessPlatform/js/cart.js?v=20160713"></script>
        <script type="text/javascript" src="/businessPlatform/js/lib/jquery.alerts.js"></script>
        <script type="text/javascript" src="/businessPlatform/js/NewVersion.js?v=20160713"></script>
        <script type="text/javascript" src="/businessPlatform/js/cookie.js?v=20160416222"></script>
        <script type="text/javascript" src="/businessPlatform/js/shadow.js?v=20160416"></script>
        </div>
    </body>
</html>