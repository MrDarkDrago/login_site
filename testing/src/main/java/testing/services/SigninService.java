/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package testing.services;

import java.sql.Connection;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import testing.models.Customer;
import testing.others.db;
import testing.repo.SignRepo;

/**
 *
 * @author Pasindu Theekshana
 */
@Service
public class SigninService {

    @Autowired
    SignRepo signrepo;

    public String insert_customer(String fname_backend, String lname_backend, String mobile_backend, String email_backend, String password_backend) {

        String paser = null;

        try (Connection con = db.getConnection()) {

            Customer customer = new Customer();

            customer.setFname(fname_backend);
            customer.setLname(lname_backend);
            customer.setEmail(email_backend);
            customer.setPassword(password_backend);
            customer.setMobile(mobile_backend);

            String insert_customer = signrepo.insert_customer(con, customer);

            if (insert_customer.equalsIgnoreCase("ok")) {
                paser = insert_customer;
            } else {
                paser = "ERROR";
            }

        } catch (Exception e) {
            e.printStackTrace();

        }
        return paser;

    }
}
