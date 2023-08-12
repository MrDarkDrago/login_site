package testing.repo;

import cn.hutool.json.JSONObject;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import org.springframework.stereotype.Repository;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
/**
 *
 * @author Pasindu Theekshana
 */
@Repository
public class LoginRepo {

    public String login(Connection conn, String email_backend, String password_backend) {
        String success = null;

        try (conn) {
            String login_query = "SELECT email, password FROM customer WHERE email=? and password=?";

            PreparedStatement pst = conn.prepareStatement(login_query);
            pst.setString(1, email_backend);
            pst.setString(2, password_backend);

            ResultSet rs = pst.executeQuery();
            if (rs.next()) {
                JSONObject sys = new JSONObject();
                sys.put("email_user", rs.getString(1));
                sys.put("password_user", rs.getString(2));
                sys.put("status","ok");
                success = sys.toString();               
                
            } else {
                return "ERROR";
            }

        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
        
        System.out.println("check :"+success);

        return success;

    }

}
