package com.agriculture.platform.service.user.impl;


import com.agriculture.platform.common.constant.Result;
import com.agriculture.platform.dao.user.UserDao;
import com.agriculture.platform.pojo.base.Do.UserDo;
import com.agriculture.platform.service.user.UserService;
import com.agriculture.platform.service.validate.ValidateService;
import com.agriculture.platform.utils.MD5;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author Junbo Wang
 * @description
 * @date 2019/4/5
 */
@Service
public class UserServiceImpl implements UserService {
    private static final Logger LOGGER = LoggerFactory.getLogger(UserServiceImpl.class);

    @Resource
    private UserDao userDao;

    @Autowired
    private ValidateService validateService;
    /**
     * 登录:
     *  1. 验证用户名和密码是否为空
     *  2. 根据用户名查询数据库
     *  3. 若返回值为空，则用户不存在。
     *  4. 若返回值不为空，判断密码是否正确。
     * @param userDo
     * @return
     */
    @Override
    public Result login(UserDo userDo) throws IllegalArgumentException {
        validateService.validateUser(userDo);
        UserDo queryUser = new UserDo();
        queryUser.setUsername(userDo.getUsername());
        queryUser.setIsActive(1);
        List<UserDo> resultList = userDao.selectUserList(queryUser);
        if (resultList == null || resultList.size() == 0) {
            return Result.USER_NOT_EXIST;
        } else if (!resultList.get(0).getPassword().equals(MD5.getMD5Code(userDo.getPassword()))) {
            return  Result.PASSWORD_ERROR;
        } else if (!resultList.get(0).getPower().equals("user")) {
            return Result.NO_POWER_TO_LOGIN;
        } else {
            return Result.LOGIN_SUCCESS;
        }
    }

    /**
     * 注册:
     *  1. 验证用户名和密码是否为空
     *  2. 根据用户名查询数据库,判断用户名是否已存在
     *  3. 若用户名不存在，则插入新用户，返回值为受影响的行数
     *  4. 若行数为1，则插入成功，其他情况为插入失败
     * @param userDo
     * @return
     */
    @Override
    public Result register(UserDo userDo) throws IllegalArgumentException {
        validateService.validateUser(userDo);
        UserDo queryUser = new UserDo();
        queryUser.setUsername(userDo.getUsername());
        //查询用户名是否存在
        List<UserDo> resultList = userDao.selectUserList(queryUser);
        if (resultList != null && ((List) resultList).size() > 0) {
            return Result.USER_IS_EXIST;
        }
        //密码加密
        userDo.setPassword(MD5.getMD5Code(userDo.getPassword()));
        //设置初始化参数
        if (userDo.getPower() == null ||userDo.getPower().equals("")) {
            userDo.setPower("user");
        }
        userDo.setScore(0);
        userDo.setBalance(0.0);
        userDo.setIsActive(1);
        //添加用户
        Integer count = userDao.addUser(userDo);
        if (count == 1) {
            return Result.REGISTER_SUCCESS;
        } else {
            return Result.REGISTER_FAILED;
        }
    }

    @Override
    public List<UserDo> selectUserList(UserDo userDo) {
        return userDao.selectUserList(userDo);
    }

    @Override
    public UserDo selectUser(UserDo userDo) throws IllegalArgumentException {
        if (!validateService.validateUserSearch(userDo)) {
            return null;
        }
        List<UserDo> list = this.selectUserList(userDo);
        if (list.size() >= 0) {
            return list.get(0);
        } else {
            return null;
        }
    }
}
