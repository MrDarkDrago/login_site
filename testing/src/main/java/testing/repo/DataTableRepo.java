/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package testing.repo;

import java.sql.Connection;
import java.sql.PreparedStatement;
import org.json.JSONObject;
import org.springframework.stereotype.Repository;
import testing.others.DataTable;

/**
 *
 * @author Pasindu Theekshana
 */

@Repository
public class DataTableRepo {

    public JSONObject datatable(Connection con, JSONObject param) {
        try (con) {
            String query = "SELECT c.`id`, c.`fname`, c.`lname`,c.`email`,c.`mobile` FROM customer c WHERE TRUE";

            PreparedStatement pst = con.prepareStatement(query);
            return DataTable.getData(param, pst);
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    public boolean delete_user(Connection con, Integer id) {
        boolean isSuccess = false;
        try (con) {
            String query = "DELETE FROM customer WHERE id=?";

            PreparedStatement pst = con.prepareStatement(query);
            pst.setInt(1, id);

            int row_affected = pst.executeUpdate();

            if (row_affected > 0) {
                isSuccess = true;
            } else {
                isSuccess = false;
            }
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
        
        return isSuccess;
    }
    
    
    
    public boolean update_user(Connection con, String fname, String lname, String email, String mobile, Integer id) {
        boolean isSuccess = false;
        try (con) {
            String query = "UPDATE customer SET `fname`=?, `lname`=?, `email`=?, `mobile`=? WHERE id=?";
            System.out.println("ok");
            
            PreparedStatement pst = con.prepareStatement(query);
            
            pst.setString(1, fname);
            pst.setString(2, lname);
            pst.setString(3, email);
            pst.setString(4, mobile);
            pst.setInt(5, id);
            
            

            int row_affected = pst.executeUpdate();

            if (row_affected > 0) {
                isSuccess = true;
            } else {
                isSuccess = false;
            }
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
        
        return isSuccess;
    }

}
