package com.example.sampleservicebindingpostgresql;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/rest/v1")
public class Example {

//    @Autowired
//    BookRepository bookRepo;

  @RequestMapping("/books")
  public String example() {
    System.out.println(System.getProperty("spring.datasource.password"));
    return "test";
  }
}
