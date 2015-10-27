package com.controller;

/**
 * Created by michael on 15/09/15.
 */
public class Message {
    private final long  id;
    private final String message;

    public Message(long id, String message) {
        this.id = id;
        this.message = message;
    }

    public long getId() {
        return id;
    }

    public String getMessage() {
        return message;
    }
}
