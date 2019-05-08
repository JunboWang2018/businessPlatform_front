package com.agriculture.platform.dao.cart;

import com.agriculture.platform.pojo.base.Do.CartDo;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface CartDao {
    /**
     * 根据指定条件查询购物车信息
     * @param cartDo
     * @return
     */
    List<CartDo> selectCartInfoList(CartDo cartDo);

    /**
     * 添加商品到购物车
     * @param cartDo
     * @return
     */
    Integer addProdToCart(CartDo cartDo);

    /**
     * 根据条件修改购物车中商品信息
     * @param cartDo
     * @return
     */
    Integer updateProdFromCart(CartDo cartDo);

    /**
     * 将商品从购物车删除指定用户的指定商品
     * @param cartDo
     * @return
     */
    Integer deleteUserProd(CartDo cartDo);

    /**
     * 将商品从购物车删除指定用户所有商品
     * @param userId
     * @return
     */
    Integer deleteUserAllProd(Integer userId);
}
