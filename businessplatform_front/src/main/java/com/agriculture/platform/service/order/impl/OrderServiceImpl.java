package com.agriculture.platform.service.order.impl;

import com.agriculture.platform.common.constant.Result;
import com.agriculture.platform.dao.cart.CartDao;
import com.agriculture.platform.dao.order.OrderDao;
import com.agriculture.platform.dao.product.ProductDao;
import com.agriculture.platform.pojo.base.Do.*;
import com.agriculture.platform.pojo.base.Qo.OrderInfoQo;
import com.agriculture.platform.service.cart.CartService;
import com.agriculture.platform.service.order.AuctionRecordService;
import com.agriculture.platform.service.order.OrderService;
import com.agriculture.platform.service.product.ProductService;
import com.agriculture.platform.service.user.UserService;
import com.agriculture.platform.utils.AutoGenerateNumberUtil;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

/**
 * @author Junbo Wang
 * @description
 * @date 2019/5/7
 */
@Service
public class OrderServiceImpl implements OrderService {
    private static final Logger LOGGER = LoggerFactory.getLogger(OrderServiceImpl.class);

    @Resource
    private OrderDao orderDao;

    @Autowired
    private ProductService productService;

    @Resource
    private ProductDao productDao;

    @Autowired
    private AuctionRecordService auctionRecordService;

    @Autowired
    private CartService cartService;

    @Resource
    private CartDao cartDao;

    @Autowired
    private UserService userService;

    @Override
    public Result addOrder(String[] prodNumbers, UserDo sessionUser) {
        if(prodNumbers == null || prodNumbers.length == 0) {
            return Result.PROD_NUMBERS_IS_NULL;
        }
        UserDo queryUser = new UserDo();
        queryUser.setUsername(sessionUser.getUsername());
        UserDo resultUser = userService.selectUser(queryUser);
        if (resultUser == null) {
            return Result.GENER_ORDER_FAILED;
        }
        ProductDo queryProd = new ProductDo();
        Result result = Result.GENER_ORDER_FAILED;
        for (int i = 0; i < prodNumbers.length; i++) {
            queryProd.setNumber(prodNumbers[i]);
            queryProd.setIsActive(1);
            queryProd.setSellStatus(1);
            ProductDo resultProd = productService.selectProduct(queryProd);
            if (resultProd == null) {
                continue;
            }
            if (resultProd.getSaleWayCode().equals("AUCTI")) {
                //竞价商品
                result = this.addOrderForAuctiProd(resultProd);
            } else {
                //非竞价商品
                result = this.addOrderForOtherProd(resultProd, resultUser);
            }
        }
        return result;
    }

    @Override
    public List<OrderInfoQo> selectUserOrderInfoList(UserDo sessionUser) {
        List<OrderInfoQo> orderInfoQos = new ArrayList<OrderInfoQo>();
        //查找用户信息
        UserDo queryUser = new UserDo();
        queryUser.setUsername(sessionUser.getUsername());
        UserDo resultUser = userService.selectUser(queryUser);
        OrderDo queryOrder = new OrderDo();
        queryOrder.setUserId(resultUser.getUserId());
        orderInfoQos = this.selectOrderInfoQoList(queryOrder);
        return orderInfoQos;
    }

    @Override
    public List<OrderInfoQo> selectOrderInfoQoList(OrderDo orderDo) {
        List<OrderInfoQo> orderInfoQos = new ArrayList<OrderInfoQo>();
        orderDo.setIsActive(1);
        List<OrderDo> resultList = this.selectOrderList(orderDo);
        if (resultList == null) {
            return null;
        }
        for (int i = 0; i < resultList.size(); i++) {
            OrderInfoQo orderInfoQo = new OrderInfoQo();
            orderInfoQo.setOrderDo(resultList.get(i));
            //查找商品信息
            ProductDo queryProd = new ProductDo();
            queryProd.setNumber(resultList.get(i).getProdNumber());
            ProductDo resultProd = productService.selectProduct(queryProd);
            orderInfoQo.setProductDo(resultProd);
            orderInfoQos.add(orderInfoQo);
        }
        return orderInfoQos;
    }

    @Override
    public List<OrderDo> selectOrderList(OrderDo orderDo) {
        if (orderDo == null) {
            return null;
        }
        List<OrderDo> resultList = orderDao.selectOrderList(orderDo);
        return resultList;
    }

    @Override
    public OrderDo selectOrder(OrderDo orderDo) {
        List<OrderDo> resultList = this.selectOrderList(orderDo);
        if (resultList == null) {
            return null;
        }
        return resultList.get(0);
    }

