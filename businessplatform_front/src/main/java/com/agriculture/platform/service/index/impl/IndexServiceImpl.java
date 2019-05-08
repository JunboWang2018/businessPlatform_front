package com.agriculture.platform.service.index.impl;

import com.agriculture.platform.pojo.base.Do.ProductDo;
import com.agriculture.platform.service.index.IndexService;
import com.agriculture.platform.service.product.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

/**
 * @author Junbo Wang
 * @description
 * @date 2019/5/7
 */
@Service
public class IndexServiceImpl implements IndexService {

    @Autowired
    private ProductService productService;

    @Override
    public List<ProductDo> recommendProdList() {
        List<ProductDo> resultList = new ArrayList<ProductDo>();
        ProductDo queryProd = new ProductDo();
        queryProd.setSellStatus(1);
        queryProd.setIsActive(1);
        List<ProductDo> productList = productService.selectProductList(queryProd);
        for (int i = 0; i < 10 && productList.size() != 0; i++) {
            int index = (int) (Math.random() * productList.size());
            ProductDo productDo = productList.get(index);
            resultList.add(productDo);
            productList.remove(index);
        }
        return resultList;
    }
}
