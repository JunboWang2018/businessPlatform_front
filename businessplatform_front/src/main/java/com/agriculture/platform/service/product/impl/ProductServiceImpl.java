package com.agriculture.platform.service.product.impl;

import com.agriculture.platform.common.constant.Result;
import com.agriculture.platform.common.exception.BusinessException;
import com.agriculture.platform.dao.product.ProductDao;
import com.agriculture.platform.pojo.base.Do.*;
import com.agriculture.platform.pojo.base.Qo.ProductInfoQo;
import com.agriculture.platform.service.order.AuctionRecordService;
import com.agriculture.platform.service.product.AuctionInfoService;
import com.agriculture.platform.service.product.ProdTypeService;
import com.agriculture.platform.service.product.ProductService;
import com.agriculture.platform.service.product.SaleWayService;
import com.agriculture.platform.service.user.UserService;
import com.agriculture.platform.service.validate.ValidateService;
import com.agriculture.platform.utils.AutoGenerateNumberUtil;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import java.io.File;
import java.sql.Timestamp;
import java.util.*;

/**
 * @author Junbo Wang
 * @description
 * @date 2019/5/5
 */
@Service
public class ProductServiceImpl implements ProductService {
    private static final Logger LOGGER = LoggerFactory.getLogger(ProductServiceImpl.class);

    @Resource
    private ProductDao productDao;

    @Autowired
    private AuctionInfoService auctionInfoService;

    @Autowired
    private ProdTypeService prodTypeService;

    @Autowired
    private SaleWayService saleWayService;

    @Autowired
    private UserService userService;

    @Autowired
    private AuctionRecordService auctionRecordService;

    @Override
    public ProductDo selectProduct(ProductDo productDo) {
        List<ProductDo> resultList = this.selectProductList(productDo);
        if (resultList == null || resultList.size() == 0) {
            return null;
        }
        return resultList.get(0);
    }

    @Override
    public List<ProductDo> selectProductList(ProductDo productDo) {
        if (productDo == null) {
            productDo = new ProductDo();
        }
        return productDao.selectProdList(productDo);
    }

    @Override
    public ProductInfoQo selectProdInfoQo(ProductDo productDo) throws BusinessException {
        List<ProductInfoQo> resultList = this.selectProdInfoQoList(productDo);
        if (resultList == null || resultList.size() == 0) {
            return null;
        }
        return resultList.get(0);
    }

    @Override
    public List<ProductInfoQo> selectProdInfoQoList(ProductDo productDo) throws BusinessException {
        if (productDo == null) {
            productDo = new ProductDo();
        }
        List<ProductInfoQo> prodInfoQoList = new ArrayList<ProductInfoQo>();
        List<ProductDo> resultProdList = this.selectProductList(productDo);
        if (resultProdList == null || resultProdList.size() == 0) {
            return null;
        }
        //遍历查询商品及其相关信息，并封装
        for (int i = 0; i < resultProdList.size(); i++) {
            prodInfoQoList.add(this.setProductInfoQo(resultProdList.get(i)));
        }
        return prodInfoQoList;
    }


    /**
     * 封装商品列表查询信息
     * @param productDo
     * @return
     * @throws BusinessException
     */
    private ProductInfoQo setProductInfoQo(ProductDo productDo) throws BusinessException {
        ProductInfoQo productInfoQo = new ProductInfoQo();
        productInfoQo.setProductDo(productDo);
        //查询商品类型名
        ProductTypeDo resultProdType = prodTypeService.selectProdType(productDo.getTypeCode());
        if (resultProdType == null) {
            throw new BusinessException(productDo.getTypeCode() + "，此商品类型不存在");
        }
        productInfoQo.setProdTypeName(resultProdType.getName());
        //查询出售形式名称
        SaleWayDo resultSaleWay = saleWayService.selectSaleWay(productDo.getSaleWayCode());
        if (resultSaleWay == null) {
            throw new BusinessException(productDo.getSaleWayCode() + "，此出售形式不存在");
        }
        productInfoQo.setSaleWayName(resultSaleWay.getName());
        //查询发布用户信息
        UserDo queryUser = new UserDo();
        queryUser.setUserId(productDo.getUserId());
        UserDo resultUser = userService.selectUser(queryUser);
        if (resultUser == null) {
            throw new BusinessException(productDo.getUserId() + "，该用户不存在");
        }
        productInfoQo.setUserDo(resultUser);
        //设置出售状态
        productInfoQo.setSellStatusName(this.getStatusName(productDo.getSellStatus()));
        if (!productDo.getSaleWayCode().equals("AUCTI")) {
            return productInfoQo;
        }
        //如果是竞拍商品 设置竞拍信息,并查询最高价
        AuctionInfoDo queryAuctionInfo = new AuctionInfoDo();
        queryAuctionInfo.setProdNumber(productDo.getNumber());
        AuctionInfoDo resultAuctionInfo = auctionInfoService.selectAuctionInfo(queryAuctionInfo);
        if (resultAuctionInfo == null) {
            throw new BusinessException(productDo.getNumber() + "，该竞拍商品缺少竞拍信息");
        }
        productInfoQo.setAuctionInfoDo(resultAuctionInfo);
        Double maxPrice = auctionRecordService.selectMaxPrice(productDo.getNumber());
        if (maxPrice == null) {
            productInfoQo.setMaxAuctionPrice(productDo.getPrice());
        } else {
            productInfoQo.setMaxAuctionPrice(maxPrice);
        }
        return productInfoQo;
    }

    /**
     * 根据出售状态返回状态名
     * @param sellStatus
     * @return
     */
    private String getStatusName(Integer sellStatus) {
        switch (sellStatus.intValue()) {
            case -1 : return "下架";
            case 0 : return "已出售";
            case 1 : return "上架出售中";
            default : return null;
        }

    }
}
