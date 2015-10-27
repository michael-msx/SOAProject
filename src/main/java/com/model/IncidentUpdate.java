package com.model;

/**
 * Created by michael on 6/10/15.
 */
public class IncidentUpdate {

    private int incidentID;
    private int current_role;
    private String content;
    private String status;


    public IncidentUpdate() {
    }

    public IncidentUpdate(int incidentID, int current_role, String content, String status) {
        this.incidentID = incidentID;
        this.current_role = current_role;
        this.content = content;
        this.status = status;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public int getIncidentID() {
        return incidentID;
    }

    public void setIncidentID(int incidentID) {
        this.incidentID = incidentID;
    }

    public int getCurrent_role() {
        return current_role;
    }

    public void setCurrent_role(int current_role) {
        this.current_role = current_role;
    }


    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }
}
