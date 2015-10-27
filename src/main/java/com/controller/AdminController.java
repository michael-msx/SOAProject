package com.controller;

import com.db.LoginDBO;
import com.model.Admin;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Created by michael on 15/10/15.
 */

@Controller
public class AdminController {

    @RequestMapping(value = "/admin", method = RequestMethod.GET)
    public String Index(){
        return "admins";
    }

    @RequestMapping(value = "/admin/incidents", method = RequestMethod.GET)
    public String list(){
        return "adminIncidentList";
    }

    @RequestMapping(value = "/admin/process", method = RequestMethod.GET)
    public String process(){
        return "processIncident";
    }

    @RequestMapping(value = "/admin/login", method = RequestMethod.GET)
    public String getIndex(){
        return "adminLogin";
    }



}
