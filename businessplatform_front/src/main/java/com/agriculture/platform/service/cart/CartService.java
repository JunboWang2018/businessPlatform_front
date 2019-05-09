package com.agriculture.platform.service.cart;

import com.agriculture.platform.common.constant.Result;
import com.agriculture.platform.pojo.base.Do.CartDo;
import com.agriculture.platform.pojo.base.Do.UserDo;
import com.agriculture.platform.pojo.base.Qo.CartInfoQo;

import java.util.List;

public interface CartService {
    /**
     * 添加商品到购物车
     * @param cartDo
     * @param sessionUser
     * @return
     */
    Result addCart(CartDo cartDo, UserDo sessionUser) throws IllegalArgumentException;

    /**
     * 根据指定条件删除购物车中商品
     * @param cartDo
     * @param sessionUser
     * @return
     */
    Result deleteCart(CartDo cartDo, UserDo sessionUser)  throws IllegalArgumentException;

    /**
     * 查询购物车列表，并封装商品信息
     * @param sessionUser
     * @return
     */
    List<CartInfoQo> selectCartInfoList(UserDo sessionUser);

    /**
     * 查找购物车列表
     * @param cartDo
     * @return
     */
    List<CartDo> selectCartList(CartDo cartDo);

    /**
     * 查找购物车中单个商品信息
     * @param cartDo
     * @return
     */
    CartDo selectCart(CartDo cartDo);


    /**
     * 查找用户购物车商品数量
     * @param sessionUser
     * @return
     */
    int getUserCartTotalNumber(UserDo sessionUser);
}
