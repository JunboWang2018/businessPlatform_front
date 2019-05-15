package com.agriculture.platform.service.user;

import com.agriculture.platform.common.constant.Result;
import com.agriculture.platform.pojo.base.Do.UserDo;

import java.util.List;
import java.util.Map;

/**
 * 用户登录注册接口
 */
public interface UserService {


    /**
     * 用户登录
     * @param userDo
     * @return
     */
    Result login(UserDo userDo);

    /**
     * 用户注册
     * @param userDo
     * @return
     */
    Result register(UserDo userDo);

    /**
     * 根据自定义条件查找用户list
     * @param userDo
     * @return
     */
    List<UserDo> selectUserList(UserDo userDo);

    /**
     * 根据自定义条件查找用户
     * @param userDo
     * @return
     */
    UserDo selectUser(UserDo userDo);

    /**
     * 修改用户信息
     * @param userDo
     * @param sessionUser
     * @return
     */
    Result modifyUserInfo(UserDo userDo, UserDo sessionUser);

}
