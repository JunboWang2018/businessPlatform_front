package com.agriculture.platform.service.index;

import com.agriculture.platform.pojo.base.Do.ProductDo;

import java.util.List;

public interface IndexService {
    /**
     * 首页的推荐商品
     * @return
     */
    List<ProductDo> recommendProdList();
}
