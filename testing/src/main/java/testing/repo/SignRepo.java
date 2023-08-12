/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package testing.repo;

import java.sql.Connection;
import java.sql.PreparedStatement;
import org.springframework.stereotype.Repository;
import testing.models.Customer;

/**
 *
 * @author Pasindu Theekshana
 */
@Repository
public class SignRepo {

    public String insert_customer(Connection con, Customer customer) {
        
        String isSuccess = null;
        try {
            String query = "INSERT INTO customer(`fname`, `lname`, `email`,`password`,`mobile`) VALUES (?, ?, ?, ?, ?)";
            PreparedStatement db_customer = con.prepareStatement(query);
            db_customer.setString(1, customer.getFname());
            db_customer.setString(2, customer.getLname());
            db_customer.setString(3, customer.getEmail());
            db_customer.setString(4, customer.getPassword());
            db_customer.setString(5, customer.getMobile());

            int rs = db_customer.executeUpdate(); // Store the result of the update operation

            if (rs > 0) {
                isSuccess = "ok";
            }else{
                isSuccess="Error";
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return isSuccess;
    }
}
