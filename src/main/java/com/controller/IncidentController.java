package com.controller;

import com.db.IncidentDBO;
import com.model.Incident;
import com.model.IncidentUpdate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.List;

/**
 * Created by michael on 28/09/15.
 */
@Controller
public class IncidentController {

    @RequestMapping(value = "/incident", method = RequestMethod.GET)
    public String Index(){
        return "incidents";
    }

    @RequestMapping(value = "/incident/create", method = RequestMethod.GET)
    public String getIndex(){
        return "createIncident";
    }

    @RequestMapping(value = "/incident/list", method = RequestMethod.GET)
    public String getListIndex(){
        return "listIncidents";
    }



    @RequestMapping(value = "/incident/addIncident" , method = RequestMethod.POST,headers = {"Content-type=application/json"})
    public void create_Incident(@RequestBody Incident incident){
        System.out.println(incident.getContent());
        System.out.println(incident.getType());

        IncidentDBO incidentDBO  = new IncidentDBO();
        incidentDBO.createNewIncident(incident);

    }

    @RequestMapping(value = "/incident/updateIncident", method = RequestMethod.POST,headers = {"Content-type=application/json"})
    public void update_Incident(@RequestBody IncidentUpdate update){
        IncidentDBO dbo = new IncidentDBO();
        int next_role;

        if ((update.getStatus().equals("P"))){
            next_role = 2;
        }else{
            next_role = 0;
        }

        dbo.insertIncidentProcess(update.getIncidentID(),update.getStatus(),update.getContent(),update.getCurrent_role());
        dbo.updateIncidentStatus(update.getStatus(),next_role,update.getIncidentID());
    }
}
