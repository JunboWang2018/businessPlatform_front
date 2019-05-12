package com.agriculture.platform.service.order;

import com.agriculture.platform.common.constant.Result;
import com.agriculture.platform.pojo.base.Do.OrderDo;
import com.agriculture.platform.pojo.base.Do.UserDo;
import com.agriculture.platform.pojo.base.Qo.OrderInfoQo;

import java.util.List;
import java.util.Map;

public interface OrderService {

    /**
     * 提交订单(除一键购买)
     * @param prodNumbers
     * @param sessionUser
     * @return
     */
    Result addOrder(String[] prodNumbers, UserDo sessionUser);

    /**
     * 查找用户的订单列表，并封装
     * @param sessionUser
     * @return
     */
    List<OrderInfoQo> selectUserOrderInfoList(UserDo sessionUser);

    /**
     * 查找订单列表，并封装
     * @param orderDo
     * @return
     */
    List<OrderInfoQo> selectOrderInfoQoList(OrderDo orderDo);

    /**
     * 根据指定条件查找订单列表
     * @param orderDo
     * @return
     */
    List<OrderDo> selectOrderList(OrderDo orderDo);

    /**
     * 根据指定条件查找订单
     * @param orderDo
     * @return
     */
    OrderDo selectOrder(OrderDo orderDo);

    /**
     * 根据指定条件删除订单
     * @param orderDo
     * @param sessionUser
     * @return
     */
    Result deleteOrder(OrderDo orderDo, UserDo sessionUser) throws IllegalArgumentException;

    /**
     * 一键下单
     * @param orderDo
     * @param sessionUser
     * @return
     */
    Result prodInfoBuy(OrderDo orderDo, UserDo sessionUser);

}
