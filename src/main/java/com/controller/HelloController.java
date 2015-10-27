package com.controller;

import com.db.DBConnection;
import com.model.Admin;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.concurrent.atomic.AtomicLong;

/**
 * Created by michael on 15/09/15.
 */
@RestController
public class HelloController {
    private static final String template = "Hello, %s!";
    private final AtomicLong counter = new AtomicLong();

    @RequestMapping(value = "greeting",method = RequestMethod.GET)
    public Message greeting(@RequestParam(value="name", defaultValue="World") String name) {
        return new Message(counter.incrementAndGet(),String.format(template,name));
    }

    @RequestMapping(value = "admins" , method = RequestMethod.GET)
    public ArrayList<Admin> getAdmins(){
        //return new DBConnection().queryAdmins();
        return null;
    }


}

