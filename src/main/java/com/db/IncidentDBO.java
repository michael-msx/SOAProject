package com.db;

import com.model.Incident;
import com.model.IncidentProcess;

import java.sql.*;
import java.util.*;

/**
 * Created by michael on 29/09/15.
 */
public class IncidentDBO {

    public void createNewIncident(Incident incident){
        Connection connection = DBConnection.getDbCon();
        Statement statement = null;
        try {
            statement = connection.createStatement();
            String sql;
            sql = "INSERT into service_requests(user_id, status,create_time ,content, next_user,request_type)  VALUE ('" +
                    incident.getUser_id()+"','"+
                    incident.getStatus() +"',"+
                    "now(),'"+
                    incident.getContent()+"',"+
                    incident.getNext_user()+","+
                    incident.getType()
                    +")";
            System.out.println(sql);
            statement.execute(sql);

            statement.close();

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            //finally block used to close resources
            try {
                if (statement != null)
                    statement.close();
            } catch (SQLException se2) {
            }
        }
    }

    public void updateIncidentStatus(String status, int nextRole, int incidentID){
        Connection conn = DBConnection.getDbCon();
        Statement stmt = null;

        try {
            stmt = conn.createStatement();

            String sql = "update service_requests set status='"+status+"', update_time=now(), next_user="+nextRole+"" +
                    " where id="+incidentID;
            stmt.execute(sql);

            stmt.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public List<IncidentProcess> listIncidentProcess(int requestId){
        Connection connection = DBConnection.getDbCon();

        Statement statement = null;
        ResultSet rs ;
        List<IncidentProcess> processes = new ArrayList<IncidentProcess>();

        try {
            statement = connection.createStatement();

            String sql = "select * from request_progress where request_id="+ requestId +" order by id desc";


            rs = statement.executeQuery(sql);

            while (rs.next()){
                IncidentProcess temp = new IncidentProcess();

                temp.setIncidentId(rs.getInt("request_id"));
                temp.setContent(rs.getString("progress_content"));
                temp.setStatus(rs.getString("request_status"));
                temp.setUpdateTime(rs.getString("progress_timestamp").substring(0,19));
                temp.setUser(rs.getInt("progress_user_id"));

                processes.add(temp);
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
        return processes;
    }



    public void insertIncidentProcess(int incidentID, String status, String content, int user ){
        Connection conn = DBConnection.getDbCon();
        Statement stmt = null;

        try {
            stmt = conn.createStatement();
            String sql = "INSERT  INTO request_progress(request_id, request_status, progress_content, progress_user_id, progress_timestamp)" +
                    " VALUES ("+incidentID+",'"+status+"','"+content+"',"+user+",now())";
            stmt.execute(sql);

            stmt.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }

    }

    public List<Incident> listIncidentsByRole(int role){
        Connection connection = DBConnection.getDbCon();

        Statement statement = null;
        ResultSet rs ;
        List<Incident> incidents = new ArrayList<Incident>();

        try {
            statement = connection.createStatement();

            String sql = "select * from service_requests where next_user="+role;


            rs = statement.executeQuery(sql);

            while (rs.next()){
                Incident temp = new Incident();

                temp.setId(rs.getInt("id"));
                temp.setUser_id(rs.getString("user_id"));
                temp.setCreate_time(rs.getString("create_time").substring(0,19));
                temp.setStatus(rs.getString("status"));
                temp.setContent(rs.getString("content"));
                if (rs.getString("update_time") != null){
                    temp.setUpdate_time(rs.getString("update_time").substring(0,19));
                }
                temp.setNext_user(rs.getInt("next_user"));
                temp.setType(rs.getInt("request_type"));

                incidents.add(temp);
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
        return incidents;
    }

    public Incident listIncidentsById(int id){
        Connection connection = DBConnection.getDbCon();

        Statement statement = null;
        ResultSet rs =null;
        Incident result=null;
        try {
            statement = connection.createStatement();

            String sql = "select * from service_requests where id="+id;

            result = new Incident();

            rs = statement.executeQuery(sql);

            while (rs.next()){


                result.setId(rs.getInt("id"));
                result.setUser_id(rs.getString("user_id"));
                result.setCreate_time(rs.getString("create_time").substring(0, 19));
                result.setStatus(rs.getString("status"));
                result.setContent(rs.getString("content"));
                if (rs.getString("update_time") != null){
                    result.setUpdate_time(rs.getString("update_time").substring(0, 19));
                }
                result.setNext_user(rs.getInt("next_user"));
                result.setType(rs.getInt("request_type"));

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
        return result;
    }
    public List<Incident> listIncidents(String user_id){
        Connection connection = DBConnection.getDbCon();

        Statement statement = null;
        ResultSet rs ;
        List<Incident> incidents = new ArrayList<Incident>();

        try {
            statement = connection.createStatement();
            String sql = "select * from service_requests where user_id='"+user_id+"'";

            rs = statement.executeQuery(sql);

            while (rs.next()){
               Incident temp = new Incident();

                temp.setId(rs.getInt("id"));
                temp.setUser_id(rs.getString("user_id"));
                temp.setCreate_time(rs.getString("create_time").substring(0,19));
                temp.setStatus(rs.getString("status"));
                temp.setContent(rs.getString("content"));
                if (rs.getString("update_time") != null){
                    temp.setUpdate_time(rs.getString("update_time").substring(0,19));
                }
                temp.setNext_user(rs.getInt("next_user"));
                temp.setType(rs.getInt("request_type"));

                incidents.add(temp);
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
        return incidents;
    }
}
