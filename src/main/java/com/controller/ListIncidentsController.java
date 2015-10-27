package com.controller;

import com.db.IncidentDBO;
import com.model.Incident;
import com.model.IncidentProcess;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * Created by michael on 29/09/15.
 */

@RestController
public class ListIncidentsController {

    @RequestMapping(value = "/incident/listIncidents", method = RequestMethod.GET)
    public List<Incident> getIncidents(@RequestParam(value = "uid") String uid){
        IncidentDBO dbo = new IncidentDBO();
        List<Incident> incidents = dbo.listIncidents(uid);

        return incidents;
    }

    @RequestMapping(value = "/incident/listIncidentsByRole", method = RequestMethod.GET)
    public List<Incident> getIncidentsByRole(@RequestParam(value = "role") int role){
        IncidentDBO dbo = new IncidentDBO();
        List<Incident> incidents = dbo.listIncidentsByRole(role);
        return incidents;
    }

    @RequestMapping(value = "/incident/listIncidentsById", method = RequestMethod.GET)
    public Incident getIncidentsById(@RequestParam(value = "id") int id){
        IncidentDBO dbo = new IncidentDBO();
        Incident incident = dbo.listIncidentsById(id);
        return incident;
    }

    @RequestMapping(value = "/incident/listIncidentsProgress", method = RequestMethod.GET)
    public List<IncidentProcess>  getIncidentsProgress(@RequestParam(value = "id") int id){
        IncidentDBO dbo = new IncidentDBO();
        List<IncidentProcess>  list = dbo.listIncidentProcess(id) ;
        return list;
    }

}
