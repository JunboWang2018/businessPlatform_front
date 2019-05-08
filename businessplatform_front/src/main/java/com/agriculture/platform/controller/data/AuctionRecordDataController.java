package com.agriculture.platform.controller.data;

import com.agriculture.platform.common.constant.RespJson;
import com.agriculture.platform.common.constant.Result;
import com.agriculture.platform.pojo.base.Do.AuctionRecordDo;
import com.agriculture.platform.pojo.base.Do.UserDo;
import com.agriculture.platform.service.order.AuctionRecordService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;

/**
 * @author Junbo Wang
 * @description
 * @date 2019/5/7
 */
@Controller
@RequestMapping("/data/auctionRecord")
public class AuctionRecordDataController extends BaseDataController {
    private static final Logger LOGGER = LoggerFactory.getLogger(AuctionRecordDataController.class);

    @Autowired
    private AuctionRecordService auctionRecordService;

    @ResponseBody
    @RequestMapping("/addAuctionRecord")
    public RespJson addAuctionRecord(AuctionRecordDo auctionRecordDo, HttpSession session) {
        //获取当前用户
        UserDo sessionUser = (UserDo) session.getAttribute("user");
        Result result = null;
        try {
            result = auctionRecordService.addAuctionRecord(auctionRecordDo, sessionUser);
        } catch (IllegalArgumentException e) {
            LOGGER.error(e.getMessage());
        }
        return this.responseMsg(result.getCode(), result.getMessage());
    }
}
