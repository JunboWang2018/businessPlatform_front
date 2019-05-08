package com.agriculture.platform.service.order.impl;

import com.agriculture.platform.common.constant.Result;
import com.agriculture.platform.dao.order.AuctionRecordDao;
import com.agriculture.platform.pojo.base.Do.AuctionRecordDo;
import com.agriculture.platform.pojo.base.Do.UserDo;
import com.agriculture.platform.service.order.AuctionRecordService;
import com.agriculture.platform.service.user.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * @author Junbo Wang
 * @description
 * @date 2019/5/6
 */
@Service
public class AuctionRecordServiceImpl implements AuctionRecordService {

    @Resource
    private AuctionRecordDao auctionRecordDao;

    @Autowired
    private UserService userService;


    @Override
    public List<AuctionRecordDo> selectAuctionRecordList(AuctionRecordDo auctionRecordDo) {
        if (auctionRecordDo == null) {
            auctionRecordDo = new AuctionRecordDo();
        }
        return auctionRecordDao.selectAuctionRecordList(auctionRecordDo);
    }

    @Override
    public Double selectMaxPrice(String prodNumber) {
        AuctionRecordDo queryAuctionRecord = new AuctionRecordDo();
        queryAuctionRecord.setProdNumber(prodNumber);
        List<AuctionRecordDo> resultList = this.selectAuctionRecordList(queryAuctionRecord);
        if (resultList == null || resultList.size() == 0) {
            return null;
        }
        Double maxPrice = resultList.get(0).getPrice();
        for (int i = 1; i < resultList.size(); i++) {
            if (resultList.get(i).getPrice().doubleValue() > maxPrice.doubleValue()) {
                maxPrice = resultList.get(i).getPrice();
            }
        }
        return maxPrice;
    }

    @Override
    public Result addAuctionRecord(AuctionRecordDo auctionRecordDo, UserDo sessionUser) throws IllegalArgumentException {
        if (auctionRecordDo == null) {
            throw new IllegalArgumentException();
        }
        if (sessionUser == null) {
            return Result.USER_NOT_LOGIN;
        }
        UserDo queryUser = new UserDo();
        queryUser.setUsername(sessionUser.getUsername());
        UserDo resultUser = userService.selectUser(queryUser);
        auctionRecordDo.setUserId(resultUser.getUserId());
        auctionRecordDo.setIsActive(1);
        Integer result = auctionRecordDao.addAuctionRecord(auctionRecordDo);
        if (result == 1) {
            return Result.AUCTION_RECORD_ADD_SUCCESS;
        }
        return Result.AUCTION_RECORD_ADD_FAILED;
    }
}
