/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package testing.services;

import java.sql.Connection;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import testing.others.db;
import testing.repo.LoginRepo;

/**
 *
 * @author Pasindu Theekshana
 */
@Service
public class LoginService {

    @Autowired
    LoginRepo loginrepo;

    public String login(String email_backend, String password_backend) {

        String paser = null;
        try (Connection con = db.getConnection()) {
            paser = loginrepo.login(con, email_backend, password_backend);
        } catch (Exception e) {
            e.printStackTrace();

        }
        return paser;

    }
}
