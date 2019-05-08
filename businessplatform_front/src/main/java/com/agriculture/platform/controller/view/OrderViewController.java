package com.agriculture.platform.controller.view;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @author Junbo Wang
 * @description
 * @date 2019/5/7
 */
@Controller
@RequestMapping("/view/order")
public class OrderViewController {

    @RequestMapping("/toAddOrderSuccess")
    public String toAddOrderSuccess() {
        return "/order/orderSuccess.jsp";
    }
}
