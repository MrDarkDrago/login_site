/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package testing.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import testing.services.LoginService;

/**
 *
 * @author Pasindu Theekshana
 */
@Controller

public class LoginController {

    @Autowired
    LoginService service;

    @RequestMapping("/getData")
    @ResponseBody
    public String login(@RequestParam String email_backend, @RequestParam String password_backend) {
        System.out.println("Email :" + email_backend);
        System.out.println("Password :" + password_backend);

        return service.login(email_backend, password_backend);
    }
}
