package com.example.demo.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api/v1/user")
public class UserController {

    @GetMapping
    public String getUserId() {
        // 실제 사번을 반환하도록 구현
        return "82263855"; // 예시 사번
    }
}
