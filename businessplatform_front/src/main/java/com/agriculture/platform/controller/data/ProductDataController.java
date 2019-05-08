package com.agriculture.platform.controller.data;

import com.agriculture.platform.common.exception.BusinessException;
import com.agriculture.platform.pojo.base.Do.ProductDo;
import com.agriculture.platform.pojo.base.Do.ProductTypeDo;
import com.agriculture.platform.pojo.base.Do.UserDo;
import com.agriculture.platform.pojo.base.Qo.ProductInfoQo;
import com.agriculture.platform.service.product.ProdTypeService;
import com.agriculture.platform.service.product.ProductService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * @author Junbo Wang
 * @description
 * @date 2019/5/7
 */
@Controller
@RequestMapping("/data/product")
public class ProductDataController extends BaseDataController {
    private static final Logger LOGGER = LoggerFactory.getLogger(ProductDataController.class);

    @Autowired
    private ProductService productService;

    @Autowired
    private ProdTypeService prodTypeService;

    private List<ProductTypeDo> prodTypeList = null;

    /**
     * 关键字查询商品列表
     * @param keyword
     * @param model
     * @return
     */
    @RequestMapping("/selectProdListByKey")
    public String selectProdListByKey(String keyword, Model model) {
        ProductDo queryProd = new ProductDo();
        queryProd.setName(keyword);
        queryProd.setSellStatus(1);
        queryProd.setIsActive(1);
        List<ProductInfoQo> resultList = null;
        try {
            resultList = productService.selectProdInfoQoList(queryProd);
        } catch (BusinessException e) {
            LOGGER.error(e.getMessage());
        }
        model.addAttribute("prodQoList", resultList);
        if (this.prodTypeList == null) {
            prodTypeList = prodTypeService.selectProdTypeList(new ProductTypeDo());
        }
        model.addAttribute("prodTypeList", prodTypeList);
        model.addAttribute("keyword", keyword);
        model.addAttribute("prodTotalNumber", resultList.size());
        return "/product/productList.jsp";
    }

    /**
     * 指定条件查询商品列表
     * @param productDo
     * @param model
     * @return
     */
    @RequestMapping("/selectProdList")
    public String selectProdList(ProductDo productDo, Model model) {
        productDo.setIsActive(1);
        List<ProductInfoQo> resultList = null;
        productDo.setSellStatus(1);
        productDo.setIsActive(1);
        try {
            resultList = productService.selectProdInfoQoList(productDo);
        } catch (BusinessException e) {
            LOGGER.error(e.getMessage());
        }
        model.addAttribute("prodQoList", resultList);
        if (this.prodTypeList == null) {
            prodTypeList = prodTypeService.selectProdTypeList(new ProductTypeDo());
        }
        model.addAttribute("prodTypeList", prodTypeList);
        model.addAttribute("keyword", productDo.getName());
        model.addAttribute("prodTotalNumber", resultList.size());
        return "/product/productList.jsp";
    }

    /**
     * 查询商品信息
     * @param productDo
     * @param model
     * @param session
     * @return
     */
    @RequestMapping("/selectProdInfo")
    public String selectProdInfo(ProductDo productDo, Model model, HttpSession session) {
        UserDo sessionUser = (UserDo) session.getAttribute("user");
        if (sessionUser == null) {
            return "/user/login.jsp";
        }
        productDo.setIsActive(1);
        ProductInfoQo resultProd = null;
        try {
            resultProd = productService.selectProdInfoQo(productDo);
        } catch (BusinessException e) {
            LOGGER.error(e.getMessage());
        }
        model.addAttribute("prodQo", resultProd);
        if (this.prodTypeList == null) {
            prodTypeList = prodTypeService.selectProdTypeList(new ProductTypeDo());
        }
        model.addAttribute("prodTypeList", prodTypeList);
        return "/product/productInfo.jsp";
    }

}
