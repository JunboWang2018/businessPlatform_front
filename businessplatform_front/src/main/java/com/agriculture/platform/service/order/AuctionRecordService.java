package com.agriculture.platform.service.order;

import com.agriculture.platform.common.constant.Result;
import com.agriculture.platform.pojo.base.Do.AuctionRecordDo;
import com.agriculture.platform.pojo.base.Do.UserDo;

import java.util.List;

public interface AuctionRecordService {
    /**
     * 根据指定条件查询竞拍记录
     * @param auctionRecordDo
     * @return
     */
    List<AuctionRecordDo> selectAuctionRecordList(AuctionRecordDo auctionRecordDo);

    /**
     * 查询商品的最高竞拍纪录
     * @param prodNumber
     * @return
     */
    Double selectMaxPrice(String prodNumber);

    /**
     * 添加一条竞拍记录
     * @param auctionRecordDo
     * @return
     */
    Result addAuctionRecord(AuctionRecordDo auctionRecordDo, UserDo sessionUser) throws IllegalArgumentException;

}
