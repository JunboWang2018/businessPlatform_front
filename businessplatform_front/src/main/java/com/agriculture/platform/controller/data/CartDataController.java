package com.agriculture.platform.controller.data;

import com.agriculture.platform.common.constant.RespJson;
import com.agriculture.platform.common.constant.Result;
import com.agriculture.platform.pojo.base.Do.CartDo;
import com.agriculture.platform.pojo.base.Do.UserDo;
import com.agriculture.platform.pojo.base.Qo.CartInfoQo;
import com.agriculture.platform.service.cart.CartService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.math.BigDecimal;
import java.math.RoundingMode;
import java.text.DecimalFormat;
import java.text.NumberFormat;
import java.util.List;

/**
 * @author Junbo Wang
 * @description
 * @date 2019/5/7
 */
@Controller
@RequestMapping("/data/cart")
public class CartDataController extends BaseDataController {
    private static final Logger LOGGER = LoggerFactory.getLogger(CartDataController.class);

    @Autowired
    private CartService cartService;

    /**
     * 添加商品到购物车
     * @param cartDo
     * @param session
     * @return
     */
    @ResponseBody
    @RequestMapping("/addCart")
    public RespJson addCart(CartDo cartDo, HttpSession session) {
        UserDo sessionUser = (UserDo) session.getAttribute("user");
        if (sessionUser == null) {
            return this.responseMsg(Result.USER_NOT_LOGIN.getCode(), Result.USER_NOT_LOGIN.getMessage());
        }
        Result result = null;
        try {
            result = cartService.addCart(cartDo, sessionUser);
        } catch (IllegalArgumentException e) {
            LOGGER.error(e.getMessage());
        }
        return this.responseMsg(result.getCode(), result.getMessage());
    }

    /**
     * 删除购物车中商品或清空购物车
     * @param cartDo
     * @param session
     * @return
     */
    @RequestMapping("/deleteCart")
    public String deleteCart(CartDo cartDo, HttpSession session) {
        UserDo sessionUser = (UserDo) session.getAttribute("user");
        try {
            cartService.deleteCart(cartDo, sessionUser);
        } catch (IllegalArgumentException e) {
            LOGGER.error(e.getMessage());
        }
        return "/cart/cart.jsp";
    }

    /**
     * 1. 检查是否已登录，若未登录，则返回到登录页面
     * 2. 若已登录，查询购物车信息，并返回购物车页面
     * @param session
     * @param model
     * @return
     */
    @RequestMapping("/selectCartList")
    public String selectCartList(HttpSession session, Model model) {
        UserDo sessionUser = (UserDo) session.getAttribute("user");
        if (sessionUser == null) {
            return "/user/login.jsp";
        }
        List<CartInfoQo> resultList = null;
        try {
            resultList = cartService.selectCartInfoList(sessionUser);
        } catch (IllegalArgumentException e) {
            LOGGER.error(e.getMessage());
        }
        model.addAttribute("cartList", resultList);
        if (resultList != null) {
            double totalPrice = 0;
            for (int i = 0; i < resultList.size(); i++) {
                totalPrice += resultList.get(i).getProductDo().getPrice().doubleValue() * resultList.get(i).getCartDo().getQuantity().intValue();
            }
            model.addAttribute("totalPrice",  totalPrice);
        }
        return "/cart/cart.jsp";
    }
}
