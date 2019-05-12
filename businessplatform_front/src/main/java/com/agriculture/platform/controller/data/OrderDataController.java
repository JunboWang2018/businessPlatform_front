package com.agriculture.platform.controller.data;

import com.agriculture.platform.common.constant.RespJson;
import com.agriculture.platform.common.constant.Result;
import com.agriculture.platform.pojo.base.Do.OrderDo;
import com.agriculture.platform.pojo.base.Do.UserDo;
import com.agriculture.platform.pojo.base.Qo.OrderInfoQo;
import com.agriculture.platform.service.order.OrderService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * @author Junbo Wang
 * @description
 * @date 2019/5/7
 */
@Controller
@RequestMapping("/data/order")
public class OrderDataController extends BaseDataController {
    private static final Logger LOGGER = LoggerFactory.getLogger(OrderDataController.class);

    @Autowired
    private OrderService orderService;

    @ResponseBody
    @RequestMapping("/addOrder")
    public RespJson addOrder(@RequestParam(value = "prodNumbers[]") String[] prodNumbers, HttpSession session) {
        UserDo sessionUser = (UserDo) session.getAttribute("user");
        Result result = null;
        result = orderService.addOrder(prodNumbers, sessionUser);
        return this.responseMsg(result.getCode(), result.getMessage());
    }

    /**
     * 查询订单信息列表
     * @param session
     * @param model
     * @return
     */
    @RequestMapping("/selectOrderInfoQoList")
    public String selectOrderInfoQoList(HttpSession session, Model model) {
        UserDo sessionUser = (UserDo) session.getAttribute("user");
        if (sessionUser == null) {
            return "/user/login.jsp";
        }
        List<OrderInfoQo> orderInfoQos = orderService.selectUserOrderInfoList(sessionUser);
        model.addAttribute("orderList", orderInfoQos);
        if (orderInfoQos != null) {
            double totalPrice = 0;
            for (int i = 0; i < orderInfoQos.size(); i++) {
                totalPrice += orderInfoQos.get(i).getProductDo().getPrice().doubleValue() * orderInfoQos.get(i).getOrderDo().getQuantity().intValue();
            }
            model.addAttribute("totalPrice",  totalPrice);
        }
        return "/order/orderList.jsp";
    }

    /**
     * 根据指定条件删除订单
     * @param orderDo
     * @param session
     * @return
     */
    @ResponseBody
    @RequestMapping("/deleteOrder")
    public RespJson deleteOrder(OrderDo orderDo, HttpSession session) {
        UserDo sessionUser = (UserDo) session.getAttribute("user");
        Result result = null;
        result = orderService.deleteOrder(orderDo, sessionUser);
        return this.responseMsg(result.getCode(), result.getMessage());
    }

    @ResponseBody
    @RequestMapping("/prodInfoBuy")
    public RespJson prodInfoBuy(OrderDo orderDo, HttpSession session) {
        UserDo sessionUser = (UserDo) session.getAttribute("user");
        Result result = null;
        result = orderService.prodInfoBuy(orderDo, sessionUser);
        return this.responseMsg(result.getCode(), result.getMessage());
    }
}
