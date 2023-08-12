/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package testing.others;

import java.sql.Connection;
import java.sql.DriverManager;

/**
 *
 * @author Pasindu Theekshana
 */
public class db {
    static String url = "jdbc:mysql://localhost:3306/testingdb";
    static String user = "root";
    static String pass = "1234";


    static Connection con;
 
    public static Connection getConnection() throws Exception {

        Class.forName("com.mysql.jdbc.Driver");
        con = DriverManager.getConnection(url, user, pass);
        return con;
    }
}