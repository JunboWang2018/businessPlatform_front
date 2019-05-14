package com.agriculture.platform.controller.data;

import com.agriculture.platform.pojo.base.Do.ProductDo;
import com.agriculture.platform.pojo.base.Do.ProductTypeDo;
import com.agriculture.platform.pojo.base.Do.UserDo;
import com.agriculture.platform.service.cart.CartService;
import com.agriculture.platform.service.index.IndexService;
import com.agriculture.platform.service.product.ProdTypeService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * @author Junbo Wang
 * @description
 * @date 2019/5/2
 */
@Controller
public class IndexDataController extends BaseDataController {
    private static final Logger LOGGER = LoggerFactory.getLogger(IndexDataController.class);

    @Autowired
    private IndexService indexService;

    @Autowired
    private ProdTypeService prodTypeService;

    @Autowired
    private CartService cartService;

    @RequestMapping("/")
    public String index(Model model, HttpSession session) {
        List<ProductDo> productList = indexService.recommendProdList();
        model.addAttribute("indexRecommendProdList", productList);
        List<ProductTypeDo> prodTypeList = prodTypeService.selectProdTypeList(new ProductTypeDo());
        model.addAttribute("prodTypeList", prodTypeList);
        UserDo sessionUser = (UserDo) session.getAttribute("user");
        session.setAttribute("cartTotal", cartService.getUserCartTotalNumber(sessionUser));
        return "/index.jsp";
    }
}
