package com.controller;

import com.db.LoginDBO;
import com.model.Admin;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

/**
 * Created by michael on 15/10/15.
 */

@RestController
public class LoginController {
    @RequestMapping(value = "/admin/stuffLogin" , method = RequestMethod.POST,headers = {"Content-type=application/json"})
    public int addAdmins( @RequestBody Admin admin){
        System.out.println(admin.getUsername());
        System.out.println(admin.getPassword());

        LoginDBO dbo = new LoginDBO();

        int role = dbo.stuffLogin(admin);

        System.out.println(role);

        return role;
    }
}
