package com.agriculture.platform.service.product;


import com.agriculture.platform.common.exception.BusinessException;
import com.agriculture.platform.pojo.base.Do.ProductDo;
import com.agriculture.platform.pojo.base.Qo.ProductInfoQo;

import java.util.List;

public interface ProductService {

    /**
     * 查找单个商品，无需封装
     * @param productDo
     * @return
     */
    ProductDo selectProduct(ProductDo productDo);

    /**
     * 查找多个商品，返回商品集合，无需封装
     * @param productDo
     * @return
     */
    List<ProductDo> selectProductList(ProductDo productDo);

   /**
     * 查找单个商品，并查找其它需要的参数
     * @param productDo
     * @return
     */
   ProductInfoQo selectProdInfoQo(ProductDo productDo)  throws BusinessException;

    /**
     * 查找多个商品，并查找其它需要的参数，返回封装后对象的集合
     * @param productDo
     * @return
     */
    List<ProductInfoQo> selectProdInfoQoList(ProductDo productDo) throws BusinessException;


}
