package com.db;

import com.model.Admin;
import com.model.Incident;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by michael on 5/10/15.
 */
public class LoginDBO {

    public int stuffLogin(Admin admin){
        Connection connection = DBConnection.getDbCon();

        Statement statement = null;
        ResultSet rs ;
        int role = 0;
        try {
            statement = connection.createStatement();
            String sql = "select * from users where username='"+admin.getUsername()+"' and password='"+admin.getPassword()+"'";

            rs = statement.executeQuery(sql);

            while (rs.next()){
               role = rs.getInt("role");
            }

            rs.close();
            statement.close();

        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            //finally block used to close resources
            try {
                if (statement != null)
                    statement.close();
            } catch (SQLException se2) {
            }
        }
        return role;
    }

}
