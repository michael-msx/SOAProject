package com.model;

import java.util.Date;

/**
 * Created by michael on 28/09/15.
 */
public class Incident {

    public int id;
    public String user_id;
    public String create_time;
    public String status;
    public int type;
    public String content;
    public String update_time;
    public int next_user;

    public Incident(){}

    public Incident(String user_id, String status, String content, int next_user , int type) {
        this.user_id = user_id;
        this.status = status;
        this.content = content;
        this.next_user = next_user;
        this.type = type;
    }

    public int getType() {
        return type;
    }

    public void setType(int type) {
        this.type = type;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUser_id() {
        return user_id;
    }

    public void setUser_id(String user_id) {
        this.user_id = user_id;
    }

    public String getCreate_time() {
        return create_time;
    }

    public void setCreate_time(String create_time) {
        this.create_time = create_time;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getUpdate_time() {
        return update_time;
    }

    public void setUpdate_time(String update_time) {
        this.update_time = update_time;
    }

    public int getNext_user() {
        return next_user;
    }

    public void setNext_user(int next_user) {
        this.next_user = next_user;
    }
}
