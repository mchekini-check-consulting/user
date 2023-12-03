package com.example.user;


import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class UserController {



    @GetMapping
    public String helloWorld(){
        return "hello world from user";
    }
}
