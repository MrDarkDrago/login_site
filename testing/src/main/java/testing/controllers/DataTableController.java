/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package testing.controllers;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import testing.services.DataTableService;

/**
 *
 * @author Pasindu Theekshana
 */
@Controller
public class DataTableController {

    @Autowired
    DataTableService datatableservice;

    @PostMapping("/customer_data_table")
    @ResponseBody

    public String data_table(@RequestBody String param) {
        System.out.println(datatableservice.dataTable(new JSONObject(param)).toString());
        return datatableservice.dataTable(new JSONObject(param)).toString();
    }

    @PostMapping("/delete_user")
    public ResponseEntity<?> delete(@RequestBody String body) {
        JSONObject jsonObject = new JSONObject(body);
        String dataValue = jsonObject.getString("id_back");

        int id = Integer.parseInt(dataValue); // Convert String to int

        boolean isSuccess = datatableservice.delete_user(id);

        if (isSuccess) {
            return ResponseEntity.ok().body("{\"status\":\"ok\"}");
        } else {
            return ResponseEntity.ok().body("{\"status\":\"error\"}");
        }
    }
    
    @PostMapping("/update_user")
    public ResponseEntity<?> update(@RequestBody String body) {
        JSONObject jsonObject = new JSONObject(body);
        String dataValue_id = jsonObject.getString("id_back");
        String dataValue_fname = jsonObject.getString("u_fname_back");
        String dataValue_lname = jsonObject.getString("u_lname_back");
        String dataValue_email = jsonObject.getString("u_email_back");
        String dataValue_mobile = jsonObject.getString("u_mobile_back");

        int id = Integer.parseInt(dataValue_id); // Convert String to int
        
        boolean isSuccess = datatableservice.update_user(id, dataValue_fname, dataValue_lname, dataValue_email, dataValue_mobile);

        if (isSuccess) {
            return ResponseEntity.ok().body("{\"status\":\"ok\"}");
        } else {
            return ResponseEntity.ok().body("{\"status\":\"error\"}");
        }
    }
}
