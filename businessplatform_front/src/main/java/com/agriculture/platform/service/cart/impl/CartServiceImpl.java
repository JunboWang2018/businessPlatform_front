package com.agriculture.platform.service.cart.impl;

import com.agriculture.platform.common.constant.Result;
import com.agriculture.platform.dao.cart.CartDao;
import com.agriculture.platform.pojo.base.Do.CartDo;
import com.agriculture.platform.pojo.base.Do.ProductDo;
import com.agriculture.platform.pojo.base.Do.UserDo;
import com.agriculture.platform.pojo.base.Qo.CartInfoQo;
import com.agriculture.platform.service.cart.CartService;
import com.agriculture.platform.service.product.ProductService;
import com.agriculture.platform.service.user.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * @author Junbo Wang
 * @description
 * @date 2019/5/7
 */
@Service
public class CartServiceImpl implements CartService {

    @Resource
    private CartDao cartDao;

    @Autowired
    private UserService userService;

    @Autowired
    private ProductService productService;

    @Override
    public Result addCart(CartDo cartDo, UserDo sessionUser) throws IllegalArgumentException {
        if (sessionUser == null) {
            return Result.USER_NOT_LOGIN;
        }
        if (cartDo == null || cartDo.getProdNumber() == null || cartDo.getQuantity() == null) {
            throw new IllegalArgumentException("缺少要添加购物车的商品信息");
        }
        UserDo queyrUser = new UserDo();
        queyrUser.setUsername(sessionUser.getUsername());
        UserDo resultUser = userService.selectUser(queyrUser);
        cartDo.setUserId(resultUser.getUserId());
        cartDo.setIsActive(1);
        //先查询用户购物车是否有该商品
        CartDo queryIsExit = new CartDo();
        queryIsExit.setIsActive(1);
        queryIsExit.setUserId(resultUser.getUserId());
        queryIsExit.setProdNumber(cartDo.getProdNumber());
        CartDo resultIsExit = this.selectCart(queryIsExit);
        Integer result = null;
        if (resultIsExit == null) {
            //不存在，直接添加
            result = cartDao.addProdToCart(cartDo);
        } else {
            //已存在，取出数量，设置并修改
            resultIsExit.setQuantity(cartDo.getQuantity().intValue() + resultIsExit.getQuantity().intValue());
            resultIsExit.setModifyTime(new Timestamp(new Date().getTime()));
            result = cartDao.updateProdFromCart(resultIsExit);
        }
        if (result == 1) {
            return Result.SUCCESS;
        }
        return Result.FAILED;
    }



    @Override
    public Result deleteCart(CartDo cartDo, UserDo sessionUser) throws IllegalArgumentException {
        if (cartDo == null) {
            throw new IllegalArgumentException("缺少要删除购物车中商品的信息");
        }
        UserDo queyrUser = new UserDo();
        queyrUser.setUsername(sessionUser.getUsername());
        UserDo resultUser = userService.selectUser(queyrUser);
        Integer result = null;
        if (cartDo.getProdNumber() == null) {
            result = cartDao.deleteUserAllProd(resultUser.getUserId());
        } else {
            cartDo.setUserId(resultUser.getUserId());
            result = cartDao.deleteUserProd(cartDo);
        }
        if (result == 1) {
            return Result.SUCCESS;
        }
        return Result.FAILED;
    }

    @Override
    public List<CartInfoQo> selectCartInfoList(UserDo sessionUser) {
        List<CartInfoQo> cartInfoQoList = new ArrayList<CartInfoQo>();
        UserDo queyrUser = new UserDo();
        queyrUser.setUsername(sessionUser.getUsername());
        UserDo resultUser = userService.selectUser(queyrUser);
        CartDo cartDo = new CartDo();
        cartDo.setUserId(resultUser.getUserId());
        cartDo.setIsActive(1);
        List<CartDo> cartList = cartDao.selectCartInfoList(cartDo);
        for (int i = 0; i < cartList.size(); i++) {
            cartInfoQoList.add(this.setCartInfoQo(cartList.get(i)));
        }
        return cartInfoQoList;
    }

    @Override
    public List<CartDo> selectCartList(CartDo cartDo) {
        if (cartDo == null) {
            cartDo = new CartDo();
        }
        return cartDao.selectCartInfoList(cartDo);
    }

    @Override
    public CartDo selectCart(CartDo cartDo) {
        List<CartDo> cartList = this.selectCartList(cartDo);
        if (cartList == null || cartList.size() == 0) {
            return null;
        }
        return cartList.get(0);
    }


    @Override
    public int getUserCartTotalNumber(UserDo sessionUser) {
        //未登录返回0
        if (sessionUser == null) {
            return 0;
        }
        UserDo queryUser = new UserDo();
        queryUser.setUsername(sessionUser.getUsername());
        UserDo resultUser = userService.selectUser(queryUser);
        //设置用户id，从购物车中查找记录
        CartDo queryCart = new CartDo();
        queryCart.setUserId(resultUser.getUserId());
        queryCart.setIsActive(1);
        List<CartDo> cartList = this.selectCartList(queryCart);
        if (cartList == null) {
            return 0;
        }
        return cartList.size();
    }

    /**
     * 封装购物车商品信息
     * @param cartDo
     * @return
     */
    private CartInfoQo setCartInfoQo(CartDo cartDo) {
        CartInfoQo cartInfoQo = new CartInfoQo();
        cartInfoQo.setCartDo(cartDo);
        //查询商品信息并设置
        ProductDo queryProd = new ProductDo();
        queryProd.setNumber(cartDo.getProdNumber());
        queryProd.setIsActive(1);
        ProductDo resultProd = productService.selectProduct(queryProd);
        cartInfoQo.setProductDo(resultProd);
        return cartInfoQo;
    }
}
