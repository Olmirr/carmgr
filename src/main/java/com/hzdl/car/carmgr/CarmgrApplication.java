package com.hzdl.car.carmgr;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@SpringBootApplication
@RestController
public class CarmgrApplication {
    public static void main(String[] args) {
        SpringApplication.run(CarmgrApplication.class, args);
    }
    @GetMapping("/ha")
    public String haha(){
        return "hello world!";
    }
}
