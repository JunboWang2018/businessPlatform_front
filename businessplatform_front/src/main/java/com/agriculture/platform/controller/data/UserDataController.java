package com.agriculture.platform.controller.data;

import com.agriculture.platform.common.constant.RespJson;
import com.agriculture.platform.common.constant.Result;
import com.agriculture.platform.pojo.base.Do.UserDo;
import com.agriculture.platform.service.user.UserService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * @author Junbo Wang
 * @description 登陆注册模块
 * @date 2019/4/5
 */
@Controller
@RequestMapping("/data/user")
public class UserDataController extends BaseDataController{
    private static final Logger log = LoggerFactory.getLogger(UserDataController.class);

    @Autowired
    private UserService userService;

    /**
     * 用户登录：
     *  1. 登录成功将用户名存入session
     *  2. 返回登录结果信息
     * @param userDo
     * @param session
     * @return
     */
    @ResponseBody
    @RequestMapping("/login")
    public RespJson login(UserDo userDo, HttpSession session) {
        Result result = null;
        try {
            result = userService.login(userDo);
        } catch (IllegalArgumentException e) {
            return this.handleIllegalArgumentException(e);
        }
        //若登录成功，将用户名放入session
        if (result == Result.LOGIN_SUCCESS) {
            session.setAttribute("user", userDo);
        }
         return this.responseMsg(result.getCode(), result.getMessage());
    }

    /**
     * 用户注册:
     *  1. 注册成功将用户名存入session
     *  2. 返回注册结果信息
     * @param userDo
     * @return
     */
    @ResponseBody
    @RequestMapping("/register")
    public RespJson register(UserDo userDo, HttpSession session) {
        Result result = null;
        try {
            result = userService.register(userDo);
        } catch (IllegalArgumentException e) {
            return this.handleIllegalArgumentException(e);
        }
        if (result == Result.REGISTER_SUCCESS) {
            session.setAttribute("user", userDo);
        }
        return this.responseMsg(result.getCode(), result.getMessage());
    }

    /**
     * 用户退出:
     *  1. sesssion中清除用户信息
     * @return
     */
    @RequestMapping("/logout")
    public String register(HttpSession session, HttpServletResponse response) {
        //设置返回数据格式为json
        response.setContentType("application/json");
        session.removeAttribute("user");
        return "/index.jsp";
    }
}
