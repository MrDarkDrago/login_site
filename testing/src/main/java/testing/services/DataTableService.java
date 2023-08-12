package testing.services;

import java.sql.Connection;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import testing.others.db;
import testing.repo.DataTableRepo;

/**
 *
 * @author Pasindu Theekshana
 */
@Service
public class DataTableService {

    @Autowired
    DataTableRepo datatablerepo;

    public JSONObject dataTable(JSONObject param) {

        try (Connection con = db.getConnection()) {
            return datatablerepo.datatable(con, param);

        } catch (Exception e) {
            e.printStackTrace();

        }
        return null;

    }

    public boolean delete_user(Integer id) {

        boolean isSuccess = false;

        try (Connection con = db.getConnection()) {
            isSuccess = datatablerepo.delete_user(con, id);

        } catch (Exception e) {
            e.printStackTrace();

        }
        return isSuccess;
    }
    
    
    public boolean update_user(Integer id, String fname, String lname, String email, String mobile) {

        boolean isSuccess = false;

        try (Connection con = db.getConnection()) {
            isSuccess = datatablerepo.update_user(con, fname, lname, email, mobile, id);

        } catch (Exception e) {
            e.printStackTrace();

        }
        return isSuccess;
    }

}
