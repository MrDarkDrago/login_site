/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package testing.controllers;

import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.RequestMapping;

/**
 *
 * @author Pasindu Theekshana
 */
@Controller
public class IndexController {

    @RequestMapping("/")
    public String login() {
        return "login";
    }

    @RequestMapping("/login_user")
    public String login_user() {
        return "login";
    }

    @RequestMapping("/signin")
    public String signin() {
        return "signin";
    }

    @RequestMapping("/index")
    public String index() {
        return "index";
    }

}


