package com.example.rest_api_example.controller;

import com.example.rest_api_example.model.Person;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/api")
public class PersonController {

    @GetMapping("/person")
    public Person getPerson() {
        return new Person("John Doe", 30);
    }

    @PostMapping("/person")
    public Person createPerson(@RequestBody Person person) {
        return new Person(person.getName(), person.getAge());
    }
}
