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
import testing.services.SigninService;

/**
 *
 * @author Pasindu Theekshana
 */
@Controller
public class SigninController {

    @Autowired
    SigninService sign;

    @RequestMapping("/getSignin")
    @ResponseBody
    public String signin(@RequestParam String fname_backend, @RequestParam String lname_backend, @RequestParam String mobile_backend, @RequestParam String email_backend, @RequestParam String password_backend) {
//        System.out.println("Email :" + email_backend);
//        System.out.println("Password :" + password_backend);
//        System.out.println("confirmed password :" + c_password_backend);
//        System.out.println("First Name :" + fname_backend);
//        System.out.println("Second Name :" + lname_backend);
//        System.out.println("Mobile Number :" + mobile_backend);

        return sign.insert_customer(fname_backend, lname_backend, mobile_backend, email_backend, password_backend);

    }
}
