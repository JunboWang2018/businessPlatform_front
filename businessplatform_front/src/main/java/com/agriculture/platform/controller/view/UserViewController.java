package com.agriculture.platform.controller.view;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @author Junbo Wang
 * @description
 * @date 2019/5/4
 */
@Controller
@RequestMapping("/view/user")
public class UserViewController {

    /**
     * 跳转登录页面
     * @return
     */
    @RequestMapping("/toLogin")
    public String login() {
        return "/user/login.jsp";
    }

    /**
     * 跳转到注册页面
     * @return
     */
    @RequestMapping("/toRegister")
    public String register() {
        return "/user/register.jsp";
    }
}