    @Override
    public Result deleteOrder(OrderDo orderDo, UserDo sessionUser) throws IllegalArgumentException {
        if (orderDo == null) {
            throw new IllegalArgumentException("缺少要删除购物车中商品的信息");
        }
        UserDo queyrUser = new UserDo();
        queyrUser.setUsername(sessionUser.getUsername());
        UserDo resultUser = userService.selectUser(queyrUser);
        Integer result = null;
        if (orderDo.getOrderNumber() == null) {
            result = orderDao.deleteUserAllOrder(resultUser.getUserId());
        } else {
            result = orderDao.deleteOrder(orderDo);
        }
        if (result >= 1) {
            return Result.SUCCESS;
        }
        return Result.FAILED;
    }

    private Result addOrderForAuctiProd(ProductDo productDo) {
        Integer result = null;
        //查找竞拍记录表
        AuctionRecordDo queryAuctionRecord = new AuctionRecordDo();
        queryAuctionRecord.setProdNumber(productDo.getNumber());
        List<AuctionRecordDo> auctionRecordDos = auctionRecordService.selectAuctionRecordList(queryAuctionRecord);
        //若记录为空，则设置商品下架（流拍）
        if (auctionRecordDos == null || auctionRecordDos.size() == 0) {
            productDo.setSellStatus(-1);
            productDo.setModifyTime(new Timestamp(System.currentTimeMillis()));
            result = productDao.updateProduct(productDo);
        } else {
            //取出价最高的记录
            AuctionRecordDo maxPriceRecord = auctionRecordDos.get(0);
            for (int i = 0; i < auctionRecordDos.size(); i++) {
                if (maxPriceRecord.getPrice().doubleValue() < auctionRecordDos.get(i).getPrice().doubleValue()) {
                    maxPriceRecord = auctionRecordDos.get(i);
                }
            }
            //生成订单(库存数量即为交易数量，物流信息暂空，支付后设置已下单)
            OrderDo orderDo = new OrderDo();
            orderDo.setIsActive(1);
            String orderNumber = AutoGenerateNumberUtil.getAutoGenerateId("ORDER");
            orderDo.setOrderNumber(orderNumber);
            orderDo.setProdNumber(productDo.getNumber());
            orderDo.setQuantity(productDo.getQuantity());
            orderDo.setPrice(productDo.getQuantity().intValue() * productDo.getPrice().doubleValue());
            orderDo.setUserId(maxPriceRecord.getUserId());
            orderDo.setIsPaid(0);
            result = orderDao.addOrder(orderDo);
            //生成成功设置已售出
            if (result == 1) {
                productDo.setSellStatus(0);
                productDo.setModifyTime(new Timestamp(System.currentTimeMillis()));
                result = productDao.updateProduct(productDo);
            }
        }
        if (result == 1) {
            return Result.SUCCESS;
        } else {
            return Result.GENER_ORDER_FAILED;
        }
    }

    private Result addOrderForOtherProd(ProductDo productDo, UserDo userDo) {
        Integer result = null;
        //查购物车表
        CartDo queryCart = new CartDo();
        queryCart.setProdNumber(productDo.getNumber());
        queryCart.setUserId(userDo.getUserId());
        queryCart.setIsActive(1);
        CartDo resultCart = cartService.selectCart(queryCart);
        if (resultCart == null) {
            return Result.GENER_ORDER_FAILED;
        }
        //检查交易数量是否大于库存数量
        if (resultCart.getQuantity().intValue() > productDo.getQuantity().intValue()) {
            return Result.ORDER_NUM_BIG;
        }
        //减去库存数量，并保存，若库存为0，设置已售罄
        int quantity = productDo.getQuantity().intValue() - resultCart.getQuantity().intValue();
        productDo.setQuantity(productDo.getQuantity().intValue() - resultCart.getQuantity().intValue());
        if (quantity <= 0) {
            productDo.setSellStatus(0);
        }
        productDao.updateProduct(productDo);
        //生成订单
        OrderDo orderDo = new OrderDo();
        orderDo.setIsActive(1);
        String orderNumber = AutoGenerateNumberUtil.getAutoGenerateId("ORDER");
        orderDo.setOrderNumber(orderNumber);
        orderDo.setProdNumber(productDo.getNumber());
        orderDo.setQuantity(resultCart.getQuantity());
        orderDo.setPrice(resultCart.getQuantity().intValue() * productDo.getPrice().doubleValue());
        orderDo.setUserId(userDo.getUserId());
        orderDo.setIsPaid(0);
        result = orderDao.addOrder(orderDo);
        //已提交订单，删除购物车记录
        if (result == 1) {
            result = cartDao.deleteUserProd(resultCart);
        }
        if (result == 1) {
            return Result.SUCCESS;
        } else {
            return Result.GENER_ORDER_FAILED;
        }
    }
}
