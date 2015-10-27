package com.db;

import com.model.Admin;

import java.sql.*;
import java.util.ArrayList;

/**
 * Created by michael on 15/09/15.
 */
public class DBConnection {

    private Connection conn;
    private static DBConnection db;

    private DBConnection(){
        // JDBC driver name and database URL
         final String JDBC_DRIVER = "com.mysql.jdbc.Driver";
         final String DB_URL = "jdbc:mysql://michael-soa.crhqylh0ggsu.ap-southeast-2.rds.amazonaws.com:3306/soa";

        //  Database credentials
         final String USER = "Michael";
         final String PASS = "2wsx1qaz";

        try {
            Class.forName(JDBC_DRIVER).newInstance();
            //STEP 3: Open a connection
            System.out.println("Connecting to database...");
            conn = DriverManager.getConnection(DB_URL, USER, PASS);

        } catch (InstantiationException e) {
            e.printStackTrace();
        } catch (IllegalAccessException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        }


    }


    public static synchronized Connection getDbCon() {
        if ( db == null ) {
            db = new DBConnection();
        }
        return db.conn;

    }

}
