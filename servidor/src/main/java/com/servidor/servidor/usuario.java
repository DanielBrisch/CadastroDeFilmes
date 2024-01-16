package com.servidor.servidor;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api")
public class usuario {

    @GetMapping("/hello")
    public String sayHello() {
        return "Hello, world!";
    }
}