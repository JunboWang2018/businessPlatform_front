package com.agriculture.platform.controller.view;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @author Junbo Wang
 * @description
 * @date 2019/5/7
 */
@Controller
@RequestMapping("/view/cart")
public class CartViewController {

    /**
     * 跳转到加入购物车成功页面
     * @return
     */
    @RequestMapping("/toAddCartSuccess")
    public String toAddCartSuccess() {
        return "/cart/cartSuccess.jsp";
    }

    /**
     * 跳转到加入购物车失败页面
     * @return
     */
    @RequestMapping("/toAddCartFailed")
    public String toAddCartFailed() {
        return "/cart/cartFailed.jsp";
    }
}
